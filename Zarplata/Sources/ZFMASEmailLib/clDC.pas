{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clDC;

interface

{$I clVer.inc}

uses
  Windows, SysUtils, Classes, clWinInet, clConnection, clDCUtils, clUtils, SyncObjs,
  clCryptApi, clCert, clFtpUtils, clHttpUtils, clHttpAuth, clUriUtils, clSyncUtils
  {$IFDEF LOGGER}, clLogger{$ENDIF};

type
  TclProcessPriority = (ppLower, ppNormal, ppHigher);
  TclProcessStatus = (psUnknown, psSuccess, psFailed, psErrors, psProcess, psTerminated);

  TclOnStatusChanged = procedure (Sender: TObject; Status: TclProcessStatus) of object;
  TclOnDataItemProceed = procedure (Sender: TObject; ResourceInfo: TclResourceInfo;
    BytesProceed: Integer; CurrentData: PChar; CurrentDataSize: Integer) of object;
  TclOnError = procedure (Sender: TObject; const Error: string; ErrorCode: Integer) of object;
  TclOnGetResourceInfo = procedure (Sender: TObject; ResourceInfo: TclResourceInfo) of object;
  TclPerformRequestOperation = procedure (AParameters: TObject) of object;

  TclCustomThreader = class(TThread)
  private
    FURL: string;
    FDataStream: TStream;
    FLastError: string;
    FLastErrorCode: Integer;
    FTimeOut: Integer;
    FTryCount: Integer;
    FBatchSize: Integer;
    FSelfConnection: TclInternetConnection;
    FConnection: TclInternetConnection;
    FStatus: TclProcessStatus;
    FURLParser: TclUrlParser;
    FOnStatusChanged: TclOnStatusChanged;
    FOnError: TclOnError;
    FOnGetResourceInfo: TclOnGetResourceInfo;
    FOnUrlParsing: TclOnUrlParsing;
    FOnDataItemProceed: TclOnDataItemProceed;
    FUrlComponents: TURLComponents;
    FCertificateFlags: TclCertificateFlags;
    FUseInternetErrorDialog: Boolean;
    FOnGetCertificate: TclOnGetCertificateEvent;
    FCertificate: TclCertificate;
    FCertificateHandled: Boolean;
    FProxyBypass: string;
    FInternetAgent: string;
    FSelfResourceInfo: TclResourceInfo;
    FDataAccessor: TCriticalSection;
    FBytesToProceed: Integer;
    FResourcePos: Integer;
    FKeepConnection: Boolean;
    FPassiveFTPMode: Boolean;
    FReconnectAfter: Integer;
    FSleepEvent: THandle;
    FAllowCompression: Boolean;
    FSynchronizer: TclThreadSynchronizer;
    FRequestHeader: TStrings;
    FDoNotGetResourceInfo: Boolean;
    FFtpProxySettings: TclFtpProxySettings;
    FHttpProxySettings: TclHttpProxySettings;
    FResponseHeader: TStrings;
    FTempErrorCode: Integer;
    procedure DoOnURLParsing(Sender: TObject; var UrlComponents: TURLComponents);
    procedure PrepareURL;
    procedure SyncDoGetResourceInfo;
    procedure SyncDoError;
    procedure SyncDoStatusChanged;
    procedure SyncDoURLParsing;
    procedure SyncDoGetCertificate;
    procedure SyncTerminate;
    procedure SetupCertIgnoreOptions(AOpenRequest: TclHttpOpenRequestAction);
    procedure SetupCertificateOptions(AOpenRequest: TclHttpOpenRequestAction);
    function SetCertOptions(AOpenRequest: TclHttpOpenRequestAction; AErrorCode: Integer): Boolean;
    procedure SetResourceInfo(const Value: TclResourceInfo);
    function GetInternalResourceInfo: TclResourceInfo;
    procedure SetURLParser(const Value: TclUrlParser);
    procedure SetCertOptionsOperation(AParameters: TObject);
    function GetConnection: TclInternetConnection;
    procedure SetConnection(const Value: TclInternetConnection);
    procedure WaitForReconnect(ATimeOut: Integer);
    function GetOpenRequestFlags(ANeedCaching: Boolean): DWORD;
    procedure SetRequestHeader(const Value: TStrings);
    procedure QueryGetInfo(AOpenRequestAction: TclHttpOpenRequestAction);
    procedure QueryHeadInfo(AOpenRequestAction: TclHttpOpenRequestAction);
    procedure SetFtpProxySettings(const Value: TclFtpProxySettings);
    procedure SetHttpProxySettings(const Value: TclHttpProxySettings);
    function GetProxyString: string;
    procedure GetAllHeaders(ARequest: TclHttpOpenRequestAction);
  protected
    FResourceInfo: TclResourceInfo;
    procedure ServerAuthentication(AOpenRequest: TclHttpOpenRequestAction);
    procedure ProxyAuthentication(AOpenRequest: TclHttpOpenRequestAction);
    procedure GetHttpStatusCode(ARequest: TclHttpOpenRequestAction);
    procedure FreeObjectIfNeed(var AObject);
    procedure SendRequest(AOpenRequest: TclHttpOpenRequestAction);
    procedure PerformRequestOperation(AOpenRequest: TclHttpOpenRequestAction;
      AOperation: TclPerformRequestOperation; AParameters: TObject);
    procedure GetResourceInfo(AConnect: TclConnectAction);
    procedure GetHTTPResourceInfo(AConnect: TclConnectAction); virtual;
    procedure GetFTPResourceInfo(AConnect: TclConnectAction); virtual;
    procedure ProcessHTTP(AConnect: TclConnectAction); virtual;
    procedure ProcessFTP(AConnect: TclConnectAction); virtual;
    procedure DoTerminate; override;
    procedure Execute; override;
    procedure ProcessURL; virtual;
    procedure DoStop; virtual;
    procedure SetHttpHeader(AResourceAction: TclInternetResourceAction);
    procedure AssignIfNeedResourceInfo;
    procedure ClearInfo;
    procedure SetStatus(AStatus: TclProcessStatus);
    procedure InternalSynchronize(Method: TThreadMethod);
    function GetNormTimeOut(ATimeOut: Integer): Integer; virtual;
    procedure AssignError(const AError, ADescription: string; AErrorCode: Integer);
    procedure BeginDataStreamAccess;
    procedure EndDataStreamAccess;
    property DataStream: TStream read FDataStream;
    property URL: string read FURL;
    property TempErrorCode: Integer read FTempErrorCode;
  public
    constructor Create(const AURL: string; ADataStream: TStream);
    destructor Destroy; override;
    procedure Perform; virtual;
    procedure Wait;
    procedure Stop;
    property RequestHeader: TStrings read FRequestHeader write SetRequestHeader;
    property ResponseHeader: TStrings read FResponseHeader;
    property Status: TclProcessStatus read FStatus;
    property LastError: string read FLastError;
    property LastErrorCode: Integer read FLastErrorCode;
    property DoNotGetResourceInfo: Boolean read FDoNotGetResourceInfo write FDoNotGetResourceInfo;
    property PassiveFTPMode: Boolean read FPassiveFTPMode write FPassiveFTPMode;
    property BytesToProceed: Integer read FBytesToProceed write FBytesToProceed;
    property ResourcePos: Integer read FResourcePos write FResourcePos;
    property URLParser: TclUrlParser read FURLParser write SetURLParser;
    property ResourceInfo: TclResourceInfo read GetInternalResourceInfo write SetResourceInfo;
    property DataAccessor: TCriticalSection read FDataAccessor write FDataAccessor;
    property Connection: TclInternetConnection read GetConnection write SetConnection;
    property KeepConnection: Boolean read FKeepConnection write FKeepConnection;
    property BatchSize: Integer read FBatchSize write FBatchSize;
    property TryCount: Integer read FTryCount write FTryCount;
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property ReconnectAfter: Integer read FReconnectAfter write FReconnectAfter; 
    property CertificateFlags: TclCertificateFlags read FCertificateFlags write FCertificateFlags;
    property UseInternetErrorDialog: Boolean read FUseInternetErrorDialog write FUseInternetErrorDialog;
    property ProxyBypass: string read FProxyBypass write FProxyBypass;
    property HttpProxySettings: TclHttpProxySettings read FHttpProxySettings write SetHttpProxySettings;
    property FtpProxySettings: TclFtpProxySettings read FFtpProxySettings write SetFtpProxySettings;
    property InternetAgent: string read FInternetAgent write FInternetAgent;
    property AllowCompression: Boolean read FAllowCompression write FAllowCompression;
    property OnDataItemProceed: TclOnDataItemProceed read FOnDataItemProceed write FOnDataItemProceed;
    property OnError: TclOnError read FOnError write FOnError;
    property OnGetCertificate: TclOnGetCertificateEvent read FOnGetCertificate write FOnGetCertificate;
    property OnGetResourceInfo: TclOnGetResourceInfo read FOnGetResourceInfo write FOnGetResourceInfo;
    property OnStatusChanged: TclOnStatusChanged read FOnStatusChanged write FOnStatusChanged;
    property OnUrlParsing: TclOnUrlParsing read FOnUrlParsing write FOnUrlParsing;
  end;

  TclDownLoadThreader = class(TclCustomThreader)
  private
    FIsGetResourceInfo: Boolean;
    FDataProceed: PChar;
    FDataProceedSize: Integer;
    FTotalDownloaded: Integer;
    procedure SyncDoDataItemProceed;
    procedure Dump(AResourceAction: TclInternetResourceAction);
    procedure SetResourcePos(AResourceAction: TclInternetResourceAction);
    procedure PrepareHeader;
  protected
    procedure ProcessHTTP(AConnect: TclConnectAction); override;
    procedure ProcessFTP(AConnect: TclConnectAction); override;
  public
    constructor Create(const AURL: string; ADataStream: TStream; AIsGetResourceInfo: Boolean);
  end;

  TclDeleteThreader = class(TclCustomThreader)
  protected
    procedure ProcessHTTP(AConnect: TclConnectAction); override;
    procedure ProcessFTP(AConnect: TclConnectAction); override;
  public
    constructor Create(const AURL: string);
  end;

  TclUploadThreader = class(TclCustomThreader)
  private
    FIsGetResourceInfo: Boolean;
    FDataProceedSize: Integer;
    FUploadedDataSize: Integer;
    FDataProceed: PChar;
    FHttpResponse: TStream;
    FForceRemoteDir: Boolean;
    FUseSimpleRequest: Boolean;
    FRequestMethod: string;
    FRetryCount: Integer;
    FRetryProceed: Integer;
    procedure SyncDoDataItemProceed;
    procedure ProcessRequest(AOpenRequest: TclHttpOpenRequestAction;
      const AHeader: string; ADataSize: Integer);
    procedure ProcessSimpleRequest(AOpenRequest: TclHttpOpenRequestAction;
      const AHeader: string; AData: TStream);
    procedure GetResourceInfoByDataStream;
    procedure RequestOperation(AParameters: TObject);
    procedure SimpleRequestOperation(AParameters: TObject);
    procedure ForceRemoteDirectory(AConnect: TclConnectAction);
    function GetRetryCount: Integer;
  protected
    procedure GetHttpResponse(AOpenRequest: TclHttpOpenRequestAction);
    procedure Dump(AResourceAction: TclInternetResourceAction);
    procedure ProcessFTP(AConnect: TclConnectAction); override;
    procedure ProcessHTTP(AConnect: TclConnectAction); override;
  public
    constructor Create(const AURL: string; ADataStream: TStream; AIsGetResourceInfo: Boolean);
    property HttpResponse: TStream read FHttpResponse write FHttpResponse;
    property ForceRemoteDir: Boolean read FForceRemoteDir write FForceRemoteDir;
    property UseSimpleRequest: Boolean read FUseSimpleRequest write FUseSimpleRequest;
    property RequestMethod: string read FRequestMethod write FRequestMethod;
  end;

procedure DownloadUrl(const AUrl: string; ATimeOut: Integer; AHtml: TStrings);

var
  PutOptimization: Boolean = False;

implementation

{$IFDEF DEMO}
uses
  Forms;
{$ENDIF}

type
  TclResourceInfoAccess = class(TclResourceInfo);

procedure DownloadUrl(const AUrl: string; ATimeOut: Integer; AHtml: TStrings);
var
  Stream: TStream;
  Threader: TclDownloadThreader;
begin
  Stream := nil;
  Threader := nil;
  try
    Stream := TMemoryStream.Create();
    Threader := TclDownloadThreader.Create(AUrl, Stream, False);
    Threader.TimeOut := ATimeOut;
    Threader.AllowCompression := False;
    Threader.Perform();
    Threader.Wait();
    if not (Threader.Status in [psSuccess, psErrors]) then
    begin
      raise EclInternetError.Create(Threader.LastError, Threader.LastErrorCode);
    end;
    Stream.Position := 0;
    AHtml.Clear();
    AHtml.LoadFromStream(Stream);
  finally
    Threader.Free();
    Stream.Free();
  end;
end;

{ TclCustomThreader }

procedure TclCustomThreader.PrepareURL;
var
  s: string;
begin
  if FURLParser.ParsedUrl <> '' then Exit;
  s := FURLParser.Parse(FURL);
  if (s <> '') then
  begin
    FURL := s;
  end else
  begin
    raise EclInternetError.CreateByLastError();
  end;
end;

constructor TclCustomThreader.Create(const AURL: string; ADataStream: TStream);
begin
  inherited Create(True);
  FFtpProxySettings := TclFtpProxySettings.Create();
  FHttpProxySettings := TclHttpProxySettings.Create();
  FRequestHeader := TStringList.Create();
  FResponseHeader := TStringList.Create();
  FSynchronizer := TclThreadSynchronizer.Create();
  FSleepEvent := CreateEvent(nil, False, False, nil);
  FURLParser := TclUrlParser.Create();
  FURLParser.OnUrlParsing := DoOnURLParsing;
  FURL := AURL;
  FDataStream := ADataStream;
  FStatus := psUnknown;
  FTryCount := cTryCount;
  FBatchSize := cBatchSize;
  FTimeOut := cTimeOut;
  FReconnectAfter := cTimeOut;
  FInternetAgent := cInternetAgent;
  FResourcePos := 0;
  FBytesToProceed := -1;
end;

destructor TclCustomThreader.Destroy;
begin
  ClearInfo();
  FURLParser.Free();
  FSelfConnection.Free();
  CloseHandle(FSleepEvent);
  FSynchronizer.Free();
  FResponseHeader.Free();
  FRequestHeader.Free();
  FHttpProxySettings.Free();
  FFtpProxySettings.Free();
  inherited Destroy();
end;

procedure TclCustomThreader.AssignError(const AError, ADescription: string; AErrorCode: Integer);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'AssignError');{$ENDIF}

  if Terminated then Exit;
  FLastError := AError;
  FLastErrorCode := AErrorCode;
  if (FLastError = '') then
  begin
    FLastErrorCode := GetLastError();
    FLastError := GetLastErrorText(FLastErrorCode);
  end;
  if (ADescription <> '') then
  begin
    FLastError := FLastError + ': ' + ADescription;
  end;
  InternalSynchronize(SyncDoError);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'AssignError'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'AssignError', E); raise; end; end;{$ENDIF}
