//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника категорий обучения
// Чернявский А.Э. 2005г.
//******************************************************************************
unit CategoryStudy_Loader;

interface
uses Classes, CategoryStudy_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPCategoryStudy(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPCategoryStudy;

implementation

function ShowSPCategoryStudy(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmCategoryStudy;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmCategoryStudy) then exit;
 ViewForm := TfrmCategoryStudy.Create(AParameter);
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
