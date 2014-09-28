//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника
// Чернявский А.Э. 2006г.
//******************************************************************************
unit Orders_Loader;

interface
uses Classes, cn_dt_Orders_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowOrders(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowOrders;

implementation

function ShowOrders(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmOrders;
begin
 if IsMDIChildFormShow(TfrmOrders) then exit;
 ViewForm := TfrmOrders.Create(AParameter);
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
