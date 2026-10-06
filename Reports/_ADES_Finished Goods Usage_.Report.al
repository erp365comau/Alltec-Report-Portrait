report 70205 "ADES_Finished Goods Usage"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70205.ADES_FinishedGoodsUsage.rdl';
    CaptionML = ENU = 'Finished Goods Usage', ENA = 'Finished Goods Usage';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Item Category Code", "Gen. Prod. Posting Group", "Replenishment System";

            column(No_Item; Item."No.")
            {
            }
            column(No2_Item; Item."No. 2")
            {
            }
            column(Description_Item; Item.Description)
            {
            }
            column(SearchDescription_Item; Item."Search Description")
            {
            }
            column(Description2_Item; Item."Description 2")
            {
            }
            column(AssemblyBOM_Item; Item."Assembly BOM")
            {
            }
            column(BaseUnitofMeasure_Item; Item."Base Unit of Measure")
            {
            }
            column(PriceUnitConversion_Item; Item."Price Unit Conversion")
            {
            }
            column(Type_Item; Item.Type)
            {
            }
            column(InventoryPostingGroup_Item; Item."Inventory Posting Group")
            {
            }
            column(ShelfNo_Item; Item."Shelf No.")
            {
            }
            column(ItemDiscGroup_Item; Item."Item Disc. Group")
            {
            }
            column(AllowInvoiceDisc_Item; Item."Allow Invoice Disc.")
            {
            }
            column(StatisticsGroup_Item; Item."Statistics Group")
            {
            }
            column(CommissionGroup_Item; Item."Commission Group")
            {
            }
            column(UnitPrice_Item; Item."Unit Price")
            {
            }
            column(PriceProfitCalculation_Item; Item."Price/Profit Calculation")
            {
            }
            column(Profit_Item; Item."Profit %")
            {
            }
            column(CostingMethod_Item; Item."Costing Method")
            {
            }
            column(UnitCost_Item; Item."Unit Cost")
            {
            }
            column(StandardCost_Item; Item."Standard Cost")
            {
            }
            column(LastDirectCost_Item; Item."Last Direct Cost")
            {
            }
            column(IndirectCost_Item; Item."Indirect Cost %")
            {
            }
            column(CostisAdjusted_Item; Item."Cost is Adjusted")
            {
            }
            column(AllowOnlineAdjustment_Item; Item."Allow Online Adjustment")
            {
            }
            column(VendorNo_Item; Item."Vendor No.")
            {
            }
            column(VendorItemNo_Item; Item."Vendor Item No.")
            {
            }
            column(LeadTimeCalculation_Item; Item."Lead Time Calculation")
            {
            }
            column(ReorderPoint_Item; Item."Reorder Point")
            {
            }
            column(MaximumInventory_Item; Item."Maximum Inventory")
            {
            }
            column(ReorderQuantity_Item; Item."Reorder Quantity")
            {
            }
            column(AlternativeItemNo_Item; Item."Alternative Item No.")
            {
            }
            column(UnitListPrice_Item; Item."Unit List Price")
            {
            }
            column(DutyDue_Item; Item."Duty Due %")
            {
            }
            column(DutyCode_Item; Item."Duty Code")
            {
            }
            column(GrossWeight_Item; Item."Gross Weight")
            {
            }
            column(NetWeight_Item; Item."Net Weight")
            {
            }
            column(UnitsperParcel_Item; Item."Units per Parcel")
            {
            }
            column(UnitVolume_Item; Item."Unit Volume")
            {
            }
            column(Durability_Item; Item.Durability)
            {
            }
            column(FreightType_Item; Item."Freight Type")
            {
            }
            column(TariffNo_Item; Item."Tariff No.")
            {
            }
            column(DutyUnitConversion_Item; Item."Duty Unit Conversion")
            {
            }
            column(CountryRegionPurchasedCode_Item; Item."Country/Region Purchased Code")
            {
            }
            column(BudgetQuantity_Item; Item."Budget Quantity")
            {
            }
            column(BudgetedAmount_Item; Item."Budgeted Amount")
            {
            }
            column(BudgetProfit_Item; Item."Budget Profit")
            {
            }
            column(Comment_Item; Item.Comment)
            {
            }
            column(Blocked_Item; Item.Blocked)
            {
            }
            column(CostisPostedtoGL_Item; Item."Cost is Posted to G/L")
            {
            }
            column(BlockReason_Item; Item."Block Reason")
            {
            }
            column(LastDateTimeModified_Item; Item."Last DateTime Modified")
            {
            }
            column(LastDateModified_Item; Item."Last Date Modified")
            {
            }
            column(LastTimeModified_Item; Item."Last Time Modified")
            {
            }
            column(DateFilter_Item; Item."Date Filter")
            {
            }
            column(GlobalDimension1Filter_Item; Item."Global Dimension 1 Filter")
            {
            }
            column(GlobalDimension2Filter_Item; Item."Global Dimension 2 Filter")
            {
            }
            column(LocationFilter_Item; Item."Location Filter")
            {
            }
            column(Inventory_Item; Item.Inventory)
            {
            }
            column(NetInvoicedQty_Item; Item."Net Invoiced Qty.")
            {
            }
            column(NetChange_Item; Item."Net Change")
            {
            }
            column(PurchasesQty_Item; Item."Purchases (Qty.)")
            {
            }
            column(SalesQty_Item; Item."Sales (Qty.)")
            {
            }
            column(PositiveAdjmtQty_Item; Item."Positive Adjmt. (Qty.)")
            {
            }
            column(NegativeAdjmtQty_Item; Item."Negative Adjmt. (Qty.)")
            {
            }
            column(PurchasesLCY_Item; Item."Purchases (LCY)")
            {
            }
            column(SalesLCY_Item; Item."Sales (LCY)")
            {
            }
            column(PositiveAdjmtLCY_Item; Item."Positive Adjmt. (LCY)")
            {
            }
            column(NegativeAdjmtLCY_Item; Item."Negative Adjmt. (LCY)")
            {
            }
            column(COGSLCY_Item; Item."COGS (LCY)")
            {
            }
            column(QtyonPurchOrder_Item; Item."Qty. on Purch. Order")
            {
            }
            column(QtyonSalesOrder_Item; Item."Qty. on Sales Order")
            {
            }
            column(PriceIncludesVAT_Item; Item."Price Includes VAT")
            {
            }
            column(DropShipmentFilter_Item; Item."Drop Shipment Filter")
            {
            }
            column(VATBusPostingGrPrice_Item; Item."VAT Bus. Posting Gr. (Price)")
            {
            }
            column(GenProdPostingGroup_Item; Item."Gen. Prod. Posting Group")
            {
            }
            column(Picture_Item; Item.Picture)
            {
            }
            column(TransferredQty_Item; Item."Transferred (Qty.)")
            {
            }
            column(TransferredLCY_Item; Item."Transferred (LCY)")
            {
            }
            column(CountryRegionofOriginCode_Item; Item."Country/Region of Origin Code")
            {
            }
            column(AutomaticExtTexts_Item; Item."Automatic Ext. Texts")
            {
            }
            column(NoSeries_Item; Item."No. Series")
            {
            }
            column(TaxGroupCode_Item; Item."Tax Group Code")
            {
            }
            column(VATProdPostingGroup_Item; Item."VAT Prod. Posting Group")
            {
            }
            column(Reserve_Item; Item.Reserve)
            {
            }
            column(ReservedQtyonInventory_Item; Item."Reserved Qty. on Inventory")
            {
            }
            column(ReservedQtyonPurchOrders_Item; Item."Reserved Qty. on Purch. Orders")
            {
            }
            column(ReservedQtyonSalesOrders_Item; Item."Reserved Qty. on Sales Orders")
            {
            }
            column(GlobalDimension1Code_Item; Item."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Item; Item."Global Dimension 2 Code")
            {
            }
            column(ResQtyonOutboundTransfer_Item; Item."Res. Qty. on Outbound Transfer")
            {
            }
            column(ResQtyonInboundTransfer_Item; Item."Res. Qty. on Inbound Transfer")
            {
            }
            column(ResQtyonSalesReturns_Item; Item."Res. Qty. on Sales Returns")
            {
            }
            column(ResQtyonPurchReturns_Item; Item."Res. Qty. on Purch. Returns")
            {
            }
            column(StockoutWarning_Item; Item."Stockout Warning")
            {
            }
            column(PreventNegativeInventory_Item; Item."Prevent Negative Inventory")
            {
            }
            column(CostofOpenProductionOrders_Item; Item."Cost of Open Production Orders")
            {
            }
            column(ApplicationWkshUserID_Item; Item."Application Wksh. User ID")
            {
            }
            column(AssemblyPolicy_Item; Item."Assembly Policy")
            {
            }
            column(ResQtyonAssemblyOrder_Item; Item."Res. Qty. on Assembly Order")
            {
            }
            column(ResQtyonAsmComp_Item; Item."Res. Qty. on  Asm. Comp.")
            {
            }
            column(QtyonAssemblyOrder_Item; Item."Qty. on Assembly Order")
            {
            }
            column(QtyonAsmComponent_Item; Item."Qty. on Asm. Component")
            {
            }
            column(QtyonJobOrder_Item; Item."Qty. on Job Order")
            {
            }
            column(ResQtyonJobOrder_Item; Item."Res. Qty. on Job Order")
            {
            }
            column(GTIN_Item; Item.GTIN)
            {
            }
            column(DefaultDeferralTemplateCode_Item; Item."Default Deferral Template Code")
            {
            }
            column(LowLevelCode_Item; Item."Low-Level Code")
            {
            }
            column(LotSize_Item; Item."Lot Size")
            {
            }
            column(SerialNos_Item; Item."Serial Nos.")
            {
            }
            column(LastUnitCostCalcDate_Item; Item."Last Unit Cost Calc. Date")
            {
            }
            column(RolledupMaterialCost_Item; Item."Rolled-up Material Cost")
            {
            }
            column(RolledupCapacityCost_Item; Item."Rolled-up Capacity Cost")
            {
            }
            column(Scrap_Item; Item."Scrap %")
            {
            }
            column(InventoryValueZero_Item; Item."Inventory Value Zero")
            {
            }
            column(DiscreteOrderQuantity_Item; Item."Discrete Order Quantity")
            {
            }
            column(MinimumOrderQuantity_Item; Item."Minimum Order Quantity")
            {
            }
            column(MaximumOrderQuantity_Item; Item."Maximum Order Quantity")
            {
            }
            column(SafetyStockQuantity_Item; Item."Safety Stock Quantity")
            {
            }
            column(OrderMultiple_Item; Item."Order Multiple")
            {
            }
            column(SafetyLeadTime_Item; Item."Safety Lead Time")
            {
            }
            column(FlushingMethod_Item; Item."Flushing Method")
            {
            }
            column(ReplenishmentSystem_Item; Item."Replenishment System")
            {
            }
            column(ScheduledReceiptQty_Item; Item."Scheduled Receipt (Qty.)")
            {
            }
            column(ScheduledNeedQty_Item; Item."Qty. on Component Lines")
            {
            }
            column(RoundingPrecision_Item; Item."Rounding Precision")
            {
            }
            column(BinFilter_Item; Item."Bin Filter")
            {
            }
            column(VariantFilter_Item; Item."Variant Filter")
            {
            }
            column(SalesUnitofMeasure_Item; Item."Sales Unit of Measure")
            {
            }
            column(PurchUnitofMeasure_Item; Item."Purch. Unit of Measure")
            {
            }
            column(TimeBucket_Item; Item."Time Bucket")
            {
            }
            column(ReservedQtyonProdOrder_Item; Item."Reserved Qty. on Prod. Order")
            {
            }
            column(ResQtyonProdOrderComp_Item; Item."Res. Qty. on Prod. Order Comp.")
            {
            }
            column(ResQtyonReqLine_Item; Item."Res. Qty. on Req. Line")
            {
            }
            column(ReorderingPolicy_Item; Item."Reordering Policy")
            {
            }
            column(IncludeInventory_Item; Item."Include Inventory")
            {
            }
            column(ManufacturingPolicy_Item; Item."Manufacturing Policy")
            {
            }
            column(ReschedulingPeriod_Item; Item."Rescheduling Period")
            {
            }
            column(LotAccumulationPeriod_Item; Item."Lot Accumulation Period")
            {
            }
            column(DampenerPeriod_Item; Item."Dampener Period")
            {
            }
            column(DampenerQuantity_Item; Item."Dampener Quantity")
            {
            }
            column(OverflowLevel_Item; Item."Overflow Level")
            {
            }
            column(PlanningTransferShipQty_Item; Item."Planning Transfer Ship. (Qty).")
            {
            }
            column(PlanningWorksheetQty_Item; Item."Planning Worksheet (Qty.)")
            {
            }
            column(StockkeepingUnitExists_Item; Item."Stockkeeping Unit Exists")
            {
            }
            column(ManufacturerCode_Item; Item."Manufacturer Code")
            {
            }
            column(ItemCategoryCode_Item; Item."Item Category Code")
            {
            }
            column(CreatedFromNonstockItem_Item; Item."Created From Nonstock Item")
            {
            }
            column(SubstitutesExist_Item; Item."Substitutes Exist")
            {
            }
            column(QtyinTransit_Item; Item."Qty. in Transit")
            {
            }
            column(TransOrdReceiptQty_Item; Item."Trans. Ord. Receipt (Qty.)")
            {
            }
            column(TransOrdShipmentQty_Item; Item."Trans. Ord. Shipment (Qty.)")
            {
            }
            column(QtyAssignedtoship_Item; Item."Qty. Assigned to ship")
            {
            }
            column(QtyPicked_Item; Item."Qty. Picked")
            {
            }
            column(ServiceItemGroup_Item; Item."Service Item Group")
            {
            }
            column(QtyonServiceOrder_Item; Item."Qty. on Service Order")
            {
            }
            column(ResQtyonServiceOrders_Item; Item."Res. Qty. on Service Orders")
            {
            }
            column(ItemTrackingCode_Item; Item."Item Tracking Code")
            {
            }
            column(LotNos_Item; Item."Lot Nos.")
            {
            }
            column(ExpirationCalculation_Item; Item."Expiration Calculation")
            {
            }
            column(LotNoFilter_Item; Item."Lot No. Filter")
            {
            }
            column(SerialNoFilter_Item; Item."Serial No. Filter")
            {
            }
            column(QtyonPurchReturn_Item; Item."Qty. on Purch. Return")
            {
            }
            column(QtyonSalesReturn_Item; Item."Qty. on Sales Return")
            {
            }
            column(NoofSubstitutes_Item; Item."No. of Substitutes")
            {
            }
            column(WarehouseClassCode_Item; Item."Warehouse Class Code")
            {
            }
            column(SpecialEquipmentCode_Item; Item."Special Equipment Code")
            {
            }
            column(PutawayTemplateCode_Item; Item."Put-away Template Code")
            {
            }
            column(PutawayUnitofMeasureCode_Item; Item."Put-away Unit of Measure Code")
            {
            }
            column(PhysInvtCountingPeriodCode_Item; Item."Phys Invt Counting Period Code")
            {
            }
            column(LastCountingPeriodUpdate_Item; Item."Last Counting Period Update")
            {
            }
            column(LastPhysInvtDate_Item; Item."Last Phys. Invt. Date")
            {
            }
            column(UseCrossDocking_Item; Item."Use Cross-Docking")
            {
            }
            column(NextCountingStartDate_Item; Item."Next Counting Start Date")
            {
            }
            column(NextCountingEndDate_Item; Item."Next Counting End Date")
            {
            }
            column(IdentifierCode_Item; Item."Identifier Code")
            {
            }
            column(UnitofMeasureId_Item; Item."Unit of Measure Id")
            {
            }
            column(TaxGroupId_Item; Item."Tax Group Id")
            {
            }
            column(WHTProductPostingGroup_Item; Item."WHT Product Posting Group")
            {
            }
            column(RoutingNo_Item; Item."Routing No.")
            {
            }
            column(ProductionBOMNo_Item; Item."Production BOM No.")
            {
            }
            column(SingleLevelMaterialCost_Item; Item."Single-Level Material Cost")
            {
            }
            column(SingleLevelCapacityCost_Item; Item."Single-Level Capacity Cost")
            {
            }
            column(SingleLevelSubcontrdCost_Item; Item."Single-Level Subcontrd. Cost")
            {
            }
            column(SingleLevelCapOvhdCost_Item; Item."Single-Level Cap. Ovhd Cost")
            {
            }
            column(SingleLevelMfgOvhdCost_Item; Item."Single-Level Mfg. Ovhd Cost")
            {
            }
            column(OverheadRate_Item; Item."Overhead Rate")
            {
            }
            column(RolledupSubcontractedCost_Item; Item."Rolled-up Subcontracted Cost")
            {
            }
            column(RolledupMfgOvhdCost_Item; Item."Rolled-up Mfg. Ovhd Cost")
            {
            }
            column(RolledupCapOverheadCost_Item; Item."Rolled-up Cap. Overhead Cost")
            {
            }
            column(PlanningIssuesQty_Item; Item."Planning Issues (Qty.)")
            {
            }
            column(PlanningReceiptQty_Item; Item."Planning Receipt (Qty.)")
            {
            }
            column(PlannedOrderReceiptQty_Item; Item."Planned Order Receipt (Qty.)")
            {
            }
            column(FPOrderReceiptQty_Item; Item."FP Order Receipt (Qty.)")
            {
            }
            column(RelOrderReceiptQty_Item; Item."Rel. Order Receipt (Qty.)")
            {
            }
            column(PlanningReleaseQty_Item; Item."Planning Release (Qty.)")
            {
            }
            column(PlannedOrderReleaseQty_Item; Item."Planned Order Release (Qty.)")
            {
            }
            column(PurchReqReceiptQty_Item; Item."Purch. Req. Receipt (Qty.)")
            {
            }
            column(PurchReqReleaseQty_Item; Item."Purch. Req. Release (Qty.)")
            {
            }
            column(OrderTrackingPolicy_Item; Item."Order Tracking Policy")
            {
            }
            column(ProdForecastQuantityBase_Item; Item."Prod. Forecast Quantity (Base)")
            {
            }
            column(ProductionForecastName_Item; Item."Production Forecast Name")
            {
            }
            column(ComponentForecast_Item; Item."Component Forecast")
            {
            }
            column(QtyonProdOrder_Item; Item."Qty. on Prod. Order")
            {
            }
            column(QtyonComponentLines_Item; Item."Qty. on Component Lines")
            {
            }
            column(Critical_Item; Item.Critical)
            {
            }
            column(CommonItemNo_Item; Item."Common Item No.")
            {
            }
            column(LastPurchasedDate__; LastPurchasedDate)
            {
            }
            column(LastUsedDate__; LastUsedDate)
            {
            }
            column(AnnualUsage__; AnnualUsage)
            {
            }
            column(EN_InventoryNSW__; Item."EN Inventory NSW")
            {
            }
            column(EN_InventoryWA__; Item."EN Inventory WA")
            {
            }
            column(EN_InventoryVIC__; Item."EN Inventory VIC")
            {
            }
            column(EN_InventoryQLD__; Item."EN Inventory QLD")
            {
            }
            column(EN_MinimumGPPerc__; Item."EN Minimum GP %")
            {
            }
            column(SourceNo_ValueEntry__; ValueEntry."Source No.")
            {
            }
            column(Description_Item2__; Item2.Description)
            {
            }
            trigger OnPreDataItem()
            begin
                if InventoryPostingGroupFilter <> '' then SetFilter("Inventory Posting Group", InventoryPostingGroupFilter);
            end;

            trigger OnAfterGetRecord();
            var
                ItemLedgerEntry: Record 32;
                LastPurchasedDateFound: Boolean;
                LastUsedDateFound: Boolean;
            begin
                CLEAR(LastPurchasedDate);
                CLEAR(LastUsedDate);
                ItemLedgerEntry.SETCURRENTKEY("Item No.", Positive, "Posting Date");
                ItemLedgerEntry.SETRANGE("Item No.", "No.");
                ItemLedgerEntry.SETRANGE(Positive, TRUE);
                ItemLedgerEntry.SetFilter("Entry Type", '<>%1', ItemLedgerEntry."Entry Type"::"Positive Adjmt.");
                IF ItemLedgerEntry.FINDLAST THEN
                    repeat
                        if ItemLedgerEntry."Entry Type" <> ItemLedgerEntry."Entry Type"::"Negative Adjmt." then begin
                            LastPurchasedDate := ItemLedgerEntry."Posting Date";
                            LastPurchasedDateFound := true;
                        end;
                    until (ItemLedgerEntry.Next(-1) = 0) OR LastPurchasedDateFound;
                ItemLedgerEntry.SETRANGE(Positive, FALSE);
                IF ItemLedgerEntry.FINDLAST THEN
                    repeat
                        if ItemLedgerEntry."Entry Type" <> ItemLedgerEntry."Entry Type"::"Negative Adjmt." then begin
                            LastUsedDate := ItemLedgerEntry."Posting Date";
                            LastUsedDateFound := true;
                        end;
                    until (ItemLedgerEntry.Next(-1) = 0) OR LastUsedDateFound;
                IF Year <> 0 THEN BEGIN
                    ItemLedgerEntry.SETRANGE(Positive);
                    ItemLedgerEntry.SETRANGE("Entry Type", ItemLedgerEntry."Entry Type"::Sale);
                    ItemLedgerEntry.SetFilter("Document Type", '%1|%2', ItemLedgerEntry."Document Type"::"Sales Invoice", ItemLedgerEntry."Document Type"::"Sales Shipment");
                    ItemLedgerEntry.SETRANGE("Posting Date", StartDate, EndDate);
                    ItemLedgerEntry.CALCSUMS(Quantity);
                    AnnualUsage := ABS(ItemLedgerEntry.Quantity);
                END;
                CalcFields(Inventory, "EN Inventory NSW", "EN Inventory VIC", "EN Inventory QLD", "EN Inventory WA");
                Clear(ValueEntry);
                Clear(Item2);
                ItemLedgerEntry.Reset;
                ItemLedgerEntry.SETRANGE("Item No.", "No.");
                ItemLedgerEntry.SETRANGE("Entry Type", ItemLedgerEntry."Entry Type"::Consumption);
                if ItemLedgerEntry.FindLast then begin
                    ValueEntry.SetRange("Document No.", ItemLedgerEntry."Document No.");
                    ValueEntry.SetRange("Posting Date", ItemLedgerEntry."Posting Date");
                    if ValueEntry.FindLast then if Item2.get(ValueEntry."Source No.") then;
                end;
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
                    CaptionML = ENU = 'Options', ENA = 'Options';

                    field(Year; Year)
                    {
                        CaptionML = ENU = 'Year', ENA = 'Year';
                        ApplicationArea = All;
                    }
                    group(InventoryPostingGroups)
                    {
                        CaptionML = ENU = 'Inventory Posting Groups', ENA = 'Inventory Posting Groups';

                        field(IPG_DOMFIN; IPG_DOMFIN)
                        {
                            CaptionML = ENU = 'DOMFIN', ENA = 'DOMFIN';
                            ApplicationArea = All;
                        }
                        field("IPG_FINGOOD-DOM"; "IPG_FINGOOD-DOM")
                        {
                            CaptionML = ENU = 'FINGOOD-DOM', ENA = 'FINGOOD-DOM';
                            ApplicationArea = All;
                        }
                        field("IPG_FINGOOD-INTERNAT"; "IPG_FINGOOD-INTERNAT")
                        {
                            CaptionML = ENU = 'FINGOOD-INTERNAT', ENA = 'FINGOOD-INTERNAT';
                            ApplicationArea = All;
                        }
                        field("IPG_MANUFAC-DOM"; "IPG_MANUFAC-DOM")
                        {
                            CaptionML = ENU = 'MANUFAC-DOM', ENA = 'MANUFAC-DOM';
                            ApplicationArea = All;
                        }
                        field("IPG_RAWMAT-DOM"; "IPG_RAWMAT-DOM")
                        {
                            CaptionML = ENU = 'RAWMAT-DOM', ENA = 'RAWMAT-DOM';
                            ApplicationArea = All;
                        }
                        field("IPG_RAWMAT-INTERNAT"; "IPG_RAWMAT-INTERNAT")
                        {
                            CaptionML = ENU = 'RAWMAT-INTERNAT', ENA = 'RAWMAT-INTERNAT';
                            ApplicationArea = All;
                        }
                        field("IPG_SERVICE COST-DOM"; "IPG_SERVICE COST-DOM")
                        {
                            CaptionML = ENU = 'SERVICE COST-DOM', ENA = 'SERVICE COST-DOM';
                            ApplicationArea = All;
                        }
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
    trigger OnPreReport();
    begin
        IF Year <> 0 THEN BEGIN
            Year := ABS(Year);
            StartDate := DMY2DATE(1, 1, Year);
            EndDate := DMY2DATE(31, 12, Year);
        END;
        if IPG_DOMFIN then InventoryPostingGroupFilter := 'DOMFIN|';
        if "IPG_FINGOOD-DOM" then InventoryPostingGroupFilter += 'FINGOOD-DOM|';
        if "IPG_FINGOOD-INTERNAT" then InventoryPostingGroupFilter += 'FINGOOD-INTERNAT|';
        if "IPG_MANUFAC-DOM" then InventoryPostingGroupFilter += 'MANUFAC-DOM|';
        if "IPG_RAWMAT-DOM" then InventoryPostingGroupFilter += 'RAWMAT-DOM|';
        if "IPG_RAWMAT-INTERNAT" then InventoryPostingGroupFilter += 'RAWMAT-INTERNAT|';
        if "IPG_SERVICE COST-DOM" then InventoryPostingGroupFilter += 'SERVICE COST-DOM|';
        if InventoryPostingGroupFilter <> '' then InventoryPostingGroupFilter := CopyStr(InventoryPostingGroupFilter, 1, StrLen(InventoryPostingGroupFilter) - 1);
    end;

    var
        LastPurchasedDate: Date;
        LastUsedDate: Date;
        Year: Integer;
        AnnualUsage: Decimal;
        StartDate: Date;
        EndDate: Date;
        IPG_DOMFIN: Boolean;
        "IPG_FINGOOD-DOM": Boolean;
        "IPG_FINGOOD-INTERNAT": Boolean;
        "IPG_MANUFAC-DOM": Boolean;
        "IPG_RAWMAT-DOM": Boolean;
        "IPG_RAWMAT-INTERNAT": Boolean;
        "IPG_SERVICE COST-DOM": Boolean;
        InventoryPostingGroupFilter: Text;
        ValueEntry: Record "Value Entry";
        Item2: Record Item;
}
