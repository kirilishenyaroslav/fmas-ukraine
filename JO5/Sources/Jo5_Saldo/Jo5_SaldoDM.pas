unit Jo5_SaldoDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    DSourceMain: TDataSource;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 var DM:TDM;

implementation

{$R *.dfm}

end.
