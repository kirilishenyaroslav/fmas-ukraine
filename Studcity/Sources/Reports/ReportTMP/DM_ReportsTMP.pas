unit DM_ReportsTMP;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, frxDesgn, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxExportPDF, frxExportHTML, frxExportRTF, frxExportXLS;

type
  TDataModul_TMP = class(TDataModule)
    Database: TpFIBDatabase;
    DataSet_Read: TpFIBDataSet;
    DataSet_Report: TpFIBDataSet;
    Transaction_Read: TpFIBTransaction;
    Transaction_write: TpFIBTransaction;
    Designer: TfrxDesigner;
    DBDataset: TfrxDBDataset;
    StoredProc: TpFIBStoredProc;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModul_TMP: TDataModul_TMP;

implementation

{$R *.dfm}

end.
