unit SvodBySchSmUnitLoader;

interface
uses Classes, IBase, SvodBySchSmDataModul, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit,
     gr_uCommonLoader, ZTypes, PackageLoad, DB;

function ReportSvodSchSm(Param:TSvodBySchSmParam):variant;stdcall;
exports ReportSvodSchSm;

implementation

uses Math;

function ReportSvodSchSm(Param:TSvodBySchSmParam):variant;stdcall;
var ReportSpr:TDM;
    Sch:TDataSet;
    PParam:TzSimpleParam;

begin

  PParam:=TzSimpleParam.Create;
  PParam.DB_Handle:=Param.FoundationParam.DB_Handle;
  PParam.Owner:=Param.FoundationParam.AOwner;


  sch:=ShowSpSchSm(PParam,29);

  PParam.Free;

  if (sch<>nil) then
  begin
    Param.Dataset:=sch;

    ReportSpr := TDM.Create(Param.FoundationParam.AOwner);

    ReportSpr.PrintSpr(Param);

    ReportSpr.Free;

  end;

  
end;

end.
