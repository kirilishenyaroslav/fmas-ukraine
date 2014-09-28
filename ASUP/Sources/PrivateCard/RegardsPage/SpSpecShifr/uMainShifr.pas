unit uMainShifr;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      SpecShifr;

type
    TShifrSpec = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TShifrSpec.Create;
end;

constructor TShifrSpec.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Input.FieldDefs.Add('ModeEdit', ftInteger);
    Output.FieldDefs.Add('Id_Shifr_Spec', ftInteger);
    Output.FieldDefs.Add('Num_Shifr', ftString, 4096);
    Output.FieldDefs.Add('Name_Spec', ftString, 4096);
    Output.FieldDefs.Add('Name_All', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TShifrSpec.Show;
var
    hn, ModeEdit: Integer;
    frm: TfrmSpecShifr;
begin
   try
      hn := Input['DBHandle'];
      ModeEdit := Input['ModeEdit'];
      frm:=TfrmSpecShifr.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn), ModeEdit);
      frm.ShowModal;
      frm.Free;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
