unit gr_IndexCount_Loader;

interface

uses Classes, IBase,
     Controls, gr_uCommonLoader, gr_IndexCount_MainForm;

function View_IndexCount(AParameter:TObject):Variant;stdcall;
 exports View_IndexCount;

implementation

function View_IndexCount(AParameter:TObject):Variant;
var MainForm: TFIndexCount;
begin
  MainForm:=TFIndexCount.Create(AParameter);
  MainForm.ShowModal;
end;

end.
