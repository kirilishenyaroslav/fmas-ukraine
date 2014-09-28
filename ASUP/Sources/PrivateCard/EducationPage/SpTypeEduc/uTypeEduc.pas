unit uTypeEduc;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      TypeEducMain;

type
    TSpravTypeEduc = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TSpravTypeEduc.Create;
end;

constructor TSpravTypeEduc.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Output.FieldDefs.Add('Id_Educ', ftInteger);
    Output.FieldDefs.Add('Name_Educ', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TSpravTypeEduc.Show;
var
    hn: Integer;
    frm: TfrmTypeEduc;
begin
   try
      hn := Input['DBHandle'];
      frm:=TfrmTypeEduc.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn));
      frm.ShowModal;
      frm.Free;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
