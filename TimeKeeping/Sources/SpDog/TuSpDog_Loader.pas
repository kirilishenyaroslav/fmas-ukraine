unit TuSpDog_Loader;

interface
uses iBase,Classes,Controls,Variants,SpTuTemplet_ManDog,TuSpDog_DM,SysUtils;

function View_TuSpDog(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AKodSetup:variant;AIdMan:variant):Variant; stdcall;
 exports View_TuSpDog;

implementation

function View_TuSpDog(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AKodSetup:variant; AIdMan:variant):Variant;stdcall;
var Form: TFormMan;
    Res:Variant;
begin

  Dm:=TDm.create(AOwner) ;
  DM.DB.Handle:=ADB_Handle;
  Form:=TFormMan.create(Aowner,AKodSetup, AIdMan);
  Result:=VarArrayCreate([0,5], varVariant);
  if Form.ShowModal=mrYes then
  begin

    Result[0]:=DM.DSet11['RMOVING'];
    Result[1]:=DM.DSet11['ID_POST_MOVING'];
    Result[2]:=DM.DSet1['FIO'];
    Result[3]:=DM.DSet11['NAME_POST'];
    Result[4]:=DM.DSet11['DATE_BEG'];
    Result[5]:=DM.DSet11['DATE_END'];
  end
  else
   Result[0]:=null;
  Form.free;
  DM.Free;
end;


end.
