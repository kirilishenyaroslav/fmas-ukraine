{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clHttp;

interface

{$I clVer.inc}

uses
  Classes, clTcpClient, clSocket, clHttpUtils, clUriUtils, clCookies, clHttpHeader,
  clHttpRequest, clHttpAuth, clSspi;

type
  EclHttpError = class(EclSocketError)
  private
    FResponseText: string;
  public
    constructor Create(const AErrorMsg: string; AErrorCode: Integer; const AResponseText: string);
    property ResponseText: string read FResponseText;
  end;

  TclHttpRequestEvent = procedure (Sender: TObject; const AMethod, AUrl: string;
    ARequestHeader: TStrings) of object;

  TclHttpResponseEvent = procedure (Sender: TObject; const AMethod, AUrl: string;
    AResponseHeader: TStrings; ACookies: TclCookieList) of object;

  TclHttpRedirectEvent = procedure (Sender: TObject; ARequestHeader: TStrings;
    AStatusCode: Integer; AResponseHeader: TclHttpResponseHeader; AResponseText: TStrings;
    var AMethod: string; var CanRedirect, Handled: Boolean) of object;

  TclHttpAuthenticateEvent = procedure (Sender: TObject; AUrl: TclUrlParser; const AMethod,
    AUserName, APassword: string; AuthChallenge: TStrings; var AuthorizationValue: string) of object;

  TclHttpTunnelStatus = (htNone, htConnect, htTunnel);

  TclCustomHttp = class(TclTcpClient)
  private
    FUrl: TclUrlParser;
    FHttpVersion: TclHttpVersion;
    FUserName: string;
    FPassword: string;
    FStatusCode: Integer;
    FUserAgent: string;
    FAuthenticationType: TclAuthenticationType;
    FKeepConnection: Boolean;
    FAllowCaching: Boolean;
    FAllowRedirects: Boolean;
    FProxySettings: TclHttpProxySettings;
    FMaxRedirects: Integer;
    FMaxAuthRetries: Integer;
    FAllowCookies: Boolean;
    FCookies: TclCookieList;
    FAllowCompression: Boolean;
    FRequest: TclHttpRequest;
    FResponseHeader: TclHttpResponseHeader;
    FMethod: string;
    FResponseVersion: TclHttpVersion;
    FOldProxyServer: string;
    FOldProxyPort: Integer;
    FProgressHandled: Boolean;
    FOnSendRequest: TclHttpRequestEvent;
    FOnReceiveResponse: TclHttpResponseEvent;
    FOnRedirect: TclHttpRedirectEvent;
    FOnAuthenticate: TclHttpAuthenticateEvent;
    FOnSendProgress: TclSocketProgressEvent;
    FOnReceiveProgress: TclSocketProgressEvent;

    procedure SetHttpVersion(const Value: TclHttpVersion);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    procedure InitConnection(ATunnelStatus: TclHttpTunnelStatus);
    procedure PrepareRequestHeader(ATunnelStatus: TclHttpTunnelStatus; ARequestHeader: TStrings; ARequestBody: TStream);
    procedure WriteRequestHeader(ATunnelStatus: TclHttpTunnelStatus;
      ARequestHeader: TStrings; ARequestBody: TStream);
    procedure WriteRequestData(ARequestBody: TStream);
    procedure ReadResponseBody(AResponseHeader: TStrings;
      AExtraSize: Integer; AExtraData, AResponseBody: TStream);
    procedure ReadResponseHeader(AResponseHeader: TStrings; ARawData: TMemoryStream);
    function GetResponseLength: Integer;
    function GetKeepAlive: Boolean;
    function GetTunnelStatus: TclHttpTunnelStatus;
    function ExtractStatusCode(AData: PChar; ADataPos, ADataSize: Integer): Integer;
    function ExtractResponseVersion(AData: PChar; ADataPos, ADataSize: Integer): TclHttpVersion;
    function BasicAuthenticate(const AUserName, APassword, AuthorizationField: string;
      ARequestHeader: TStrings): Boolean;
    function Authenticate(const AUserName, APassword, AuthorizationField: string;
      AuthChallenge, ARequestHeader: TStrings): Boolean;
    function Redirect(ARequestHeader, AResponseText: TStrings;
      var AMethod: string): Boolean;
    procedure RaiseHttpError(AStatusCode: Integer; AResponseHeader, AResponseText: TStrings);
    procedure ReadResponseText(AResponseHeader: TStrings;
      AExtraSize: Integer; AExtraData: TStream; AResponseText: TStrings);
    procedure RemoveHeaderTrailer(AHeader: TStrings);
    procedure RemoveRequestLine(AHeader: TStrings);
    procedure SetUserAgent(const Value: string);
    procedure SetAuthenticationType(const Value: TclAuthenticationType);
    procedure SetAllowCaching(const Value: Boolean);
    procedure SetKeepConnection(const Value: Boolean);
    procedure SetAllowRedirects(const Value: Boolean);
    procedure SetProxySettings(const Value: TclHttpProxySettings);
    procedure SetMaxAuthRetries(const Value: Integer);
    procedure SetMaxRedirects(const Value: Integer);
    procedure SetAllowCookies(const Value: Boolean);
    procedure SetAllowCompression(const Value: Boolean);
    procedure SetCookies(const Value: TclCookieList);
    function IsUseProxy: Boolean;
    procedure ReadCookies(AResponseHeader: TStrings);
    procedure SetRequest(const Value: TclHttpRequest);
    procedure DoDataSendProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
    procedure DoDataReceiveProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
    function GetUserName: string;
    function GetPassword: string;
    procedure SetAuthorizationField(const AFieldName, AFieldValue: string; ARequestHeader: TStrings);
    function GetResourcePath: string;
    procedure InternalSendRequest(const AMethod: string; ARequestHeader: TStrings;
      ARequestBody: TStream; AResponseHeader: TStrings; AResponseBody: TStream);
    procedure InitProgress(ABytesProceed, ATotalBytes: Integer);
    procedure ConnectProxy;
  protected
    function GetRedirectMethod(AStatusCode: Integer; const AMethod: string): string; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure DoDestroy; override;
    function GetDefaultPort: Integer; override;
    procedure OpenConnection(const AServer: string; APort: Integer); override;
    procedure DoSendRequest(const AMethod, AUrl: string; ARequestHeader: TStrings); dynamic;
    procedure DoReceiveResponse(const AMethod, AUrl: string;
      AResponseHeader: TStrings; ACookies: TclCookieList); dynamic;
    procedure DoSendProgress(ABytesProceed, ATotalBytes: Integer); dynamic;
    procedure DoReceiveProgress(ABytesProceed, ATotalBytes: Integer); dynamic;
    procedure DoRedirect(ARequestHeader: TStrings; AStatusCode: Integer;
      AResponseHeader: TclHttpResponseHeader; AResponseText: TStrings;
      var AMethod: string; var CanRedirect, Handled: Boolean); dynamic;
    procedure DoAuthenticate(AUrl: TclUrlParser; const AMethod, AUserName, APassword: string;
      AuthChallenge: TStrings; var AuthorizationValue: string); dynamic;

    property HttpVersion: TclHttpVersion read FHttpVersion write SetHttpVersion default hvHttp1_1;
    property UserName: string read FUserName write SetUserName;
    property Password: string read FPassword write SetPassword;
    property AuthenticationType: TclAuthenticationType read FAuthenticationType
      write SetAuthenticationType default atAutoDetect;
    property UserAgent: string read FUserAgent write SetUserAgent;
    property KeepConnection: Boolean read FKeepConnection write SetKeepConnection default True;
    property AllowCaching: Boolean read FAllowCaching write SetAllowCaching default True;
    property AllowRedirects: Boolean read FAllowRedirects write SetAllowRedirects default True;
    property AllowCookies: Boolean read FAllowCookies write SetAllowCookies default True;
    property AllowCompression: Boolean read FAllowCompression write SetAllowCompression default True;
    property ProxySettings: TclHttpProxySettings read FProxySettings write SetProxySettings;
    property MaxRedirects: Integer read FMaxRedirects write SetMaxRedirects default 15;
    property MaxAuthRetries: Integer read FMaxAuthRetries write SetMaxAuthRetries default 15;
    property Cookies: TclCookieList read FCookies write SetCookies;
    property Request: TclHttpRequest read FRequest write SetRequest;

    property OnSendRequest: TclHttpRequestEvent read FOnSendRequest write FOnSendRequest;
    property OnReceiveResponse: TclHttpResponseEvent read FOnReceiveResponse write FOnReceiveResponse;
    property OnSendProgress: TclSocketProgressEvent read FOnSendProgress write FOnSendProgress;
    property OnReceiveProgress: TclSocketProgressEvent read FOnReceiveProgress write FOnReceiveProgress;
    property OnRedirect: TclHttpRedirectEvent read FOnRedirect write FOnRedirect;
    property OnAuthenticate: TclHttpAuthenticateEvent read FOnAuthenticate write FOnAuthenticate;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SendRequest(const AMethod, AUrl: string; ARequestHeader: TStrings;
      ARequestBody: TStream; AResponseHeader: TStrings; AResponseBody: TStream); overload;
    procedure SendRequest(const AMethod, AUrl: string;
      ARequest: TclHttpRequest; AResponseHeader: TStrings; AResponseBody: TStream); overload;
    procedure Get(const AUrl: string; ADestination: TStream); overload;                                
    procedure Get(const AUrl: string; ADestination: TStrings); overload;                                
    procedure Head(const AUrl: string);
    procedure Put(const AUrl: string; ASource: TStream); overload;
    procedure Put(const AUrl: string; ASource, AResponseBody: TStream); overload;
    procedure Put(const AUrl: string; ASource: TStream; AResponseBody: TStrings); overload;
    procedure Post(const AUrl: string; AResponseBody: TStream); overload;
    procedure Post(const AUrl: string; AResponseBody: TStrings); overload;
    procedure Post(const AUrl: string; ARequest: TclHttpRequest; AResponseBody: TStream); overload;
    procedure Delete(const AUrl: string); virtual;

    property Url: TclUrlParser read FUrl;
    property StatusCode: Integer read FStatusCode;
    property ResponseVersion: TclHttpVersion read FResponseVersion;
    property ResponseHeader: TclHttpResponseHeader read FResponseHeader;
  end;

  TclHttp = class(TclCustomHttp)
  published
    property HttpVersion;
    property UserAgent;
    property KeepConnection;
    property AllowCaching;
    property AllowRedirects;
    property AllowCookies;
    property AllowCompression;
    property ProxySettings;
    property MaxRedirects;
    property MaxAuthRetries;
    property Cookies;
    property Request;
    property BatchSize;
    property UserName;
    property Password;
    property AuthenticationType;
    property Server;
    property Port default cDefaultHttpPort;
    property TimeOut;
    property CertificateFlags;
    property TLSFlags default [tfUseSSL2, tfUseSSL3];
    property BitsPerSec;
    property OnChanged;
    property OnOpen;
    property OnClose;
    property OnGetCertificate;
    property OnVerifyServer;
    property OnSendRequest;
    property OnReceiveResponse;
    property OnSendProgress;
    property OnReceiveProgress;
    property OnRedirect;
    property OnAuthenticate;
  end;

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsHttpDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}
  
