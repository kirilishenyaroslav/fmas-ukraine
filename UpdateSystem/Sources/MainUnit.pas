unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, consts, IBSQL, ShellApi, IniFiles,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, SysAdmin, Buttons, dxStatusBar, cxLookAndFeelPainters,
  cxGroupBox, cxButtons, cxContainer, cxTextEdit, cxMemo,
  cxGridBandedTableView, cxProgressBar, IdBaseComponent, IdAntiFreezeBase,
  IdAntiFreeze;

type
  TMainForm = class(TForm)
    MainPageControl: TPageControl;
    AcceptPage: TTabSheet;
    SettingsPage: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    HistoryQuery: TIBQuery;
    HistoryDataSource: TDataSource;
    OpenDialog: TOpenDialog;
    WorkSQL: TIBSQL;
    GetSystemNameQuery: TIBQuery;
    GetSystemNameQueryNAME_SYSTEM: TIBStringField;
    GetSystemNameQueryE_MAIL: TIBStringField;
    WorkQuery: TIBQuery;
    GetSystemNameQueryLAST_UPDATE: TIntegerField;
    Label5: TLabel;
    SystemsQuery: TIBQuery;
    SystemsDataSource: TDataSource;
    SystemsQueryID_SYSTEM: TIntegerField;
    SystemsQueryNAME_SYSTEM: TIBStringField;
    SystemsQueryE_MAIL: TIBStringField;
    Label6: TLabel;
    HistTableView: TcxGridDBTableView;
    HistGridLevel1: TcxGridLevel;
    HistGrid: TcxGrid;
    HistTableView_SYSTEM_NAME: TcxGridDBColumn;
    HistTableView_VERSION_NUMBER: TcxGridDBColumn;
    HistTableView_VERSION_DATE: TcxGridDBColumn;
    HistTableView_ACCEPT_DATETIME: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    HistTableView_SERVER_NAME: TcxGridDBColumn;
    HistoryQueryID_SYSTEM: TIntegerField;
    HistoryQueryVERSION_NUMBER: TIntegerField;
    HistoryQueryVERSION_DATE: TDateField;
    HistoryQueryACCEPT_DATETIME: TDateTimeField;
    HistoryQuerySYSTEM_NAME: TIBStringField;
    HistoryQuerySERVER_NAME: TIBStringField;
    SysGrid: TcxGrid;
    SysTableView: TcxGridDBTableView;
    SysGrid_NAME_SYSTEM: TcxGridDBColumn;
    SysGrid_E_MAIL: TcxGridDBColumn;
    SysGridLevel: TcxGridLevel;
    SaveDialog: TSaveDialog;
    HistoryQueryACCEPT_LOG: TBlobField;
    StatusBar: TdxStatusBar;
    LogEdit: TcxMemo;
    OpenUpdateButton: TcxButton;
    AcceptUpdateButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    SystemNameLabel: TLabel;
    Label4: TLabel;
    LastUpdateLabel: TLabel;
    UpdateVersionLabel: TLabel;
    UpdateDateLabel: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    ConnectionEdit: TcxTextEdit;
    SaveOptionsButton: TcxButton;
    SysAdminButton: TcxButton;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    ProgresBar: TcxProgressBar;
    AbortBtn: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure OpenUpdateButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcceptUpdateButtonClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SaveOptionsButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SysAdminButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AbortBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    UpdateVersion : Integer;
    UpdateSystem : Integer;
    UpdateDate : TDate;
    UpdateFileName : String;

    procedure EnableButtons(Enabled : boolean);
  end;

var
  MainForm: TMainForm;
  StmtCount : integer;
  ErrCount : integer;
  TotalStmts: Integer;
  abort_update: Boolean;

