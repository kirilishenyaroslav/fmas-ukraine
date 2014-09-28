unit SvodByGroupSmLoader;

interface
uses Classes, IBase, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit,
     PackageLoad, ZTypes, SvodByGroupSmDataModul, SvodByGroupSmFilter, DB;

function ReportSvodGroupSm(Param:TSvodParam):variant;stdcall;
exports ReportSvodGroupSm;

implementation

//uses Math;

function ReportSvodGroupSm(Param:TSvodParam):variant;stdcall;
var ReportSpr:TSvodByGroupSm_DM;
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
    ReportSpr := TSvodByGroupSm_DM.Create(Param.AOwner);
    ReportSpr.PrintSpr(Param,ResDataSet);
    ReportSpr.Free;
    ResDataSet.Free;
    ResDataSet:=View_GroupSmet(SpParam);
  end;
  ResDataSet.free;
end;

end.
