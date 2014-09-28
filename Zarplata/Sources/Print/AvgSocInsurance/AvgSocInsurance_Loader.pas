unit AvgSocInsurance_Loader;

interface
uses ZSvodLoaderUnit,ZSvodTypesUnit,AvgSocInsurance_DM,ZProc,Dates;
function ReportAvgSocInsurance(Param:TAvgSocInsurance):variant;stdcall;
exports ReportAvgSocInsurance;


implementation



function ReportAvgSocInsurance(Param:TAvgSocInsurance):variant;
var DM:TDM;
    KodSetup:integer;
begin
 // KodSetup:=ViewFilterKodSetup(Param.Owner,Param.DB_Handle);
//  if KodSetup=0 then Exit;
  DM := TDM.Create(Param.Owner);
 // ReportSpr.KodSetup:=KodSetup;
  DM.PrintSpr(Param);
  DM.Free;
end;


end.
