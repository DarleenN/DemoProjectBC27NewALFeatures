//#define donot
page 50102 SourceTableTempDemo
{
    ApplicationArea = All;
    Caption = 'Source Table Temp Demo';
    PageType = ListPart;
    SourceTable = Customer;
    SourceTableTemporary = true;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnDrillDown()
                    var
                        RealCust: Record Customer; //Since Rec is temp because of SourceTableTemporary
                        CustomerCard: Page "Customer Card";
                    begin
#if donot
                        CustomerCard.SetRecord(Rec);
                        CustomerCard.Run();
#else
                        RealCust.Get(Rec."No.");
                        CustomerCard.SetRecord(RealCust);
                        CustomerCard.Run();
#endif
                    end;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the vendor''s name';
                }
            }
        }
    }
}