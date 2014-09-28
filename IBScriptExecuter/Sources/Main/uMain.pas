unit uMain;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uMain                                                                      *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Поиск и выполнение скриптов. Отображение результатов тестирования.         *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Menus, IniFiles,  uTypes, FileUtil, ShellApi;

type

  TfmMain = class(TForm)

	stbMain            : TStatusBar;

	mnuMain            : TMainMenu;

	lvwOutput          : TListView;

	OpenDialog         : TOpenDialog;

	mnuTest            : TMenuItem;
	mnuExit            : TMenuItem;
	mnuStart           : TMenuItem;
	mnuOptions         : TMenuItem;
	mnuCreateTestList  : TMenuItem;

	procedure mnuExitClick           (Sender: TObject);
	procedure mnuStartClick          (Sender: TObject);
	procedure mnuOptionsClick        (Sender: TObject);
	procedure mnuCreateTestListClick (Sender: TObject);

	procedure FormActivate           (Sender: TObject);
	procedure FormShortCut           (var Msg: TWMKey; var Handled: Boolean);

  private

	  FAppMode  : TAppMode;
	  FFileName : TFileName;

	  function  GetAppMode : TAppMode;
	  function  GetFileName: TFileName;

	  procedure SetAppMode ( aValue: TAppMode  );
	  procedure SetFileName( aValue: TFileName );

  public
	  Params: TStringList;
	  Property AppMode  : TAppMode  read GetAppMode  write SetAppMode;
	  Property FileName : TFileName read GetFileName write SetFileName;
  end;

var
  fmMain: TfmMain;

implementation

uses uUtils, DateUtils;

{$R *.dfm}

function TfmMain.GetAppMode: TAppMode;
begin
  Result := FAppMode;
end;

function TfmMain.GetFileName: TFileName;
begin
  Result := FFileName;
end;

procedure TfmMain.SetAppMode(aValue: TAppMode);
begin
  FAppMode := aValue;
end;

procedure TfmMain.SetFileName(aValue: TFileName);
begin
  FFileName := aValue;
end;

//Выходим из приложения
procedure TfmMain.mnuExitClick(Sender: TObject);
var
	MsgRes : TModalResult;
begin
	MsgRes := MessageDlg( cQUIT_QUESTION, mtConfirmation, [mbYes, mbNo], 0  );

	if MsgRes = mrYes
	then
		Close;
end;

Function WinCopyFile(FromFile, ToDir : string) : boolean;
var F : TShFileOpStruct;
begin
//showmessage(FromFile+'|'+ToDir);
  F.Wnd := 0; F.wFunc := FO_COPY;
  FromFile:=FromFile+#0; F.pFrom:=pchar(FromFile);
  ToDir:=ToDir+#0; F.pTo:=pchar(ToDir);
  F.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  result:=ShFileOperation(F) = 0;
end;



//Обрабатываем горячие клавищи
procedure TfmMain.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin

	case Msg.CharCode of

	  VK_ESCAPE : begin
					mnuExit.Click;
				  end;

	  VK_F9     : begin
					mnuStart.Click;
				  end;

	  VK_F2     : begin
					mnuCreateTestList.Click;
				  end;

	  115      : begin
					Close;
				  end;
	end;

	Handled := True;

end;

//Пытаемся использовать для тестирования настройки из ini-файла
procedure TfmMain.FormActivate(Sender: TObject);
var
	MsgRes : TModalResult;
