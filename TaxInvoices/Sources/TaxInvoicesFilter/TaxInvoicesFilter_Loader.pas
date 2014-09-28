unit TaxInvoicesFilter_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TaxInvoicesFilterCustomer, TICommonLoader,
     TiCommonTypes,TaxInvoicesFilterSubdivision,TaxInvoicesFilterBudget,
     TaxInvoicesFilterTypeNakl;

function View_TaxInvoicesFilter(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE; type_filter : Integer):Variant; stdcall;
exports View_TaxInvoicesFilter;

implementation

function View_TaxInvoicesFilter(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;type_filter : Integer):Variant;
var
  ViewFormCustomer: TTaxInvoicesFilterCustomerForm;
  ViewFormSubdivision: TTaxInvoicesFilterSubdivisionForm;
  ViewFormBudget: TTaxInvoicesFilterBudgetForm;
  ViewFormTypeNakl :TTaxInvoicesTypeNaklForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  if type_filter = 1 // фильтр по контрагенту
  then
  begin
    ViewFormCustomer := TTaxInvoicesFilterCustomerForm.Create(AOwner,DB_Handle);
    if(ViewFormCustomer.ShowModal=mrYes)then
    Result:=ViewFormCustomer.Res;
  end;

  if type_filter = 2 // фильтр по подразделениям
  then
  begin
    ViewFormSubdivision := TTaxInvoicesFilterSubdivisionForm.Create(AOwner,DB_Handle);
    if(ViewFormSubdivision.ShowModal=mrYes)then
    Result:=ViewFormSubdivision.Res;
  end;

  if type_filter = 3 // фильтр по бюджетам
  then
  begin
    ViewFormBudget := TTaxInvoicesFilterBudgetForm.Create(AOwner,DB_Handle);
    if(ViewFormBudget.ShowModal=mrYes)then
    Result:=ViewFormBudget.Res;
  end;

  if type_filter = 4 // фильтр по типу налоговой накладной
  then
  begin
    ViewFormTypeNakl := TTaxInvoicesTypeNaklForm.Create(AOwner,DB_Handle);
    if(ViewFormTypeNakl.ShowModal=mrYes)then
    Result:=ViewFormTypeNakl.Res;
  end;
end;

end.
