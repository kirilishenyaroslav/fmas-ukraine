unit IndexActsCtrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, IBase, ZTypes;

type
  TDM_Ctrl = class(TDataModule)
    Db: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSetData: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZIndexParameters);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TDM_Ctrl.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZIndexParameters);
begin
inherited Create(AOwner);
db.Handle:=ADB_HANDLE;
ReadTransaction.StartTransaction;
end;

procedure TDM_Ctrl.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
