//******************************************************************************
// Загрузчик справочника типов водомеров
//
//******************************************************************************

unit uHydrometerType_loader;

interface
uses Classes, uHydrometerType_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPHydrometerType(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPHydrometerType;

implementation

function ShowSPHydrometerType(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmHydrometerType_Main;
  res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmHydrometerType_Main) then exit;

  ViewForm := TfrmHydrometerType_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  if  AParameter.SMode = MultiSelect
   then ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;

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
