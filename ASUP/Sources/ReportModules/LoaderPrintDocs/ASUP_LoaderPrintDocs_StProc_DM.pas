unit ASUP_LoaderPrintDocs_StProc_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase;

type
  TStProcDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
  private
  public
  end;

implementation

{$R *.dfm}

end.
