unit USPTextOrderMain;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls,
        IBase, uSPTextOrder, uSPTextOrderEdit, uDMTextOrder;

type
    TSPTextOrderSprav = class(TSprav)
    private
        DataModule: TDMTextOrder;
        IsConnected: Boolean;
        procedure PrepareConnect;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
        procedure   GetInfo;override;
        function    Exists: boolean;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation



function CreateSprav: TSprav;
begin
    Result := TSPTextOrderSprav.Create;
end;

constructor TSPTextOrderSprav.Create;
begin
    inherited Create;
    Output.FieldDefs.Add('Id_shablon', ftInteger);
    Output.FieldDefs.Add('Text1', ftString, 255);
        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TSPTextOrderSprav.Destroy;
begin
    inherited Destroy;

    if IsConnected then
    begin
        DataModule.ReadTransaction.Active := False;
        DataModule.WriteTransaction.Active := False;
    end;
    DataModule.Free;
end;

        // подготовить соединение с базой
procedure TSPTextOrderSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TDMTextOrder.Create(Application.MainForm);
    with DataModule do
    begin
        if WorkDatabase.Connected then
            WorkDatabase.Connected := False;
        hnd := Input['DBHandle'];
        WorkDatabase.Handle := TISC_DB_HANDLE(hnd);
        StajDS.Close;
        StajDS.SelectSQL.Clear;
        StajDS.SelectSQL.Text:='select text1,id_shablon from up_get_text_shablon(17)';
        StajDS.Open;
    end;
    IsConnected := True;
end;

procedure TSPTextOrderSprav.Show;
var
    form: TfmSPTextOrder;
begin
    if not IsConnected then PrepareConnect;

    form := TfmSPTextOrder.Create(Application.MainForm, DataModule, Input, Output);
    form.Visible:=false;
    if ( Input['ShowStyle'] = 0 ) or ( Input['Select'] > 0 ) then
    begin
        if form.ShowModal = mrYes then
        begin
            if Output <> nil then
            begin
                Output.Open;
                Output.Append;
                Output['Text1'] := form.text1;
                Output['Id_shablon'] := form.id_shablon;
                Output.Post;
            end;
        end;
        form.Free;
    end
    else
        form.FormStyle := fsMDIChild;
end;

function    TSPTextOrderSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TSPTextOrderSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.
