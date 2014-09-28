unit Sp_Dop_Nach_Zarplata_Control_DataModul;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ZTypes;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaulttTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSetCategory: TpFIBDataSet;
    DSourceCategory: TDataSource;
    DSetTypePost: TpFIBDataSet;
    DSourceTypePost: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    
  public
    constructor create(AParameter:TDopNachControlParameter); reintroduce;

  end;

implementation

{$R *.dfm}



constructor TDM.create(AParameter: TDopNachControlParameter);
begin
  inherited create(AParameter.AOwner);
  DB.handle:=AParameter.ADb_Handle;
  DefaulttTransaction.StartTransaction;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaulttTransaction.InTransaction then DefaulttTransaction.Commit;
end;

end.
