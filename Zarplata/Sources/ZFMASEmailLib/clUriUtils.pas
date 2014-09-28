{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clUriUtils;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

uses
  clWinInet;

type
  TclUrlType = (utUnknown, utFTP, utGOPHER, utHTTP, utHTTPS, utFILE, utNEWS, utMAILTO);

  TclOnUrlParsing = procedure (Sender: TObject; var URLComponents: TURLComponents) of object;

  TclUrlParser = class
  private
    FUrlpath: string;
    FUser: string;
    FExtra: string;
    FHost: string;
    FPassword: string;
    FUrlType: TclUrlType;
    FOnUrlParsing: TclOnUrlParsing;
    FPort: Integer;
    FParsedUrl: string;
    function InternalParse(const AFullUrl: string): string;
    function GetAbsolutePath: string;
  protected
    procedure DoUrlParsing(var UrlComponents: TURLComponents); virtual;
  public
    function Parse(const AFullUrl: string): string;
    procedure Assign(Source: TclUrlParser); virtual;
    property Host: string read FHost;
    property User: string read FUser;
    property Password: string read FPassword;
    property Urlpath: string read FUrlpath;
    property Extra: string read FExtra;
    property AbsolutePath: string read GetAbsolutePath;
    property Port: Integer read FPort;
    property UrlType: TclUrlType read FUrlType;
    property ParsedUrl: string read FParsedUrl;
    property OnUrlParsing: TclOnUrlParsing read FOnUrlParsing write FOnUrlParsing;
  end;

  TclUrlCorrector = class(TclUrlParser)
  private
    FIsByLocalFile: Boolean;
    FLocalFile: string;
  protected
    procedure DoUrlParsing(var UrlComponents: TURLComponents); override;
  public
    function GetURLByLocalFile(const AFullUrl, ALocalFile: string): string;
    function GetLocalFileByURL(const AFullUrl, ALocalFolder: string): string;
  end;

function GetFullUrlByRoot(const AUrl, ARootUrl: string): string;
  
implementation

uses
  SysUtils, Windows, clUtils;

function GetFullUrlByRoot(const AUrl, ARootUrl: string): string;
var
  buf: array[0..INTERNET_MAX_URL_LENGTH - 1] of Char;
  len: DWORD;
  urlParser: TclUrlParser;
begin
  len := SizeOf(buf);
  ZeroMemory(buf + 0, len);
  InternetCombineUrl(PChar(ARootUrl), PChar(AUrl), buf, len, ICU_BROWSER_MODE);
  Result := buf;
  urlParser := TclUrlParser.Create();
  try
    Result := urlParser.Parse(Result);
  finally
    urlParser.Free();
  end;
end;

{ TclUrlParser }

procedure TclUrlParser.DoUrlParsing(var UrlComponents: TURLComponents);
begin
  if Assigned(FOnUrlParsing) then
  begin
    FOnUrlParsing(Self, UrlComponents);
  end;
end;

function TclUrlParser.Parse(const AFullUrl: string): string;
begin
  Result := InternalParse(AFullUrl);
  if (Result = '') and (AFullUrl <> '')
    and (GetLastError() = ERROR_INTERNET_UNRECOGNIZED_SCHEME) then
  begin
    Result := InternalParse('http://' + AFullUrl);
  end;
  FParsedUrl := Result;
end;

function TclUrlParser.InternalParse(const AFullUrl: string): string;
  procedure CleanArray(var Arr: array of Char);
  begin
    ZeroMemory(Arr + 0, High(Arr) - Low(Arr) + 1);
  end;

var
  UrlComponents: TURLComponents;
  scheme: array[0..INTERNET_MAX_SCHEME_LENGTH - 1] of Char;
  host: array[0..INTERNET_MAX_HOST_NAME_LENGTH - 1] of Char;
  user: array[0..INTERNET_MAX_USER_NAME_LENGTH - 1] of Char;
  password: array[0..INTERNET_MAX_PASSWORD_LENGTH - 1] of Char;
  urlpath: array[0..INTERNET_MAX_PATH_LENGTH - 1] of Char;
  fullurl: array[0..INTERNET_MAX_URL_LENGTH - 1] of Char;
  extra: array[0..1024 - 1] of Char;
  dwLen: DWORD;
  res: BOOL;
begin
  FUrlType := utUnknown;
  FHost := '';
  FUser := '';
  FPassword := '';
  FUrlpath := '';
  FExtra := '';
  FPort := INTERNET_INVALID_PORT_NUMBER;
  Result := '';

  CleanArray(scheme);
  CleanArray(host);
  CleanArray(user);
  CleanArray(password);
  CleanArray(urlpath);
  CleanArray(fullurl);
  CleanArray(extra);
  ZeroMemory(@UrlComponents, SizeOf(TURLComponents));
  UrlComponents.dwStructSize := SizeOf(TURLComponents);
  UrlComponents.lpszScheme := scheme;
  UrlComponents.dwSchemeLength := High(scheme) + 1;
  UrlComponents.lpszHostName := host;
  UrlComponents.dwHostNameLength := High(host) + 1;
  UrlComponents.lpszUserName := user;
  UrlComponents.dwUserNameLength := High(user) + 1;
  UrlComponents.lpszPassword := password;
  UrlComponents.dwPasswordLength := High(password) + 1;
  UrlComponents.lpszUrlPath := urlpath;
  UrlComponents.dwUrlPathLength := High(urlpath) + 1;
  UrlComponents.lpszExtraInfo := extra;
  UrlComponents.dwExtraInfoLength := High(extra) + 1;
  res := InternetCrackUrl(PChar(AFullUrl), Length(AFullUrl), 0, UrlComponents);
  if res then
  begin
    if (UrlComponents.nScheme in [Integer(Low(TclUrlType))..Integer(High(TclUrlType))]) then
    begin
      FUrlType := TclUrlType(UrlComponents.nScheme);
    end;
    DoUrlParsing(UrlComponents);
    if (StrLen(user) = 0) then
    begin
      UrlComponents.lpszUserName := nil;
      UrlComponents.dwUserNameLength :=  0;
    end;
    if (StrLen(password) = 0) then
    begin
      UrlComponents.lpszPassword := nil;
      UrlComponents.dwPasswordLength := 0;
    end;

    FHost := host;
    FUser := user;
    FPassword := password;
    FUrlpath := urlpath;
    FExtra := extra;
    FPort := UrlComponents.nPort;

    dwLen := INTERNET_MAX_URL_LENGTH;
    fullurl[0] := #0;
    res := InternetCreateUrl(UrlComponents, 0, fullurl, dwLen);
    if res then
    begin
      Result := system.Copy(fullurl, 1, dwLen);
      Result := StringReplace(Trim(Result), #32, '%20', [rfReplaceAll]);
    end;
  end;
end;

procedure TclUrlParser.Assign(Source: TclUrlParser);
begin
  FParsedUrl := Source.ParsedUrl;
  FHost := Source.Host;
  FUser := Source.User;
  FPassword := Source.Password;
  FUrlpath := Source.Urlpath;
  FExtra := Source.Extra;
  FPort := Source.Port;
  FUrlType := Source.UrlType;
end;

function TclUrlParser.GetAbsolutePath: string;
begin
  if (Host = '*') then
  begin
    Result := Host;
  end else
  begin
    Result := Urlpath;
    if (Extra <> '') then
    begin
      if (Extra[1] <> '?') and (Result <> '') and (Result[Length(Result)] <> '?') then
      begin
        Result := Result + '?';
      end;
      Result := Result + Extra;
    end;
    if (Result = '') then
    begin
      Result := '/';
    end;
  end;
end;

{ TclUrlCorrector }

function TclUrlCorrector.GetURLByLocalFile(const AFullUrl, ALocalFile: string): string;
begin
  FIsByLocalFile := True;
  try
    FLocalFile := ALocalFile;
    Result := Parse(AFullUrl);
  finally
    FIsByLocalFile := False;
  end;
end;

function TclUrlCorrector.GetLocalFileByURL(const AFullUrl, ALocalFolder: string): string;
var
  ind: Integer;
begin
  Result := ALocalFolder;
  if (Parse(AFullUrl) <> '') then
  begin
    Result := AddTrailingBackSlash(Result);
    ind := LastDelimiter('/', Urlpath);
    Result := Result + system.Copy(Urlpath, ind + 1, MaxInt);
  end;
end;

procedure TclUrlCorrector.DoUrlParsing(var UrlComponents: TURLComponents);
var
  ind: Integer;
  s: string;
begin
  if FIsByLocalFile then
  begin
    s := URLComponents.lpszUrlPath;
    ind := LastDelimiter('/', s);
    s := system.Copy(s, 1, ind);
    ind := Length(s);
    if (ind > 0) and (s[ind] <> '/') then
    begin
      s := s + '/';
    end;
    ind := LastDelimiter('\', FLocalFile);
    s := s + system.Copy(FLocalFile, ind + 1, MaxInt);
    ZeroMemory(URLComponents.lpszUrlPath + 0, INTERNET_MAX_PATH_LENGTH);
    CopyMemory(URLComponents.lpszUrlPath + 0, PChar(s), Length(s));
    URLComponents.dwUrlPathLength := Length(s);
  end;
  inherited DoUrlParsing(UrlComponents);
end;

end.

