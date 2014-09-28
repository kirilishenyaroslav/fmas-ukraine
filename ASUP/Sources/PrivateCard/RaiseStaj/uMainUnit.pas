unit uMainUnit;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils, StajForm,
RaiseStajData;

type
    TRaiseStaj = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TRaiseStaj.Create;
end;

constructor TRaiseStaj.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TRaiseStaj.Show;
var
    hnd: Integer;
    form: TRaiseForm;
begin
      hnd := Input['DBHandle'];

      Dm := TDm.Create(Application.MainForm);
      Dm.DB.Handle:=TISC_DB_Handle(hnd);

      form:=TRaiseForm.Create(Application.MainForm);
      form.WindowState:=wsMaximized;
end;

end.
