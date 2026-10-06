tableextension 70208 ADES_SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(70200; "EN Industry Code"; code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Industry Code', ENA = 'Industry Code';
        }
    }
}
