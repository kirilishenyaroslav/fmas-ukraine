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

uses Windows, Classes, SysUtils, Dialogs, Controls, RxMemDS, DB, pFIBDataBase,
     Fib, IniFiles, Registry, uTypes, uLib;

	procedure ReadIniFile        ( const aFileName: String; const aDefIniParams: array of TDefIniParams; aIniParams: TStringList );
	procedure FillDataSet        ( aDataSet: TRxMemoryData; const aSourceList: TUsrStringList; var aSelRecCount: Integer; const aMode: TFillMode = fmInsert );
	procedure LogException       ( const aFileName: TFileName );
	procedure ParseFileName      ( const aFileName, aKeyExpr: String; var aScriptInfo: TScriptInfo; aSections: TStringList = nil );
	procedure ExtractKeyBlock    ( var aKeyBlock: String; var aSeparatorCount: Integer; const aSeparatorChar: String );
	procedure CreateMyProcess    ( const aAppName, aCommandLine: PAnsiChar; aWindowState: Word );
	procedure DelDirEndDelimiter ( var aDirPath: String );
	procedure SetDirEndDelimiter ( var aDirPath: String );

	function  FindText           ( aSourceDS: TRxMemoryData; const aSearchFieldName: String; const aSearchParams: TPtr_SearchParams ): Boolean;
	function  GetKeyExpr         ( const aProjectName: String ): String;
	function  LoadScripts        ( const aFilterParams: TFilterParams; var aScriptNames: TUsrStringList; var aMaxUpdNumber: TUpdateNumInfo ): TLoadScrResult;
	function  RenameScript       ( const aOldFileName: String; var aNewFileName: String; const aRenameParams: TRenameParams ): Boolean;
	function  SelectRecords      ( aDataSet: TRxMemoryData; const aSelectionMode: TSelectionMode ): Integer;
	function  IsDateInPeriod     ( const aCurrDate: TDate; const aDateBeg, aDateEnd: String ): Boolean;
	function  TestConnection     ( aDataBase: TpFIBDataBase; const aDBPath, aUserName, aPassword: String; var aErrIBMsg: String; var aErrIBCode: Integer ): Boolean;
	function  GetMaxUpdNumber    ( const aMaxUpdNumParams: TMaxUpdNumParams ): TUpdateNumInfo;

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
    Counter     : Integer;
    CharIndex   : Integer;
begin

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

end;  //End of procedure ExtractKeyBlock

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

    if Trim( aDirPath ) <> sEMPTY_STR
    then begin

        if Pos( sSEPARATOR_FOLDER_WIN, aDirPath ) <> 0
        then begin
          if aDirPath[ Length( aDirPath ) ] <> sSEPARATOR_FOLDER_WIN
          then
              aDirPath := aDirPath + sSEPARATOR_FOLDER_WIN
        end
        else
          if aDirPath[ Length( aDirPath ) ] <> sSEPARATOR_FOLDER_UNX
          then
              aDirPath := aDirPath + sSEPARATOR_FOLDER_UNX;
    end;

end; //End of procedure SetDirEndDelimiter

function GetKeyExpr ( const aProjectName: String ): String;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetKeyExpr                                                                 *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Поиск ключевого выражения, соответствующего данному проэкту.                 *
*                                                                              *
* IN:                                                                          *
*      aProjectName - название проэкта.                                        *
* OUT:                                                                         *
*      Result       - значение ключевого выражения.                            *
*                                                                              *
* RESULT: String.                                                              *
*                                                                              *
*******************************************************************************}
var
    i, n : Integer;
begin
    Result := sEMPTY_STR;
    n := High( cProjectParams );

    for i := Low( cProjectParams ) to n
    do begin
        if Pos(UpperCase( cProjectParams[i].Name),UpperCase(aProjectName))<>0   //UpperCase( aProjectName ) = UpperCase( cProjectParams[i].Name )
        then begin
            Result := cProjectParams[i].KeyExpr;
            Break;
        end;
    end;

end;  //End of function GetKeyExpr

procedure FillDataSet( aDataSet: TRxMemoryData; const aSourceList: TUsrStringList; var aSelRecCount: Integer; const aMode: TFillMode = fmInsert );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	FillDataset                                                                *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Заполняет набор данных значениями из списка.                                 *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aMode        - режим добавления.                                        *
*      aDataSet     - набор данных приемник.                                   *
*      aSourceList  - списко значений, подлежащих добавлению.                  *
*      aSelRecCount - количество помеченных записей.                           *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      aDataSet    - заполненный набор данных.                                 *
*      aSelRecCount - количество помеченных записей.                           *
*                                                                              *
*******************************************************************************}
var
    i, n         : Integer;
    Index        : Integer;
    IsActive     : Boolean;
    CurrFileName : String;
