unit uShtatPostBySR;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TReportShtatPostBySR = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uShtatPostBySRForm;

function CreateSprav: TSprav;
begin
    Result := TReportShtatPostBySR.Create;
end;

constructor TReportShtatPostBySR.Create;
begin
    inherited Create;

    PrepareMemoryDatasets;
end;

procedure TReportShtatPostBySR.Show;
var
    hnd: Integer;
    form: TFormShtatPostBySR;
begin
    hnd := Input['DBHandle'];
    form := TFormShtatPostBySR.Create(nil, TISC_DB_HANDLE(hnd));
    form.ShowModal;
    form.Free;
end;

end.

