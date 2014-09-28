unit ManHospRMoving_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, Ztypes, DB, FIBDataSet, pFIBDataSet, Zproc, Forms, Z_uWaitForm,
  ibase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaulttTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSource2: TDataSource;
    DSource1: TDataSource;
    DSource3: TDataSource;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DSet3: TpFIBDataSet;
    DataSet: TpFIBDataSet;
    procedure DSet3CalcFields(DataSet: TDataSet);
  private
    pKodSetupBeg:integer;
    pKodSetupEnd:integer;
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
    procedure DataModuleDestroy(Sender: TObject);
  end;

var
  DM: TDM;

implementation

uses StrUtils, ZWait;

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
//******************************************************************************
 DB.Handle:=AHandle;
 DefaulttTransaction.StartTransaction;
end;


procedure TDM.DataModuleDestroy(Sender: TObject);
begin
     if DefaulttTransaction.InTransaction then DefaulttTransaction.Commit;
end;



procedure TDM.DSet3CalcFields(DataSet: TDataSet);
begin
    if DSet3.IsEmpty then Exit;
    if DSet3['Id_Parent'] <> -1 then DSet3['Primary'] := 'връ (2)'
    else DSet3['Primary'] := 'ЭГ (1)';
end;

end.
