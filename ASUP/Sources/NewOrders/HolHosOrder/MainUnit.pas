unit MainUnit;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils, Main, DM;

type
    TMainForm = class(TSprav)
    public
        constructor Create;
        procedure   Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TMainForm.Create;
end;

constructor TMainForm.Create;
begin
    inherited Create;
        // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TMainForm.Show;
var
    hnd: Integer;
    form: TMain_Form;
begin
    hnd := Input['DBHandle'];

    Data := TData.Create(Application.MainForm);
    Data.DB.Handle:=TISC_DB_Handle(hnd);

    form := TMain_Form.Create(Application.MainForm);

    Data.SelectOrder.Close;
    Data.SelectOrder.Open;

    form.ShowModal;
    form.Free;
end;

end.
