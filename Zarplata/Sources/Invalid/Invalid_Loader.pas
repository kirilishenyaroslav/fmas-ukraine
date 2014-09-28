unit Invalid_Loader;

interface

uses Classes, IBase, Invalid_MainForm, ZProc,
     Controls;

function View_FZInvalid(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZInvalid;

implementation

function View_FZInvalid(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZInvalid;
begin
if IsMDIChildFormShow(TFZInvalid) then Exit;
ViewForm  :=  TFZInvalid.Create(AOwner, DB);
end;

end.

