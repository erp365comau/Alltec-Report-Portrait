pageextension 70200 ADES_PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("EN Industry Code"; Rec."EN Industry Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
