unit Grant_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, UpKernelUnit, ZProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaulttTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure StProcTransactionAfterStart(Sender: TObject);
  private
    
  public

  end;

implementation

{$R *.dfm}

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaulttTransaction.InTransaction then DefaulttTransaction.Commit;
end;

procedure TDM.StProcTransactionAfterStart(Sender: TObject);
begin
  StartHistory(StProcTransaction,ValueFieldZSetup(DB.Handle,'GR_ID_SYSTEM'));
end;

end.
