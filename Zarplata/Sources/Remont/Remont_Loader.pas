unit Remont_Loader;

interface

uses Classes, IBase, Remont_MainForm, ZProc,
     Controls;

function View_FZRemont(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZRemont;

implementation

function View_FZRemont(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZRemont;
begin
if IsMDIChildFormShow(TFZRemont) then Exit;
ViewForm  :=  TFZRemont.Create(AOwner, DB);
end;

end.

