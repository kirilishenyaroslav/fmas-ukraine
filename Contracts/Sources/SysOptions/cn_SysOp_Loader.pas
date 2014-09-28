//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit cn_SysOp_Loader;

interface
uses Classes, cn_SysOp_Unit, cn_Common_Types, Forms,
     cn_Common_Funcs;

function ShowSysOp(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSysOp;

implementation

function ShowSysOp(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmSysOp;
begin
 if IsMDIChildFormShow(TfrmSysOp) then exit;
 ViewForm := TfrmSysOp.Create(AParameter.Owner, AParameter.Db_Handle);
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