begin
  try

    //Заполняем НД
    case aMode of

      fmInsert : begin
                     //Очищаем НД
                     if aDataSet.Active
                     then
                         aDataSet.Close;

                     aDataSet.Open;
                     aDataSet.DisableControls;
                     n := aSourceList.Count - 1;

                     for i := 0 to n
                     do begin
                         aDataSet.Insert;
                         aDataSet.FieldByName(sIS_ACTIVE_FN  ).AsBoolean  := cDEF_IS_ACTIVE;
                         aDataSet.FieldByName(sSCRIPT_NAME_FN).AsString   := aSourceList.Strings[i];
						 aDataSet.FieldByName(sFILE_SIZE_FN  ).AsFloat    := TUsrObject( aSourceList.Objects[i] ).FileSize;
						 aDataSet.FieldByName(sDATE_CHANGE_FN).AsDateTime := TUsrObject( aSourceList.Objects[i] ).FileDateChange;
						 aDataSet.Post;
					 end;

					 aSelRecCount := n + 1;
				 end;

	  fmAppend : begin
				   //Подготавливаем НД к заполнению
				   if not aDataSet.Active
				   then
					   aDataSet.Open;

				   n := aDataSet.RecordCount - 1;
				   aDataSet.DisableControls;
				   aDataSet.First;

				   //Удаляем из НД не актуальные записи
				   for i := 0 to n
				   do begin
					   IsActive     := aDataSet.FieldByName(sIS_ACTIVE_FN  ).AsBoolean;
					   CurrFileName := aDataSet.FieldByName(sSCRIPT_NAME_FN).AsString;
					   Index        := aSourceList.IndexOf( CurrFileName );

					   if Index = -1
					   then begin
						   if IsActive
						   then
							   Dec( aSelRecCount );

						   aDataSet.Delete;
					   end
					   else begin
						   if not IsActive
						   then begin
							   aDataSet.Edit;
							   aDataSet.FieldByName(sIS_ACTIVE_FN).AsBoolean := cDEF_IS_ACTIVE;
							   aDataSet.Post;
							   Inc( aSelRecCount );
						   end;

						   aDataSet.Next;
					   end;

				   end;

				   //Актуализируем НД
				   n := aSourceList.Count - 1;

				   for i := 0 to n
				   do begin

					   if not aDataSet.Locate( sSCRIPT_NAME_FN, aSourceList.Strings[i], [] )
					   then begin
						   aDataSet.Insert;
						   aDataSet.FieldByName(sIS_ACTIVE_FN  ).AsBoolean  := cDEF_IS_ACTIVE;
						   aDataSet.FieldByName(sSCRIPT_NAME_FN).AsString   := aSourceList.Strings[i];
						   aDataSet.FieldByName(sFILE_SIZE_FN  ).AsFloat    := TUsrObject( aSourceList.Objects[i] ).FileSize;
						   aDataSet.FieldByName(sDATE_CHANGE_FN).AsDateTime := TUsrObject( aSourceList.Objects[i] ).FileDateChange;
						   aDataSet.Post;
						   Inc( aSelRecCount );
					   end;

				   end;

                 end;
    end;

    aDataSet.First;
  finally
    aDataSet.EnableControls;
  end;

end;  //End of procedure FillDataset

function  SelectRecords ( aDataSet: TRxMemoryData; const aSelectionMode: TSelectionMode ): Integer;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	SelectRecords                                                              *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Помечает множество записей из набора данных в зависимости от типа режима.    *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aDataSet       - набор данных.                                          *
*      aSelectionMode - режим выбора множества записей.                        *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      Result    - количество помеченных записей.                              *
*                                                                              *
* RESULT: Integer.                                                             *
*                                                                              *
*******************************************************************************}
var
    i, n  : Integer;
    Count : Integer;
begin
    n := aDataSet.RecordCount - 1;
    Count := 0;
    aDataSet.DisableControls;
    aDataSet.First;

    case aSelectionMode of

      smInvert      : begin
                          for i := 0 to n
                          do begin
                              aDataSet.Edit;
                              if aDataSet.FieldByName(sIS_ACTIVE_FN).AsBoolean
                              then begin
                                  aDataSet.FieldByName(sIS_ACTIVE_FN).AsBoolean := False;
                              end
                              else begin
                                  aDataSet.FieldByName(sIS_ACTIVE_FN).AsBoolean := True;
                                  Inc( Count );
                              end;
                              aDataSet.Post;
                              aDataSet.Next;
                          end;

                          Result := Count;
                      end;


      smSelectAll   : begin
                          Result := n + 1;

                          for i := 0 to n
                          do begin
                              aDataSet.Edit;
                              aDataSet.FieldByName(sIS_ACTIVE_FN).AsBoolean := True;
                              aDataSet.Post;
                              aDataSet.Next;
                          end;
                      end;

      smUnSelectAll : begin
                          Result := 0;

                          for i := 0 to n
                          do begin
                              aDataSet.Edit;
                              aDataSet.FieldByName(sIS_ACTIVE_FN).AsBoolean := False;
                              aDataSet.Post;
                              aDataSet.Next;
                          end;
                      end;
    end;

    aDataSet.EnableControls;

end;  //End of function SelectRecords

procedure DelDirEndDelimiter ( var aDirPath: String );
{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	DelDirEndDelimiter                                                         *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*   В зависимости от типа ОС удаляет завершающий слеш для пути к дирректории,  *
*   если это необходимо.                                                       *
*                                                                              *
* IN:                                                                          *
*      aDirPath - параметр, содержащий путь к дирректории.                     *
* OUT:                                                                         *
*      aDirPath - параметр, содержащий путь к дирректории.                     *
*                                                                              *
*******************************************************************************}
var
    StrLength : Integer;
begin

  StrLength := Length( aDirPath );

  if StrLength > 0
  then begin
      if (     ( aDirPath[ StrLength ] = sSEPARATOR_FOLDER_WIN )
           OR  ( aDirPath[ StrLength ] = sSEPARATOR_FOLDER_UNX ) )
           AND ( StrLength > cMIN_PATH_LENGTH )
      then
          Delete( aDirPath, StrLength, 1 );
  end;