implementation


uses
  Windows, SysUtils, clUtils, clStreams, contnrs, WinSock,
  clZLibStreams{$IFDEF DEMO}, Forms, clEncoder, clCert, clHtmlParser{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

const
  httpVersions: array[TclHttpVersion] of string = ('HTTP/1.0', 'HTTP/1.1');
  
{ TclCustomHttp }

constructor TclCustomHttp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
  FResponseHeader := TclHttpResponseHeader.Create();
  FCookies := TclCookieList.Create(Self, TclCookieItem);
  FProxySettings := TclHttpProxySettings.Create();
  FUrl := TclUrlParser.Create();
  Port := cDefaultHttpPort;
  TLSFlags := [tfUseSSL2, tfUseSSL3];
  FHttpVersion := hvHttp1_1;
  FAuthenticationType := atAutoDetect;
  FUserAgent := cInternetAgent;
  FKeepConnection := True;
  FAllowCaching := True;
  FAllowRedirects := True;
  FAllowCookies := True;
  FAllowCompression := True;
  FMaxRedirects := 15;
  FMaxAuthRetries := 15;
end;

procedure TclCustomHttp.DoDestroy;
begin
  FUrl.Free();
  FProxySettings.Free();
  FCookies.Free();
  FResponseHeader.Free();
  inherited DoDestroy();
end;

procedure TclCustomHttp.ConnectProxy;
var
  reqHdr, respHdr: TStrings;
  request, response: TStream;
  oldCompression: Boolean;
  oldCookies: Boolean;
  oldVersion: TclHttpVersion;
  oldMethod: string;
begin
  reqHdr := TStringList.Create();
  respHdr := TStringList.Create();
  request := TclNullStream.Create();
  response := TclNullStream.Create();
  oldCompression := AllowCompression;
  oldCookies := AllowCookies;
  oldVersion := HttpVersion;
  oldMethod := FMethod;
  try
    HttpVersion := hvHttp1_0;
    KeepConnection := True;
    AllowCompression := False;
    AllowCaching := False;
    AllowCookies := False;

    InternalSendRequest('CONNECT', reqHdr, request, respHdr, response);
  finally
    FMethod := oldMethod;
    HttpVersion := oldVersion;
    AllowCookies := oldCookies;
    AllowCompression := oldCompression;
    response.Free();
    request.Free();
    respHdr.Free();
    reqHdr.Free();
  end;
end;

procedure TclCustomHttp.InitConnection(ATunnelStatus: TclHttpTunnelStatus);
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' +
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end else
{$ENDIF}
  begin
{$IFNDEF IDEDEMO}
    if (not IsHttpDemoDisplayed) and (not IsHttpRequestDemoDisplayed)
      and (not IsEncoderDemoDisplayed) and (not IsCertDemoDisplayed)
      and (not IsHtmlDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpDemoDisplayed := True;
    IsHttpRequestDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsHtmlDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InitConnection');{$ENDIF}

  if IsUseProxy() then
  begin
    if (FOldProxyServer <> ProxySettings.Server) or (FOldProxyPort <> ProxySettings.Port) then
    begin
      Close();
    end;

    FOldProxyServer := ProxySettings.Server;
    FOldProxyPort := ProxySettings.Port;
  end;

  if (Url.Host <> '') and (Url.Host <> '*') then
  begin
    if (Server <> Url.Host) or (Port <> Url.Port) then
    begin
      Close();
    end;

    Server := Url.Host;
    Port := Url.Port;
  end;

  if IsUseProxy() then
  begin
    if (Url.UrlType = utHTTPS) and (ATunnelStatus <> htConnect) then
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InitConnection ConnectProxy');{$ENDIF}
      ConnectProxy();
      StartTls();
    end else
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InitConnection TunnelProxy');{$ENDIF}
      UseTLS := ctNone;
    end;
  end else
  begin
    if (Url.UrlType = utHTTPS) then
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InitConnection HTTPS');{$ENDIF}
      UseTLS := ctImplicit;
    end else
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InitConnection HTTP');{$ENDIF}
      UseTLS := ctNone;
    end;
  end;

  Open();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InitConnection'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InitConnection', E); raise; end; end;{$ENDIF}
end;

procedure TclCustomHttp.PrepareRequestHeader(ATunnelStatus: TclHttpTunnelStatus;
  ARequestHeader: TStrings; ARequestBody: TStream);

  function GetPortIfNeed(APort: Integer): string;
  begin
    if (APort <> 80) and (APort <> 443) then
    begin
      Result := Format(':%d', [APort]);
    end else
    begin
      Result := '';
    end;
  end;

const
  cacheFields: array[TclHttpVersion] of string = ('Pragma', 'Cache-Control');
  connFields: array[Boolean] of string = ('Connection', 'Proxy-Connection');
var
  fieldList: TStrings;
  path, host, contentLength: string;
begin
  RemoveRequestLine(ARequestHeader);
  RemoveHeaderTrailer(ARequestHeader);

  if IsUseProxy() then
  begin
    case ATunnelStatus of
      htConnect: path := Format('%s:%d', [Url.Host, Url.Port]);
      htTunnel: path := Url.AbsolutePath;
    else
      path := Url.ParsedUrl;
    end;
  end else
  begin
    path := Url.AbsolutePath;
  end;
  if (path = '') then
  begin
    path := '/';
  end;
  ARequestHeader.Insert(0, Format('%s %s %s', [FMethod, path, httpVersions[HttpVersion]]));

  fieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, ARequestHeader, fieldList);
    RemoveHeaderField(ARequestHeader, fieldList, 'Host');
    fieldList.Clear();
    GetHeaderFieldList(0, ARequestHeader, fieldList);

    if AllowCompression and (GetHeaderFieldValue(ARequestHeader, fieldList, 'Accept-Encoding') = '') then
    begin
      AddHeaderField(ARequestHeader, 'Accept-Encoding', 'gzip, deflate');
    end;

    if (Url.Host <> '') then
    begin
      host := Url.Host + GetPortIfNeed(Url.Port);
    end else
    begin
      host := Server + GetPortIfNeed(Port);
    end;
    AddHeaderField(ARequestHeader, 'Host', host);

    if (GetHeaderFieldValue(ARequestHeader, fieldList, 'User-Agent') = '') then
    begin
      AddHeaderField(ARequestHeader, 'User-Agent', UserAgent);
    end;

    contentLength := GetHeaderFieldValue(ARequestHeader, fieldList, 'Content-Length');
    if (StrToIntDef(contentLength, 0) > 0) and (ARequestBody.Size = 0) then
    begin
      RemoveHeaderField(ARequestHeader, fieldList, 'Content-Length');
      fieldList.Clear();
      GetHeaderFieldList(0, ARequestHeader, fieldList);

      RemoveHeaderField(ARequestHeader, fieldList, 'Content-Type');
      fieldList.Clear();
      GetHeaderFieldList(0, ARequestHeader, fieldList);
    end else
    if (contentLength = '') and ((ATunnelStatus = htConnect) or (ARequestBody.Size > 0)) then
    begin
      AddHeaderField(ARequestHeader, 'Content-Length', IntToStr(ARequestBody.Size));
    end;

    if not AllowCaching
      and (GetHeaderFieldValue(ARequestHeader, fieldList, cacheFields[HttpVersion]) = '') then
    begin
      AddHeaderField(ARequestHeader, cacheFields[HttpVersion], 'no-cache');
    end;

    if KeepConnection then
    begin
      if (GetHeaderFieldValue(ARequestHeader, fieldList, connFields[IsUseProxy()]) = '') then
      begin
        AddHeaderField(ARequestHeader, connFields[IsUseProxy()], 'Keep-Alive');
      end;
    end;

    if AllowCookies then
    begin
      Cookies.SetRequestCookies(ARequestHeader);
    end;

    ARequestHeader.Add('');
  finally
    fieldList.Free();
  end;
