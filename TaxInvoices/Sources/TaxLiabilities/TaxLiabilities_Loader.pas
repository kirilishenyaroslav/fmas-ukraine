unit TaxLiabilities_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TaxLiabilities_Main, TICommonLoader;

function View_TaxLiabilities(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;type_nakl:integer):Variant;stdcall;
exports View_TaxLiabilities;

implementation

function View_TaxLiabilities(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;type_nakl:integer):Variant;
var ViewForm: TTaxLiabilitiesMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTaxLiabilitiesMainForm.Create(AOwner,Db_Handle,type_nakl);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
