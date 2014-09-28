unit Loader_SprDohZarplAndOthers;

interface

uses  Classes, IBase, ZTypes, DM_Main;

function View_SprDohZarplAndOthers(AOwner : TComponent; DB_Handle:TISC_DB_HANDLE; FilterDataSprDoh:TFilterDataSprDoh):Variant;stdcall;
exports View_SprDohZarplAndOthers;

implementation

function View_SprDohZarplAndOthers(AOwner : TComponent;DB_Handle:TISC_DB_HANDLE; FilterDataSprDoh:TFilterDataSprDoh):Variant;
begin
  DM:=TDM.Create(AOwner,DB_Handle,);
  Print(FilterDataSprDoh);
end;
end.
