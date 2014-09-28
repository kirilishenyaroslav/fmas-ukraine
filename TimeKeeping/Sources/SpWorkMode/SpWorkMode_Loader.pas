unit SpWorkMode_Loader;

interface

Uses Classes, IBase, Variants, Controls, Dialogs,
     TuCommonLoader, SpWorkMode_MainForm, TuCommontypes, forms,SpWorkMode_DM,
     TuWorkMode_Filter;

function View_SpWorkMode(AParameter:TObject):Variant; stdcall;
 exports View_SpWorkMode;

implementation

function View_SpWorkMode(AParameter:TObject):Variant; stdcall;
var FSpWorkMode_MainForm: TFSpWorkMode_MainForm;
    ParamFilter :TWorkModeFilterParam;
    FormParam:TFormWorkMode_Filter;
    DModule:TDModule;
begin
  DModule:=TDModule.Create(TTuSimpleParam(AParameter).Owner);
  DModule.DB.Handle:=TTuSimpleParam(AParameter).DB_Handle;
  ParamFilter :=TWorkModeFilterParam.create;
  ParamFilter.DateBegActive:=null;
  ParamFilter.DateEndActive:=null;
  ParamFilter.id_man:=null;
  ParamFilter.rmoving:=null;
  ParamFilter.id_post_moving:=null;
  ParamFilter.DateBeg:=null;
  ParamFilter.DateEnd:=null;
  ParamFilter.Owner:= TTuSimpleParam(AParameter).Owner;
  ParamFilter.KodSetup:=TTuSimpleParam(AParameter).KodSetup;
  ParamFilter.FormStyle:=TTuSimpleParam(AParameter).CFStyle;
  if ParamFilter.FormStyle= tfsChild  then        //обычное
  begin
    FormParam:=TFormWorkMode_Filter.create(ParamFilter,DModule);
    if FormParam.showModal=mrYes then
    begin
      FSpWorkMode_MainForm := TFSpWorkMode_MainForm.Create(ParamFilter,DModule, TTuSimpleParam(AParameter).id, false  );
      FSpWorkMode_MainForm.FormStyle:=fsMDIChild;
      FSpWorkMode_MainForm.WindowState:=wsMaximized;
      FSpWorkMode_MainForm.Show;
    end;
  end;
  if (TTuSimpleParam(AParameter).CFStyle= tfsmodal) or (TTuSimpleParam(AParameter).CFStyle= tfsmodalParent ) then
  begin
    if  TTuSimpleParam(AParameter).CFStyle= tfsmodalParent then
    begin
      FSpWorkMode_MainForm := TFSpWorkMode_MainForm.Create(ParamFilter,DModule, TTuSimpleParam(AParameter).id, true  )
    end
    else
      FSpWorkMode_MainForm := TFSpWorkMode_MainForm.Create(ParamFilter,DModule, TTuSimpleParam(AParameter).id, false  );
    FSpWorkMode_MainForm.FormStyle:=fsNormal;
    FSpWorkMode_MainForm.Visible:=false;

    if  FSpWorkMode_MainForm.ShowModal=mrYes then
    begin
      Result:=VarArrayCreate([0,5], varVariant);
      Result[0]:=DModule.DSetMain['ID_WORK_MODE'];
      Result[1]:=DModule.DSetMain['NAME'];
      Result[2]:=DModule.DSetMain['COUNT_DAY'];
    end;
  end;
end;


{ TTuTemplet }



end.
