unit DMPIPrepareDoc1df;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, RxMemDS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceHeader: TDataSource;
    StProc: TpFIBStoredProc;
    DataSetHeader: TpFIBDataSet;
    DataSetSelNumb: TpFIBDataSet;
    DataSetDocRecord: TpFIBDataSet;
    DataSourceDocRecord: TDataSource;
    DataSetDocRecordTmp: TpFIBDataSet;
    DataSetPass: TpFIBDataSet;
    DataSetInn: TpFIBDataSet;
    MemoryDataHeader: TRxMemoryData;
    DataSetProp: TpFIBDataSet;
    DataSetSch: TpFIBDataSet;
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
