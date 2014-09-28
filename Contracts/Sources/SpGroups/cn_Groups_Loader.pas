//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника групп
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_Groups_Loader;

interface
uses Classes, cn_SpUnit_Groups, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPGroups(AParameter:TcnSourceStudInfParams):Variant;stdcall;
exports  ShowSPGroups;

implementation

function ShowSPGroups(AParameter:TcnSourceStudInfParams):Variant;stdcall;
var ViewForm:TfrmGroups;
begin
 if IsMDIChildFormShow(TfrmGroups) then exit;
 ViewForm := TfrmGroups.Create(AParameter);
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
