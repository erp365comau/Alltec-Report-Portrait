tableextension 70219 ADES_ProdOrderComponentExt extends "Prod. Order Component"
{
    fields
    {
        field(70200; "ADES_Item Description"; Text[100])
        {
            CaptionML = ENU = 'Item Description', ENA = 'Item Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
            Editable = false;
        }
    }
}
