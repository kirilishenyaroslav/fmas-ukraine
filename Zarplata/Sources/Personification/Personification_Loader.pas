unit Personification_Loader;

interface

uses Classes, IBase, Personification_MainForm, ZProc,
     Controls;

function View_Personification(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_Personification;

implementation

function View_Personification(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TMainFormF1df;
begin
if IsMDIChildFormShow(TMainFormF1df) then Exit;
ViewForm  :=  TMainFormF1df.Create(AOwner, DB);
end;

end.

