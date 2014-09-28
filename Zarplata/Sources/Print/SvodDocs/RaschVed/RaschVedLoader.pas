unit RaschVedLoader;

interface

uses  RaschVedPrintDM, ZSvodTypesUnit, Classes, IBase,
     FilterDepartment, TreeFilterDepartment;

function ReportRaschList(AParameter: TZAccListParameter):variant;stdcall;
exports ReportRaschList;

function ReportRaschListShort(AParameter: TZAccListParameter):variant;stdcall;
exports ReportRaschListShort;

implementation

function ReportRaschList(AParameter: TZAccListParameter):variant;stdcall;
var Options:TFTreeFilterDepartmen;
    DM:TPrintDM;
    Shifr:TFFilterDepartment;
    PResult:variant;
begin
 if AParameter.TypeData=2 then
  begin
   Options := TFTreeFilterDepartmen.Create(AParameter);
   Options.ShowModal;
   Options.Free;
  end
 else
  if AParameter.TypeData=3 then
  begin
   Shifr := TFFilterDepartment.Create(AParameter);
   Shifr.ShowModal;
   Shifr.Free;
  end
  else
  begin
   DM:=TPrintDM.Create(AParameter.AOwner);
   PResult:=DM.ReportCreate(AParameter);
   DM.Destroy;
   ReportRaschList:=PResult;
  end;
end;

function ReportRaschListShort(AParameter: TZAccListParameter):variant;stdcall;
var Options:TFTreeFilterDepartmen;
    DM:TPrintDM;
    Shifr:TFFilterDepartment;
    PResult:variant;
begin
 if AParameter.TypeData=4 then
  begin
    Options := TFTreeFilterDepartmen.Create(AParameter);
    Options.ShowModal;
    Options.Free;
   {DM:=TPrintDM.Create(AParameter.AOwner);
   PResult:=DM.ReportCreateShort(AParameter);
   DM.Destroy;
   ReportRaschListShort:=PResult;}
  end
 else
  if AParameter.TypeData=5 then
  begin
   Shifr := TFFilterDepartment.Create(AParameter);
   Shifr.ShowModal;
   Shifr.Free;
  end
 else
  if AParameter.TypeData=6 then
  begin
    Options := TFTreeFilterDepartmen.Create(AParameter);
    Options.ShowModal;
    Options.Free;
  end
  else
  begin
   DM:=TPrintDM.Create(AParameter.AOwner);
   PResult:=DM.ReportCreateShort(AParameter);
   DM.Destroy;
   ReportRaschListShort:=PResult;
  end;
end;

end.
