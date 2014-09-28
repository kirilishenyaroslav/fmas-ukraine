unit DM_account;

interface

uses
  SysUtils, Classes, frxExportPDF, frxExportImage, frxExportRTF, frxClass,
  frxExportXLS, DB, frxDBSet, frxDesgn, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDM_acc = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction_read: TpFIBTransaction;
    Transaction_write: TpFIBTransaction;
    DataSet_main: TpFIBDataSet;
    DataSet_second: TpFIBDataSet;
    DataSet_read: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSet_report_master: TpFIBDataSet;
    Report_main: TfrxReport;
    frxDesigner1: TfrxDesigner;
    DBDataset_master: TfrxDBDataset;
    DataSource_main: TDataSource;
    DataSource_second: TDataSource;
    DataSource_read: TDataSource;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_acc: TDM_acc;

implementation

{$R *.dfm}

end.
