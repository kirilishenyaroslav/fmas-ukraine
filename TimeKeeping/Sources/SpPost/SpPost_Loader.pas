unit SpPost_Loader;

interface
uses iBase,Classes,SpPost_Main,Controls,Variants;

function View_TuSpPost(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant; stdcall;
 exports View_TuSpPost;

implementation

function View_TuSpPost(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant; stdcall;
var Form: TFormPost;
  Res:Variant;
begin
  Form:= TFormPost.Create(AOwner,ADB_Handle);
  if Form.ShowModal=mrYes then
  begin
   Res:= VarArrayCreate([0,2],varVariant);
   Res[0]:=Form.FIO ;
   Res [1]:=Form.Post ;
   result:=Res;
  end
  else
  begin
   Res:= VarArrayCreate([0,2],varVariant);
   Res[0]:='' ;
   Res [1]:='' ;
   result:=Res;
  end;
  Form.Destroy;
end;

end.