type
  TConnectErrorCallbackFunc = function (AErrorMessage : PChar) : integer;  stdcall;
  TScriptErrorCallbackFunc = function (AStmtText, AErrMessage : PChar) : integer; stdcall;
  TScriptBeforeExecStatementFunc = function (AStmtText, AText : PChar) : integer; stdcall;
  TScriptAfterExecStatementFunc = function (AStmtText : PChar; Success : integer) : integer; stdcall;

  TExecuteScriptProc = procedure (AScriptFile : PChar;
                                  AErrorCallbackFunc : TScriptErrorCallbackFunc;
                                  ABeforeCallbackFunc : TScriptBeforeExecStatementFunc;
                                  AAfterCallbackFunc : TScriptAfterExecStatementFunc); stdcall;

  TConnectDBProc = function (AConnectParams : PChar;
                             AConnectErrorCallbacFunc : TConnectErrorCallbackFunc) : integer; stdcall;

  function HandleError(AStmtText, AErrMessage : PChar) : integer; stdcall;
  function BeforeExec(AStmtText, AText : PChar) : integer; stdcall;
  function AfterExec(AStmtText : PChar; Success : integer) : integer; stdcall;

implementation

uses DMUnit, ProcessUnit, MMSystem, Math, IBase;

{$R *.dfm}

function HandleError(AStmtText, AErrMessage : PChar) : integer; stdcall;
begin
  Result := 0;
  Inc(ErrCount);
  MainForm.AbortBtn.Enabled:=True;
  with MainForm.LogEdit.Lines do
    begin
      Add('');
      Add(IntToStr(StmtCount+1)+':------- STATEMENT --------');
      Add(AStmtText);
      Add('');
      Add('-------   ERROR   --------');
      Add(AErrMessage);
    end;
end;

function BeforeExec(AStmtText, AText : PChar) : integer; stdcall;
begin
  Result := 0;
  MainForm.LogEdit.Lines.Add(IntToStr(StmtCount+1)+': '+AText);
end;

