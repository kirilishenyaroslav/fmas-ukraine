unit uUtils;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uUtils                                                                     *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Централизованное хранение используемых в приложении процедур и функций.    *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses Windows, Classes, SysUtils, Dialogs, Controls, uTypes;

	procedure LogException       ( const aFileName: TFileName );
	procedure SortFileList       ( var aFileList: TStringList; aSortMode: TSortMode = smAlphabetically );
	procedure ExtractKeyBlock    ( var aKeyBlock: String; var aSeparatorCount: Integer; const aSeparatorChar: String );
	procedure CreateMyProcess    ( const aAppName, aCommandLine: PAnsiChar; aWindowState: Word );
	procedure SetDirEndDelimiter ( var aDirPath: String );

	function  RenameScript       ( var aFileName: String; const aKeyExpr, aSeparatorChar, aErrorChar : String; const aIsValid, aFullRename: Boolean; const aPrefixCharCount: Integer ): Boolean;
	function  GetScriptNames     ( const aScriptDir, aSeparatorChar, aKeyExpr: String; const aPrefixCharCount: Integer; var aScriptNames: TStringList ): Boolean;
	function  GetScriptStatus    ( const aScrStatus: TScriptStatus ): String;
    function  GetScriptNamesExt  ( const aScriptDir, aSeparatorChar, aKeyExpr: String; const aPrefixCharCount: Integer; const aBackUpDate: TDate; var aScriptNames: TStringList ): Boolean;

implementation

uses StrUtils, DateUtils;

procedure LogException ( const aFileName: TFileName );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	LogException                                                               *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Процедура протоколирует ошибки, возникающие в приложении                     *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aFileName - полный путь к файлу протокола.                              *
*                                                                              *
*******************************************************************************}

var
    m       : word;
    Buf     : array[0..511] of char;
    FStream : TFileStream;
begin

    if FileExists( aFileName )
    then
        m := fmOpenReadWrite
    else
        m := fmCreate;

    FStream := TFileStream.Create( aFileName, m );
    FStream.Seek( 0, soFromEnd );

    StrPCopy( Buf, DateTimeToStr(Now)+ '.   ' );
    ExceptionErrorMessage( ExceptObject, ExceptAddr, @Buf[ StrLen(Buf) ], SizeOf(Buf) - StrLen(Buf) );
    StrCat( Buf, #13#10 );

    FStream.WriteBuffer( Buf, StrLen(Buf) );
    FStream.Free;

end;  //End of procedure LogException

procedure CreateMyProcess ( const aAppName, aCommandLine: PAnsiChar; aWindowState: Word );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	CreateMyProcess                                                            *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Процедура создаёт процесс, в рамках которого в режиме коммандной строки      *
* выполняется некоторое приложение.                                            *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aAppName     - полный путь к запускаемому приложению.                   *
*      aCommandLine - параметры коммандной строки.                             *
*      aWindowState - тип прорисовки окна приложения.                          *
*                                                                              *
*******************************************************************************}
var
    Result      : Boolean;
	ExitCode    : Cardinal;
	ProcessInfo : TProcessInformation;
	StartUpInfo : TStartupInfo;

begin

  try

    //Инициализируем объявленные структуры
    FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);

    with StartUpInfo do
    begin
        cb := SizeOf(TStartUpInfo);
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := aWindowState;
    end;

    //Создаём процесс
    Result := CreateProcess( aAppName, aCommandLine, nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);

    if Result
    then
        with ProcessInfo do
        begin
            WaitForInputIdle(hProcess, INFINITE);                 // ждем завершения инициализации
            WaitforSingleObject(ProcessInfo.hProcess, INFINITE);  // ждем завершения процесса
            GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);   // получаем код завершения
            CloseHandle(hThread);                                 // закрываем дескриптор процесса
            CloseHandle(hProcess);                                // закрываем дескриптор потока
        end;
  except
    LogException( cERROR_FILE_NAME );
  end;

end;  //End of procedure CreateMyProcess

procedure SortFileList( var aFileList: TStringList; aSortMode: TSortMode = smAlphabetically );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	SortFileList                                                               *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Процедура сортирует список имён файлов.                                      *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aFileList - список имён файлов, подлежащий сортировке.                  *
*      aSortMode - критерий сортировки.                                        *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      aFileList - отсортированный список имён файлов.                         *
*                                                                              *
*******************************************************************************}
begin

  case aSortMode of

    smAlphabetically : begin
                         aFileList.Sorted := True;
                       end;

    smDate           : begin
                       end;

    smOrder          : begin
                       end;
  end;

