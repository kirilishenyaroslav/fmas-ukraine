unit DelCard_Loader;
interface
uses Classes, IBase, PackageLoad, ZProc, Variants,
     Controls, Forms, DelCard_DM, zTypes;

function View_FZDelCard(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZDelCard;

implementation

function View_FZDelCard(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var DM: TDM;
Viplata:variant;
begin
  DM := TDM.Create(Application,Db);
  viplata:=LoadViplata(Application,  DM.DB.Handle,zfsModal);
  if VarType(viplata) and varTypeMask <> VarNull then DM.DoPrint(viplata[0],viplata[1]);
end;

end.
