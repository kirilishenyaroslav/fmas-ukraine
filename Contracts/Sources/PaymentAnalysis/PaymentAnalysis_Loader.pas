//******************************************************************************
// Проект "Контракты"
// Загрузчик формы анализа оплаты
// Чернявский А.Э. 2005г.
//******************************************************************************
unit PaymentAnalysis_Loader;

interface
uses Classes, PaymentAnalysis_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowPayment(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowPayment;

implementation

function ShowPayment(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmPayment;
begin
  if IsMDIChildFormShow(TfrmPayment) then exit;
  ViewForm := TfrmPayment.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
   fsMDIChild	          : ViewForm.Show;
  else
   begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
  
  Result:=ViewForm.res;
end;

  end.
