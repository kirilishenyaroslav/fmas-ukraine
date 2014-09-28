unit ManHospControlDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, Ztypes, DB, FIBDataSet, pFIBDataSet, RxMemDS;

type
  TDM = class(TDataModule)
    DefaulttTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSetTypes: TpFIBDataSet;
    DSourceTypes: TDataSource;
    DSetVidOpl: TpFIBDataSet;
    DSVidOpl: TDataSource;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    DSOurceMode: TDataSource;
    DSetMode: TpFIBDataSet;
    DSetMovingMode: TpFIBDataSet;
    DSourceMovingMode: TDataSource;
    DSourceExcept: TDataSource;
    DSetExcept: TpFIBDataSet;
    DataSetHosp: TpFIBDataSet;
    DataSourceHosp: TDataSource;
    DataSetParent: TpFIBDataSet;
    MemoryData: TRxMemoryData;
    MemoryDataMoving: TRxMemoryData;
    DataSetModeDefault: TpFIBDataSet;
    DataSourceProdl: TDataSource;
    DataSetDays: TpFIBDataSet;
    DataSetHospDate: TpFIBDataSet;
    DataSetSetup: TpFIBDataSet;
    DataSetOtpusk: TpFIBDataSet;
    DataSetCheckWorkDog: TpFIBDataSet;
    DataSetSysData: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    constructor create(AParameter:THospRMovingParameter); reintroduce;

  end;

implementation

{$R *.dfm}

constructor TDM.create(AParameter: THospRMovingParameter);
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
