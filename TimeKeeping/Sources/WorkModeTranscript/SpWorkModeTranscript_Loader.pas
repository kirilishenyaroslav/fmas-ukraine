unit SpWorkModeTranscript_Loader;

interface

Uses Classes, IBase, Variants, Controls, Dialogs,
     TuCommonLoader, Calendar_Form;

function View_WorkModeTranscript(AParameter:TObject):Variant; stdcall;
 exports View_WorkModeTranscript;

implementation

function View_WorkModeTranscript(AParameter:TObject):Variant; stdcall;
var FormCalendarWork: TFormCalendarWork;
begin
  FormCalendarWork :=  TFormCalendarWork.Create(TTuWorkModeTranscript(AParameter).Owner,
                        TTuWorkModeTranscript(AParameter).DB_Handle,
                        TTuWorkModeTranscript(AParameter).Id);
  FormCalendarWork.ShowModal;
  FormCalendarWork.Destroy;
end;


end.
