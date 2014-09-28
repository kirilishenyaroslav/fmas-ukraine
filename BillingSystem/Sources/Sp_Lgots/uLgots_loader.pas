//******************************************************************************
// Проект ""
// Загрузчик справочника льгот
//
//******************************************************************************
unit uLgots_Loader;

interface
uses Classes, uLgots_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPLgots(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPLgots;

implementation

function ShowSPLgots(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmLgots_Main;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmLgots_Main) then exit;

  ViewForm := TfrmLgots_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  if  AParameter.SMode = MultiSelect
   then ViewForm.TreeList_lgots.OptionsSelection.MultiSelect := True;

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
