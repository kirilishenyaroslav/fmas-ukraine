{*******************************************************************************
* uReportNichSpisok                                                            *
*                                                                              *
* Список сотрудников НИЧ                                                       *
* Copyright ©  2007, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uReportNichSpisok;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TReportNichSpisokReport = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uReportNichSpisokParams;

function CreateSprav: TSprav;
begin
    Result := TReportNichSpisokReport.Create;    
end;

constructor TReportNichSpisokReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TReportNichSpisokReport.Show;
var
    form: TfmReportNichSpisokForm;
begin
    form := TfmReportNichSpisokForm.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.

