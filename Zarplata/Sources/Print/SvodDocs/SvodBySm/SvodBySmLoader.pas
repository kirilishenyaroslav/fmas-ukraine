unit SvodBySmLoader;

interface
uses Classes, IBase, SvodBySmDM, Controls,  Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit, DB, MultySmeta;

function ReportSvodSm(Param:TSvodParam):variant;stdcall;
exports ReportSvodSm;

implementation

uses Math;


function ReportSvodSm(Param:TSvodParam):variant;stdcall;
var ReportSpr:TDM;
    Smeta:TDataSet;
    tmp:variant;
begin

  Smeta:=GetSmetsMulty(Param.AOwner,Param.DB_Handle,Date, Param.ID_Session);
  if Smeta <> nil then
  begin
    ReportSpr := TDM.Create(Param.AOwner);
    ReportSpr.PrintSpr(Param,Smeta);
    ReportSpr.Free;
  end;
end;

end.
