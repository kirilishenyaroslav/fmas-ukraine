unit dmMain;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TMainDM = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    SpravkiDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    PrepareDataSet: TpFIBDataSet;
    PrepareDataSetKOD_BEG: TFIBIntegerField;
    PrepareDataSetKOD_END: TFIBIntegerField;
    PrepareDataSetID_REESTR: TFIBIntegerField;
    CreateSpravkiProc: TpFIBStoredProc;
    PeopleDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    PeopleDataSource: TDataSource;
    ClearQuery: TpFIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

{$R *.dfm}

end.
