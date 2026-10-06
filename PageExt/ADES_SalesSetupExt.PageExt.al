pageextension 70211 ADES_SalesSetupExt extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("ADES_Sale Terms & Conditions"; Rec."ADES_Sale Terms & Conditions")
            {
                MultiLine = true;
                ApplicationArea = All;
            }
        }
    }
}