end;

procedure TclCustomThreader.SyncDoStatusChanged;
begin
  if Assigned(FOnStatusChanged) then
  begin
    FOnStatusChanged(Self, FStatus);
  end;
end;

procedure TclCustomThreader.AssignIfNeedResourceInfo;
begin
  if (FSelfResourceInfo = nil) then
  begin
    FSelfResourceInfo := TclResourceInfo.Create();
  end;
  TclResourceInfoAccess(ResourceInfo).SetName(FURLParser.Urlpath);
end;

procedure TclCustomThreader.SetupCertIgnoreOptions(AOpenRequest: TclHttpOpenRequestAction);
var
  dwFlags, dwBuffLen: DWORD;
begin
  if (URLParser.UrlType <> utHTTPS) then Exit;
  dwBuffLen := SizeOf(dwFlags);
  if not InternetQueryOption(AOpenRequest.hResource, INTERNET_OPTION_SECURITY_FLAGS, @dwFlags, dwBuffLen) then
  begin
    raise EclInternetError.CreateByLastError();
  end;
  
  if cfIgnoreCommonNameInvalid in FCertificateFlags then
    dwFlags := dwFlags or SECURITY_FLAG_IGNORE_CERT_CN_INVALID;
  if cfIgnoreDateInvalid in FCertificateFlags then
    dwFlags := dwFlags or SECURITY_FLAG_IGNORE_CERT_DATE_INVALID;
  if cfIgnoreUnknownAuthority in FCertificateFlags then
    dwFlags := dwFlags or SECURITY_FLAG_IGNORE_UNKNOWN_CA;
  if cfIgnoreRevocation in FCertificateFlags then
    dwFlags := dwFlags or SECURITY_FLAG_IGNORE_REVOCATION;
  if cfIgnoreWrongUsage in FCertificateFlags then
    dwFlags := dwFlags or SECURITY_FLAG_IGNORE_WRONG_USAGE;

  if not InternetSetOption(AOpenRequest.hResource, INTERNET_OPTION_SECURITY_FLAGS, @dwFlags, dwBuffLen) then
  begin
    raise EclInternetError.CreateByLastError();
  end;
