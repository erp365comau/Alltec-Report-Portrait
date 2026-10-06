tableextension 70201 ADES_ItemExt extends Item
{
    fields
    {
        field(70200; "ADES_Last Total Unit Cost"; Decimal)
        {
            CaptionML = ENU = 'Last Total Unit Cost', ENA = 'Last Total Unit Cost';
            Editable = false;
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = ToBeClassified;
        }
        field(70201; "ADES_Reseller"; Decimal)
        {
            CaptionML = ENU = 'Reseller', ENA = 'Reseller';
            Editable = false;
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = ToBeClassified;
        }
        field(70202; "ADES_Trade"; Decimal)
        {
            CaptionML = ENU = 'Trade', ENA = 'Trade';
            Editable = false;
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = ToBeClassified;
        }
        field(70203; "ADES_Polyseal"; Decimal)
        {
            CaptionML = ENU = 'Polyseal', ENA = 'Polyseal';
            Editable = false;
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = ToBeClassified;
        }
        field(70204; "EN Minimum GP %"; Decimal)
        {
            Description = 'CSA.JR ESWT0002';
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Minimum', ENA = 'Minimum';
        }
        field(70205; "EN Inventory NSW"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Location Code" = FILTER('MS' | 'MSB'), "Drop Shipment" = FIELD("Drop Shipment Filter"), "Variant Code" = FIELD("Variant Filter"), "Lot No." = FIELD("Lot No. Filter"), "Serial No." = FIELD("Serial No. Filter")));
            CaptionML = ENU = 'Inventory NSW', ENA = 'Inventory NSW';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70206; "EN Inventory WA"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Location Code" = FILTER('WA' | 'WAB'), "Drop Shipment" = FIELD("Drop Shipment Filter"), "Variant Code" = FIELD("Variant Filter"), "Lot No." = FIELD("Lot No. Filter"), "Serial No." = FIELD("Serial No. Filter")));
            CaptionML = ENU = 'Inventory WA', ENA = 'Inventory WA';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70207; "EN Inventory VIC"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Location Code" = FILTER('VI' | 'VB' | 'VIB'), "Drop Shipment" = FIELD("Drop Shipment Filter"), "Variant Code" = FIELD("Variant Filter"), "Lot No." = FIELD("Lot No. Filter"), "Serial No." = FIELD("Serial No. Filter")));
            CaptionML = ENU = 'Inventory VIC', ENA = 'Inventory VIC';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(70208; "EN Inventory QLD"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Location Code" = FILTER('QL' | 'QB' | 'QLB'), "Drop Shipment" = FIELD("Drop Shipment Filter"), "Variant Code" = FIELD("Variant Filter"), "Lot No." = FIELD("Lot No. Filter"), "Serial No." = FIELD("Serial No. Filter")));
            CaptionML = ENU = 'Inventory QLD', ENA = 'Inventory QLD';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }
}
