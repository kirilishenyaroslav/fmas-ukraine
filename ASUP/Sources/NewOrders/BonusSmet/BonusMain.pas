unit BonusMain;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      BonusForm, dmBonus;

type
    TBonusMain = class(TSprav)
    public
        constructor Create;
        procedure   Show; override;
    end;
    
function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TBonusMain.Create;
end;

constructor TBonusMain.Create;
begin
    inherited Create;
        // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TBonusMain.Show;
var
    hnd: Integer;
    form: TForm1;
begin
    hnd := Input['DBHandle'];

    DataModule2 := TDataModule2.Create(Application.MainForm);
    DataModule2.FIBDatabase.Handle:=TISC_DB_Handle(hnd);

    form := TForm1.Create(Application.MainForm);

    DataModule2.FIBDataSet.Close;
    DataModule2.FIBDataSet.Open;

    form.ShowModal;
    form.Free;
end;

end.
 