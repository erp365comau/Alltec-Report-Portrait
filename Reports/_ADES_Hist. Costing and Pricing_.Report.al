report 70219 "ADES_Hist. Costing and Pricing"
{
    // version J16583
    // J16583 20211021 LK - CREATE REPORT
    // J16583 20211026 LK - CHANGE TO DATE RANGE AND ITEM COST AND PRICE
    CaptionML = ENU = 'Historical Costing and Pricing', ENA = 'Historical Costing and Pricing';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70219.ADES_HistoricalCostingAndPricing.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Inventory Posting Group";

            column(No_Item; Item."No.")
            {
            }
            column(Description_Item; Item.Description)
            {
            }
            column(BaseUnitofMeasure_Item; Item."Base Unit of Measure")
            {
            }
            column(HistoricalDate; HistoricalDate)
            {
            }
            column(HistoricalDateEnd; HistoricalDateEnd)
            {
            }
            column(AvgUnitCost; AvgUnitCost)
            {
            }
            column(AvgUnitPrice; AvgUnitPrice)
            {
            }
            column(GrossProfit; GrossProfit)
            {
            }
            column(GrossProfitPersentage; GrossProfitPersentage)
            {
            }
            column(AvgUnitCostCD; AvgUnitCostCD)
            {
            }
            column(AvgUnitPriceCD; AvgUnitPriceCD)
            {
            }
            column(GrossProfitCD; GrossProfitCD)
            {
            }
            column(GrossProfitPersentageCD; GrossProfitPersentageCD)
            {
            }
            trigger OnAfterGetRecord();
            begin
                AvgUnitCost:=0;
                AvgUnitCostCD:=0;
                AvgUnitPrice:=0;
                AvgUnitPriceCD:=0;
                GrossProfit:=0;
                GrossProfitCD:=0;
                GrossProfitPersentage:=0;
                GrossProfitPersentageCD:=0;
                TotalUnitCost:=0;
                TotalUnitPrice:=0;
                TotalQuantity:=0;
                //---------------HISTORY DATE------------------------------>>>
                ValueEntry.RESET;
                ValueEntry.SETRANGE("Item No.", Item."No.");
                ValueEntry.SETRANGE("Posting Date", HistoricalDate, HistoricalDateEnd);
                ValueEntry.SETRANGE("Item Ledger Entry Type", ValueEntry."Item Ledger Entry Type"::Sale);
                ValueEntry.SETRANGE("Document Type", ValueEntry."Document Type"::"Sales Invoice");
                ValueEntry.SETRANGE("Source Type", ValueEntry."Source Type"::Customer);
                IF CustPriceGroup <> '' THEN ValueEntry.SETRANGE("ADES_Customer Price Group", CustPriceGroup);
                IF ValueEntry.FINDSET THEN REPEAT TotalUnitCost:=TotalUnitCost + (ValueEntry."Cost Amount (Actual)" * -1);
                        TotalUnitPrice:=TotalUnitPrice + ValueEntry."Sales Amount (Actual)";
                        TotalQuantity:=TotalQuantity + (ValueEntry."Invoiced Quantity" * -1);
                    UNTIL ValueEntry.NEXT = 0;
                IF TotalQuantity <> 0 THEN BEGIN
                    AvgUnitCost:=TotalUnitCost / TotalQuantity;
                    AvgUnitPrice:=TotalUnitPrice / TotalQuantity;
                    GrossProfit:=AvgUnitPrice - AvgUnitCost;
                    if AvgUnitPrice <> 0 then GrossProfitPersentage:=GrossProfit / AvgUnitPrice * 100;
                END;
                //---------------HISTORY DATE------------------------------<<<
                //---------------CURRENT DATE------------------------------>>>
                TotalUnitCost:=0;
                TotalUnitPrice:=0;
                TotalQuantity:=0;
                /*
                ValueEntry.SETRANGE("Posting Date", TODAY);
                IF ValueEntry.FINDSET THEN
                REPEAT
                  TotalUnitCost := TotalUnitCost + (ValueEntry."Cost Amount (Actual)" * -1);
                  TotalUnitPrice := TotalUnitPrice + ValueEntry."Sales Amount (Actual)";
                  TotalQuantity := TotalQuantity + (ValueEntry."Invoiced Quantity" * -1);
                UNTIL ValueEntry.NEXT = 0;
                
                IF TotalQuantity <> 0 THEN
                BEGIN
                  AvgUnitCostCD := TotalUnitCost/ TotalQuantity;
                  AvgUnitPriceCD := TotalUnitPrice/ TotalQuantity;
                  GrossProfitCD := AvgUnitPriceCD - AvgUnitCostCD;
                  GrossProfitPersentageCD := GrossProfitCD/ AvgUnitPriceCD *100;
                END;
                */
                AvgUnitCostCD:=Item."Last Direct Cost";
                AvgUnitPriceCD:=Item."Unit Price";
                GrossProfitCD:=AvgUnitPriceCD - AvgUnitCostCD;
                IF AvgUnitPriceCD <> 0 THEN GrossProfitPersentageCD:=GrossProfitCD / AvgUnitPriceCD * 100;
            //---------------CURRENT DATE------------------------------<<<
            end;
            trigger OnPreDataItem();
            begin
                IF(HistoricalDate = 0D) OR (HistoricalDateEnd = 0D)THEN ERROR('Historical date range cannot be blank.');
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(HistoricalDate; HistoricalDate)
                    {
                        Caption = 'Historical Date - From';
                        ApplicationArea = All;
                    }
                    field(HistoricalDateEnd; HistoricalDateEnd)
                    {
                        Caption = 'Historical Date - To';
                        ApplicationArea = All;
                    }
                    field(CustPriceGroup; CustPriceGroup)
                    {
                        Caption = 'Cust. Price Group';
                        TableRelation = "Customer Price Group".Code;
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    var HistoricalDate: Date;
    ValueEntry: Record "Value Entry";
    AvgUnitCost: Decimal;
    AvgUnitPrice: Decimal;
    GrossProfit: Decimal;
    GrossProfitPersentage: Decimal;
    AvgUnitCostCD: Decimal;
    AvgUnitPriceCD: Decimal;
    GrossProfitCD: Decimal;
    GrossProfitPersentageCD: Decimal;
    TotalUnitCost: Decimal;
    TotalUnitPrice: Decimal;
    NoOfEntries: Integer;
    CustPriceGroup: Code[10];
    TotalQuantity: Decimal;
    HistoricalDateEnd: Date;
}
