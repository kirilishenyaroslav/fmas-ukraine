unit AvgHolPrintULoader;

interface
uses Classes, IBase, AvgHolPrintDM, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,
     ZSvodTypesUnit, PackageLoad;

function ReportAvgHosp(Param:TAvgHolParam):variant;stdcall;
 exports ReportAvgHosp;

implementation

uses Math;

function ReportAvgHosp(Param:TAvgHolParam):variant;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(Param.Owner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