end;   //End of procedure DelDirEndDelimiter

function IsDateInPeriod ( const aCurrDate: TDate; const aDateBeg, aDateEnd: String ): Boolean;
{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	IsDateInPeriod                                                             *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*   Анализирует, попадает ли текущая дата в интервал, заданный двумя другими   *
*   датами.                                                                    *
*                                                                              *
* IN:                                                                          *
*      aDateBeg  - дата, задающая нижнюю границу временного интервала.         *
*      aDateEnd  - дата, задающая верхнюю границу временного интервала.        *
*      aCurrDate - дата, подлежащая проверке.                                  *
*                                                                              *
* OUT:                                                                         *
*      Result - результат анализа.                                             *
*                                                                              *
* RESULT: Boolean.                                                             *
*         Если дата попадает в заданный интервал, то результат, возвращаемый   *
*         функцией - истина; в противном случае - ложь.                        *
*                                                                              *
*******************************************************************************}
var
    DateBeg     : TDate;
    DateEnd     : TDate;
    PeriodBound : TPeriodbound;
begin
  try

    //Aнализируем границы периода
    if ( aDateBeg = sEMPTY_STR ) AND ( aDateEnd = sEMPTY_STR )
    then
        PeriodBound := pbNone
    else
        if aDateBeg <> sEMPTY_STR
        then begin
            DateBeg := StrToDate( aDateBeg );
            PeriodBound := pbLeft;

            if aDateEnd <> sEMPTY_STR
            then begin
                DateEnd := StrToDate( aDateEnd );
                PeriodBound := pbBoth;
            end;
        end
        else begin
            DateEnd := StrToDate( aDateEnd );
            PeriodBound := pbRight;
        end;

    //Вычисляем результат функции
    case PeriodBound of

      pbNone  : begin
                  Result := True;
                end;

      pbLeft  : begin
                  if aCurrDate >= DateBeg
                  then
                      Result := True
                  else
                      Result := False;
                end;

      pbRight : begin
                  if aCurrDate <= DateEnd
                  then
                      Result := True
                  else
                      Result := False;
                end;

      pbBoth  : begin
                  if ( aCurrDate >= DateBeg ) AND ( aCurrDate <= DateEnd )
                  then
                      Result := True
                  else
                      Result := False;
                end;
    end;
  except
      Result := False;
      Raise;
  end;
end;  //End of function IsDateInPeriod

procedure ParseFileName ( const aFileName, aKeyExpr: String; var aScriptInfo: TScriptInfo; aSections: TStringList = nil );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	ParseFileName                                                              *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*   Выполняет разбор имени файла скрипта в соответствии со спецификациями.     *
*                                                                              *
* IN:                                                                          *
*      aKeyExpr    - один или несколько  ключевых символов, определяющие       *
*                    критерий отбора файлов скриптов.                          *
*      aFileName   - имя файла скрипта, подлежащее разбору                     *
*      aSections   - список, содержащий секции из которых состоит имя файла    *
*                    скрипта.                                                  *
*      aScriptInfo - запись, содержащая набор параметров скрипта.              *
* OUT:                                                                         *
*      aSections   - список, содержащий секции из которых состоит имя файла    *
*                    скрипта.                                                  *
*      aScriptInfo - запись, содержащая набор параметров скрипта.              *
*                                                                              *
*******************************************************************************}
var
	i, j, n, k       : Integer;
	Index            : Integer;
    ErrCode          : Integer;
	KeyIndex         : Integer;
	KeyBlock         : String;
	KeyBlocks        : TStringList;
	UpdateNum        : Integer;
	TmpFileName      : String;
	FmtSettings      : TFormatSettings;
	DelCharCount     : Integer;
    DaysCountScr     : Integer;
	SeparatorCount   : Integer;
	StrScrDateCreate : String;
