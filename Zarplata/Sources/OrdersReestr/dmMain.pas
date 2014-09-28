unit dmMain;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  pFIBStatistic, pFIBErrorHandler, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TMainDataModule = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    OrdersListDataSet: TpFIBDataSet;
    OrdersListDataSetEXEC_DATETIME: TFIBDateTimeField;
    OrdersListDataSetID_ORDER: TFIBIntegerField;
    OrdersListDataSetID_ORDER_TYPE: TFIBIntegerField;
    OrdersListDataSetID_STATUS: TFIBIntegerField;
    OrdersListDataSetNUM_ORDER: TFIBStringField;
    OrdersListDataSetNAME_TYPE: TFIBStringField;
    OrdersListDataSetDATE_ORDER: TFIBDateField;
    OrdersListDataSetNOTE: TFIBStringField;
    OrdersListDataSetNAME_STATUS: TFIBStringField;
    OrdersListDataSetSTANDART_ACTION: TFIBIntegerField;
    OrdersListDataSetYOUR_SIGN_STATUS: TFIBIntegerField;
    OrdersListDataSetPRINT_NAME: TFIBStringField;
    OrdersListDataSetINTRO: TFIBStringField;
    WriteTransaction: TpFIBTransaction;
    OrderInsertProc: TpFIBStoredProc;
    AcceptedOrdersDataSet: TpFIBDataSet;
    AcceptedOrdersDataSetEXEC_DATETIME: TFIBDateTimeField;
    AcceptedOrdersDataSetID_ORDER: TFIBIntegerField;
    AcceptedOrdersDataSetID_ORDER_TYPE: TFIBIntegerField;
    AcceptedOrdersDataSetID_STATUS: TFIBIntegerField;
    AcceptedOrdersDataSetNUM_ORDER: TFIBStringField;
    AcceptedOrdersDataSetNAME_TYPE: TFIBStringField;
    AcceptedOrdersDataSetDATE_ORDER: TFIBDateField;
    AcceptedOrdersDataSetNOTE: TFIBStringField;
    AcceptedOrdersDataSetNAME_STATUS: TFIBStringField;
    AcceptedOrdersDataSetSTANDART_ACTION: TFIBIntegerField;
    AcceptedOrdersDataSetYOUR_SIGN_STATUS: TFIBIntegerField;
    AcceptedOrdersDataSetPRINT_NAME: TFIBStringField;
    AcceptedOrdersDataSetINTRO: TFIBStringField;
    OrderDeleteProc: TpFIBStoredProc;
    GetIdPCardDataSet: TpFIBDataSet;
    GetIdPCardDataSetID_PCARD: TFIBIntegerField;
    MovingsCreateProc: TpFIBStoredProc;
    BonusCreateProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDataModule: TMainDataModule;

implementation

{$R *.dfm}

end.
