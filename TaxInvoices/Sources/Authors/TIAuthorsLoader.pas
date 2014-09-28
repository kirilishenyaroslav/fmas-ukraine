unit TIAuthorsLoader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TIAuthorsProgr, TICommonLoader;

function View_TIAuthors(AParameter:TObject):Variant;stdcall;
exports View_TIAuthors;

implementation

function View_TIAuthors(AParameter:TObject):Variant;
var ViewForm: TTIAuthorsForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTIAuthorsForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;


end.
