unit gr_OperationEnd_Loader;

interface

uses Classes, IBase, gr_OperationEnd_MainForm, ZProc,
     Controls, gr_uCommonLoader;

function View_GrOperationEnd(AParameter:TObject;IsRollback:boolean):Variant;stdcall;
exports View_GrOperationEnd;

implementation

function View_GrOperationEnd(AParameter:TObject;IsRollback:boolean):Variant;
var ViewForm: TFgrOperationEnd;
begin
if (AParameter.ClassType<>TgrSimpleParam) then Exit;
ViewForm :=  TFgrOperationEnd.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle,IsRollback);
ViewForm.ShowModal;
ViewForm.Destroy;
end;

end.

