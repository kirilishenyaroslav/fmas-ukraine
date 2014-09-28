unit Calendar_Loader;

interface

Uses Classes, IBase, Variants, Controls, Dialogs,
     Calendar_MainForm, TuCommonLoader;

function View_Calendar(AParameter:TObject):Variant; stdcall;
 exports View_Calendar;

implementation

function View_Calendar(AParameter:TObject):Variant; stdcall;
var ViewForm:TFCalendar;
begin
  ViewForm := TFCalendar.Create(TTuSimpleParam(AParameter).Owner,TTuSimpleParam(AParameter).DB_Handle);
  ViewForm.ShowModal;
  ViewForm.Destroy;
end;


end.