end;

function TclCustomHttp.GetTunnelStatus: TclHttpTunnelStatus;
begin
  if IsUseProxy() and (Url.UrlType = utHTTPS) then
  begin
    if SameText('CONNECT', FMethod) then
    begin
      Result := htConnect;
    end else
    begin
      Result := htTunnel;
    end;
  end else
  begin
    Result := htNone;
  end;
end;

procedure TclCustomHttp.WriteRequestHeader(ATunnelStatus: TclHttpTunnelStatus;
  ARequestHeader: TStrings; ARequestBody: TStream);
var
  wasActive: Boolean;
begin
  wasActive := Active;
  InitConnection(ATunnelStatus);

  PrepareRequestHeader(ATunnelStatus, ARequestHeader, ARequestBody);
  try
    Connection.WriteString(ARequestHeader.Text);
  except
    on E: EclSocketError do
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'WriteRequestHeader wasActive: %d, E.ErrorCode: %d', nil, [Integer(wasActive), E.ErrorCode]);{$ENDIF}
      if (not wasActive) or (E.ErrorCode <> 10053) then raise;

      Close();
      Open();
      Connection.WriteString(ARequestHeader.Text);
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'WriteRequestHeader sent again');{$ENDIF}
    end;
  end;
end;

procedure TclCustomHttp.WriteRequestData(ARequestBody: TStream);
begin
  if (ARequestBody.Size > 0) then
  begin
    InitProgress(ARequestBody.Position, ARequestBody.Size);
    Connection.OnProgress := DoDataSendProgress;
    try
      Connection.WriteData(ARequestBody);
      if not FProgressHandled then
      begin
        DoSendProgress(ARequestBody.Size, ARequestBody.Size);
      end;
    finally
      Connection.OnProgress := nil;
    end;
  end;
