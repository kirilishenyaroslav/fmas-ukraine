unit uWAccDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, frxClass, frxDBSet;

type
  TdmWAccReport = class(TDataModule)
    Database: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ReportDS: TpFIBDataSet;
    frxReportData: TfrxDBDataset;
    frxReport: TfrxReport;
    AsupParamsDS: TpFIBDataSet;
    TotalsDS: TpFIBDataSet;
    frxTotalsData: TfrxDBDataset;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; Handle: TISC_DB_HANDLE); reintroduce;
  end;

var
  dmWAccReport: TdmWAccReport;

implementation

{$R *.dfm}

constructor TdmWAccReport.Create(AOwner: TComponent; Handle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);

    Database.Handle := Handle;
end;

end.
