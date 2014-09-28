unit SpecialNotes_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,SpecialNotes_Main, TICommonLoader;

function View_SpecialNotes(AParameter:TObject):Variant;stdcall;
exports View_SpecialNotes;

implementation

function View_SpecialNotes(AParameter:TObject):Variant;
var ViewForm: TSpecialNotesMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TSpecialNotesMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
