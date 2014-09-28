unit uSp_Type_Kat_DM;

interface

uses
  SysUtils, Classes, frxExportImage, frxExportPDF, frxExportRTF,
  frxExportXLS, frxClass, frxExportTXT, frxBarcode, frxDBSet, frxDesgn,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase;

type
  TfrmType_Kat_DM = class(TDataModule)
    DB: TpFIBDatabase;
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
  private
    { Private declarations }
  public
  end;

var
  frmType_Kat_DM: TfrmType_Kat_DM;

implementation

{$R *.dfm}

{ TfrmDM }

end.
