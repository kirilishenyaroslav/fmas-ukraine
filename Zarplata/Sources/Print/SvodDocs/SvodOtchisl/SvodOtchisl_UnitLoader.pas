unit SvodOtchisl_UnitLoader;

interface
uses Classes, IBase, SvodOtchisl_PrintDM, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit;

function ReportSvodOtchisl(Param:TSvodParam):variant;stdcall;
exports ReportSvodOtchisl;

implementation

uses Math;

function ReportSvodOtchisl(Param:TSvodParam):variant;stdcall;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(Param.AOwner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
