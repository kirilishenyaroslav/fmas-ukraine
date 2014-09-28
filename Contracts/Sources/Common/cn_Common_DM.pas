unit cn_Common_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBSQLMonitor,  QStdCtrls;

  //IdMessage, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  //IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP;

type
  TDM_Common = class(TDataModule)
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

procedure TDM_Common.FIBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
  result_text := result_text + EventText;
end;

end.








