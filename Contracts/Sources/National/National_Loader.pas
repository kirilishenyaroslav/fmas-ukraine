//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника национальностей
// Чернявский А.Э. 2005г.
//******************************************************************************
unit National_Loader;

interface
uses Classes, National_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPNational(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPNational;

implementation

function ShowSPNational(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmNationality;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmNationality) then exit;
 ViewForm := TfrmNationality.Create(AParameter);
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
