//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2007г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************
unit cn_CreditStatus_Loader;

interface
uses Classes, cn_sp_CreditStatusUnit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPCreditStatus(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPCreditStatus;

implementation

function ShowSPCreditStatus(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmCreditStatus;
begin
 if IsMDIChildFormShow(TfrmCreditStatus) then exit;
 ViewForm := TfrmCreditStatus.Create(AParameter.Owner, AParameter.Db_Handle, AParameter.is_admin);
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
