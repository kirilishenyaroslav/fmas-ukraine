unit DM_PrivateCard;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceOrders: TDataSource;
    StProc: TpFIBStoredProc;
    DataSetOrders: TpFIBDataSet;
    DataSetPeople: TpFIBDataSet;
    DataSourcePeople: TDataSource;
    DSPassData: TpFIBDataSet;
    PassDataSourse: TDataSource;
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
