unit Loader_PaymentType;

interface

uses uCs_types, DMPaymentTypeMain, PaymentTypeMain, Dialogs, Forms;

function View_CSPaymentType(Parameter:TcsPaymentTypeParam):variant;stdcall;
exports View_CSPaymentType;

implementation

function View_CSPaymentType(Parameter:TcsPaymentTypeParam):variant;
begin
  DMMainPaymentType     := TDMMainPaymentType.Create(Parameter);
  FMainPaymentType      := TFMainPaymentType.Create(Parameter);

  if (CSSelect in Parameter.Mode)    then
  begin
    FMainPaymentType.FormStyle:=fsNormal;
    FMainPaymentType.Visible:=False;

    FMainPaymentType.ShowModal;
    DMMainPaymentType.Free;
  end
  else
  if (CSEdit in Parameter.Mode) then
  begin
    FMainPaymentType.FormStyle:=fsMDIChild;
    FMainPaymentType.Show;
  end
  else
  if (CSShow in Parameter.Mode) then
  begin
    FMainPaymentType.FormStyle:=fsMDIChild;
    FMainPaymentType.Show;
  end;



end;

end.
