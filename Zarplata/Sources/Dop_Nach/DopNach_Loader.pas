unit DopNach_Loader;

interface

uses Classes, IBase, DopNach_MainForm, ZProc,
     Controls;

function View_FZDopNach(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZDopNach;

implementation

function View_FZDopNach(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZDopNach;
begin
if IsMDIChildFormShow(TFZDopNach) then Exit;
ViewForm  :=  TFZDopNach.Create(AOwner, DB);
end;

end.

