unit uDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TfrmAccounts_DM = class(TDataModule)
    DataSource: TDataSource;
    ReadDataSet: TpFIBDataSet;
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSet: TpFIBDataSet;
    ReadDataSet_error: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccounts_DM: TfrmAccounts_DM;

implementation

{$R *.dfm}

end.
