//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника информации по документам и проводкам
// Чернявский А.Э. 2005г.
//******************************************************************************
unit cn_DM_kr_db_Loader;

interface
uses Classes, cn_DM_kr_db_Unit_Begin, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDocProvInfo(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports  ShowDocProvInfo;

implementation

function ShowDocProvInfo(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var ViewForm:TfrmDB_KR_Info;
begin
 if IsMDIChildFormShow(TfrmDB_KR_Info) then exit;
 ViewForm := TfrmDB_KR_Info.Create(AParameter);
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
