unit Personification_DM;

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
    DSet3: TpFIBDataSet;
    DSource3: TDataSource;
    DSet4: TpFIBDataSet;
    DSource4: TDataSource;
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
 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REPORT_S ORDER BY NUM_REPORT DESCENDING';
 DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_ANKETA_S(?ID) order by tin';
 DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REP_DATA_S(?ID) order by KOD_SETUP2';
 DSet4.SQLs.SelectSQL.Text:=  'SELECT * FROM Z_PERSONIFICATION_ACC_SE(?id_anketa_out, ?kod_setup2, ?is_science) order by Kod_vidopl';

 DSet1.Open;
 DSet2.Open;
 DSet3.Open;
 DSet4.Open;
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Destroy;
end;

end.
