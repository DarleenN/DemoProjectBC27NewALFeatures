table 50100 ExtendedDatatypeDemo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; DefaultText; Text[100])
        {
            Caption = 'None';
            ExtendedDatatype = None;
        }

        field(2; Phone; Text[30])
        {
            Caption = 'Phone Number';
            ExtendedDatatype = PhoneNo;
        }

        field(3; WebLink; Text[250])
        {
            Caption = 'URL';
            ExtendedDatatype = URL;
        }

        field(4; Mail; Text[100])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }

        field(5; Progress; Decimal)
        {
            Caption = 'Ratio';
            ExtendedDatatype = Ratio;
        }

        field(6; Secret; Text[50])
        {
            Caption = 'Masked';
            //ExtendedDatatype = Masked;
            //Alternatively new MaskType Property to be able to unconceal on userinterface however the data is still transported to the client, therefore only secure on the UI Layer
            MaskType = Concealed;
        }

        field(7; PersonPicture; Media)
        {
            Caption = 'Person';
            ExtendedDatatype = Person;
        }

        field(8; BarcodeValue; Text[100])
        {
            Caption = 'Barcode';
            ExtendedDatatype = Barcode;
        }
        field(9; RichText; Text[2048])
        {
            Caption = 'Rich Content';
            Description = 'Contains a rich text value';
        }
        field(10; Document; Media)
        {
            Caption = 'Document';
            ExtendedDatatype = Document;
        }
        field(11; CustomizationOption1; Text[100])
        {
            Caption = 'Always';
            AllowInCustomizations = Always;
        }
        field(12; CustomizationOption2; Text[100])
        {
            Caption = 'AsReadOnly';
            AllowInCustomizations = AsReadOnly;
        }
        field(13; CustomizationOption3; Text[100])
        {
            Caption = 'AsReadWrite';
            AllowInCustomizations = AsReadWrite;
        }
        field(14; CustomizationOption4; Text[100])
        {
            Caption = 'Never';
            AllowInCustomizations = Never;
        }
    }

    keys
    {
        key(PK; DefaultText) { Clustered = true; }
    }

    procedure GetRichText(): Text[2048]
    begin
        exit(Rec.RichText);
    end;

    [Obsolete('I''m old! Please don''t use me!')]
    procedure ObsoleteGetRichText(): Text
    begin
        //Doing some old stuff
    end;

    procedure SetRichText(InputRichText: Text[2048])
    begin
        Rec.RichText := InputRichText;
        Rec.Modify(false);
    end;
}