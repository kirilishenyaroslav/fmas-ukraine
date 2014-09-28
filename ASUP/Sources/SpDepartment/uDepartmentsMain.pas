{*******************************************************************************
* uDepartmentsMain                                                             *
*                                                                              *
* Главный модуль справочника подразделений                                     *
* Copyright ©  2004-2005, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}


unit uDepartmentsMain;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, uDepartmentsView,
    uDepartmentsData, IBase;

type
    TDepartmentsSprav = class(TSprav)
    private
        DataModule: TdmDepartments;
        IsConnected: Boolean;
        procedure PrepareConnect;
        procedure FillParams;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
        procedure GetInfo; override;
        function Exists: boolean; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils;

function CreateSprav: TSprav;
begin
    Result := TDepartmentsSprav.Create;
end;

constructor TDepartmentsSprav.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Root_Department', ftInteger);
    Input.FieldDefs.Add('Id_Property', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('AllowEdit', ftBoolean);
    Input.FieldDefs.Add('Show_Properties', ftBoolean);

    Output.FieldDefs.Add('Id_Department', ftInteger);
    Output.FieldDefs.Add('Name_Full', ftString, 255);
    Output.FieldDefs.Add('Name_Short', ftString, 50);
    Output.FieldDefs.Add('Department_Code', ftString, 10);

    // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TDepartmentsSprav.Destroy;
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

procedure TDepartmentsSprav.PrepareConnect;
var
    hnd: Integer;
begin
    DataModule := TdmDepartments.Create(Application.MainForm);

    with DataModule do
    begin
        if Database.Connected then
            Database.Connected := False;
        hnd := Input['DBHandle'];
        Database.Handle := TISC_DB_HANDLE(hnd);
    end;

    FillParams;

    if VarIsNull(Input['Root_Department']) then
    begin
        DataModule.GetRoot.Open;
        Input.Edit;
        Input['Root_Department'] := DataModule.GetRoot.Fields[0].AsInteger;
        Input.Post;
    end;

    with DataModule.SelectDepartments do
    begin
        ParamByName('Root').AsInteger := Input['Root_Department'];
        ParamByName('Actual_Date').AsDate := Input['Actual_Date'];
        ParamByName('Show_Deleted').AsInteger := 0;
        ParamByName('Id_Prop').AsInteger := Input['Id_Property'];
    end;
    DataModule.InputActDate := Input['Actual_Date'];

    IsConnected := True;
end;


procedure TDepartmentsSprav.FillParams;
begin
    Input.Edit;

    if VarIsNull(Input['Actual_Date']) then
        Input['Actual_Date'] := Date;

    if VarIsNull(Input['AllowEdit']) then
        Input['AllowEdit'] := False;

    if VarIsNull(Input['ShowStyle']) then
        Input['ShowStyle'] := 0;

    if VarIsNull(Input['Select']) then
        Input['Select'] := 1;

    if VarIsNull(Input['Id_Property']) or VarIsEmpty(Input['Id_Property']) then
        Input['Id_Property'] := -1;

    if VarIsNull(Input['Show_Properties']) then Input['Show_Properties'] := True;

    Input.Post;
end;

procedure TDepartmentsSprav.Show;
var
    form: TfmDepartmentsView;
begin
    if not IsConnected then PrepareConnect;

    form := TfmDepartmentsView.Create(Application.MainForm, DataModule,
        Input['AllowEdit'], False, Input, Output);
    if (Input['ShowStyle'] = 0) or (Input['Select'] > 0) then
    begin
        form.ShowModal;
        form.Free;
    end
    else
    begin
        form.FormStyle := fsMDIChild;
        form.WindowState := wsMaximized;
    end;
end;

function TDepartmentsSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure TDepartmentsSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

end.
