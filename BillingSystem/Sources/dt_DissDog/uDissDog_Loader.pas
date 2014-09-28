//******************************************************************************
// Проект ""
// Загрузчик информации о расторжении договора
// 
//******************************************************************************
unit uDissDog_Loader;

interface
uses Classes, uDissDog_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowDTDissDog(AParameter:TbsSimpleParamsEx):Variant;stdcall;
exports  ShowDTDissDog;

implementation

function ShowDTDissDog(AParameter:TbsSimpleParamsEx):Variant;stdcall;
var
  ViewForm : TfrmDissDog_Main;
  Res : Variant; 
begin
  if IsMDIChildFormShow(TfrmDissDog_Main) then exit;

  ViewForm := TfrmDissDog_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsMDIChild : ViewForm.Show;
    else
     Begin
      ViewForm.ShowModal;
      res := ViewForm.res;
      ViewForm.Free;
     end
   end;
   Result := res;
end;

end.
