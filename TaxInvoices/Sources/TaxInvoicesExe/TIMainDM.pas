unit TIMainDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc;

type
  TDM = class(TDataModule)
    StProc: TpFIBStoredProc;
    TransactionW: TpFIBTransaction;
    DB: TpFIBDatabase;
    TransactionR: TpFIBTransaction;
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
