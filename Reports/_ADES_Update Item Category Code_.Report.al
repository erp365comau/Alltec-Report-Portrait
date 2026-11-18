report 70217 "ADES_Update Item Category Code"
{
    CaptionML = ENU = 'Update Item Category Code', ENA = 'Update Item Category Code';
    Permissions = TableData 32 = m,
        TableData 111 = m,
        TableData 113 = m,
        TableData 115 = m,
        TableData 121 = m,
        TableData 123 = m,
        TableData 125 = m,
        TableData 5108 = m,
        TableData 5110 = m,
        TableData 5745 = m,
        TableData 5747 = m,
        TableData 5991 = m,
        TableData 5993 = m,
        TableData 5995 = m,
        TableData 6651 = m,
        TableData 6661 = m;
    ProcessingOnly = true;

    // UsageCategory = ReportsAndAnalysis;
    // ApplicationArea = All;
    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = where("Item Category Code" = filter(<> ''));
            RequestFilterFields = "No.", "Item Category Code";

            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Item No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Item No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Return Shipment Line"; "Return Shipment Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            dataitem("Return Receipt Line"; "Return Receipt Line")
            {
                DataItemTableView = where(Type = const(Item));
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord();
                begin
                    "Item Category Code" := Item."Item Category Code";
                    MODIFY;
                    i += 1;
                end;
            }
            trigger OnPreDataItem();
            begin
                If COUNT = 0 then Error(StrSubstNo('No records found in %1.', UPPERCASE(TableCaption)));
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

                    field(Code_ItemCategory__; ItemCategory.Code)
                    {
                        CaptionML = ENU = 'From Item Category Code', ENA = 'From Item Category Code';
                        TableRelation = "Item Category";
                        ApplicationArea = All;
                    }
                    field(Code_ItemCategory2__; ItemCategory2.Code)
                    {
                        CaptionML = ENU = 'To Item Category Code', ENA = 'To Item Category Code';
                        TableRelation = "Item Category";
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

    var
        ItemCategory: Record "Item Category";
        ItemCategory2: Record "Item Category";
        i: Integer;
}