begin
	try
        TmpFileName := aFileName;
		KeyBlocks := TStringList.Create;
		FmtSettings.DateSeparator   := cDATE_SEPARATOR;
        FmtSettings.ShortDateFormat := sFORMAT_DATE_TO_STR;

        //Получаем дату создания скрипта
        StrScrDateCreate := Copy( TmpFileName, 1, cDATE_DIGITS_COUNT );
        aScriptInfo.DateCreate := StrToDate( StrScrDateCreate, FmtSettings );
        KeyBlocks.Add( DateToStr( aScriptInfo.DateCreate ) );

        //Отсекаем дату создания скрипта
        Delete( TmpFileName, 1, cDATE_DIGITS_COUNT );

        //Выделяем из имени файла скрипта блоки ключевых cимволов
        repeat
            KeyBlock := TmpFileName;
            ExtractKeyBlock( KeyBlock, SeparatorCount, sSCR_SEPARATOR );
            KeyBlocks.Add( KeyBlock );
            DelCharCount := Length( KeyBlock ) + SeparatorCount;
            Delete( TmpFileName, 1, DelCharCount );
        until ( Length( TmpFileName ) = 0 );

        //Проверяем: нужно ли применять скрипт к данному проекту?
        if Pos( aKeyExpr, KeyBlocks.Strings[2] ) <> 0
        then begin
            aScriptInfo.CanExecute := True;
        end
        else begin
            aScriptInfo.CanExecute := False;
        end;

        //Проверяем: применен ли уже скрипт к данному проекту?
        if Pos( aKeyExpr, KeyBlocks.Strings[3] ) <> 0
        then begin
            aScriptInfo.Execute := True
        end
        else begin
            aScriptInfo.Execute := False;
        end;

        //Отбрасываем ключевые блоки, содержащие дату создания скрипта, ФИО разработчика и комментарий
        n := KeyBlocks.Count - 3;
        aScriptInfo.IsInUpdate   := False;
		aScriptInfo.UpdateNumMajor := sEMPTY_STR;
		aScriptInfo.UpdateNumMinor := sEMPTY_STR;

		//Проверяем: вошел ли скрипт в какое-либо-обновление?
		for i := 4 to n
		do begin
			KeyIndex := Pos( aKeyExpr, KeyBlocks.Strings[i] );

			//Вычисляем дату применения скрипта
			if KeyIndex <> 0
			then begin
				KeyBlock := KeyBlocks.Strings[i];
				Delete( KeyBlock, KeyIndex, Length( aKeyExpr ) );
				Index := Pos( sUPDATE_EXPR, KeyBlock );

				//Проверяем: вошел ли скрипт в обновление?
				if Index <> 0
				then begin
					Delete( KeyBlock, Index, Length( KeyBlock ) - Index + 1 );
				end;

				Val( KeyBlock, DaysCountScr, ErrCode );

				//Анализируем результат преобразования разницы в днях между датой создания и датой применения скрипта
				if ( ErrCode = 0 ) AND ( DaysCountScr >= 0 )
				then begin
					aScriptInfo.DateExecute := aScriptInfo.DateCreate + DaysCountScr;
				end
                else begin
                    aScriptInfo.DateExecute := aScriptInfo.DateCreate;
                end;

            end;

            Index := Pos( sUPDATE_EXPR, KeyBlocks.Strings[i] );

            //Вычисляем порядковый номер обновления
            if ( KeyIndex <> 0 ) AND ( Index <> 0 )
            then begin
                aScriptInfo.IsInUpdate     := True;
				aScriptInfo.UpdateNumMajor := sZERO;
				aScriptInfo.UpdateNumMinor := sZERO;
				KeyBlock := KeyBlocks.Strings[i];
				Delete( KeyBlock, 1, Index );

				//Получаем порядковый номер обновления, в которое вошел данный скрипт
				Index := Pos( cUPDATE_NUMBER_SEPARATOR, KeyBlock );

				//Выделяем порядковый номер обновления
				case Index of

				  0  : begin
						 Val( KeyBlock, UpdateNum, ErrCode );

						 //Анализируем полученный результат
						 if ( ErrCode <> 0 )
						 then begin
							aScriptInfo.UpdateNumMajor := sDEF_UPDATE_NUMBER;
							aScriptInfo.UpdateNumMinor := sDEF_UPDATE_NUMBER;
						 end
						 else begin
							 aScriptInfo.UpdateNumMajor := IntToStr( UpdateNum );
						 end;
					   end;

				  1  : begin
						 aScriptInfo.UpdateNumMajor := sDEF_UPDATE_NUMBER;
					   end;

				  else begin
						 aScriptInfo.UpdateNumMajor := Copy( KeyBlock, 1, Index - 1 );
						 aScriptInfo.UpdateNumMinor := Copy( KeyBlock, Index + 1, Length( KeyBlock ) - Index );
					   end;
				end;

            end;

        end;

    finally

        if Assigned( KeyBlocks )
        then begin
            if Assigned( aSections )
            then
                aSections.Assign( KeyBlocks );

			FreeAndNil( KeyBlocks );
		end;

	end;

end;  //End of procedure ParseFileName

function LoadScripts ( const aFilterParams: TFilterParams; var aScriptNames: TUsrStringList; var aMaxUpdNumber: TUpdateNumInfo ): TLoadScrResult;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	LoadScripts                                                                *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Формирование списка имён файлов скриптов, которые должны войти в обновление. *
* Поиск максимального номера предыдущих обновлений.                            *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aScriptNames  - список имён файлов скриптов, которые нужно включить в   *
*                      обновление.                                             *
*      aMaxUpdNumber - максимальный номер файла обновления.                    *
*      aFilterParams - множество критериев фильтрации, на основании которых    *
*                      формируется множество скриптов, которые нужно включить  *
*                      в обновление.                                           *
* OUT:                                                                         *
*                                                                              *
*      Result        - расшифровка результатов загрузки имен файлов скриптов.  *
*      aMaxUpdNumber - максимальный номер файла обновления.                    *
*                                                                              *
* RESULT: TLoadScrResult.                                                      *
*                                                                              *
*******************************************************************************}
var
	FileRec            : TSearchRec;
	UsrObject          : TUsrObject;
	SearchRes          : Integer;
	IsInPeriod         : Boolean;
	ScriptInfo         : TScriptInfo;
	ScriptExist        : Boolean;
	CurrUpdateNum      : TUpdateNumInfo;
