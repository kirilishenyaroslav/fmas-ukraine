unit uPrices_DM;

interface

uses
  SysUtils, Classes, frxExportImage, frxExportPDF, frxExportRTF,
  frxExportXLS, frxClass, frxExportTXT, frxBarcode, frxDBSet, frxDesgn,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, RxMemDS;

type
  Tfrm_price_DM = class(TDataModule)
    Transaction_Read: TpFIBTransaction;
    Transaction_write: TpFIBTransaction;
    DataSet_read: TpFIBDataSet;
    DataSet_param: TpFIBDataSet;
    DataSet_main: TpFIBDataSet;
    DataSource_read: TDataSource;
    DataSource_param: TDataSource;
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
    DataSource_services: TDataSource;
    MemoryData_services: TRxMemoryData;
    MemoryData_servicesMemoryData_id: TIntegerField;
    MemoryData_servicesMemoryData_name: TStringField;
    MemoryData_servicesMemoryData_buget: TStringField;
    MemoryData_servicesMemoryData_tariff: TFloatField;
    MemoryData_servicesMemoryData_norma: TFloatField;
    MemoryData_servicesMemoryData_summa: TFloatField;
    MemoryData_servicesMemoryData_id_sm: TIntegerField;
    MemoryData_servicesMemoryData_id_rz: TIntegerField;
    MemoryData_servicesMemoryData_id_st: TIntegerField;
    MemoryData_servicesMemoryData_id_kekv: TIntegerField;
    MemoryData_servicesMemoryData_sm_tittle: TStringField;
    MemoryData_servicesMemoryData_rz_tittle: TStringField;
    MemoryData_servicesMemoryData_st_tittle: TStringField;
    MemoryData_servicesMemoryData_kekv_tittle: TStringField;
    MemoryData_servicesMemoryData_check_norma: TIntegerField;
    MemoryData_servicesMemoryData_st_options: TIntegerField;
    MemoryData_servicesMemoryData_id_type_norma: TIntegerField;
    MemoryData_servicesMemoryData_name_type_norma: TStringField;
  private
    { Private declarations }
  public
  end;

var
  frm_price_DM: Tfrm_price_DM;

implementation

{$R *.dfm}

{ TfrmDM }

end.
