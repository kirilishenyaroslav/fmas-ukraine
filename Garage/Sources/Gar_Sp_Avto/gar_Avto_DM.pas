unit gar_Avto_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, DB,
  FIBDataSet, pFIBDataSet, gar_Types, FIBQuery, pFIBQuery,
  pFIBStoredProc ;

//var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    WTransaction: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    pFIBDataSet3: TpFIBDataSet;
    DataSource3: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(Param:TgarSimpleParamMode); reintroduce;
  end;

var
  DM: TDM;

implementation


{$R *.dfm}

constructor TDM.Create(Param:TgarSimpleParamMode);
begin
  inherited Create(Param.Owner);
  DB.Handle:=Param.DB_Handle;
  RTransaction.DefaultDatabase:=DB;
  pFIBDataSet1.Database:=DB;
  pFIBDataSet1.Transaction:=RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;

  WTransaction.DefaultDatabase:=DB;
  pFIBStoredProc1.Database:=DB;
  pFIBStoredProc1.Transaction:=WTransaction;

  RTransaction.StartTransaction;
  WTransaction.StartTransaction;

  pFIBDataSet3.Close;
  pFIBDataSet2.Close;
  pFIBDataSet1.Close;
  pFIBDataSet2.DataSource:=DataSource1;
  pFIBDataSet3.DataSource:=DataSource1;

  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_AVTO_S';
  pFIBDataSet1.Open;

  if not pFIBDataSet1.IsEmpty  then
  begin
    pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_EQUIPMENT_S(:ID_AVTO)';
    pFIBDataSet2.SQLs.RefreshSQL.Text:='SELECT * FROM GAR_EQUIPMENT_S(:ID_AVTO)';
    pFIBDataSet2.Open;

    pFIBDataSet3.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_AVTO_S(:ID_AVTO)';
    pFIBDataSet3.Open;
  end;


end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if RTransaction.InTransaction then RTransaction.Commit;
  if WTransaction.InTransaction then WTransaction.Rollback;

end;

end.
