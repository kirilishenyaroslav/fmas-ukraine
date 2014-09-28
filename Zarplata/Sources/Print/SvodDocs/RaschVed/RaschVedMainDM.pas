unit RaschVedMainDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, Variants, ZSvodTypesUnit, FIBQuery, pFIBQuery, pFIBStoredProc,
  RxMemDS;

type
  TMainDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DSource: TDataSource;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    RxMData: TRxMemoryData;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    constructor Create(AParameter:TZAccListParameter);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TMainDM.Create(AParameter:TZAccListParameter);
begin
 inherited Create(AParameter.AOwner);
 DB.Handle := AParameter.DB_Handle;
 if(AParameter.TypeData=3)then
 begin
   DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_SHIFR_S('+IntToStr(AParameter.ID_Session)+')';
   DSet.Open;
   RxMData.CopyStructure(DSet);
   RxMData.close;
   RxMData.Open;
   RxMData.LoadFromDataSet(DSet,0,lmAppend);
   DSource.DataSet:=RxMData;
 end
 else
  begin
   DSet.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM Z_RASCHVED_DEPARTMENT_S('+IntToStr(AParameter.ID_Session)+') ORDER BY KOD_DEPARTMENT';
   DSet.Open;
   RxMData.CopyStructure(DSet);
   RxMData.close;
   RxMData.Open;
   RxMData.LoadFromDataSet(DSet,0,lmAppend);
   DSource.DataSet:=RxMData;
  end;

end;

procedure TMainDM.DataModuleDestroy(Sender: TObject);
begin
  RxMData.Close;
  if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
