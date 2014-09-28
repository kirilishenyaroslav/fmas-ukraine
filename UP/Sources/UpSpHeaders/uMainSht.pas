unit uMainSht;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      UpSpSigners;

type
    TShtatRep = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TShtatRep.Create;
end;

constructor TShtatRep.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Input.FieldDefs.Add('IdTypeSigner', ftInteger);
    Input.FieldDefs.Add('ModeEdit', ftInteger);
    Output.FieldDefs.Add('Id_Shablon', ftInteger);
    Output.FieldDefs.Add('Name_Post', ftString, 4096);
    Output.FieldDefs.Add('Name_Fio', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TShtatRep.Show;
var
    hn, id, ModeEdit: Integer;
    frm: TfrmSpSigners;
begin
   try
      hn := Input['DBHandle'];
      id := Input['IdTypeSigner'];
      ModeEdit := Input['ModeEdit'];
      frm:=TfrmSpSigners.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn), id, ModeEdit);
      frm.ShowModal;
      frm.Free;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
