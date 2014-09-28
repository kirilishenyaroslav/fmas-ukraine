unit Loader_InflHand;

interface
uses ZTypes,MainInfl,Classes,IBase;

function view_infl_hand(AOwner:TComponent; DB:TISC_DB_HANDLE):Variant; stdcall;
exports view_infl_hand;

implementation

function view_infl_hand(AOwner:TComponent; DB:TISC_DB_HANDLE):Variant;
var Param:tzsimpleParam;
begin
  FMainInfl:=TFMainInfl.create(AOwner,DB);
end;

end.