end;  //End of procedure SortFileList

procedure ExtractKeyBlock ( var aKeyBlock: String; var aSeparatorCount: Integer; const aSeparatorChar: String );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	ExtractKeyBlock                                                            *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*   Процедура выделяет блок ключевых выражений.(данная процедура явл.          *
*   вспомогательной)                                                           *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aKeyBlock       - строка, содержащая блоки ключевых выражений.          *
*      aSeparatorChar  - символ-разделител, отделяющий друг от друга блоки     *
*                        ключевых выражений.                                   *
*      aSeparatorCount - количество начальных символов-разделителей            *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      aKeyBlock       - строка, содержащая 1 блок ключевых выражений.         *
*      aSeparatorCount - количество начальных символов-разделителей            *
*                                                                              *
*******************************************************************************}
var
    Counter   : Integer;
    CharIndex : Integer;
begin

  try
	Counter := 0;
	CharIndex := 0;
    aKeyBlock := aSeparatorChar + aKeyBlock;
    aSeparatorCount := 0;
    //Ищем начало блока ключевых выражений
    repeat
	  Inc( Counter );
	  CharIndex := PosEx( aSeparatorChar, aKeyBlock, CharIndex + 1 );
    until ( aKeyBlock[CharIndex] <> aKeyBlock[CharIndex + 1] );
	//Получаем количество начальных символов-разделителей
	aSeparatorCount := Counter - 1;
    //Отсекаем последовательность символов-разделителей, с которых начинается строка
    Delete( aKeyBlock, 1, CharIndex );
    CharIndex := Pos( aSeparatorChar, aKeyBlock );
    //Отсекаем все символы, следующие за блоком ключевых выражений
    Delete( aKeyBlock, CharIndex, Length( aKeyBlock ) - CharIndex + 1 );
  except
    LogException( cERROR_FILE_NAME );
  end;

end;  //End of procedure ExtractKeyBlock

function RenameScript( var aFileName: String; const aKeyExpr, aSeparatorChar, aErrorChar: String; const aIsValid, aFullRename: Boolean; const aPrefixCharCount: Integer ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	RenameScript                                                               *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Ф-ция переименовывает файл скрипта в соответствии с принятым форматом.       *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aIsValid         - признак, показывающий успешно ли был выполнен скрипт *
*      aFullRename      - признак, указывающий нужно ли полностью переименовы- *
*                         вать скрипт                                          *
*      aKeyExpr         - один или несколько  ключевых символов, определяющие  *
*                         критерий отбора файлов скриптов.                     *
*      aFileName        - полный путь к  файлу скрипта.                        *
*      aErrorChar       - "специальный" символ в имени файла скрипта, указыва- *
*                         ющий на то, что данный скрипт был применён с ошибками*
*      aSeparatorChar   - символ-разделитель, используемый для именования фай- *
*                         лов скриптов.                                        *
*      aPrefixCharCount - количество первых символов в именах файлов скриптов, *
*                         не используемых при анализе.                         *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      Result           - результат переименования файла.                      *
*                                                                              *
* RESULT: Boolean.                                                             *
*                                                                              *
*	Если файл скрипта успешно переименован, то результат                       *
* возвращаемый функцией - истина, если нет - ложь.                             *
*                                                                              *
*******************************************************************************}
var
	i, j, m, n   : Integer;
	Delta        : String;
	IsValid      : Boolean;
	TmpBlock     : String;
	KeyBlock     : String;
	KeyIndex     : Integer;
	SepCount     : Integer;
	KeyBlocks    : TStringList;
	CharIndex    : Integer;
	FmtSettings  : TFormatSettings;
	TmpFileName  : String;
	DelCharCount : Integer;
