//******************************************************************************
// Проект ""
// Загрузчик
//
//******************************************************************************
unit uTypeDiss_Loader;

interface
uses Classes, uTypeDiss_Main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPTypeDiss(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPTypeDiss;

implementation

function ShowSPTypeDiss(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmTypeDiss_Main;
  Res : Variant;
begin
  if IsMDIChildFormShow(TfrmTypeDiss_Main) then exit;

  ViewForm := TfrmTypeDiss_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
    fsMDIChild	          : ViewForm.Show;
   else
    begin
     ViewForm.ShowModal;
     Res := ViewForm.res;
     ViewForm.free;
    end;
  end;
  Result := res;
end;

end.
