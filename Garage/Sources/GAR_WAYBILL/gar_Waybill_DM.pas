unit gar_Waybill_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, DB,
  FIBDataSet, pFIBDataSet, gr_uCommonLoader, FIBQuery, pFIBQuery,
  pFIBStoredProc,  gar_Types, Variants;

//var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    WTransaction: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    DataSource2: TDataSource;
    pFIBDataSet2: TpFIBDataSet;
    DataSource3: TDataSource;
    pFIBDataSet3: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(Param:TgarParamWaybillFilter); reintroduce;
  end;

var
  DM: TDM;
  ParamWaybillFilter: TgarParamWaybillFilter;
implementation

uses StrUtils;


{$R *.dfm}

constructor TDM.Create(Param:TgarParamWaybillFilter);
var v:integer;
begin
  inherited Create(Param.Owner);
  DB.Handle:=Param.DB_Handle;
  RTransaction.DefaultDatabase:=DB;
  pFIBDataSet1.Database:=DB;
  pFIBDataSet1.Transaction:=RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;
  DataSource2.DataSet:=pFIBDataSet2;
  pFIBDataSet2.DataSource:=DataSource1;

  WTransaction.DefaultDatabase:=DB;
  pFIBStoredProc1.Database:=DB;
  pFIBStoredProc1.Transaction:=WTransaction;

  //if not RTransaction.Active then RTransaction.StartTransaction;
  RTransaction.StartTransaction;

  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_BY_PARAM_S('''+VarToStrDef(ParamWaybillFilter.DATE_BEG,'01.01.1995')+
    ''','''+VarToStrDef(ParamWaybillFilter.DATE_END,'31.12.2050')+''','''+ParamWaybillFilter.SERIES+''','+
    varToStrDef(ParamWaybillFilter.NOMBER,'NULL')+','+IntToStr(ParamWaybillFilter.ParamAvto.id)+','
    +IntToStr(ParamWaybillFilter.ParamPeople.id)+','+IntToStr(ParamWaybillFilter.id_forma)+')';
  pFIBDataSet1.Open;

  if not pFIBDataSet1.isEmpty then
  begin
    pFIBDataSet2.Close;
    pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S(:ID_WAYBILL)';
    pFIBDataSet2.Open;

    pFIBDataSet3.Close;
    pFIBDataSet3.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PART_S(:ID_WAYBILL)';
    pFIBDataSet3.Open;
  end;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if RTransaction.InTransaction then RTransaction.Commit;
  if WTransaction.InTransaction then WTransaction.Commit;
  ParamWaybillFilter.Free;
end;

end.
