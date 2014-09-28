unit uReportsLoader;

interface
uses Classes, BsRepLoader, uCommon_Types, Forms, uCommon_Funcs;

function ShowReports(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowReports;

implementation

function ShowReports(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmReportLoader;
  ResDoc : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmReportLoader) then exit;

  ViewForm := TfrmReportLoader.Create(AParameter);
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
