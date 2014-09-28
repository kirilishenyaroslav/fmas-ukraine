unit TaxKredit_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase;

type
  TTaxKreditDM = class(TDataModule)
    DB: TpFIBDatabase;
    TaxKreditDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TaxKreditDSource: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TaxKreditDM: TTaxKreditDM;


implementation

{$R *.dfm}
constructor TTaxKreditDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