end;

procedure TclCustomThreader.SetupCertificateOptions(AOpenRequest: TclHttpOpenRequestAction);
var
  size: DWORD;
begin
  FCertificate := nil;
  size := 0;
  FCertificateHandled := False;
  InternalSynchronize(SyncDoGetCertificate);
  if FCertificateHandled then
  begin
    if (FCertificate <> nil) then
    begin
      size := SizeOf(CERT_CONTEXT);
    end;
    if not InternetSetOption(AOpenRequest.hResource, INTERNET_OPTION_CLIENT_CERT_CONTEXT,
      FCertificate.Context, size) then
    begin
      raise EclInternetError.CreateByLastError();
    end;
  end;
end;

function TclCustomThreader.SetCertOptions(AOpenRequest: TclHttpOpenRequestAction;
  AErrorCode: Integer): Boolean;
var
  p: Pointer;
begin
  Result := True;
  if FUseInternetErrorDialog then
  begin
    Result := InternetErrorDlg(GetDesktopWindow(), AOpenRequest.hResource, AErrorCode,
      FLAGS_ERROR_UI_FILTER_FOR_ERRORS or
      FLAGS_ERROR_UI_FLAGS_GENERATE_DATA or
      FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS, p) <> ERROR_CANCELLED;
  end else
  begin
    case AErrorCode of
      ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED: SetupCertificateOptions(AOpenRequest);
      ERROR_INTERNET_SEC_CERT_CN_INVALID,
      ERROR_INTERNET_SEC_CERT_DATE_INVALID,
      ERROR_INTERNET_INVALID_CA: SetupCertIgnoreOptions(AOpenRequest);
      else Result := False;
    end;
  end;
end;

procedure TclCustomThreader.SetCertOptionsOperation(AParameters: TObject);
begin
  (AParameters as TclHttpSendRequestAction).FireAction(GetNormTimeOut(TimeOut));
end;

procedure TclCustomThreader.PerformRequestOperation(AOpenRequest: TclHttpOpenRequestAction;
  AOperation: TclPerformRequestOperation; AParameters: TObject);
var
  cnt, LastError: Integer;
begin
  cnt := 0;
  LastError := 0;
  repeat
    try
      AOperation(AParameters);
      Break;
    except
      on E: EclTimeoutInternetError do raise;
      on E: EclInternetError do
      begin
        if (E.ErrorCode <> 12032) then
        begin
          cnt := 0;
          if (LastError = E.ErrorCode) then raise;
          LastError := E.ErrorCode;
          if not SetCertOptions(AOpenRequest, LastError) then raise;
        end else
        begin
          Inc(cnt);
          if (cnt > 9) then raise;
        end;
      end;
    end;
  until False;
end;

procedure TclCustomThreader.SendRequest(AOpenRequest: TclHttpOpenRequestAction);
var
  i: Integer;
  request: TclHttpSendRequestAction;
begin
  i := 0;
  while (i < 4) do
  begin
    Inc(i);
    request := TclHttpSendRequestAction.Create(Connection, AOpenRequest.Internet,
      AOpenRequest.hResource, '', nil, 0);
    try
      PerformRequestOperation(AOpenRequest, SetCertOptionsOperation, request);
    finally
      request.Free();
    end;
    try
      GetHttpStatusCode(AOpenRequest);
      Break;
    except
      if (ResourceInfo.StatusCode = 401) then
      begin
        if UseInternetErrorDialog then
        begin
          SetCertOptions(AOpenRequest, 0);
        end else
        if (i < 4) then
        begin
          ServerAuthentication(AOpenRequest);
        end else
        begin
          raise;
        end;
      end else
      if (ResourceInfo.StatusCode = 407) then
      begin
        if UseInternetErrorDialog then
        begin
          SetCertOptions(AOpenRequest, 0);
        end else
        if (HttpProxySettings.AuthenticationType = atAutoDetect) then
        begin
          ProxyAuthentication(AOpenRequest);
        end else
        begin
          raise;
        end;
      end else
      begin
        raise;
      end;
    end;
    if Terminated then Exit;
  end;
end;

procedure TclCustomThreader.GetFTPResourceInfo(AConnect: TclConnectAction);
var
  OpenFileAction: TclFtpOpenFileAction;
  GetSizeAction: TclFtpGetFileSizeAction;
  FindFirstFileAction: TclFtpFindFirstFileAction;
  resDate: TDateTime;
begin
  if (FResourceInfo <> nil) then Exit;

  OpenFileAction := nil;
  GetSizeAction := nil;
  try
    OpenFileAction := (Connection.GetActionByClass(TclFtpOpenFileAction) as TclFtpOpenFileAction);
    if (OpenFileAction = nil) then
    begin
      OpenFileAction := TclFtpOpenFileAction.Create(Connection, AConnect.Internet, AConnect.hResource,
        URLParser.Urlpath, GENERIC_READ, FTP_TRANSFER_TYPE_BINARY);
      OpenFileAction.FireAction(GetNormTimeOut(TimeOut));
    end;

    if Terminated then Exit;

    GetSizeAction := TclFtpGetFileSizeAction.Create(Connection, OpenFileAction.Internet,
      OpenFileAction.hResource);

    GetSizeAction.FireAction(GetNormTimeOut(TimeOut));
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetSize(GetSizeAction.FileSize);
  finally
    GetSizeAction.Free();
    FreeObjectIfNeed(OpenFileAction);
  end;

  if Terminated then Exit;

  try
    FindFirstFileAction := TclFtpFindFirstFileAction.Create(Connection, AConnect.Internet,
      AConnect.hResource, FURLParser.Urlpath, INTERNET_FLAG_RELOAD);
    try
      FindFirstFileAction.FireAction(GetNormTimeOut(TimeOut));
      AssignIfNeedResourceInfo();
      resDate := ConvertFileTimeToDateTime(FindFirstFileAction.lpFindFileData.ftLastWriteTime);
      if (resDate > 0) then
      begin
        TclResourceInfoAccess(ResourceInfo).SetDate(resDate);
      end;
    finally
      FindFirstFileAction.Free();
    end;
  except
    on EclInternetError do;
  end;
end;

procedure TclCustomThreader.GetAllHeaders(ARequest: TclHttpOpenRequestAction);
var
  buf: PChar;
  buflen, tmp: DWORD;
begin
  ResponseHeader.Clear();
  buflen := 0;
  tmp := 0;
  HttpQueryInfo(ARequest.hResource, HTTP_QUERY_RAW_HEADERS_CRLF, nil, buflen, tmp);
  if (buflen > 0) then
  begin
    GetMem(buf, buflen);
    try
      if HttpQueryInfo(ARequest.hResource, HTTP_QUERY_RAW_HEADERS_CRLF, buf, buflen, tmp) then
      begin
        ResponseHeader.Text := string(buf);
      end;
    finally
      FreeMem(buf);
    end;
  end;
end;

procedure TclCustomThreader.GetHttpStatusCode(ARequest: TclHttpOpenRequestAction);
var
  statuscode: Integer;
  buflen, tmp: DWORD;
begin
  GetAllHeaders(ARequest);

  buflen := SizeOf(statuscode);
  tmp := 0;
  if HttpQueryInfo(ARequest.hResource, HTTP_QUERY_STATUS_CODE or HTTP_QUERY_FLAG_NUMBER,
    @statuscode, buflen, tmp) then
  begin
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetStatusCode(statuscode);
    if (ResourceInfo.StatusCode >= HTTP_STATUS_BAD_REQUEST) then
    begin
      raise EclInternetError.Create(Format(cResourceAccessError, [ResourceInfo.StatusCode]),
        ResourceInfo.StatusCode);
    end;
  end else
  begin
    AssignError('', HTTP_QUERY_STATUS_CODE_Msg, 0);
  end;
