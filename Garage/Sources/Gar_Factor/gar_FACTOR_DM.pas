unit gar_FACTOR_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, gar_Types;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    WTransaction: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Param:TgarSimpleParamMode); reintroduce;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

constructor TDM.Create(Param: TgarSimpleParamMode);
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

  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_FACTOR_S';
  pFIBDataSet1.Open;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if RTransaction.InTransaction then RTransaction.Commit;
end;

end.
