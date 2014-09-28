//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника форм обучения
// Чернявский А.Э. 2005г.
//******************************************************************************
unit FormStud_Loader;

interface
uses Classes,FormStud_Unit,  cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPFormStud(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPFormStud;

implementation

function ShowSPFormStud(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmFormStud;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmFormStud) then exit;
 ViewForm := TfrmFormStud.Create(AParameter);
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
