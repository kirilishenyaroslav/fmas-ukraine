unit st_Common_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBSQLMonitor;

type
  TDM_st_Common = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    FIBSQLMonitor1: TFIBSQLMonitor;
    procedure FIBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
  private
    { Private declarations }
  public
    result_text : String; 
  end;

implementation

{$R *.dfm}

procedure TDM_st_Common.FIBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
  result_text := result_text + EventText;
end;

end.








