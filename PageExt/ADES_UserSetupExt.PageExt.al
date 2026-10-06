pageextension 70206 ADES_UserSetupExt extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("ADES_Location Code"; Rec."ADES_Location Code")
            {
                ApplicationArea = All;
            }
            field("EN Salesperson Code"; Rec."EN Salesperson Code")
            {
                ApplicationArea = All;
            }
            field("EN County"; Rec."EN County")
            {
                ApplicationArea = All;
            }
        }
    }
}