unit gar_MarkaAvto_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, DB,
  FIBDataSet, pFIBDataSet, gr_uCommonLoader, FIBQuery, pFIBQuery,
  pFIBStoredProc ;

//var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TDM_Marka_Avto = class(TDataModule)
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
  DM_Marka_Avto: TDM_Marka_Avto;

implementation


{$R *.dfm}

constructor TDM_Marka_Avto.Create(Param:TgrSimpleParam);
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
  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_S';
  pFIBDataSet1.Open;

end;

procedure TDM_Marka_Avto.DataModuleDestroy(Sender: TObject);
begin
  if RTransaction.InTransaction then RTransaction.Rollback;
  if RWTransaction.InTransaction then RWTransaction.Rollback;
end;

end.
