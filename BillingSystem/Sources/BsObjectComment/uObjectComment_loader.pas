//******************************************************************************
// Загрузчик справочника типов документов
//
//******************************************************************************

unit uObjectComment_loader;


interface
uses Classes, uObjectComment_main, uCommon_Types, Forms, uCommon_Funcs;

function ShowObjectComment(AParameter:TbsSimpleParams):Variant;stdcall;
exports  ShowObjectComment;

implementation

function ShowObjectComment(AParameter:TbsSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmObjectComment;
  res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
   if IsMDIChildFormShow(TfrmObjectComment) then exit;

  ViewForm := TfrmObjectComment.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  if  AParameter.SMode = MultiSelect
  then ViewForm.CommentGridDBView.OptionsSelection.MultiSelect:=true;

   case ViewForm.FormStyle of
        fsMDIChild : ViewForm.Show;
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