end;

procedure TclCustomThreader.QueryHeadInfo(AOpenRequestAction: TclHttpOpenRequestAction);
const
  cTypeLength = 1024;
var
  filedate: TFileTime;
  resdate: TSystemTime;
  resDateTime: TDateTime;
  reslen: Integer;
  restype: array[0..cTypeLength - 1] of Char;
  buflen, tmp: DWORD;
begin
  buflen := SizeOf(reslen);
  tmp := 0;
  if HttpQueryInfo(AOpenRequestAction.hResource, HTTP_QUERY_CONTENT_LENGTH or HTTP_QUERY_FLAG_NUMBER,
    @reslen, buflen, tmp) then
  begin
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetSize(reslen);
  end else
  begin
//    AssignError('', HTTP_QUERY_CONTENT_LENGTH_Msg, 0);
  end;
  if Terminated then Exit;
  buflen := SizeOf(resdate);
  tmp := 0;
  if HttpQueryInfo(AOpenRequestAction.hResource, HTTP_QUERY_LAST_MODIFIED or HTTP_QUERY_FLAG_SYSTEMTIME,
    @resdate, buflen, tmp) then
  begin
    AssignIfNeedResourceInfo();
    if SystemTimeToFileTime(resdate, filedate) then
    begin
      resDateTime := ConvertFileTimeToDateTime(filedate);
      if (resDateTime > 0) then
      begin
        TclResourceInfoAccess(ResourceInfo).SetDate(resDateTime);
      end;
    end;
  end else
  begin
//    AssignError('', HTTP_QUERY_LAST_MODIFIED_Msg, 0);
    if (ResourceInfo <> nil) then
    begin
      TclResourceInfoAccess(ResourceInfo).SetSize(0);
    end;
  end;
  if Terminated then Exit;
  buflen := cTypeLength;
  tmp := 0;
  if HttpQueryInfo(AOpenRequestAction.hResource, HTTP_QUERY_CONTENT_TYPE, restype + 0, buflen, tmp) then
  begin
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetContentType(restype);
  end else
  begin
//    AssignError('', HTTP_QUERY_CONTENT_TYPE_Msg, 0);
    if (ResourceInfo <> nil) then
    begin
      TclResourceInfoAccess(ResourceInfo).SetSize(0);
    end;
  end;
end;

procedure TclCustomThreader.QueryGetInfo(AOpenRequestAction: TclHttpOpenRequestAction);
const
  cTypeLength = 1024;
var
  disposition, encoding: array[0..cTypeLength - 1] of Char;
  buflen, tmp: DWORD;
  contlen: Integer;
begin
  buflen := cTypeLength;
  tmp := 0;
  if HttpQueryInfo(AOpenRequestAction.hResource, HTTP_QUERY_CONTENT_DISPOSITION, disposition + 0, buflen, tmp) then
  begin
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetContentDisposition(disposition);
  end;
  if Terminated then Exit;
  buflen := cTypeLength;
  tmp := 0;
  if HttpQueryInfo(AOpenRequestAction.hResource, HTTP_QUERY_CONTENT_ENCODING, encoding + 0, buflen, tmp) then
  begin
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetCompressed(system.Pos('gzip', LowerCase(encoding)) > 0);
  end;
  contlen := Integer(InternetSetFilePointer(AOpenRequestAction.hResource, 0, nil, FILE_END, 0));
  if contlen > 0 then
  begin
    AssignIfNeedResourceInfo();
    if (ResourceInfo.Size = 0) then
    begin
      TclResourceInfoAccess(ResourceInfo).SetSize(contlen);
    end else
    begin
      TclResourceInfoAccess(ResourceInfo).SetAllowsRandomAccess(True);
    end;
  end;
end;

procedure TclCustomThreader.GetHTTPResourceInfo(AConnect: TclConnectAction);
var
  OpenRequestAction: TclHttpOpenRequestAction;
  NeedAllInfo: Boolean;
begin
  NeedAllInfo := (FResourceInfo = nil);
  OpenRequestAction := nil;
  try
    OpenRequestAction := TclHttpOpenRequestAction.Create(Connection, AConnect.Internet, AConnect.hResource,
      'HEAD', URLParser.Urlpath + URLParser.Extra, '', '', nil, GetOpenRequestFlags(False));
    OpenRequestAction.FireAction(GetNormTimeOut(TimeOut));

    SetHttpHeader(OpenRequestAction);
    SendRequest(OpenRequestAction);

    if needAllInfo then
    begin
      QueryHeadInfo(OpenRequestAction);

      if Terminated then Exit;

      OpenRequestAction.Free();
      OpenRequestAction := nil;
      OpenRequestAction := TclHttpOpenRequestAction.Create(Connection, AConnect.Internet, AConnect.hResource,
        'GET', URLParser.Urlpath + URLParser.Extra, '', '', nil, GetOpenRequestFlags(True));
      OpenRequestAction.FireAction(GetNormTimeOut(TimeOut));

      SetHttpHeader(OpenRequestAction);
      SendRequest(OpenRequestAction);

      if Terminated then Exit;

      QueryGetInfo(OpenRequestAction);
    end;
  finally
    OpenRequestAction.Free();
  end;
end;

procedure TclCustomThreader.SyncDoError;
begin
  if Assigned(FOnError) then
  begin
    FOnError(Self, FLastError, FLastErrorCode);
  end;
end;

procedure TclCustomThreader.InternalSynchronize(Method: TThreadMethod);
begin
  FSynchronizer.Synchronize(Method);
end;

procedure TclCustomThreader.SyncDoGetResourceInfo;
begin
  if Assigned(FOnGetResourceInfo) then
  begin
    FOnGetResourceInfo(Self, ResourceInfo);
  end;
end;

procedure TclCustomThreader.Perform;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  //if FindWindow('TAppBuilder', nil) = 0 then
  //begin
  //  MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' +
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
  //  ExitProcess(1);
  //end;
{$ENDIF}
{$ENDIF}
  Resume();
end;

procedure TclCustomThreader.ClearInfo;
begin
  FSelfResourceInfo.Free();
  FSelfResourceInfo := nil;
end;

function TclCustomThreader.GetNormTimeOut(ATimeOut: Integer): Integer;
begin
  Result := ATimeOut;
end;

procedure TclCustomThreader.SetStatus(AStatus: TclProcessStatus);
begin
  if (FStatus <> AStatus) then
  begin
    FStatus := AStatus;
    InternalSynchronize(SyncDoStatusChanged);
  end;
end;

procedure TclCustomThreader.WaitForReconnect(ATimeOut: Integer);
begin
  WaitForSingleObject(FSleepEvent, DWORD(ATimeOut));
end;

procedure TclCustomThreader.Execute;
var
  Counter: Integer;
begin
  ResponseHeader.Clear();
  Counter := FTryCount;
  FTempErrorCode := 0;
  try
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Execute');{$ENDIF}
    SetStatus(psProcess);
    PrepareURL();
    repeat
      try
        ProcessURL();
        Break;
      except
        on E: EclInternetError do
          begin
            FTempErrorCode := E.ErrorCode;
            Dec(Counter);
            if (Counter < 1) then raise;
            WaitForReconnect(GetNormTimeOut(ReconnectAfter));
          end;
      end;
    until False;
    if Terminated then
    begin
      SetStatus(psTerminated);
    end else
    if (FLastError <> '') then
    begin
      SetStatus(psErrors);
    end else
    begin
      SetStatus(psSuccess);
    end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Execute'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Execute', E); raise; end; end;{$ENDIF}
  except
    on E: EclInternetError do
    begin
      AssignError(E.Message, '', E.ErrorCode);
      SetStatus(psFailed);
    end;
    on E: Exception do
    begin
      AssignError(E.Message, '', 0);
      SetStatus(psFailed);
    end;
  end;
end;

procedure TclCustomThreader.DoOnURLParsing(Sender: TObject; var UrlComponents: TURLComponents);
begin
  FUrlComponents := UrlComponents;
  InternalSynchronize(SyncDoURLParsing);
  UrlComponents := FUrlComponents;
end;

procedure TclCustomThreader.SyncDoURLParsing;
begin
  if Assigned(FOnUrlParsing) then
  begin
    FOnUrlParsing(Self, FUrlComponents);
  end;
end;

