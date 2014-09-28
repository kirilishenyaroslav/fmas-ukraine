unit BankValutaSchDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ibase, DB, FIBDataSet, pFIBDataSet;

type
  TBankValutaSch_DM = class(TDataModule)
    DB: TpFIBDatabase;
    TransRead: TpFIBTransaction;
    TransWrite: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ValutaDSet: TpFIBDataSet;
    ValutaSchDSet: TpFIBDataSet;
    ValutaDSource: TDataSource;
    ValutaSchDSource: TDataSource;
    BalSchetValDSet: TpFIBDataSet;
    BalSchetValDSource: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  BankValutaSch_DM: TBankValutaSch_DM;

implementation

{$R *.dfm}

constructor TBankValutaSch_DM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 TransRead.StartTransaction;
end;

end.
