unit JO5_dmStorProc;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, IBase;

type
  TStoredProcDM = class(TDataModule)
    StorProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; AHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}
constructor TStoredProcDM.Create(AOwner:TComponent; AHandle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.Handle:=AHandle;
end;
end.