procedure TclCustomThreader.Wait;
var
  Msg: TMsg;
  H: THandle;
begin
  DuplicateHandle(GetCurrentProcess(), Handle, GetCurrentProcess(), @H, 0, False, DUPLICATE_SAME_ACCESS);
  try
    if GetCurrentThreadID = FSynchronizer.SyncBaseThreadID then
    begin
      while MsgWaitForMultipleObjects(1, H, False, INFINITE, QS_SENDMESSAGE) = WAIT_OBJECT_0 + 1 do
      begin
        while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
        begin
          DispatchMessage(Msg);
        end;
      end;
    end else
    begin
      WaitForSingleObject(H, INFINITE);
    end;
  finally
    CloseHandle(H);
  end;
end;

function TclCustomThreader.GetProxyString: string;
  function GetProxyItem(const AProtocol, AServer: string; APort: Integer): string;
  begin
    if (AServer <> '') then
    begin
      Result := AServer;
      if (system.Pos('http', LowerCase(Result)) <> 1)
        and (system.Pos('ftp', LowerCase(Result)) <> 1) then
      begin
        Result := AProtocol + '://' + Result;
      end;
      Result := Format('%s=%s:%d', [AProtocol, Result, APort]);
    end else
    begin
      Result := '';
    end;
  end;

begin
  Result := '';
  case URLParser.UrlType of
    utHTTP: Result := GetProxyItem('http', HttpProxySettings.Server, HttpProxySettings.Port);
    utHTTPS: Result := GetProxyItem('https', HttpProxySettings.Server, HttpProxySettings.Port);
    utFTP: Result := GetProxyItem('ftp', FtpProxySettings.Server, FtpProxySettings.Port);
  end;
end;

procedure TclCustomThreader.ProcessURL;
const
  ConnectService: array[Boolean] of DWORD = (INTERNET_SERVICE_HTTP, INTERNET_SERVICE_FTP);
  AccessTypes: array[Boolean] of DWORD = (INTERNET_OPEN_TYPE_PRECONFIG, INTERNET_OPEN_TYPE_PROXY);
  ConnectFlags: array[Boolean] of DWORD = (0, INTERNET_FLAG_PASSIVE);
var
  OpenAction: TclInternetOpenAction;
  ConnectAction: TclConnectAction;
  Proxy, usr, psw: string;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ProcessURL');{$ENDIF}
  OpenAction := nil;
  ConnectAction := nil;
  try
    OpenAction := (Connection.GetActionByClass(TclInternetOpenAction) as TclInternetOpenAction);
    if (OpenAction = nil) then
    begin
      Proxy := GetProxyString();
      OpenAction := TclInternetOpenAction.Create(Connection, InternetAgent,
        AccessTypes[(Proxy <> '')], Proxy, ProxyBypass, 0);
      OpenAction.FireAction(-1);
    end;
    if Terminated then Exit;
    ConnectAction := (Connection.GetActionByClass(TclConnectAction) as TclConnectAction);
    if (ConnectAction = nil) then
    begin
      if (URLParser.UrlType = utFTP) then
      begin
        usr := URLParser.User;
        psw := URLParser.Password;
      end else
      begin
        usr := '';
        psw := '';
      end;
      ConnectAction := TclConnectAction.Create(Connection, OpenAction.hResource,
        URLParser.Host, URLParser.Port, usr, psw,
        ConnectService[URLParser.UrlType = utFTP], ConnectFlags[(URLParser.UrlType = utFTP) and PassiveFTPMode]);
      ConnectAction.FireAction(GetNormTimeOut(TimeOut));
    end;
    if Terminated then Exit;
    if (URLParser.UrlType = utFTP) then
    begin
      ProcessFTP(ConnectAction);
    end else
    if (URLParser.UrlType in [utHTTP, utHTTPS]) then
    begin
      ProcessHTTP(ConnectAction);
    end;
  finally
    FreeObjectIfNeed(ConnectAction);
    FreeObjectIfNeed(OpenAction);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ProcessURL'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ProcessURL', E); raise; end; end;{$ENDIF}
end;

procedure TclCustomThreader.GetResourceInfo(AConnect: TclConnectAction);
var
  needAllInfo: Boolean;
begin
  if Terminated then Exit;
  ClearInfo();
  needAllInfo := (FResourceInfo = nil);
  if DoNotGetResourceInfo then
  begin
    AssignIfNeedResourceInfo();
  end else
  begin
    case FURLParser.UrlType of
      utHTTP, utHTTPS: GetHTTPResourceInfo(AConnect);
      utFTP: GetFTPResourceInfo(AConnect);
    end;
    if Terminated then Exit;
    if needAllInfo then
    begin
      InternalSynchronize(SyncDoGetResourceInfo);
    end;
  end;
end;

procedure TclCustomThreader.SyncDoGetCertificate;
begin
  if Assigned(FOnGetCertificate) then
  begin
    FOnGetCertificate(Self, FCertificate, FCertificateHandled);
  end;
end;

procedure TclCustomThreader.ProcessFTP(AConnect: TclConnectAction);
begin
  GetResourceInfo(AConnect);
end;

procedure TclCustomThreader.ProcessHTTP(AConnect: TclConnectAction);
begin
  GetResourceInfo(AConnect);
end;

procedure TclCustomThreader.SetResourceInfo(const Value: TclResourceInfo);
begin
  if (ResourceInfo <> Value) then
  begin
    ClearInfo();
    FResourceInfo := Value;
  end;
end;

function TclCustomThreader.GetInternalResourceInfo: TclResourceInfo;
begin
  if (FResourceInfo <> nil) then
  begin
    Result := FResourceInfo;
  end else
  begin
    Result := FSelfResourceInfo;
  end;
end;

procedure TclCustomThreader.BeginDataStreamAccess;
begin
  if (FDataAccessor <> nil) then
  begin
    FDataAccessor.Enter();
  end;
end;

procedure TclCustomThreader.EndDataStreamAccess;
begin
  if (FDataAccessor <> nil) then
  begin
    FDataAccessor.Leave();
  end;
end;

procedure TclCustomThreader.SetURLParser(const Value: TclUrlParser);
begin
  FURLParser.Assign(Value);
end;

function TclCustomThreader.GetConnection: TclInternetConnection;
begin
  if (FConnection <> nil) then
  begin
    Result := FConnection;
  end else
  begin
    if (FSelfConnection = nil) then
    begin
      FSelfConnection := TclInternetConnection.Create(nil);
    end;
    Result := FSelfConnection;
  end;
end;

procedure TclCustomThreader.SetConnection(const Value: TclInternetConnection);
begin
  FConnection := Value;
  FSelfConnection.Free();
  FSelfConnection := nil;
end;

procedure TclCustomThreader.FreeObjectIfNeed(var AObject);
var
  Temp: TObject;
begin
  if not KeepConnection then
  begin
    Temp := TObject(AObject);
    Pointer(AObject) := nil;
    Temp.Free();
  end;
end;

type
  TclInternetConnectionAccess = class(TclInternetConnection);
  
procedure TclCustomThreader.Stop;
begin
  Terminate();
  SetEvent(FSleepEvent);
  DoStop();
end;

procedure TclCustomThreader.DoStop;
begin
  TclInternetConnectionAccess(Connection).Stop();
end;

function TclCustomThreader.GetOpenRequestFlags(ANeedCaching: Boolean): DWORD;
begin
  if ANeedCaching then
  begin
    Result := 0;
  end else
  begin
    Result := INTERNET_FLAG_NO_CACHE_WRITE;
  end;
  if KeepConnection then
  begin
    Result := Result or INTERNET_FLAG_KEEP_CONNECTION;
  end;
  if (URLParser.UrlType = utHTTPS) then
  begin
    Result := Result or INTERNET_FLAG_SECURE;
  end;
end;

procedure TclCustomThreader.DoTerminate;
begin
  if Assigned(OnTerminate) then
  begin
    InternalSynchronize(SyncTerminate);
  end;
end;

procedure TclCustomThreader.SyncTerminate;
begin
  if Assigned(OnTerminate) then
  begin
    OnTerminate(Self);
  end;
end;

procedure TclCustomThreader.SetHttpHeader(AResourceAction: TclInternetResourceAction);
const
  AcceptEncoding = 'Accept-Encoding: gzip, deflate';
var
  s: string;
  auth: TclHttpBasicAuthorization;
  authMethods: TStrings;
