//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника типов льгот
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_IniTypeLgot_Loader;

interface
uses Classes, cn_IniTypeLgot_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPIniTypeLgot(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPIniTypeLgot;

implementation

function ShowSPIniTypeLgot(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmIniTypeLgot;
begin
 if IsMDIChildFormShow(TfrmIniTypeLgot) then exit;
 ViewForm := TfrmIniTypeLgot.Create(AParameter);
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
