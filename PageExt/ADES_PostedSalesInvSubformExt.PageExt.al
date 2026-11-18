pageextension 70217 ADES_PostedSalesInvSubformExt extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("ADES_Item Description"; Rec."ADES_Item Description")
            {
                ApplicationArea = All;
            }
            field("ADES_External Document No."; Rec."ADES_External Document No.")
            {
                ApplicationArea = All;
            }
            field("ADES_Salesperson Code"; Rec."ADES_Salesperson Code")
            {
                ApplicationArea = All;
            }
        }
        addafter(Quantity)
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the unit cost recorded when the invoice was posted.';
            }
            field("Total Cost"; Rec."Total Cost")
            {
                ApplicationArea = All;
                BlankZero = true;
                ToolTip = 'Specifies the total cost recorded when the invoice was posted.';
            }
            field("Margin %"; Rec."Margin %")
            {
                ApplicationArea = All;
                BlankZero = true;
                ToolTip = 'Specifies the margin as a percentage of the line amount, as recorded when the invoice was posted.';
            }
        }
        addlast(Control9)
        {
            field(ADES_TotalCost; ADESTotalCost())
            {
                ApplicationArea = All;
                BlankZero = true;
                CaptionML = ENU = 'Total Cost', ENA = 'Total Cost';
                AutoFormatType = 1;
                AutoFormatExpression = Rec.GetCurrencyCode();
                DecimalPlaces = 2 : 2;
                Editable = false;
                ToolTip = 'Specifies the total cost of all lines, as recorded when the invoice was posted.';
            }
            field(ADES_TotalMarginPct; ADESTotalMarginPct())
            {
                ApplicationArea = All;
                BlankZero = true;
                CaptionML = ENU = 'Total Margin %', ENA = 'Total Margin %';
                DecimalPlaces = 2 : 2;
                Editable = false;
                ToolTip = 'Specifies the total margin as a percentage of the total excluding GST, as recorded when the invoice was posted.';
            }
        }
    }

    local procedure ADESTotalCost(): Decimal
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SetRange("Document No.", Rec."Document No.");
        SalesInvoiceLine.CalcSums("Total Cost");
        exit(SalesInvoiceLine."Total Cost");
    end;

    local procedure ADESTotalMarginPct(): Decimal
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        TotalNetAmount: Decimal;
        TotalCost: Decimal;
    begin
        SalesInvoiceLine.SetRange("Document No.", Rec."Document No.");
        SalesInvoiceLine.CalcSums(Amount, "Total Cost");
        TotalNetAmount := SalesInvoiceLine.Amount;
        TotalCost := SalesInvoiceLine."Total Cost";
        if (TotalNetAmount = 0) or (TotalCost = 0) then
            exit(0);
        exit(Round((TotalNetAmount - TotalCost) / TotalNetAmount * 100, 0.01));
    end;
}
