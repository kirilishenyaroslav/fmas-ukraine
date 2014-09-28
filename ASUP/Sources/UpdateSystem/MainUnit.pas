unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, consts, IBSQL, ShellApi, IniFiles,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, SysAdmin, Buttons;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    MainPageControl: TPageControl;
    AcceptPage: TTabSheet;
    SettingsPage: TTabSheet;
    GroupBox1: TGroupBox;
    OpenUpdateButton: TButton;
    AcceptUpdateButton: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    HistoryQuery: TIBQuery;
    HistoryDataSource: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SystemNameLabel: TLabel;
    UpdateVersionLabel: TLabel;
    UpdateDateLabel: TLabel;
    OpenDialog: TOpenDialog;
    WorkSQL: TIBSQL;
    GetSystemNameQuery: TIBQuery;
    GetSystemNameQueryNAME_SYSTEM: TIBStringField;
    GetSystemNameQueryE_MAIL: TIBStringField;
    WorkQuery: TIBQuery;
    GetSystemNameQueryLAST_UPDATE: TIntegerField;
    Label4: TLabel;
    LastUpdateLabel: TLabel;
    LogEdit: TRichEdit;
    Label5: TLabel;
    SystemsQuery: TIBQuery;
    SystemsDataSource: TDataSource;
    SystemsQueryID_SYSTEM: TIntegerField;
    SystemsQueryNAME_SYSTEM: TIBStringField;
    SystemsQueryE_MAIL: TIBStringField;
    Label6: TLabel;
    ConnectionEdit: TEdit;
    SaveOptionsButton: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    HistoryQueryID_SYSTEM: TIntegerField;
    HistoryQueryVERSION_NUMBER: TIntegerField;
    HistoryQueryVERSION_DATE: TDateField;
    HistoryQueryACCEPT_DATETIME: TDateTimeField;
    HistoryQuerySYSTEM_NAME: TIBStringField;
    HistoryQuerySERVER_NAME: TIBStringField;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    SaveDialog: TSaveDialog;
    HistoryQueryACCEPT_LOG: TBlobField;
    SysAdminButton: TBitBtn;
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
  private
    { Private declarations }
  public
    UpdateVersion : Integer;
    UpdateSystem : Integer;
    UpdateDate : TDate;
    UpdateFileName : String;
  end;

var
  MainForm: TMainForm;

implementation

uses DMUnit, ProcessUnit;

