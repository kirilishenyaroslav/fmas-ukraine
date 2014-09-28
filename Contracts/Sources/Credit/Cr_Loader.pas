//******************************************************************************
// Проект "Контракты"
// Загрузчик 
// Чернявский А.Э. 2005г.
//******************************************************************************
unit Cr_Loader;

interface
uses Classes, Credit_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowCredit(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowCredit;

implementation

function ShowCredit(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmCredit;
begin
 if IsMDIChildFormShow(TfrmCredit) then exit;
 ViewForm := TfrmCredit.Create(AParameter.Owner, AParameter.Db_Handle);
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
