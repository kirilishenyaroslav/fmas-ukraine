unit TaxKredit_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TaxKredit_Main, TICommonLoader;

function View_TaxKredit(AParameter:TObject):Variant;stdcall;
exports View_TaxKredit;

implementation

function View_TaxKredit(AParameter:TObject):Variant;
var ViewForm: TTaxKreditMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTaxKreditMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
