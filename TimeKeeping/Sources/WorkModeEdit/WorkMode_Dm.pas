unit WorkMode_Dm;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc;

type
  TDM = class(TDataModule)
    pFIBTransaction1: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
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
