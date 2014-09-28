//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2005г.
//******************************************************************************
unit cn_fr_Calc_Loader;

interface
uses Classes, cn_fr_CalcUnit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function frCalcReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  frCalcReport;

implementation

function frCalcReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmCalc;
begin
 if IsMDIChildFormShow(TfrmCalc) then exit;
 ViewForm := TfrmCalc.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
//Result:=ViewForm.res;
end;

  end.
