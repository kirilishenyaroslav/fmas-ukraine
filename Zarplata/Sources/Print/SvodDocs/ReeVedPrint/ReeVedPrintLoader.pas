unit ReeVedPrintLoader;

interface
uses Classes, IBase, ReeVedPrintDataModul, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit;

function ReportReeVedPrint(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id:integer):variant;stdcall;
exports ReportReeVedPrint;

implementation

uses Math;

function ReportReeVedPrint(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id:integer):variant;stdcall;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(AOwner);
  ReportSpr.PrintSpr(DB_Handle,Id);
  ReportSpr.Destroy;
end;

end.
