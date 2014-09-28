unit ProtFSS_Loader;

interface

uses Classes, IBase, ProtFSS_MainForm, ZProc,
     Controls;

function View_FZProtFSS(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZProtFSS;

implementation

function View_FZProtFSS(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZProtFSS;
begin
if IsMDIChildFormShow(TFZProtFSS) then Exit;
ViewForm  :=  TFZProtFSS.Create(AOwner, DB);
end;

end.

