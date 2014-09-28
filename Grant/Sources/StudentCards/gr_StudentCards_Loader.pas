unit gr_StudentCards_Loader;

interface

uses Classes, IBase, gr_StudentCards_MainForm, ZProc,
     Controls, gr_uCommonLoader;

function View_StudentCards(AParameter:TObject):Variant;stdcall;
exports View_StudentCards;

implementation

function View_StudentCards(AParameter:TObject):Variant;
var ViewForm: TFStudentCards;
begin
if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;

ViewForm := TFStudentCards.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle);
if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;

end;

end.

