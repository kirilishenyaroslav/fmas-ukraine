{*******************************************************************************
* uShtatExecFIO                                                                *
*                                                                              *
* Фактическое штатное с фамилиями                                              *
* Copyright ©  2008, Олег Г. Волков, Донецкий национальный университет         *
*******************************************************************************}


unit uShtatExecFIO;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TFactShtatReport = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uShtatExecFIOParams;

function CreateSprav: TSprav;
begin
    Result := TFactShtatReport.Create;
end;

constructor TFactShtatReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TFactShtatReport.Show;
var
    form: TfmShtatReportFIOParams;
begin
    form := TfmShtatReportFIOParams.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.

