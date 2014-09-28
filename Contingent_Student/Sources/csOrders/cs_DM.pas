unit cs_DM;

interface

uses
    SysUtils, Classes, DB, RxMemDS, FIBDatabase, pFIBDatabase, iBase, cs_uCommonTypes,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
    TDM = class(TDataModule)
        RxMem_EdboOrders: TRxMemoryData;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        RxMem_EdboOrdersId_PersonEducationHistoryOrders: TIntegerField;
        RxMem_EdboOrdersEducationHistoryOrdersNumber: TStringField;
        RxMem_EdboOrdersEducationHistoryOrdersDate: TDateTimeField;
        RxMem_EdboOrdersOrdersDateLastChange: TDateTimeField;
        RxMem_EdboOrdersId_HistoryType: TIntegerField;
        RxMem_EdboOrdersTypeName: TStringField;
        RxMem_EdboOrdersTypeDescription: TStringField;
        RxMem_EdboOrdersId_OrderStatus: TIntegerField;
        RxMem_EdboOrdersOrderStatusName: TStringField;
        RxMem_EdboOrdersIsVerified: TIntegerField;
        RxMem_EdboOrdersId_VerificationHistoryType: TIntegerField;
        RxMem_EdboOrdersStudCount: TIntegerField;
        DSource_EdboOrders: TDataSource;
    RxMem_EdboOrdersVerificationHistoryTypeName: TStringField;
    RxMemoryDataPeople: TRxMemoryData;
    StorProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    SyncStorProc: TpFIBStoredProc;
    ImageSyncDb: TpFIBDatabase;
    ImageSyncWTrans: TpFIBTransaction;
    ImageSyncProc: TpFIBStoredProc;
    SyncTrans: TpFIBTransaction;
    RxMem_EdboOrdersIs_SyncWithDB: TBooleanField;
    private
    { Private declarations }
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; AHandle: TISC_DB_HANDLE {; Param: TParamFilter}); reintroduce;
    end;

var
    DM: TDM;

implementation

{$R *.dfm}

constructor TDM.Create(AOwner: TComponent; AHandle: TISC_DB_HANDLE {; Param: TParamFilter});
begin
    inherited Create(AOwner);
    DB.Handle := AHandle;
    DefaultTransaction.StartTransaction;
 //pFIBTransaction5.StartTransaction;
//******************************************************************************

//******************************************************************************
end;

end.
