//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_Log_Loader;

interface
uses Classes, cn_Log_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowLog(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowLog;

implementation

function ShowLog(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmLog;
begin
 if IsMDIChildFormShow(TfrmLog) then exit;
 ViewForm := TfrmLog.Create(AParameter);
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
