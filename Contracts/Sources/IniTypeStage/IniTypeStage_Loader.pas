//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника периодичностей оплаты
// Чернявский А.Э. 2005г.
//******************************************************************************
unit IniTypeStage_Loader;

interface
uses Classes, IniTypeStage_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowIniTypeStage(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowIniTypeStage;

implementation

function ShowIniTypeStage(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmIniTypeStage;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmIniTypeStage) then exit;
 ViewForm := TfrmIniTypeStage.Create(AParameter);
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
