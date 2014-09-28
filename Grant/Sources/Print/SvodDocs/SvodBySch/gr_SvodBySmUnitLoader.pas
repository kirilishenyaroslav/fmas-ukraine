unit gr_SvodBySmUnitLoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, gr_uCommonLoader,
     gr_SvodBySmDataModul;

function View_SvodSm(Param:TgrSimpleParam):variant;stdcall;
exports View_SvodSm;

implementation

uses Math;

function View_SvodSm(Param:TgrSimpleParam):variant;stdcall;
var PParam:TSvodBySmParam;
    ReportSpr:TDM;
    res:variant;
    i:Integer;
begin
  PParam.FoundationParam.AOwner:=Param.Owner;
  PParam.FoundationParam.DB_Handle:=Param.DB_Handle;
  res:=DoFunctionFromPackage(Param,Stud_FilterKodSetup);
  if(res<>null)then
  begin
    PParam.FoundationParam.Kod_setup:=res;
    PParam.Id_Sm:=DoFunctionFromPackage(Param,Stud_SpSmet);
    if(VarArrayDimCount(PParam.Id_Sm)<>0)then
    begin
      ReportSpr := TDM.Create(PParam.FoundationParam.AOwner);
      ReportSpr.PrintSpr(PParam);
      ReportSpr.Free;
    end;
  end
end;

end.
