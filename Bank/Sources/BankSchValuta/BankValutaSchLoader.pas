unit BankValutaSchLoader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,BankValutaSchMainForm, Un_lo_file_Alex;

function View_BankSchValuta(AParameter:TObject):Variant;stdcall;
exports View_BankSchValuta;

implementation

function View_BankSchValuta(AParameter:TObject):Variant;
var ViewForm: TBankSchValutaMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TBankSchValutaMainForm.Create(TBankSimpleParam(AParameter).Owner,TBankSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
