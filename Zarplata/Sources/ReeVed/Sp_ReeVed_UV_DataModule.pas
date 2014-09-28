unit Sp_ReeVed_UV_DataModule;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDM_ReeVed = class(TDataModule)
    DataBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSetParent: TpFIBDataSet;
    DataSetChildParent: TpFIBDataSet;
    DataSetChild: TpFIBDataSet;
    DataSourceParent: TDataSource;
    DataSourceChildParent: TDataSource;
    DataSourceChild: TDataSource;
    StoredProc: TpFIBStoredProc;
    DataSetSheetData: TpFIBDataSet;
    DataSourceSheetData: TDataSource;
    ExportToBankDataSet: TpFIBDataSet;
    DSetSheetToBankCheck: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    constructor Create(AOWner: TComponent);reintroduce;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


constructor TDM_ReeVed.Create(AOwner: TComponent);
begin
     inherited Create(AOWner);
     DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(1)';
end;

procedure TDM_ReeVed.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