begin
  if (RequestHeader.Count > 0) then
  begin
    s := Trim(RequestHeader.Text);
    HttpAddRequestHeaders(AResourceAction.hResource, PChar(s), Length(s), HTTP_ADDREQ_FLAG_ADD_IF_NEW);
  end;

  if AllowCompression then
  begin
    HttpAddRequestHeaders(AResourceAction.hResource, AcceptEncoding,
      Length(AcceptEncoding), HTTP_ADDREQ_FLAG_ADD_IF_NEW);
  end;

  if (HttpProxySettings.AuthenticationType = atBasic)
    and ((HttpProxySettings.UserName <> '') or (HttpProxySettings.Password <> '')) then
  begin
    auth := nil;
    authMethods := nil;
    try
      auth := TclHttpBasicAuthorization.Create();
      authMethods := TStringList.Create();
      authMethods.Add('Basic');

      s := 'Proxy-Authorization: ' + auth.Authenticate(FURLParser, '',
        HttpProxySettings.UserName, HttpProxySettings.Password, authMethods, Self);
      HttpAddRequestHeaders(AResourceAction.hResource, PChar(s), Length(s), HTTP_ADDREQ_FLAG_ADD_IF_NEW);
    finally
      authMethods.Free();
      auth.Free();
    end;
  end;
end;

procedure TclCustomThreader.SetRequestHeader(const Value: TStrings);
begin
  FRequestHeader.Assign(Value);
end;

procedure TclCustomThreader.ServerAuthentication(AOpenRequest: TclHttpOpenRequestAction);
var
  p: PChar;
begin
  if (URLParser.User <> '') then
  begin
    p := PChar(URLParser.User);
    InternetSetOption(AOpenRequest.hResource, INTERNET_OPTION_USERNAME,
      p, Length(URLParser.User));
  end;

  if (URLParser.Password <> '') then
  begin
    p := PChar(URLParser.Password);
    InternetSetOption(AOpenRequest.hResource, INTERNET_OPTION_PASSWORD,
      p, Length(URLParser.Password));
  end;
end;

procedure TclCustomThreader.ProxyAuthentication(AOpenRequest: TclHttpOpenRequestAction);
var
  p: PChar;
begin
  if (HttpProxySettings.UserName <> '') then
  begin
    p := PChar(HttpProxySettings.UserName);
    InternetSetOption(AOpenRequest.hResource, INTERNET_OPTION_PROXY_USERNAME,
      p, Length(HttpProxySettings.UserName));
  end;

  if (HttpProxySettings.Password <> '') then
  begin
    p := PChar(HttpProxySettings.Password);
    InternetSetOption(AOpenRequest.hResource, INTERNET_OPTION_PROXY_PASSWORD,
      p, Length(HttpProxySettings.Password));
  end;
end;

procedure TclCustomThreader.SetFtpProxySettings(const Value: TclFtpProxySettings);
begin
  FFtpProxySettings.Assign(Value);
end;

procedure TclCustomThreader.SetHttpProxySettings(const Value: TclHttpProxySettings);
begin
  FHttpProxySettings.Assign(Value);
end;

{ TclDownLoadThreader }

constructor TclDownLoadThreader.Create(const AURL: string; ADataStream: TStream; AIsGetResourceInfo: Boolean);
begin
  inherited Create(AURL, ADataStream);
  FIsGetResourceInfo := AIsGetResourceInfo;
  FDataProceedSize := 0;
  FTotalDownloaded := 0;
end;

procedure TclDownLoadThreader.SetResourcePos(AResourceAction: TclInternetResourceAction);
var
  s: string;
begin
  if (FBytesToProceed > -1) then
  begin
    s := Format('Range: bytes=%d-%d', [ResourcePos, ResourcePos + FBytesToProceed]);
    HttpAddRequestHeaders(AResourceAction.hResource, PChar(s), Length(s), HTTP_ADDREQ_FLAG_ADD_IF_NEW);
  end else
  if (TempErrorCode <> 12152) then
  begin
    s := 'Range: bytes=0-';
    HttpAddRequestHeaders(AResourceAction.hResource, PChar(s), Length(s), HTTP_ADDREQ_FLAG_ADD_IF_NEW);
  end;
end;

procedure TclDownLoadThreader.Dump(AResourceAction: TclInternetResourceAction);
var
  BytesToRead: Integer;
  ReadFileAction: TclInternetReadFileAction;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Dump');{$ENDIF}
  if (DataStream <> nil) then
  begin
    BeginDataStreamAccess();
    try
      if (FBytesToProceed < 0) then
      begin
        DataStream.Position := 0;
      end;
    finally
      EndDataStreamAccess();
    end;
  end;
  ReadFileAction := nil;
  GetMem(FDataProceed, FBatchSize + 1);
  try
    ReadFileAction := TclInternetReadFileAction.Create(Connection, AResourceAction.Internet,
      AResourceAction.hResource, FDataProceed);
    repeat
      ZeroMemory(FDataProceed, FBatchSize + 1);
      if (FBytesToProceed > -1) and ((FBytesToProceed - FTotalDownloaded) < FBatchSize) then
      begin
        BytesToRead := (FBytesToProceed - FTotalDownloaded);
      end else
      begin
        BytesToRead := FBatchSize;
      end;
      ReadFileAction.dwNumberOfBytesToRead := BytesToRead;
      ReadFileAction.FireAction(GetNormTimeOut(TimeOut));
      FDataProceedSize := ReadFileAction.lpdwNumberOfBytesRead;
      if (FDataProceedSize = 0)
        or ((FBytesToProceed > -1) and (FTotalDownloaded >= FBytesToProceed)) then Break;
      if (DataStream <> nil) then
      begin
        BeginDataStreamAccess();
        try
          if (FBytesToProceed > -1) then
          begin
            DataStream.Position := ResourcePos;
          end;
          DataStream.Write(FDataProceed^, FDataProceedSize);
        finally
          EndDataStreamAccess();
        end;
      end;
      FTotalDownloaded := FTotalDownloaded + FDataProceedSize;
      ResourcePos := ResourcePos + FDataProceedSize;
      InternalSynchronize(SyncDoDataItemProceed);
    until (Terminated);
  finally
    ReadFileAction.Free();
    FreeMem(FDataProceed);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Dump'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Dump', E); raise; end; end;{$ENDIF}
end;

procedure TclDownLoadThreader.ProcessFTP(AConnect: TclConnectAction);
var
  OpenFileAction: TclFtpOpenFileAction;
begin
  inherited ProcessFTP(AConnect);
  if FIsGetResourceInfo or (FBytesToProceed = 0) then Exit;
  if Terminated then Exit;
  OpenFileAction := nil;
  try
    OpenFileAction := (Connection.GetActionByClass(TclFtpOpenFileAction) as TclFtpOpenFileAction);
    if (OpenFileAction = nil) then
    begin
      OpenFileAction := TclFtpOpenFileAction.Create(Connection, AConnect.Internet, AConnect.hResource,
        URLParser.Urlpath, GENERIC_READ, FTP_TRANSFER_TYPE_BINARY);
      OpenFileAction.FireAction(GetNormTimeOut(TimeOut));
    end;
    if Terminated then Exit;
    Dump(OpenFileAction);
  finally
    FreeObjectIfNeed(OpenFileAction);
  end;
end;

procedure TclDownLoadThreader.PrepareHeader;
var
  i: Integer;
begin
  for i := RequestHeader.Count - 1 downto 0 do
  begin
    if (system.Pos('content-', LowerCase(RequestHeader[i])) > 0) then
    begin
      RequestHeader.Delete(i);
    end;
  end;
end;

procedure TclDownLoadThreader.ProcessHTTP(AConnect: TclConnectAction);
var
  OpenRequestAction: TclHttpOpenRequestAction;
