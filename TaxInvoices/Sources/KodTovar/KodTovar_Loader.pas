unit KodTovar_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,KodTovar_Main, TICommonLoader;

function View_KodTovar(AParameter:TObject):Variant;stdcall;
exports View_KodTovar;

implementation

function View_KodTovar(AParameter:TObject):Variant;
var ViewForm: TKodTovarMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TKodTovarMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