begin

  try

	try
		//Проверяем: не был ли удалён с сервера файл скрипта во время тестирования
		if FileExists( aFileName )
		then begin
			TmpFileName  := ExtractFileName( aFileName );
			DelCharCount := aPrefixCharCount;
			KeyBlock := TmpFileName;

			//Получаем количество дней между датой создания скрипта и датой его применения
			FmtSettings.DateSeparator   := cDATE_SEPARATOR;
			FmtSettings.ShortDateFormat := cFORMAT_DATE_TO_STR;
			CharIndex := Pos( aSeparatorChar, Copy( KeyBlock, 1, DelCharCount ) );
			Delete( KeyBlock, CharIndex, Length( KeyBlock ) - CharIndex + 1 );

			//Добавляем к разнице между двумя датами управляющий ноль
			Delta := IntToStr( DaysBetween( Date, StrToDate( KeyBlock, FmtSettings ) ) );

			if StrToInt( Delta ) < 10
			then
				Delta := '0' + Delta;

			KeyBlocks := TStringList.Create;

			//Выделяем из имени файла блоки ключевых исмволов
			repeat
				KeyBlock := TmpFileName;
				Delete( KeyBlock, 1, DelCharCount );
				ExtractKeyBlock( KeyBlock, SepCount, aSeparatorChar );
				KeyIndex := Pos( aKeyExpr, KeyBlock );
				KeyBlocks.Add( KeyBlock );
				DelCharCount := DelCharCount + Length( KeyBlock ) + SepCount;
			until ( DelCharCount >= Length( TmpFileName ) );

			n := KeyBlocks.Count - 3;
			KeyIndex := Pos( KeyBlocks.Strings[1], TmpFileName ) + Length( KeyBlocks.Strings[1] );

			//Формируем имя скрипта с учётом результата его применения
			if aIsValid
			then
				TmpBlock := aKeyExpr + Delta
			else
				TmpBlock := aErrorChar + aKeyExpr + Delta;

			TmpBlock := aSeparatorChar + aSeparatorChar + TmpBlock;

			//Находим среди блоков ключевых символов позицию для данного блока(блоки должны располагаться в алфавитном порядке)
			for i := 2 to n do
			begin
				m := Length( KeyBlocks.Strings[i] );

				//Выделяем блок ключевых симлов, отбрасывая все цифры
				for j := 1 to m
				do
					//Находим и отсекаем последовательность цифр в блоке ключевых символов
					if KeyBlocks.Strings[i][j] in cDIGITS
					then begin
						KeyBlock := KeyBlocks.Strings[i];
						Delete( KeyBlock, j, Length( KeyBlock ) - j + 1 );
						Break;
					end;

				//Отсекаем последовательность символов, указывающих на ошибки при применении скрипта
				Delete( KeyBlock, Pos( aErrorChar, KeyBlock ), Length( aErrorChar ) );

				//Проверяем алфавитный порядок следования блоков, указывающих на дату применения скрипта
				if KeyBlock < aKeyExpr
				then begin
					KeyIndex := Pos( KeyBlocks.Strings[i], TmpFileName ) + Length( KeyBlocks.Strings[i] );
				end;

			end;

			//Вставляем в имя файла скрипта кол-во дней, прошедших с момента его создания
			Insert( TmpBlock, TmpFileName, KeyIndex );

			KeyIndex := Pos( aKeyExpr, KeyBlocks.Strings[0] );
			KeyBlock := KeyBlocks.Strings[1];
			IsValid  := True;

			//Проверяем: корректно ли зарезервировано место для ключевого выражения во 2-ом блоке
			n := KeyIndex + Length( aKeyExpr ) - 1 ;

			for i := KeyIndex to n do
				if KeyBlock[i] <> cEMPTY_CHAR
				then begin
					IsValid := False;
					Break;
				end;

			//Проверяем: подлежит ли полному переименованию данный скрипт?
			if aFullRename
			then begin
				//Вставляем во 2-ой блок ключевое выражение
				CharIndex := Pos( KeyBlocks.Strings[1], TmpFileName );

				if IsValid
				then
					Delete( TmpFileName, CharIndex + KeyIndex - 1, Length( aKeyExpr ) );

				Insert( aKeyExpr, TmpFileName, CharIndex + KeyIndex - 1 );
			end;

            //Возвращаем сформированние "новое" имя скрипта
			aFileName := ExtractFilePath( aFileName ) + TmpFileName;
			Result := True;

        end
        else
            Result := False;

    finally
      KeyBlocks.Free;
    end;

  except
    LogException( cERROR_FILE_NAME );
  end;

end; //End of procedure RenameScript

function GetScriptNamesExt ( const aScriptDir, aSeparatorChar, aKeyExpr: String; const aPrefixCharCount: Integer; const aBackUpDate: TDate; var aScriptNames: TStringList ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetScriptNamesExt                                                          *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Формирование списков имён файлов скриптов, которые должны быть применены.    *
*                                                                              *
* IN:                                                                          *
*      aKeyExpr         - один или несколько  ключевых символов, определяющие  *
*                         критерий отбора файлов скриптов.                     *
*      aScriptDir       - путь к папке, содержащей файлы скриптов для тестиро- *
*                         вания.                                               *
*      aSeparatorChar   - символ-разделитель, используемый для именования фай- *
*                         лов скриптов.                                        *
*      aBackUpDate      - дата самого "свежего" бекапа.                        *
*      aScriptNames     - список имён файлов скриптов, подлежащих тестированию.*
*      aPrefixCharCount - количество первых символов в именах файлов скриптов, *
*                         не используемых при анализе.                         *
*                                                                              *
* OUT:                                                                         *
*      aScriptNames     - список имён файлов скриптов, подлежащих тестированию.*
*                                                                              *
* RESULT: Boolean.                                                             *
*                                                                              *
*	Если хотя бы один файл скрипта для тестирования найден, то результат       *
* возвращаемый функцией - истина, если нет - ложь.                             *
*                                                                              *
*******************************************************************************}