begin
  PrepareHeader();
  inherited ProcessHTTP(AConnect);
  if FIsGetResourceInfo or (FBytesToProceed = 0) then Exit;
  if Terminated then Exit;
  OpenRequestAction := nil;
  try
    OpenRequestAction := (Connection.GetActionByClass(TclHttpOpenRequestAction) as TclHttpOpenRequestAction);
    if (OpenRequestAction = nil) then
    begin
      OpenRequestAction := TclHttpOpenRequestAction.Create(Connection, AConnect.Internet, AConnect.hResource,
        'GET', URLParser.Urlpath + URLParser.Extra, '', '', nil, GetOpenRequestFlags(False));
      OpenRequestAction.FireAction(GetNormTimeOut(TimeOut));
    end;
    if Terminated then Exit;

    SetHttpHeader(OpenRequestAction);
    SetResourcePos(OpenRequestAction);
    SendRequest(OpenRequestAction);
    if Terminated then Exit;

    if DoNotGetResourceInfo then
    begin
      QueryHeadInfo(OpenRequestAction);
      QueryGetInfo(OpenRequestAction);
      InternalSynchronize(SyncDoGetResourceInfo);
    end;

    Dump(OpenRequestAction);
  finally
    FreeObjectIfNeed(OpenRequestAction);
  end;
end;

procedure TclDownLoadThreader.SyncDoDataItemProceed;
begin
  if Assigned(OnDataItemProceed) then
  begin
    OnDataItemProceed(Self, ResourceInfo, ResourcePos, FDataProceed, FDataProceedSize);
  end;
end;

{ TclUploadThreader }

constructor TclUploadThreader.Create(const AURL: string; ADataStream: TStream; AIsGetResourceInfo: Boolean);
begin
  inherited Create(AURL, ADataStream);
  FIsGetResourceInfo := AIsGetResourceInfo;
  FDataProceedSize := 0;
  FUploadedDataSize := 0;
  FDataProceed := nil;
  FRequestMethod := 'PUT';
end;

procedure TclUploadThreader.Dump(AResourceAction: TclInternetResourceAction);
var
  Uploaded: Integer;
  WriteFileAction: TclInternetWriteFileAction;
begin
  Dec(FRetryProceed);
  if (DataStream = nil) then Exit;
  Uploaded := 0;
  FUploadedDataSize := 0;
  WriteFileAction := nil;
  GetMem(FDataProceed, FBatchSize + 1);
  try
    WriteFileAction := TclInternetWriteFileAction.Create(Connection, AResourceAction.Internet,
      AResourceAction.hResource);
    while (not Terminated) and (Uploaded < DataStream.Size) do
    begin
      BeginDataStreamAccess();
      try
        DataStream.Position := Uploaded;
        FDataProceedSize := DataStream.Read(FDataProceed^, FBatchSize);
      finally
        EndDataStreamAccess();
      end;
      WriteFileAction.lpBuffer := FDataProceed;
      WriteFileAction.dwNumberOfBytesToWrite := FDataProceedSize;
      WriteFileAction.FireAction(GetNormTimeOut(TimeOut));
      Uploaded := Uploaded + FDataProceedSize; 
      FUploadedDataSize := FUploadedDataSize + FDataProceedSize;
      InternalSynchronize(SyncDoDataItemProceed);
    end;
  finally
    WriteFileAction.Free();
    FreeMem(FDataProceed);
  end;
end;

type
  TclRequestParameters = class(TObject)
    FSendRequestAction: TclHttpSendRequestExAction;
    FEndRequestAction: TclHttpEndRequestAction;
    FOpenRequest: TclHttpOpenRequestAction;
  end;

procedure TclUploadThreader.RequestOperation(AParameters: TObject);
var
  RequestParameters: TclRequestParameters;
begin
  RequestParameters := (AParameters as TclRequestParameters);
  RequestParameters.FSendRequestAction.FireAction(GetNormTimeOut(TimeOut));
  if Terminated then Exit;
  Dump(RequestParameters.FOpenRequest);
  if Terminated then Exit;
  RequestParameters.FEndRequestAction.FireAction(GetNormTimeOut(TimeOut));
end;

procedure TclUploadThreader.ProcessRequest(AOpenRequest: TclHttpOpenRequestAction;
  const AHeader: string; ADataSize: Integer);
var
  RequestParameters: TclRequestParameters;
  SendRequestAction: TclHttpSendRequestExAction;
  EndRequestAction: TclHttpEndRequestAction;
  bufin: INTERNET_BUFFERS;
begin
  ZeroMemory(@bufin, SizeOf(bufin));
  if (AHeader <> '') then
  begin
    bufin.lpcszHeader := PChar(AHeader);
    bufin.dwHeadersLength := Length(AHeader);
  end;
  bufin.dwStructSize := SizeOf(bufin);
  bufin.dwBufferTotal := ADataSize;
  SendRequestAction := nil;
  EndRequestAction := nil;
  RequestParameters := nil;
  try
    SendRequestAction := TclHttpSendRequestExAction.Create(Connection, AOpenRequest.Internet,
      AOpenRequest.hResource, @bufin, nil, HSR_INITIATE);
    EndRequestAction := TclHttpEndRequestAction.Create(Connection, AOpenRequest.Internet,
      AOpenRequest.hResource, nil, HSR_INITIATE);
    RequestParameters := TclRequestParameters.Create();
    RequestParameters.FSendRequestAction := SendRequestAction;
    RequestParameters.FEndRequestAction := EndRequestAction;
    RequestParameters.FOpenRequest := AOpenRequest;
    PerformRequestOperation(AOpenRequest, RequestOperation, RequestParameters);
  finally
    RequestParameters.Free();
    EndRequestAction.Free();
    SendRequestAction.Free();
  end;
end;

procedure TclUploadThreader.GetResourceInfoByDataStream();
begin
  ClearInfo();
  if (DataStream = nil) then
  begin
    raise EclInternetError.Create(cDataStreamAbsent, -1);
  end;
  if (FResourceInfo = nil) then
  begin
    AssignIfNeedResourceInfo();
    TclResourceInfoAccess(ResourceInfo).SetSize(DataStream.Size);
    TclResourceInfoAccess(ResourceInfo).SetName('');
  end;
end;

procedure TclUploadThreader.ProcessHTTP(AConnect: TclConnectAction);
var
  i: Integer;
  OpenRequestAction: TclHttpOpenRequestAction;
begin
  FRetryCount := GetRetryCount();
  FRetryProceed := FRetryCount + 1;

  if (not FIsGetResourceInfo) then
  begin
    GetResourceInfoByDataStream();
    OpenRequestAction := nil;
    try
      OpenRequestAction := (Connection.GetActionByClass(TclHttpOpenRequestAction) as TclHttpOpenRequestAction);
      if (OpenRequestAction = nil) then
      begin
        OpenRequestAction := TclHttpOpenRequestAction.Create(Connection, AConnect.Internet, AConnect.hResource,
          RequestMethod, URLParser.Urlpath + URLParser.Extra, '', '', nil, GetOpenRequestFlags(False));
        OpenRequestAction.FireAction(GetNormTimeOut(TimeOut));
      end;
      if Terminated then Exit;
      if (ResourceInfo <> nil) then
      begin
        SetHttpHeader(OpenRequestAction);
        i := 0;
        while (i < 4) do
        begin
          Inc(i);
          if UseSimpleRequest then
          begin
            ProcessSimpleRequest(OpenRequestAction, '', DataStream);
          end else
          begin
            ProcessRequest(OpenRequestAction, '', ResourceInfo.Size);
          end;
          try
            GetHttpStatusCode(OpenRequestAction);
            Break;
          except
            if (ResourceInfo.StatusCode = 401) then
            begin
              if UseInternetErrorDialog then
              begin
                SetCertOptions(OpenRequestAction, 0);
              end else
              if (i < 4) then
              begin
                ServerAuthentication(OpenRequestAction);
              end else
              begin
                raise;
              end;
            end else
            if (ResourceInfo.StatusCode = 407) then
            begin
              if UseInternetErrorDialog then
              begin
                SetCertOptions(OpenRequestAction, 0);
              end else
              if (HttpProxySettings.AuthenticationType = atAutoDetect) then
              begin
                ProxyAuthentication(OpenRequestAction);
              end else
              begin
                raise;
              end;
            end else
            begin
              raise;
            end;
          end;
          if Terminated then Exit;
        end;
        if (FRetryCount > 0) then
        begin
          FRetryCount := 0;
          SyncDoDataItemProceed();
        end;
      end;
      GetHttpResponse(OpenRequestAction);
    finally
      FreeObjectIfNeed(OpenRequestAction);
    end;
  end;
  if SameText(RequestMethod, 'PUT') then
  begin
    inherited ProcessHTTP(AConnect);
  end;
end;

procedure TclUploadThreader.ProcessFTP(AConnect: TclConnectAction);
var
  OpenFileAction: TclFtpOpenFileAction;
