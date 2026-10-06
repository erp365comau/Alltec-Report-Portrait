pageextension 70220 ADES_ProdOrderComponentsExt extends "Prod. Order Components"
{
    layout
    {
        addafter(Description)
        {
            field("ADES_Item Description"; Rec."ADES_Item Description")
            {
                ApplicationArea = All;
            }
        }
    }
}