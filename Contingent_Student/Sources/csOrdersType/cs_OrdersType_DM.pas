unit cs_OrdersType_DM;

interface

uses
  SysUtils, Classes, FIBDataSet, pFIBDataSet, DB, RxMemDS, FIBDatabase,
  pFIBDatabase, iBase, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    RxMem_EdboOrdersType: TRxMemoryData;
    DS_EdboOrdersType: TDataSource;
    DSOrdersType: TDataSource;
    DSetOrdersType: TpFIBDataSet;
    RxMem_EdboOrdersTypefId_PersonEducationHistoryType: TIntegerField;
    RxMem_EdboOrdersTypePersonEducationHistoryTypeName: TStringField;
    RxMem_EdboOrdersTypefPersonEducHistoryTypeDescript: TStringField;
    StorProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AHandle: TISC_DB_HANDLE); reintroduce;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

constructor TDM.Create(AOwner: TComponent; AHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    DB.Handle := AHandle;
    DefaultTransaction.StartTransaction;
    DSetOrdersType.Close;
    DSetOrdersType.SQLs.SelectSQL.Text := 'SELECT * FROM CS_DT_ORDER_TYPE';
end;

end.
