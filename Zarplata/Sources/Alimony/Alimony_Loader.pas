unit Alimony_Loader;

interface

uses Classes, IBase, Alimony_MainForm, ZProc,
     Controls;

function View_FZAlimony(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZAlimony;

implementation

function View_FZAlimony(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZAlimony;
begin
if IsMDIChildFormShow(TFZAlimony) then Exit;
ViewForm  :=  TFZAlimony.Create(AOwner, DB);
end;

end.

