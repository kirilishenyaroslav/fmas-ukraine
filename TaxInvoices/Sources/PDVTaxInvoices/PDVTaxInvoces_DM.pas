unit PDVTaxInvoces_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TPDVTaxInvocesDM = class(TDataModule)
    DB: TpFIBDatabase;
    PDVTaxInvocesDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    PDVTaxInvocesDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  PDVTaxInvocesDM: TPDVTaxInvocesDM;


implementation

{$R *.dfm}
constructor TPDVTaxInvocesDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
