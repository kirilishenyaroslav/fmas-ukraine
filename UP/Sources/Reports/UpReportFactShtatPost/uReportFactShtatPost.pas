unit uReportFactShtatPost;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TReportFactShtatPostReport = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uFactShtatPostParams;

function CreateSprav: TSprav;
begin
    Result := TReportFactShtatPostReport.Create;
end;

constructor TReportFactShtatPostReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TReportFactShtatPostReport.Show;
var
    form: TfmFactShtatReport2;
begin
    form := TfmFactShtatReport2.Create(Application.MainForm, Input['DBHandle']);
    form.ShowModal;
    form.Free;
end;

end.

