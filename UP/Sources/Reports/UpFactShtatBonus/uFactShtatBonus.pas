{*******************************************************************************
* uFactShtatBonus                                                              *
*                                                                              *
* Фактическое штатное с фильтром по надбавкам                                  *
* Copyright ©  2007, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uFactShtatBonus;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TFactShtatBonusReport = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uFactShtatBonusForm;

function CreateSprav: TSprav;
begin
    Result := TFactShtatBonusReport.Create;
end;

constructor TFactShtatBonusReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure TFactShtatBonusReport.Show;
var
    form: TfmFactShtatBonus;
begin
    form := TfmFactShtatBonus.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.

