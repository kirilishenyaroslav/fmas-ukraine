unit BankValutaDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ibase, DB, FIBDataSet, pFIBDataSet;

type
  TBankValuta_DM = class(TDataModule)
    DB: TpFIBDatabase;
    TransRead: TpFIBTransaction;
    TransWrite: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ValutaDSet: TpFIBDataSet;
    ValutaKursDSet: TpFIBDataSet;
    ValutaDSource: TDataSource;
    ValutaKursDSource: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  BankValuta_DM: TBankValuta_DM;

implementation

{$R *.dfm}

constructor TBankValuta_DM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 TransRead.StartTransaction;
end;

end.
