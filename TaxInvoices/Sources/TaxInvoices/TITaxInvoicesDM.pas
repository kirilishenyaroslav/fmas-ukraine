unit TITaxInvoicesDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase,ibase, DB, FIBDataSet, pFIBDataSet, Halcn6db, frxDesgn,
  frxClass, frxDBSet, RxMemDS;

type
  TTaxInvoicesDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    ReestrDSet: TpFIBDataSet;
    ReestrDSource: TDataSource;
    UserDSet: TpFIBDataSet;
    SignatureReestrDSet: TpFIBDataSet;
    SignatureReestrDSource: TDataSource;
    SignatureHistDSource: TDataSource;
    SignatureHistDSet: TpFIBDataSet;
    CustomerDSet: TpFIBDataSet;
    VidNaklDSet: TpFIBDataSet;
    VidNaklDSource: TDataSource;
    SignatureNaklDSet: TpFIBDataSet;
    SignatureNaklDSource: TDataSource;
    KodDSet: TpFIBDataSet;
    PDVDSet: TpFIBDataSet;
    OtrNaklDSet: TpFIBDataSet;
    OtrNaklDSource: TDataSource;
    DbfExport: THalcyonDataSet;
    CreateDBAccount: TCreateHalcyonDataSet;
    AbbreviatureDSet: TpFIBDataSet;
    SetPrintDSet: TpFIBDataSet;
    IMPORT: THalcyonDataSet;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset_Reestr: TfrxDBDataset;
    frxDBDataset_VidNakl: TfrxDBDataset;
    DataSource_smet: TDataSource;
    RxMemoryData_smet: TRxMemoryData;
    RxMemoryData_smetname_smet: TStringField;
    RxMemoryData_smetname_razd: TStringField;
    RxMemoryData_smetname_stat: TStringField;
    RxMemoryData_smetsum_smet: TVariantField;
    RxMemoryData_smetkod_smety: TIntegerField;
    RxMemoryData_smetn_razd: TIntegerField;
    RxMemoryData_smetn_stat: TIntegerField;
    RxMemoryData_smetid_smet: TVariantField;
    RxMemoryData_smetid_razd: TVariantField;
    RxMemoryData_smetid_stat: TVariantField;
    RxMemoryData_smetFlag_del: TIntegerField;
    RxMemoryData_smetid: TVariantField;
    RxMemoryData_smetid_kekv: TVariantField;
    RxMemoryData_smetkod_kekv: TIntegerField;
    RxMemoryData_smetname_kekv: TStringField;
    Smeta_Vid_N_DSet: TpFIBDataSet;
    Smeta_Vid_N_DSource: TDataSource;
    frxDBDataset_ReestrOtr: TfrxDBDataset;
    RxMemoryData_smetIS_LGOTA: TIntegerField;
    TISettingDSet: TpFIBDataSet;
    DSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TaxInvoicesDM: TTaxInvoicesDM;

implementation

{$R *.dfm}
constructor TTaxInvoicesDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
 SignatureReestrDSet.DataSource := ReestrDSource;
 VidNaklDSet.DataSource         := ReestrDSource;
 SignatureNaklDSet.DataSource   := VidNaklDSource;
 OtrNaklDSet.DataSource         := ReestrDSource;
end;


end.
