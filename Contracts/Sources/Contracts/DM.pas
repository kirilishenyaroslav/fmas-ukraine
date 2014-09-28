unit DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList;

type
  TDM_Contracts = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    SetupDataSet: TpFIBDataSet;
    DataSource_read: TDataSource;
    DataSet_help: TpFIBDataSet;
  private
    { Private declarations }
  public

  end;

implementation

{$R *.dfm}



end.
