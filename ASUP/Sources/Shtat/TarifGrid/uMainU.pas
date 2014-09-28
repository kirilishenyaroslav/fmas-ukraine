unit uMainU;

interface

uses  uCommonSp, DB, Forms, Dialogs, Controls, IBase, Variants, SysUtils,
      TarifGridMain;

type
    TTarifGrid = class(TSprav)
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TTarifGrid.Create;
end;

constructor TTarifGrid.Create;
begin
    inherited Create;
    // ןמהדמעמגטעü ןאנאלוענû
    Input.FieldDefs.Add('DateBegIn', ftDate);
    Input.FieldDefs.Add('DateEndIn', ftDate);
    Output.FieldDefs.Add('Id_Cat_Tarif_Grid', ftInteger);
    Output.FieldDefs.Add('Num_Category', ftInteger);
    Output.FieldDefs.Add('Full_Name', ftString, 4096);
    Output.FieldDefs.Add('Name_Tarif', ftString, 4096);
    Output.FieldDefs.Add('Name_Category', ftString, 4096);
    Output.FieldDefs.Add('Rate_Out', ftFloat);
    Output.FieldDefs.Add('Date_Beg', ftDate);
    Output.FieldDefs.Add('Date_End', ftDate);
    Output.FieldDefs.Add('Id_Category_Tarif', ftInteger);
    PrepareMemoryDatasets;
end;

procedure TTarifGrid.Show;
var
    hn: Integer;
    frm: TfrmTarifGrid;
    DBeg, DEnd:TDate;
begin
   try
      hn := Input['DBHandle'];
      DBeg:=Input['DateBegIn'];
      DEnd:=Input['DateEndIn'];
      frm:=TfrmTarifGrid.Create(Application.MainForm, OutPut, TISC_DB_HANDLE(hn),
                                Input['ShowStyle'], DBeg, DEnd);
      if (Input['ShowStyle'] = 0) then
      begin
        frm.ShowModal;
        frm.Free;
      end
      else
      begin
        frm.FormStyle := fsMDIChild;
        frm.WindowState := wsMaximized;
      end;
      //frm.WindowState:=wsMaximized;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

end.
