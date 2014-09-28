//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.

//******************************************************************************
unit cn_sp_RapStatus_Loader;

interface
uses Classes, cn_sp_RapStatus, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPRapStatus(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPRapStatus;

implementation

function ShowSPRapStatus(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmSpRapStatus;
begin
 if IsMDIChildFormShow(TfrmSpRapStatus) then exit;
 ViewForm := TfrmSpRapStatus.Create(AParameter.Owner, AParameter.Db_Handle, AParameter.is_admin);
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