var
	i, n             : Integer;
	Index            : Integer;
	FileRec          : TSearchRec;
	KeyBlock         : String;
	KeyBlocks        : TStringList;
	KeyIndex         : Integer;
	SearchRes        : Integer;
	TmpFileName      : String;
	FmtSettings      : TFormatSettings;
	DelCharCount     : Integer;
    ScriptExists     : Boolean;
	DaysCountScr     : Integer;
	DateCreateScr    : TDate;
	DateExecuteScr   : TDate;
	SeparatorCount   : Integer;
	StrDateCreteScr  : String;
begin

  try

	try
		//Пытаемся найти хотя бы один файл скрипта
		SearchRes := FindFirst( aScriptDir + cSCRIPTS_MASK, faAnyFile, FileRec );

		//Если не найден ни один скрипт
		if SearchRes <> 0
		then begin
			Result := False;
			Exit;
		end
        else begin
            aScriptNames.Clear;
            KeyBlocks := TStringList.Create;
			FmtSettings.DateSeparator   := cDATE_SEPARATOR;
			FmtSettings.ShortDateFormat := cFORMAT_DATE_TO_STR;
        end;

		//Пытаемся найти все существующие файлы скриптов
		while ( SearchRes = 0 ) do
		begin
			TmpFileName := FileRec.Name;

			//Получаем дату создания скрипта
			StrDateCreteScr := Copy( TmpFileName, 1, cDATE_DIGITS_COUNT );
			DateCreateScr := StrToDate( StrDateCreteScr, FmtSettings );

			//Отсекаем дату создания + порядковый номер скрипта
			Delete( TmpFileName, 1, aPrefixCharCount );
            KeyBlocks.Clear;

            //Выделяем из имени файла блоки ключевых исмволов
            repeat
                KeyBlock := TmpFileName;
                ExtractKeyBlock( KeyBlock, SeparatorCount, aSeparatorChar );
                KeyBlocks.Add( KeyBlock );
                DelCharCount := Length( KeyBlock ) + SeparatorCount;
                Delete( TmpFileName, 1, DelCharCount );
            until ( Length( TmpFileName ) = 0 );

            //Отбрасываем ключевые блоки, содержащие ФИО, комментарий и не содержащие информации о дате применения скрипта
			n := KeyBlocks.Count - 3;
            ScriptExists := False;

			//Проверяем: вошел ли скрипт в какое-либо обновление?
            for i := 2 to n
            do begin
                Index    := Pos( cUPDATE_EXPR, KeyBlocks.Strings[i] );
                KeyIndex := Pos( aKeyExpr, KeyBlocks.Strings[i] );

                //Вычисляем дату применения скрипта, не вошедшего ни в одно обновление
                if ( Index = 0 ) AND ( KeyIndex <> 0 )
                then begin
                    ScriptExists := True;
                    KeyBlock := KeyBlocks.Strings[i];
					Delete( KeyBlock, 1, KeyIndex + Length( aKeyExpr ) - 1 );
                    DaysCountScr := StrToInt( KeyBlock );
                    DateExecuteScr := DateCreateScr + DaysCountScr;
                end;

            end;

            //Запоминаем имя файла скрипта, подлежащего тестированию
            if ScriptExists AND ( DateExecuteScr > aBackUpDate )
            then begin
                aScriptNames.Add( FileRec.Name );
            end;

            SearchRes := FindNext( FileRec );
        end;

        aScriptNames.Sorted := True;

        //Формируем возвращаемый функцией результат
        if aScriptNames.Count > 0
        then begin
            Result := True;
        end;

	finally
		FindClose( FileRec );

        if Assigned( KeyBlocks )
        then
            FreeAndNil( KeyBlocks );
	end;

  except
    Result := False;
	LogException( cERROR_FILE_NAME );
  end;

end; //End of function GetScriptNamesExt

