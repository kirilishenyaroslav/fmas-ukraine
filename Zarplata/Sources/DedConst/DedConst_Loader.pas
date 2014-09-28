unit DedConst_Loader;

interface

uses Classes, IBase, DedConst_MainForm, ZProc,
     Controls;

function View_FZDedConst(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZDedConst;

implementation

function View_FZDedConst(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZDedConst;
begin
if IsMDIChildFormShow(TFZDedConst) then Exit;
ViewForm  :=  TFZDedConst.Create(AOwner, DB);
end;

end.

