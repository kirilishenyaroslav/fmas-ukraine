unit DM_ReportFilter;

interface

uses
  SysUtils, Classes, RxMemDS, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    DSFilter: TDataSource;
    MemoryData: TRxMemoryData;
    DataSourceSp: TDataSource;
    DataSetFilter: TpFIBDataSet;
    DataSetSp: TpFIBDataSet;
    MemoryDataSp: TRxMemoryData;
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
