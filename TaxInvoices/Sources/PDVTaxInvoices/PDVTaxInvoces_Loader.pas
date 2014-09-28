unit PDVTaxInvoces_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,PDVTaxInvoces_Main, TICommonLoader;

function View_PDVTaxInvoces(AParameter:TObject):Variant;stdcall;
exports View_PDVTaxInvoces;

implementation

function View_PDVTaxInvoces(AParameter:TObject):Variant;
var ViewForm: TPDVTaxInvocesMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TPDVTaxInvocesMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
