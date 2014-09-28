unit Sp_DedConst_Zarplata_Control_DataModul;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaulttTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
  private
    
  public

  end;

implementation

{$R *.dfm}

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaulttTransaction.InTransaction then DefaulttTransaction.Commit;
end;

end.
