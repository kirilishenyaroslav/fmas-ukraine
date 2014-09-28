unit MortgageTara_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,MortgageTara_Main, TICommonLoader;

function View_MortgageTara(AParameter:TObject):Variant;stdcall;
exports View_MortgageTara;

implementation

function View_MortgageTara(AParameter:TObject):Variant;
var ViewForm: TMortgageTaraMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TMortgageTaraMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
