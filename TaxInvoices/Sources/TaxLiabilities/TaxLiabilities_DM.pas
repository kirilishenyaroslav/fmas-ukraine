unit TaxLiabilities_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TTaxLiabilitiesDM = class(TDataModule)
    DB: TpFIBDatabase;
    TaxLiabilitiesDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TaxLiabilitiesDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TaxLiabilitiesDM: TTaxLiabilitiesDM;


implementation

{$R *.dfm}
constructor TTaxLiabilitiesDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