end;

function TclCustomHttp.ExtractStatusCode(AData: PChar; ADataPos, ADataSize: Integer): Integer;
var
  ind: Integer;
  s: string;
begin
  Result := 0;
  ind := GetBinTextPos(#32, AData, ADataPos, ADataSize);
  if (ind > -1) then
  begin
    s := system.Copy(AData, ind + 2, 3);
    Result := StrToIntDef(s, 0);
  end;
end;

function TclCustomHttp.ExtractResponseVersion(AData: PChar; ADataPos, ADataSize: Integer): TclHttpVersion;
var
  ind: Integer;
  s: string;
begin
  Result := HttpVersion;
  ind := GetBinTextPos(#32, AData, ADataPos, ADataSize);
  if (ind > -1) then
  begin
    s := Trim(UpperCase(system.Copy(AData, 1, ind)));
    for Result := Low(TclHttpVersion) to High(TclHttpVersion) do
    begin
      if (httpVersions[Result] = s) then
      begin
        Exit;
      end;
    end;
    Result := HttpVersion;
  end;
end;

procedure TclCustomHttp.ReadResponseHeader(AResponseHeader: TStrings; ARawData: TMemoryStream);

  procedure LoadTextFromStream(AStream: TStream; ACount: Integer; AList: TStrings);
  var
    s: string;
  begin
    SetString(s, nil, ACount);
    AStream.Read(Pointer(s)^, ACount);
    AList.Text := s;
  end;

const
  EndOfHeader = #13#10#13#10;
  
var
  ind, hdrStart: Integer;
begin
  ARawData.Clear();
  hdrStart := 0;
  FStatusCode := 0;
  FResponseVersion := HttpVersion;

  Connection.IsReadUntilClose := False;
  repeat
    Connection.ReadData(ARawData);

    repeat
      ind := GetBinTextPos(EndOfHeader, ARawData.Memory, hdrStart, ARawData.Size);
      if (ind > 0) then
      begin
        FStatusCode := ExtractStatusCode(ARawData.Memory, hdrStart, ARawData.Size);
        FResponseVersion := ExtractResponseVersion(ARawData.Memory, hdrStart, ARawData.Size);
        if (FStatusCode = 100) then
        begin
          hdrStart := ind + Length(EndOfHeader);
        end else
        begin
          Break;
        end;
      end else
      begin
        Break;
      end;
    until False;
  until (FStatusCode <> 0) and (FStatusCode <> 100);

  ARawData.Position := hdrStart;
  LoadTextFromStream(ARawData, ind + Length(EndOfHeader) - hdrStart, AResponseHeader);
  ResponseHeader.ParseHeader(AResponseHeader);
end;

procedure TclCustomHttp.ReadResponseBody(AResponseHeader: TStrings;
  AExtraSize: Integer; AExtraData, AResponseBody: TStream);
var
  totalSize, bodySize, oldProceed: Integer;
  chunkedBody: TclChunkedStream;
  dest, compressor: TStream;
begin
  {$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ReadResponseBody');{$ENDIF}

  compressor := nil;
  Connection.OnProgress := DoDataReceiveProgress;
  try
    if (system.Pos('gzip', LowerCase(ResponseHeader.ContentEncoding)) > 0) then
    begin
      compressor := TclGZipInflateStream.Create(AResponseBody);
      dest := compressor;
    end else
    begin
      dest := AResponseBody;
    end;

    if SameText('chunked', ResponseHeader.TransferEncoding) then
    begin
      chunkedBody := TclChunkedStream.Create(dest);
      try
        if (AExtraSize > 0) then
        begin
          chunkedBody.CopyFrom(AExtraData, AExtraSize);
        end;

        InitProgress(AExtraSize, -1);

        if Active then
        begin
          while not chunkedBody.IsCompleted do
          begin
            Connection.ReadData(chunkedBody);
          end;
        end;
        if not FProgressHandled then
        begin
          DoReceiveProgress(Connection.BytesProceed, -1);
        end;
      finally
        chunkedBody.Free();
      end;
    end else
    begin
      if (AExtraSize > 0) then
      begin
        dest.CopyFrom(AExtraData, AExtraSize);
      end;

      bodySize := GetResponseLength();
      totalSize := bodySize;
      InitProgress(AExtraSize, totalSize);
      if (bodySize < 0) then
      begin
        if Active then
        begin
          Connection.IsReadUntilClose := True;
          Connection.ReadData(dest);
          {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'ReadResponseBody IsReadUntilClose');{$ENDIF}
        end;
      end else
      begin
        oldProceed := Connection.BytesProceed;
        bodySize := bodySize - AExtraSize;
        if Active then
        begin
          {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'ReadResponseBody before while, %d ', nil, [bodySize]);{$ENDIF}
          while ((Connection.BytesProceed - oldProceed) < bodySize) do
          begin
            Connection.ReadData(dest);
            {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'ReadResponseBody after ReadData, %d ', nil, [Connection.BytesProceed]);{$ENDIF}
          end;
        end;
      end;
      if not FProgressHandled then
      begin
        DoReceiveProgress(totalSize, totalSize);
      end;
    end;
  finally
    Connection.OnProgress := nil;
    compressor.Free();
{$IFDEF LOGGER} clPutLogMessage(Self, edInside, 'ReadResponseBody, received response', AResponseBody, 0);{$ENDIF}
  end;

  ReadCookies(AResponseHeader);
  {$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ReadResponseBody'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ReadResponseBody', E); raise; end; end;{$ENDIF}
end;

procedure TclCustomHttp.ReadResponseText(AResponseHeader: TStrings;
  AExtraSize: Integer; AExtraData: TStream; AResponseText: TStrings);
var
  rawData: TStream;
begin
  rawData := TMemoryStream.Create();
  try
    ReadResponseBody(AResponseHeader, AExtraSize, AExtraData, rawData);
    rawData.Position := 0;
    AResponseText.LoadFromStream(rawData);
  finally
    rawData.Free();
  end;
end;

function TclCustomHttp.GetResponseLength: Integer;
begin
  if SameText('CONNECT', FMethod) and (StatusCode = 200) then
  begin
    Result := 0;
  end else
  if SameText('HEAD', FMethod) or (StatusCode = 304) then
  begin
    Result := 0;
  end else
  if ((HttpVersion = hvHttp1_0) or (ResponseVersion = hvHttp1_0))
    and (ResponseHeader.ContentLength = '') then
  begin
    Result := -1;
  end else
  if (ResponseHeader.ContentLength = '') and ((StatusCode and 200) = 200) then
  begin
    Result := -1;
  end else
  begin
    Result := StrToIntDef(ResponseHeader.ContentLength, 0);
  end;
end;

function TclCustomHttp.GetKeepAlive: Boolean;
begin
  if (HttpVersion = hvHttp1_1) and (ResponseVersion = hvHttp1_1) then
  begin
    if IsUseProxy() then
    begin
      Result := not SameText('close', ResponseHeader.ProxyConnection);
    end else
    begin
      Result := not SameText('close', ResponseHeader.Connection);
    end;
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'GetKeepAlive inside if, Result: ' + IntToStr(Integer(Result)));
{$ENDIF}
  end else
  begin
    if IsUseProxy() then
    begin
      Result := SameText('Keep-Alive', ResponseHeader.ProxyConnection);
    end else
    begin
      Result := SameText('Keep-Alive', ResponseHeader.Connection);
    end;
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'GetKeepAlive inside else, Result: ' + IntToStr(Integer(Result)));
{$ENDIF}
  end;
  Result := Result and KeepConnection;
end;

procedure TclCustomHttp.RemoveHeaderTrailer(AHeader: TStrings);
begin
  while (AHeader.Count > 0) and (AHeader[AHeader.Count - 1] = '') do
  begin
    AHeader.Delete(AHeader.Count - 1);
  end;
end;

procedure TclCustomHttp.RemoveRequestLine(AHeader: TStrings);
var
  space, colon: Integer;
begin
  if (AHeader.Count > 0) then
  begin
    space := system.Pos(#32, AHeader[0]);
    colon := system.Pos(':', AHeader[0]);
    if (space <> 0) then
    begin
      if (colon = 0) or (space < colon) then
      begin
        AHeader.Delete(0);
      end;
    end;
  end;
end;

function TclCustomHttp.BasicAuthenticate(const AUserName, APassword, AuthorizationField: string;
  ARequestHeader: TStrings): Boolean;
var
  authChallenge: TStrings;
begin
  authChallenge := TStringList.Create();
  try
    authChallenge.Add('Basic');
    Result := Authenticate(AUserName, APassword, AuthorizationField, authChallenge, ARequestHeader);
  finally
    authChallenge.Free();
  end;
end;

procedure TclCustomHttp.SetAuthorizationField(const AFieldName, AFieldValue: string;
  ARequestHeader: TStrings);
var
  fieldList: TStrings;
begin
  RemoveHeaderTrailer(ARequestHeader);
  fieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, ARequestHeader, fieldList);
    RemoveHeaderField(ARequestHeader, fieldList, AFieldName);
    AddHeaderField(ARequestHeader, AFieldName, AFieldValue);
  finally
    fieldList.Free();
  end;
end;

function TclCustomHttp.Authenticate(const AUserName, APassword,
  AuthorizationField: string; AuthChallenge, ARequestHeader: TStrings): Boolean;
var
  i: Integer;
  auth: string;
begin
  auth := '';
  DoAuthenticate(Url, FMethod, AUserName, APassword, AuthChallenge, auth);
  Result := (auth <> '');

  if Result then
  begin
    SetAuthorizationField(AuthorizationField, auth, ARequestHeader);
    Exit;
  end;

  for i := GetRegisteredAuthorizations().Count - 1 downto 0 do
  begin
    auth := TclHttpAuthorization(GetRegisteredAuthorizations()[i]).Authenticate(
      Url, FMethod, AUserName, APassword, AuthChallenge, Self);
    Result := (auth <> '');

    if Result then
    begin
      SetAuthorizationField(AuthorizationField, auth, ARequestHeader);
      KeepConnection := True;
      Exit;
    end;
  end;
  Result := False;
end;

procedure TclCustomHttp.DoAuthenticate(AUrl: TclUrlParser; const AMethod, AUserName, APassword: string;
  AuthChallenge: TStrings; var AuthorizationValue: string);
begin
  if Assigned(OnAuthenticate) then
  begin
    OnAuthenticate(Self, AUrl, AMethod, AUserName, APassword, AuthChallenge, AuthorizationValue);
  end;
end;

procedure TclCustomHttp.DoRedirect(ARequestHeader: TStrings; AStatusCode: Integer;
  AResponseHeader: TclHttpResponseHeader; AResponseText: TStrings; var AMethod: string;
  var CanRedirect, Handled: Boolean);
begin
  if Assigned(OnRedirect) then
  begin
    OnRedirect(Self, ARequestHeader, AStatusCode,
      AResponseHeader, AResponseText, AMethod, CanRedirect, Handled);
  end;
end;

function TclCustomHttp.GetResourcePath: string;
var
  ind: Integer;
begin
  Result := LowerCase(Url.ParsedUrl);
  ind := LastDelimiter('/', Result);
  Result := system.Copy(Result, 1, ind);
  ind := Length(Result);
  if (ind > 0) and (Result[ind] <> '/') then
  begin
    Result := Result + '/';
  end;
end;

function TclCustomHttp.GetRedirectMethod(AStatusCode: Integer; const AMethod: string): string;
begin
  if (StatusCode = 302) or (StatusCode = 303) then
  begin
    Result := 'GET';
  end else
  begin
    Result := AMethod;
  end;
end;

function TclCustomHttp.Redirect(ARequestHeader, AResponseText: TStrings;
  var AMethod: string): Boolean;
var
  location: string;
  handled: Boolean;
  oldPath: string;
  fieldList: TStrings;
begin
  location := ResponseHeader.Location;

  Result := False;
  handled := False;

  oldPath := GetResourcePath();

  DoRedirect(ARequestHeader, StatusCode, ResponseHeader, AResponseText, AMethod, Result, handled);

  if not handled and (location <> '') then
  begin
    Result := (Url.Parse(GetFullUrlByRoot(location, Url.ParsedUrl)) <> '');
    if Result then
    begin
      AMethod := GetRedirectMethod(StatusCode, AMethod);

      if (system.Pos(oldPath, GetResourcePath()) <> 1) then
      begin
        fieldList := TStringList.Create();
        try
          GetHeaderFieldList(0, ARequestHeader, fieldList);
          RemoveHeaderField(ARequestHeader, fieldList, 'Authorization');
        finally
          fieldList.Free();
        end;
      end;
    end;
  end;
end;

procedure TclCustomHttp.RaiseHttpError(AStatusCode: Integer; AResponseHeader, AResponseText: TStrings);
var
  msg: string;
begin
  msg := '';
  if (AResponseHeader.Count > 0) then
  begin
    msg := AResponseHeader[0];
  end;
  raise EclHttpError.Create(msg, AStatusCode, AResponseText.Text);
end;

procedure TclCustomHttp.ReadCookies(AResponseHeader: TStrings);
var
  serverCookies: TclCookieList;
begin
  serverCookies := TclCookieList.Create(nil, TclCookieItem);
  try
    if AllowCookies then
    begin
      serverCookies.GetResponseCookies(AResponseHeader);
    end;
    DoReceiveResponse(FMethod, Url.ParsedUrl, AResponseHeader, serverCookies);
  finally
    serverCookies.Free();
  end;
end;

procedure TclCustomHttp.InternalSendRequest(const AMethod: string;
  ARequestHeader: TStrings; ARequestBody: TStream;
  AResponseHeader: TStrings; AResponseBody: TStream);
var
  extraSize, redirects,
  authRetries, proxyRetries: Integer;
  rawData: TMemoryStream;
  reqHeader, respText: TStrings;
  needClose: Boolean;
  requestPos: Integer;
  requestBody: TStream;
  nullBody: TStream;
  newMethod: string;
  tunnelStatus: TclHttpTunnelStatus;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'SendRequest, TimeOut: %d', nil, [TimeOut]);{$ENDIF}
  reqHeader := nil;
  rawData := nil;
  respText := nil;
  nullBody := nil;
  try
    reqHeader := TStringList.Create();
    rawData := TMemoryStream.Create();
    respText := TStringList.Create();

    if (ARequestBody <> nil) then
    begin
      requestBody := ARequestBody;
    end else
    begin
      nullBody := TclNullStream.Create();
      requestBody := nullBody;
    end;

    reqHeader.Assign(ARequestHeader);

    FMethod := AMethod;

    if AuthenticationType = atBasic then
    begin
      BasicAuthenticate(GetUserName(), GetPassword(), 'Authorization', reqHeader);
    end;
    if IsUseProxy() and (ProxySettings.AuthenticationType = atBasic) then
    begin
      BasicAuthenticate(ProxySettings.UserName, ProxySettings.Password,
        'Proxy-Authorization', reqHeader);
    end;

    requestPos := requestBody.Position;
    needClose := False;
    redirects := 0;
    authRetries := 0;
    proxyRetries := 0;
    tunnelStatus := htNone;
    try
      repeat
        tunnelStatus := GetTunnelStatus();
        WriteRequestHeader(tunnelStatus, reqHeader, requestBody);

        requestBody.Position := requestPos;
        WriteRequestData(requestBody);

        DoSendRequest(FMethod, Url.ParsedUrl, reqHeader);

        ReadResponseHeader(AResponseHeader, rawData);

        extraSize := rawData.Size - rawData.Position;
        needClose := not GetKeepAlive();

        if ((StatusCode div 100 ) = 3) and (StatusCode <> 304) and (StatusCode <> 305) then
        begin
          Inc(redirects);
          ReadResponseText(AResponseHeader, extraSize, rawData, respText);

          if (MaxRedirects > 0) and (redirects > MaxRedirects) then
          begin
            RaiseHttpError(StatusCode, AResponseHeader, respText);
          end;
          newMethod := FMethod;
          if not (AllowRedirects and Redirect(reqHeader, respText, newMethod)) then
          begin
            RaiseHttpError(StatusCode, AResponseHeader, respText);
          end;
          if SameText('GET', newMethod) then
          begin
            if (nullBody = nil) then
            begin
              nullBody := TclNullStream.Create();
            end;
            requestBody := nullBody;
          end;

          {$IFDEF LOGGER}
            clPutLogMessage(Self, edInside, 'SendRequest new Method: '
              + newMethod + '; old Method: ' + FMethod + '; need clode: ' + IntToStr(Integer(needClose)));
          {$ENDIF}
          FMethod := newMethod;

          if IsUseProxy() then
          begin
            needClose := True;
          end;
        end else
        if (StatusCode = 401) then
        begin
          Inc(authRetries);
          ReadResponseText(AResponseHeader, extraSize, rawData, respText);

          if (MaxAuthRetries > 0) and (authRetries > MaxAuthRetries) then
          begin
            RaiseHttpError(StatusCode, AResponseHeader, respText);
          end;

          if not Authenticate(GetUserName(), GetPassword(),
            'Authorization', ResponseHeader.Authenticate, reqHeader) then
          begin
            RaiseHttpError(StatusCode, AResponseHeader, respText);
          end;
        end else
        if (StatusCode = 407) then
        begin
          Inc(proxyRetries);
          ReadResponseText(AResponseHeader, extraSize, rawData, respText);

          if (MaxAuthRetries > 0) and (proxyRetries > MaxAuthRetries) then
          begin
            RaiseHttpError(StatusCode, AResponseHeader, respText);
          end;

          if not Authenticate(ProxySettings.UserName, ProxySettings.Password,
            'Proxy-Authorization', ResponseHeader.ProxyAuthenticate, reqHeader) then
          begin
            RaiseHttpError(StatusCode, AResponseHeader, respText);
          end;
        end else
        if (StatusCode >= 400) then
        begin
          ReadResponseText(AResponseHeader, extraSize, rawData, respText);
          RaiseHttpError(StatusCode, AResponseHeader, respText);
        end else
        begin
          ReadResponseBody(AResponseHeader, extraSize, rawData, AResponseBody);
          Break;
        end;

        if needClose then
        begin
          Close();
        end;
      until False;

    finally
      if needClose and (tunnelStatus <> htConnect) then
      begin
        Close();
      end;
    end;
  finally
    nullBody.Free();
    respText.Free();
    rawData.Free();
    reqHeader.Free();
  end;
