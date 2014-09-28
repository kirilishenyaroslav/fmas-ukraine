unit gar_Ved_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, DB,
  FIBDataSet, pFIBDataSet, gr_uCommonLoader, FIBQuery, pFIBQuery,
  pFIBStoredProc,  gar_Types;

//var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    RWTransaction: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    pFIBDataSet3: TpFIBDataSet;
    DataSource3: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(Param:TgarSimpleParam); reintroduce;
  end;

var
  DM: TDM;

implementation


{$R *.dfm}

constructor TDM.Create(Param:TgarSimpleParam);
begin
  inherited Create(Param.Owner);
  DB.Handle:=Param.DB_Handle;
  RTransaction.DefaultDatabase:=DB;
  pFIBDataSet1.Database:=DB;
  pFIBDataSet1.Transaction:=RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;

  pFIBDataSet2.DataSource:=DataSource1;
  DataSource2.DataSet:=pFIBDataSet2;

  pFIBDataSet3.DataSource:=DataSource1;
  DataSource3.DataSet:=pFIBDataSet3;

  RWTransaction.DefaultDatabase:=DB;
  pFIBStoredProc1.Database:=DB;
  pFIBStoredProc1.Transaction:=RWTransaction;

  RTransaction.StartTransaction;


  pFIBDataSet3.Close;
  pFIBDataSet2.Close;
  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_VED_S order by KOD_SETUP';
  pFIBDataSet1.Open;


  pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_BY_VED_S(:ID_VED) order by FIO';
  pFIBDataSet2.Open;

  pFIBDataSet3.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SUM_BY_VED_S(:ID_VED) order by MARKA_TOPL';
  pFIBDataSet3.Open;


end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if RTransaction.InTransaction then RTransaction.Commit;
  if RWTransaction.InTransaction then RWTransaction.Rollback;
end;

end.
