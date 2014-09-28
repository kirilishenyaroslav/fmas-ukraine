unit uMainMinCat;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      MinCategoryMain;

type
    TCatTarifGrid = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TCatTarifGrid.Create;
end;

constructor TCatTarifGrid.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    PrepareMemoryDatasets;
end;

procedure TCatTarifGrid.Show;
var
    hn, Id: Integer;
    frm: TfrmMinCategory;
begin
  try
    hn := Input['DBHandle'];
    frm:=TfrmMinCategory.Create(Application.MainForm, Id);
    frm.WDBase.Handle:=TISC_DB_Handle(hn);
    frm.MinCatDSet.Close;
    frm.MinCatDSet.SQLs.SelectSQL.Text:='select distinct * from SP_MIN_CATEGORY_SEL';
    frm.MinCatDSet.Open;
    frm.WindowState:=wsMaximized;
  except on e:Exception
         do ShowMessage(e.Message);
  end;
end;

end.
