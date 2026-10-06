table 70200 ADENIndustry
{
    DataClassification = ToBeClassified;
    DrillDownPageId = ADENIndustries;
    LookupPageId = ADENIndustries;

    fields
    {
        field(50000; "EN Code"; code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENA = 'Code', ENU = 'Code';
        }
        field(50001; "EN Description"; code[10])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENA = 'Description', ENU = 'Description';
        }
    }
    keys
    {
        key(PK; "EN Code")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    var
        SalesInvHdr: Record "Sales Invoice Header";
        SalesHdr: Record "Sales Header";
        cust: Record Customer;
    begin
        SalesInvHdr.Reset();
        SalesInvHdr.SetRange("EN Industry Code", "EN Code");
        if not SalesInvHdr.IsEmpty then error('You can not delete the Industry Code %. because it is posted to sales');
        SalesHdr.Reset();
        SalesHdr.SetRange("EN Industry Code", "EN Code");
        if not SalesHdr.IsEmpty then error('You can not delete the Industry Code %. because it is assigned in Sales Document');
        cust.Reset();
        cust.SetRange("EN Industry Code", "EN Code");
        if not cust.IsEmpty then Error('You can not delete the Industry Code %. because it is assigned in Customer');
    end;

    trigger OnRename()
    begin
        Error('not allowed to rename');
    end;
}
