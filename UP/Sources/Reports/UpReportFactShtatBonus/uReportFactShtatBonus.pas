{*******************************************************************************
* uReportFactShtatBonus                                                        *
*                                                                              *
* Выполнение штатного с надбавками                                             *
* Copyright ©  2008, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uReportFactShtatBonus;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TReportFactShtatBonusReport = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uFactShtatBonusParams;

function CreateSprav: TSprav;
begin
    Result := TReportFactShtatBonusReport.Create;    
end;

constructor TReportFactShtatBonusReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TReportFactShtatBonusReport.Show;
var
    form: TfmFactShtatReport2;
begin
    form := TfmFactShtatReport2.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.

