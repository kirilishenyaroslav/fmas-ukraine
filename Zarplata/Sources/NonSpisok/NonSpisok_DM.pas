unit NonSpisok_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDM = class(TDataModule)
    DSource2: TDataSource;
    DSet2: TpFIBDataSet;
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
//******************************************************************************
 DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_NONSPISOK_S_FIO(NULL) ORDER BY TN';
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_NONSPISOK_S(?ID_MAN)';
 DSet1.Open;
 DSet2.Open;
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
