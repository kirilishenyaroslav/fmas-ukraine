unit SimpleReestrUnitLoader;

interface
uses Classes, IBase, SimpleReestrDataModul, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit;

function ReportSimpleReestr(Param:TSimpleReestrParam):variant;stdcall;
exports ReportSimpleReestr;

implementation

uses Math;

function ReportSimpleReestr(Param:TSimpleReestrParam):variant;stdcall;
var ReportSpr:TSimpleDM;
begin
  ReportSpr := TSimpleDM.Create(Param.SvodParam.AOwner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
