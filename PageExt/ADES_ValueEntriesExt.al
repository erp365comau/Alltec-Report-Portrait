pageextension 70202 ADES_ValueEntriesExt extends "Value Entries"
{
    layout
    {
        addlast(content)
        {
            field("ADES_Customer Price Group"; Rec."ADES_Customer Price Group")
            {
                ApplicationArea = All;
            }
        }
    }
}
