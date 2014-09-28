unit Loder_PeopleProp_ByPeriod;

interface
uses Classes, ZTypes, IBase, PeopleProp_ByPeriod_MainForm;

function View_PeoplePropByPeriod(AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant;stdcall;
exports View_PeoplePropByPeriod;
implementation



function View_PeoplePropByPeriod(AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant;
var Form:TFPeople_Prop_ByPeriod;
begin
  Form:=TFPeople_Prop_ByPeriod.Create(AOwner,DB);
  Form.ShowModal;
end;


end.
