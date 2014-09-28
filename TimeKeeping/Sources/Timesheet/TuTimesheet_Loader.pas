unit TuTimesheet_Loader;

interface
uses iBase,Classes,TuTimesheet_OptionCreate,Controls,Variants,TuCommonLoader,TuTimesheet_DM,Dates,
TuTimesheet_Main,Dialogs;

function View_TuTimesheet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Aid_man:integer;KodSetup:variant;tuFormStyleTh:TtuFormStyleTh):Variant; stdcall;
 exports View_TuTimesheet;
implementation


function View_TuTimesheet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Aid_man:integer; KodSetup:variant;tuFormStyleTh:TtuFormStyleTh):Variant; stdcall;
var FormOption: TFormOptionCreate;
FormMain:TFormTimesheet_Main;
ParamFilter:TParamFilterTsh;
begin
 DM:= TDM.create(Aowner);
 DM.DB.Handle:=ADB_Handle;
 ParamFilter:=TParamFilterTsh.create;
 ParamFilter.Owner:=Aowner;
 ParamFilter.KodSetup:=KodSetup;
 ParamFilter.id:=null;
 ParamFilter.idPostMoving:=null;
 ParamFilter.typeId:=3;
 ParamFilter.nameId:='';
 FormOption:=TFormOptionCreate.create(ParamFilter);
 if FormOption.showModal=mrYes then
 begin
   KodSetup:=PeriodToKodSetup(FormOption.EditYear.Value, FormOption.EditMonth.itemIndex+1);
   ParamFilter:=FormOption.FParam ;
   FormMain:= TFormTimesheet_Main.create(AOwner,Aid_man,tuFormStyleTh,ParamFilter  );
   FormMain.Show;
 end;
 FormOption.free;
end;
end.
