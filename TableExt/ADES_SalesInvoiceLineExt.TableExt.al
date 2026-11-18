tableextension 70200 ADES_SalesInvoiceLineExt extends "Sales Invoice Line"
{
    fields
    {
        field(70200; "ADES_Salesperson Code"; Code[20])
        {
            CaptionML = ENU = 'Salesperson Code', ENA = 'Salesperson Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Header"."Salesperson Code" where("No." = field("Document No.")));
            Editable = false;
            TableRelation = "Salesperson/Purchaser";
        }
        field(70201; "ADES_External Document No."; Code[35])
        {
            CaptionML = ENU = 'Customer Ref. No.', ENA = 'Customer Ref. No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Header"."External Document No." where("No." = field("Document No.")));
            Editable = false;
        }
        field(70202; "ADES_Item Description"; Text[100])
        {
            CaptionML = ENU = 'Item Description', ENA = 'Item Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("No.")));
            Editable = false;
        }
        field(70203; "Total Cost"; Decimal)
        {
            CaptionML = ENU = 'Total Cost', ENA = 'Total Cost';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
            AutoFormatExpression = Rec.GetCurrencyCode();
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(70204; "Margin %"; Decimal)
        {
            CaptionML = ENU = 'Margin %', ENA = 'Margin %';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
    }
}
