unit DBDataModul;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase;

type
  TDBDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
  end;

var
  DBDM: TDBDM;

implementation

{$R *.dfm}

end.
