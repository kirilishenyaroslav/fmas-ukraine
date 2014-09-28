unit SvodByGroupSmUnitLoader;

interface
uses Classes, IBase, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit,
     PackageLoad, ZTypes, SvodByGroupSmDataModul,SvodByGroupSpFilter;

function ReportSvodGroupSm(Param:TSvodParam):variant;stdcall;
exports ReportSvodGroupSm;

implementation

//uses Math;

function ReportSvodGroupSm(Param:TSvodParam):variant;stdcall;
var ReportSpr:TDM;
    Sm:Variant;
    tmp:variant;
    SpParam:TZSpGroupSm;
begin
  tmp := NULL;
  SpParam.Owner:=Param.AOwner;
  SpParam.Db_Handle:=Param.DB_Handle;
  SpParam.TypeData:=2;

  SpParam.IdSession:=Param.ID_Session;
  SpParam.KodSetup:=Param.Kod_setup;
  if Param.TypeGroup=tfsGroupSmet then
    sm:=View_SpGroupSmet1(SpParam)
  else
    sm:=LoadSpGroupSm(SpParam);

  if VarArrayDimCount(Sm)>0 then tmp:=Sm;

  if (not VarIsNULL(tmp)) then
  begin
    if not VarIsNUll(tmp) then Sm := tmp
    else
    begin
      Sm:=VarArrayCreate([0,1],varVariant);
      Sm[0]:=null;
    end;

    ReportSpr := TDM.Create(Param.AOwner);
    ReportSpr.PrintSpr(Param,Sm);
    ReportSpr.Free;
  end;
end;

end.
