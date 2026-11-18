tableextension 70230 ADES_SalesLineExt extends "Sales Line"
{
    fields
    {
        field(70203; "Total Cost"; Decimal)
        {
            CaptionML = ENU = 'Total Cost', ENA = 'Total Cost';
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(70204; "Margin %"; Decimal)
        {
            CaptionML = ENU = 'Margin %', ENA = 'Margin %';
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(70205; Inventory; Decimal)
        {
            CaptionML = ENU = 'Inventory', ENA = 'Inventory';
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        modify("Unit Cost (LCY)")
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
        modify("Unit Cost")
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
        modify("Unit of Measure Code")
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
        modify("Line Discount %")
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
        modify("Line Discount Amount")
        {
            trigger OnAfterValidate()
            begin
                UpdateCostAndMargin();
            end;
        }
    }

    local procedure UpdateCostAndMargin()
    begin
        Rec."Total Cost" := Round(Rec.Quantity * Rec."Unit Cost", 0.01);
        if (Rec."Total Cost" = 0) or (Rec."Line Amount" = 0) then
            Rec."Margin %" := 0
        else
            Rec."Margin %" := Round((Rec."Line Amount" - Rec."Total Cost") / Rec."Line Amount" * 100, 0.01);
    end;
}