begin

  try
	FileName := ExtractFilePath( Application.ExeName ) + cINI_FILE_NAME;

	//Прячем приложение
	if AppMode = amCmd
	then begin
	  ShowWindow( Handle, SW_HIDE );
	  ShowWindow( Application.Handle, SW_HIDE );
	end;

	//Проверяем: существует ли файл настроек?
	if not( FileExists( FileName ) )
	then begin
		MsgRes := MessageDlg( cINI_FILE_NOT_FOUND, mtError, [mbYes, mbNo], 0 );

		//Указываем путь к ini-файлу вручную
		if MsgRes = mrYes
		then begin

			if OpenDialog.Execute
			then begin

				FileName := OpenDialog.FileName;
				mnuStart.Enabled := True;

				if AppMode in [amCmd, amWin]
				then
				  mnuStart.Click;
			end
			else begin
				MessageDlg( cAPP_EXIT, mtWarning, [mbOK], 0 );

				if AppMode = amCmd
				then
					Close;
			end;

		end
		else begin
			MessageDlg( cAPP_EXIT, mtWarning, [mbOK], 0 );

			if AppMode = amCmd
			then
				Close;
		end;

	end
	else begin

		mnuStart.Enabled := True;

		if AppMode in [amCmd, amWin]
		then
		  mnuStart.Click;
	end;

  except
	  LogException( ExtractFilePath( Application.ExeName ) + cERROR_FILE_NAME );
  end;

end;

//Копируем на локальную станцию все необходимые файлы для тестирования,
//тестируем скрипты, переименовываем их + применяем к удалённым версиям БД
procedure TfmMain.mnuStartClick(Sender: TObject);
const
	HighBound = 99;
var                   
	i, j, n          : Integer;
	Index            : Integer;
	Result           : Boolean;
	IsValid          : Boolean;
	IniFile          : TIniFile;
	StrList          : TStringList;
	FileRec          : TSearchRec;
	TmpPath          : String;
	CurIndex         : Integer;
	CurrItem         : TListItem;
	DBParams         : TStringList;
	ScrStatus        : TScriptStatus;
	DBResult         : TAppResult;
	AppResult        : Boolean;
	DateBackUp       : TDate;
	CurrResult       : Boolean;
	FullRename       : Boolean;
	TestParams       : TStringList;
	ScrOnlyExec      : TStringList;
	IsValidExec      : Boolean;
	DBResultMsg      : String;
	ErrFileName      : TFileName;
	AllSecNames      : TStringList;
	FmtSettings      : TFormatSettings;
	AllExecScrOK     : Boolean;
    ExecSysScrMsg    : String;
	ErrScriptChar    : String;
	ScrTestAndExec   : TStringList;
	TmpErrFileName   : TFileName;
	UselessSecNames  : TStringList;
    ExecSysScrResult : Boolean;

