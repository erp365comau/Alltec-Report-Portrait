tableextension 70223 ADENGenPostingSetupExt extends "General Posting Setup"
{
    fields
    {
        field(70200; "EN Sales WET Account"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
            Description = 'CSA.JR';
            CaptionML = ENU = 'Sales WET Account', ENA = 'Sales WET Account';
        }
    }
}
