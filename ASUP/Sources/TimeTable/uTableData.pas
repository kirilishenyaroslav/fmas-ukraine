unit uTableData;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    IBase, RxMemDS;

type
    TTableData = class(TDataModule)
        DB: TpFIBDatabase;
        MovingCheck: TpFIBDataSet;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        OrdersCheck: TRxMemoryData;
        OrdersCheckId_Order: TIntegerField;
        OrdersCheckNum_Order: TStringField;
        OrdersCheckNote: TStringField;
        OrdersCheckSource: TDataSource;
        HalfTimeDataSet: TpFIBDataSet;
        HalfTimeSource: TDataSource;
        HalfTimeDataSetID_TABLE_WORK_HALF_TIME: TFIBIntegerField;
        HalfTimeDataSetDATE_BEG: TFIBDateField;
        HalfTimeDataSetDATE_END: TFIBDateField;
        HalfTimeDataSetHOURS_F: TFIBFloatField;
    private
    { Private declarations }
    public
        constructor Create(AOwner: TComponent; Handle: TISC_DB_Handle); reintroduce;
    end;

implementation

{$R *.dfm}

constructor TTableData.Create(AOwner: TComponent; Handle: TISC_DB_Handle);
begin
    inherited Create(AOwner);

    DB.Handle := Handle;
end;

end.
