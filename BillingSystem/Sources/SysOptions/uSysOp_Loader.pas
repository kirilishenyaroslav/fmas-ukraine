//******************************************************************************
// Проект "Контракты"
// Загрузчик
// Чернявский А.Э. 2006г.
//******************************************************************************
unit uSysOp_Loader;

interface
uses Classes, uSysOp_Unit, uCommon_Types, Forms, uCommon_Funcs;

function ShowSysOp(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSysOp;

implementation

function ShowSysOp(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmSysOp;
begin
  if IsMDIChildFormShow(TfrmSysOp) then exit;

  ViewForm := TfrmSysOp.Create(AParameter.Owner, AParameter.Db_Handle);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
    else
     begin
      ViewForm.ShowModal;
      ViewForm.free;
     end;
   end;
  Result:=ViewForm.res;
end;

end.