{$R *.dfm}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if MessageDlg('Выйти из программы?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
    then begin
        Action := caNone;
        exit;
    end;
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
    Signature : String;
    InF, OutF : File;
    i, len : Integer;
    ProcessForm : TProcessForm;
    Buf : array of byte;
begin
    OpenDialog.InitialDir := Dm.ProgramPath;

    if OpenDialog.Execute then begin

    UpdateFileName := OpenDialog.FileName;

// Decoding input file

    AssignFile(InF, OpenDialog.FileName);
    Reset(InF, 1);
    len := FileSize(inF);
    SetLength(buf, len);

    for i := 0 to len -1 do begin
    	BlockRead(inF, Buf[i], 1);
    end;

    CloseFile(inF);

    ProcessForm :=TProcessForm.Create(Self);
    ProcessForm.Progress.Max := len;
    ProcessForm.Caption := 'Идет декодирование исходного файла...';
    ProcessForm.Show;

    for i := 0 to len - 1 do begin
    	Buf[i] := Buf[i] xor 147;

        if i mod 100 = 0 then begin
        	ProcessForm.Progress.Position := i;
        	ProcessForm.Step;
        	if ProcessForm.Stop then begin
    			ProcessForm.Hide;
		    	Screen.Cursor := crDefault;
            	exit;
        	end;
        end;

    end;

    AssignFile(OutF, Dm.ProgramPath + 'decoded');
    Rewrite(OutF, 1);

    for i := 0 to len -1 do begin
    	BlockWrite(OutF, Buf[i], 1);
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
            	MessageDlg('Выбранный файл не является файлом обновления БД!', mtError, [mbOk], 0);
                WorkSQL.Close;
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
					MessageDlg('В вашей БД не удалось обнаружить систему, для которой предназначено выбранное обновление!', mtError, [mbOk], 0);
            	exit;
            end;

            SystemNameLabel.Caption := GetSystemNameQueryNAME_SYSTEM.Value;
            LastUpdateLabel.Caption := GetSystemNameQueryLAST_UPDATE.AsString;
            UpdateVersionLabel.Caption := IntToStr(UpdateVersion);
            UpdateDateLabel.Caption := DateToStr(UpdateDate);

            WorkSQL.SQL[0] := 'SET SQL DIALECT 3; SET NAMES WIN1251; ' + ' CONNECT ' + QuotedStr(DM.DBPath) + ' USER ' + QuotedStr(DM.CurrentLogin) + ' password ' + QuotedStr(DM.CurrentPassword) + ';';
            WorkSQL.SQL.Add('EXECUTE PROCEDURE SYS_VERSION_HISTORY_INSERT(' + IntToStr(UpdateSystem) + ',' + IntToStr(UpdateVersion) + ',' + QuotedStr(DateToStr(UpdateDate)) + ',' + QuotedStr('NOW') + '); Commit Work;');
            
        except on e : Exception
            do begin
                MessageDlg('Возникла ошибка: ' + E.Message, mtError, [mbOk], 0);
                UpdateVersion := -1;
            end
        end;
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    HistoryQuery.Transaction := DM.ReadTransaction;
    GetSystemNameQuery.Transaction := DM.ReadTransaction;
    SystemsQuery.Transaction := DM.ReadTransaction;
    WorkSQL.Transaction := DM.WriteTransaction;
    WorkQuery.Transaction := DM.WriteTransaction;
    UpdateVersion := -1;

    ConnectionEdit.Text := DM.DBPath;
end;

procedure TMainForm.AcceptUpdateButtonClick(Sender: TObject);
var
    ReportFile : String;
	Rlst: LongBool;
	StartUpInfo: TStartUpInfo;
	ProcessInfo: TProcessInformation;
	//Error: integer;
	ExitCode: Cardinal;
begin
    if UpdateVersion = -1 then begin
        MessageDlg('Сперва необходимо открыть обновление!', mtError, [mbOk], 0);
        exit;
    end;

    if not FileExists(Dm.ProgramPath + 'ibescript.exe') then begin
        MessageDlg('Не найден файл "ibescript.exe"!', mtError, [mbOk], 0);
        exit;
    end;    

	 if UpdateVersion - 1 <> GetSystemNameQueryLAST_UPDATE.Value then begin
    	  MessageDlg('Для системы "' +SystemNameLabel.Caption +
                   '" установлено обновление №' +
                   GetSystemNameQueryLAST_UPDATE.AsString + '. ' +
                   'Можно применить только обновление №' +
                   IntToStr(GetSystemNameQueryLAST_UPDATE.value + 1) + '!', mtError, [mbOk], 0);
    	  exit;
    end;

	WorkSQL.SQL.SaveToFile(Dm.ProgramPath + 'script');

    ReportFile := Dm.ProgramPath + SystemNameLabel.Caption + '_' + UpdateVersionLabel.Caption + '_' +  UpdateDateLabel.Caption + '.log';

	FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);

	with StartUpInfo do
	begin
    	cb := SizeOf(TStartUpInfo);
    	dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    	wShowWindow := SW_SHOWNORMAL;
  	end;

	Rlst := CreateProcess(PAnsiChar(Dm.ProgramPath + 'ibescript.exe'), PAnsiChar(' "' + Dm.ProgramPath + 'script" ' + ' "' + Dm.ProgramPath + 'script"' + ' -N -S -E -V"' + ReportFile + '"') , nil, nil, false, NORMAL_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);

	if Rlst then
	with ProcessInfo do begin
    	WaitForInputIdle(hProcess, INFINITE); // ждем завершения инициализации
    	WaitforSingleObject(ProcessInfo.hProcess, INFINITE); // ждем завершения процесса
    	GetExitCodeProcess(ProcessInfo.hProcess, ExitCode); // получаем код завершения
    	CloseHandle(hThread); // закрываем дескриптор процесса
    	CloseHandle(hProcess); // закрываем дескриптор потока
  	end;
	//else
    //	Error := GetLastError;

    LogEdit.Lines.LoadFromFile(ReportFile);
    
    WorkQuery.Close;

    if DM.WriteTransaction.Active then
    	DM.WriteTransaction.Rollback;

    WorkQuery.Transaction.StartTransaction;

    WorkQuery.Params.ParamValues['ACCEPT_LOG'] := LogEdit.Lines.Text;
    WorkQuery.Params.ParamValues['Id_System'] := UpdateSystem;
    WorkQuery.Params.ParamValues['Version_Number'] := UpdateVersion;
    WorkQuery.ExecSQL;

    WorkQuery.Transaction.Commit;

    UpdateVersion:= -1;
    SystemNameLabel.Caption := '---';
    LastUpdateLabel.Caption := '---';
    UpdateVersionLabel.Caption := '---';
    UpdateDateLabel.Caption := '---';

    if not Dm.DontKillLog then
        DeleteFile(Dm.ProgramPath + 'script');

    if Pos('Script executed successfully', LogEdit.Text) <> 0 then
	    MessageDlg('Файл обновления был применен без ошибок! Ошибки не были обнаружены. Отчет о выполнении сохранен в файле "' + ReportFile + '". Теперь необходимо обновить исполняемые файлы, отчеты и прочее.', mtInformation, [mbOk], 0)
    else
		MessageDlg('Файл обновления был применен с ошибками, обязательно передайте разработчикам отчет о выполнении, который сохранен в файле "' + ReportFile + '". Теперь необходимо обновить исполняемые файлы, отчеты и прочее.', mtError, [mbOk], 0);
        
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

    MessageDlg('Чтобы изменения вступили в действие необходимо перезапустить программу!', mtInformation, [mbOk], 0);
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
	if SaveDialog.Execute then begin
    	if (FileSearch(SaveDialog.FileName,'') <> '') and (MessageDlg('Файл уже существует. Перезаписать?', mtConfirmation, [mbYes, mbNo],0) = mrNo)
        then
        	exit
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

end.