begin
  try

	try
		Result := lrNone;
		with CurrUpdateNum
		do begin
			UpdateNumMajor := cDEF_UPDATE_NUMBER;
			UpdateNumMinor := cDEF_UPDATE_NUMBER;
		end;

		//Пытаемся найти хотя бы один файл скрипта
		SearchRes := FindFirst( aFilterParams.ScriptPath, faAnyFile, FileRec );

		//Проверяем: был ли найден хотя бы один файл скрипта?
		if SearchRes <> 0
		then begin
			Result := lrScrNotFound;
			Exit;
		end
		else begin
			Result      := lrFilterInvalid;
			ScriptExist := False;
		end;

		//Пытаемся найти все существующие файлы скриптов, удовлетворяющиe критериям фильтрации
		while ( SearchRes = 0 )
		do begin

			//Выполняем разбор имени файла скрипта
			ParseFileName( FileRec.Name, aFilterParams.KeyExpr, ScriptInfo );

			//Проверяем: может ли текущий скрипт быть включен в обновление?
			if ScriptInfo.CanExecute
			then begin

				//Получаем порядковый номер обновления
				if ScriptInfo.IsInUpdate
				then begin
                    with CurrUpdateNum
                    do begin
                        UpdateNumMajor := StrToInt( ScriptInfo.UpdateNumMajor );
                        UpdateNumMinor := StrToInt( ScriptInfo.UpdateNumMinor );
                    end;
				end
				else begin
                    with CurrUpdateNum
                    do begin
                        UpdateNumMajor := cZERO;
                        UpdateNumMinor := cDEF_UPDATE_NUMBER;
                    end;
				end;

				//Находим максимальное значение главной части порядкового номера обновления
				if aMaxUpdNumber.UpdateNumMajor < CurrUpdateNum.UpdateNumMajor
				then
					aMaxUpdNumber.UpdateNumMajor := CurrUpdateNum.UpdateNumMajor;

				//Находим максимальное значение дополнительной части порядкового номера обновления
				if aMaxUpdNumber.UpdateNumMinor < CurrUpdateNum.UpdateNumMinor
				then
					aMaxUpdNumber.UpdateNumMinor := CurrUpdateNum.UpdateNumMinor;

				//Проверяем: не включен ли уже текущий скрипт в обновление?
				if    ( not ScriptInfo.Execute AND ( ( aFilterParams.UpdateNumMajor = 0 )                            and ( aFilterParams.UpdateNumMinor = 0 ) ) )
				   OR (     ScriptInfo.Execute AND ( ( aFilterParams.UpdateNumMajor = CurrUpdateNum.UpdateNumMajor ) and ( aFilterParams.UpdateNumMinor = CurrUpdateNum.UpdateNumMinor ) ) )
				then begin
					//Проверяем: попадает ли дата создания данного скрипта в заданный период
					IsInPeriod := IsDateInPeriod( ScriptInfo.DateCreate, aFilterParams.DateBeg, aFilterParams.DateEnd );

					//Запоминаем имя скрипта, который нужно включить в обновление
					if IsInPeriod
                    then begin
                        UsrObject := TUsrObject.Create;
                        UsrObject.PutFileSize( FileRec.Size );
                        UsrObject.PutFileDateChange( FileRec.Time );
                        aScriptNames.AddObject( FileRec.Name, UsrObject );
                        ScriptExist := True;
                    end;

                end;

            end;

            //Находим следующий файл скрипта
            SearchRes := FindNext( FileRec );
        end;

        //Формируем возвращаемый функцией результат
        if ScriptExist
        then begin
            Result := lrLoadSuccess;
		end;

    finally
		FindClose( FileRec );
	end;
  except
      Result := lrNone;
      Raise;
  end;
end;  //End of function LoadScriptsExt

function RenameScript ( const aOldFileName: String; var aNewFileName: String; const aRenameParams: TRenameParams ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	RenameScript                                                               *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Генерация нового имени скрипта на основании старого.                         *
*                                                                              *
* IN:                                                                          *
*         aOldFileName  - старое имя скрипта.                                  *
*         aNewFileName  - новое имя скрипта.                                   *
*         aRenameParams - параметры переименования скриптов.                   *
* OUT:                                                                         *
*                                                                              *
*         aNewFileName  - новое имя скрипта.                                   *
*                                                                              *
* RESULT: Boolean.                                                             *
*                                                                              *
* NOTE:                                                                        *
*       Функция возвращает True, если имя скрипта подлежит переименованию и    *
*       False - в противном случае.                                            *
*******************************************************************************}
var
    i, j, n, k          : Integer;
    KeyIndex            : Integer;
    KeyBlock            : String;
    EmptyStr            : String;
    KeyBlocks           : TStringList;
    ScriptInfo          : TScriptInfo;
	FmtSettings         : TFormatSettings;
    CurrKeyBlock        : String;
    KeyBlockIndex       : Integer;
    UpdateNumMinorStr   : String;
    UpdateNumMajorStr   : String;
    DaysBetweenCount    : Extended;
    CanEditScriptName   : Boolean;
    DaysBetweenCountStr : String;
