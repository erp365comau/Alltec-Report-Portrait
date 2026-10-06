pageextension 70203 CompanyInformationExt extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            field("EN Credit Card Surcharge"; Rec."EN Credit Card Surcharge")
            {
                ApplicationArea = All;
            }
            field("EN Phone Department 2"; Rec."EN Phone Department 2")
            {
                ApplicationArea = All;
            }
            field("EN Fax Department 1"; Rec."EN Fax Department 1")
            {
                ApplicationArea = All;
            }
            field("EN Email Department 2"; Rec."EN Email Department 2")
            {
                ApplicationArea = All;
            }
        }
    }
}
