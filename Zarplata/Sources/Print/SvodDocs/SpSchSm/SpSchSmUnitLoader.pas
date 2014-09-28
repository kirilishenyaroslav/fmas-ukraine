unit SpSchSmUnitLoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, ZTypes ,SpSchSmMainForm, DB;

function View_SpSchSm(Param: TzSimpleParam;SchProp:integer):TDataset;stdcall;
exports View_SpSchSm;

implementation

uses Math;

function View_SpSchSm(Param:TzSimpleParam;SchProp:integer):TDataset;stdcall;
var Main:TFSchSmForm;
    res:TDataset;
begin
  Main:=TFSchSmForm.Create(Param.Owner,Param.DB_Handle,SchProp);
  if(Main.ShowModal=mrYes)then
    res:=Main.Result
  else res:=nil;
  View_SpSchSm:=res;
end;

end.
