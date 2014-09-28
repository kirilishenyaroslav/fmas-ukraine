//******************************************************************************
// Проект "Контракты"
// Загрузчик справочника групп пользователей
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_Roles_Loader;

interface
uses Classes, cn_Roles_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSPRoles(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSPRoles;

implementation

function ShowSPRoles(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmRoles;
begin
 if IsMDIChildFormShow(TfrmRoles) then exit;
 ViewForm := TfrmRoles.Create(AParameter.Owner, AParameter.Db_Handle);
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
