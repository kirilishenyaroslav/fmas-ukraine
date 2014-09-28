//******************************************************************************
// Проект ""
// Загрузчик справочника вводов
//
//******************************************************************************
unit uInputs_Loader;

interface
uses Classes, uInputs_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPInputs(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPInputs;

implementation

function ShowSPInputs(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmInputs_Main;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmInputs_Main) then exit;

  ViewForm := TfrmInputs_Main.Create(AParameter);
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
