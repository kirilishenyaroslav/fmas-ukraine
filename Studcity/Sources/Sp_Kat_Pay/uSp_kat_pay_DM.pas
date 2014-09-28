unit uSp_kat_pay_DM;

interface

uses
  SysUtils, Classes, frxExportImage, frxExportPDF, frxExportRTF,
  frxExportXLS, frxClass, frxExportTXT, frxBarcode, frxDBSet, frxDesgn,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase;

type
  TfrmDM = class(TDataModule)
    Transaction_Read: TpFIBTransaction;
    Transaction_write: TpFIBTransaction;
    DataSet_read: TpFIBDataSet;
    DataSet_context: TpFIBDataSet;
    DataSet_main: TpFIBDataSet;
    DataSource_read: TDataSource;
    DataSource_context: TDataSource;
    DataSource_main: TDataSource;
    StoredProc: TpFIBStoredProc;
    DataSet_reports: TpFIBDataSet;
    Report_main: TfrxReport;
    frxDesigner1: TfrxDesigner;
    DBDataset_reports: TfrxDBDataset;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    DB: TpFIBDatabase;
    Global_Transaction_write: TpFIBTransaction;
    Global_StoredProc: TpFIBStoredProc;
    Global_DataSet: TpFIBDataSet;
  private
    { Private declarations }
  public
  end;

var
  frmDM: TfrmDM;

implementation

{$R *.dfm}

{ TfrmDM }

end.
