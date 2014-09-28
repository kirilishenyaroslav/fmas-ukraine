//******************************************************************************
// Проект ""
// Загрузчик справочника горячих клавиш
//
//******************************************************************************
unit uShortCut_Loader;

interface
uses Classes, uShortCut_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPShortCut(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPShortCut;

implementation

function ShowSPShortCut(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmShortCut_Main;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmShortCut_Main) then exit;

  ViewForm := TfrmShortCut_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

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
