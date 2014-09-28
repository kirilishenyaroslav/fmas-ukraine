unit uPensionCategory;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      PensionCategoryMain;

type
    TSpravPensCat = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TSpravPensCat.Create;
end;

constructor TSpravPensCat.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Output.FieldDefs.Add('Id_Pension_Cat', ftInteger);
    Output.FieldDefs.Add('Name_Pension_Cat', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TSpravPensCat.Show;
var
    hn: Integer;
    frm: TfrmPensionCategory;
begin
   try
      hn := Input['DBHandle'];
      frm:=TfrmPensionCategory.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn));
      frm.ShowModal;
      frm.Free;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
