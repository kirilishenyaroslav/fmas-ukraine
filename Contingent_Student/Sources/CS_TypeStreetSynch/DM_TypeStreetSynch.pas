unit DM_TypeStreetSynch;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, RxMemDS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceTypeStr: TDataSource;
    StProc: TpFIBStoredProc;
    DataSetTypeStr: TpFIBDataSet;
    DataSetOur: TpFIBDataSet;
    DataSourceOur: TDataSource;
    RxMem_EdboStreetType: TRxMemoryData;
    DataSourceEDBO: TDataSource;
    DataSetEDBO: TpFIBDataSet;
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
