unit BankValutaLoader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,BankValutaMainForm, Un_lo_file_Alex;

function View_BankValuta(AParameter:TObject):Variant;stdcall;
exports View_BankValuta;

implementation

function View_BankValuta(AParameter:TObject):Variant;
var ViewForm: TMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TMainForm.Create(TBankSimpleParam(AParameter).Owner,TBankSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
