unit uSp_norma_DM;

interface

uses
  SysUtils, Classes, frxExportImage, frxExportPDF, frxExportRTF,
  frxExportXLS, frxClass, frxExportTXT, frxBarcode, frxDBSet, frxDesgn,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, RxMemDS;

type
  Tfrm_norma_DM = class(TDataModule)
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
    MemoryData: TRxMemoryData;
    DataSource_MD: TDataSource;
    MemoryDatamd_name_serves: TStringField;
    MemoryDatamd_procent: TCurrencyField;
    MemoryDatamd_id_serves: TIntegerField;
    MemoryDatamd_sum: TCurrencyField;
    MemoryDatamd_id_lgot_sum: TIntegerField;
  private
    { Private declarations }
  public
  end;

var
  frm_norma_DM: Tfrm_norma_DM;

implementation

{$R *.dfm}

{ TfrmDM }

end.
