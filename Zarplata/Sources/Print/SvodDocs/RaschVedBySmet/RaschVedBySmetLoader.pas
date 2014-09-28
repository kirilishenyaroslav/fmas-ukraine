unit RaschVedBySmetLoader;

interface

uses RaschVedBySmetPrintDM, SpSmetMainForm, ZSvodTypesUnit, Classes, IBase,
     Controls;

function ReportRaschListBySmet(AParameter: TZAccListParameter):variant;stdcall;
exports ReportRaschListBySmet;

implementation

function ReportRaschListBySmet(AParameter: TZAccListParameter):variant;stdcall;
var DM:TPrintDM;
    Main:TFGr_SchForm;
    IdSmeta:variant;
begin
  Main:=TFGr_SchForm.Create(AParameter);
  if(Main.ShowModal=mrYes)then
  begin
    IdSmeta:=Main.Result;
    DM:=TPrintDM.Create(AParameter.AOwner);
    DM.ReportCreate(AParameter,IdSmeta);
    DM.Destroy;
  end
end;

end.
