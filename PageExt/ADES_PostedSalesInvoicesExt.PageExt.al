pageextension 70233 ADES_PostedSalesInvoicesExt extends "Posted Sales Invoices"
{
    layout
    {
        addafter(Amount)
        {
            field(ADES_TotalCost; ADESTotalCost)
            {
                ApplicationArea = All;
                BlankZero = true;
                CaptionML = ENU = 'Total Cost', ENA = 'Total Cost';
                AutoFormatType = 1;
                AutoFormatExpression = Rec."Currency Code";
                DecimalPlaces = 2 : 2;
                Editable = false;
                ToolTip = 'Specifies the total cost of all lines on the invoice, as recorded when it was posted.';
            }
            field(ADES_TotalMarginPct; ADESTotalMarginPct)
            {
                ApplicationArea = All;
                BlankZero = true;
                CaptionML = ENU = 'Total Margin %', ENA = 'Total Margin %';
                DecimalPlaces = 2 : 2;
                Editable = false;
                ToolTip = 'Specifies the total margin as a percentage of the total excluding GST.';
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        TotalNetAmount: Decimal;
    begin
        SalesInvoiceLine.SetRange("Document No.", Rec."No.");
        SalesInvoiceLine.CalcSums(Amount, "Total Cost");
        ADESTotalCost := SalesInvoiceLine."Total Cost";
        TotalNetAmount := SalesInvoiceLine.Amount;
        if (TotalNetAmount <> 0) and (ADESTotalCost <> 0) then
            ADESTotalMarginPct := Round((TotalNetAmount - ADESTotalCost) / TotalNetAmount * 100, 0.01)
        else
            ADESTotalMarginPct := 0;
    end;

    var
        ADESTotalCost: Decimal;
        ADESTotalMarginPct: Decimal;
}
