report 70224 "ADES_Last Total Unit Cost Upd."
{
    CaptionML = ENU = 'Update Last Total Unit Cost', ENA = 'Update Last Total Unit Cost';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord();
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
                LastTotalUnitCostFound: Boolean;
                SalesPrice: Record "Sales Price";
                LastResellerPriceFound: Boolean;
                LastTradePriceFound: Boolean;
                LastPolysealFound: Boolean;
            begin
                RecNo += 1;
                Window.UPDATE(1, "No.");
                Window.UPDATE(2, ROUND(RecNo / TotalRecNo * 10000, 1));
                ItemLedgerEntry.SETCURRENTKEY("Posting Date");
                ItemLedgerEntry.SETRANGE("Item No.", "No.");
                ItemLedgerEntry.SETFILTER("Entry Type", '%1|%2', ItemLedgerEntry."Entry Type"::Output, ItemLedgerEntry."Entry Type"::Purchase);
                IF ItemLedgerEntry.FINDLAST THEN begin
                    IF ItemLedgerEntry.Quantity <> 0 THEN begin
                        ItemLedgerEntry.CalcFields("Cost Amount (Actual)");
                        "ADES_Last Total Unit Cost" := ROUND(ItemLedgerEntry."Cost Amount (Actual)" / ItemLedgerEntry.Quantity, 0.01)
                    end
                    ELSE
                        "ADES_Last Total Unit Cost" := 0;
                    IF "ADES_Last Total Unit Cost" < 0 THEN "ADES_Last Total Unit Cost" := 0;
                    //MODIFY(TRUE);
                    LastTotalUnitCostFound := true;
                end;
                SalesPrice.SetRange("Item No.", "No.");
                SalesPrice.SetRange("Sales Type", SalesPrice."Sales Type"::"Customer Price Group");
                SalesPrice.SetRange("Sales Code", 'AR');
                SalesPrice.SetFilter("Starting Date", '<=%1', Today);
                SalesPrice.SetRange("Unit of Measure Code", "Base Unit of Measure");
                //SalesPrice.SetFilter("Minimum Quantity", '<>%1', 0);
                SalesPrice.SetFilter("Unit Price", '<>%1', 0);
                SalesPrice.SetRange("Ending Date", 0D);
                if SalesPrice.FindFirst then begin
                    ADES_Reseller := SalesPrice."Unit Price";
                    LastResellerPriceFound := true;
                end;
                SalesPrice.SetRange("Sales Code", 'T');
                if SalesPrice.FindFirst then begin
                    ADES_Trade := SalesPrice."Unit Price";
                    LastTradePriceFound := true;
                end;
                SalesPrice.SetRange("Sales Type", SalesPrice."Sales Type"::Customer);
                SalesPrice.SetRange("Sales Code", '000010');
                if SalesPrice.FindFirst then begin
                    ADES_Polyseal := SalesPrice."Unit Price";
                    LastPolysealFound := true;
                end;
                if LastTotalUnitCostFound OR LastResellerPriceFound OR LastTradePriceFound OR LastPolysealFound then MODIFY(TRUE);
            end;

            trigger OnPostDataItem();
            begin
                Window.CLOSE;
            end;

            trigger OnPreDataItem();
            var
                TextUpdatingLastTotalUnitCost: TextConst ENU = 'Updating Last Total Unit Cost...\\', ENA = 'Updating Last Total Unit Cost...\\', ENZ = 'Updating Last Total Unit Cost...\\';
            begin
                TotalRecNo := COUNT;
                Window.OPEN(TextUpdatingLastTotalUnitCost + '#1#########################\' + '@2@@@@@@@@@@@@@@@@@@@@@@@@@\');
                Window.UPDATE(2, 0);
                ModifyAll(ADES_Reseller, 0, true);
                ModifyAll(ADES_Trade, 0, true);
                ModifyAll(ADES_Polyseal, 0, true);
            end;
        }
    }
    requestpage
    {
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
    trigger OnPostReport();
    var
        MsgSuccessfullyUpdated: TextConst ENU = 'Successfully updated.', ENA = 'Successfully updated.';
    begin
        MESSAGE(MsgSuccessfullyUpdated);
    end;

    var
        Window: Dialog;
        TotalRecNo: Integer;
        RecNo: Integer;
}
