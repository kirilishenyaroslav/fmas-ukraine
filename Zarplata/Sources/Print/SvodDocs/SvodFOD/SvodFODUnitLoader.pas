unit SvodFODUnitLoader;

interface
uses Classes, IBase, SvodFODDataModul, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit;

function ReportSvodFOD(Param:TSvodParam):variant;stdcall;
exports ReportSvodFOD;

implementation

uses Math;

function ReportSvodFOD(Param:TSvodParam):variant;stdcall;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(Param.AOwner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