end;

procedure TclCustomHttp.SendRequest(const AMethod, AUrl: string; ARequestHeader: TStrings;
  ARequestBody: TStream; AResponseHeader: TStrings; AResponseBody: TStream);
begin
  Url.Parse(AUrl);
  InternalSendRequest(AMethod, ARequestHeader, ARequestBody, AResponseHeader, AResponseBody);
end;

procedure TclCustomHttp.SetHttpVersion(const Value: TclHttpVersion);
begin
  if (FHttpVersion <> Value) then
  begin
    FHttpVersion := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetPassword(const Value: string);
begin
  if (FPassword <> Value) then
  begin
    FPassword := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetUserName(const Value: string);
begin
  if (FUserName <> Value) then
  begin
    FUserName := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetUserAgent(const Value: string);
begin
  if (FUserAgent <> Value) then
  begin
    FUserAgent := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetAuthenticationType(const Value: TclAuthenticationType);
begin
  if (FAuthenticationType <> Value) then
  begin
    FAuthenticationType := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetAllowCaching(const Value: Boolean);
begin
  if (FAllowCaching <> Value) then
  begin
    FAllowCaching := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetKeepConnection(const Value: Boolean);
begin
  if (FKeepConnection <> Value) then
  begin
    FKeepConnection := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetAllowRedirects(const Value: Boolean);
