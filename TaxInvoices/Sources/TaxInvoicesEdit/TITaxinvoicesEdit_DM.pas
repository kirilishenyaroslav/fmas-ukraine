unit TITaxinvoicesEdit_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase,IBase, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, frxDesgn, frxClass,
  frxDBSet, RxMemDS;

type
  TTaxInvoicesEditDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Pocupatel_DataSet: TpFIBDataSet;
    Customer_DataSet: TpFIBDataSet;
    VidNaklInfoDSet: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    NaklDeliveryDSet: TpFIBDataSet;
    NaklDeliveryDSource: TDataSource;
    FirstSummaAllDSet: TpFIBDataSet;
    TransportCostsDSet: TpFIBDataSet;
    MortgageTaraDSet: TpFIBDataSet;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    UserDSet: TpFIBDataSet;
    frx_Pocupatel_Dset: TfrxDBDataset;
    frx_Customer_Dset: TfrxDBDataset;
    frx_VidNaklInfo_Dset: TfrxDBDataset;
    frx_NaklDelivery_DSet: TfrxDBDataset;
    frx_FirstSummaAll_DSet: TfrxDBDataset;
    frx_TransportCosts_DSet: TfrxDBDataset;
    frx_MortgageTara_DSet: TfrxDBDataset;
    Customer_DonnuDSet: TpFIBDataSet;
    frx_CustomerDonnu_Dset: TfrxDBDataset;
    frx_User_DSet: TfrxDBDataset;
    AbbreviatureDSet: TpFIBDataSet;
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
    Smeta_Vid_N_DSource: TDataSource;
    Smeta_Vid_N_DSet: TpFIBDataSet;
    DSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;

  end;


implementation

{$R *.dfm}
constructor TTaxInvoicesEditDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;


end.
