unit Address_dmStorProc;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, IBase;

type
  TStorProcDM = class(TDataModule)
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TStorProcDM.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.Handle:=ADB_Handle;
end;
end.
