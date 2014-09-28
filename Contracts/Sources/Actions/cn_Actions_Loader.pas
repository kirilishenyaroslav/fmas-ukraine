//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_Actions_Loader;

interface
uses Classes, cn_Actions_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPActions(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPActions;

implementation

function ShowSPActions(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmActions;
begin
 if IsMDIChildFormShow(TfrmActions) then exit;
 ViewForm := TfrmActions.Create(AParameter);
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
