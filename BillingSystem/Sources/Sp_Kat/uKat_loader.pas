//******************************************************************************
// Проект ""
// Загрузчик справочника категорий
//
//******************************************************************************
unit uKat_Loader;

interface
uses Classes, uKat_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPKat(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPKat;

implementation

function ShowSPKat(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmKat_Main;
  res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmKat_Main) then exit;

  ViewForm := TfrmKat_Main.Create(AParameter);
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
