unit uMainSpec;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      UpSpec;

type
    TSpecSprav = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TSpecSprav.Create;
end;

constructor TSpecSprav.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Input.FieldDefs.Add('ModeEdit', ftInteger);
    Output.FieldDefs.Add('Id_Spec', ftInteger);
    Output.FieldDefs.Add('Name_Spec', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TSpecSprav.Show;
var
    hn, ModeEdit: Integer;
    frm: TfrmSpec;
begin
   try
      hn := Input['DBHandle'];
      ModeEdit := Input['ModeEdit'];
      frm:=TfrmSpec.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn), ModeEdit);
      frm.ShowModal;
      frm.Free;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
