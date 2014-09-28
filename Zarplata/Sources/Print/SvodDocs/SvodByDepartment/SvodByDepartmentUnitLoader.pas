unit SvodByDepartmentUnitLoader;

interface
uses Classes, IBase, SvodByDepartmentDataModul, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit;

function ReportSvodDepartment(Param:TSvodByDepartmentParam):variant;stdcall;
exports ReportSvodDepartment;

implementation

uses Math;

function ReportSvodDepartment(Param:TSvodByDepartmentParam):variant;stdcall;
var ReportSpr:TDM;
    Sch:Variant;
begin
  ReportSpr := TDM.Create(Param.SvodParam.AOwner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
