unit uCS_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TCSDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DSet: TpFIBDataSet;
  private
  public
  end;

implementation

{$R *.dfm}

end.
