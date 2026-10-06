pageextension 70214 ADES_SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Requested Delivery Date")
        {
            field("EN Industry Code"; Rec."EN Industry Code")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
    }
}