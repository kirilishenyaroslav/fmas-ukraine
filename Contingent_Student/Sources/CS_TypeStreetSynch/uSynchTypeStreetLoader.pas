unit uSynchTypeStreetLoader;

interface
uses Classes, uSynchTypeStr_Main, ucs_Types, Forms, uCS_loader;

function ShowSynchTypeStreetEDBO(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowSynchTypeStreetEDBO;

implementation

function ShowSynchTypeStreetEDBO(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfrmSynchTypeStr_Main;
begin
  if AParameter.Formstyle = fsMDIChild then

  ViewForm := TfrmSynchTypeStr_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

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
