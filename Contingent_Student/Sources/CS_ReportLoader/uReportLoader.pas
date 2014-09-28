unit uReportLoader;


interface
uses Classes, uReportLoaderMain, uCs_Types, Forms, uCs_loader;

function ShowReportLoader(AParameter:TcsParamPacks):Variant;stdcall;
exports  ShowReportLoader;

implementation

function ShowReportLoader(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmReportLoaderMain;
begin
  ViewForm := TfmReportLoaderMain.Create(AParameter);
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
