pageextension 70205 ADES_ItemListExt extends "Item List"
{
    layout
    {
        addafter("Last Direct Cost")
        {
            field("ADES_Last Total Unit Cost"; Rec."ADES_Last Total Unit Cost")
            {
                ApplicationArea = All;
            }
            field("EN Inventory NSW"; Rec."EN Inventory NSW")
            {
                ApplicationArea = All;
            }
            field("EN Inventory WA"; Rec."EN Inventory WA")
            {
                ApplicationArea = All;
            }
            field("EN Inventory VIC"; Rec."EN Inventory VIC")
            {
                ApplicationArea = All;
            }
            field("EN Inventory QLD"; Rec."EN Inventory QLD")
            {
                ApplicationArea = All;
            }
        }
    }
}
