pageextension 70234 ADES_PostedSalesInvLinesExt extends "Posted Sales Invoice Lines"
{
    layout
    {
        addafter(Quantity)
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the unit cost recorded when the invoice was posted.';
            }
            field("Total Cost"; Rec."Total Cost")
            {
                ApplicationArea = All;
                BlankZero = true;
                ToolTip = 'Specifies the total cost recorded when the invoice was posted.';
            }
            field("Margin %"; Rec."Margin %")
            {
                ApplicationArea = All;
                BlankZero = true;
                ToolTip = 'Specifies the margin as a percentage of the line amount, as recorded when the invoice was posted.';
            }
        }
    }
}
