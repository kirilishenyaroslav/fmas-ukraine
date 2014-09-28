unit dmReportShtatRasp;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass,
  frxExportXLS, frxExportHTML, frxExportRTF, frxDesgn, frxDBSet,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReportDsetData: TfrxDBDataset;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    DSetData: TpFIBDataSet;
    DSet: TpFIBDataSet;
    DSetSr2: TpFIBQuery;
    DSetSr1: TpFIBDataSet;
    DSetTypePost: TpFIBDataSet;
    Report: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
