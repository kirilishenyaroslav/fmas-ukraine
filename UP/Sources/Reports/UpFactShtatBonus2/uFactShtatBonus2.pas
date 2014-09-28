unit uFactShtatBonus2;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TFactShtatBonus2Report = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uFactShtatBonus2Form;

function CreateSprav: TSprav;
begin
    Result := TFactShtatBonus2Report.Create;
end;

constructor TFactShtatBonus2Report.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TFactShtatBonus2Report.Show;
var
    form: TfrmFactShtatBonus2;
begin
    form := TfrmFactShtatBonus2.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.
