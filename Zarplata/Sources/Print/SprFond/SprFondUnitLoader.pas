unit SprFondUnitLoader;

interface
uses Classes, IBase, SprFondMainForm, SprFondDataModul, Controls, ZTypes;

function CreateSprFond(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):variant;stdcall;
exports CreateSprFond;

implementation

function ViewFilter(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter:TFilterData;Is_Grant:TZChildSystems):TFilterData;
var DataForm:TFSprFond;
    TPDataFilter:TFilterData;
begin
DataForm:= TFSprFond.Create(AOwner,ADb_Handle,AParameter,Is_Grant);
if DataForm.ShowModal=mrYes then
  TPDataFilter:=DataForm.FilterData
else
  TPDataFilter.ID_man:=-1;
DataForm.Free;
ViewFilter:=TPDataFilter;
end;

function CreateSprFond(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):variant;stdcall;
var TPDataFilter:TFilterData;
    ReportSpr:TDM;
begin
TPDataFilter.ID_man:=Id_man;
TPDataFilter.Kod_setup1:=-1;
TPDataFilter.Kod_setup2:=-1;
TPDataFilter.PrUser:=true;
TPDataFilter:=ViewFilter(AOwner,ADb_Handle,TPDataFilter,Is_Grant);
while TPDataFilter.ID_man<>-1 do
 begin
  ReportSpr:=TDM.Create(AOwner);
  ReportSpr.PrintSprFond(ADb_Handle,TPDataFilter);
  ReportSpr.Free;
  TPDataFilter:=ViewFilter(AOwner,ADb_Handle,TPDataFilter,Is_Grant);
 end;
end;

end.
