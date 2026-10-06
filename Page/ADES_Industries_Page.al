page 70200 ADENIndustries
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ADENIndustry;
    CaptionML = ENA = 'Industries', ENU = 'Industries';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("EN Code"; Rec."EN Code")
                {
                    ApplicationArea = All;
                }
                field("EN Description"; Rec."EN Description")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                end;
            }
        }
    }
}
