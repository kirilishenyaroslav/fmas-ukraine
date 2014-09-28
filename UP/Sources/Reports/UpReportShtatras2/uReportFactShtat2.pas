unit uReportFactShtat2;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TReportFactShtat2Report = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uFactShtatReport2Param;

function CreateSprav: TSprav;
begin
    Result := TReportFactShtat2Report.Create;
end;

constructor TReportFactShtat2Report.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Actual_Date', ftDate);
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

        // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TReportFactShtat2Report.Show;
var
    hnd: Integer;
    form: TfmFactShtatReport2Param;
begin
    hnd := Input['DBHandle'];
    form := TfmFactShtatReport2Param.Create(nil, TISC_DB_HANDLE(hnd));
    form.ShowModal;
    form.Free;
end;

end.

