unit Remont_DM;

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
    DSource3: TDataSource;
    DSet3: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    rxDSet3: TRxMemoryData;
    WriteTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    procedure DSet3AfterOpen(DataSet: TDataSet);
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
 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_SELECT_FIO(NULL) ORDER BY TN';
 DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECT_WORKTERMS(?ID_MAN) order by period_end descending';
 DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_S(?RMOVING,NULL) Order by DayMonth';
 DSet1.Open;
 DSet2.Open;
//******************************************************************************
end;

procedure TDM.DSet3AfterOpen(DataSet: TDataSet);
var i:byte;
begin
rxDSet3.EmptyTable;
DSet3.Last;
for i:=DSet3.RecordCount downto 1 do
 begin
  rxDSet3.Open;
  rxDSet3.Insert;
  rxDSet3['ID_REMONT']:=DSet3['ID_REMONT'];
  rxDSet3['TARIF_REMONT']:=DSet3['TARIF_REMONT'];
  rxDSet3['CLOCK_REMONT']:=DSet3['CLOCK_REMONT'];
  rxDSet3['TARIF']:=DSet3['TARIF'];
  rxDSet3['DAYMONTH']:=DSet3['DAYMONTH'];
  rxDSet3['GHOURS']:=DSet3['GHOURS'];
  rxDSet3['HOURS']:=DSet3['HOURS'];
  rxDSet3.Post;
  DSet3.Prior;
 end;
DSet3.Close;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Destroy;
end;

end.
