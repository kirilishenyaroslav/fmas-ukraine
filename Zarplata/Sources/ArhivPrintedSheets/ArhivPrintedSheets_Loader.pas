unit ArhivPrintedSheets_Loader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit, ArhivPrintedSheets_MainForm;

function ArhivPrintedSheetsShow(AOwner:TComponent;DB_handle:TISC_DB_HANDLE):variant;stdcall;
exports ArhivPrintedSheetsShow;

implementation

uses Math;

function ArhivPrintedSheetsShow(AOwner:TComponent;DB_handle:TISC_DB_HANDLE):variant;stdcall;
var MainForm:TArhivReportsSheet;
begin
  MainForm :=TArhivReportsSheet.Create(AOwner,DB_Handle);
  MainForm.ShowModal;
  MainForm.Destroy;
end;

end.
