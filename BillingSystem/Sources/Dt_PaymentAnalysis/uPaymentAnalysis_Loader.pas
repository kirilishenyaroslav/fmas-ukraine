//******************************************************************************
// Проект "Контракты"
// Загрузчик формы анализа оплаты
// Чернявский А.Э. 2005г.
//******************************************************************************
unit uPaymentAnalysis_Loader;

interface
uses Classes, uPaymentAnalysis_Main, uCommon_Types, Forms, uCommon_Funcs;

function ShowDtPayment(AParameter:TbsSimpleParamsEx):Variant;stdcall;
exports  ShowDtPayment;

implementation

function ShowDtPayment(AParameter:TbsSimpleParamsEx):Variant;stdcall;
var
  ViewForm : TfrmPaymentAnalysis_Main;
  Res : Variant;
begin
  if IsMDIChildFormShow(TfrmPaymentAnalysis_Main) then exit;
  ViewForm := TfrmPaymentAnalysis_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsMDIChild : ViewForm.Show;
    else
     begin
      ViewForm.ShowModal;
      Res := ViewForm.Res;
      ViewForm.free;
     end;
   end;
  Result := res;
end;

  end.
