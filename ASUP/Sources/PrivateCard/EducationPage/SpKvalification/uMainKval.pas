unit uMainKval;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      UpKval;

type
    TKvalSprav = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TKvalSprav.Create;
end;

constructor TKvalSprav.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Input.FieldDefs.Add('ModeEdit', ftInteger);
    Output.FieldDefs.Add('Id_Kval', ftInteger);
    Output.FieldDefs.Add('Name_Kval', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TKvalSprav.Show;
var
    hn, ModeEdit: Integer;
    frm: TfrmKval;
begin
   try
      hn := Input['DBHandle'];
      ModeEdit := Input['ModeEdit'];
      frm:=TfrmKval.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn), ModeEdit);
      frm.ShowModal;
      frm.Free;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