begin
  if (FAllowRedirects <> Value) then
  begin
    FAllowRedirects := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetProxySettings(const Value: TclHttpProxySettings);
begin
  FProxySettings.Assign(Value);
end;

procedure TclCustomHttp.SetMaxAuthRetries(const Value: Integer);
begin
  if (FMaxAuthRetries <> Value) then
  begin
    FMaxAuthRetries := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetMaxRedirects(const Value: Integer);
begin
  if (FMaxRedirects <> Value) then
  begin
    FMaxRedirects := Value;
    Changed();
  end;
end;

function TclCustomHttp.IsUseProxy: Boolean;
begin
  Result := (ProxySettings.Server <> '');
end;

procedure TclCustomHttp.SetAllowCookies(const Value: Boolean);
begin
  if (FAllowCookies <> Value) then
  begin
    FAllowCookies := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetCookies(const Value: TclCookieList);
begin
  FCookies.Assign(Value);
end;

procedure TclCustomHttp.DoReceiveResponse(const AMethod, AUrl: string;
  AResponseHeader: TStrings; ACookies: TclCookieList);
begin
  if Assigned(OnReceiveResponse) then
  begin
    OnReceiveResponse(Self, AMethod, AUrl, AResponseHeader, ACookies);
  end;
end;

