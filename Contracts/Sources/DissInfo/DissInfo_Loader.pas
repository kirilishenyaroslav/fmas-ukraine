//******************************************************************************
// Проект "Контракты"
// Загрузчик информации о расторжении договора
// Чернявский А.Э. 2006г.
//******************************************************************************
unit DissInfo_Loader;

interface
uses Classes, cn_DissInfo_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDTDissInfo(AParameter:TcnSimpleParamsEx):TDissInfo;stdcall;
exports  ShowDTDissInfo;

implementation

function ShowDTDissInfo(AParameter:TcnSimpleParamsEx):TDissInfo;stdcall;
var ViewForm:TfrmDissInfo;
begin
 if IsMDIChildFormShow(TfrmDissInfo) then exit;
 ViewForm := TfrmDissInfo.Create(AParameter);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else
    ViewForm.ShowModal;
   end;
   Result:=ViewForm.res;
end;

  end.
