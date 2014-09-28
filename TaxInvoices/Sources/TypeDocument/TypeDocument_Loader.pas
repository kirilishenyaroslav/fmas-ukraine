unit TypeDocument_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TypeDocument_Main, TICommonLoader;

function View_TypeDocument(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ID_SPR:integer):Variant; stdcall;
exports View_TypeDocument;

implementation

function View_TypeDocument(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ID_SPR:integer):Variant;
var ViewForm: TTypeDocumentMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  ViewForm := TTypeDocumentMainForm.Create(AOwner,DB_Handle,Id_spr);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
end;

end.
