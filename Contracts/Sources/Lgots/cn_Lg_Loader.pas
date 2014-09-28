//******************************************************************************
// Проект "Контракты"
// Загрузчик льгот
// Чернявский А.Э. 2005г.
//******************************************************************************
unit cn_Lg_Loader;

interface
uses Classes, cn_Lgots_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDTLgots(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowDTLgots;

implementation

function ShowDTLgots(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmLgots;
begin
 if IsMDIChildFormShow(TfrmLgots) then exit;
 ViewForm := TfrmLgots.Create(AParameter);
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
