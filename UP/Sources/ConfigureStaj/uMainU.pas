unit uMainU;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
    SelectStaj, DMStModule;

type
    TStaj = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TStaj.Create;
end;

constructor TStaj.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TStaj.Show;
var
    hn: Integer;
    frm: TfrmSelectStaj;
begin
    hn := Input['DBHandle'];

    frm := TfrmSelectStaj.Create(Application.MainForm);
    frm.DBase.Handle := TISC_DB_Handle(hn);
    frm.SelectStaj.Close;
    frm.SelectStaj.SQLs.SelectSQL.Text := 'select * from ini_staj';
    frm.SelectStaj.Open;
    frm.WindowState := wsMaximized;
end;

end.

