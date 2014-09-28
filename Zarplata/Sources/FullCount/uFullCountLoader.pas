unit uFullCountLoader;

interface

uses Classes, iBase, Dialogs, Variants, zProc, unit_NumericConsts;

function FormShow(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE):variant;stdcall;
  exports FormShow;

implementation

uses uFullCountMain;

function FormShow(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE):variant;
var Kod_Action:integer;
    FormData:TfFullCount;
    Is_Finished:boolean;
    Name_Action:string;
begin
 Result:=NULL;

 Kod_action:=0;
 Is_Finished:=False;

 CurrentAction(DB_Handle,Kod_Action,Is_Finished);
 if (Is_Finished) and (Kod_Action=FullCountAction) then Exit
 else
    begin
      FormData := TfFullCount.Create(AOwner,DB_Handle);
      FormData.ShowModal;
    end;
end;

end.
