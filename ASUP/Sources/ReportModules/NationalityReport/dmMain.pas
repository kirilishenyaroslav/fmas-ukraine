unit dmMain;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TMainDM = class(TDataModule)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReportDataSet: TpFIBDataSet;
    ReportDataSource: TDataSource;
    NationalityDataSet: TpFIBDataSet;
    NationalityDataSetID_NATIONALITY: TFIBIntegerField;
    NationalityDataSetNAME_NATIONALITY: TFIBStringField;
    NationalityDataSource: TDataSource;
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
