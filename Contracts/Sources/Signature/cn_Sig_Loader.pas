//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************
unit cn_Sig_Loader;

interface
uses Classes, cn_Sig_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPSignature(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPSignature;

implementation

function ShowSPSignature(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmSig;
begin
 if IsMDIChildFormShow(TfrmSig) then exit;
 ViewForm := TfrmSig.Create(AParameter.Owner, AParameter.Db_Handle, AParameter.is_admin);
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
