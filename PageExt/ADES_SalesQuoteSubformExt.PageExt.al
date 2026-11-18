pageextension 70231 ADES_SalesQuoteSubformExt extends "Sales Quote Subform"
{
    layout
    {
        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }
        addafter(Quantity)
        {
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies how many units of the item are on hand across all locations.';
            }
            field(ADES_ItemAvailability; SalesInfoPaneMgt.CalcAvailability(Rec))
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Item Availability', ENA = 'Item Availability';
                DecimalPlaces = 0 : 5;
                ToolTip = 'Specifies how many units of the item are available, taking reservations, requirements and scheduled receipts into account.';
            }
        }
        addafter("Line Amount")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the unit cost of the item on the line, in the currency of the document.';
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
        addlast(Control35)
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
                ToolTip = 'Specifies the total cost of all lines on this quote.';
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
        SalesInfoPaneMgt: Codeunit "Sales Info-Pane Management";
}