begin
  try
      Result    := False;
      EmptyStr  := sEMPTY_CHAR;
      KeyBlocks := TStringList.Create;

      with aRenameParams
      do begin
          //Выполняем разбор имени файла скрипта
          ParseFileName( aOldFileName, KeyExpr, ScriptInfo, KeyBlocks );

          case RenameMode of

            rmRename   : begin
                           if not( ScriptInfo.Execute OR ScriptInfo.IsInUpdate )
                           then
                               CanEditScriptName := True
                           else
                               CanEditScriptName := False;
                         end;

            rmUnRename : begin
                           if ScriptInfo.Execute AND ScriptInfo.IsInUpdate
                           then
                               CanEditScriptName := True
                           else
                               CanEditScriptName := False;
                         end;
          end;

          //Проверяем: нужно ли вообще пере(раз)именовывать данный скрипт?
          if ScriptInfo.CanExecute AND CanEditScriptName
          then begin
              KeyIndex := Pos( KeyExpr, KeyBlocks.Strings[2] );

              //Заменяем во 2-ом блоке ключевое выражение символами подчеркивания
              if ScriptInfo.Execute
              then begin
                  KeyBlock := KeyBlocks.Strings[3];
                  EmptyStr := DupeString( sEMPTY_CHAR, Length( KeyExpr ) );
                  Insert( EmptyStr, KeyBlock, KeyIndex + Length( KeyExpr ) );
                  Delete( KeyBlock, KeyIndex, Length( KeyExpr ) );
                  KeyBlocks.Strings[3] := KeyBlock;
              end;

              //Переименовываем скрипт, если это необходимо
              case RenameMode of

                rmRename   : begin
                               //Помечаем скрипт, как уже применённый
                               KeyBlock := KeyBlocks.Strings[3];
                               Insert( KeyExpr, KeyBlock, KeyIndex + Length( KeyExpr ) );
                               Delete( KeyBlock, KeyIndex, Length( KeyExpr ) );
							   KeyBlocks.Strings[3] := KeyBlock;

							   //Получаем дату применения скрипта
							   DaysBetweenCount    := DateCreate - ScriptInfo.DateCreate;
							   DaysBetweenCountStr := FloatToStr( DaysBetweenCount );

							   if Length( DaysBetweenCountStr ) < cDAYSBETWEEN_RESERVED_CHAR_COUNT
							   then begin
								   DaysBetweenCountStr := DupeString( sZERO, cDAYSBETWEEN_RESERVED_CHAR_COUNT - Length( DaysBetweenCountStr ) ) + DaysBetweenCountStr;
							   end;

							   //Получаем главную часть порядкового номера обновления
							   UpdateNumMajorStr := IntToStr( aRenameParams.UpdateNumMajor );

							   if aRenameParams.UpdateNumMajor >= 0
							   then begin
								   if Length( UpdateNumMajorStr ) < cUPDATE_MAJ_RESERVED_CHAR_COUNT
								   then begin
									   UpdateNumMajorStr := DupeString( sZERO, cUPDATE_MAJ_RESERVED_CHAR_COUNT - Length( UpdateNumMajorStr ) ) + UpdateNumMajorStr;
								   end;

								   //Получаем дополнительную часть порядкового номера обновления
								   UpdateNumMinorStr := IntToStr( aRenameParams.UpdateNumMinor );

								   if Length( UpdateNumMinorStr ) < cUPDATE_MIN_RESERVED_CHAR_COUNT
								   then begin
									   UpdateNumMinorStr := DupeString( sZERO, cUPDATE_MIN_RESERVED_CHAR_COUNT - Length( UpdateNumMinorStr ) ) + UpdateNumMinorStr;
								   end;
							   end
							   else begin

							   end;

							   //Формируем ключевое выражение
                               CurrKeyBlock := KeyExpr + DaysBetweenCountStr + sUPDATE_EXPR + UpdateNumMajorStr + sMINUS + UpdateNumMinorStr;

                               //Получаем индекс текущего блока с учётом алфавитного порядка
                               KeyBlockIndex := 4;
                               n := KeyBlocks.Count - 3;

                               for i := 4 to n
                               do begin
                                   //Отбрасываем спецификации обновления
                                   KeyBlock := KeyBlocks.Strings[i];
                                   KeyIndex := Pos( sUPDATE_EXPR, KeyBlock );
                                   Delete( KeyBlock, KeyIndex, Length( KeyBlock ) - KeyIndex + 1 );
                                   UpperCase( KeyBlock );
                                   k := Length( KeyBlock );

                                   //Выделяем ключевое выражение, идентифицирующее проект
                                   for j := 1 to k
                                   do begin
                                       if not( KeyBlock[j] in cLETTERS )
                                       then begin
                                           Delete( KeyBlock, j, Length( KeyBlock ) - j + 1 );
                                           Break;
                                       end;
                                   end;

                                   //Проверяем алфавитный порядок следования
                                   if KeyBlock > KeyExpr
                                   then begin
                                       KeyBlockIndex := i;
                                       Break;
                                   end
                                   else begin
                                       KeyBlockIndex := i + 1;
                                   end;

                               end;

                               //Вставляем текущий блок с учётом алфавитного порядка
                               KeyBlocks.Insert( KeyBlockIndex, CurrKeyBlock );

                             end;

                rmUnRename : begin
                               //Находим и удаляем блок, содержащий информацию о дате применения скрипта и обновлении
                               n := KeyBlocks.Count - 3;

                               for i := 4 to n
                               do begin
                                   if Pos( KeyExpr, KeyBlocks.Strings[i] ) <> 0
                                   then begin
                                       KeyBlocks.Delete( i );
                                       Break;
                                   end;
                               end;

                             end;
              end;

              //Формируем новое имя файла скрипта
              FmtSettings.DateSeparator   := cDATE_SEPARATOR;
              FmtSettings.ShortDateFormat := sFORMAT_DATE_TO_STR;
              aNewFileName := DateToStr( ScriptInfo.DateCreate, FmtSettings ) + sSCR_SEPARATOR;
              n := KeyBlocks.Count - 2;

              for i := 1 to n
              do begin
                  aNewFileName := aNewFileName + KeyBlocks.Strings[i] + DupeString( sSCR_SEPARATOR, cSECTIONS_SEPARATOR_COUNT );
              end;

              aNewFileName := aNewFileName + KeyBlocks.Strings[n+1];
              Result := True;
          end;

      end;

  finally
      if Assigned( KeyBlocks )
      then
          FreeAndNil( KeyBlocks );
  end;