begin

  try

	try

	  try
		lvwOutput.Clear;
		lvwOutput.Color := clWhite;

		if FileExists( FileName )
		then begin
			IniFile := TIniFile.Create( FileName );
			AllSecNames := TStringList.Create;
			UselessSecNames := TStringList.Create;

			//Получаем имена ВСЕХ секций ini-файла
			IniFile.ReadSections( AllSecNames );
			//Получаем имена только служебных секций ini-файла
			IniFile.ReadSectionValues( cUSELESS_SECTION, UselessSecNames );

			//Формируем список названий значащих секций
			n := UselessSecNames.Count - 1;

			for i := 0 to n
			do begin
				Index := AllSecNames.IndexOf( UselessSecNames.ValueFromIndex[i] );
				AllSecNames.Delete( Index );
			end;

			//Получаем параметры тестирования для локальной станции
			TestParams := TStringList.Create;

			with TestParams
			do begin
			  BeginUpdate;
				Values[cUSER                     ] := IniFile.ReadString( cTEST_PARAMS, cUSER,                      cDEF_USER                      );
				Values[cSERVER                   ] := IniFile.ReadString( cTEST_PARAMS, cSERVER,                    cDEF_SERVER                    );
				Values[cPASSWORD                 ] := IniFile.ReadString( cTEST_PARAMS, cPASSWORD,                  cDEF_PASSWORD                  );
				Values[cERROR_LOG_DIR            ] := IniFile.ReadString( cTEST_PARAMS, cERROR_LOG_DIR,             cDEF_ERROR_LOG_DIR             );
				Values[cSEPARATOR_CHAR           ] := IniFile.ReadString( cTEST_PARAMS, cSEPARATOR_CHAR,            cDEF_SEPARATOR_CHAR            );
				Values[cERROR_SCRIPT_CHAR        ] := IniFile.ReadString( cTEST_PARAMS, cERROR_SCRIPT_CHAR,         cDEF_ERROR_SCRIPT_CHAR         );
				Values[cPREFIX_CHAR_COUNT        ] := IniFile.ReadString( cTEST_PARAMS, cPREFIX_CHAR_COUNT,         cDEF_PREFIX_CHAR_COUNT         );
				Values[cARCHIVATOR_PATH          ] := IniFile.ReadString( cTEST_PARAMS, cARCHIVATOR_PATH,           cDEF_ARCHIVATOR_PATH           );
				Values[cIBESCRIPT_PATH           ] := IniFile.ReadString( cTEST_PARAMS, cIBESCRIPT_PATH,            cDEF_IBESCRIPT_PATH            );
				Values[cDB_ARCHIVE_FILE_NAME_PART] := IniFile.ReadString( cTEST_PARAMS, cDB_ARCHIVE_FILE_NAME_PART, cDEF_DB_ARCHIVE_FILE_NAME_PART );
				Values[cDB_PATH_COPY_TO          ] := IniFile.ReadString( cTEST_PARAMS, cDB_PATH_COPY_TO,           cDEF_DB_PATH_COPY_TO           );
				Values[cSCRIPTS_PATH_COPY_FROM   ] := IniFile.ReadString( cTEST_PARAMS, cSCRIPTS_PATH_COPY_FROM,    cDEF_SCRIPTS_PATH_COPY_FROM    );
			  EndUpdate;
			end;

			//Корректируем пути для локальной станции с учётом завершающего слеша
			TmpPath := TestParams.Values[cERROR_LOG_DIR];
			SetDirEndDelimiter( TmpPath );
			TestParams.Values[cERROR_LOG_DIR] := TmpPath;

			TmpPath := TestParams.Values[cDB_PATH_COPY_TO];
			SetDirEndDelimiter( TmpPath );
			TestParams.Values[cDB_PATH_COPY_TO] := TmpPath;

			TmpPath := TestParams.Values[cSCRIPTS_PATH_COPY_FROM];
			SetDirEndDelimiter( TmpPath );
			TestParams.Values[cSCRIPTS_PATH_COPY_FROM] := TmpPath;

			ScrOnlyExec    := TStringList.Create;
			ScrTestAndExec := TStringList.Create;
			DbParams := TStringList.Create;

			//Выполняем тестирование скриптов
			DBResult  := arNone;
			AppResult := True;
			n := AllSecNames.Count - 1;
			ErrScriptChar := TestParams.Values[cERROR_SCRIPT_CHAR];

			for i := 0 to n
			do begin
				//Получаем параметры тестирования для конкретного файла БД
				with DBParams
				do begin
				  BeginUpdate;
					Values[cUSER                ] := IniFile.ReadString( AllSecNames.Strings[i], cUSER,                 ''                        );
					Values[cPATH                ] := IniFile.ReadString( AllSecNames.Strings[i], cPATH,                 ''                        );
					Values[cSERVER              ] := IniFile.ReadString( AllSecNames.Strings[i], cSERVER,               ''                        );
					Values[cRENAME              ] := IniFile.ReadString( AllSecNames.Strings[i], cRENAME,               cDEF_RENAME               );
					Values[cEXECUTE             ] := IniFile.ReadString( AllSecNames.Strings[i], cEXECUTE,              cDEF_EXECUTE              );
					Values[cPASSWORD            ] := IniFile.ReadString( AllSecNames.Strings[i], cPASSWORD,             ''                        );
					Values[cKEY_EXPR            ] := IniFile.ReadString( AllSecNames.Strings[i], cKEY_EXPR,             ''                        );
					Values[cFULL_RENAME         ] := IniFile.ReadString( AllSecNames.Strings[i], cFULL_RENAME,          cDEF_FULL_RENAME          );
					Values[cSYSTEM_SCRIPT       ] := IniFile.ReadString( AllSecNames.Strings[i], cSYSTEM_SCRIPT,        ''                        );
					Values[cDB_PATH_BACKUP      ] := IniFile.ReadString( AllSecNames.Strings[i], cDB_PATH_BACKUP,       ''                        );
					Values[cDEFAULT_DB_FILE_NAME] := IniFile.ReadString( AllSecNames.Strings[i], cDEFAULT_DB_FILE_NAME, cDEF_DEFAULT_DB_FILE_NAME );
				  EndUpdate;
				end;

				//Получаем полный путь к архиву файла БД с учётом завершающего слеша
				TmpPath := DBParams.Values[cDB_PATH_BACKUP];
				SetDirEndDelimiter( TmpPath );
				DBParams.Values[cDB_PATH_BACKUP] := TmpPath;

				//Получаем полный путь к каталогу, содержащему самый "свежий" архив файла БД
				j := 0;
				FmtSettings.DateSeparator   := cDATE_SEPARATOR;
				FmtSettings.ShortDateFormat := cFORMAT_DATE_TO_STR;

				repeat
					DateBackUp := Now - j;
					Inc(j);
					TmpPath := DBParams.Values[cDB_PATH_BACKUP] + DateToStr( DateBackUp, FmtSettings ) + cSEPARATOR_FOLDER_WIN;
					TmpPath := TmpPath + '*' + TestParams.Values[cDB_ARCHIVE_FILE_NAME_PART] + '*.*';
				until ( FileExists( TmpPath ) OR ( j > HighBound ) );

				//Проверяем существованиe скриптов и актуального архива файла БД
				if not( FileExists( TestParams.Values[cSCRIPTS_PATH_COPY_FROM] + cSCRIPTS_MASK ) )
				   OR ( not FileExists( TmpPath ) AND ( j > HighBound ) )
				then begin

					if AppMode = amWin
					then
						MessageDlg( cDB_FILE_NOT_FOUND1 + #13#10 + cDB_FILE_NOT_FOUND2, mtError, [mbOK], 0 );

					Continue;
				end
				else begin
					try
						FindFirst( TmpPath, faAnyFile, FileRec );
						DBParams.Values[cDB_PATH_BACKUP] := ExtractFilePath( TmpPath ) + FileRec.Name;
					finally
						FindClose( FileRec );
					end;
				end;

				//Получаем путь к актуальной копии файла БД
				TmpPath := TestParams.Values[cDB_PATH_COPY_TO] + DBParams.Values[cDEFAULT_DB_FILE_NAME];

				if not( FileExists( TmpPath ) )
				then begin
					//Копируем архив файла БД на локальную станцию
					TmpPath := TestParams.Values[cDB_PATH_COPY_TO] + ExtractFileName( DBParams.Values[cDB_PATH_BACKUP] );

					if not( FileExists( TmpPath ) )
					then begin
						stbMain.SimpleText := cCOPYING_FILES;
						 WinCopyFile( DBParams.Values[cDB_PATH_BACKUP], PChar(TmpPath));
						stbMain.SimpleText := cSPACE;
					end;

					//Раскручиваем файл архива c помощью WinRar.exe
					Cursor := crHourGlass;
					stbMain.SimpleText := cEXTRACTING_FILES;

					CreateMyProcess( PAnsiChar( TestParams.Values[cARCHIVATOR_PATH] ), PAnsiChar( cCOMMAND_LINE_ARCHIVATOR + TmpPath + ' ' + TestParams.Values[cDB_PATH_COPY_TO] ), SW_HIDE );

					TmpPath := ExtractFileName( DBParams.Values[cDB_PATH_BACKUP] );
					Delete( TmpPath, Pos( ExtractFileExt( TmpPath ), TmpPath ), Length( ExtractFileExt( TmpPath ) ) );
					DBParams.Values[cDEFAULT_DB_FILE_NAME] := TmpPath + cSEPARATOR_FOLDER_WIN + DBParams.Values[cDEFAULT_DB_FILE_NAME];

					stbMain.SimpleText := cSPACE;
					Cursor := crDefault;
				end;

				//Получаем список имён файлов скриптов, подлежащих только тестированию
				GetScriptNamesExt ( TestParams.Values[cSCRIPTS_PATH_COPY_FROM], TestParams.Values[cSEPARATOR_CHAR], DBParams.Values[cKEY_EXPR], StrToInt( TestParams.Values[cPREFIX_CHAR_COUNT] ), DateBackUp, ScrOnlyExec );
				//Получаем список имён файлов скриптов, подлежащих тестированию и применению
				GetScriptNames ( TestParams.Values[cSCRIPTS_PATH_COPY_FROM], TestParams.Values[cSEPARATOR_CHAR], DBParams.Values[cKEY_EXPR], StrToInt( TestParams.Values[cPREFIX_CHAR_COUNT] ), ScrTestAndExec );

				//Проверяем: существует ли каталог для хранения файлов-отчётов ошибок выполнения скриптов?
				if not DirExists( TestParams.Values[cERROR_LOG_DIR] )
				then
				  ForceDirectories( TestParams.Values[cERROR_LOG_DIR] );

				try
				  //Инициализируем переменные
				  AllExecScrOK := True;
				  Cursor := crHourGlass;
				  DBResult := arPrepareSuccess;
				  StrList := TStringList.Create;
				  stbMain.SimpleText := cEXECUTING_SCRIPTS;
				  n := ScrOnlyExec.Count - 1;

				  //Только применяем скрипты
				  for j := 0 to n
				  do begin
					  //Отбрасываем расширение в имени файла скрипта
					  ErrFileName := ExtractFileName( ScrOnlyExec.Strings[j] );
					  CurIndex := Pos( ExtractFileExt( ErrFileName ), ErrFileName );
					  Delete( ErrFileName, CurIndex, Length( ExtractFileExt( ErrFileName ) ) );
					  TmpErrFileName := ErrFileName + '.log';
					  //Получаем уникальное имя файла-отчёта ошибок применения данного скрипта
					  ErrFileName := ErrScriptChar + DBParams.Values[cKEY_EXPR] + ErrScriptChar + cTEST_EXPR + ErrScriptChar + TmpErrFileName;
					  ErrFileName := TestParams.Values[cERROR_LOG_DIR] + ErrFileName;

					  //Применяем скрипт с помощью утилиты IBEScript.exe к локальной БД
					  CreateMyProcess( PAnsiChar( TestParams.Values[cIBESCRIPT_PATH] ), PAnsiChar( cSCRIPT_EXECUTER_NAME + '"' + TestParams.Values[cSCRIPTS_PATH_COPY_FROM] + ScrOnlyExec.Strings[j] + '"'  + cCOMMAND_LINE_SCRIPT_EXEC + '"' + ErrFileName + '"' + ' -D' + TestParams.Values[cSERVER] + ':' + '"' + TestParams.Values[cDB_PATH_COPY_TO] + DBParams.Values[cDEFAULT_DB_FILE_NAME] + '"' + ' -P' + TestParams.Values[cPASSWORD] + ' -U' + TestParams.Values[cUSER] + ' -C' + cCHAR_SET ), SW_HIDE );

					  StrList.LoadFromFile( ErrFileName );

					  //Анализируем результат применения скрипта
					  if Pos( cSUCCESS_EXEC_RESULT, StrList.Text ) = 0
					  then begin
						  DBResult     := arPrepareError;
						  AppResult    := False;
						  AllExecScrOK := False;
						  Break;
					  end
					  else begin
						//Удаляем лог-файл для успешно примененённого скрипта
						DeleteFile( ErrFileName );
					  end;

					  StrList.Clear;
				  end;

				  //Переходим к тестированию и применению скриптов
				  if AllExecScrOK
				  then begin
					  //Инициализируем переменные
					  Index := 0;
					  Result := True;
					  StrList.Clear;
					  DBResultMsg := '';
					  FullRename := StrToBool( DBParams.Values[cFULL_RENAME] );
					  n := ScrTestAndExec.Count - 1;

					  //Выводим на экран строку, расшифровывающую куда применяются скрипты
					  if n >= 0
					  then begin
						  DBResult := arTestSuccess;

						  with lvwOutput
						  do begin
							Items.BeginUpdate;
							  Items.Add;
							  CurrItem := Items.Add;
							  CurrItem.SubItems.Add( cDESCRIPTION_STR + DBParams.Values[cPATH] + ' ''' );
							  Items.Add;
							Items.EndUpdate;
						  end;

					  end
					  else begin
						  DBResult := arScrNotFound;
					  end;

					  //Тестируем и применяем скрипты
					  for j := 0 to n
					  do begin
						  //Отбрасываем расширение в имени файла скрипта
						  ErrFileName := ExtractFileName( ScrTestAndExec.Strings[j] );
						  CurIndex := Pos( ExtractFileExt( ErrFileName ), ErrFileName );
						  Delete( ErrFileName, CurIndex, Length( ExtractFileExt( ErrFileName ) ) );
						  TmpErrFileName := ErrFileName + '.log';
						  //Получаем уникальное имя файла-отчёта ошибок тестирования данного скрипта
						  ErrFileName := ErrScriptChar + DBParams.Values[cKEY_EXPR] + ErrScriptChar + cTEST_EXPR + ErrScriptChar + TmpErrFileName;
						  ErrFileName := TestParams.Values[cERROR_LOG_DIR] + ErrFileName;

						  //Тестируем скрипт с помощью утилиты IBEScript.exe на локальной БД
						  CreateMyProcess( PAnsiChar( TestParams.Values[cIBESCRIPT_PATH] ), PAnsiChar( cSCRIPT_EXECUTER_NAME + '"' + TestParams.Values[cSCRIPTS_PATH_COPY_FROM] + ScrTestAndExec.Strings[j] + '"'  + cCOMMAND_LINE_SCRIPT_EXEC + '"' + ErrFileName + '"' + ' -D' + TestParams.Values[cSERVER] + ':' + '"' + TestParams.Values[cDB_PATH_COPY_TO] + DBParams.Values[cDEFAULT_DB_FILE_NAME] + '"' + ' -P' + TestParams.Values[cPASSWORD] + ' -U' + TestParams.Values[cUSER] + ' -C' + cCHAR_SET ), SW_HIDE );

						  StrList.LoadFromFile( ErrFileName );

						  //Анализируем результат тестирования скрипта
						  if Pos( cSUCCESS_EXEC_RESULT, StrList.Text ) = 0
						  then begin
							Result     := False;
							DBResult   := arTestError;
							AppResult  := False;
							CurrResult := False;
							ScrStatus  := scsTestErr;
						  end
						  else begin
							//Удаляем лог-файл для успешно протестированного скрипта
							DeleteFile( ErrFileName );
							CurrResult := True;
							ScrStatus  := scsTestSucc;
						  end;

						  StrList.Clear;

						  TmpPath := TestParams.Values[cSCRIPTS_PATH_COPY_FROM] + ScrTestAndExec.Strings[j];

						  //Выполняем скрипт
						  if  AllExecScrOK AND StrToBool( DBParams.Values[cEXECUTE] )
						  then begin

							  if Result
							  then begin
								  //Получаем уникальное имя файла-отчёта ошибок применения данного скрипта
								  ErrFileName := ErrScriptChar + DBParams.Values[cKEY_EXPR] + ErrScriptChar + cEXECUTE_EXPR + ErrScriptChar + TmpErrFileName;
								  ErrFileName := TestParams.Values[cERROR_LOG_DIR] + ErrFileName;
								  //Применяем скрипт
								  CreateMyProcess( PAnsiChar( TestParams.Values[cIBESCRIPT_PATH] ), PAnsiChar( cSCRIPT_EXECUTER_NAME + '"' + TestParams.Values[cSCRIPTS_PATH_COPY_FROM] + ScrTestAndExec.Strings[j] + '"'  + cCOMMAND_LINE_SCRIPT_EXEC + '"' + ErrFileName + '"' + ' -D' + DBParams.Values[cSERVER] + ':' + '"' + DBParams.Values[cPATH] + '"' + ' -P' + DBParams.Values[cPASSWORD] + ' -U' + DBParams.Values[cUSER] + ' -C' + cCHAR_SET ), SW_HIDE );

								  StrList.LoadFromFile( ErrFileName );

								  //Анализируем результат применения скрипта
								  if Pos( cSUCCESS_EXEC_RESULT, StrList.Text ) = 0
								  then begin
									  DBResult  := arExecError;
									  AppResult := False;
									  ScrStatus := scsExecErr;
								  end
								  else begin
									  //Удаляем лог-файл для успешно применённого скрипта
									  ScrStatus := scsExecSucc;
									  DeleteFile( ErrFileName );
								  end;

								  StrList.Clear;

								  Index := j;
							  end;

							  //Переименовываем файл скрипта
							  if StrToBool( DBParams.Values[cRENAME] ) AND ( ( Index + 1 ) >= j )
							  then begin

								  if not Result
								  then
									  FullRename := False;

								  RenameScript( TmpPath, DBParams.Values[cKEY_EXPR], TestParams.Values[cSEPARATOR_CHAR], TestParams.Values[cERROR_SCRIPT_CHAR], Result, FullRename, StrToInt( TestParams.Values[cPREFIX_CHAR_COUNT] ) );
								  RenameFile( TestParams.Values[cSCRIPTS_PATH_COPY_FROM] + ScrTestAndExec.Strings[j], TmpPath );
							  end;

						  end;

						  //Выводим отчёт о применении отдельного скрипта на экран
						  with lvwOutput
						  do begin
							Items.BeginUpdate;
							  CurrItem := Items.Add;
							  CurrItem.Caption := IntToStr( j + 1 );
							  CurrItem.SubItems.Add( ExtractFileName( TmpPath ) );
							  CurrItem.SubItems.Add( GetScriptStatus( ScrStatus ) );
							Items.EndUpdate;
						  end;

					  end;
					  
				  end;

				  //Получаем сообщение о результатах тестирования и применения скриптов для данной БД
				  case DBResult of

					arPrepareError : begin
									   DBResultMsg := cPREPARE_SCRIPT_ERR;
									 end;

					arScrNotFound  : begin
									   DBResultMsg := cSCRIPTS_NOT_FOUND;
									 end;

					arTestSuccess  : begin
									   if StrToBool( DBParams.Values[cEXECUTE] )
									   then begin
                                           DBResultMsg      := cEXECUTE_SCRIPT_STR;
                                           ExecSysScrResult := False;

                                           //Вливаем системный скрипт, не выполнив предварительно КАКИХ-ЛИБО проверок{Личное указание Смоктия К.В.}
                                           if FileExists( DBParams.Values[cSYSTEM_SCRIPT] )
                                           then begin
                                               ErrFileName := TestParams.Values[cERROR_LOG_DIR] + ErrScriptChar + DBParams.Values[cKEY_EXPR] + ErrScriptChar + cSYSTEM_SCRIPT_ERROR_FILE_NAME;
                                               CreateMyProcess( PAnsiChar( TestParams.Values[cIBESCRIPT_PATH] ), PAnsiChar( cSCRIPT_EXECUTER_NAME + '"' + DBParams.Values[cSYSTEM_SCRIPT] + '"'  + cCOMMAND_LINE_SCRIPT_EXEC + '"' + ErrFileName + '"' + ' -D' + TestParams.Values[cSERVER] + ':' + '"' + TestParams.Values[cDB_PATH_COPY_TO] + DBParams.Values[cDEFAULT_DB_FILE_NAME] + '"' + ' -P' + TestParams.Values[cPASSWORD] + ' -U' + TestParams.Values[cUSER] + ' -C' + cCHAR_SET ), SW_HIDE );

                                               StrList.Clear;
                                               StrList.LoadFromFile( ErrFileName );

                                               //Анализируем результат применения системного скрипта
                                               if Pos( cSUCCESS_EXEC_RESULT, StrList.Text ) = 0
                                               then begin
                                                   ExecSysScrMsg := cEXEC_SYS_SCRIPT_STR_ERR;    
                                               end
                                               else begin
                                                   //Удаляем лог-файл для успешно применённого системного скрипта
                                                   ExecSysScrMsg    := cEXEC_SYS_SCRIPT_STR_SUCC;
                                                   ExecSysScrResult := True;
                                                   DeleteFile( ErrFileName );
                                               end;

                                           end
                                           else begin
                                               ExecSysScrMsg := cEXEC_SYS_SCRIPT_STR_ERR + #13 + 'File ''' + DBParams.Values[cSYSTEM_SCRIPT] + ''' not found!';    
                                           end;
                                           
                                       end
									   else begin
										   DBResultMsg      := cTEST_SCRIPT_STR;
                                           ExecSysScrMsg    := cDONT_EXEC_SYS_SCRIPT_STR;
                                           ExecSysScrResult := True;
                                       end;
									 end;

					arTestError,
					arExecError    : begin
									   if DBResult = arTestError
									   then
										   DBResultMsg := cTEST_SCRIPT_STR_ERR
									   else
										   DBResultMsg := cEXECUTE_SCRIPT_STR_ERR;
									 end;
				  end;

				  //Оповещаем пользователя о результатах тестирования и применения скриптов для данной БД
				  with lvwOutput
				  do begin
					Items.BeginUpdate;
					  Items.Add;
					  CurrItem := Items.Add;
					  CurrItem.SubItems.Add( DBResultMsg );
					  Items.Add;
					Items.EndUpdate;
				  end;

				finally
				  StrList.Free;
				end;

				stbMain.SimpleText := cSPACE;
				Cursor := crDefault;
				ScrOnlyExec.Clear;
				ScrTestAndExec.Clear;
				DBParams.Clear;
			end;

			//Оповещаем пользователя о результатах работы приложения
			if AppResult
			then begin
				MessageDlg( cAPP_RESULT_OK_MSG, mtInformation, [mbOK], 0 );
			end
			else begin
				lvwOutput.Color := clRed;
				MessageDlg( cAPP_RESULT_ERR_MSG, mtError, [mbOK], 0 );
			end;

			//Оповещаем пользователя о результатах применения системного скрипта
            if DBResult = arTestSuccess
            then begin
                if ExecSysScrResult
                then begin
                    MessageDlg( ExecSysScrMsg, mtInformation, [mbOK], 0 );
                end
                else begin
                    MessageDlg( ExecSysScrMsg, mtError, [mbOK], 0 );
                end;
            end;

			//Завершаем работу приложения в режиме коммандной строки
			if AppMode = amCmd
			then
				Close;
		end
		else begin

			if AppMode = amCmd
			then
				Close
			else
				mnuStart.Enabled := False;

			MessageDlg( cINI_FILE_WAS_REMOVED, mtWarning, [mbOK], 0 );
		end;

	  finally
		  IniFile.Free;
		  ScrOnlyExec.Free;
		  ScrTestAndExec.Free;
		  DbParams.Free;
		  TestParams.Free;
		  AllSecNames.Free;
		  UselessSecNames.Free;
		  stbMain.SimpleText := cSPACE;
	  end;

	except
		LogException( ExtractFilePath( Application.ExeName ) + cERROR_FILE_NAME );
		Raise;
	end;

  except

	on E: EInOutError do
	begin
		MessageDlg( E.Message + ' ' + SysErrorMessage( E.ErrorCode ), mtError, [mbOK], 0 );

		if AppMode = amCmd
		then
			Close;
	end;

	on E: EConvertError do
	begin
		MessageDlg( cCONVERT_ERROR + E.Message, mtError, [mbOK], 0 );

		if AppMode = amCmd
		then
			Close;
	end;

	else begin
	  ShowException( ExceptObject, ExceptAddr );

	  if AppMode = amCmd
	  then
		  Close;
	end;

  end;

end;

procedure TfmMain.mnuCreateTestListClick(Sender: TObject);
begin
  MessageDlg( 'Coming soon...', mtInformation, [mbOK], 0 );
end;

procedure TfmMain.mnuOptionsClick(Sender: TObject);
begin
  MessageDlg( 'Coming soon...', mtInformation, [mbOK], 0 );
end;

end.