procedure TclCustomHttp.DoSendRequest(const AMethod, AUrl: string; ARequestHeader: TStrings);
begin
  if Assigned(OnSendRequest) then
  begin
    OnSendRequest(Self, AMethod, AUrl, ARequestHeader);
  end;
end;

procedure TclCustomHttp.SetAllowCompression(const Value: Boolean);
begin
  if (FAllowCompression <> Value) then
  begin
    FAllowCompression := Value;
    Changed();
  end;
end;

procedure TclCustomHttp.SetRequest(const Value: TclHttpRequest);
begin
  if (FRequest <> Value) then
  begin
{$IFDEF DELPHI5}
    if (FRequest <> nil) then
    begin
      FRequest.RemoveFreeNotification(Self);
    end;
{$ENDIF}
    FRequest := Value;
    if (FRequest <> nil) then
    begin
      FRequest.FreeNotification(Self);
    end;
  end;
end;

procedure TclCustomHttp.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation <> opRemove) then Exit;
  if (AComponent = FRequest) then
  begin
    FRequest := nil;
  end;
end;

procedure TclCustomHttp.Delete(const AUrl: string);
var
  respHdr: TStrings;
  req, reqInst: TclHttpRequest;
  resp, reqStream: TStream;
begin
  reqInst := nil;
  respHdr := nil;
  resp := nil;
  reqStream := nil;
  try
    req := Request;
    if (req = nil) then
    begin
      reqInst := TclHttpRequest.Create(nil);
      req := reqInst;
    end;
    respHdr := TStringList.Create();
    resp := TclNullStream.Create();
    reqStream := req.RequestStream;
    SendRequest('DELETE', AUrl, req.HeaderSource, reqStream, respHdr, resp);
  finally
    reqStream.Free();
    resp.Free();
    respHdr.Free();
    reqInst.Free();
  end;
end;

procedure TclCustomHttp.Get(const AUrl: string; ADestination: TStream);
var
  respHdr: TStrings;
  req, reqInst: TclHttpRequest;
  reqStream: TStream;
