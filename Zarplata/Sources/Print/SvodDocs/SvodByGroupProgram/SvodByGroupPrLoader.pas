unit SvodByGroupPrLoader;

interface
uses Classes, IBase, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit,
     PackageLoad, ZTypes, SvodByGroupPrDataModul, SvodByGroupPrFilter, DB;

function ReportSvodGroupPr(Param:TSvodParam):variant;stdcall;
exports ReportSvodGroupPr;

implementation

//uses Math;

function ReportSvodGroupPr(Param:TSvodParam):variant;stdcall;
var ReportSpr:TSvodByGroupPr_DM;
    ResDataSet:Tdataset;
    SpParam:TZSpGroupSm;
begin
  SpParam.Owner:=Param.AOwner;
  SpParam.Db_Handle:=Param.DB_Handle;
  SpParam.TypeData:=2;
  SpParam.IdSession:=Param.ID_Session;
  SpParam.KodSetup:=Param.Kod_setup;

  ResDataSet:=View_GroupSmet(SpParam);

  while ResDataSet<>nil do
  begin
    ReportSpr := TSvodByGroupPr_DM.Create(Param.AOwner);
    ReportSpr.PrintSpr(Param,ResDataSet);
    ReportSpr.Free;
    ResDataSet.Free;
    ResDataSet:=View_GroupSmet(SpParam);
  end;
  ResDataSet.free;
end;

end.
