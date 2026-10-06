tableextension 70205 ADES_UserSetupExt extends "User Setup"
{
    fields
    {

        field(70200; "ADES_Location Code"; Code[10])
        {
            CaptionML = ENU = 'Location Code', ENA = 'Location Code';
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }

        field(70201; "EN Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                SalespersonPurchaser: Record "Salesperson/Purchaser";
            begin
                if "EN Salesperson Code" <> '' then if SalespersonPurchaser.Get("EN Salesperson Code") then if SalespersonPurchaser.VerifySalesPersonPurchaserPrivacyBlocked(SalespersonPurchaser) then Error(SalespersonPurchaser.GetPrivacyBlockedGenericText(SalespersonPurchaser, true))
            end;
        }
        field(70202; "EN County"; Text[30])
        {
            CaptionML = ENA = 'State', ENU = 'State';
        }
    }
}
