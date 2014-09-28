{*******************************************************************************
* uWAccReport                                                                  *
*                                                                              *
* Отчет по начислениям - главный модуль                                        *
* Copyright ©  2006, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uShtat2Report;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase, uShtat2DM;

type
    TShtat2Report = class(TSprav)
    private
        DM: TdmShtat2Report;
    public
        constructor Create;
        destructor Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uShtatPrint2Params;

function CreateSprav: TSprav;
begin
    Result := TShtat2Report.Create;
end;

constructor TShtat2Report.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('ID_SR', ftInteger);
    Input.FieldDefs.Add('ID_Department', ftInteger);
    Input.FieldDefs.Add('Actual_Date', ftDate);

        // подготовить параметры
    PrepareMemoryDatasets;

    DM := nil;
end;

procedure TShtat2Report.Show;
var
    Handle: Integer;
    form: TfmShtatPrint2Params;
begin
    if DM = nil then
    begin
        Handle := Input['DBHandle'];
        DM := TdmShtat2Report.Create(Application.MainForm, TISC_DB_HANDLE(Handle))
    end;

    form := TfmShtatPrint2Params.Create(Application.MainForm, DM, Input['DesignReport']);

    if not VarIsNull(Input['Id_Department']) then
      form.Department := Input['Id_Department'];

    if not VarIsNull(Input['Id_SR']) then form.SetSR(Input['Id_SR']);

    if not VarIsNull(Input['Actual_Date']) then
      form.Prepare(Input['Actual_Date'], Input['Actual_Date'], Input['Actual_Date'])
    else form.Prepare(Date, Date, Date);

    form.ShowModal;
    form.Free;
end;

destructor TShtat2Report.Destroy;
begin
    if DM <> nil then DM.Free;
end;

end.

