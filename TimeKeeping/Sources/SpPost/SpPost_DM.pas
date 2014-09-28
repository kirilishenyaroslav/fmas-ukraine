unit SpPost_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DSet: TpFIBDataSet;
    DB: TpFIBDatabase;
    TransactionR: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    TransactionW: TpFIBTransaction;
    DSource: TDataSource;
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
