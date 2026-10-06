report 70211 "ADES_Round Value Entry Values"
{
    CaptionML = ENU = 'Round Value Entry Values', ENA = 'Round Value Entry Values';
    ProcessingOnly = true;
    // UsageCategory = ReportsAndAnalysis;
    // ApplicationArea = All;
    Permissions = tabledata 5802=m;

    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            trigger OnAfterGetRecord();
            begin
                "Cost per Unit":=Round("Cost per Unit", 0.01);
                "Cost per Unit (ACY)":=Round("Cost per Unit (ACY)", 0.01);
                Modify;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport();
    var
        User: Record User;
    begin
        User.SetRange("User Name", UserId);
        if NOT(User.FindFirst and (User."Authentication Email" = 'austral@envirosystems.com.au'))then Error('You are not authorized to run this action.');
    end;
    trigger OnPostReport();
    begin
        MESSAGE('Successfully rounded.');
    end;
    var
}
