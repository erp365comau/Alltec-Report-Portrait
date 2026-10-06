report 70203 "ADES_Cust. Prod. Sls. by Month"
{
    // Austral Sugeevan 20/01/2021 >>> Designed Report
    CaptionML = ENU = 'Customer Product Sales Revenue and Margin by Month', ENA = 'Customer Product Sales Revenue and Margin by Month';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70203.ADES_CustomerProductSalesRevenueandMarginbyMonth.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = WHERE(Type=CONST(Item));
            RequestFilterFields = "No.", "Sell-to Customer No.", "Document No.", "ADES_Salesperson Code", "Posting Date";

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
            column(CostAmount_1__; CostAmount[1])
            {
            }
            column(CostAmount_2__; CostAmount[2])
            {
            }
            column(CostAmount_3__; CostAmount[3])
            {
            }
            column(CostAmount_4__; CostAmount[4])
            {
            }
            column(CostAmount_5__; CostAmount[5])
            {
            }
            column(CostAmount_6__; CostAmount[6])
            {
            }
            column(SalesRevenue_1__; SalesRevenue[1])
            {
            }
            column(SalesRevenue_2__; SalesRevenue[2])
            {
            }
            column(SalesRevenue_3__; SalesRevenue[3])
            {
            }
            column(SalesRevenue_4__; SalesRevenue[4])
            {
            }
            column(SalesRevenue_5__; SalesRevenue[5])
            {
            }
            column(SalesRevenue_6__; SalesRevenue[6])
            {
            }
            column(GPAmount_1__; GPAmount[1])
            {
            }
            column(GPAmount_2__; GPAmount[2])
            {
            }
            column(GPAmount_3__; GPAmount[3])
            {
            }
            column(GPAmount_4__; GPAmount[4])
            {
            }
            column(GPAmount_5__; GPAmount[5])
            {
            }
            column(GPAmount_6__; GPAmount[6])
            {
            }
            column(InvoicedQty_1__; InvoicedQty[1])
            {
            }
            column(InvoicedQty_2__; InvoicedQty[2])
            {
            }
            column(InvoicedQty_3__; InvoicedQty[3])
            {
            }
            column(InvoicedQty_4__; InvoicedQty[4])
            {
            }
            column(InvoicedQty_5__; InvoicedQty[5])
            {
            }
            column(InvoicedQty_6__; InvoicedQty[6])
            {
            }
            column(Months_1__; Months[1])
            {
            }
            column(Months_2__; Months[2])
            {
            }
            column(Months_3__; Months[3])
            {
            }
            column(Months_4__; Months[4])
            {
            }
            column(Months_5__; Months[5])
            {
            }
            column(Months_6__; Months[6])
            {
            }
            column(StartingDate__;'Starting Date: ' + FORMAT(StartingDate))
            {
            }
            trigger OnAfterGetRecord();
            var
                ValueEntry: Record 5802;
                SalesInvoiceLine: Record 113;
            begin
                IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Sell-to Customer No.", '')THEN BEGIN
                    TempInvtBuffer.INIT;
                    TempInvtBuffer."Item No.":="No.";
                    TempInvtBuffer."Lot No.":="Sell-to Customer No.";
                    //TempInvtBuffer."Serial No." := "Document No.";
                    TempInvtBuffer.INSERT;
                END
                ELSE
                    CurrReport.SKIP;
                CLEAR(SalesInvoiceHeader);
                CLEAR(SalesPerson);
                IF SalesInvoiceHeader.GET("Document No.")THEN IF SalesPerson.GET(SalesInvoiceHeader."Salesperson Code")THEN;
                /* CLEAR(SalesRevenue);
                SalesInvoiceLine.SETRANGE("Document No.", "Document No.");
                SalesInvoiceLine.SETRANGE("No.", "No.");
                SalesInvoiceLine.SETRANGE("Posting Date", "Posting Date");
                IF SalesInvoiceLine.FINDSET THEN
                    REPEAT
                        //SalesRevenue += (SalesInvoiceLine.Quantity * SalesInvoiceLine."Unit Price");
                        IF SalesInvoiceHeader."Currency Factor" <> 0 THEN
                            SalesRevenue += SalesInvoiceLine.Amount / SalesInvoiceHeader."Currency Factor"
                        else
                            SalesRevenue += SalesInvoiceLine.Amount;
                    UNTIL SalesInvoiceLine.NEXT = 0; */
                CLEAR(SalesRevenue);
                CLEAR(CostAmount);
                Clear(GPAmount);
                Clear(InvoicedQty);
                Clear(AvgPrice);
                for i:=ArrayLen(SalesRevenue)downto 1 do begin
                    ValueEntry.SETCURRENTKEY("Item No.", "Posting Date");
                    //ValueEntry.SETRANGE("Document No.", "Document No.");
                    ValueEntry.SETRANGE("Item No.", "No.");
                    //ValueEntry.SETRANGE("Posting Date", "Posting Date");
                    ValueEntry.SETRANGE("Posting Date", Dates[i], EndDates[i]);
                    ValueEntry.SetRange("Source Type", ValueEntry."Source Type"::Customer);
                    ValueEntry.SetRange("Source No.", "Sell-to Customer No.");
                    /* If ShowError then begin
                        Message(Format(Dates[i]) + '..' + Format(EndDates[i]));
                        Error(Format(ValueEntry.Count));
                    end; */
                    IF ValueEntry.FINDSET THEN REPEAT InvoicedQty[i]+=-ValueEntry."Invoiced Quantity";
                            SalesRevenue[i]+=ValueEntry."Sales Amount (Actual)";
                            CostAmount[i]+=-ValueEntry."Cost Amount (Actual)";
                        UNTIL ValueEntry.NEXT = 0;
                    /* Clear(ValueEntry);
                    CLEAR(CostAmount);                
                    ValueEntry.SETCURRENTKEY("Item No.", "Posting Date");
                    ValueEntry.SETRANGE("Document No.", "Document No.");
                    ValueEntry.SETRANGE("Item No.", "No.");
                    ValueEntry.SETRANGE("Posting Date", "Posting Date");
                    IF ValueEntry.FINDSET THEN
                        REPEAT
                            CostAmount += -ValueEntry."Cost Amount (Actual)";
                        UNTIL ValueEntry.NEXT = 0; */
                    GPAmount[i]:=SalesRevenue[i] - CostAmount[i];
                //SalesRevenueTotal += SalesRevenue;
                //CostAmountTotal += Co
                //GPAmountTotal
                end;
            end;
            trigger OnPreDataItem()
            begin
                //SetRange("Posting Date", Dates[6], CalcDate('1M', Dates[1]) - 1);
                SetRange("Posting Date", Dates[6], EndDates[1]);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options', ENA = 'Options';

                    field(StartingDate; StartingDate)
                    {
                        CaptionML = ENU = 'Starting Date', ENA = 'Starting Date';
                        ApplicationArea = All;
                    }
                /* field(ShowError; ShowError)
                    {
                        CaptionML = ENU = 'Show Error', ENA = 'Show Error';
                        ApplicationArea = All;
                    } */
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
    trigger OnPreReport();
    begin
        if StartingDate = 0D then Error('Starting Date cannot be blank.');
        CalcDates;
    end;
    var SalesInvoiceHeader: Record 112;
    SalesPerson: Record 13;
    CostAmount: array[6]of Decimal;
    SalesRevenue: array[6]of Decimal;
    GPAmount: array[6]of Decimal;
    SalesRevenueTotal: Decimal;
    CostAmountTotal: Decimal;
    GPAmountTotal: Decimal;
    TempInvtBuffer: Record 307 temporary;
    StartingDate: Date;
    Dates: array[6]of Date;
    Months: array[6]of Text[30];
    i: Integer;
    InvoicedQty: array[6]of Decimal;
    AvgPrice: array[6]of Decimal;
    ShowError: Boolean;
    EndDates: array[6]of Date;
    local procedure CalcDates()
    var
        MonthL: Integer;
        YearL: Integer;
    begin
        MonthL:=Date2DMY(StartingDate, 2);
        YearL:=Date2DMY(StartingDate, 3);
        Dates[1]:=DMY2Date(1, MonthL, YearL);
        EndDates[1]:=CalcDate('1M', Dates[1]) - 1;
        Months[1]:=GetMonthYear(MonthL, YearL);
        for i:=2 to ArrayLen(Dates)do begin
            Dates[i]:=CalcDate('-1M', Dates[i - 1]);
            EndDates[i]:=CalcDate('1M', Dates[i]) - 1;
            if i <= ArrayLen(Months)then begin
                MonthL:=Date2DMY(Dates[i], 2);
                YearL:=Date2DMY(Dates[i], 3);
                Months[i]:=GetMonthYear(MonthL, YearL);
            end;
        end;
    end;
    local procedure GetMonthYear(Month: Integer; Year: Integer): Text[30]begin
        case month of 1: exit('January ' + Format(Year));
        2: exit('February ' + Format(Year));
        3: exit('March ' + Format(Year));
        4: exit('April ' + Format(Year));
        5: exit('May ' + Format(Year));
        6: exit('June ' + Format(Year));
        7: exit('July ' + Format(Year));
        8: exit('August ' + Format(Year));
        9: exit('September ' + Format(Year));
        10: exit('October ' + Format(Year));
        11: exit('November ' + Format(Year));
        12: exit('December ' + Format(Year));
        end;
    end;
}
