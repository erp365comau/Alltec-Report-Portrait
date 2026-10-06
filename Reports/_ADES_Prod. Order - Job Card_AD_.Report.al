report 70220 "ADES_Prod. Order - Job Card_AD"
{
    // Austral Sugeevan 06/08/2020 >>> RTC Layout Mods
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Rep70220.ADES_ProdOrderJobCard_AD.rdl';
    AdditionalSearchTerms = 'production order - job card,work order job card';
    ApplicationArea = All;
    Caption = 'Prod. Order - Job Card';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, "No.");
            RequestFilterFields = Status, "No.", "Source Type", "Source No.";

            column(Status_ProdOrder; Status)
            {
            }
            column(No_ProdOrder; "No.")
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number)WHERE(Number=CONST(1));

                column(TodayFormatted; Format(Today, 0, 4))
                {
                }
                column(CompanyName; COMPANYPROPERTY.DisplayName)
                {
                }
                column(ProdOrderTableCaptionFilt; "Production Order".TableCaption + ':' + ProdOrderFilter)
                {
                }
                column(ProdOrderFilter; ProdOrderFilter)
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(ProdOrderJobCardCaption; ProdOrderJobCardCaptionLbl)
                {
                }
                column(Picture_CompanyInfo__; CompanyInfo.Picture)
                {
                }
                column(OutputCaption; OutputCaptionLbl)
                {
                }
                column(ByCaption; ByCaptionLbl)
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(Description_ProductionOrder__; "Production Order".Description)
                {
                }
                column(SourceNo_ProductionOrder__; "Production Order"."Source No.")
                {
                }
                column(ProdOrderNo_ProductionOrder__; "Production Order"."No.")
                {
                }
                column(PrintComments__; PrintComments)
                {
                }
            }
            dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
            {
                DataItemLink = Status=FIELD(Status), "Prod. Order No."=FIELD("No.");
                DataItemTableView = SORTING(Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.");

                column(RtngNo_ProdOrderRtngLine; "Routing No.")
                {
                IncludeCaption = true;
                }
                column(OPNo_ProdOrderRtngLine; "Operation No.")
                {
                IncludeCaption = true;
                }
                column(Type_ProdOrderRtngLine; Type)
                {
                IncludeCaption = true;
                }
                column(No_ProdOrderRtngLine; "No.")
                {
                IncludeCaption = true;
                }
                column(StrtTim_ProdOrderRtngLine; "Starting Time")
                {
                IncludeCaption = true;
                }
                column(StrtDt_ProdOrderRtngLine; Format("Starting Date"))
                {
                }
                column(EndTime_ProdOrderRtngLine; "Ending Time")
                {
                IncludeCaption = true;
                }
                column(EndDate_ProdOrderRtngLine; Format("Ending Date"))
                {
                }
                column(ExpCapNd_ProdOrderRtngLine; "Expected Capacity Need")
                {
                }
                column(Desc_ProdOrder; "Production Order".Description)
                {
                }
                column(SourceNo_ProdOrder; "Production Order"."Source No.")
                {
                }
                column(ProdOrdrRtngLineRTUOMCode; CapacityUoM)
                {
                }
                column(PrdOrdNo_ProdOrderRtngLine; "Prod. Order No.")
                {
                IncludeCaption = true;
                }
                column(ProdOrderRtngLnStrtDtCapt; ProdOrderRtngLnStrtDtCaptLbl)
                {
                }
                column(ProdOrdRtngLnEndDatCapt; ProdOrdRtngLnEndDatCaptLbl)
                {
                }
                column(ProdOrdRtngLnExpcCapNdCpt; ProdOrdRtngLnExpcCapNdCptLbl)
                {
                }
                column(PrecalcTimesCaption; PrecalcTimesCaptionLbl)
                {
                }
                column(ProdOrderSourceNoCapt; ProdOrderSourceNoCaptLbl)
                {
                }
                column(ScrapCaption; ScrapCaptionLbl)
                {
                }
                dataitem("Prod. Order Component"; "Prod. Order Component")
                {
                    DataItemLink = Status=FIELD(Status), "Prod. Order No."=FIELD("Prod. Order No."), "Routing Link Code"=FIELD("Routing Link Code");
                    DataItemTableView = SORTING(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");

                    column(Position_ProdOrderComp; Position)
                    {
                    IncludeCaption = true;
                    }
                    column(Position2_ProdOrderComp; "Position 2")
                    {
                    IncludeCaption = true;
                    }
                    column(LdTimOffset_ProdOrderComp; "Lead-Time Offset")
                    {
                    IncludeCaption = true;
                    }
                    column(ExpectedQty_ProdOrderComp; "Expected Quantity")
                    {
                    IncludeCaption = true;
                    }
                    column(ItemNo_ProdOrderComp; "Item No.")
                    {
                    IncludeCaption = true;
                    }
                    column(OrderNo_ProdOrderComp; "Prod. Order No.")
                    {
                    }
                    column(MaterialRequirementsCapt; MaterialRequirementsCaptLbl)
                    {
                    }
                    column(Description_ProdOrderComponent__; "ADES_Item Description")
                    {
                    IncludeCaption = true;
                    }
                    column(UOMCode_ProdOrderComponent__; "Unit of Measure Code")
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        CalcFields("ADES_Item Description");
                    end;
                }
                trigger OnAfterGetRecord()
                var
                    WorkCenter: Record "Work Center";
                    CalendarMgt: Codeunit "Calendar Management";
                begin
                    WorkCenter.Get("Work Center No.");
                    CapacityUoM:=WorkCenter."Unit of Measure Code";
                    ///"Expected Capacity Need" := "Expected Capacity Need" / CalendarMgt.tim.TimeFactor(CapacityUoM); 
                    "Expected Capacity Need":="Expected Capacity Need" / TimeFactor(CapacityUoM);
                end;
            }
            dataitem("Prod. Order Comment Line"; "Prod. Order Comment Line")
            {
                DataItemLink = Status=FIELD(Status), "Prod. Order No."=FIELD("No.");

                column(Comment_ProdOrderCommentLine__; Comment)
                {
                }
                column(LineNo_ProdOrderCommentLine__; "Line No.")
                {
                }
            }
            trigger OnAfterGetRecord()
            var
                ProdOrderRoutingLine: Record "Prod. Order Routing Line";
                ProdOrderCommentLine: Record "Prod. Order Comment Line";
            begin
                ProdOrderRoutingLine.SetRange(Status, Status);
                ProdOrderRoutingLine.SetRange("Prod. Order No.", "No.");
                if not ProdOrderRoutingLine.FindFirst then CurrReport.Skip;
                ProdOrderCommentLine.SetRange(Status, Status);
                ProdOrderCommentLine.SetRange("Prod. Order No.", "No.");
                PrintComments:=ProdOrderCommentLine.FindFirst;
            end;
            trigger OnPreDataItem()
            begin
                ProdOrderFilter:=GetFilters;
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
    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;
    var ProdOrderFilter: Text;
    CapacityUoM: Code[10];
    CurrReportPageNoCaptionLbl: Label 'Page';
    ProdOrderJobCardCaptionLbl: Label 'Prod. Order - Job Card';
    ProdOrderRtngLnStrtDtCaptLbl: Label 'Starting Date';
    ProdOrdRtngLnEndDatCaptLbl: Label 'Ending Date';
    ProdOrdRtngLnExpcCapNdCptLbl: Label 'Time Needed';
    PrecalcTimesCaptionLbl: Label 'Precalc. Times';
    ProdOrderSourceNoCaptLbl: Label 'Item No.';
    OutputCaptionLbl: Label 'Output (units)';
    ScrapCaptionLbl: Label 'Scrap';
    DateCaptionLbl: Label 'Date of Completion';
    ByCaptionLbl: Label 'Operator';
    EmptyStringCaptionLbl: Label '__________________________';
    MaterialRequirementsCaptLbl: Label 'MATERIAL REQUIREMENTS';
    CompanyInfo: Record "Company Information";
    PrintComments: Boolean;
    procedure TimeFactor(UnitOfMeasureCode: Code[10])Factor: Decimal var
        CapUnitOfMeasure: Record "Capacity Unit of Measure";
    begin
        if UnitOfMeasureCode = '' then exit(1);
        CapUnitOfMeasure.Get(UnitOfMeasureCode);
        case CapUnitOfMeasure.Type of CapUnitOfMeasure.Type::Seconds: exit(1000);
        CapUnitOfMeasure.Type::Minutes: exit(60000);
        CapUnitOfMeasure.Type::"100/Hour": exit(36000);
        CapUnitOfMeasure.Type::Hours: exit(3600000);
        CapUnitOfMeasure.Type::Days: exit(86400000);
        end;
        Factor:=1;
    end;
}
