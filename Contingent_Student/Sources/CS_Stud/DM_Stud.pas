unit DM_Stud;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, RxMemDS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceStud: TDataSource;
    StProc: TpFIBStoredProc;
    DataSetStud: TpFIBDataSet;
    DataSetFacul: TpFIBDataSet;
    DataSourceFacul: TDataSource;
    DataSetSpec: TpFIBDataSet;
    DataSourceSpec: TDataSource;
    DataSetGroup: TpFIBDataSet;
    DataSourceGroup: TDataSource;
    DataSetFormEduc: TpFIBDataSet;
    DataSourceFormEduc: TDataSource;
    DataSourceKurs: TDataSource;
    DataSetKurs: TpFIBDataSet;
    MemoryDataStud: TRxMemoryData;
    DataSetKat: TpFIBDataSet;
    DataSourceKat: TDataSource;
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
