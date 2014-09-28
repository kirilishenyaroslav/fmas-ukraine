unit uDocumentLoader;

interface
uses Classes, BsDocumentMain, uCommon_Types, Forms, uCommon_Funcs;

function ShowDocuments(AParameter:TBsSimpleParams):Variant;stdcall;
exports  ShowDocuments;

implementation

function ShowDocuments(AParameter:TBsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmDocument;
  ResDoc : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmDocument) then exit;

  ViewForm := TfrmDocument.Create(AParameter);
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
      ResDoc := ViewForm.ResDocument;
      ViewForm.free;
     end;
    end;
  Result := ResDoc;
end;

end.