end;  //End of function RenameScript

function TestConnection( aDataBase: TpFIBDataBase; const aDBPath, aUserName, aPassword: String; var aErrIBMsg: String; var aErrIBCode: Integer ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	TestConnection                                                             *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Проверяет корректность параметров соединения.                              *
*                                                                              *
* IN:                                                                          *
*       aDataBase  - ссылка на компонент, с помощью которого выполняется       *
*                      попытка подключения к базе данных.                      *
*       aDBPath    - путь к файлу базы данных.                                 *
*       aUserName  - имя пользователя.                                         *
*       aPassword  - пароль.                                                   *
*       aErrIBMsg  - сообщение об ошибке.                                      *
*       aErrIBCode - код ошибки.                                               *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       Result: Boolean                                                        *
*                                                                              *
* RESULT: Функция возвращает True, если парамeтры соединения корректны и       *
*          False в противном случае.                                           *
*                                                                              *
*******************************************************************************}
begin
    try

        try

            if aDataBase.Connected
            then
                aDataBase.Close;

            aDataBase.DBName := aDBPath;
            aDataBase.ConnectParams.UserName := aUserName;
            aDataBase.ConnectParams.Password := aPassword;

            Result     := True;
            aErrIBMsg  := '';
            aErrIBCode := -1;

            aDataBase.Open;
        finally
            aDataBase.Close;
        end;

    except
        on E: EFIBError
        do begin
            Result     := False;
            aErrIBMsg  := E.IBMessage;
            aErrIBCode := E.IBErrorCode;
        end;
    end;
end;  //End of function TestConnection

procedure ReadIniFile ( const aFileName: String; const aDefIniParams: array of TDefIniParams; aIniParams: TStringList );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	ReadIniFile                                                                *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*   Считывает настройки из ini-файла.                                          *
*                                                                              *
* IN:                                                                          *
*      aFileName     - полный путь к ini-файлу.                                *
*      aIniParams    - список, содержащий значения умалчиваемых парамтров.     *
*      aDefIniParams - массив, содержащий названия секций для значений         *
*                      умалчиваемых парамтров.                                 *
* OUT:                                                                         *
*      aIniParams    - список, содержащий значения умалчиваемых парамтров.     *
*                                                                              *
*******************************************************************************}
var
    i, n : Integer;
    IniFile : TIniFile;
begin
    //Заполняем список значениями по умолчанию
    with aIniParams
    do begin
      Values[sKN_SERVER_NAME   ] := sDEF_SERVER_NAME;
      Values[sKN_DB_PATH       ] := sDEF_DB_PATH;
      Values[sKN_USER_NAME     ] := sDEF_USER_NAME;
      Values[sKN_PASSWORD      ] := sDEF_PASSWORD;
      Values[sKN_SCR_PATH      ] := sDEF_SCR_PATH;
      Values[sKN_IBESCRIPT_PATH] := sDEF_IBESCRIPT_PATH;
      Values[sKN_ACTIVE_PROJECTS] := sDEF_ACTIVE_PROJECTS;
    end;

    if FileExists( aFileName )
    then begin

        try
            IniFile := TIniFile.Create( aFileName );
            n := High( aDefIniParams );

            //Считываем умалчиваемые значеня из файла настроек
            for i := Low( aDefIniParams ) to n
            do begin

                with aDefIniParams[i]
                do begin
                    if IniFile.SectionExists( Section )
                    then begin
                        aIniParams.Values[Key] := IniFile.ReadString( Section, Key, DefValue );
                    end;
                end;

            end;

        finally
            if IniFile <> nil then FreeAndNil( IniFile );
        end;

    end;

end;  // End of procedure ReadIniFile

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

end;  //End of procedure CreateMyProcess

function GetMaxUpdNumber ( const aMaxUpdNumParams: TMaxUpdNumParams ): TUpdateNumInfo;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetMaxUpdNumber                                                            *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Вычисляет максимальный порядковый номер обновления.                        *
*                                                                              *
* IN:                                                                          *
*       aMaxUpdNumParams  - структура, содержащая критерии поиска.             *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       Result: TUpdateNumInfo                                                 *
*                                                                              *
* RESULT: Функция возвращает 0, если не удалось вычислить максимальный         *
*          порядковый номер обновления и, собственно номер, в противном случае.*
*                                                                              *
*******************************************************************************}
var
	FileRec            : TSearchRec;
	SearchRes          : Integer;
	ScriptInfo         : TScriptInfo;
	CurrUpdateNumMajor : Integer;
	CurrUpdateNumMinor : Integer;
