unit gr_CountCurrent_Loader;

interface

uses Classes, IBase, gr_CountCurrent_MainForm, ZProc,
     Controls, gr_uCommonLoader;

function View_CountCurrent(AParameter:TObject):Variant;stdcall;
 exports View_CountCurrent;

implementation

function View_CountCurrent(AParameter:TObject):Variant;
var ViewForm: TFCountCurrent;
begin
if not IsMDIChildFormShow(TFCountCurrent) then
  begin
   ViewForm  :=  TFCountCurrent.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle);
  end; 
end;

end.

