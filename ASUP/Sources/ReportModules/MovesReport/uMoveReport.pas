{*******************************************************************************
* uMovesReport                                                                 *
*                                                                              *
* Загрузочный модуль личной карточки                                           *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uMoveReport;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase, uMoveReportData;

type
    TMovesReport = class(TSprav)
    private
        DM: TdmMoveReport;
    public
        constructor Create;
        destructor Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uMoveReportParams;

function CreateSprav: TSprav;
begin
    Result := TMovesReport.Create;
end;

constructor TMovesReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
        // подготовить параметры
    PrepareMemoryDatasets;

    DM := nil;
end;

procedure TMovesReport.Show;
var
    Handle: Integer;
    form: TfmMoveReport;
begin
    if DM = nil then
    begin
        Handle := Input['DBHandle'];
        DM := TdmMoveReport.Create(Application.MainForm, TISC_DB_HANDLE(Handle))
    end;

    form := TfmMoveReport.Create(Application.MainForm, DM, Input['DesignReport']);
    form.ShowModal;
    form.Free;
end;

destructor TMovesReport.Destroy;
begin
    if DM <> nil then DM.Free;
end;

end.
