//******************************************************************************
// Проект ""
// Загрузчик справочника категорий
//
//******************************************************************************
unit uSubsidy_Loader;

interface
uses Classes, uSubsidy_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPSubsidy(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPSubsidy;

implementation

function ShowSPSubsidy(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmSubsidy_Main;
  res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmSubsidy_Main) then exit;

  ViewForm := TfrmSubsidy_Main.Create(AParameter);
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
