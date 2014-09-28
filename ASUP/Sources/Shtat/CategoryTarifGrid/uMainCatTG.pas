unit uMainCatTG;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      CatTarifGridMain;

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
    Input.FieldDefs.Add('IdTarifGrid', ftInteger);
    Input.FieldDefs.Add('FormCaption', ftString, 255);
    PrepareMemoryDatasets;
end;

procedure TCatTarifGrid.Show;
var
    hn, Id: Integer;
    frm: TfrmCatTarifGrid;
begin
  try
    hn := Input['DBHandle'];
    Id:=Input['IdTarifGrid'];
    frm:=TfrmCatTarifGrid.Create(Application.MainForm, Id);
    frm.Caption:=frm.Caption+': '+Input['FormCaption'];
    frm.WDBase.Handle:=TISC_DB_Handle(hn);
    frm.CatTarifGridDSet.Close;
    frm.CatTarifGridDSet.SQLs.SelectSQL.Text:='select distinct * from up_category_tarif_grid_sel(:id)';
    frm.CatTarifGridDSet.ParamByName('id').AsInteger:=Id;
    frm.CatTarifGridDSet.Open;
    frm.ShowModal;
    frm.Free;
  except on e:Exception
         do ShowMessage(e.Message);
  end;
end;

end.
