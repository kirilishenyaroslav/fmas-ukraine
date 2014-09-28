unit AvgHospPrintUnitLoader;

interface
uses Classes, IBase, AvgHospPrintDataModul, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit, AvgHospPrintUnitKodSetup;

function ReportAvgHosp(Param:TAvgHospParam):variant;stdcall;
exports ReportAvgHosp;

implementation

uses Math;

function ViewFilterKodSetup(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE):integer;stdcall;
var Form:TFormFilterKodSetup;
    Res:integer;
begin
 Form:=TFormFilterKodSetup.Create(AOwner,ADb_Handle);
 if Form.ShowModal=mrYes then
    Res:=Form.Kod_Setup
 else Res:=0;
 Form.Free;
 Result:=Res;
end;

function ReportAvgHosp(Param:TAvgHospParam):variant;
var ReportSpr:TDM;
    KodSetup:integer;
begin
  KodSetup:=ViewFilterKodSetup(Param.Owner,Param.DB_Handle);
  if KodSetup=0 then Exit;
  ReportSpr := TDM.Create(Param.Owner);
  ReportSpr.KodSetup:=KodSetup;
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

end.
