//******************************************************************************
// Проект "Контракты"
// Загрузчик Графика начислений
// Перчак А.Л. 2009
//******************************************************************************
unit Calc_Loader;

interface
uses Classes, uCalc, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDtCalc(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowDtCalc;

implementation

function ShowDtCalc(AParameter:TcnSimpleParams):Variant;stdcall;
  var ViewForm:TfrmCalc;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmCalc) then exit;
  ViewForm := Tfrmcalc.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
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
