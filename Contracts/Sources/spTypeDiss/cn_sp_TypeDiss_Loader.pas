//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2005г.
//******************************************************************************
unit cn_sp_TypeDiss_Loader;

interface
uses Classes, cn_sp_TypeDiss_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPTypeDiss(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPTypeDiss;

implementation

function ShowSPTypeDiss(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmIninTypeDiss;
begin
 if IsMDIChildFormShow(TfrmIninTypeDiss) then exit;
 ViewForm := TfrmIninTypeDiss.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   if  AParameter.SMode = MultiSelect then
  ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;
  
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
