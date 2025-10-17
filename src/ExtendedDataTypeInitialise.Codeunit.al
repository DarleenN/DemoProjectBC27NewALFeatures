codeunit 50100 InitExtendedDatatypeDemo
{
    Subtype = Normal;

    //This Codeunit is only used to fill the demo page with Data

    trigger OnRun()
    var
        demoRec: Record ExtendedDatatypeDemo;
        Contact: Record Contact;
        EmptyGuid: Guid;
        Instream: InStream;
        InstreamVarText: Text;
    begin
        if not demoRec.IsEmpty() then
            exit;

        demoRec.Init();
        demoRec.DefaultText := 'Nur Text';
        demoRec.Phone := '+49 170 1234567';
        demoRec.WebLink := 'https://www.microsoft.com';
        demoRec.Mail := 'demo@example.com';


        if Contact.FindFirst() then begin
            if Contact.Image.HasValue() then
                Instream.Read(Contact.Image);
            demoRec.PersonPicture.ImportStream(InStream, 'Im some kind of picture')
        end;
        demoRec.Progress := 0.75; // 75% Only visible in mobile Clients
        demoRec.Secret := 'MeinPasswort123';
        demoRec.BarcodeValue := '123456789012';
        demoRec.Insert(true);
    end;
}