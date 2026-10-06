report 70226 "ADES_Update Ledger Item Detail"
{
    CaptionML = ENU = 'Update Ledger Item Detail', ENA = 'Update Ledger Item Detail';
    ProcessingOnly = true;
    Permissions = tabledata "Item Ledger Entry"=RM,
        tabledata "Value Entry"=RM;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Entry No.";

            trigger OnAfterGetRecord();
            var
                Item: Record Item;
                ItemLedgerEntry: Record "Item Ledger Entry";
            begin
                if not Confirm(Format("Entry No."), false)then CurrReport.Skip;
                Item.Get(ItemNo);
                ItemLedgerEntry.Get("Entry No.");
                if "Item No." = '' then begin
                    ItemLedgerEntry."Item No.":=Item."No.";
                    ItemLedgerEntry.Description:=Item.Description;
                    ItemLedgerEntry.Modify;
                //Message(Item."No." + ' - ' + Item.Description);
                end;
            end;
            trigger OnPreDataItem();
            var
                TextUpdatingLastTotalUnitCost: TextConst ENU = 'Updating Legder Item Details...\\', ENA = 'Updating Legder Item Details...\\', ENZ = 'Updating Legder Item Details...\\';
            begin
                if RunValueEntry then CurrReport.Break;
                case ItemNo of '50030102': SetFilter("Entry No.", '122122|90791|90387|90294|89526|88148|86611|85725|85633|84630|83389|77372|76791|75302|74323|73792|38917|38035|32366|5954|1413');
                '50030104': SetFilter("Entry No.", '84690|80267|79288|79272|78209|77440|70133|70065|69055|67032|64970|59099|52739|52735|42479|27586|26985|20526|7998|15401|52737');
                '50030106': SetFilter("Entry No.", '59310|52789|49290|45115|41913|15402|11576|6337');
                end;
                if not Confirm(Format(Count), false)then CurrReport.Quit;
            end;
        }
    // dataitem("Value Entry"; "Value Entry")
    // {
    //     RequestFilterFields = "Item Ledger Entry No.";
    //     trigger OnAfterGetRecord();
    //     var
    //         Item: Record Item;
    //         ValueEntry: Record "Value Entry";
    //     begin
    //         if not Confirm(Format("Item Ledger Entry No."), false) then
    //             CurrReport.Skip;
    //         Item.Get(ItemNo);
    //         ValueEntry.Get("Entry No.");
    //         if "Item No." = '' then begin
    //             ValueEntry."Item No." := Item."No.";
    //             //Description := Item.Description;
    //             ValueEntry.Modify;
    //         end;
    //     end;
    //     trigger OnPreDataItem();
    //     var
    //     //TextUpdatingLastTotalUnitCost: TextConst ENU = 'Updating Legder Item Details...\\', ENA = 'Updating Legder Item Details...\\', ENZ = 'Updating Legder Item Details...\\';
    //     begin
    //         if not RunValueEntry then
    //             CurrReport.Quit;
    //         case ItemNo of
    //             '50030102':
    //                 SetFilter("Item Ledger Entry No.", '122122|90791|90387|90294|89526|88148|86611|85725|85633|84630|83389|77372|76791|75302|74323|73792|38917|38035|32366|5954|1413');
    //             '50030104':
    //                 SetFilter("Item Ledger Entry No.", '84690|80267|79288|79272|78209|77440|70133|70065|69055|67032|64970|59099|52739|52735|42479|27586|26985|20526|7998|15401|52737');
    //             '50030106':
    //                 SetFilter("Item Ledger Entry No.", '59310|52789|49290|45115|41913|15402|11576|6337');
    //         end;
    //         if not Confirm(Format(Count), false) then
    //             CurrReport.Quit;
    //     end;
    // }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(ADES_Options)
                {
                    field(ItemNo; ItemNo)
                    {
                        CaptionML = ENU = 'Item No.', ENA = 'Item No.';
                        ApplicationArea = All;
                    }
                    field(RunValueEntry; RunValueEntry)
                    {
                        CaptionML = ENU = 'Run Value Entry', ENA = 'Run Value Entry';
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        If ItemNo = '' then Error('Item No. cannot be blank.');
    end;
    trigger OnPostReport();
    var
        MsgSuccessfullyUpdated: TextConst ENU = 'Successfully updated.', ENA = 'Successfully updated.';
    begin
        MESSAGE(MsgSuccessfullyUpdated);
    end;
    var Window: Dialog;
    TotalRecNo: Integer;
    RecNo: Integer;
    ItemNo: Code[20];
    RunValueEntry: Boolean;
}
