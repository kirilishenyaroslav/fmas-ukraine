unit CsTypeOrderPremiaDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, uCS_Types,
  RxMemDS;

type
  TDMFCsTypeOrderPremiaMain = class(TDataModule)
    GetDefaultPercent: TpFIBDataSet;
    GetDefaultPercentRAISE_DEFAULT: TFIBFloatField;
    GetRaiseCalcType: TpFIBDataSet;
    GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField;
    GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField;
    MainOrderDataSet: TpFIBDataSet;
    SmetsDataSet: TpFIBDataSet;
    SmDataSource: TDataSource;
    MainOrderDataSource: TDataSource;
    SalaryFinanceDataSource: TDataSource;
    SmDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor create(Param:TcsTypeOrderParam); reintroduce;
  end;

var
  DMFCsTypeOrderPremiaMain: TDMFCsTypeOrderPremiaMain;

implementation

{$R *.dfm}

{ TDMFCsTypeOrderPremiaMain }

constructor TDMFCsTypeOrderPremiaMain.create(Param: TcsTypeOrderParam);
begin
  inherited create(Param.owner);
  WorkDatabase.handle:=Param.DB_Handle;
end;

procedure TDMFCsTypeOrderPremiaMain.DataModuleDestroy(Sender: TObject);
begin
  if WriteTransaction.Active then WriteTransaction.Rollback;
  if ReadTransaction.Active then ReadTransaction.Rollback;
end;

end.
