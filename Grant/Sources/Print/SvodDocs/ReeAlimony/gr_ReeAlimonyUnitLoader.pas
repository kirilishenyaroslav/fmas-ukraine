unit gr_ReeAlimonyUnitLoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, gr_uCommonLoader,
     gr_ReeAlimonyDataModul;

function View_ReeAlimony(Param: TgrSimpleParam):variant;stdcall;
exports View_ReeAlimony;

implementation

uses Math;

function View_ReeAlimony(Param:TgrSimpleParam):variant;stdcall;
var PParam:TReeAlimonyParam;
    ReportSpr:TDM;
    res:variant;
begin
  res:=DoFunctionFromPackage(Param,Stud_FilterKodSetup);
  if(res<>null)then
  begin
    PParam.FoundationParam.Kod_setup:=res;
    PParam.FoundationParam.AOwner:=Param.Owner;
    PParam.FoundationParam.DB_Handle:=Param.DB_Handle;
    Param.KodCur := res;
    PParam.Id_Sch:=ShowSpSch(Param,30);
    if(VarArrayDimCount(PParam.Id_Sch)<>0)then
    begin
      ReportSpr := TDM.Create(PParam.FoundationParam.AOwner);
      ReportSpr.PrintSpr(PParam);
      ReportSpr.Free;
    end;
  end
end;

end.
