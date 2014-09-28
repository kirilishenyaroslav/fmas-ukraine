//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit National_Loader;

interface
uses Classes, cn_Sch_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSchToPay(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSchToPay;

implementation

function ShowSchToPay(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmSchToPay;
begin
 if IsMDIChildFormShow(TfrmSchToPay) then exit;
 ViewForm := TfrmSchToPay.Create(AParameter.Owner, AParameter.Db_Handle);
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
