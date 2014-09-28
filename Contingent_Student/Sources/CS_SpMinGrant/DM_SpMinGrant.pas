unit DM_SpMinGrant;

interface

uses
  SysUtils, Classes, RxMemDS, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceMinGrant: TDataSource;
    StProc: TpFIBStoredProc;
    DataSetMinGrant: TpFIBDataSet;
    DataSetCheck: TpFIBDataSet;
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
