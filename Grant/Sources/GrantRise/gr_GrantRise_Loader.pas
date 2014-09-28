unit gr_GrantRise_Loader;

interface

uses Classes, IBase, gr_GrantRise_MainForm, ZProc,
     Controls, gr_uCommonLoader, gr_GrantRise_ByDate,
     gr_GrantRise_DM, dialogs,SysUtils;

function View_GrantRise(AParameter:TObject):Variant;stdcall;
exports View_GrantRise;

implementation

function View_GrantRise(AParameter:TObject):Variant;
var ViewForm: TFGrantRise;
    Filter: TFGrantRiseByDate;
begin
  DM := TDM.Create(TgrSimpleParam(AParameter).Owner);
  DM.DB.Handle:=TgrSimpleParam(AParameter).DB_Handle;
  DM.ReadTransaction.StartTransaction;
  Filter:=TFGrantRiseByDate.Create(TgrSimpleParam(AParameter).Owner);
  if(Filter.ShowModal=mrYes)then
    ViewForm:=TFGrantRise.Create(TgrSimpleParam(AParameter).Owner,Filter.Result);
end;

end.