function GetScriptNames( const aScriptDir, aSeparatorChar, aKeyExpr: String; const aPrefixCharCount: Integer; var aScriptNames: TStringList ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetScriptNames                                                             *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Формирование списка имён файлов скриптов, которые должны быть применены.     *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aKeyExpr         - один или несколько  ключевых символов, определяющие  *
*                         критерий отбора файлов скриптов.                     *
*      aScriptDir       - путь к папке, содержащей файлы скриптов для тестиро- *
*                         вания.                                               *
*      aScriptNames     - список имён файлов скриптов, подлежащих тестированию.*
*      aSeparatorChar   - символ-разделитель, используемый для именования фай- *
*                         лов скриптов.                                        *
*      aPrefixCharCount - количество первых символов в именах файлов скриптов, *
*                         не используемых при анализе.                         *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      aScriptNames     - список имён файлов скриптов, подлежащих тестированию.*
*                                                                              *
* RESULT: Boolean.                                                             *
*                                                                              *
*	Если хотя бы один файл скрипта для применения найден, то результат         *
* возвращаемый функцией - истина, если нет - ложь.                             *
*                                                                              *
*******************************************************************************}

var
	FileRec      : TSearchRec;
	SearchRes    : Integer;
	CharIndex    : Integer;
	TmpFileName  : String;
	DelCharCount : Integer;
begin

  try

	try
		//Пытаемся найти хотя бы один файл скрипта
		SearchRes := FindFirst( aScriptDir + cSCRIPTS_MASK, faAnyFile, FileRec );

		if SearchRes = 0
		then
			Result := True
		else
			Result := False;

		//Пытаемся найти все существующие файлы скриптов
		while ( SearchRes = 0 ) do
		begin
			//Получаем 1-ый блок ключевых символов из имени файла скрипта
			TmpFileName := FileRec.Name;
			Delete( TmpFileName, 1, aPrefixCharCount );
			ExtractKeyBlock( TmpFileName, DelCharCount, aSeparatorChar );
			CharIndex := Pos( aKeyExpr, TmpFileName );

			if CharIndex > 0
			then begin
				//Получаем 2-ой блок ключевых символов из имени файла скрипта
				DelCharCount := aPrefixCharCount + Length( TmpFileName ) + DelCharCount;
				TmpFileName := FileRec.Name;
				Delete( TmpFileName, 1, DelCharCount );
				ExtractKeyBlock( TmpFileName, DelCharCount, aSeparatorChar );
				CharIndex := Pos( aKeyExpr, TmpFileName );

				if CharIndex = 0
				then begin
					//Запоминаем имя файла скрипта, который нужно применить
					aScriptNames.Add( FileRec.Name );
				end;

			end;

			SearchRes := FindNext( FileRec );
		end;

		FindClose( FileRec );
		aScriptNames.Sorted := True;

	finally
	end;

  except
	LogException( cERROR_FILE_NAME );
  end;

end; //End of function GetScriptNames

function GetScriptStatus ( const aScrStatus: TScriptStatus ): String;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetScriptStatus                                                            *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Возвращает в виде строки результат выполнения скриптов.                      *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aScrStatus - параметр, содержащий результат выполнения скриптов.        *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      RESULT     - строка, расшифровывающая результат выполнения скриптов.    *
*                                                                              *
*******************************************************************************}
begin
  Result := cSCR_STATUS[ Ord( aScrStatus ) ];
end; //End of function GetScriptStatus

procedure SetDirEndDelimiter ( var aDirPath: String );
{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	SetDirEndDelimiter                                                         *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*   В зависимости от типа ОС дополняет путь к дирректории корректным слешем,   *
*   если это необходимо.                                                       *
*                                                                              *
* IN:                                                                          *
*      aDirPath - параметр, содержащий путь к дирректории.                     *
* OUT:                                                                         *
*      aDirPath - параметр, содержащий путь к дирректории.                     *
*                                                                              *
*******************************************************************************}
begin

  if Pos( cSEPARATOR_FOLDER_WIN, aDirPath ) <> 0
  then begin
	  if aDirPath[ Length( aDirPath ) ] <> cSEPARATOR_FOLDER_WIN
	  then
		  aDirPath := aDirPath + cSEPARATOR_FOLDER_WIN
  end
  else
	  if aDirPath[ Length( aDirPath ) ] <> cSEPARATOR_FOLDER_UNX
	  then
		  aDirPath := aDirPath + cSEPARATOR_FOLDER_UNX;

end; //End of procedure SetDirEndDelimiter

end.
