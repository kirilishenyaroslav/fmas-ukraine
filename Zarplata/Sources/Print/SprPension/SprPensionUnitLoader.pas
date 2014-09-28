unit SprPensionUnitLoader;

interface
uses Classes, IBase, Controls, SprPensionDataModule,
     SprPensionMainForm, Dialogs;

function CreateSprPension(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):variant;stdcall;
exports CreateSprPension;

implementation

function ViewFilter(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter:TFilterData):TFilterData;
var DataForm:TFSprPension;
    TPDataFilter:TFilterData;
begin
DataForm:= TFSprPension.Create(AOwner,ADb_Handle,AParameter);
if DataForm.ShowModal=mrYes then
  TPDataFilter:=DataForm.FilterData
else
  TPDataFilter.ID_man:=-1;
DataForm.Free;
ViewFilter:=TPDataFilter;
end;

function CreateReport(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE; AParameter:TFilterData):variant;
var DM:TDM;
begin
DM:=TDM.Create(AOwner);
end;

function CreateSprPension(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE):variant;stdcall;
var TPDataFilter:TFilterData;
    ReportSpr:TDM;
    DataForm:TFSprPension;
begin
TPDataFilter.AOwner:=AOwner;
TPDataFilter.ID_man:=-1;
TPDataFilter:=ViewFilter(AOwner,ADb_Handle,TPDataFilter);
while TPDataFilter.ID_man<>-1 do
 begin
  ReportSpr:=TDM.Create(AOwner);
  ReportSpr.PrintSpr(ADb_Handle,TPDataFilter);
  ReportSpr.Free;
  TPDataFilter:=ViewFilter(AOwner,ADb_Handle,TPDataFilter);
 end;
end;

end.
