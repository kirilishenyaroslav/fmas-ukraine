//******************************************************************************
// Проект "Контракты"
// Загрузчик расчетных счетов по-умолчанию
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_DefAccounts_Loader;

interface
uses Classes, cn_DefAccounts_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowDefaultAccounts(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowDefaultAccounts;

implementation

function ShowDefaultAccounts(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmDefAccounts;
begin
 if IsMDIChildFormShow(TfrmDefAccounts) then exit;
 ViewForm := TfrmDefAccounts.Create(AParameter.Owner, AParameter.Db_Handle);
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
