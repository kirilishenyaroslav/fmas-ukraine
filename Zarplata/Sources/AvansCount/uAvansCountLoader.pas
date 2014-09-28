unit uAvansCountLoader;

interface

uses Classes, iBase, Dialogs, Variants, uAvansData, zProc;

function FormShow(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE):variant;stdcall;
  exports FormShow;

implementation

uses uAvansCountMain;

            


function FormShow(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE):variant;
var Kod_Action:integer;
    FormData:TfAvansCount;
    ViewForm  :TFAvansData;
    Is_Finished:boolean;
    Name_Action:string;
begin
     Result:=NULL;
     Kod_action:=0;
     Is_Finished:=False;
     CurrentAction(DB_Handle,Kod_Action,Is_Finished);

     FormData := TfAvansCount.Create(AOwner,DB_Handle);
     FormData.ShowModal;
     FormData.Free;
end;

end.
