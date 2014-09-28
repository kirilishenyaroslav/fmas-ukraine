unit f1df_Loaderm;

interface

uses Classes, IBase, f1dfMainFormm, ZProc,
     Controls;

function View_F1df(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_F1df;

implementation

function View_F1df(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TMainFormF1df;
begin
if IsMDIChildFormShow(TMainFormF1df) then Exit;
ViewForm  :=  TMainFormF1df.Create(AOwner, DB);
end;

end.

