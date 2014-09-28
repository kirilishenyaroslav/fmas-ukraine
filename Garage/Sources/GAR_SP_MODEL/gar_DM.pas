unit gar_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, DB,
  FIBDataSet, pFIBDataSet, gr_uCommonLoader, FIBQuery, pFIBQuery,
  pFIBStoredProc ;

//var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    RWTransaction: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(Param:TgrSimpleParam); reintroduce;
  end;

var
  DM: TDM;

implementation


{$R *.dfm}

constructor TDM.Create(Param:TgrSimpleParam);
begin
  inherited Create(Param.Owner);
  DB.Handle:=Param.DB_Handle;
  RTransaction.DefaultDatabase:=DB;
  pFIBDataSet1.Database:=DB;
  pFIBDataSet1.Transaction:=RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;

  RWTransaction.DefaultDatabase:=DB;
  pFIBStoredProc1.Database:=DB;
  pFIBStoredProc1.Transaction:=RWTransaction;

  RTransaction.StartTransaction;
  RWTransaction.StartTransaction;

  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MODEL_S';
  pFIBDataSet1.Open;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   if RTransaction.InTransaction then RTransaction.Rollback;
end;

end.
