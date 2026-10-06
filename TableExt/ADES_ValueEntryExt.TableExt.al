tableextension 70214 ADES_ValueEntryExt extends "Value Entry"
{
    fields
    {
        field(70200; "ADES_Customer Price Group"; Code[10])
        {
            CaptionML = ENU = 'Customer Price Group', ENA = 'Customer Price Group';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."Customer Price Group" WHERE("Bill-to Customer No." = FIELD("Source No."), "No." = FIELD("Document No.")));
        }
    }
}
