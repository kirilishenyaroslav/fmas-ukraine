unit MainGetSpravZP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls,
  cxLabel, cxControls, cxContainer, cxEdit, cxProgressBar, FIBDatabase,
  pFIBDatabase,StudcityConst, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDataSet,AccMGMT;

type
  TfrmMainGetSpravZp = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonStart: TcxButton;
    cxButtonClose: TcxButton;
    cxProgressBar1: TcxProgressBar;
    cxLabelStatus: TcxLabel;
    pFIBDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    MemoLog: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonStartClick(Sender: TObject);
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;

  TConnect = class(TThread)
  public
    bar:TcxProgressBar;
    StatusBar:TStatusBar;
    pos:Integer;
    DBIbx: TpFIBDatabase;
    DBH:TISC_DB_HANDLE;
    FIBTrans: TpFIBTransaction;
    FIBTransWR: TpFIBTransaction;
    FIBSProc: TpFIBStoredProc;
    ButtonStart:TcxButton;
    MemoLog:TMemo;
    textLog:String;
    procedure UpdateBar;
    procedure UpdateLog;
    procedure UpdateStBar;
    Constructor create(prog:TcxProgressBar;DB:TpFIBDataBase;
                            TR,TRW:TpFIBTransaction;SP:TpFIBStoredProc;DBHANDLE:TISC_DB_HANDLE;
                            Bstart:TcxButton;Status:TStatusBar;Memo:TMemo);
    procedure Execute;override;
    destructor Destroy;override;
  end;



  function GetSprav(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  exports GetSprav;
var
  frmMainGetSpravZp: TfrmMainGetSpravZp;
  st:TConnect;
implementation

uses DB;

{$R *.dfm}

Constructor TConnect.create(prog:TcxProgressBar;DB:TpFIBDataBase;
                            TR,TRW:TpFIBTransaction;SP:TpFIBStoredProc;DBHANDLE:TISC_DB_HANDLE;
                            Bstart:TcxButton;Status:TStatusBar;Memo:TMemo);
begin
  bar:=prog;
  DBIbx:=DB;
  DBH:=DBHANDLE;
  FIBTrans:=TR;
  FIBTransWR:=TRW;
  FIBSProc:=SP;
  ButtonStart:=Bstart;
  StatusBar:=StatusBar;
  MemoLog:=Memo;
  inherited Create(False);
end;

procedure TConnect.Execute();
var
  i,j:Integer;
  query:TpFIBDataSet;
begin
//отбираем претендентов
textLog:=StudcityConst.st_GetSpravValid;
Synchronize(UpdateStBar);
query:=TpFIBDataSet.Create(nil);
query.Database:=DBIbx;
query.Transaction:=FIBTrans;
query.SQLs.SelectSQL.Text:='  select * from ST_DT_SPARV_SELECT_ZARPLATA';
query.Active:=true;
query.FetchAll;
j:=1;
bar.Properties.Max:=query.RecordCount;
query.First;
FIBSProc.Database:=DBIbx;
FIBSProc.Transaction:=FIBTransWR;
FIBTransWR.StartTransaction;
FIBSProc.StoredProcName:='ST_DT_SPRAV_GET_ZP';
FIBSProc.Prepare;

for i:=1 to query.RecordCount do
  begin
    if not Terminated then
      begin
        if query.FieldByName('ID_N_NALOG').AsString='0' then
          begin
            TextLog:=(IntToStr(j)+'. '+query.FieldByName('FIO').AsString+' '+StudcityConst.st_GetSpravNotNalId);
            Synchronize(UpdateLog);
            inc(j);
          end
          else
          begin
              FIBSProc.ParamByName('IN_ID_PEOPLE').AsInt64:=query.FieldByName('ID_PEOPLE').asVariant;
              FIBSProc.ParamByName('IN_N_NALOG').AsString:=query.FieldByName('ID_N_NALOG').AsString;
              FIBSProc.ParamByName('IN_DATE_BEG').AsDateTime:=query.FieldByName('DATE_BEG_SPRAV').AsDateTime;
              FIBSProc.ParamByName('IN_DATE_END').AsDateTime:=query.FieldByName('DATE_END_SPRAV').AsDateTime;
              FIBSProc.ParamByName('IN_ID_USER').AsInteger:=AccMGMT.GetUserId;
              try
                FIBSProc.ExecProc;
                if FIBSProc.FieldByName('ERROR_TP').AsInteger=1 then
                  begin
                      TextLog:=(IntToStr(j)+'. '+query.FieldByName('FIO').AsString+' '+StudcityConst.st_GetSpravErrorNALZP);
                      Synchronize(UpdateLog);
                      inc(j);
                  end;
                Except
                  begin
//                    FIBTransWR.Rollback;
                    TextLog:=(IntToStr(j)+'. '+query.FieldByName('FIO').AsString+' '+StudcityConst.st_GetSpravErrorSP);
                    Synchronize(UpdateLog);
                    inc(j);
//                    messageBox(Application.MainForm.Handle,PChar(IntToStr(query.FieldByName('ID_PEOPLE').AsInteger)),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONINFORMATION);
                  end;
                end;
//              FIBTransWR.Commit;
          end;
        pos:=i;
        Synchronize(UpdateBar);
//        messageBox(Application.MainForm.Handle,PChar('Далее'),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONINFORMATION);
        query.Next;
      end
      else
      begin
        FIBTransWR.Rollback;
        ButtonStart.Enabled:=true;
        query.Destroy;
        TextLog:=(StudcityConst.st_GetSpravUserCancel+' '+DateTimeToStr(Now));
        Synchronize(UpdateLog);
        MemoLog.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Studcity\GetSprav.txt');
      end;
  end;
  FIBTransWR.Commit;
  TextLog:=(StudcityConst.st_GetSpravOK+' '+DateTimeToStr(Now));
  Synchronize(UpdateLog);
  MemoLog.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Studcity\GetSprav.txt');
  ButtonStart.Enabled:=true;
  query.Destroy;
  messageBox(Application.MainForm.Handle,PChar(StudcityConst.st_GetSpravFile+#13+ExtractFilePath(Application.ExeName)+'Studcity\GetSprav.txt'),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONINFORMATION);
end;

procedure TConnect.UpdateBar;
begin
  bar.Position:=pos;
end;

procedure TConnect.UpdateLog;
begin
  Memolog.Lines.Add(textLog);
end;

procedure TConnect.UpdateStBar;
begin
//  StatusBar.Panels[0].Text:=textLog;
end;


destructor TConnect.Destroy;
begin
  pos:=0;
  Synchronize(UpdateBar);
  Inherited destroy;
end;


function GetSprav(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  GetSPR:TfrmMainGetSpravZp;
begin
  GetSPR:=TfrmMainGetSpravZp.Create(AOwner,DB);
end;

Constructor TfrmMainGetSpravZp.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  pFIBDatabase.Handle:=DB;

  cxButtonStart.Caption:=StudcityConst.Studcity_ACTION_START_CONST;
  cxButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST;
  cxLabelStatus.Caption:=StudcityConst.st_GetSpravProgress;
  Caption:=StudcityConst.st_GetSprav;
end;

procedure TfrmMainGetSpravZp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainGetSpravZp.cxButtonCloseClick(Sender: TObject);
begin
  if st<>nil then
    begin
      st.Terminate;
    end;
  Close;
end;

procedure TfrmMainGetSpravZp.cxButtonStartClick(Sender: TObject);
begin
  cxButtonStart.Enabled:=false;
  st:=TConnect.create(cxProgressBar1,pFIBDatabase,ReadTransaction,WriteTransaction,pFIBStoredProc,pFIBDatabase.Handle,cxButtonStart,StatusBar1,MemoLog);
  end;

end.
