unit SpTuDep_Loader;

interface
uses iBase,Classes,SpTuDep_Main,Controls,Variants;

function View_TuSpDep(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer):Variant; stdcall;
 exports View_TuSpDep;

implementation

function View_TuSpDep(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer):Variant; stdcall;
var Form: TFormDep_Main;
  Res:Variant;
begin
  Form:= TFormDep_Main.Create(AOwner,ADB_Handle,Root,DateActual,ShowDelete, IdProperty);
  if Form.ShowModal=mrYes then
  begin
   Res:= VarArrayCreate([0,2],varVariant);
   Res[0]:=Form.IdDepartment ;
  // Res [1]:=Form.Post ;
   result:=Res;
  end
  else
  begin
   Res:= VarArrayCreate([0,2],varVariant);
   Res[0]:='' ;
  // Res [1]:='' ;
   result:=Res;
  end;
  Form.Destroy;
end;

end.
