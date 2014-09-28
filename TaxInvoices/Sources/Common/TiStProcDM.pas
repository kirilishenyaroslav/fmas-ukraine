unit TiStProcDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TStProcDM = class(TDataModule)
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    AbbreviatureDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

end.
