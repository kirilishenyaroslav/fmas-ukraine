unit TuTimesheet_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, frxClass, frxDBSet, frxDesgn,Controls,
  frxDMPExport, frxExportPDF, frxExportRTF, frxExportXLS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    TransactionR: TpFIBTransaction;
    TransactionW: TpFIBTransaction;
    DSetTempletOrPeriod: TpFIBDataSet;
    DSourceTimeSheet: TDataSource;
    StProc: TpFIBStoredProc;
    DSetPeriodType: TpFIBDataSet;
    DSourceTempletOrPeriod: TDataSource;
    DSetTimeSheet: TpFIBDataSet;
    DSourcePeriodType: TDataSource;
    DSetTypeTsh: TpFIBDataSet;
    DSourceTypeTsh: TDataSource;
    DsetCalendar: TpFIBDataSet;
    DSourceCalendar: TDataSource;
    frxDesigner1: TfrxDesigner;
    DBDataset1: TfrxDBDataset;
    DSetPrintInfo: TpFIBDataSet;
    DBDatasetInfo: TfrxDBDataset;
    DSet1: TpFIBDataSet;
    DsetHistory: TpFIBDataSet;
    DSourceHistory: TDataSource;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    { Private declarations }
  public
    DatePrint:TDate;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if VarName='DATE_PRINT' then value :=datetostr(DatePrint);
end;

end.
