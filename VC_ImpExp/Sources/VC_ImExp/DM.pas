unit DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, ADODB;

type
  TDM_IE = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_IE: TDM_IE;

implementation

{$R *.dfm}

end.
