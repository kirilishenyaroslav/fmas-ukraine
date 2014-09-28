//******************************************************************************
// Загрузчик справочника типов документов
//
//******************************************************************************

unit uDocumentType_loader;


interface
uses Classes, uDocumentType_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowSPDocumentType(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowSPDocumentType;

implementation

function ShowSPDocumentType(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmDocumentType_Main;
  res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmDocumentType_Main) then exit;

  ViewForm := TfrmDocumentType_Main.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  if  AParameter.SMode = MultiSelect
   then ViewForm.GridDBView.OptionsSelection.MultiSelect:=true;

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
