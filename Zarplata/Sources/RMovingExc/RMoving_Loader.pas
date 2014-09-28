unit RMoving_Loader;

interface

uses Classes, IBase, RMoving_MainForm, ZProc,
     Controls;

function View_FZRMovingExc(AOwner : TComponent;DB:TISC_DB_HANDLE;RMoving:Integer):Variant;stdcall;
exports View_FZRMovingExc;

implementation

function View_FZRMovingExc(AOwner : TComponent;DB:TISC_DB_HANDLE;RMoving:Integer):Variant;
var ViewForm: TFZRmovingExc;
begin
  if IsMDIChildFormShow(TFZRmovingExc) then Exit;
  ViewForm  :=  TFZRmovingExc.Create(AOwner, DB, RMoving);
end;

end.