begin
  try

	try
		with Result
		do begin
			UpdateNumMajor := cZERO;
			UpdateNumMinor := cZERO;
		end;

		//Пытаемся найти хотя бы один файл скрипта(архива с модулями)
		SearchRes := FindFirst( aMaxUpdNumParams.FilePath, faAnyFile, FileRec );

		//Пытаемся найти все существующие файлы скриптов(архивов с модулями), удовлетворяющиe критериям фильтрации
		while ( SearchRes = 0 )
		do begin
			//Выполняем разбор имени файла скрипта(архива с модулями)
			ParseFileName( FileRec.Name, aMaxUpdNumParams.KeyExpr, ScriptInfo );

			//Анализируем: был ли включен текущий файл в обновление?
			if ScriptInfo.IsInUpdate
			then begin
				CurrUpdateNumMajor := StrToInt( ScriptInfo.UpdateNumMajor );
				CurrUpdateNumMinor := StrToInt( ScriptInfo.UpdateNumMinor );

				//Находим максимальный порядковый номер обновления
				with Result
				do begin
					if UpdateNumMajor < CurrUpdateNumMajor
					then begin
						UpdateNumMajor := CurrUpdateNumMajor;
					end;

					if UpdateNumMinor < CurrUpdateNumMinor
					then begin
						UpdateNumMinor := CurrUpdateNumMinor;
					end;
				end;
                                                                                 
			end;

			//Находим следующий файл скрипта(архива с модулями)
			SearchRes := FindNext( FileRec );
		end;

	finally
		FindClose( FileRec );
	end;
  except
	  with Result
	  do begin
		  UpdateNumMajor := cZERO;
		  UpdateNumMinor := cZERO;
	  end;

	  Raise;
  end;
end;  //End of function GetMaxUpdNumber

function FindText( aSourceDS: TRxMemoryData; const aSearchFieldName: String; const aSearchParams: TPtr_SearchParams ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	FindText                                                                   *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Выполняет поиск строки текста.                                               *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aSourceDS     - набор данных, содержащий искомый тест.                  *
*      aSearchParams - указатель на запись, содержащий параметры поиска.       *
*                                                                              *
* OUT: Result        - результат поиска.                                       *
*                                                                              *
*                                                                              *
*******************************************************************************}
var
    i, n       : Integer;
    CurrText   : String;
    SearchText : String;
begin

	try
        Result := False;
        SearchText := aSearchParams^.TextSearch;
		aSourceDS.DisableControls;

        if aSearchParams^.WholeWordsOnly
        then begin
            //Анализируем регистрочувствительность символов
            if not aSearchParams^.CaseSensitive
            then begin
                SearchText := UpperCase( SearchText );

                //Анализируем направление поиска
                if aSearchParams^.Direction = dtDown
                then begin
                    while not aSourceDS.Eof
                    do begin
                        aSourceDS.Next;
                        CurrText := UpperCase( aSourceDS.FieldByName(aSearchFieldName).AsString );

                        if CurrText = SearchText
                        then begin
                            Result := True;
                            Break;
                        end;
                    end;
                end
                else begin
                    while not aSourceDS.Bof
                    do begin
                        aSourceDS.Prior;
                        CurrText := UpperCase( aSourceDS.FieldByName(aSearchFieldName).AsString );

                        if CurrText = SearchText
                        then begin
                            Result := True;
                            Break;
                        end;
                    end;
                end;  //End of Direction Condition
            end
            else begin
                Result := aSourceDS.Locate( aSearchFieldName, SearchText, [] );
            end;  //End of CaseSensivity Condition
        end
        else begin
            //Анализируем регистрочувствительность
            if not aSearchParams^.CaseSensitive
            then begin
                SearchText := UpperCase( SearchText );

                //Анализируем направление поиска
                if aSearchParams^.Direction = dtDown
                then begin
                    aSourceDS.UpdateCursorPos;
                    while not aSourceDS.Eof
                    do begin
                        aSourceDS.Next;
                        aSourceDS.CursorPosChanged;
                        CurrText := UpperCase( aSourceDS.FieldByName(aSearchFieldName).AsString );

                        if Pos( SearchText, CurrText ) <> 0
                        then begin
                            Result := True;
                            Break;
                        end;
                    end;
                end
                else begin
                    while not aSourceDS.Bof
                    do begin
                        aSourceDS.Prior;
                        CurrText := UpperCase( aSourceDS.FieldByName(aSearchFieldName).AsString );

                        if Pos( SearchText, CurrText ) <> 0
                        then begin
                            Result := True;
                            Break;
                        end;
                    end;
                end;  //End of Direction Condition
            end
            else begin
                //Анализируем направление поиска
                if aSearchParams^.Direction = dtDown
                then begin
                    while not aSourceDS.Eof
                    do begin
                        aSourceDS.Next;
                        CurrText := aSourceDS.FieldByName(aSearchFieldName).AsString;

                        if Pos( SearchText, CurrText ) <> 0
                        then begin
                            Result := True;
                            Break;
                        end;
                    end;
                end
                else begin
                    while not aSourceDS.Bof
                    do begin
                        aSourceDS.Prior;
                        CurrText := aSourceDS.FieldByName(aSearchFieldName).AsString;

                        if Pos( SearchText, CurrText ) <> 0
                        then begin
                            Result := True;
                            Break;
                        end;
                    end;
                end;  //End of Direction Condition
            end;
        end;  //End of PartialType Condition

	finally
		aSourceDS.EnableControls;
	end;

end;  //End of function FindText

end.
