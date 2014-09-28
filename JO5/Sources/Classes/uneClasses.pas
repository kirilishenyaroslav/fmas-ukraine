unit uneClasses;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uneClasses                                                                 *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Библиотека классов общего назначения.                                      *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses SysUtils, Classes, Windows, Forms, Dialogs, IBase, uneTypes;

type

    { ****************************************** }
    { *** ПРЕДВАРИТЕЛЬНОЕ ОБЪЯВЛЕНИЕ КЛАССОВ *** }
    { ****************************************** }

    EneException  = class;
    TneStringList = class;
    TneConnection = class;


    { ********************************************************************** }
    { **********   *** РЕАЛИЗАЦИЯ ОПИСАННЫХ ВЫШЕ ОБЪЯВЛЕНИЙ ***   ********** }
    { ********************************************************************** }


//EXCEPTIONS

	{ *** Назначение: расшифровка текста + ошибки при возникновении ИС *** }
	EneException = class( Exception )
	private
		FErrorCode: Integer;
	public
		constructor CreateResCode( aResStringRec: PResStringRec );
		property ErrorCode: Integer read FErrorCode write FErrorCode;
	end;

//CLASSES

	{ *** Назначение: хранение списка строк и связанных с ними объектов *** }
	TneStringList = class(TStringList)
	public
		destructor Destroy; override;
	end;

	{ *** Назначение: извлечение параметров соединения из ini-файла *** }
	TneConnection = class( TneStringList )
	private
		FDBPath        : String;
		FUserName      : String;
		FPassword      : String;
		FCharSet       : String;
		FSQLDialect    : Integer;
		FLogPath       : String;
		FParamsExists  : Boolean;
		FParamsIsValid : Boolean;

		procedure ReadIniFile( const aFileName: TFileName );
		procedure CheckParams;
		procedure PutParams;
		procedure SetAddParams;
	public
		constructor Create( const aFileName: String ); overload;
		constructor Create( const aFileName, aUserName, aPassword: String ); overload;

		property DBPath         : String  read FDBPath;
		property UserName       : String  read FUserName;
		property Password       : String  read FPassword;
		property CharSet        : String  read FCharSet;
		property SQLDialect     : Integer read FSQLDialect;
		property LogPath        : String  read FLogPath;
		property ParamsExists   : Boolean read FParamsExists  write  FParamsExists;
		property ParamsIsValid  : Boolean read FParamsIsValid write  FParamsIsValid;
	end;

implementation

{ EneException }
constructor EneException.CreateResCode(aResStringRec: PResStringRec);
begin
  inherited CreateRes( aResStringRec );
  FErrorCode := aResStringRec^.Identifier;
end;

{ TneStringList }
destructor TneStringList.Destroy;
var
    i, n : Integer;
begin
    n := Count - 1;

    //Освобождаем ресурсы, выделенные для объектов, связанных с элементами списка
    for i := 0 to n
    do begin
        if Assigned( Objects[i] )
        then begin
            Objects[i].Free;
            Objects[i] := nil;
        end;
    end;

    //Уничтожаем экземпляр класса
    inherited Destroy;
end;

{ TneConnection }
constructor TneConnection.Create(const aFileName: String);
begin
  inherited Create;
  ReadIniFile( aFileName );
end;

constructor TneConnection.Create(const aFileName, aUserName,
  aPassword: String);
begin
  inherited Create;
  ReadIniFile( aFileName );
  Values[sPASSWORD]  := aPassword;
  Values[sUSER_NAME] := aUserName;
end;

//Проверяем существование основных параметров соединеня
procedure TneConnection.CheckParams;
var
	i, n : Integer;
begin

  i := Low ( cMainParams );
  n := High( cMainParams );
  ParamsExists := True;

  for i := i to n
  do begin
	  if IndexOfName( cMainParams[i] ) = -1
	  then begin
		  ParamsExists := False;
		  Break;
	  end;
  end;

end;

//Получаем дополнительные параметры соединения
procedure TneConnection.SetAddParams;
var
	i, n : Integer;
begin

  i := Low ( cAdditionalParams );
  n := High( cAdditionalParams );

  for i := i to n
  do begin

	  //Проверяем существование дополнительных параметров соединеня
	  if IndexOfName( cAdditionalParams[i].Name ) = -1
	  then begin

		//Устанавливаем для несуществующих дополнительных параметров соединеня значения по умолчанию
		if cAdditionalParams[i].Name = sLOG_FILE_PATH
		then
			Values[cAdditionalParams[i].Name] := ExtractFilePath( Application.ExeName )
		else
			Values[cAdditionalParams[i].Name] := cAdditionalParams[i].Value;

	  end;

  end;


end;

//Получаем параметры соединения
procedure TneConnection.PutParams;
var
	Server: String;
begin

  if ParamsExists
  then begin

	  //Получаем основные параметры соединения
	  Server      := Values[sSERVER];
	  FDBPath     := Server + ':' + Values[sPATH];
	  FUserName   := Values[sUSER_NAME];
	  FPassword   := Values[sPASSWORD];

	  //Получаем дополнительные параметры соединения
	  SetAddParams;
	  FCharSet    := Values[sCHAR_SET];
	  FSQLDialect := StrToInt( Values[sSQL_DIALECT] );
	  FLogPath    := Values[sLOG_FILE_PATH];

	  //Формируем корректный путь к файлу-отчёту об ошибках
	  if not DirectoryExists( FLogPath )
	  then
		  FLogPath := ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME
	  else
		  //Проверяем наличие завершающего слэша для пути файла-отчёта
		  if IsDelimiter( PathDelim, FLogPath, Length( FLogPath ) )
		  then
			  FLogPath := FLogPath + sLOG_FILE_NAME
		  else
			  FLogPath := FLogPath + PathDelim + sLOG_FILE_NAME;

  end
  else begin
	  Raise EneException.CreateResCode( PResStringRec( @sEInvalidConnectParams ) );
  end;

end;

//Считываем параметры соединеня из файла настроек
procedure TneConnection.ReadIniFile( const aFileName: TFileName );
begin

  try
	try
		//Проверяем существование файла настроек
		if FileExists( aFileName )
		then begin
			//Получаем параметры соединения
			LoadFromFile( aFileName );
			CheckParams;
			PutParams;
			ParamsIsValid := True;
		end
		else begin
			Raise EneException.CreateResCode( PResStringRec( @sEIniFileNotFound ) );
		end;

	except
		ParamsIsValid := False;
		Raise;
	end;
  except

	  on E: EneException
	  do begin
		MessageBox( Application.Handle, PChar( sErrorCode + IntToStr( E.ErrorCode ) + #13#10 + sErrorText + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;

	  on E: EConvertError
	  do begin
		MessageBox( Application.Handle, PChar( sErrorText + sEConvertError ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
	  end;

	  on E: Exception
	  do begin
		MessageBox( Application.Handle, PChar( sErrorText + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;

  end;

end;

end.
