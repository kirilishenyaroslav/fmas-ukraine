unit f1df_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc, Halcn6db;

type
  TDM = class(TDataModule)
    DSource2: TDataSource;
    DSet2: TpFIBDataSet;
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    HalcyonDataSet1: THalcyonDataSet;
    CreateHalcyonDataSet: TCreateHalcyonDataSet;
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
 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_HEADERS_S ORDER BY KVARTAL_1DF,NUM_PACHKA';
 DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S(?ID) order by tin_pasport';
 DSet1.Open;
 DSet2.Open;
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Destroy;
end;

end.
