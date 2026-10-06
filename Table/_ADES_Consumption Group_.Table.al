/*table 70200 "ADES_Consumption Group"
{
    CaptionML = ENU = 'Consumption Group', ENA = 'Consumption Group';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ADES_Record ID"; Integer)
        {
            CaptionML = ENU = 'Record ID', ENA = 'Record ID';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(2; "ADES_Type";Enum "ADES_Consumption Group Type")
        {
            CaptionML = ENU = 'Type', ENA = 'Type';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(3; "ADES_No."; Code[20])
        {
            CaptionML = ENU = 'No.', ENA = 'No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(4; "ADES_Item No."; Code[20])
        {
            CaptionML = ENU = 'Item No.', ENA = 'Item No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(5; "ADES_Quantity"; Decimal)
        {
            CaptionML = ENU = 'Quantity', ENA = 'Quantity';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "ADES_Quantity Changed":="ADES_Quantity" <> "ADES_Original Quantity";
            end;
        }
        field(6; "ADES_Is Total"; Boolean)
        {
            CaptionML = ENU = 'Is Total', ENA = 'Is Total';
            DataClassification = ToBeClassified;
        }
        field(7; "ADES_Source Template Name"; Code[10])
        {
            CaptionML = ENU = 'Source Template Name', ENA = 'Source Template Name';
            DataClassification = ToBeClassified;
        }
        field(8; "ADES_Source Batch Name"; Code[10])
        {
            CaptionML = ENU = 'Source Batch Name', ENA = 'Source Batch Name';
            DataClassification = ToBeClassified;
        }
        field(9; "ADES_Source Line No."; Integer)
        {
            CaptionML = ENU = 'Source Line No.', ENA = 'Source Line No.';
            DataClassification = ToBeClassified;
        }
        field(10; "ADES_Original Quantity"; Decimal)
        {
            CaptionML = ENU = 'Original Quantity', ENA = 'Original Quantity';
            DataClassification = ToBeClassified;
        }
        field(11; "ADES_Quantity Changed"; Boolean)
        {
            CaptionML = ENU = 'Quantity Changed', ENA = 'Quantity Changed';
            DataClassification = ToBeClassified;
        }
        field(12; "ADES_Process"; Boolean)
        {
            CaptionML = ENU = 'Process', ENA = 'Process';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "ADES_Record ID")
        {
            Clustered = true;
        }
    }
}*/
