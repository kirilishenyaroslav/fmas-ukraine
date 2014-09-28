unit DM_ReportLoader;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    Db: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    LoaderDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    UpdateGroupQuery: TpFIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
