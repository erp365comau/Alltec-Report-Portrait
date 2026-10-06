report 70221 "ADES_Prod. Purch. By Ven. Inv."
{
    // Austral Sugeevan 20/01/2021 >>> Designed Report
    CaptionML = ENU = 'Product Purchase By Vendor Invoice for Purchases', ENA = 'Product Purchase By Vendor Invoice for Purchases';
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70221.ADES_ProductPurchaseByVendorInvoiceForPurchases.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Permissions = tabledata Vendor=r;

    dataset
    {
        dataitem(VendorFilter; Vendor)
        {
            DataItemTableView = sorting("No.");

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemTableView = WHERE(Type=CONST(Item));
                DataItemLink = "Buy-from Vendor No."=field("No.");
                RequestFilterFields = "No.", "Buy-from Vendor No.", "Document No.", "Posting Date";

                column(PostingDate_PurchInvLine__; "Posting Date")
                {
                }
                column(DocumentNo_PurchInvLine__; "Document No.")
                {
                }
                column(VendorInvoiceNo_PurchInvHeader__; PurchInvHeader."Vendor Invoice No.")
                {
                }
                column(BuyfromVendorNo_PurchInvHeader__; PurchInvHeader."Buy-from Vendor No.")
                {
                }
                column(BuyfromVendorName_PurchInvHeader__; PurchInvHeader."Buy-from Vendor Name")
                {
                }
                column(VendorPostingGroup_PurchInvHeader__; PurchInvHeader."Vendor Posting Group")
                {
                }
                column(No_PurchInvLine__; "No.")
                {
                }
                column(Description_PurchInvLine__; Description)
                {
                }
                column(ItemCategoryCode_PurchInvLine__; "Item Category Code")
                {
                }
                column(Quantity_PurchInvLine__; Quantity)
                {
                }
                column(UOM_PurchInvLine__; "Unit of Measure")
                {
                }
                column(DirectUnitCost_PurchInvLine__; "Direct Unit Cost")
                {
                }
                column(LineAmount_PurchInvLine__; "Line Amount")
                {
                }
                column(CompanyName__; COMPANYNAME)
                {
                }
                column(Filters__; GETFILTERS)
                {
                }
                column(LineNo_PurchInvLine__; "Line No.")
                {
                }
                trigger OnAfterGetRecord();
                begin
                    IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Buy-from Vendor No.", "Document No.")THEN BEGIN
                        TempInvtBuffer.INIT;
                        TempInvtBuffer."Item No.":="No.";
                        TempInvtBuffer."Lot No.":="Buy-from Vendor No.";
                        TempInvtBuffer."Serial No.":="Document No.";
                        TempInvtBuffer.INSERT;
                    END
                    ELSE
                        CurrReport.SKIP;
                    if not PurchInvHeader.Get("Document No.")then Clear(PurchInvHeader);
                end;
                trigger OnPreDataItem()
                begin
                end;
            }
            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                DataItemTableView = WHERE(Type=CONST(Item));
                DataItemLink = "Buy-from Vendor No."=field("No.");
                RequestFilterFields = "No.", "Buy-from Vendor No.", "Document No.", "Posting Date";

                column(PostingDate_PurchCrMemoLine__; "Posting Date")
                {
                }
                column(DocumentNo_PurchCrMemoLine__; "Document No.")
                {
                }
                column(VendorCrMemoNo_PurchInvHdr__; PurchCrMemoHdr."Vendor Cr. Memo No.")
                {
                }
                column(BuyfromVendorNo_PurchCrMemoHdr__; PurchCrMemoHdr."Buy-from Vendor No.")
                {
                }
                column(BuyfromVendorName_PurchCrMemoHdr__; PurchCrMemoHdr."Buy-from Vendor Name")
                {
                }
                column(VendorPostingGroup_PurchCrMemoHdr__; PurchCrMemoHdr."Vendor Posting Group")
                {
                }
                column(No_PurchCrMemoLine__; "No.")
                {
                }
                column(Description_PurchCrMemoLine__; Description)
                {
                }
                column(ItemCategoryCode_PurchCrMemoLine__; "Item Category Code")
                {
                }
                column(Quantity_PurchCrMemoLine__; Quantity)
                {
                }
                column(UOM_PurchCrMemoLine__; "Unit of Measure")
                {
                }
                column(DirectUnitCost_PurchCrMemoLine__; "Direct Unit Cost")
                {
                }
                column(LineAmount_PurchCrMemoLine__; "Line Amount")
                {
                }
                column(LineNo_PurchCrMemoLine__; "Line No.")
                {
                }
                trigger OnAfterGetRecord();
                begin
                    IF NOT TempInvtBuffer.GET("No.", '', 0, '', '', "Buy-from Vendor No.", "Document No.")THEN BEGIN
                        TempInvtBuffer.INIT;
                        TempInvtBuffer."Item No.":="No.";
                        TempInvtBuffer."Lot No.":="Buy-from Vendor No.";
                        TempInvtBuffer."Serial No.":="Document No.";
                        TempInvtBuffer.INSERT;
                    END
                    ELSE
                        CurrReport.SKIP;
                    if not PurchCrMemoHdr.Get("Document No.")then Clear(PurchCrMemoHdr);
                end;
                trigger OnPreDataItem()
                begin
                    TempInvtBuffer.Reset;
                    TempInvtBuffer.DeleteAll;
                end;
            }
            dataitem(Total; Integer)
            {
                DataItemTableView = sorting(Number)WHERE(Number=CONST(1));
            }
            trigger OnPreDataItem()
            begin
                if UserSetup.Get(UserId)then begin
                    if UserSetup."EN Salesperson Code" <> '' then SetFilter("Purchaser Code", UserSetup."EN Salesperson Code");
                    if UserSetup."ADES_Location Code" <> '' then SetFilter("Location Code", UserSetup."ADES_Location Code");
                    if UserSetup."EN County" <> '' then SetFilter(County, UserSetup."EN County");
                end;
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
    trigger OnPreReport()
    begin
        if("Purch. Inv. Line".GetFilter("Posting Date") = '') OR ("Purch. Cr. Memo Line".GetFilter("Posting Date") = '')then if not Confirm('No filters applied for date. Do you want to proceed?')then CurrReport.Quit;
    end;
    var PurchInvHeader: Record "Purch. Inv. Header";
    TempInvtBuffer: Record 307 temporary;
    PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
    UserSetup: Record "User Setup";
}
