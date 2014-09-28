unit zPersonification2010Export_Loader;

interface

uses Classes, IBase, ZProc, zPersonification2010Export_MainForm,
     Controls, Dialogs, SysUtils;

function View_zPersonification2010_ExportToDbf(AOwner : TComponent;DB:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer):Variant;stdcall;
exports View_zPersonification2010_ExportToDbf;

implementation

function View_zPersonification2010_ExportToDbf(AOwner : TComponent;DB:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer):Variant;
var ViewForm: TFzPerosnification2010Export;
begin
//  ShowMessage('IdReport '+IntToStr(IdReport)+',KodSetup '+IntToStr(KodSetup));
  ViewForm:=TFzPerosnification2010Export.Create(AOwner,DB,IdReport,KodSetup);
  ViewForm.ShowModal;
  ViewForm.Free;
end;

end.
