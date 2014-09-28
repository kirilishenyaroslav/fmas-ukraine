unit SprYearDeclLoader;

interface
uses Classes, IBase, SprYearDeclMainForm, SprYearDeclDataModul, Controls, ZTypes;

function View_SprYearDecl(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):variant;stdcall;
exports View_SprYearDecl;

function ViewFilter(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter:TFilterDataSprDoh;Is_Grant:TZChildSystems):TFilterDataSprDoh;stdcall;


implementation

function ViewFilter(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter:TFilterDataSprDoh;Is_Grant:TZChildSystems):TFilterDataSprDoh;
var DataForm:TFYearDecl;
    TPDataFilter:TFilterDataSprDoh;
begin
DataForm:= TFYearDecl.Create(AOwner,ADb_Handle,AParameter,Is_Grant);
if DataForm.ShowModal=mrYes then
  TPDataFilter:=DataForm.FilterData
else
  TPDataFilter.ID_man:=-1;
DataForm.Free;
ViewFilter:=TPDataFilter;
end;

{function CreateReport(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE; AParameter:TFilterData):variant;
var DM:TDM;
begin
DM:=TDM.Create(AOwner);
end;}

function View_SprYearDecl(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):variant;stdcall;
var TPDataFilter:TFilterDataSprDoh;
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
  ReportSpr.PrintSpr(ADb_Handle,TPDataFilter);
  ReportSpr.Free;
  TPDataFilter:=ViewFilter(AOwner,ADb_Handle,TPDataFilter,Is_Grant);
 end;
end;

end.
