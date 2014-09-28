unit RangeOfDelivery_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,RangeOfDelivery_Main, TICommonLoader;

function View_RangeOfDelivery(AParameter:TObject):Variant;stdcall;
exports View_RangeOfDelivery;

implementation

function View_RangeOfDelivery(AParameter:TObject):Variant;
var ViewForm: TRangeOfDeliveryMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TRangeOfDeliveryMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
