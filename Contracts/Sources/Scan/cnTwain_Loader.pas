//******************************************************************************
// Проект "Контракты"
// Загрузчик сканирования
// Чернявский А.Э. 2007г.
//******************************************************************************
unit cnTwain_Loader;

interface
uses Classes, MainTwain, cn_Common_Types, Forms,
     cn_Common_Funcs;

function cnLoadTwain(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  cnLoadTwain;

implementation

function cnLoadTwain(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmTwain;
begin
 if IsMDIChildFormShow(TfrmTwain) then exit;
 ViewForm := TfrmTwain.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
Result:=ViewForm.res;
end;

  end.
