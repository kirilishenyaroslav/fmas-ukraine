unit SettingProv_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,SettingProv_Main, TICommonLoader;

function View_SettingProvodka(AParameter:TObject):Variant;stdcall;
exports View_SettingProvodka;

implementation

function View_SettingProvodka(AParameter:TObject):Variant;
var ViewForm: TSettingProvMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TSettingProvMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
