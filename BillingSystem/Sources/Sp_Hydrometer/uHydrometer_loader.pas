//******************************************************************************
// Проект ""
// Загрузчик справочника водомеров
//
//******************************************************************************
unit uHydrometer_Loader;

interface
uses Classes, uHydrometer_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPHydrometer(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPHydrometer;

implementation

function ShowSPHydrometer(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmHydrometer_Main;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmHydrometer_Main) then exit;

  ViewForm := TfrmHydrometer_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

{  if  AParameter.SMode = MultiSelect
   then ViewForm.Grid_InputDBView.OptionsSelection.MultiSelect:=true;}

   case ViewForm.FormStyle of
    fsMDIChild	          : ViewForm.Show;
    else
     begin
      ViewForm.ShowModal;
      res := ViewForm.res;
      ViewForm.free;
     end;
    end;
  Result := res;
end;

end.
