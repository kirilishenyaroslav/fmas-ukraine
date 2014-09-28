unit NonSpisok_Loader;

interface

uses Classes, IBase, NonSpisok_MainForm, ZProc,
     Controls;

function View_FZNonSpisok(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
 exports View_FZNonSpisok;

implementation

function View_FZNonSpisok(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZNonSpisok;
begin
if IsMDIChildFormShow(TFZNonSpisok) then Exit;
ViewForm  :=  TFZNonSpisok.Create(AOwner, DB);
end;

end.

