{*******************************************************************************
* uWAccReport                                                                  *
*                                                                              *
* Отчет по начислениям - главный модуль                                        *
* Copyright ©  2006, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uWAccReport;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase, uWAccDM;

type
    TWAccReport = class(TSprav)
    private
        DM: TdmWAccReport;
    public
        constructor Create;
        destructor Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uWAccReportParams;

function CreateSprav: TSprav;
begin
    Result := TWAccReport.Create;
end;

constructor TWAccReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
        // подготовить параметры
    PrepareMemoryDatasets;

    DM := nil;
end;

procedure TWAccReport.Show;
var
    Handle: Integer;
    form: TfmWAccReportParams;
begin
    if DM = nil then
    begin
        Handle := Input['DBHandle'];
        DM := TdmWAccReport.Create(Application.MainForm, TISC_DB_HANDLE(Handle))
    end;

    form := TfmWAccReportParams.Create(Application.MainForm, DM, Input['DesignReport']);
    form.ShowModal;
    form.Free;
end;

destructor TWAccReport.Destroy;
begin
    if DM <> nil then DM.Free;
end;

end.
