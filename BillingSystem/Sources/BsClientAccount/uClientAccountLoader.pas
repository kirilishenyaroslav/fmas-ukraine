unit uClientAccountLoader;

interface
uses Classes, BsClient, uCommon_Types, Forms, uCommon_Funcs;

function ShowClientAccount(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowClientAccount;

implementation

function ShowClientAccount(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmClientAccount;
  ResClient : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmClientAccount) then exit;

  ViewForm := TfrmClientAccount.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  //if  AParameter.SMode = MultiSelect then ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;

   case ViewForm.FormStyle of fsMDIChild:
     begin
       ViewForm.Show;
       //ViewForm.WindowState:=wsMaximized;
      end
      else
     begin
      ViewForm.ShowModal;
      ResClient := ViewForm.ResAcClient;
      ViewForm.free;
     end;
    end;
  Result := ResClient;
end;

end.
