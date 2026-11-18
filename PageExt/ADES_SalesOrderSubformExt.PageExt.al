pageextension 70232 ADES_SalesOrderSubformExt extends "Sales Order Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field(ADES_UnitCost; ADESUnitCost)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Unit Cost', ENA = 'Unit Cost';
                AutoFormatType = 2;
                AutoFormatExpression = Rec."Currency Code";
                ToolTip = 'Specifies the unit cost of the item on the line, in the currency of the document.';

                trigger OnValidate()
                begin
                    Rec.Validate("Unit Cost", ADESUnitCost);
                    CurrPage.SaveRecord();
                end;
            }
            field("Total Cost"; Rec."Total Cost")
            {
                ApplicationArea = All;
                BlankZero = true;
                ToolTip = 'Specifies the quantity multiplied by the unit cost.';
            }
            field("Margin %"; Rec."Margin %")
            {
                ApplicationArea = All;
                BlankZero = true;
                ToolTip = 'Specifies the margin on the line as a percentage of the line amount.';
            }
        }
        addlast(Control28)
        {
            field(ADES_TotalCost; ADESTotalCost())
            {
                ApplicationArea = All;
                BlankZero = true;
                CaptionML = ENU = 'Total Cost', ENA = 'Total Cost';
                AutoFormatType = 1;
                AutoFormatExpression = Rec."Currency Code";
                DecimalPlaces = 2 : 2;
                Editable = false;
                ToolTip = 'Specifies the total cost of all lines on this order.';
            }
            field(ADES_TotalMarginPct; ADESTotalMarginPct())
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
    begin
        ADESUnitCost := Rec."Unit Cost";
    end;

    local procedure ADESTotalCost(): Decimal
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        SalesLine.CalcSums("Total Cost");
        exit(SalesLine."Total Cost");
    end;

    local procedure ADESTotalMarginPct(): Decimal
    var
        SalesLine: Record "Sales Line";
        TotalNetAmount: Decimal;
        TotalCost: Decimal;
    begin
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        SalesLine.CalcSums(Amount, "Total Cost");
        TotalNetAmount := SalesLine.Amount;
        TotalCost := SalesLine."Total Cost";
        if (TotalNetAmount = 0) or (TotalCost = 0) then
            exit(0);
        exit(Round((TotalNetAmount - TotalCost) / TotalNetAmount * 100, 0.01));
    end;

    var
        ADESUnitCost: Decimal;
}
