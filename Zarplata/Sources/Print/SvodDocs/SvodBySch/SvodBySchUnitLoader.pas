unit SvodBySchUnitLoader;

interface
uses Classes, IBase, SvodBySchDataModul, Controls, GlobalSpr, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Resources_unitb,Variants,ZSvodTypesUnit,
     gr_uCommonLoader,SvodBySchDepOptions,ZProc;

function ReportSvodSch(Param:TSvodBySchParam):variant;stdcall;
exports ReportSvodSch;

implementation

uses Math;

function ReportSvodSch(Param:TSvodBySchParam):variant;stdcall;
var ReportSpr:TDM;
    Sch:Variant;
    tmp:variant;
    PParam:TgrSimpleParam;
    FormOptionDep:TFormOptionDep;
begin
  tmp := NULL;
  PParam:=TgrSimpleParam.Create;
  PParam.DB_Handle:=Param.FoundationParam.DB_Handle;
  PParam.Owner:=Param.FoundationParam.AOwner;
  PParam.KodCur :=Param.FoundationParam.Kod_setup;
  ReportSpr := TDM.Create(Param.FoundationParam.AOwner);
  if Param.TypeForm=tfsNP6 then
  begin
    FormOptionDep:=TFormOptionDep.create(PParam.Owner, PParam.DB_Handle,Param.FoundationParam.ID_Session);
    if FormOptionDep.ShowModal=mrYes then
    begin
      Param.Id_Sch:=FormOptionDep.Result;

        ReportSpr.PrintSpr(Param);
         ReportSpr.Free;

      end ;
     exit;
  end;
  if not VarIsNULL(Param.Id_Sch) then
     sch:=ShowSpSch(PParam,29);

  if VarArrayDimCount(Sch)>0 then tmp:=Sch;

  if (VarIsNULL(Param.Id_Sch)) or (not VarIsNULL(tmp)) then
  begin
    if not VarIsNUll(tmp) then Param.Id_Sch := tmp
    else
    begin
      Param.Id_Sch:=VarArrayCreate([0,1],varVariant);
      Param.Id_Sch[0]:=null;
    end;

    ReportSpr := TDM.Create(Param.FoundationParam.AOwner);
    if Param.TypeForm=tfsNP6 then
    begin
      FormOptionDep:=TFormOptionDep.create(PParam.Owner, PParam.DB_Handle,Param.FoundationParam.ID_Session);
      if FormOptionDep.ShowModal=mrYes then
      begin
        Param.Id_Sch:=FormOptionDep.Result;
      end
    end;
    ReportSpr.PrintSpr(Param);
    ReportSpr.Free;
  end;
end;

end.
