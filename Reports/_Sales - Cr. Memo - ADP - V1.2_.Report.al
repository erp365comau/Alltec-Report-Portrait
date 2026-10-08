report 70216 "Sales - Cr. Memo - ADP - V1.2"
{
    // <changelog>
    //     <change id="AP0090" dev="AUGMENTUM" date="2008-05-23" area="Sales Marketing"
    //      baseversion="AP4.00.01" releaseversion="AP6.00" feature="NAVCORS22794">
    //      Report Transformation.
    //     </change>
    // </changelog>
    // 
    // Austral Standard
    // AD7.00
    // -- cloned from Report No. 207 "Sales Credit Memo" Version NAVW17.00,NAVAPAC7.00
    // 
    // Austral Sugeevan 27/07/2020 >>> Mods
    // J14924 20201002 LK - LAYOUT CHANGES
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70216.ADES_SalesCrMemo_AD_PV1.2.rdl';
    Caption = 'Sales - Credit Memo - AD';
    Permissions = TableData "Sales Shipment Buffer" = rimd;

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Credit Memo';

            column(No_SalesCrMemoHeader; "No.")
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EmailIdCaption; EmailIdCaptionLbl)
            {
            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);

                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                    column(DocumentCaptionCopyText; StrSubstNo(DocumentCaption, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoVATRegsNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesCrMemoHdr; "Sales Cr.Memo Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostingDate_SalesCrMemoHdr; Format("Sales Cr.Memo Header"."Posting Date"))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesCrMemoHdr; "Sales Cr.Memo Header"."VAT Registration No.")
                    {
                    }
                    column(No1_SalesCrMemoHdr; "Sales Cr.Memo Header"."No.")
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(AppliedToText; AppliedToText)
                    {
                    }
                    column(RefText; ReferenceText)
                    {
                    }
                    column(YourRef_SalesCrMemoHdr; "Sales Cr.Memo Header"."Your Reference")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompAddr6; CompanyAddr[6])
                    {
                    }
                    column(DocDate_SalesCrMemoHdr; Format("Sales Cr.Memo Header"."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                    {
                    }
                    column(PrsInclVAT_SalesCrMemoHrd; "Sales Cr.Memo Header"."Prices Including VAT")
                    {
                    }
                    column(ReturnOrderNoText; ReturnOrderNoText)
                    {
                    }
                    column(RetrnOrdNo_SalesCrMemoHrd; "Sales Cr.Memo Header"."Return Order No.")
                    {
                    }
                    column(PageCaption; StrSubstNo(Text006, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVAT_SalesCrMemoHdr; Format("Sales Cr.Memo Header"."Prices Including VAT"))
                    {
                    }
                    column(VATBaseDiscPct_SalesCrMemoHdr; "Sales Cr.Memo Header"."VAT Base Discount %")
                    {
                    }
                    column(GSTEnabled; GSTEnabled)
                    {
                    }
                    column(CompanyInfoABNDivisionPartNo; CompanyInfo."ABN Division Part No.")
                    {
                    }
                    column(CompanyInfoABN; CompanyInfo.ABN)
                    {
                    }
                    column(ReasonCode_SalesCrMemoHdr; "Sales Cr.Memo Header"."Reason Code")
                    {
                    }
                    column(OriginalInvDt; Format(SalesInvoiceHeader."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccountNoCaption; BankAccountNoCaptionLbl)
                    {
                    }
                    column(CrMemoNoCaption; CrMemoNoCaptionLbl)
                    {
                    }
                    column(DivPartNoCaption; DivPartNoCaptionLbl)
                    {
                    }
                    column(ABNCaption; ABNCaptionLbl)
                    {
                    }
                    column(ReasonCodeCaption; ReasonCodeCaptionLbl)
                    {
                    }
                    column(OriginalInvoiceNoCaption; OriginalInvoiceNoCaptionLbl)
                    {
                    }
                    column(OriginalInvoiceDateCaption; OriginalInvoiceDateCaptionLbl)
                    {
                    }
                    column(PostingDateCaption; PostingDateCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesCrMemoHdrCaption; "Sales Cr.Memo Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PrsInclVAT_SalesCrMemoHrdCaption; "Sales Cr.Memo Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    column(CompanyInfo_FaxNo__; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfo_Email__; CompanyInfo."E-Mail")
                    {
                    }
                    column(RVCustomer_PhoneNo__; RVCustomer."Phone No.")
                    {
                    }
                    column(RVCustomer_FaxNo__; RVCustomer."Fax No.")
                    {
                    }
                    column(ShiptoAddr_1__; ShipToAddr[1])
                    {
                    }
                    column(ShiptoAddr_2__; ShipToAddr[2])
                    {
                    }
                    column(ShiptoAddr_3__; ShipToAddr[3])
                    {
                    }
                    column(ShiptoAddr_4__; ShipToAddr[4])
                    {
                    }
                    column(ShiptoAddr_5__; ShipToAddr[5])
                    {
                    }
                    column(CompanyInfo_BAnkBranchNo__; CompanyInfo."Bank Branch No.")
                    {
                    }
                    column(CompanyInfo_SwiftCode__; CompanyInfo."SWIFT Code")
                    {
                    }
                    column(Name_CompanyInfo__; CompanyInfo.Name)
                    {
                    }
                    column(Address_CompanyInfo__; CompanyInfo.Address)
                    {
                    }
                    column(Address2_CompanyInfo__; CompanyInfo."Address 2")
                    {
                    }
                    column(City__CompanyInfo__; CompanyInfo.City)
                    {
                    }
                    column(County_CompanyInfo__; CompanyInfo.County)
                    {
                    }
                    column(PostCode_CompanyInfo__; CompanyInfo."Post Code")
                    {
                    }
                    column(DocumentNo_TempSalesShptLine__; TempSalesShptLine."Document No.")
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                        column(DimText; DimText)
                        {
                        }
                        column(Number_IntegerLine; DimensionLoop1.Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindFirst then CurrReport.Break;
                            end
                            else if not Continue then CurrReport.Break;
                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText := StrSubstNo('%1, %2 %3', DimText, DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until (DimSetEntry1.Next = 0);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then CurrReport.Break;
                        end;
                    }
                    dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");

                        column(LineAmt_SalesCrMemoLine; "Line Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesCrMemoLine; Description)
                        {
                        }
                        column(No_SalesCrMemoLine; "No.")
                        {
                        }
                        column(Qty_SalesCrMemoLine; Quantity)
                        {
                        }
                        column(UnitofMeas_SalesCrMemoLine; "Unit of Measure Code")
                        {
                        }
                        column(UnitPrice_SalesCrMemoLine; "Unit Price")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(LineDisc_SalesCrMemoLine; "Line Discount %")
                        {
                        }
                        column(VATIndt_SalesCrMemoLine; "VAT Identifier")
                        {
                        }
                        column(PostRecpDt_SalesCrMemoLine; Format(PostedReceiptDate))
                        {
                        }
                        column(Type_SalesCrMemoLine; Format(Type))
                        {
                        }
                        column(NNCTotLineAmt_SalesCrMemoLine; NNC_TotalLineAmount)
                        {
                        }
                        column(TotalAmountInclVAT2__; TotalAmountInclVAT2)
                        {
                        }
                        column(InvDiscAmt_SalesCrMemoLine; NNC_TotalInvDiscAmount)
                        {
                        }
                        column(TotalAmount2__; TotalAmount2)
                        {
                        }
                        column(TotalText_SalesCrMemoLine; TotalText)
                        {
                        }
                        column(Amt_SalesCrMemoLine; Amount)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(ExclVATText_SalesCrMemoLine; TotalExclVATText)
                        {
                        }
                        column(InclVATText_SalesCrMemoLine; TotalInclVATText)
                        {
                        }
                        column(AmtInclVAT_SalesCrMemoLn; "Amount Including VAT")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtIncludeVATAmt_SalesCrMemoLine; "Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtText_SalesCrMemoLine; VATAmountLine.VATAmountText)
                        {
                        }
                        column(CurrFactor_SalesCrMemoHrd; "Sales Cr.Memo Header"."Currency Factor")
                        {
                        }
                        column(InclVATLCY_SalesCrMemoLine; TotalInclVATTextLCY)
                        {
                        }
                        column(ExclVATLCY_SalesCrMemoLine; TotalExclVATTextLCY)
                        {
                        }
                        column(IncAmtLCY_SalesCrMemoLine; AmountIncLCY - AmountLCY)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtIncLCY_SalesCrMemoLine; AmountIncLCY)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtLCY_SalesCrMemoLine; AmountLCY)
                        {
                            AutoFormatExpression = "Sales Cr.Memo Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(CurrCodeLCY_SalesCrMemoLine; CurrencyCodeLCY)
                        {
                        }
                        column(AmtLangB_SalesCrMemoLine; AmountLangB[1] + ' ' + AmountLangB[2])
                        {
                            AutoFormatType = 1;
                        }
                        column(AmtLangA_SalesCrMemoLine; AmountLangA[1] + ' ' + AmountLangA[2])
                        {
                            AutoFormatType = 1;
                        }
                        column(AmtInWords_SalesCrMemoLine; AmountInWords)
                        {
                        }
                        column(LineNo_SalesCrMemoLine; "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(DiscountCaption; DiscountCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(PostedReceiptDateCaption; PostedReceiptDateCaptionLbl)
                        {
                        }
                        column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscountonVAT; PaymentDiscountonVATLbl)
                        {
                        }
                        column(ExchangeRateCaption; ExchangeRateCaptionLbl)
                        {
                        }
                        column(Desc_SalesCrMemoLineCaption; FieldCaption(Description))
                        {
                        }
                        column(No_SalesCrMemoLineCaption; FieldCaption("No."))
                        {
                        }
                        column(Qty_SalesCrMemoLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UnitofMeas_SalesCrMemoLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIndt_SalesCrMemoLineCaption; FieldCaption("VAT Identifier"))
                        {
                        }
                        column(TotalAmountVAT2__; TotalAmountVAT2)
                        {
                        }
                        dataitem("Sales Shipment Buffer"; "Integer")
                        {
                            DataItemTableView = SORTING(Number);

                            column(SalesShipmentBufferQty; SalesShipmentBuffer.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    SalesShipmentBuffer.Find('-')
                                else
                                    SalesShipmentBuffer.Next;
                            end;

                            trigger OnPreDataItem()
                            begin
                                SetRange(Number, 1, SalesShipmentBuffer.Count);
                            end;
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                            column(DimText2; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }
                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.Find('-') then CurrReport.Break;
                                end
                                else if not Continue then CurrReport.Break;
                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText := StrSubstNo('%1, %2 %3', DimText, DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until (DimSetEntry2.Next = 0);
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then CurrReport.Break;
                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Cr.Memo Line"."Dimension Set ID");
                            end;
                        }
                        trigger OnAfterGetRecord()
                        begin
                            NNC_TotalLineAmount += "Line Amount";
                            NNC_TotalAmountInclVat += "Amount Including VAT";
                            NNC_TotalInvDiscAmount += "Inv. Discount Amount";
                            NNC_TotalAmount += Amount;
                            SalesShipmentBuffer.DeleteAll;
                            PostedReceiptDate := 0D;
                            if Quantity <> 0 then PostedReceiptDate := FindPostedShipmentDate;
                            if (Type = Type::"G/L Account") and (not ShowInternalInfo) then "No." := '';
                            if "VAT %" <> 0 then begin
                                VATAmountLine.Init;
                                VATAmountLine."VAT Identifier" := "VAT Identifier";
                                VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                                VATAmountLine."Tax Group Code" := "Tax Group Code";
                                VATAmountLine."VAT %" := "VAT %";
                                VATAmountLine."VAT Base" := Amount;
                                VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                                VATAmountLine."Line Amount" := "Line Amount";
                                if "Allow Invoice Disc." then VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                                VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                                VATAmountLine.InsertLine;
                            end;
                        end;

                        trigger OnPreDataItem()
                        var
                            SalesCreditLineL: Record "Sales Cr.Memo Line";
                        begin
                            VATAmountLine.DeleteAll;
                            SalesShipmentBuffer.Reset;
                            SalesShipmentBuffer.DeleteAll;
                            FirstValueEntryNo := 0;
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do MoreLines := Next(-1) <> 0;
                            if not MoreLines then CurrReport.Break;
                            SetRange("Line No.", 0, "Line No.");
                            CurrReport.CreateTotals(Amount, "Amount Including VAT", "Inv. Discount Amount");
                            // AP0090.begin
                            CurrencyCodeLCY := ("Sales Cr.Memo Header"."Currency Code" <> '') and CurrencyLCY;
                            // AP0090.end
                            //Austral Sugeevan 06/02/2017 >>>
                            TotalAmount2 := 0;
                            TotalAmountInclVAT2 := 0;
                            SalesCreditLineL.SetRange("Document No.", "Document No.");
                            if SalesCreditLineL.FindSet then
                                repeat
                                    TotalAmount2 += SalesCreditLineL.Amount;
                                    TotalAmountInclVAT2 += SalesCreditLineL."Amount Including VAT";
                                until SalesCreditLineL.Next = 0;
                            TotalAmountVAT2 := TotalAmountInclVAT2 - TotalAmount2;
                            //Austral Sugeevan 06/02/2017 <<<
                        end;
                    }
                    dataitem("Sales Comment Line"; "Sales Comment Line")
                    {
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemTableView = where("Document Type" = CONST("Posted Credit Memo"), "Document Line No." = CONST(0));
                        DataItemLink = "No." = FIELD("No.");

                        column(Comment_SalesCommentLine__; Comment)
                        {
                        }
                        column(LineNo_SalesCommentLine__; "Line No.")
                        {
                        }
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);

                        column(VATBase_VATAmtLine; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmt_VATAmtLine; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_VATAmtLine; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvDiscBaseAmt_VATAmtLine; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvoiceDiscAmt_VATAmtLine; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VAT_VATAmtLine; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_VATAmtLine; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATPercentageCaption; VATPercentageCaptionLbl)
                        {
                        }
                        column(VATBaseCaption; VATBaseCaptionLbl)
                        {
                        }
                        column(VATAmountCaption; VATAmountCaptionLbl)
                        {
                        }
                        column(VATAmountSpecCaption; VATAmountSpecCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(InvDiscBaseAmountCaption; InvDiscBaseAmountCaptionLbl)
                        {
                        }
                        column(LineAmountCaption; LineAmountCaptionLbl)
                        {
                        }
                        column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if VATAmountLine.GetTotalVATAmount = 0 then CurrReport.Break;
                            SetRange(Number, 1, VATAmountLine.Count);
                            CurrReport.CreateTotals(VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount", VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);

                        column(VALSpecLCYHrd; VALSpecLCYHeader)
                        {
                        }
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALVATAmtLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(ContinuedCaption; ContinuedCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY := Round(VATAmountLine."VAT Base" / "Sales Cr.Memo Header"."Currency Factor");
                            VALVATAmountLCY := Round(VATAmountLine."VAT Amount" / "Sales Cr.Memo Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or ("Sales Cr.Memo Header"."Currency Code" = '') or (VATAmountLine.GetTotalVATAmount = 0) then CurrReport.Break;
                            SetRange(Number, 1, VATAmountLine.Count);
                            CurrReport.CreateTotals(VALVATBaseLCY, VALVATAmountLCY);
                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text008 + Text009
                            else
                                VALSpecLCYHeader := Text008 + Format(GLSetup."LCY Code");
                            CurrExchRate.FindCurrency("Sales Cr.Memo Header"."Posting Date", "Sales Cr.Memo Header"."Currency Code", 1);
                            CalculatedExchRate := Round(1 / "Sales Cr.Memo Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := StrSubstNo(Text010, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                        column(SelltoCustNo_SalesCrMemoHdr; "Sales Cr.Memo Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesCrMemoHdrCaption; "Sales Cr.Memo Header".FieldCaption("Sell-to Customer No."))
                        {
                        }
                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then CurrReport.Break;
                        end;
                    }
                    trigger OnPreDataItem()
                    begin
                        // AP0090.begin
                        GSTEnabled := GLSetup.GSTEnabled(SalesInvHeader."Document Date");
                        // AP0090.end
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    CurrReport.PageNo := 1;
                    if Number > 1 then begin
                        CopyText := Text004;
                        OutputNo += 1;
                    end;
                    NNC_TotalLineAmount := 0;
                    NNC_TotalAmountInclVat := 0;
                    NNC_TotalInvDiscAmount := 0;
                    NNC_TotalAmount := 0;
                end;

                trigger OnPostDataItem()
                begin
                    if not CurrReport.Preview then SalesCrMemoCountPrinted.Run("Sales Cr.Memo Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }
            trigger OnAfterGetRecord();
            var
                SalesInvoiceLine: Record "Sales Invoice Line";
            begin
                //CurrReport.Language := Language.GetLanguageID("Language Code");
                CompanyInfo.Get;
                /*
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                  FormatAddr.RespCenter(CompanyAddr,RespCenter);
                  CompanyInfo."Phone No." := RespCenter."Phone No.";
                  CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                  FormatAddr.Company(CompanyAddr,CompanyInfo);
                */
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
                if "Return Order No." = '' then
                    ReturnOrderNoText := ''
                else
                    ReturnOrderNoText := FieldCaption("Return Order No.");
                if "Salesperson Code" = '' then begin
                    SalesPurchPerson.Init;
                    SalesPersonText := '';
                end
                else begin
                    SalesPurchPerson.Get("Salesperson Code");
                    SalesPersonText := Text000;
                end;
                if "Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := FieldCaption("Your Reference");
                if "VAT Registration No." = '' then
                    VATNoText := ''
                else
                    VATNoText := FieldCaption("VAT Registration No.");
                if "Currency Code" = '' then begin
                    GLSetup.TestField("LCY Code");
                    TotalText := StrSubstNo(Text001, GLSetup."LCY Code");
                    TotalInclVATText := StrSubstNo(Text002, GLSetup."LCY Code");
                    TotalExclVATText := StrSubstNo(Text007, GLSetup."LCY Code");
                end
                else begin
                    TotalText := StrSubstNo(Text001, "Currency Code");
                    TotalInclVATText := StrSubstNo(Text002, "Currency Code");
                    TotalExclVATText := StrSubstNo(Text007, "Currency Code");
                    TotalInclVATTextLCY := StrSubstNo(Text002, GLSetup."LCY Code");
                    TotalExclVATTextLCY := StrSubstNo(Text007, GLSetup."LCY Code");
                end;
                FormatAddr.SalesCrMemoBillTo(CustAddr, "Sales Cr.Memo Header");
                if "Applies-to Doc. No." = '' then
                    AppliedToText := ''
                else if GLSetup.GSTEnabled(SalesInvHeader."Document Date") then begin
                    AppliedToText := "Applies-to Doc. No.";
                    if SalesInvHeader.Get("Adjustment Applies-to") then
                        OriginalInvDate := SalesInvHeader."Document Date"
                    else
                        OriginalInvDate := 0D;
                end
                else
                    //AppliedToText := StrSubstNo(Text003, "Applies-to Doc. Type", "Applies-to Doc. No.");
                    AppliedToText := "Applies-to Doc. No.";
                //Austral Sugeevan 16/02/2017 >>>
                /*
                FormatAddr.SalesCrMemoShipTo(ShipToAddr,"Sales Cr.Memo Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                  IF ShipToAddr[i] <> CustAddr[i] THEN
                    ShowShippingAddr := TRUE;
                */
                ShowShippingAddr := FormatAddr.SalesCrMemoShipTo(ShipToAddr, CustAddr, "Sales Cr.Memo Header");
                //Austral Sugeevan 16/02/2017 <<<
                CalcFields(Amount);
                CalcFields("Amount Including VAT");
                AmountLCY := Round(CurrExchRate.ExchangeAmtFCYToLCY(WorkDate, "Currency Code", Amount, "Currency Factor"));
                AmountIncLCY := Round(CurrExchRate.ExchangeAmtFCYToLCY(WorkDate, "Currency Code", "Amount Including VAT", "Currency Factor"));
                SalesLine.InitTextVariable;
                SalesLine.FormatNoText(AmountLangA, "Amount Including VAT", "Currency Code");
                if ShowTHFormatting then begin
                    SalesLine.InitTextVariableTH;
                    SalesLine.FormatNoTextTH(AmountLangB, "Amount Including VAT", "Currency Code");
                end
                else begin
                    AmountLangB[1] := '';
                    AmountLangB[2] := '';
                end;
                Clear(TempSalesShptLine);
                if SalesInvoiceHeader.get(AppliedToText) then begin
                    SalesInvoiceLine.SetRange("Document No.", SalesInvoiceHeader."No.");
                    SalesInvoiceLine.SetRange(Type, SalesInvoiceLine.Type::Item);
                    if SalesInvoiceLine.FindFirst then begin
                        SalesInvoiceLine.GetSalesShptLines(TempSalesShptLine);
                        TempSalesShptLine.Reset;
                        if TempSalesShptLine.FindFirst then;
                    end;
                end
                else
                    Clear(SalesInvoiceHeader);
                if LogInteraction then
                    if not CurrReport.Preview then
                        if "Bill-to Contact No." <> '' then
                            SegManagement.LogDocument(6, "No.", 0, 0, DATABASE::Contact, "Bill-to Contact No.", "Salesperson Code", "Campaign No.", "Posting Description", '')
                        else
                            SegManagement.LogDocument(6, "No.", 0, 0, DATABASE::Customer, "Sell-to Customer No.", "Salesperson Code", "Campaign No.", "Posting Description", '');
                //Sugeevan
                RVCustomer.Reset;
                if RVCustomer.Get("Bill-to Customer No.") then;
                //Sugeevan
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                        applicationArea = All;
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                        applicationArea = All;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        applicationArea = All;
                    }
                    field(AmountInWords; AmountInWords)
                    {
                        Caption = 'Show Total In Words';
                        applicationArea = All;
                    }
                    field(CurrencyLCY; CurrencyLCY)
                    {
                        Caption = 'Show LCY for FCY';
                        applicationArea = All;
                    }
                    field(ShowTHFormatting; ShowTHFormatting)
                    {
                        Caption = 'Show TH Amount In Words';
                        applicationArea = All;
                    }
                }
            }
        }
        actions
        {
        }
        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            LogInteraction := SegManagement.FindInteractionTemplateCode(6) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }
    labels
    {
    }
    trigger OnInitReport()
    begin
        GLSetup.Get;
        SalesSetup.Get;
        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                begin
                    CompanyInfo3.Get;
                    CompanyInfo3.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get;
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get;
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;
        //Sugeevan
        CompanyInfo2.Get;
        CompanyInfo2.CalcFields(Picture);
        //Sugeevan
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then InitLogInteraction;
    end;

    var
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label '(Applies to %1 %2)';
        Text004: Label 'COPY';
        Text005: Label 'Credit Note %1';
        Text006: Label 'Page %1';
        Text007: Label 'Total %1 Excl. VAT';
        GLSetup: Record "General Ledger Setup";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        //   Language: Record Language;
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        CurrExchRate: Record "Currency Exchange Rate";
        SalesCrMemoCountPrinted: Codeunit "Sales Cr. Memo-Printed";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        RespCenter: Record "Responsibility Center";
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        ReturnOrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        AppliedToText: Text[40];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        FirstValueEntryNo: Integer;
        PostedReceiptDate: Date;
        NextEntryNo: Integer;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        Text008: Label 'VAT Amount Specification in ';
        Text009: Label 'Local Currency';
        Text010: Label 'Exchange rate: %1/%2';
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        CalculatedExchRate: Decimal;
        Text011: Label 'Sales - Prepmt. Credit Memo %1';
        OutputNo: Integer;
        NNC_TotalLineAmount: Decimal;
        NNC_TotalAmountInclVat: Decimal;
        NNC_TotalInvDiscAmount: Decimal;
        NNC_TotalAmount: Decimal;
        TotalInclVATTextLCY: Text[50];
        TotalExclVATTextLCY: Text[50];
        AmountLCY: Decimal;
        AmountIncLCY: Decimal;
        CheckReport: Report Check;
        AmountLangA: array[2] of Text[80];
        AmountLangB: array[2] of Text[80];
        CurrencyLCY: Boolean;
        AmountInWords: Boolean;
        SalesLine: Record "Sales Line";
        ShowTHFormatting: Boolean;
        SalesInvHeader: Record "Sales Invoice Header";
        OriginalInvDate: Date;
        GSTEnabled: Boolean;
        CurrencyCodeLCY: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccountNoCaptionLbl: Label 'Account No.';
        CrMemoNoCaptionLbl: Label 'Credit Memo No.';
        DivPartNoCaptionLbl: Label 'Division Part No.';
        ABNCaptionLbl: Label 'ABN';
        ReasonCodeCaptionLbl: Label 'Reason Code';
        OriginalInvoiceNoCaptionLbl: Label 'Original Invoice No.';
        OriginalInvoiceDateCaptionLbl: Label 'Original Invoice Date';
        PostingDateCaptionLbl: Label 'Posting Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscountCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        PostedReceiptDateCaptionLbl: Label 'Posted Return Receipt Date';
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscountonVATLbl: Label 'Payment Discount on VAT';
        ExchangeRateCaptionLbl: Label 'Exchange Rate';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATPercentageCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATAmountSpecCaptionLbl: Label 'VAT Amount Specification';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        InvDiscBaseAmountCaptionLbl: Label 'Invoice Discoune Base Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        ContinuedCaptionLbl: Label 'Continued';
        TotalCaptionLbl: Label 'Total';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        HomePageCaptionLbl: Label 'Home Page';
        EmailIdCaptionLbl: Label 'E-Mail';
        DocDateCaptionLbl: Label 'Document Date';
        RVCustomer: Record Customer;
        TotalAmount2: Decimal;
        TotalAmountInclVAT2: Decimal;
        TotalAmountVAT2: Decimal;
        TempSalesShptLine: Record "Sales Shipment Line" temporary;
        SalesInvoiceHeader: Record "Sales Invoice Header";

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Sales Cr. Memo") <> '';
    end;

    procedure FindPostedShipmentDate(): Date
    var
        ReturnReceiptHeader: Record "Return Receipt Header";
        SalesShipmentBuffer2: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        if "Sales Cr.Memo Line"."Return Receipt No." <> '' then if ReturnReceiptHeader.Get("Sales Cr.Memo Line"."Return Receipt No.") then exit(ReturnReceiptHeader."Posting Date");
        if "Sales Cr.Memo Header"."Return Order No." = '' then exit("Sales Cr.Memo Header"."Posting Date");
        case "Sales Cr.Memo Line".Type of
            "Sales Cr.Memo Line".Type::Item:
                GenerateBufferFromValueEntry("Sales Cr.Memo Line");
            "Sales Cr.Memo Line".Type::"G/L Account", "Sales Cr.Memo Line".Type::Resource, "Sales Cr.Memo Line".Type::"Charge (Item)", "Sales Cr.Memo Line".Type::"Fixed Asset":
                GenerateBufferFromShipment("Sales Cr.Memo Line");
            "Sales Cr.Memo Line".Type::" ":
                exit(0D);
        end;
        SalesShipmentBuffer.Reset;
        SalesShipmentBuffer.SetRange("Document No.", "Sales Cr.Memo Line"."Document No.");
        SalesShipmentBuffer.SetRange("Line No.", "Sales Cr.Memo Line"."Line No.");
        if SalesShipmentBuffer.Find('-') then begin
            SalesShipmentBuffer2 := SalesShipmentBuffer;
            if SalesShipmentBuffer.Next = 0 then begin
                SalesShipmentBuffer.Get(SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                SalesShipmentBuffer.Delete;
                exit(SalesShipmentBuffer2."Posting Date");
            end;
            SalesShipmentBuffer.CalcSums(Quantity);
            if SalesShipmentBuffer.Quantity <> "Sales Cr.Memo Line".Quantity then begin
                SalesShipmentBuffer.DeleteAll;
                exit("Sales Cr.Memo Header"."Posting Date");
            end;
        end
        else
            exit("Sales Cr.Memo Header"."Posting Date");
    end;

    procedure GenerateBufferFromValueEntry(SalesCrMemoLine2: Record "Sales Cr.Memo Line")
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesCrMemoLine2."Quantity (Base)";
        ValueEntry.SetCurrentKey("Document No.");
        ValueEntry.SetRange("Document No.", SalesCrMemoLine2."Document No.");
        ValueEntry.SetRange("Posting Date", "Sales Cr.Memo Header"."Posting Date");
        ValueEntry.SetRange("Item Charge No.", '');
        ValueEntry.SetFilter("Entry No.", '%1..', FirstValueEntryNo);
        if ValueEntry.Find('-') then
            repeat
                if ItemLedgerEntry.Get(ValueEntry."Item Ledger Entry No.") then begin
                    if SalesCrMemoLine2."Qty. per Unit of Measure" <> 0 then
                        Quantity := ValueEntry."Invoiced Quantity" / SalesCrMemoLine2."Qty. per Unit of Measure"
                    else
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(SalesCrMemoLine2, -Quantity, ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity - ValueEntry."Invoiced Quantity";
                end;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            until (ValueEntry.Next = 0) or (TotalQuantity = 0);
    end;

    procedure GenerateBufferFromShipment(SalesCrMemoLine: Record "Sales Cr.Memo Line")
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesCrMemoLine2: Record "Sales Cr.Memo Line";
        ReturnReceiptHeader: Record "Return Receipt Header";
        ReturnReceiptLine: Record "Return Receipt Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesCrMemoHeader.SetCurrentKey("Return Order No.");
        SalesCrMemoHeader.SetFilter("No.", '..%1', "Sales Cr.Memo Header"."No.");
        SalesCrMemoHeader.SetRange("Return Order No.", "Sales Cr.Memo Header"."Return Order No.");
        if SalesCrMemoHeader.Find('-') then
            repeat
                SalesCrMemoLine2.SetRange("Document No.", SalesCrMemoHeader."No.");
                SalesCrMemoLine2.SetRange("Line No.", SalesCrMemoLine."Line No.");
                SalesCrMemoLine2.SetRange(Type, SalesCrMemoLine.Type);
                SalesCrMemoLine2.SetRange("No.", SalesCrMemoLine."No.");
                SalesCrMemoLine2.SetRange("Unit of Measure Code", SalesCrMemoLine."Unit of Measure Code");
                if SalesCrMemoLine2.Find('-') then
                    repeat
                        TotalQuantity := TotalQuantity + SalesCrMemoLine2.Quantity;
                    until SalesCrMemoLine2.Next = 0;
            until SalesCrMemoHeader.Next = 0;
        ReturnReceiptLine.SetCurrentKey("Return Order No.", "Return Order Line No.");
        ReturnReceiptLine.SetRange("Return Order No.", "Sales Cr.Memo Header"."Return Order No.");
        ReturnReceiptLine.SetRange("Return Order Line No.", SalesCrMemoLine."Line No.");
        ReturnReceiptLine.SetRange("Line No.", SalesCrMemoLine."Line No.");
        ReturnReceiptLine.SetRange(Type, SalesCrMemoLine.Type);
        ReturnReceiptLine.SetRange("No.", SalesCrMemoLine."No.");
        ReturnReceiptLine.SetRange("Unit of Measure Code", SalesCrMemoLine."Unit of Measure Code");
        ReturnReceiptLine.SetFilter(Quantity, '<>%1', 0);
        if ReturnReceiptLine.Find('-') then
            repeat
                if "Sales Cr.Memo Header"."Get Return Receipt Used" then CorrectShipment(ReturnReceiptLine);
                if Abs(ReturnReceiptLine.Quantity) <= Abs(TotalQuantity - SalesCrMemoLine.Quantity) then
                    TotalQuantity := TotalQuantity - ReturnReceiptLine.Quantity
                else begin
                    if Abs(ReturnReceiptLine.Quantity) > Abs(TotalQuantity) then ReturnReceiptLine.Quantity := TotalQuantity;
                    Quantity := ReturnReceiptLine.Quantity - (TotalQuantity - SalesCrMemoLine.Quantity);
                    SalesCrMemoLine.Quantity := SalesCrMemoLine.Quantity - Quantity;
                    TotalQuantity := TotalQuantity - ReturnReceiptLine.Quantity;
                    if ReturnReceiptHeader.Get(ReturnReceiptLine."Document No.") then begin
                        AddBufferEntry(SalesCrMemoLine, -Quantity, ReturnReceiptHeader."Posting Date");
                    end;
                end;
            until (ReturnReceiptLine.Next = 0) or (TotalQuantity = 0);
    end;

    procedure CorrectShipment(var ReturnReceiptLine: Record "Return Receipt Line")
    var
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
    begin
        SalesCrMemoLine.SetCurrentKey("Return Receipt No.", "Return Receipt Line No.");
        SalesCrMemoLine.SetRange("Return Receipt No.", ReturnReceiptLine."Document No.");
        SalesCrMemoLine.SetRange("Return Receipt Line No.", ReturnReceiptLine."Line No.");
        if SalesCrMemoLine.Find('-') then
            repeat
                ReturnReceiptLine.Quantity := ReturnReceiptLine.Quantity - SalesCrMemoLine.Quantity;
            until SalesCrMemoLine.Next = 0;
    end;

    procedure AddBufferEntry(SalesCrMemoLine: Record "Sales Cr.Memo Line"; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        SalesShipmentBuffer.SetRange("Document No.", SalesCrMemoLine."Document No.");
        SalesShipmentBuffer.SetRange("Line No.", SalesCrMemoLine."Line No.");
        SalesShipmentBuffer.SetRange("Posting Date", PostingDate);
        if SalesShipmentBuffer.Find('-') then begin
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity - QtyOnShipment;
            SalesShipmentBuffer.Modify;
            exit;
        end;
        with SalesShipmentBuffer do begin
            Init;
            "Document No." := SalesCrMemoLine."Document No.";
            "Line No." := SalesCrMemoLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesCrMemoLine.Type;
            "No." := SalesCrMemoLine."No.";
            Quantity := -QtyOnShipment;
            "Posting Date" := PostingDate;
            Insert;
            NextEntryNo := NextEntryNo + 1
        end;
    end;

    local procedure DocumentCaption(): Text[250]
    begin
        if "Sales Cr.Memo Header"."Prepayment Credit Memo" then exit(Text011);
        exit(Text005);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewAmountInWords: Boolean; NewCurrencyLCY: Boolean; NewShowTHFormatting: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        AmountInWords := NewAmountInWords;
        CurrencyLCY := NewCurrencyLCY;
        ShowTHFormatting := NewShowTHFormatting;
    end;
}
