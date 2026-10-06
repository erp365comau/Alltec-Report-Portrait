report 70212 "ADES_Prod. Sls. By Cust. Inv.2"
{
    // Austral Sugeevan 20/01/2021 >>> Designed Report
    CaptionML = ENU = 'Product Sales By Customer Invoice for Sales', ENA = 'Product Sales By Customer Invoice for Sales';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70212.ADES_ProductSalesByCustomerInvoiceForSales.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Permissions = tabledata Customer=r;

    dataset
    {
        dataitem(CustomerFilter; Customer)
        {
            DataItemTableView = sorting("No.");

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = WHERE(Type=CONST(Item));
                DataItemLink = "Sell-to Customer No."=field("No.");
                RequestFilterFields = "No.", "Sell-to Customer No.", "Document No.", "Posting Date";

                column(No_SalesInvoiceLine__; "No.")
                {
                }
                column(SellToCustomerNo_SalesInvoiceLine__; SalesInvoiceHeader."Sell-to Customer No.")
                {
                }
                column(SellToCustomerName_SalesInvoiceLine__; SalesInvoiceHeader."Sell-to Customer Name")
                {
                }
                column(DocumentNo_SalesInvoiceLine__; "Document No.")
                {
                }
                column(PostingDate_SalesInvoiceLine__; "Posting Date")
                {
                }
                column(Description_SalesInvoiceLine__; Description)
                {
                }
                column(Name_SalesPerson__; SalesPerson.Name)
                {
                }
                column(UnitPrice_SalesInvoiceLine__; "Unit Price")
                {
                }
                column(Quantity_SalesInvoiceLine__; Quantity)
                {
                }
                column(ShipmentDate_SalesInvoiceLine__; "Shipment Date")
                {
                }
                column(CompanyName__; COMPANYNAME)
                {
                }
                column(Filters__; GETFILTERS)
                {
                }
                column(LineNo_SalesInvoiceLine__; "Line No.")
                {
                }
                column(CostAmount__; CostAmount)
                {
                }
                column(SalesRevenue__; SalesRevenue)
                {
                }
                column(GPAmount__; GPAmount)
                {
                }
                column(ItemCategoryCode_SalesInvoiceLine__; "Item Category Code")
                {
                }
                column(ENIndustryCode_InvCustomer__; Customer."EN Industry Code")
                {
                }
                trigger OnAfterGetRecord();
                var
                    ValueEntry: Record 5802;
                    SalesInvoiceLine: Record 113;
                begin
                    IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Sell-to Customer No.", "Document No.")THEN BEGIN
                        TempInvtBuffer.INIT;
                        TempInvtBuffer."Item No.":="No.";
                        TempInvtBuffer."Lot No.":="Sell-to Customer No.";
                        TempInvtBuffer."Serial No.":="Document No.";
                        TempInvtBuffer.INSERT;
                    END
                    ELSE
                        CurrReport.SKIP;
                    CLEAR(SalesInvoiceHeader);
                    CLEAR(SalesPerson);
                    //Clear(Customer);
                    IF SalesInvoiceHeader.GET("Document No.")THEN begin
                        IF SalesPerson.GET(SalesInvoiceHeader."Salesperson Code")THEN;
                        IF Customer.GET(SalesInvoiceHeader."Sell-to Customer No.")THEN;
                    END;
                    CLEAR(SalesRevenue);
                    CLEAR(CostAmount);
                    ValueEntry.SETCURRENTKEY("Item No.", "Posting Date");
                    ValueEntry.SETRANGE("Document No.", "Document No.");
                    ValueEntry.SETRANGE("Item No.", "No.");
                    ValueEntry.SETRANGE("Posting Date", "Posting Date");
                    IF ValueEntry.FINDSET THEN REPEAT SalesRevenue+=ValueEntry."Sales Amount (Actual)";
                            CostAmount+=-ValueEntry."Cost Amount (Actual)";
                        UNTIL ValueEntry.NEXT = 0;
                    GPAmount:=SalesRevenue - CostAmount;
                    SalesRevenueTotal+=SalesRevenue;
                    CostAmountTotal+=CostAmount;
                    GPAmountTotal+=GPAmount;
                end;
                trigger OnPreDataItem()
                begin
                // if UserSetup.Get(UserId) then begin
                //     if UserSetup."EN Salesperson Code" <> '' then
                //         SetRange("ADES_Salesperson Code", UserSetup."EN Salesperson Code");
                //     if UserSetup."ADES_Location Code" <> '' then
                //         SetRange("Location Code", UserSetup."ADES_Location Code");
                // end;
                end;
            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemTableView = WHERE(Type=CONST(Item));
                DataItemLink = "Sell-to Customer No."=field("No.");
                RequestFilterFields = "No.", "Sell-to Customer No.", "Document No.", "Posting Date";

                column(No_SalesCrMemoLine__; "No.")
                {
                }
                column(SellToCustomerNo_SalesCrMemoLine__; SalesCrMemoHeader."Sell-to Customer No.")
                {
                }
                column(SellToCustomerName_SalesCrMemoLine__; SalesCrMemoHeader."Sell-to Customer Name")
                {
                }
                column(DocumentNo_SalesCrMemoLine__; "Document No.")
                {
                }
                column(PostingDate_SalesCrMemoLine__; "Posting Date")
                {
                }
                column(Description_SalesCrMemoLine__; Description)
                {
                }
                column(Name_CreditSalesPerson__; SalesPerson.Name)
                {
                }
                column(UnitPrice_SalesCrMemoLine__; "Unit Price")
                {
                }
                column(Quantity_SalesCrMemoLine__; Quantity)
                {
                }
                column(ShipmentDate_SalesCrMemoLine__; "Shipment Date")
                {
                }
                column(LineNo_SalesCrMemoLine__; "Line No.")
                {
                }
                column(CreditCostAmount__; CreditCostAmount)
                {
                }
                column(CreditSalesRevenue__; CreditSalesRevenue)
                {
                }
                column(CreditGPAmount__; CreditGPAmount)
                {
                }
                column(ItemCategoryCode_SalesCreditLine__; "Item Category Code")
                {
                }
                column(ENIndustryCode_CrCustomer__; Customer."EN Industry Code")
                {
                }
                trigger OnAfterGetRecord();
                var
                    ValueEntry: Record 5802;
                begin
                    IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Sell-to Customer No.", "Document No.")THEN BEGIN
                        TempInvtBuffer.INIT;
                        TempInvtBuffer."Item No.":="No.";
                        TempInvtBuffer."Lot No.":="Sell-to Customer No.";
                        TempInvtBuffer."Serial No.":="Document No.";
                        TempInvtBuffer.INSERT;
                    END
                    ELSE
                        CurrReport.SKIP;
                    CLEAR(SalesCrMemoHeader);
                    CLEAR(SalesPerson);
                    //CLEAR(Customer);
                    IF SalesCrMemoHeader.GET("Document No.")THEN begin
                        IF SalesPerson.GET(SalesCrMemoHeader."Salesperson Code")THEN;
                        IF Customer.GET(SalesCrMemoHeader."Sell-to Customer No.")THEN;
                    END;
                    CLEAR(CreditSalesRevenue);
                    CLEAR(CreditCostAmount);
                    ValueEntry.SETCURRENTKEY("Item No.", "Posting Date");
                    ValueEntry.SETRANGE("Document No.", "Document No.");
                    ValueEntry.SETRANGE("Item No.", "No.");
                    ValueEntry.SETRANGE("Posting Date", "Posting Date");
                    IF ValueEntry.FINDSET THEN REPEAT CreditSalesRevenue+=ValueEntry."Sales Amount (Actual)";
                            CreditCostAmount+=-ValueEntry."Cost Amount (Actual)";
                        UNTIL ValueEntry.NEXT = 0;
                    CreditGPAmount:=CreditSalesRevenue - CreditCostAmount;
                    SalesRevenueTotal+=CreditSalesRevenue;
                    CostAmountTotal+=CreditCostAmount;
                    GPAmountTotal+=CreditGPAmount;
                end;
                trigger OnPreDataItem()
                begin
                    TempInvtBuffer.Reset;
                    TempInvtBuffer.DeleteAll;
                /* if "Sales Invoice Line".GetFilter("No.") <> '' then
                        SetRange("No.", "Sales Invoice Line".GetFilter("No."));

                    if "Sales Invoice Line".GetFilter("Sell-to Customer No.") <> '' then
                        SetRange("Sell-to Customer No.", "Sales Invoice Line".GetFilter("Sell-to Customer No."));

                    if "Sales Invoice Line".GetFilter("ADES_Salesperson Code") <> '' then
                        SetRange("ADES_Salesperson Code", "Sales Invoice Line".GetFilter("ADES_Salesperson Code"));

                    if "Sales Invoice Line".GetFilter("Posting Date") <> '' then
                        SetFilter("Posting Date", "Sales Invoice Line".GetFilter("Posting Date")); */
                // if UserSetup.Get(UserId) then begin
                //     if UserSetup."EN Salesperson Code" <> '' then
                //         SetRange("ADES_Salesperson Code", UserSetup."EN Salesperson Code");
                //     if UserSetup."ADES_Location Code" <> '' then
                //         SetRange("Location Code", UserSetup."ADES_Location Code");
                // end;
                end;
            }
            dataitem(Total; Integer)
            {
                DataItemTableView = sorting(Number)WHERE(Number=CONST(1));

                column(SalesRevenueTotal__; SalesRevenueTotal)
                {
                }
                column(CostAmountTotal__; CostAmountTotal)
                {
                }
                column(GPAmountTotal__; GPAmountTotal)
                {
                }
            }
            trigger OnPreDataItem()
            begin
                if UserSetup.Get(UserId)then begin
                    if UserSetup."EN Salesperson Code" <> '' then SetFilter("Salesperson Code", UserSetup."EN Salesperson Code");
                    if UserSetup."ADES_Location Code" <> '' then SetFilter("Location Code", UserSetup."ADES_Location Code");
                    if UserSetup."EN County" <> '' then SetFilter(County, UserSetup."EN County");
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        if("Sales Invoice Line".GetFilter("Posting Date") = '') OR ("Sales Cr.Memo Line".GetFilter("Posting Date") = '')then if not Confirm('No filters applied for date. Do you want to proceed?')then CurrReport.Quit;
    end;
    var SalesInvoiceHeader: Record 112;
    SalesPerson: Record 13;
    CostAmount: Decimal;
    SalesRevenue: Decimal;
    GPAmount: Decimal;
    SalesRevenueTotal: Decimal;
    CostAmountTotal: Decimal;
    GPAmountTotal: Decimal;
    TempInvtBuffer: Record 307 temporary;
    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    CreditSalesRevenue: Decimal;
    CreditCostAmount: Decimal;
    CreditGPAmount: Decimal;
    Customer: Record Customer;
    UserSetup: Record "User Setup";
}
