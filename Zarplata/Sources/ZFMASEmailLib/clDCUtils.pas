{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clDCUtils;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

uses
  Classes, SysUtils, clWinInet, Windows;

type
  EclInternetError = class(Exception)
  private
    FErrorCode: Integer;
  public
    constructor Create(const AErrorText: string; AErrorCode: Integer);
    constructor CreateByLastError;
    property ErrorCode: Integer read FErrorCode;
  end;

  TclResourceInfo = class
  private
    FSize: Integer;
    FName: string;
    FDate: TDateTime;
    FContentType: string;
    FStatusCode: Integer;
    FAllowsRandomAccess: Boolean;
    FContentDisposition: string;
    FCompressed: Boolean;
    function GetAllowsRandomAccess: Boolean;
  protected
    procedure SetName(const AValue: string);
    procedure SetDate(AValue: TDateTime);
    procedure SetSize(AValue: Integer);
    procedure SetContentType(const AValue: string);
    procedure SetStatusCode(AValue: Integer);
    procedure SetAllowsRandomAccess(AValue: Boolean);
    procedure SetContentDisposition(const AValue: string);
    procedure SetCompressed(AValue: Boolean);
  public
    constructor Create;
    procedure Assign(Source: TclResourceInfo); virtual;
    property Name: string read FName;
    property Date: TDateTime read FDate;
    property Size: Integer read FSize;
    property ContentType: string read FContentType;
    property StatusCode: Integer read FStatusCode;
    property AllowsRandomAccess: Boolean read GetAllowsRandomAccess;
    property ContentDisposition: string read FContentDisposition;
    property Compressed: Boolean read FCompressed; 
  end;

const
  cMaxThreadCount = 10;
  cDefaultThreadCount = 5;
  cDefaultChar = #128;
  cPreviewCharCount = 256;
  cTryCount = 5;
  cTimeOut = 5000;

resourcestring
  cOperationIsInProgress = 'Operation is in progress';
  cUnknownError = 'Unknown error, code = %d';
  cResourceAccessError = 'HTTP resource access error occured, code = %d';
  cDataStreamAbsent = 'The data source stream is not assigned';
  cExtendedErrorInfo = 'Additional info';
  cRequestTimeOut = 'Request timeout';
  cDataValueName = 'Data';

  HTTP_QUERY_STATUS_CODE_Msg = 'Status Code';
  HTTP_QUERY_CONTENT_LENGTH_Msg = 'Content Length';
  HTTP_QUERY_LAST_MODIFIED_Msg = 'Last Modified';
  HTTP_QUERY_CONTENT_TYPE_Msg = 'Content Type';

procedure EnumIECacheEntries(AList: TStrings);
procedure GetIECacheEntryHeader(const AUrl: string; AList: TStrings);
procedure GetIECacheFile(const AUrl: string; AStream: TStream);
function GetLastErrorText(ACode: Integer): string;

implementation

procedure EnumIECacheEntries(AList: TStrings);
var
  info: ^TInternetCacheEntryInfo;
  size: DWORD;
  hCache: THandle;
begin
  info := nil;
  hCache := 0;
  try
    size := 0;
    GetMem(info, size);
    repeat
      hCache := FindFirstUrlCacheEntry(nil, info^, size);
      if (hCache = 0) then
      begin
        if (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
        begin
          raise EclInternetError.CreateByLastError();
        end;
      end else
      begin
        Break;
      end;
      FreeMem(info);
      GetMem(info, size);
    until False;

    if (hCache <> 0) then
    begin
      AList.Add(string(info^.lpszSourceUrlName));
    end;
    repeat
      if not FindNextUrlCacheEntry(hCache, info^, size) then
      begin
        if (GetLastError() = ERROR_INSUFFICIENT_BUFFER) then
        begin
          FreeMem(info);
          GetMem(info, size);
        end else
        if (GetLastError() = ERROR_NO_MORE_ITEMS) then
        begin
          Break;
        end else
        begin
          raise EclInternetError.CreateByLastError();
        end;
      end else
      begin
        AList.Add(string(info^.lpszSourceUrlName));
      end;
    until False;

  finally
    FreeMem(info);
    if (hCache <> 0) then
    begin
      FindCloseUrlCache(hCache);
    end;
  end;
end;

procedure GetIECacheEntryHeader(const AUrl: string; AList: TStrings);
var
  info: ^TInternetCacheEntryInfo;
  size: DWORD;
begin
  size := 0;
  info := nil;
  if not GetUrlCacheEntryInfo(PChar(AUrl), info^, size)
    and (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
  begin
    raise EclInternetError.CreateByLastError();
  end;
  GetMem(info, size);
  try
    if not GetUrlCacheEntryInfo(PChar(AUrl), info^, size) then
    begin
      raise EclInternetError.CreateByLastError();
    end;

    if info.dwHeaderInfoSize > 0 then
    begin
      AList.Text := system.Copy(PChar(info.lpHeaderInfo), 1, info.dwHeaderInfoSize);
    end;
    
  finally
    FreeMem(info);
  end;
end;

procedure GetIECacheFile(const AUrl: string; AStream: TStream);
const
  batchSize = 8192;
var
  info: ^TInternetCacheEntryInfo;
  bytesRead, size: DWORD;
  hStream: THandle;
  buf: PChar;
begin
  size := 0;
  info := nil;
  hStream := RetrieveUrlCacheEntryStream(PChar(AUrl), info^, size, False, 0);
  if (hStream = 0) and (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
  begin
    raise EclInternetError.CreateByLastError();
  end;
  GetMem(buf, batchSize);
  GetMem(info, size);
  try
    hStream := RetrieveUrlCacheEntryStream(PChar(AUrl), info^, size, False, 0);
    if (hStream = 0) then
    begin
      raise EclInternetError.CreateByLastError();
    end;

    bytesRead := 0;
    while (bytesRead < info.dwSizeLow) do
    begin
      size := info.dwSizeLow;
      if (size > batchSize) then
      begin
        size := batchSize;
      end;
      if not ReadUrlCacheEntryStream(hStream, bytesRead, buf, size, 0) then
      begin
        raise EclInternetError.CreateByLastError();
      end;

      AStream.Write(buf^, size);
      bytesRead := bytesRead + size;
    end;

  finally
    if (hStream <> 0) then
    begin
      UnlockUrlCacheEntryStream(hStream, 0);
    end;
    FreeMem(info);
    FreeMem(buf);
  end;
end;

function GetLastErrorText(ACode: Integer): string;
var
  ExtErr, dwLength: DWORD;
  Len: Integer;
  Buffer: array[0..255] of Char;
  buf: PChar;
begin
  Result := '';
  Len := FormatMessage(FORMAT_MESSAGE_FROM_HMODULE or FORMAT_MESSAGE_FROM_SYSTEM,
    Pointer(GetModuleHandle('wininet.dll')), ACode, 0, Buffer, SizeOf(Buffer), nil);
  while (Len > 0) and (Buffer[Len - 1] in [#0..#32, '.']) do Dec(Len);
  SetString(Result, Buffer, Len);
  if (ACode = ERROR_INTERNET_EXTENDED_ERROR) then
  begin
    InternetGetLastResponseInfo(ExtErr, nil, dwLength);
    if (dwLength > 0) then
    begin
      GetMem(buf, dwLength);
      try
        if InternetGetLastResponseInfo(ExtErr, buf, dwLength) then
        begin
          if (Result <> '') then
          begin
            Result := Result + '; ' + cExtendedErrorInfo + ': ';
          end;
          Result := Result + buf;
        end;
      finally
        FreeMem(buf);
      end;
    end;
  end;
  if (Result = '') then
  begin
    Result := Format(cUnknownError, [ACode]);
  end;
end;

{ TclResourceInfo }

procedure TclResourceInfo.Assign(Source: TclResourceInfo);
begin
  if (Source <> nil) then
  begin
    FSize := Source.Size;
    FName := Source.Name;
    FDate := Source.Date;
    FContentType := Source.ContentType;
    FStatusCode := Source.StatusCode;
    FAllowsRandomAccess := Source.AllowsRandomAccess;
    FContentDisposition := Source.ContentDisposition;
    FCompressed := Source.Compressed;
  end else
  begin
    FSize := 0;
    FName := '';
    FDate := 0;
    FContentType := '';
    FStatusCode := 0;
    FAllowsRandomAccess := False;
    FContentDisposition := '';
    FCompressed := False;
  end;
end;

constructor TclResourceInfo.Create;
begin
  inherited Create();
  FSize := 0;
  FDate := Now();
end;

function TclResourceInfo.GetAllowsRandomAccess: Boolean;
begin
  Result := (Size > 0) and FAllowsRandomAccess;
end;

procedure TclResourceInfo.SetAllowsRandomAccess(AValue: Boolean);
begin
  FAllowsRandomAccess := AValue;
end;

procedure TclResourceInfo.SetCompressed(AValue: Boolean);
begin
  FCompressed := AValue;
end;

procedure TclResourceInfo.SetContentDisposition(const AValue: string);
begin
  FContentDisposition := AValue;
end;

procedure TclResourceInfo.SetContentType(const AValue: string);
begin
  FContentType := AValue;
end;

procedure TclResourceInfo.SetDate(AValue: TDateTime);
begin
  FDate := AValue;
end;

procedure TclResourceInfo.SetName(const AValue: string);
begin
  FName := AValue;
end;

procedure TclResourceInfo.SetSize(AValue: Integer);
begin
  FSize := AValue;
end;

procedure TclResourceInfo.SetStatusCode(AValue: Integer);
begin
  FStatusCode := AValue;
end;

{ EclInternetError }

constructor EclInternetError.CreateByLastError;
begin
  FErrorCode := GetLastError();
  inherited Create(GetLastErrorText(FErrorCode));
end;

constructor EclInternetError.Create(const AErrorText: string; AErrorCode: Integer);
begin
  inherited Create(AErrorText);
  FErrorCode := AErrorCode;
end;

end.

