unit ImportXML_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,ImportXMLtoReestr, TICommonLoader,TiCommonTypes;

function View_ImportXML(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE; ReestrParam:TReestrParam):Variant; stdcall;
exports View_ImportXML;

implementation

function View_ImportXML(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ReestrParam:TReestrParam):Variant;
var ViewForm: TImportXMLReestrForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TImportXMLReestrForm.Create(AOwner,DB_Handle,ReestrParam);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
