//******************************************************************************
// Загрузчик справочника видов водомеров
//
//******************************************************************************

unit uHydrometerVid_loader;

interface

uses Classes, uHydrometerVid_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPHydrometerVid(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPHydrometerVid;

implementation

function ShowSPHydrometerVid(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmHydrometerVid_Main;
  res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmHydrometerVid_Main) then exit;

  ViewForm := TfrmHydrometerVid_Main.Create(AParameter);
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
