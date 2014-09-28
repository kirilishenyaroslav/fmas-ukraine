unit uUnivRepLoader;

interface
uses Classes, BsUnivRep, uCommon_Types, Forms, uCommon_Funcs;

function ShowUnivReport(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowUnivReport;

implementation

function ShowUnivReport(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmUnivReport;
  ResDoc : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmUnivReport) then exit;

  ViewForm := TfrmUnivReport.Create(AParameter);
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
      ViewForm.free;
     end;
    end;
  Result := ResDoc;
end;

end.
