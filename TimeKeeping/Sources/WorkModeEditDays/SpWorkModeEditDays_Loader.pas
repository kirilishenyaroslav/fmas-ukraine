unit SpWorkModeEditDays_Loader;


interface

Uses Classes, IBase, Variants, Controls, Dialogs,
     TuCommonLoader,SpWorkModeEditDays;

function View_WorkModeEditDays(AParameter:TObject):Variant; stdcall;
 exports View_WorkModeEditDays;

implementation

function View_WorkModeEditDays(AParameter:TObject):Variant; stdcall;
var FormEditDays: TFormEditDays;
begin
  FormEditDays :=  TFormEditDays.Create(TTuWorkModeTranscript(AParameter).Owner,
                        TTuWorkModeTranscript(AParameter).DB_Handle,TTuWorkModeTranscript(AParameter).Id);
  FormEditDays.ShowModal;
  FormEditDays.destroy;
end;



end.
