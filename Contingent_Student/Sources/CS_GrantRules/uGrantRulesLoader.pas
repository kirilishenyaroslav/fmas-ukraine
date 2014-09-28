unit uGrantRulesLoader;

interface
uses Classes, uGrantRulesMain, uCS_types, Forms, uCS_loader;

function ShowGrantRules(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowGrantRules;

implementation

function ShowGrantRules(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmGrantRulesMain;
begin
  ViewForm := TfmGrantRulesMain.Create(AParameter);
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

end;

end.
