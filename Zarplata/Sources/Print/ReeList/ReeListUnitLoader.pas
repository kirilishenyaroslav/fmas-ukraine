unit ReeListUnitLoader;

interface
uses Classes, IBase, ReeListPrintDataModul, Controls, {GlobalSpr,} Forms, SysUtils,DateUtils,
     Windows, Dialogs, {Resources_unitb,}Variants,ZSvodTypesUnit{,
     {gr_uCommonLoader};

function CreateReportReeList(Aowner: TComponent;DB_Handle:TISC_DB_HANDLE;id_reestr:integer):Variant;stdcall;
exports CreateReportReeList;

implementation

uses Math;

function CreateReportReeList(Aowner: TComponent;DB_Handle:TISC_DB_HANDLE;id_reestr:integer):variant;stdcall;
var ReportSpr:TDM;
begin
  ReportSpr := TDM.Create(Aowner);
  ReportSpr.PrintSpr(DB_Handle,id_reestr);
  ReportSpr.Free;
end;

end.
