unit TypeReestr_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TypeReestr_Main, TICommonLoader;

function View_TypeReestr(AParameter:TObject):Variant;stdcall;
exports View_TypeReestr;

implementation

function View_TypeReestr(AParameter:TObject):Variant;
var ViewForm: TTypeReestrMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTypeReestrMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
