unit FormCalculations_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,FormCalculations_Main, TICommonLoader;

function View_FormCalculations(AParameter:TObject):Variant;stdcall;
exports View_FormCalculations;

implementation

function View_FormCalculations(AParameter:TObject):Variant;
var ViewForm: TFormCalculationsMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TFormCalculationsMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
