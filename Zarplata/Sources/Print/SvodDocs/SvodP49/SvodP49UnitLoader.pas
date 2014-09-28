unit SvodP49UnitLoader;

interface
uses Classes, IBase, SvodP49DataModul, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit;

function ReportSvodP49(Param:TSimpleReestrParam):variant;stdcall;
exports ReportSvodP49;

implementation

uses Math;

function ReportSvodP49(Param:TSimpleReestrParam):variant;stdcall;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(Param.SvodParam.AOwner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
