unit LoadFilterKodSetup;

interface

uses classes, ibase, FormFilterKodSetupUnit, gr_uCommonProc, Controls,
     variants, gr_uCommonLoader;

function View_FilterKodSetup(AParameter:TgrAccListParam):Variant;stdcall;
  exports View_FilterKodSetup;

implementation

function View_FilterKodSetup(AParameter:TgrAccListParam):Variant;
var
  Form:TFormFilterKodSetup;
  KodSetup:integer;
begin
  KodSetup:=grKodSetup(AParameter.DB_handle);
  Form:=TFormFilterKodSetup.Create(AParameter.Owner,AParameter.DB_Handle,KodSetup);
  if AParameter.AnalitControl=True then
  Form.cxCheckBox1.Visible:=True;
  if Form.ShowModal=mrYes then
    begin
    if Form.cxCheckBox1.Checked then AParameter.AnalitControl:=True
    else   AParameter.AnalitControl:=False;
    result:=Form.Kod_Setup;
    end
  else
    result:=null;
  Form.Free;
end;

end.
