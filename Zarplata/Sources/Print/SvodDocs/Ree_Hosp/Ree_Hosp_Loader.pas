unit Ree_Hosp_Loader;

interface
uses Classes, IBase, Ree_Hosp_DM, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit;

function Create_ReeHosp(Param:TReeHospParam):variant;stdcall;
exports Create_ReeHosp;

implementation

uses Math;

function Create_ReeHosp(Param:TReeHospParam):variant;stdcall;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(Param.SvodParam.AOwner);
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
