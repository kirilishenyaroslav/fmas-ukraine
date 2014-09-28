unit TITaxInvoices_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TITaxInvoices_Main, TICommonLoader;

function View_TaxInvoices(AParameter:TObject):Variant;stdcall;
exports View_TaxInvoices;

implementation

function View_TaxInvoices(AParameter:TObject):Variant;
var ViewForm: TTaxInvoicesMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTaxInvoicesMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  //if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
