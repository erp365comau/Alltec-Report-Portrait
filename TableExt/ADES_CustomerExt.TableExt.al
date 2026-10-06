tableextension 70202 ADES_CustomerExt extends Customer
{
    fields
    {
        field(70200; "EN Industry Code"; code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Industry Code', ENA = 'Industry Code';
            TableRelation = ADENIndustry;
        }
        /*  field(70201; "Enable on Website"; Boolean)
         {
         } 
        field(70202; "Buying Group"; Boolean)
        {
        }
        field(70203; "Business Size"; Option)
        {
            OptionMembers = " ",Large,"Small/Medium";
            OptionCaptionML = ENA = ' ,Large,Small/Medium';
        }*/
    }
}
