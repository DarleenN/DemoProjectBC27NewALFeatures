report 50101 "Demo Report Empty DataItems"
{
    Caption = 'Demo Report: Empty DataItems';
    ProcessingOnly = false;
    DefaultRenderingLayout = default;

    dataset
    {
        // empty DataItem (will be an empty sheet in Excel-Layout)
        dataitem(EmptyDataItem; Integer)
        {
            // no columns
        }

        dataitem(NonEmptyDataItem; Integer)
        {
            column(Number; Number) { }
            column(Description; 'Demo Data') { }
        }

        // Obsolete DataItem and Column
        dataitem(ObsoleteDataItem; Integer)
        {
            ObsoleteState = Pending;
            column(ObsoleteColumn; Number)
            {
                ObsoleteState = Pending;
            }

            trigger OnAfterGetRecord()
            begin
                ObsoleteEventPublisher();
                ObsoleteBusinessEvent();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Group)
                {
                    field(DemoField; 'Demo') { }
                }
            }
        }
    }
    rendering
    {
        //Obsolet Layout
        layout(default)
        {
            Type = Excel;
            LayoutFile = 'DemoReportLayout.xlsx';
            ObsoleteState = Pending;
        }

        layout(nonDefault)
        {
            Type = Word;
            LayoutFile = 'DemoReportLayout.docx';
        }
    }
    [IntegrationEvent(false, false)]
    [Obsolete('I''m obsolete', 'why')]
    local procedure ObsoleteEventPublisher()
    begin
    end;

    [BusinessEvent(true)]
    [Obsolete('I''m obsolete', 'why')]
    local procedure ObsoleteBusinessEvent()
    begin
    end;
}