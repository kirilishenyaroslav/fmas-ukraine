unit RangeOfDelivery_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TRangeOfDeliveryDM = class(TDataModule)
    DB: TpFIBDatabase;
    RangeOfDeliveryDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    RangeOfDeliveryDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  RangeOfDeliveryDM: TRangeOfDeliveryDM;


implementation

{$R *.dfm}
constructor TRangeOfDeliveryDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
