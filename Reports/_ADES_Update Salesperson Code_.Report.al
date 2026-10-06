report 70218 "ADES_Update Salesperson Code"
{
    CaptionML = ENU = 'Update Salesperson Code', ENA = 'Update Salesperson Code';
    Permissions = TableData 21=m,
        TableData 110=m,
        TableData 112=m,
        TableData 114=m,
        TableData 5065=m,
        TableData 5072=m,
        TableData 5080=m,
        TableData 5093=m,
        TableData 5107=m,
        TableData 5990=m,
        TableData 5992=m,
        TableData 5994=m,
        TableData 6660=m;
    ProcessingOnly = true;

    // UsageCategory = ReportsAndAnalysis;
    // ApplicationArea = All;
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = where("Salesperson Code"=filter(<>''));
            RequestFilterFields = "No.", "Salesperson Code";

            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No."=field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Salesperson Code":=Customer."Salesperson Code";
                    MODIFY;
                    i+=1;
                end;
                trigger OnPostDataItem();
                begin
                // IF i > 0 THEN
                //     MESSAGE(STRSUBSTNO('%1 modified records: %2.', UPPERCASE(TABLECAPTION), FORMAT(i)));
                end;
                trigger OnPreDataItem();
                begin
                //SETRANGE("Salesperson Code", Salesperson.Code);
                // IF COUNT > 0 THEN
                //     IF NOT CONFIRM(STRSUBSTNO('Do you want to modify %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
                //         CurrReport.BREAK;
                end;
            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No."=field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Salesperson Code":=Customer."Salesperson Code";
                    MODIFY;
                    i+=1;
                end;
                trigger OnPostDataItem();
                begin
                // IF i > 0 THEN
                //     MESSAGE(STRSUBSTNO('%1 modified records: %2.', UPPERCASE(TABLECAPTION), FORMAT(i)));
                end;
                trigger OnPreDataItem();
                begin
                    CLEAR(i);
                //SETRANGE("Salesperson Code", Salesperson.Code);
                // IF COUNT > 0 THEN
                //     IF NOT CONFIRM(STRSUBSTNO('Do you want to modify %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
                //         CurrReport.BREAK;
                end;
            }
            dataitem("Sales Shipment Header"; "Sales Shipment Header")
            {
                DataItemLink = "Sell-to Customer No."=field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Salesperson Code":=Customer."Salesperson Code";
                    MODIFY;
                    i+=1;
                end;
                trigger OnPostDataItem();
                begin
                // IF i > 0 THEN
                //     MESSAGE(STRSUBSTNO('%1 modified records: %2.', UPPERCASE(TABLECAPTION), FORMAT(i)));
                end;
                trigger OnPreDataItem();
                begin
                    CLEAR(i);
                //SETRANGE("Salesperson Code", Salesperson.Code);
                // IF COUNT > 0 THEN
                //     IF NOT CONFIRM(STRSUBSTNO('Do you want to modify %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
                //         CurrReport.BREAK;
                end;
            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No."=field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Salesperson Code":=Customer."Salesperson Code";
                    MODIFY;
                    i+=1;
                end;
                trigger OnPostDataItem();
                begin
                // IF i > 0 THEN
                //     MESSAGE(STRSUBSTNO('%1 modified records: %2.', UPPERCASE(TABLECAPTION), FORMAT(i)));
                end;
                trigger OnPreDataItem();
                begin
                    CLEAR(i);
                //SETRANGE("Salesperson Code", Salesperson.Code);
                // IF COUNT > 0 THEN
                //     IF NOT CONFIRM(STRSUBSTNO('Do you want to modify %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
                //         CurrReport.BREAK;
                end;
            }
            dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
            {
                DataItemLink = "Sell-to Customer No."=field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Salesperson Code":=Customer."Salesperson Code";
                    MODIFY;
                    i+=1;
                end;
                trigger OnPostDataItem();
                begin
                // IF i > 0 THEN
                //     MESSAGE(STRSUBSTNO('%1 modified records: %2.', UPPERCASE(TABLECAPTION), FORMAT(i)));
                end;
                trigger OnPreDataItem();
                begin
                    CLEAR(i);
                //SETRANGE("Salesperson Code", Salesperson.Code);
                // IF COUNT > 0 THEN
                //     IF NOT CONFIRM(STRSUBSTNO('Do you want to modify %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
                //         CurrReport.BREAK;
                end;
            }
            dataitem("Return Receipt Header"; "Return Receipt Header")
            {
                DataItemLink = "Sell-to Customer No."=field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Salesperson Code":=Customer."Salesperson Code";
                    MODIFY;
                    i+=1;
                end;
                trigger OnPostDataItem();
                begin
                // IF i > 0 THEN
                //     MESSAGE(STRSUBSTNO('%1 modified records: %2.', UPPERCASE(TABLECAPTION), FORMAT(i)));
                end;
                trigger OnPreDataItem();
                begin
                    CLEAR(i);
                //SETRANGE("Salesperson Code", Salesperson.Code);
                // IF COUNT > 0 THEN
                //     IF NOT CONFIRM(STRSUBSTNO('Do you want to modify %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
                //         CurrReport.BREAK;
                end;
            }
            trigger OnPreDataItem();
            begin
                If COUNT = 0 then Error(StrSubstNo('No records found in %1.', UPPERCASE(TableCaption)));
            // IF COUNT > 0 THEN
            //     IF NOT CONFIRM(STRSUBSTNO('Do you want to continue with %1 records in %2?', FORMAT(COUNT), UPPERCASE(TABLECAPTION))) THEN
            //         CurrReport.BREAK;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options', ENA = 'Options';
                    Visible = false;

                    field(Code_Salesperson__; Salesperson.Code)
                    {
                        CaptionML = ENU = 'From Salesperson Code', ENA = 'From Salesperson Code';
                        TableRelation = "Salesperson/Purchaser";
                        ApplicationArea = All;
                    }
                    field(Code_Salesperson2__; Salesperson2.Code)
                    {
                        CaptionML = ENU = 'To Salesperson Code', ENA = 'To Salesperson Code';
                        TableRelation = "Salesperson/Purchaser";
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
    trigger OnPostReport();
    begin
        MESSAGE('Process completed.');
    end;
    trigger OnPreReport();
    begin
    // IF Salesperson.Code = '' THEN
    //     ERROR('From Salesperson Code must have a value.');
    // IF Salesperson2.Code = '' THEN
    //     ERROR('To Salesperson Code must have a value.');
    end;
    var Salesperson: Record "Salesperson/Purchaser";
    Salesperson2: Record "Salesperson/Purchaser";
    i: Integer;
}