begin
  FRetryCount := 0;
  FRetryProceed := 0;

  if (not FIsGetResourceInfo) then
  begin
    GetResourceInfoByDataStream();
    OpenFileAction := nil;
    try
      if FForceRemoteDir then
      begin
        ForceRemoteDirectory(AConnect);
      end;
      if Terminated then Exit;
      OpenFileAction := (Connection.GetActionByClass(TclFtpOpenFileAction) as TclFtpOpenFileAction);
      if (OpenFileAction = nil) then
      begin
        OpenFileAction := TclFtpOpenFileAction.Create(Connection, AConnect.Internet, AConnect.hResource,
          URLParser.Urlpath, GENERIC_WRITE, FTP_TRANSFER_TYPE_BINARY);
        OpenFileAction.FireAction(GetNormTimeOut(TimeOut));
      end;
      if Terminated then Exit;
      Dump(OpenFileAction);
    finally
      FreeObjectIfNeed(OpenFileAction);
    end;
  end;
  inherited ProcessFTP(AConnect);
end;

procedure TclUploadThreader.SyncDoDataItemProceed;
var
  uploaded: Integer;
begin
  if Assigned(OnDataItemProceed) then
  begin
    if FRetryCount > 0 then
    begin
      uploaded := FUploadedDataSize div FRetryCount;
      uploaded := (BytesToProceed div FRetryCount) * (FRetryCount - FRetryProceed) + uploaded;
    end else
    begin
      uploaded := FUploadedDataSize;
    end;
    OnDataItemProceed(Self, ResourceInfo, uploaded, FDataProceed, FDataProceedSize);
  end;
end;

procedure TclUploadThreader.GetHttpResponse(AOpenRequest: TclHttpOpenRequestAction);
var
  dwDownloaded: DWORD;
  buf: PChar;
  ReadFileAction: TclInternetReadFileAction;
begin
  if (HttpResponse = nil) or Terminated then Exit;
  ReadFileAction := nil;
  GetMem(buf, FBatchSize);
  try
    ReadFileAction := TclInternetReadFileAction.Create(Connection, AOpenRequest.Internet,
      AOpenRequest.hResource, buf);
    repeat
      ZeroMemory(buf, FBatchSize);
      ReadFileAction.dwNumberOfBytesToRead := FBatchSize;
      ReadFileAction.FireAction(GetNormTimeOut(TimeOut));
      dwDownloaded := ReadFileAction.lpdwNumberOfBytesRead;
      if (dwDownloaded = 0) then Break;
      BeginDataStreamAccess();
      try
        HttpResponse.Write(buf^, dwDownloaded);
      finally
        EndDataStreamAccess();
      end;
    until (Terminated);
  finally
    ReadFileAction.Free();
    FreeMem(buf);
  end;
end;

procedure TclUploadThreader.ForceRemoteDirectory(AConnect: TclConnectAction);
  function ExtractFtpFilePath(const AFileName: string): string;
  var
    i: Integer;
  begin
    i := LastDelimiter('/', AFileName);
    Result := Copy(AFileName, 1, i);
  end;

  function IsFtpPathDelimiter(const S: string; Index: Integer): Boolean;
  begin
    Result := (Index > 0) and (Index <= Length(S)) and (S[Index] = '/')
      and (ByteType(S, Index) = mbSingleByte);
  end;

  function ExcludeTrailingFtpBackslash(const S: string): string;
  begin
    Result := S;
    if IsFtpPathDelimiter(Result, Length(Result)) then
      SetLength(Result, Length(Result)-1);
  end;

  function FtpDirectoryExists(const Name: string): Boolean;
  var
    Action: TclFtpFindFirstFileAction;
  begin
    Action := TclFtpFindFirstFileAction.Create(Connection, AConnect.Internet,
      AConnect.hResource, PChar(Name), INTERNET_FLAG_RELOAD);
    try
      Result := Action.FireAction(GetNormTimeOut(TimeOut), True);
    except
      Result := False;
    end;
    Action.Free();
  end;

  function CreateFtpDir(const Dir: string): Boolean;
  var
    Action: TclFtpCreateDirectoryAction;
  begin
    Action := TclFtpCreateDirectoryAction.Create(Connection, AConnect.Internet, AConnect.hResource, Dir);
    try
      Result := Action.FireAction(GetNormTimeOut(TimeOut), True);
    except
      Result := False;
    end;
    Action.Free();
  end;

  function ForceDirs(Dir: String): Boolean;
  begin
    Result := True;
    if Length(Dir) = 0 then Exit;
    Dir := ExcludeTrailingFtpBackslash(Dir);
    if (Length(Dir) < 1) or FtpDirectoryExists(Dir)
      or (ExtractFtpFilePath(Dir) = Dir) then Exit;
    Result := ForceDirs(ExtractFtpFilePath(Dir)) and CreateFtpDir(Dir);
  end;
  
begin
  ForceDirs(ExtractFtpFilePath(URLParser.Urlpath));
end;

procedure TclUploadThreader.ProcessSimpleRequest(
  AOpenRequest: TclHttpOpenRequestAction; const AHeader: string;
  AData: TStream);
var
  SendRequestAction: TclHttpSendRequestAction;
begin
  FDataProceed := nil;
  SendRequestAction := nil;
  try
    FUploadedDataSize := AData.Size;
    FDataProceedSize := FUploadedDataSize;
    GetMem(FDataProceed, FDataProceedSize + 1);
    ZeroMemory(FDataProceed, FDataProceedSize + 1);
    BeginDataStreamAccess();
    try
      AData.Position := 0;
      AData.Read(FDataProceed^, FDataProceedSize);
    finally
      EndDataStreamAccess();
    end;
    SendRequestAction := TclHttpSendRequestAction.Create(Connection, AOpenRequest.Internet,
      AOpenRequest.hResource, AHeader, FDataProceed, FDataProceedSize);
    PerformRequestOperation(AOpenRequest, SimpleRequestOperation, SendRequestAction);
  finally
    FreeMem(FDataProceed);
    SendRequestAction.Free();
  end;
end;

procedure TclUploadThreader.SimpleRequestOperation(AParameters: TObject);
begin
  (AParameters as TclHttpSendRequestAction).FireAction(GetNormTimeOut(TimeOut));
  InternalSynchronize(SyncDoDataItemProceed);
end;

function TclUploadThreader.GetRetryCount: Integer;
begin
  Result := 0;
  if (not PutOptimization) then
  begin
    Exit;
  end;
  if (URLParser.User <> '') and (URLParser.Password <> '') then
  begin
    Inc(Result);
  end;
  if (HttpProxySettings.UserName <> '') and (HttpProxySettings.Password <> '') then
  begin
    Inc(Result);
  end;
  if (URLParser.UrlType = utHTTPS) then
  begin
    Inc(Result);
  end;
  Inc(Result);
end;

{ TclDeleteThreader }

constructor TclDeleteThreader.Create(const AURL: string);
begin
  inherited Create(AURL, nil);
end;

procedure TclDeleteThreader.ProcessFTP(AConnect: TclConnectAction);
var
  b: Boolean;
begin
  if (URLParser.Urlpath <> '') and (URLParser.Urlpath[Length(URLParser.Urlpath)] = '/') then
  begin
    b := FtpRemoveDirectory(AConnect.hResource, PChar(URLParser.Urlpath));
  end else
  begin
    b := FtpDeleteFile(AConnect.hResource, PChar(URLParser.Urlpath));
  end;
  if not b then
  begin
    raise EclInternetError.CreateByLastError();
  end;
end;

procedure TclDeleteThreader.ProcessHTTP(AConnect: TclConnectAction);
var
  OpenRequestAction: TclHttpOpenRequestAction;
begin
  OpenRequestAction := nil;
  try
    OpenRequestAction := (Connection.GetActionByClass(TclHttpOpenRequestAction) as TclHttpOpenRequestAction);
    if (OpenRequestAction = nil) then
    begin
      OpenRequestAction := TclHttpOpenRequestAction.Create(Connection, AConnect.Internet,
        AConnect.hResource, 'DELETE', URLParser.Urlpath + URLParser.Extra, '', '', nil, GetOpenRequestFlags(False));
      OpenRequestAction.FireAction(GetNormTimeOut(TimeOut));
    end;
    if Terminated then Exit;

    SetHttpHeader(OpenRequestAction);
    SendRequest(OpenRequestAction);
  finally
    FreeObjectIfNeed(OpenRequestAction);
  end;
end;

end.