begin
  reqInst := nil;
  respHdr := nil;
  reqStream := nil;
  try
    req := Request;
    if (req = nil) then
    begin
      reqInst := TclHttpRequest.Create(nil);
      req := reqInst;
    end;
    respHdr := TStringList.Create();
    reqStream := req.RequestStream;
    SendRequest('GET', AUrl, req.HeaderSource, reqStream, respHdr, ADestination);
  finally
    reqStream.Free();
    respHdr.Free();
    reqInst.Free();
  end;
end;

procedure TclCustomHttp.Head(const AUrl: string);
var
  respHdr: TStrings;
  req, reqInst: TclHttpRequest;
  resp, reqStream: TStream;
begin
  reqInst := nil;
  respHdr := nil;
  resp := nil;
  reqStream := nil;
  try
    req := Request;
    if (req = nil) then
    begin
      reqInst := TclHttpRequest.Create(nil);
      req := reqInst;
    end;
    respHdr := TStringList.Create();
    resp := TclNullStream.Create();
    reqStream := req.RequestStream;
    SendRequest('HEAD', AUrl, req.HeaderSource, reqStream, respHdr, resp);
  finally
    reqStream.Free();
    resp.Free();
    respHdr.Free();
    reqInst.Free();
  end;
end;

procedure TclCustomHttp.Post(const AUrl: string; ARequest: TclHttpRequest; AResponseBody: TStream);
var
  reqHdr, respHdr: TStrings;
  req, reqInst: TclHttpRequest;
  reqStream: TStream;
begin
  reqInst := nil;
  respHdr := nil;
  reqStream := nil;
  try
    req := ARequest;
    if (req = nil) then
    begin
      reqInst := TclHttpRequest.Create(nil);
      req := reqInst;
    end;
    respHdr := TStringList.Create();
    reqHdr := req.HeaderSource;
    reqStream := req.RequestStream;
    SendRequest('POST', AUrl, reqHdr, reqStream, respHdr, AResponseBody);
  finally
    reqStream.Free();
    respHdr.Free();
    reqInst.Free();
  end;
end;

procedure TclCustomHttp.Post(const AUrl: string; AResponseBody: TStream);
begin
  Post(AUrl, Request, AResponseBody);
end;

procedure TclCustomHttp.Put(const AUrl: string; ASource: TStream);
var
  dst: TStream;
begin
  dst := TclNullStream.Create();
  try
    Put(AUrl, ASource, dst);
  finally
    dst.Free();
  end;
end;

procedure TclCustomHttp.SendRequest(const AMethod, AUrl: string;
  ARequest: TclHttpRequest; AResponseHeader: TStrings; AResponseBody: TStream);
var
  stream: TStream;
begin
  stream := ARequest.RequestStream;
  try
    SendRequest(AMethod, AUrl, ARequest.HeaderSource, stream, AResponseHeader, AResponseBody);
  finally
    stream.Free();
  end;
end;

procedure TclCustomHttp.DoSendProgress(ABytesProceed, ATotalBytes: Integer);
begin
  FProgressHandled := True;
  if Assigned(OnSendProgress) then
  begin
    OnSendProgress(Self, ABytesProceed, ATotalBytes);
  end;
end;

procedure TclCustomHttp.DoReceiveProgress(ABytesProceed, ATotalBytes: Integer);
begin
  FProgressHandled := True;
  if Assigned(OnReceiveProgress) then
  begin
    OnReceiveProgress(Self, ABytesProceed, ATotalBytes);
  end;
end;

procedure TclCustomHttp.InitProgress(ABytesProceed, ATotalBytes: Integer);
begin
  FProgressHandled := False;
  Connection.InitProgress(ABytesProceed, ATotalBytes);
end;

procedure TclCustomHttp.DoDataSendProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
begin
  DoSendProgress(ABytesProceed, ATotalBytes);
end;

procedure TclCustomHttp.DoDataReceiveProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
begin
  DoReceiveProgress(ABytesProceed, ATotalBytes);
end;

function TclCustomHttp.GetPassword: string;
begin
  Result := Password;
  if (Result = '') then
  begin
    Result := Url.Password;
  end;
end;

function TclCustomHttp.GetUserName: string;
begin
  Result := UserName;
  if (Result = '') then
  begin
    Result := Url.User;
  end;
end;

function TclCustomHttp.GetDefaultPort: Integer;
begin
  Result := cDefaultHttpPort;
end;

procedure TclCustomHttp.Get(const AUrl: string; ADestination: TStrings);
var
  dest: TStream;
begin
  dest := TMemoryStream.Create();
  try
    Get(AUrl, dest);

    dest.Position := 0;
    ADestination.LoadFromStream(dest);
  finally
    dest.Free();
  end;
end;

procedure TclCustomHttp.Post(const AUrl: string; AResponseBody: TStrings);
var
  dest: TStream;
begin
  dest := TMemoryStream.Create();
  try
    Post(AUrl, dest);

    dest.Position := 0;
    AResponseBody.LoadFromStream(dest);
  finally
    dest.Free();
  end;
end;

procedure TclCustomHttp.OpenConnection(const AServer: string; APort: Integer);
begin
  if IsUseProxy() then
  begin
    inherited OpenConnection(ProxySettings.Server, ProxySettings.Port);
  end else
  begin
    inherited OpenConnection(AServer, APort);
  end;
end;

procedure TclCustomHttp.Put(const AUrl: string; ASource, AResponseBody: TStream);
var
  respHdr: TStrings;
  req, reqInst: TclHttpRequest;
begin
  reqInst := nil;
  respHdr := nil;
  try
    req := Request;
    if (req = nil) then
    begin
      reqInst := TclHttpRequest.Create(nil);
      reqInst.Header.Accept := '';
      req := reqInst;
    end;
    respHdr := TStringList.Create();
    SendRequest('PUT', AUrl, req.HeaderSource, ASource, respHdr, AResponseBody);
  finally
    respHdr.Free();
    reqInst.Free();
  end;
end;

procedure TclCustomHttp.Put(const AUrl: string; ASource: TStream; AResponseBody: TStrings);
var
  dst: TStream;
begin
  dst := TMemoryStream.Create();
  try
    Put(AUrl, ASource, dst);
    dst.Position := 0;
    AResponseBody.LoadFromStream(dst);
  finally
    dst.Free();
  end;
end;

{ EclHttpError }

constructor EclHttpError.Create(const AErrorMsg: string;
  AErrorCode: Integer; const AResponseText: string);
begin
  inherited Create(AErrorMsg, AErrorCode);
  FResponseText := AResponseText;
end;

end.

