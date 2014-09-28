unit UV_SheetPrint_Loader;

interface

uses Classes, IBase, UV_SheetPrint_DM;

function CreateReportPrintSheet(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):variant;stdcall;
 exports CreateReportPrintSheet;

implementation

function CreateReportPrintSheet(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):Variant;
var ViewForm:TPrint_DM;
begin
 ViewForm := TPrint_DM.Create(AOwner,DB_HANDLE,AId,ATypeForm);
 ViewForm.Print;
 ViewForm.Free;
end;

end.
