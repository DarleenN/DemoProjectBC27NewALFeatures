report 50101 "Demo Report Empty DataItems"
{
    Caption = 'Demo Report: Empty DataItems';
    ProcessingOnly = false;
    DefaultRenderingLayout = default;

    dataset
    {
        // empty DataItem (will be an empty sheet in Excel-Layout)
        dataitem(EmptyDataItem; Integer)
        // BC27_NEU
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
            // BC27_NEU
            column(ObsoleteColumn; Number)

            {
                ObsoleteState = Pending;
                // BC27_NEU
            }

            trigger OnAfterGetRecord()
            begin
                ObsoleteEventPublisher();
                // BC27_NEU
                ObsoleteBusinessEvent();
                // BC27_NEU
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
            // BC27_NEU
        }

        layout(nonDefault)
        {
            Type = Word;
            LayoutFile = 'DemoReportLayout.docx';
        }
    }
    [IntegrationEvent(false, false)]
    [Obsolete('I''m obsolete', 'why')]
    // BC27_NEU
    local procedure ObsoleteEventPublisher()

    begin
    end;

    [BusinessEvent(true)]
    [Obsolete('I''m obsolete', 'why')]
    // BC27_NEU
    local procedure ObsoleteBusinessEvent()

    begin
    end;
}