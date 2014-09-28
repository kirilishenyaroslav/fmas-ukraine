unit Notes_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,Notes_Main, TICommonLoader;

function View_Notes(AParameter:TObject):Variant;stdcall;
exports View_Notes;

implementation

function View_Notes(AParameter:TObject):Variant;
var ViewForm: TNotesMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TNotesMainForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
