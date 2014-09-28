unit SpTuDep_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    TransactionR: TpFIBTransaction;
    DSource: TDataSource;
    TransactionW: TpFIBTransaction;
    StProc: TpFIBStoredProc;
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
