unit ProtFSS_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, FIBQuery, pFIBQuery, pFIBStoredProc;

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
    pFIBStoredProc: TpFIBStoredProc;
    DSetList: TpFIBDataSet;
    DSourseList: TDataSource;
    DSourceHospList: TDataSource;
    DSetHospList: TpFIBDataSet;
    DSetExport1: TpFIBDataSet;
    DSetExport2: TpFIBDataSet;
    DataSetAlg: TpFIBDataSet;
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
 DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_DT_HOSP_REESTR_S order by Date_reestr';
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_MAN_HOSPITAL_S(:ID_REESTR) order by tn';
 DSet1.Open;
 DSet2.Open;
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
