unit Subdivision_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,Subdivision_Main, TICommonLoader;

function View_Subdivision(AParameter:TObject):Variant;stdcall;
exports View_Subdivision;

implementation

function View_Subdivision(AParameter:TObject):Variant;
var ViewForm: TSubdivisionMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TSubdivisionMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
