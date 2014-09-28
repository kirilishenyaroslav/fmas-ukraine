unit ImportBank_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ibase,DB, FIBDataSet, pFIBDataSet, RxMemDS;

type
  TImportBankDM = class(TDataModule)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    UserDSet: TpFIBDataSet;
    CustomerDSet: TpFIBDataSet;
    BankDocDSet: TpFIBDataSet;
    BankDocDSource: TDataSource;
    DSet: TpFIBDataSet;
    BankDocProvNDSDSet: TpFIBDataSet;
    BankDocProvNDSDSource: TDataSource;
    BankDocMemoryData: TRxMemoryData;
    BankDocMemoryDataPK_ID: TStringField;
    BankDocMemoryDataDATE_REG: TDateField;
    BankDocMemoryDataID_CUSTOMER: TIntegerField;
    BankDocMemoryDataNUM_DOC: TStringField;
    BankDocMemoryDataDATE_DOC: TDateField;
    BankDocMemoryDataNOTE: TStringField;
    BankDocMemoryDataSUMMA: TFloatField;
    BankDocMemoryDataNAME_CUSTOMER: TStringField;
    BankDocMemoryDataNALOG_NOM: TStringField;
    BankDocMemoryDataPRIHOD: TIntegerField;
    BankDocMemoryDataDATE_PROV: TDateField;
    BankDocMemoryDataID_TYPE_DOC: TIntegerField;
    BankDocMemoryDataTYPE_DOC_TITLE: TStringField;
    BankDocMemoryDataIS_SELECT: TBooleanField;
    BankDocMemoryDataSUMMA_NDS_DOC: TFloatField;
    BankDocMemoryDataFLAG_ERROR_NDS: TIntegerField;
    BankDocMemoryDataFLAG_PAST: TIntegerField;
    BankDocMemoryDataFLAG_NAKL: TIntegerField;
    BankDocMemoryDataDATE_OTR_NAKL: TDateField;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  ImportBankDM: TImportBankDM;

implementation

{$R *.dfm}
constructor TImportBankDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;
end.
