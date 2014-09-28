unit Measures_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,Measures_Main, TICommonLoader;

function View_Measures(AParameter:TObject):Variant;stdcall;
exports View_Measures;

implementation

function View_Measures(AParameter:TObject):Variant;
var ViewForm: TMeasuresMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TMeasuresMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
