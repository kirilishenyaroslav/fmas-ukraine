unit uExportReport;

interface

uses FR_Class, frxClass;

procedure ExportReportTo(Report : TfrReport); overload;
procedure ExportReportTo(Report : TfrxReport); overload;

implementation

uses ExportReportUnit, uExportReport3, Forms, SysUtils;

procedure ExportReportTo(Report : TfrReport);
var
	form : TExportReportForm;
    dir: String;
begin
    Report.PrepareReport;
    dir := GetCurrentDir;
	form := TExportReportForm.Create(Report);
	form.Report := Report;
	form.ShowModal;
    form.Free;
    SetCurrentDir(dir);
end;

procedure ExportReportTo(Report : TfrxReport);
var
	form : TfmExportReport3;
    dir: String;
begin
    Report.PrepareReport;
    dir := GetCurrentDir;
	form := TfmExportReport3.Create(Application.MainForm, Report);
	form.ShowModal;
    form.Free;
    SetCurrentDir(dir);
end;



end.
 