function AfterExec(AStmtText : PChar; Success : integer) : integer; stdcall;
begin
  Result := 0;
  if Success = 1
    then //Inc(StmtCount);
    else beep; //Result := 1; // Abort script execution

  if abort_update then Result:=1;
  Inc(StmtCount);
  Application.ProcessMessages;
  MainForm.ProgresBar.Position:=round( StmtCount/TotalStmts*100 );
  MainForm.ProgresBar.Refresh;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if MessageDlg('Выйти из программы?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then Action := caNone;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.TabSheet1Show(Sender: TObject);
begin
 HistoryQuery.Close;
 HistoryQuery.Open;
end;

procedure TMainForm.OpenUpdateButtonClick(Sender: TObject);
var
 Signature   : String;
 InF, OutF   : File;
 i, len      : Integer;
 ProcessForm : TProcessForm;
 Buf         : array of byte;
 setterm     : Boolean;
begin
 EnableButtons(False);

 OpenDialog.InitialDir := Dm.ProgramPath;
 if OpenDialog.Execute then
 begin
   UpdateFileName := OpenDialog.FileName;

  // Decoding input file
   AssignFile(InF, OpenDialog.FileName);
   Reset(InF, 1);
   len := FileSize(inF);
   SetLength(buf, len);

   ProcessForm :=TProcessForm.Create(Self);
   ProcessForm.Progress.Properties.Max := len;
   ProcessForm.Caption := 'Читаю исходный файл...';
   ProcessForm.Show;

   for i := 0 to len - 1 do begin
    BlockRead(inF, Buf[i], 1);

    if i mod 1000 = 0 then begin
     ProcessForm.Progress.Position := i;
     ProcessForm.Step;

     if ProcessForm.Stop then begin
      ProcessForm.Hide;
      Screen.Cursor := crDefault;
      EnableButtons(True);
      Exit;
     end;
    end;
   end;

   CloseFile(inF);

   ProcessForm.Progress.Position := 0;
   ProcessForm.Caption := 'Декодирую исходный файл...';
   ProcessForm.Update;

   for i := 0 to len - 1 do begin
    Buf[i] := Buf[i] xor 147;

    if i mod 1000 = 0 then begin
     ProcessForm.Progress.Position := i;
     ProcessForm.Step;

     if ProcessForm.Stop then begin
      ProcessForm.Hide;
      Screen.Cursor := crDefault;
      EnableButtons(True);
      Exit;
     end;
    end;
   end;

   AssignFile(OutF, Dm.ProgramPath + 'decoded');
   Rewrite(OutF, 1);

   ProcessForm.Progress.Position := 0;
   ProcessForm.Caption := 'Пишу временный файл скрипта...';
   ProcessForm.Update;

   for i := 0 to len -1 do begin
    BlockWrite(OutF, Buf[i], 1);

    if i mod 1000 = 0 then begin
       ProcessForm.Progress.Position := i;
       ProcessForm.Step;

       if ProcessForm.Stop then begin
          ProcessForm.Hide;
          Screen.Cursor := crDefault;
          EnableButtons(True);
          Exit;
       end;
    end;
   end;

   CloseFile(OutF);

   ProcessForm.Hide;
   Screen.Cursor := crDefault;
   ProcessForm.Free;

   UpdateFileName := Dm.ProgramPath + 'decoded';

   try
    WorkSQL.Close;
    WorkSQL.SQL.LoadFromFile(UpdateFileName);
    DeleteFile(UpdateFileName);

    Signature := Copy(WorkSQL.SQL.Strings[0], 0, 4);
    if Signature <> '3030' then begin
       ShowMessage('Выбранный файл не является файлом обновления БД!');
       WorkSQL.Close;
       EnableButtons(True);
       Exit;
    end;

    Signature := Copy(WorkSQL.SQL.Strings[0], 6, 8);
    UpdateSystem := StrToInt(Signature);
    Signature := Copy(WorkSQL.SQL.Strings[0], 15, 8);
    UpdateVersion:= StrToInt(Signature);
    Signature := Copy(WorkSQL.SQL.Strings[0], 24, 10);
    UpdateDate := StrToDate(Signature);

    GetSystemNameQuery.Close;
    GetSystemNameQuery.Params.ParamValues['ID_SYSTEM'] := UpdateSystem;
    GetSystemNameQuery.Open;

    if (GetSystemNameQuery.IsEmpty) then begin
      UpdateVersion := -1;
      ShowMessage('В вашей БД не удалось обнаружить систему, для которой предназначено выбранное обновление!');
      EnableButtons(True);
      Exit;
    end;

    SystemNameLabel.Caption := GetSystemNameQueryNAME_SYSTEM.Value;
    LastUpdateLabel.Caption := GetSystemNameQueryLAST_UPDATE.AsString;
    UpdateVersionLabel.Caption := IntToStr(UpdateVersion);
    UpdateDateLabel.Caption := DateToStr(UpdateDate);

    WorkSQL.SQL[0] := 'SET SQL DIALECT 3; SET NAMES WIN1251; ' + ' CONNECT ' + QuotedStr(DM.DBPath) + ' USER ' + QuotedStr(DM.CurrentLogin) + ' password ' + QuotedStr(DM.CurrentPassword) + ';';
    WorkSQL.SQL.Add('EXECUTE PROCEDURE SYS_VERSION_HISTORY_INSERT(' + IntToStr(UpdateSystem) + ',' + IntToStr(UpdateVersion) + ',' + QuotedStr(DateToStr(UpdateDate)) + ',' + QuotedStr('NOW') + '); Commit Work;');

    //анализ кол-ва стэйтментов
      begin
        TotalStmts:=0;
        setterm:=False;
        for i:=0 to WorkSQL.SQL.Count-1 do begin
          if setterm  then
            if Pos('; ^',WorkSQL.SQL.Strings[i])<>0 then setterm:=False
            else if pos('^',WorkSQL.SQL.Strings[i])<>0 then Inc(TotalStmts) else
          else
            if Pos('^ ;',WorkSQL.SQL.Strings[i])<>0 then setterm:=True
            else if Pos(';',WorkSQL.SQL.Strings[i]) <>0 then Inc(TotalStmts);
        end;
         StatusBar.Panels[2].Text:=IntToStr(TotalStmts);
       end;



   except on e : Exception do
    begin
     ShowMessage('Возникла ошибка: ' + E.Message);
     UpdateVersion := -1;
    end
   end;
 end;

 EnableButtons(True);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 MainPageControl.ActivePageIndex := 0;

 HistoryQuery.Transaction := DM.ReadTransaction;
 GetSystemNameQuery.Transaction := DM.ReadTransaction;
 SystemsQuery.Transaction := DM.ReadTransaction;
 WorkSQL.Transaction := DM.WriteTransaction;
 WorkQuery.Transaction := DM.WriteTransaction;
 UpdateVersion := -1;

 ConnectionEdit.Text := DM.DBPath;

//////// добавить сюда номер системного обновления!
 GetSystemNameQuery.Close;
 GetSystemNameQuery.Params.ParamValues['ID_SYSTEM'] := UpdateSystem;
 GetSystemNameQuery.Open;

 StatusBar.Panels[0].Text :=' БД: '+DM.DBPath;
 StatusBar.Panels[1].Text :=' Последнее системное обновление: №'+ GetSystemNameQueryLAST_UPDATE.AsString;
 GetSystemNameQuery.Close;
end;

procedure TMainForm.AcceptUpdateButtonClick(Sender: TObject);
var
  ReportFile  : String;
  Hndl: THandle;
  ESP: TExecuteScriptProc;
begin
 if UpdateVersion = -1 then begin
  ShowMessage('Сперва необходимо открыть обновление!');
  OpenUpdateButton.Click;
  Exit;
 end;

 if not FileExists(Dm.ProgramPath + 'ibescript.dll') then begin
  PlaySound(PChar('SYSTEMHAND'), 0, SND_ASYNC);
  ShowMessage('Не найден файл "ibescript.dll"!');
  Exit;
 end;

  if UpdateVersion - 1 <> GetSystemNameQueryLAST_UPDATE.Value then begin
   PlaySound(PChar('SYSTEMHAND'), 0, SND_ASYNC);
   MessageDlg('Для системы "' +SystemNameLabel.Caption +
               '" установлено обновление №' +
               GetSystemNameQueryLAST_UPDATE.AsString + '. ' +
               'Можно применить только обновление №' +
               IntToStr(GetSystemNameQueryLAST_UPDATE.value + 1) + '!', mtError, [mbOk], 0);
   Exit;
  end;

 EnableButtons(False);
 WorkSQL.SQL.SaveToFile(Dm.ProgramPath + 'script');
 ReportFile := Dm.ProgramPath + SystemNameLabel.Caption + '_' + UpdateVersionLabel.Caption + '_' +  UpdateDateLabel.Caption + '.log';

 // использование ibescript.exe - фигрня! ibescript.dll рулит!!!

  FinalizeAdminSystem;             //отключаемся для внешнего ключа
  DM.MainDatabase.Close;
  Sleep(5000);

  ErrCount := 0;
  StmtCount := 0;
  ProgresBar.Position:=0;
  ProgresBar.Visible := TotalStmts > 4;
  LogEdit.Lines.Clear;
  AbortBtn.Enabled:=False;
  AbortBtn.Visible:=True;

  Hndl := LoadLibrary(PChar(Dm.ProgramPath+'IBEScript.dll'));
  try
    if (Hndl > HINSTANCE_ERROR) then
    begin
      ESP := GetProcAddress(Hndl, 'ExecScriptFile');
      if @ESP <> nil then
      begin
        ESP(PChar(Dm.ProgramPath + 'script'), @HandleError, @BeforeExec, @AfterExec);
      end;
    end;
  finally
    if Hndl > HINSTANCE_ERROR then
      FreeLibrary(Hndl);
  end;

  ProgresBar.Position:=100;

  LogEdit.Lines.Add('');
  LogEdit.Lines.Add('Statment count: '+IntToStr(StmtCount));
  LogEdit.Lines.Add('Error count: '+IntToStr(ErrCount));
  LogEdit.Lines.Add('########################');
  If ErrCount=0
    then LogEdit.Lines.Add('#  Script executed successfully!  #')
    else LogEdit.Lines.Add('#  Script executed with errors!! #');
  LogEdit.Lines.Add('########################');
  if abort_update then LogEdit.Lines.Add('Terminated by user!!!!');
  LogEdit.Lines.SaveToFile(ReportFile);

  DM.MainDatabase.Open; //возвращаемся в "активные пользователи"
  InitializaAdminSystem(Application.MainForm, TISC_DB_Handle(DM.MainDatabase.Handle), 555, -1, False);

  WorkQuery.Close;
  if DM.WriteTransaction.Active then
    DM.WriteTransaction.Rollback;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.Params.ParamValues['ACCEPT_LOG'] := LogEdit.Lines.Text;
  WorkQuery.Params.ParamValues['Id_System'] := UpdateSystem;
  WorkQuery.Params.ParamValues['Version_Number'] := UpdateVersion;
  WorkQuery.ExecSQL;
  WorkQuery.Transaction.Commit;

  UpdateVersion              := -1;
  SystemNameLabel.Caption    := '---';
  LastUpdateLabel.Caption    := '---';
  UpdateVersionLabel.Caption := '---';
  UpdateDateLabel.Caption    := '---';
  StatusBar.Panels[2].Text:='';

  if not Dm.DontKillLog then DeleteFile(Dm.ProgramPath + 'script');

  PlaySound(PChar('SYSTEMASTERISK'), 0, SND_ASYNC);

  if ErrCount = 0 then
  ShowMessage('Файл обновления был применен без ошибок! Ошибки не были обнаружены. Отчет о выполнении сохранен в файле "' + ReportFile + '".'+
              #13+'Теперь необходимо обновить исполняемые файлы, отчеты и прочее.')
  else
  ShowMessage('Файл обновления был применен с ошибками, обязательно передайте разработчикам отчет о выполнении, который сохранен в файле "' + ReportFile + '".'+
              #13+'Теперь необходимо откатить базу из резервной копии!!.');
  ProgresBar.Visible:=False;
  AbortBtn.Enabled:=False;
  AbortBtn.Visible:=False;

  EnableButtons(True);
end;

procedure TMainForm.TabSheet2Show(Sender: TObject);
begin
 SystemsQuery.Close;
 SystemsQuery.Open;
end;

procedure TMainForm.SaveOptionsButtonClick(Sender: TObject);
var
 IniFile : TIniFile;
begin
 IniFile := TIniFile.Create(DM.ProgramPath + 'update.ini');

 IniFile.WriteString('Database', 'Path', ConnectionEdit.Text);

 IniFile.Free;

 ShowMessage('Чтобы изменения вступили в действие необходимо перезапустить программу!');
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
	if SaveDialog.Execute then begin
  if (FileSearch(SaveDialog.FileName,'') <> '')
  and (MessageDlg('Файл уже существует. Перезаписать?', mtConfirmation, [mbYes, mbNo],0) = mrNo) then
   Exit
  else
   HistoryQueryACCEPT_LOG.SaveToFile(SaveDialog.FileName);
 end;
end;

procedure TMainForm.SysAdminButtonClick(Sender: TObject);
begin
 AdminShowUsers(Self);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 FinalizeAdminSystem;
end;

procedure TMainForm.EnableButtons(Enabled : boolean);
begin
 OpenUpdateButton.Enabled   := Enabled;
 AcceptUpdateButton.Enabled := Enabled;
end;

procedure TMainForm.AbortBtnClick(Sender: TObject);
begin
  if ErrCount > 0 then abort_update:=True;
end;

end.
