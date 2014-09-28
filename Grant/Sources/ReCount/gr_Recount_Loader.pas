unit gr_Recount_Loader;

interface

uses Classes, IBase, gr_Recount_MainForm, ZProc,
     Controls, gr_uCommonLoader;

function View_SpisokReCount(AParameter:TObject):Variant;stdcall;
exports View_SpisokReCount;

implementation

function View_SpisokReCount(AParameter:TObject):Variant;
var ViewForm: TFSpisokReCount;
begin
if ((IsMDIChildFormShow(TFSpisokReCount)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
ViewForm  :=  TFSpisokReCount.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle);
end;

end.

