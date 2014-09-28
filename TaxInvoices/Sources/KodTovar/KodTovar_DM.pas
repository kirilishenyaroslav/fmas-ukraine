unit KodTovar_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TKodTovarDM = class(TDataModule)
    DB: TpFIBDatabase;
    KodTovarDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    KodTovarDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  KodTovarDM: TKodTovarDM;


implementation

{$R *.dfm}
constructor TKodTovarDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
