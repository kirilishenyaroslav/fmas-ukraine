unit DM_SynchEDBO;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDM_synch = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSource_facul: TDataSource;
    StProc: TpFIBStoredProc;
    DataSet_facul: TpFIBDataSet;
    DataSet_Read: TpFIBDataSet;
    DataSource_read: TDataSource;
    DataSource_spec: TDataSource;
    DataSet_spec: TpFIBDataSet;
    DataSource_OKR: TDataSource;
    DataSet_OKR: TpFIBDataSet;
    DataSet_kurs: TpFIBDataSet;
    DataSource_kurs: TDataSource;
    DataSet_group: TpFIBDataSet;
    DataSource_group: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
