//******************************************************************************
// Проект "Биллинговая система"
// Загрузчик начисления
//
//******************************************************************************
unit uAccounts_Loader;

interface
uses Classes, umainaccounts, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPAccounts(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPAccounts;

implementation

function ShowSPAccounts(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmMainAccounts;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmMainAccounts) then exit;

  ViewForm := TfrmMainAccounts.Create(AParameter);
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
