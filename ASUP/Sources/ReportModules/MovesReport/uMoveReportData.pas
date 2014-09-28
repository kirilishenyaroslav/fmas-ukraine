unit uMoveReportData;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, IBase;

type
  TdmMoveReport = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    MoveDataSet: TpFIBDataSet;
    CurrentDepartment: TpFIBDataSet;
    GetSign: TpFIBDataSet;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; Handle: TISC_DB_HANDLE); reintroduce;
  end;

var
  dmMoveReport: TdmMoveReport;

implementation

{$R *.dfm}

constructor TdmMoveReport.Create(AOwner: TComponent; Handle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    DB.Handle := Handle;
end;

end.
