pageextension 70204 ADES_GeneralPostingSetupExt extends "General Posting Setup"
{
    layout
    {
        addlast(content)
        {
            field("EN Sales WET Account"; Rec."EN Sales WET Account")
            {
                ApplicationArea = All;
            }
        }
    }
}
