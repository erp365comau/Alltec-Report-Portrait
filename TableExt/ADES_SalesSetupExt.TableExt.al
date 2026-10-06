tableextension 70207 ADES_SalesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(70201; "ADES_Sale Terms & Conditions"; Text[2048])
        {
            CaptionML = ENU = 'Terms & Conditions of Sale', ENA = 'Terms & Conditions of Sale';
            DataClassification = ToBeClassified;
        }
    }
}
