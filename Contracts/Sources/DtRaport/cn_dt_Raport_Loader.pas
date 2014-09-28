//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_dt_Raport_Loader;

interface
uses Classes, cn_dt_Raport_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowRaport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowRaport;

implementation

function ShowRaport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmRaport;
begin
 if IsMDIChildFormShow(TfrmRaport) then exit;
 ViewForm := TfrmRaport.Create(AParameter);
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
