pageextension 70218 ADES_PostedSalesCrMeSubformExt extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter(Description)
        {
            field("ADES_Item Description"; Rec."ADES_Item Description")
            {
                ApplicationArea = All;
            }
            field("ADES_Salesperson Code"; Rec."ADES_Salesperson Code")
            {
                ApplicationArea = All;
            }
            field("ADES_External Document No."; Rec."ADES_External Document No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
