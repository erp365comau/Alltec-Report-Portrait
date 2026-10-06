report 70200 "ADES_Prod. Sales By Cust. Inv."
{
    // Austral Sugeevan 20/01/2021 >>> Designed Report
    CaptionML = ENU = 'Product Sales By Customer Invoice', ENA = 'Product Sales By Customer Invoice';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70200.ADES_ProductSalesByCustomerInvoice.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = WHERE(Type=CONST(Item));
            RequestFilterFields = "No.", "Sell-to Customer No.", "Document No.", "ADES_Salesperson Code", "Posting Date", "Location Code", "ADES_External Document No.";

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
            column(Description_SalesInvoiceLine__; "ADES_Item Description")
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
            column(SILLocationRec; LocationRec.Name) //LG
            {
            }
            trigger OnAfterGetRecord();
            var
                ValueEntry: Record 5802;
                SalesInvoiceLine: Record 113;
                ValueEntry2: Record 5802;
                SIH: Record "Sales Invoice Header";
                CusPoGroup: Code[20];
            begin
                SIH.GET("Document No.");
                IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Sell-to Customer No.", "Document No.")THEN BEGIN
                    TempInvtBuffer.INIT;
                    TempInvtBuffer."Item No.":="No.";
                    TempInvtBuffer."Lot No.":="Sell-to Customer No.";
                    TempInvtBuffer."Serial No.":="Document No.";
                    TempInvtBuffer.INSERT;
                END
                ELSE
                    CurrReport.SKIP;
                CalcFields("ADES_Item Description");
                CLEAR(SalesInvoiceHeader);
                CLEAR(SalesPerson);
                Clear(Customer);
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
                Clear(CusPoGroup);
                if Customer."Customer Posting Group" = 'INTERCOMPANY' then begin
                    CusPoGroup:='Polyseal';
                    IF NOT SP.GET(CusPoGroup, '')THEN BEGIN
                        SP.INIT;
                        SP."Account No. 1":=CusPoGroup;
                        SP."Account No. 2":='';
                        sp."Amount 1":=SalesRevenue;
                        sp."Amount 2":=GPAmount;
                        SP.INSERT;
                    END
                    ELSE
                    begin
                        sp."Amount 1"+=SalesRevenue;
                        sp."Amount 2"+=GPAmount;
                        sp.Modify();
                    end;
                end
                else
                begin
                    CusPoGroup:='Third Party';
                    IF NOT SP.GET(CusPoGroup, "Location Code")THEN BEGIN
                        SP.INIT;
                        SP."Account No. 1":=CusPoGroup;
                        SP."Account No. 2":="Location Code";
                        sp."Amount 1":=SalesRevenue;
                        sp."Amount 2":=GPAmount;
                        SP.INSERT;
                    END
                    ELSE
                    begin
                        sp."Amount 1"+=SalesRevenue;
                        sp."Amount 2"+=GPAmount;
                        sp.Modify();
                    end;
                end;
                IF NOT CommonSP.GET(sp."Account No. 1", SP."Account No. 2")THEN BEGIN
                    CommonSP.INIT;
                    CommonSP."Account No. 1":=sp."Account No. 1";
                    CommonSP."Account No. 2":=SP."Account No. 2";
                    CommonSP."Amount 1":=SalesRevenue;
                    CommonSP."Amount 2":=GPAmount;
                    CommonSP.INSERT;
                END
                ELSE
                begin
                    CommonSP."Amount 1"+=SalesRevenue;
                    CommonSP."Amount 2"+=GPAmount;
                    CommonSP.Modify();
                end;
                CurrentYear:=Date2DMY("Posting Date", 3);
            end;
        }
        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            DataItemTableView = WHERE(Type=CONST(Item));
            RequestFilterFields = "No.", "Sell-to Customer No.", "Document No.", "ADES_Salesperson Code", "Posting Date", "Location Code", "ADES_External Document No.";

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
            column(Description_SalesCrMemoLine__; "ADES_Item Description")
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
            column(SCMLocationRec; LocationRec.Name) //LG
            {
            }
            trigger OnAfterGetRecord();
            var
                ValueEntry: Record 5802;
                ValueEntry2: Record 5802;
                SCM: Record "Sales Cr.Memo Header";
                CusPoGroup: Code[20];
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
                CalcFields("ADES_Item Description");
                CLEAR(SalesCrMemoHeader);
                CLEAR(SalesPerson);
                CLEAR(Customer);
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
                Clear(CusPoGroup);
                SCM.get("Sales Cr.Memo Line"."Document No.");
                if Customer."Customer Posting Group" = 'INTERCOMPANY' then begin
                    CusPoGroup:='Polyseal';
                    IF NOT SP.GET(CusPoGroup, '')THEN BEGIN
                        SP.INIT;
                        SP."Account No. 1":=CusPoGroup;
                        SP."Account No. 2":='';
                        sp."Amount 1":=CreditSalesRevenue;
                        sp."Amount 2":=(CreditSalesRevenue - CreditCostAmount);
                        SP.INSERT;
                    END
                    ELSE
                    begin
                        sp."Amount 1"+=CreditSalesRevenue;
                        sp."Amount 2"+=(CreditSalesRevenue - CreditCostAmount);
                        sp.Modify();
                    end;
                end
                else
                begin
                    CusPoGroup:='Third Party';
                    IF NOT SP.GET(CusPoGroup, "Location Code")THEN BEGIN
                        SP.INIT;
                        SP."Account No. 1":=CusPoGroup;
                        SP."Account No. 2":="Location Code";
                        sp."Amount 1":=CreditSalesRevenue;
                        sp."Amount 2":=(CreditSalesRevenue - CreditCostAmount);
                        SP.INSERT;
                    END
                    ELSE
                    begin
                        sp."Amount 1"+=CreditSalesRevenue;
                        sp."Amount 2"+=(CreditSalesRevenue - CreditCostAmount);
                        sp.Modify();
                    end;
                end;
                IF NOT CommonSP.GET(sp."Account No. 1", SP."Account No. 2")THEN BEGIN
                    CommonSP.INIT;
                    CommonSP."Account No. 1":=sp."Account No. 1";
                    CommonSP."Account No. 2":=SP."Account No. 2";
                    CommonSP."Amount 1":=CreditSalesRevenue;
                    CommonSP."Amount 2":=(CreditSalesRevenue - CreditCostAmount);
                    CommonSP.INSERT;
                END
                ELSE
                begin
                    CommonSP."Amount 1"+=CreditSalesRevenue;
                    CommonSP."Amount 2"+=(CreditSalesRevenue - CreditCostAmount);
                    CommonSP.Modify();
                end;
                CurrentYear:=Date2DMY("Posting Date", 3);
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
            end;
        }
        dataitem("Prev Sales Invoice Line"; "Sales Invoice Line")
        {
            //DataItemTableView = WHERE(Type = CONST(Item));
            DataItemTableView = SORTING("Document No.", "Line No.");

            trigger OnAfterGetRecord();
            var
                ValueEntry: Record 5802;
                SalesInvoiceLine: Record 113;
                ValueEntry2: Record 5802;
                SIH: Record "Sales Invoice Header";
                //Cus: Record Customer;
                CusPoGroup: Code[20];
            begin
                SIH.GET("Document No.");
                IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Sell-to Customer No.", "Document No.")THEN BEGIN
                    TempInvtBuffer.INIT;
                    TempInvtBuffer."Item No.":="No.";
                    TempInvtBuffer."Lot No.":="Sell-to Customer No.";
                    TempInvtBuffer."Serial No.":="Document No.";
                    TempInvtBuffer.INSERT;
                END
                ELSE
                    CurrReport.SKIP;
                //CalcFields("ADES_Item Description");
                CLEAR(SalesInvoiceHeader);
                CLEAR(SalesPerson);
                Clear(Customer);
                IF SalesInvoiceHeader.GET("Document No.")THEN begin
                    IF SalesPerson.GET(SalesInvoiceHeader."Salesperson Code")THEN;
                    IF Customer.GET(SalesInvoiceHeader."Sell-to Customer No.")THEN;
                END;
                CLEAR(PrevSPSalesRevenue);
                CLEAR(PrevSPCostAmount);
                ValueEntry.SETCURRENTKEY("Item No.", "Posting Date");
                ValueEntry.SETRANGE("Document No.", "Document No.");
                ValueEntry.SETRANGE("Item No.", "No.");
                ValueEntry.SETRANGE("Posting Date", "Posting Date");
                IF ValueEntry.FINDSET THEN REPEAT PrevSPSalesRevenue+=ValueEntry."Sales Amount (Actual)";
                        PrevSPCostAmount+=-ValueEntry."Cost Amount (Actual)";
                    UNTIL ValueEntry.NEXT = 0;
                PrevSPGPAmount:=PrevSPSalesRevenue - PrevSPCostAmount;
                PrevSPSalesRevenueTotal+=PrevSPSalesRevenue;
                PrevSPCostAmountTotal+=PrevSPCostAmount;
                PrevSPGPAmountTotal+=PrevSPGPAmount;
                Clear(CusPoGroup);
                if Customer."Customer Posting Group" = 'INTERCOMPANY' then begin
                    CusPoGroup:='Polyseal';
                    IF NOT PrevSP.GET(CusPoGroup, '')THEN BEGIN
                        PrevSP.INIT;
                        PrevSP."Account No. 1":=CusPoGroup;
                        PrevSP."Account No. 2":='';
                        PrevSP."Amount 1":=PrevSPSalesRevenue;
                        PrevSP."Amount 2":=PrevSPGPAmount;
                        PrevSP.INSERT;
                    END
                    ELSE
                    begin
                        PrevSP."Amount 1"+=PrevSPSalesRevenue;
                        PrevSP."Amount 2"+=PrevSPGPAmount;
                        PrevSP.Modify();
                    end;
                end
                else
                begin
                    CusPoGroup:='Third Party';
                    IF NOT PrevSP.GET(CusPoGroup, "Location Code")THEN BEGIN
                        PrevSP.INIT;
                        PrevSP."Account No. 1":=CusPoGroup;
                        PrevSP."Account No. 2":="Location Code";
                        PrevSP."Amount 1":=PrevSPSalesRevenue;
                        PrevSP."Amount 2":=PrevSPGPAmount;
                        PrevSP.INSERT;
                    END
                    ELSE
                    begin
                        PrevSP."Amount 1"+=PrevSPSalesRevenue;
                        PrevSP."Amount 2"+=PrevSPGPAmount;
                        PrevSP.Modify();
                    end;
                end;
                IF NOT CommonSP.GET(PrevSP."Account No. 1", PrevSP."Account No. 2")THEN BEGIN
                    CommonSP.INIT;
                    CommonSP."Account No. 1":=PrevSP."Account No. 1";
                    CommonSP."Account No. 2":=PrevSP."Account No. 2";
                    CommonSP."Amount 1":=PrevSPSalesRevenue * -1;
                    CommonSP."Amount 2":=PrevSPGPAmount * -1;
                    CommonSP."Amount 3":=PrevSP."Amount 1";
                    CommonSP."Amount 4":=PrevSP."Amount 2";
                    CommonSP.INSERT;
                END
                ELSE
                begin
                    CommonSP."Amount 1"-=PrevSPSalesRevenue;
                    CommonSP."Amount 2"-=PrevSPGPAmount;
                    CommonSP."Amount 3":=PrevSP."Amount 1";
                    CommonSP."Amount 4":=PrevSP."Amount 2";
                    CommonSP.Modify();
                end;
                PreviousYear:=Date2DMY("Posting Date", 3);
            end;
            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", CalcDate('<-1Y>', FromDate), CalcDate('<-1Y>', ToDate));
            end;
        }
        dataitem("Prev Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.");

            trigger OnAfterGetRecord();
            var
                ValueEntry: Record 5802;
                ValueEntry2: Record 5802;
                SCM: Record "Sales Cr.Memo Header";
                CusPoGroup: Code[20];
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
                CalcFields("ADES_Item Description");
                CLEAR(SalesCrMemoHeader);
                CLEAR(SalesPerson);
                CLEAR(Customer);
                IF SalesCrMemoHeader.GET("Document No.")THEN begin
                    IF SalesPerson.GET(SalesCrMemoHeader."Salesperson Code")THEN;
                    IF Customer.GET(SalesCrMemoHeader."Sell-to Customer No.")THEN;
                END;
                CLEAR(PrevSPCreditSalesRevenue);
                CLEAR(PrevSPCreditCostAmount);
                ValueEntry.SETCURRENTKEY("Item No.", "Posting Date");
                ValueEntry.SETRANGE("Document No.", "Document No.");
                ValueEntry.SETRANGE("Item No.", "No.");
                ValueEntry.SETRANGE("Posting Date", "Posting Date");
                IF ValueEntry.FINDSET THEN REPEAT PrevSPCreditSalesRevenue+=ValueEntry."Sales Amount (Actual)";
                        PrevSPCreditCostAmount+=-ValueEntry."Cost Amount (Actual)";
                    UNTIL ValueEntry.NEXT = 0;
                PrevSPCreditGPAmount:=PrevSPCreditSalesRevenue - PrevSPCreditCostAmount;
                PrevSPSalesRevenueTotal+=PrevSPCreditSalesRevenue;
                PrevSPCostAmountTotal+=PrevSPCreditCostAmount;
                PrevSPGPAmountTotal+=PrevSPCreditGPAmount;
                Clear(CusPoGroup);
                SCM.get("Sales Cr.Memo Line"."Document No.");
                if Customer."Customer Posting Group" = 'INTERCOMPANY' then begin
                    CusPoGroup:='Polyseal';
                    IF NOT PrevSP.GET(CusPoGroup, '')THEN BEGIN
                        PrevSP.INIT;
                        PrevSP."Account No. 1":=CusPoGroup;
                        PrevSP."Account No. 2":='';
                        PrevSP."Amount 1":=PrevSPCreditSalesRevenue;
                        PrevSP."Amount 2":=PrevSPCreditGPAmount;
                        PrevSP.INSERT;
                    END
                    ELSE
                    begin
                        PrevSP."Amount 1"+=PrevSPCreditSalesRevenue;
                        PrevSP."Amount 2"+=PrevSPCreditGPAmount;
                        PrevSP.Modify();
                    end;
                end
                else
                begin
                    CusPoGroup:='Third Party';
                    IF NOT PrevSP.GET(CusPoGroup, "Location Code")THEN BEGIN
                        PrevSP.INIT;
                        PrevSP."Account No. 1":=CusPoGroup;
                        PrevSP."Account No. 2":="Location Code";
                        PrevSP."Amount 1":=PrevSPCreditSalesRevenue;
                        PrevSP."Amount 2":=PrevSPCreditGPAmount;
                        PrevSP.INSERT;
                    END
                    ELSE
                    begin
                        PrevSP."Amount 1"+=PrevSPCreditSalesRevenue;
                        PrevSP."Amount 2"+=PrevSPCreditGPAmount;
                        PrevSP.Modify();
                    end;
                end;
                IF NOT CommonSP.GET(PrevSP."Account No. 1", PrevSP."Account No. 2")THEN BEGIN
                    CommonSP.INIT;
                    CommonSP."Account No. 1":=PrevSP."Account No. 1";
                    CommonSP."Account No. 2":=PrevSP."Account No. 2";
                    CommonSP."Amount 1":=PrevSPCreditSalesRevenue * -1;
                    CommonSP."Amount 2":=PrevSPCreditGPAmount * -1;
                    if PrevSP."Amount 1" <> 0 then CommonSP."Amount 3":=PrevSP."Amount 1"
                    else
                        exit;
                    if PrevSP."Amount 2" <> 0 then CommonSP."Amount 4":=PrevSP."Amount 2"
                    else
                        exit;
                    CommonSP.INSERT;
                END
                ELSE
                begin
                    CommonSP."Amount 1"-=PrevSPCreditSalesRevenue;
                    CommonSP."Amount 2"-=PrevSPCreditGPAmount;
                    if PrevSP."Amount 1" <> 0 then CommonSP."Amount 3":=PrevSP."Amount 1"
                    else
                        exit;
                    if PrevSP."Amount 2" <> 0 then CommonSP."Amount 4":=PrevSP."Amount 2"
                    else
                        exit;
                    CommonSP.Modify();
                end;
                PreviousYear:=Date2DMY("Posting Date", 3);
            end;
            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", CalcDate('<-1Y>', FromDate), CalcDate('<-1Y>', ToDate));
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
            end;
        }
        dataitem(CusProGroup; "Integer")
        {
            DataItemTableView = sorting(Number);

            column(Number; Number)
            {
            }
            column(CustPostGrp; sp."Account No. 1")
            {
            }
            column(LocationCode; sp."Account No. 2")
            {
            }
            column(spAmount1; sp."Amount 1")
            {
            }
            column(spAmount2; sp."Amount 2")
            {
            }
            trigger OnAfterGetRecord()
            begin
                if Number = 1 then sp.Find('-')
                else
                    sp.Next();
            end;
            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, sp.Count);
            end;
        }
        dataitem(PrevCusProGroup; "Integer")
        {
            DataItemTableView = sorting(Number);

            column(PrevNumber; Number)
            {
            }
            column(PrevCustPostGrp; Prevsp."Account No. 1")
            {
            }
            column(PrevLocationCode; Prevsp."Account No. 2")
            {
            }
            column(PrevspAmount1; Prevsp."Amount 1")
            {
            }
            column(PrevspAmount2; Prevsp."Amount 2")
            {
            }
            trigger OnAfterGetRecord()
            begin
                if Number = 1 then Prevsp.Find('-')
                else
                    Prevsp.Next();
            end;
            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, Prevsp.Count);
            end;
        }
        dataitem(CommonSPLoop; "Integer")
        {
            DataItemTableView = sorting(Number);

            column(CommonSPNumber; Number)
            {
            }
            column(CommonSPCustPostGrp; CommonSP."Account No. 1")
            {
            }
            column(CommonSPLocationCode; CommonSP."Account No. 2")
            {
            }
            column(CommonSPAmount1; CommonSP."Amount 1")
            {
            }
            column(CommonSPAmount2; CommonSP."Amount 2")
            {
            }
            column(CommonSPAmount3; CommonSP."Amount 3")
            {
            }
            column(CommonSPAmount4; CommonSP."Amount 4")
            {
            }
            trigger OnAfterGetRecord()
            begin
                if Number = 1 then CommonSP.Find('-')
                else
                    CommonSP.Next();
            end;
            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, CommonSP.Count);
            end;
        }
        dataitem(Total; "Integer")
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
            column(PrevspSalesRevenueTotal__; PrevspSalesRevenueTotal)
            {
            }
            column(PrevspCostAmountTotal__; PrevspCostAmountTotal)
            {
            }
            column(PrevspGPAmountTotal__; PrevspGPAmountTotal)
            {
            }
            column(CurrentYear; CurrentYear)
            {
            }
            column(PreviousYear; PreviousYear)
            {
            }
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
        FromDate:="Sales Invoice Line".GetRangeMin("Posting Date");
        ToDate:="Sales Invoice Line".GetRangeMax("Posting Date");
        PreviousFromDate:=CalcDate('<-1Y>', FromDate);
        CurrentYear:=Date2DMY(FromDate, 3);
        PreviousYear:=Date2DMY(PreviousFromDate, 3);
        sp.DeleteAll();
    end;
    var SalesInvoiceHeader: Record 112;
    SalesPerson: Record 13;
    LocationRec: Record Location;
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
    PrevSPCostAmount: Decimal;
    PrevSPSalesRevenue: Decimal;
    PrevSPGPAmount: Decimal;
    PrevSPSalesRevenueTotal: Decimal;
    PrevSPCostAmountTotal: Decimal;
    PrevSPGPAmountTotal: Decimal;
    PrevSPCreditSalesRevenue: Decimal;
    PrevSPCreditCostAmount: Decimal;
    PrevSPCreditGPAmount: Decimal;
    FromDate: Date;
    ToDate: Date;
    CurrentYear: Integer;
    PreviousYear: Integer;
    PreviousFromDate: Date;
    SP: Record "Job Buffer" temporary;
    PrevSP: Record "Job Buffer" temporary;
    CommonSP: Record "Job Buffer" temporary;
}
