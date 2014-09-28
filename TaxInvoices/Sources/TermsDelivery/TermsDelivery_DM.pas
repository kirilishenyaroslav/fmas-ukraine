unit TermsDelivery_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TTermsDeliveryDM = class(TDataModule)
    DB: TpFIBDatabase;
    TermsDeliveryDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TermsDeliveryDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TermsDeliveryDM: TTermsDeliveryDM;


implementation

{$R *.dfm}
constructor TTermsDeliveryDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
