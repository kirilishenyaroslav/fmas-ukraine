unit f1df_DMm;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc, Halcn6db, xmldom,
  XMLIntf, msxmldom, XMLDoc;

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
    DataSetPrepareDoc: TpFIBDataSet;
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
 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_HEADERS_S ORDER BY year_1df desc, KVARTAL_1DF,NUM_PACHKA asc';
 DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S(?ID) order by tin_pasport';
 DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REE_S(?ID)';
 DSet4.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_TEMP_S(?ID) order by tin';
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
