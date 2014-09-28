unit uPaymentAnalysis_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmPaymentAnalysis_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
