{*******************************************************************************
* uMinZPMain                                                                   *
*                                                                              *
* Главный модуль справочника минимальных заработных плат                       *
* Copyright ©  2006, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uMinZPMain;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, uMinZPView,
        uMinZPData, IBase;

type
    TMinZPSprav = class(TSprav)
    private
        DataModule: TdmMinZP;
        IsConnected: Boolean;
        procedure PrepareConnect;
        procedure FillParams;
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

uses Variants, SysUtils;

function CreateSprav: TSprav;
begin
    Result := TMinZPSprav.Create;
end;

constructor TMinZPSprav.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Actual_Date', ftDate);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TMinZPSprav.Destroy;
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
procedure TMinZPSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TdmMinZP.Create(Application.MainForm);

    with DataModule do
    begin
        if Database.Connected then
            Database.Connected := False;
        hnd := Input['DBHandle'];
        Database.Handle := TISC_DB_HANDLE(hnd);
    end;

    FillParams;

    IsConnected := True;
end;


procedure TMinZPSprav.FillParams;
begin
    Input.Edit;

    if VarIsNull(Input['Actual_Date']) then
        Input['Actual_Date'] := Date;

    Input.Post;
end;

procedure TMinZPSprav.Show;
var
    form: TfmMinZPView;
begin
    if not IsConnected then PrepareConnect;

    form := TfmMinZPView.Create(Application.MainForm, DataModule);
    begin
        form.FormStyle := fsMDIChild;
        form.WindowState := wsMaximized;
    end;
end;

function    TMinZPSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TMinZPSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.


