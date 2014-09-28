unit TuSpOfficialNote_Loader;

interface

uses SysUtils, Classes,Controls,Variants,TuSpOfficialNote_Main,   TuSpOfficialNote_DM,
TuCommonLoader,TuSpOfficialNote_Filter,dates;
function View_TuSpOfficialNote(AParameter:TObject):Variant; stdcall;
 exports View_TuSpOfficialNote;

implementation

function View_TuSpOfficialNote(AParameter:TObject):Variant;stdcall;
var
  Form: TFormOfficialNote;
  Res:Variant;
  FormFilter:TFormOfficialNote_Filtr;
  ParamFilter:TOfficialNoteFilterParam;
begin
  ParamFilter:=TOfficialNoteFilterParam.create;
  ParamFilter.DateBegActive:=null;
  ParamFilter.DateEndActive:=null;
  ParamFilter.DateBegCreate:=null;
  ParamFilter.DateEndCreate:=null;
  ParamFilter.id_man:=null;
  ParamFilter.id_vihod:=null;
  ParamFilter.rmoving:=null;
  ParamFilter.id_post_moving:=null;
  ParamFilter.is_work_mode:='F';
  ParamFilter.id_work_mode:=null;
  ParamFilter.Owner:=TTuSimpleParam(AParameter).Owner;
  ParamFilter.KodSetup:=TTuSimpleParam(AParameter).KodSetup;
  ParamFilter.DateBegActive:=KodSetupToPeriod(ParamFilter.KodSetup,6);
  ParamFilter.DateEndActive:=datetostr(strtodate(KodSetupToPeriod(ParamFilter.KodSetup+1,6))-1);
  Dm:=TDm.create(TTuSimpleParam(AParameter).Owner) ;
  DM.DB.Handle:=TTuSimpleParam(AParameter).DB_Handle;
  FormFilter:=TFormOfficialNote_Filtr.create(ParamFilter);
  if  FormFilter.ShowModal=mrYes then
  begin
    Form:=TFormOfficialNote.create(ParamFilter);
    Form.Show;
  end;
end;

end.
