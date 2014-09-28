unit uSynchEDBO_Loader;

interface
uses Classes, uSynchEDBO_Main, cn_Common_Types, Forms, cn_Common_Funcs;

function ShowSynchEDBO(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowSynchEDBO;

implementation

function ShowSynchEDBO(AParameter:TcnSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmSynchEDBO_Main;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmSynchEDBO_Main) then exit;
  ViewForm := TfrmSynchEDBO_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  if  AParameter.SMode = MultiSelect then
  ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else
    begin
     ViewForm.ShowModal;
     ViewForm.free;
    end;
   end;
  Result:=ViewForm.res;
end;

  end.
