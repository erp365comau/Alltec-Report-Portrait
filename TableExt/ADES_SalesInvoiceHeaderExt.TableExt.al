tableextension 70210 ADES_SalesInvoiceHeaderExt extends "Sales Invoice Header"
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
