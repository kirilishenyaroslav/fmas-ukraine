unit ImportBank_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,ImportBanktoReestr, TICommonLoader,TiCommonTypes;

function View_ImportBank(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE; ReestrParam:TReestrParam):Variant; stdcall;
exports View_ImportBank;

implementation

function View_ImportBank(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ReestrParam:TReestrParam):Variant;
var ViewForm: TImportBankReestrForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TImportBankReestrForm.Create(AOwner,DB_Handle,ReestrParam);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
