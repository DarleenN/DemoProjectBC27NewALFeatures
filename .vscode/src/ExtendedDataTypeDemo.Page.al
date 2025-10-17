//#define Legacy
page 50100 ExtendedDatatypeDemoCard
{
    PageType = Card;
    SourceTable = ExtendedDatatypeDemo;
    Caption = 'ExtendedDatatype Demo';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field(BarcodeValue; Rec.BarcodeValue)
                {
                    ToolTip = 'The phone and tablet clients handle the field as a code and will provide the option to set the field value using a barcode scanner.', Comment = '%';
                }
                field(DefaultText; Rec.DefaultText)
                {
                    ToolTip = 'This is plane Text as we know it.', Comment = '%';
                }
                field(Mail; Rec.Mail)
                {
                    ToolTip = 'The client handles the field as an email address and will display this as hyperlinked whenever the field is not editable. Activating the hyperlink will launch the default mail app on your device.', Comment = '%';
                }
                field(PersonPicture; Rec.PersonPicture) //Is somehow invisible
                {
                    ApplicationArea = All;
                    Enabled = true;
                    Visible = true;
                    ToolTip = 'The client handles the field as media representing a person and will display this in the signature rounded styling. When the media field is empty, a silhouette of a person is shown.', Comment = '%';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'The client handles the field as a phone number and will display this as hyperlinked whenever the field is not editable. Activating the hyperlink will launch the default dialing app on your device.', Comment = '%';
                }
                field(Progress; Rec.Progress)
                {
                    ToolTip = 'The text is handled as a progress bar. This is not supported on the Web client.', Comment = '%';
                }
                field(Secret; Rec.Secret)
                {
                    ToolTip = 'Displays the value as dots when defined with ExtendedDatatype = Masked. This will only have effect on fields, where the user can enter and display textual data (including numbers, time, date etc.). When defined with MaskType = Concealed a lightweight UI-layer-only information protection is provided, as the unmasked data is transferred to the web browser anyway.', Comment = '%';
                }
                field(WebLink; Rec.WebLink)
                {
                    ToolTip = 'The client handles the field as a URL and the text will be displayed as hyperlinked whenever the field is not editable. Activating the hyperlink will open the URL using the default browser on your device.', Comment = '%';
                }
                group(FastTabGroup)
                {
                    Caption = 'Rich Content';
                    // Rich Text Editor is required to be alone in a FastTab group, which is a group that is at the root-level of the page
                    field("Rich Text Editor"; RichText)
                    {
                        Caption = 'My Rich Text Editor.';

                        // Both ExtendedDataType and Multiline are required to render a Rich Text Editor
                        ExtendedDataType = RichContent;
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            Rec.SetRichText(RichText);
                        end;
                    }
                }
                part(ExtendedDataTypeDocumentDemo; ExtendedDataTypeDocumentDemo)
                {
                    Caption = 'Document';
                }
                group(CustomizationsTest) //this somehow doesn't work at all...
                {
                    Caption = 'Customization Test';
                    Description = 'Add customizations via personalize here to see how they react';

                    field(CustomizationOption1; Rec.CustomizationOption1)
                    {
                        ToolTip = 'Specifies the value of the Allways field.', Comment = '%';
                        Enabled = false;
                        Visible = false;
                    }
                    field(CustomizationOption2; Rec.CustomizationOption2)
                    {
                        ToolTip = 'Specifies the value of the AsReadOnly field.', Comment = '%';
                        Enabled = false;
                        Visible = false;
                    }
                    field(CustomizationOption3; Rec.CustomizationOption3)
                    {
                        ToolTip = 'Specifies the value of the AsReadWrite field.', Comment = '%';
                        Enabled = false;
                        Visible = false;
                    }
                    field(CustomizationOption4; Rec.CustomizationOption4)
                    {
                        ToolTip = 'Specifies the value of the Never field.', Comment = '%';
                        Enabled = false;
                        Visible = false;
                    }
                }
            }
        }
        area(FactBoxes)
        {
            systempart(DefaultSummaryPart; Summary)
            {
                Visible = false;
            }
        }
    }
    trigger OnOpenPage()
    var
        ExtendedDataTypeDemoFill: Codeunit InitExtendedDatatypeDemo;
    begin
        if not Rec.IsEmpty() then
            exit;

        ExtendedDataTypeDemoFill.Run();
    end;

    trigger OnAfterGetCurrRecord()
    begin
#if Legacy //defined on top of this Page just uncomment the define
        RichText := Rec.ObsoleteGetRichText();
#else
        RichText := Rec.GetRichText();
#endif
    end;

    var
        RichText: Text;
}