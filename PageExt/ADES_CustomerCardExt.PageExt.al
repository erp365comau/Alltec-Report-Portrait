pageextension 70212 ADES_CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("EN Industry Code"; Rec."EN Industry Code")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
    }
}