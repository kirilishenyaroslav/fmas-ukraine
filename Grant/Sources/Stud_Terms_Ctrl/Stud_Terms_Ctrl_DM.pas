unit Stud_Terms_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSetCatStud: TpFIBDataSet;
    DSourceCatStud: TDataSource;
    DSetFastDep: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    
  public

  end;

implementation

{$R *.dfm}

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
