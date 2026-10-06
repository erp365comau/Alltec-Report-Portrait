tableextension 70222 CompanyInformationExt extends "Company Information"
{
    fields
    {
        field(70200; "EN Credit Card Surcharge"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'CSA.MAPA.AUFS001';
            CaptionML = ENA = 'Credit Card Surcharge', ENU = 'Credit Card Surcharge';
        }
        field(70201; "EN Phone Department 2"; Text[30])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Phone Department 2', ENA = 'Phone Department 2';
            Description = 'CSA014.MAPA';
        }
        field(70202; "EN Fax Department 1"; Text[30])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Fax Department 1', ENA = 'Fax Department 1';
            Description = 'CSA014.MAPA';
        }
        field(70203; "EN Email Department 2"; Text[80])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Email Department 2', ENA = 'Email Department 2';
            Description = 'CSA014.MAPA';
        }
    }
}
