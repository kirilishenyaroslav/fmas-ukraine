unit TermsDelivery_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TermsDelivery_Main, TICommonLoader;

function View_TermsDelivery(AParameter:TObject):Variant;stdcall;
exports View_TermsDelivery;

implementation

function View_TermsDelivery(AParameter:TObject):Variant;
var ViewForm: TTermsDeliveryMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTermsDeliveryMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
