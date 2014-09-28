{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clTcpServer;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  Classes, SysUtils, Windows, WinSock, Messages, clWinSock2, clThreadPool, clSocket, clCert,
  SyncObjs, clSspi;

type
  TclServerTlsMode = (stNone, stImplicit, stExplicitAllow, stExplicitRequire);

  TclServerSaslFlag = (ssUseLogin, ssUseCramMD5, ssUseNTLM);
  TclServerSaslFlags = set of TclServerSaslFlag;

  TclTcpServer = class;

  TclCommandConnection = class(TclAsyncConnection)
  private
    FAccessor: TCriticalSection;
    FWriteStream: TStream;
    FLines: TStrings;
    FCurrentLine: Integer;
    FLinesTrailer: string;
    FUseDotTerminator: Boolean;
    FData: Pointer;
    FCommandRaw: string;
    FIsReading: Boolean;
    procedure SetLines(const Value: TStrings);
    function GetIsTls: Boolean;
  protected
    procedure DoDestroy; override;
  public
    constructor Create;
    procedure WriteData(AData: TStream); override;
    procedure WriteString(const AString: string);
    procedure BeginWork;
    procedure EndWork;
    property Data: Pointer read FData write FData;
    property IsTls: Boolean read GetIsTls;
  end;

  TclServerThread = class(TThread)
  private
    FStopEvent: THandle;
    FStartedEvent: THandle;
    FConnections: TList;
    FWindowHandle: HWND;
    FServerSocket: TSocket;
    FServer: TclTcpServer;
    procedure DispatchMessages;
    procedure WndProc(var Message: TMessage);
    procedure ClearConnections;
    procedure OpenServerSocket;
    procedure CloseServerSocket;
    procedure AcceptConnection;
    procedure ReadConnection(AConnection: TclCommandConnection);
    procedure WriteConnection(AConnection: TclCommandConnection);
    procedure CloseConnection(AConnection: TclCommandConnection);
    function FindConnection(ASocket: TSocket): TclCommandConnection;
    procedure AcceptConnectionDone(Sender: TObject);
  protected
    procedure Execute; override;
  public
    constructor Create(AServer: TclTcpServer);
    procedure Start;
    procedure Stop;
  end;

  TclServerErrorEvent = procedure (Sender: TObject; E: Exception) of object;

  TclConnectionEvent = procedure (Sender: TObject; AConnection: TclCommandConnection) of object;
  TclCreateConnectionEvent = procedure (Sender: TObject; var AConnection: TclCommandConnection) of object;
  TclConnectionDataEvent = procedure (Sender: TObject; AConnection: TclCommandConnection; AData: TStream) of object;
  TclVerifyClientEvent = procedure (Sender: TObject; AConnection: TclCommandConnection;
    ACertificate: TclCertificate; const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean) of object;

  TclTcpServer = class(TComponent)
  private
    FPort: Integer;
    FServerThread: TclServerThread;
    FTimeOut: Integer;
    FBatchSize: Integer;
    FWorkerThreadPool: TclThreadPool;
    FServerName: string;
    FUseTLS: TclServerTlsMode;
    FBitsPerSec: Integer;
    FIsStart: Boolean;
    FStartError: string;
    FStartErrorCode: Integer;
    FOnStart: TNotifyEvent;
    FOnStop: TNotifyEvent;
    FOnServerError: TclServerErrorEvent;
    FOnAcceptConnection: TclConnectionEvent;
    FOnCloseConnection: TclConnectionEvent;
    FOnGetCertificate: TclOnGetCertificateEvent;
    FOnCreateConnection: TclCreateConnectionEvent;
    FTLSFlags: TclTlsFlags;
    FRequireClientCertificate: Boolean;
    FOnVerifyClient: TclVerifyClientEvent;
    procedure ReadConnection(AConnection: TclCommandConnection);
    procedure WriteConnection(AConnection: TclCommandConnection);
    function GetMaxThreadCount: Integer;
    function GetMinThreadCount: Integer;
    procedure SetMaxThreadCount(const Value: Integer);
    procedure SetMinThreadCount(const Value: Integer);
    function GetConnection(Index: Integer): TclCommandConnection;
    function GetConnectionCount: Integer;
    procedure ServerError(E: Exception);
    procedure InternalStop;
  protected
    procedure GetCertificate(Sender: TObject; var ACertificate: TclCertificate; var Handled: Boolean);
    procedure VerifyClient(Sender: TObject; ACertificate: TclCertificate;
      const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean);
    procedure DoServerError(E: Exception); virtual;
    procedure DoCreateConnection(var AConnection: TclCommandConnection); virtual;
    procedure DoAcceptConnection(AConnection: TclCommandConnection); virtual;
    procedure DoCloseConnection(AConnection: TclCommandConnection); virtual;
    procedure DoReadConnection(AConnection: TclCommandConnection; AData: TStream); virtual;
    procedure DoWriteConnection(AConnection: TclCommandConnection); virtual;
    procedure DoStart; virtual;
    procedure DoStop; virtual;
    procedure DoGetCertificate(var ACertificate: TclCertificate; var Handled: Boolean); virtual;
    procedure DoVerifyClient(AConnection: TclCommandConnection;
      ACertificate: TclCertificate; const AStatusText: string;
      AStatusCode: Integer; var AVerified: Boolean); virtual;
    function CreateConnection: TclCommandConnection;
    function CreateDefaultConnection: TclCommandConnection; virtual; abstract;
    procedure CloseConnection(AConnection: TclCommandConnection);
    procedure DoDestroy; virtual;
    procedure SetUseTLS(const Value: TclServerTlsMode); virtual;
    procedure StartTls(AConnection: TclCommandConnection);
    property Connections[Index: Integer]: TclCommandConnection read GetConnection;
    property ConnectionCount: Integer read GetConnectionCount;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
  published
    property ServerName: string read FServerName write FServerName;
    property Port: Integer read FPort write FPort;
    property TimeOut: Integer read FTimeOut write FTimeOut default 60000;
    property BatchSize: Integer read FBatchSize write FBatchSize default 8192;
    property MinThreadCount: Integer read GetMinThreadCount write SetMinThreadCount default 1;
    property MaxThreadCount: Integer read GetMaxThreadCount write SetMaxThreadCount default 5;
    property UseTLS: TclServerTlsMode read FUseTLS write SetUseTLS default stNone;
    property TLSFlags: TclTlsFlags read FTLSFlags write FTLSFlags default [tfUseTLS];
    property BitsPerSec: Integer read FBitsPerSec write FBitsPerSec default 0;
    property RequireClientCertificate: Boolean read FRequireClientCertificate
      write FRequireClientCertificate default False;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
    property OnServerError: TclServerErrorEvent read FOnServerError write FOnServerError;
    property OnCreateConnection: TclCreateConnectionEvent read FOnCreateConnection write FOnCreateConnection;
    property OnAcceptConnection: TclConnectionEvent read FOnAcceptConnection write FOnAcceptConnection;
    property OnCloseConnection: TclConnectionEvent read FOnCloseConnection write FOnCloseConnection;
    property OnGetCertificate: TclOnGetCertificateEvent read FOnGetCertificate write FOnGetCertificate;
    property OnVerifyClient: TclVerifyClientEvent read FOnVerifyClient write FOnVerifyClient;
  end;

  TclTcpCommandParams = class
  private
    FCommand: string;
    FParams: string;
  public
    property Command: string read FCommand write FCommand;
    property Params: string read FParams write FParams;
  end;
  
  TclTcpCommandInfo = class
  private
    FName: string;
  protected
    procedure Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams); virtual; abstract;
  public
    property Name: string read FName write FName;
  end;

  EclTcpCommandError = class(EclSocketError)
  private
    FCommand: string;
  public
    constructor Create(const ACommand, AErrorMsg: string; AErrorCode: Integer);
    property Command: string read FCommand;
  end;

  TclCommandConnectionEvent = procedure (Sender: TObject; AConnection: TclCommandConnection;
    const ACommand, AText: string) of object;

  TclTcpCommandServer = class(TclTcpServer)
  private
    FCommands: TList;
    FOnReceiveCommand: TclCommandConnectionEvent;
    FOnSendResponse: TclCommandConnectionEvent;
    procedure ClearCommands;
  protected
    procedure AddCommand(AInfo: TclTcpCommandInfo);
    function GetCommand(const AName: string): TclTcpCommandInfo;
    procedure SendResponse(AConnection: TclCommandConnection;
      const ACommand, AResponse: string); overload;
    procedure SendResponse(AConnection: TclCommandConnection;
      const ACommand, AResponse: string; const Args: array of const); overload;
    procedure DoReceiveCommand(AConnection: TclCommandConnection;
      const ACommand, AParams: string); virtual;
    procedure DoSendResponse(AConnection: TclCommandConnection;
      const ACommand, AResponse: string); virtual;
    procedure RegisterCommands; virtual; abstract;
    function GetNullCommand(const ACommand: string): TclTcpCommandInfo; virtual; abstract;
    function GetCommandParams(const AData: string): TclTcpCommandParams; virtual;
    procedure ProcessData(AConnection: TclCommandConnection; const AData: string); virtual;
    procedure ProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
    procedure ProcessUnhandledError(AConnection: TclCommandConnection;
      AParams: TclTcpCommandParams; E: Exception); virtual;
    procedure DoProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams); virtual;
    procedure DoReadConnection(AConnection: TclCommandConnection; AData: TStream); override;
    procedure DoWriteConnection(AConnection: TclCommandConnection); override;
    procedure DoDestroy; override;
    procedure AddMultipleLines(AConnection: TclCommandConnection; ALines: TStrings);
    procedure SendMultipleLines(AConnection: TclCommandConnection;
      const ALinesTrailer: string; AUseDotTerminator: Boolean);
    function CheckForEndOfData(const AData: string): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property OnReceiveCommand: TclCommandConnectionEvent read FOnReceiveCommand write FOnReceiveCommand;
    property OnSendResponse: TclCommandConnectionEvent read FOnSendResponse write FOnSendResponse;
  end;

resourcestring
  cServerStarted = 'The server is already started';
  cStartError = 'An unknown error occured during starting the server';

implementation

uses
  clTlsSocket{$IFDEF DEMO}, clEncoder{$ENDIF}, clUtils{$IFNDEF DELPHI6},
  Forms{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

const
  CL_SOCKETEVENT = WM_USER + 2110;
      
{ TclTcpServer }

constructor TclTcpServer.Create(AOwner: TComponent);
var
  wsaData: TWSAData;
  res: Integer;
begin
  inherited Create(AOwner);
  res := WSAStartup($202, wsaData);
  if (res <> 0) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;
  FWorkerThreadPool := TclThreadPool.Create();

  MinThreadCount := 1;
  MaxThreadCount := 5;

  FTimeOut := 60000;
  FBatchSize := 8192;
  FUseTLS := stNone;
  FTLSFlags := [tfUseTLS];
  FRequireClientCertificate := False;
end;

destructor TclTcpServer.Destroy;
begin
  Stop();
  DoDestroy();
  WSACleanup();
  inherited Destroy();
end;

procedure TclTcpServer.DoDestroy;
begin
  FWorkerThreadPool.Free();
end;

procedure TclTcpServer.DoAcceptConnection(AConnection: TclCommandConnection);
begin
  if Assigned(OnAcceptConnection) then
  begin
    OnAcceptConnection(Self, AConnection);
  end;
end;

procedure TclTcpServer.DoCloseConnection(AConnection: TclCommandConnection);
begin
  if Assigned(OnCloseConnection) then
  begin
    OnCloseConnection(Self, AConnection);
  end;
end;

procedure TclTcpServer.DoReadConnection(AConnection: TclCommandConnection; AData: TStream);
begin
end;

procedure TclTcpServer.DoServerError(E: Exception);
begin
  if Assigned(OnServerError) then
  begin
    OnServerError(Self, E);
  end;
end;

procedure TclTcpServer.DoStart;
begin
  if Assigned(OnStart) then
  begin
    OnStart(Self);
  end;
end;

procedure TclTcpServer.DoStop;
begin
  if Assigned(OnStop) then
  begin
    OnStop(Self);
  end;
end;

type
  TclTcpServerOperation = (soServerRead, soServerWrite);

  TclTcpServerWorkItem = class(TclWorkItem)
  private
    FServer: TclTcpServer;
    FConnection: TclCommandConnection;
    FOperation: TclTcpServerOperation;
    procedure DoRead;
    procedure DoWrite;
  protected
    procedure Execute; override;
  public
    constructor Create(AServer: TclTcpServer; AConnection: TclCommandConnection; AOperation: TclTcpServerOperation);
    destructor Destroy; override;
  end;

procedure TclTcpServer.DoWriteConnection(AConnection: TclCommandConnection);
begin
end;

function TclTcpServer.GetConnection(Index: Integer): TclCommandConnection;
begin
  Result := TclCommandConnection(FServerThread.FConnections[Index]);
end;

function TclTcpServer.GetConnectionCount: Integer;
begin
  Result := FServerThread.FConnections.Count;
end;

procedure TclTcpServer.CloseConnection(AConnection: TclCommandConnection);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'CloseConnection');{$ENDIF}
  FServerThread.FConnections.Remove(AConnection);
  try
    AConnection.Close(False);
    DoCloseConnection(AConnection);
  finally
    AConnection._Release();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'CloseConnection'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'CloseConnection', E); raise; end; end;{$ENDIF}
end;

procedure TclTcpServer.DoGetCertificate(var ACertificate: TclCertificate; var Handled: Boolean);
begin
  if Assigned(OnGetCertificate) then
  begin
    OnGetCertificate(Self, ACertificate, Handled);
  end;
end;

procedure TclTcpServer.GetCertificate(Sender: TObject;
  var ACertificate: TclCertificate; var Handled: Boolean);
begin
  DoGetCertificate(ACertificate, Handled);
end;

procedure TclTcpServer.StartTls(AConnection: TclCommandConnection);
begin
  AConnection.NetworkStream := TclTlsNetworkStream.Create();
  TclTlsNetworkStream(AConnection.NetworkStream).OnGetCertificate := GetCertificate;
  TclTlsNetworkStream(AConnection.NetworkStream).TLSFlags := TLSFlags;
  TclTlsNetworkStream(AConnection.NetworkStream).RequireClientCertificate := RequireClientCertificate;
  TclTlsNetworkStream(AConnection.NetworkStream).OnVerifyPeer := VerifyClient;
  AConnection.OpenSession();
end;

procedure TclTcpServer.SetUseTLS(const Value: TclServerTlsMode);
begin
  FUseTLS := Value;
end;

function TclTcpServer.CreateConnection: TclCommandConnection;
begin
  Result := nil;
  DoCreateConnection(Result);
  if (Result = nil) then
  begin
    Result := CreateDefaultConnection();
  end;
end;

procedure TclTcpServer.DoCreateConnection(var AConnection: TclCommandConnection);
begin
  if Assigned(OnCreateConnection) then
  begin
    OnCreateConnection(Self, AConnection);
  end;
end;

procedure TclTcpServer.ServerError(E: Exception);
begin
  if FIsStart then
  begin
    FStartError := E.Message;
    if (E is EclSocketError) then
    begin
      FStartErrorCode := (E as EclSocketError).ErrorCode;
    end;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'ServerError', E);{$ENDIF}
  DoServerError(E);
end;

procedure TclTcpServer.VerifyClient(Sender: TObject;
  ACertificate: TclCertificate; const AStatusText: string;
  AStatusCode: Integer; var AVerified: Boolean);
var
  ns: TclNetworkStream;
begin
  ns := (Sender as TclNetworkStream);
  DoVerifyClient((ns.Connection as TclCommandConnection), ACertificate, AStatusText, AStatusCode, AVerified);
end;

procedure TclTcpServer.DoVerifyClient(AConnection: TclCommandConnection;
  ACertificate: TclCertificate; const AStatusText: string;
  AStatusCode: Integer; var AVerified: Boolean);
begin
  if Assigned(OnVerifyClient) then
  begin
    OnVerifyClient(Self, AConnection, ACertificate, AStatusText, AStatusCode, AVerified);
  end;
end;

{ TclTcpServerWorkItem }

constructor TclTcpServerWorkItem.Create(AServer: TclTcpServer;
  AConnection: TclCommandConnection; AOperation: TclTcpServerOperation);
begin
  inherited Create();
  FServer := AServer;
  FConnection := AConnection;
  FConnection._AddRef();
  FOperation := AOperation;
end;

destructor TclTcpServerWorkItem.Destroy;
begin
  FConnection._Release();
  inherited Destroy();
end;

procedure TclTcpServerWorkItem.DoRead;
var
  readStream: TStream;
begin
  readStream := TMemoryStream.Create();
  try
    FConnection.BeginWork();
    try
      if FConnection.FIsReading then Exit;
      FConnection.FIsReading := True;
      FConnection.ReadData(readStream);
    finally
      FConnection.FIsReading := False;
      FConnection.EndWork();
    end;
    FServer.DoReadConnection(FConnection, readStream);
  finally
    readStream.Free();
  end;
end;

procedure TclTcpServerWorkItem.DoWrite;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoWrite');{$ENDIF}
  FConnection.BeginWork();
  try
    if (FConnection.FWriteStream.Position < FConnection.FWriteStream.Size - 1) then
    begin
      FConnection.WriteData(FConnection.FWriteStream);
    end;
    FServer.DoWriteConnection(FConnection);
  finally
    FConnection.EndWork();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoWrite'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoWrite', E); raise; end; end;{$ENDIF}
end;          

procedure TclTcpServerWorkItem.Execute;
begin
  Assert(FServer <> nil);
  try
    FConnection.InitProgress(0, 0);
    case FOperation of
      soServerRead: DoRead();
      soServerWrite: DoWrite();
    end;
  except
    on EAbort do ;
    on E: Exception do
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Execute ServerError', E);{$ENDIF}
      FServer.ServerError(E);
    end;
  end;
end;

function TclTcpServer.GetMaxThreadCount: Integer;
begin
  Result := FWorkerThreadPool.MaxThreadCount;
end;

function TclTcpServer.GetMinThreadCount: Integer;
begin
  Result := FWorkerThreadPool.MinThreadCount;
end;

procedure TclTcpServer.ReadConnection(AConnection: TclCommandConnection);
begin
  if (AConnection = nil) then Exit;
  if not AConnection.FIsReading then
  begin
    FWorkerThreadPool.QueueWorkItem(TclTcpServerWorkItem.Create(Self, AConnection, soServerRead));
  end;
end;

procedure TclTcpServer.WriteConnection(AConnection: TclCommandConnection);
begin
  if (AConnection = nil) then Exit;
  FWorkerThreadPool.QueueWorkItem(TclTcpServerWorkItem.Create(Self, AConnection, soServerWrite));
end;

procedure TclTcpServer.SetMaxThreadCount(const Value: Integer);
begin
  FWorkerThreadPool.MaxThreadCount := Value;
end;

procedure TclTcpServer.SetMinThreadCount(const Value: Integer);
begin
  FWorkerThreadPool.MinThreadCount := Value;
end;

procedure TclTcpServer.Start;
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
    MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    IsCertDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  if (FServerThread <> nil) then
  begin
    raise EclSocketError.Create(cServerStarted, -1);
  end;

  FIsStart := True;
  try
    FStartError := '';
    FStartErrorCode := 0;

    FServerThread := TclServerThread.Create(Self);
    FServerThread.Start();

    if (FStartError <> '') or (FStartErrorCode <> 0) then
    begin
      InternalStop();

      if (FStartError = '') then
      begin
        FStartError := cStartError;
      end;
      if (FStartErrorCode = 0) then
      begin
        FStartErrorCode := -1;
      end;
      raise EclSocketError.Create(FStartError, FStartErrorCode);
    end;
  finally
    FIsStart := False;
  end;

  DoStart();
end;

procedure TclTcpServer.InternalStop;
begin
  FServerThread.Stop();
  FServerThread.Free();
  FServerThread := nil;
  FWorkerThreadPool.Stop();
end;

procedure TclTcpServer.Stop;
begin
  if (FServerThread = nil) then Exit;
  InternalStop();
  DoStop();
end;

{ TclServerThread }

constructor TclServerThread.Create(AServer: TclTcpServer);
begin
  inherited Create(True);
  FServer := AServer;
end;

procedure TclServerThread.Execute;
var
  dwResult: DWORD;
begin
  try
    FStopEvent := 0;
    FConnections := nil;
    FWindowHandle := 0;
    FServerSocket := INVALID_SOCKET;
    try
      OpenServerSocket();
      SetEvent(FStartedEvent);

      repeat
        dwResult := MsgWaitForMultipleObjects(1, FStopEvent, FALSE, INFINITE, QS_ALLEVENTS or QS_ALLINPUT);
        case dwResult of
          WAIT_OBJECT_0 + 1: DispatchMessages();
        end;
      until dwResult = WAIT_OBJECT_0;

    finally
      CloseServerSocket();
    end;
  except
    on E: Exception do
    begin
      Assert(FServer <> nil);
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Execute ServerError', E);{$ENDIF}
      FServer.ServerError(E);
    end;
  end;
  if (FStartedEvent <> 0) then
  begin
    SetEvent(FStartedEvent);
  end;
end;

procedure TclServerThread.CloseConnection(AConnection: TclCommandConnection);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'CloseConnection');{$ENDIF}
  if (AConnection = nil) or (FConnections.IndexOf(AConnection) < 0) then Exit;
  AConnection.BeginWork();
  try
    FConnections.Remove(AConnection);
  finally
    AConnection.EndWork();
  end;
  AConnection.Abort();
  FServer.CloseConnection(AConnection);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'CloseConnection'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'CloseConnection', E); raise; end; end;{$ENDIF}
end;

procedure TclServerThread.ReadConnection(AConnection: TclCommandConnection);
begin
  Assert(FServer <> nil);
  FServer.ReadConnection(AConnection);
end;

procedure TclServerThread.AcceptConnection;
var
  connection: TclCommandConnection;
  res: Integer;
begin
  Assert(FServer <> nil);
  connection := FServer.CreateConnection();
  try
    FConnections.Add(connection);
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'AcceptConnection');{$ENDIF}
    connection._AddRef();

    if (FServer.UseTLS = stImplicit) then
    begin
      connection.NetworkStream := TclTlsNetworkStream.Create();
      TclTlsNetworkStream(connection.NetworkStream).OnGetCertificate := FServer.GetCertificate;
      TclTlsNetworkStream(connection.NetworkStream).TLSFlags := FServer.TLSFlags;
      TclTlsNetworkStream(connection.NetworkStream).RequireClientCertificate := FServer.RequireClientCertificate;
      TclTlsNetworkStream(connection.NetworkStream).OnVerifyPeer := FServer.VerifyClient;
    end else
    begin
      connection.NetworkStream := TclNetworkStream.Create();
    end;

    connection.Socket := FServerSocket;
    connection.BatchSize := FServer.BatchSize;
    connection.BitsPerSec := FServer.BitsPerSec;
    connection.OnReady := AcceptConnectionDone;

    connection.AcceptConnection();
    
    res := WSAAsyncSelect(connection.Socket, FWindowHandle, CL_SOCKETEVENT, FD_READ + FD_WRITE + FD_CLOSE);
    if (res = SOCKET_ERROR) then
    begin
      RaiseSocketError(WSAGetLastError());
    end;

    connection.AcceptConnectionDone();
  except
    FServer.CloseConnection(connection);
    raise;
  end;
end;

procedure TclServerThread.AcceptConnectionDone(Sender: TObject);
begin
  FServer.DoAcceptConnection(Sender as TclCommandConnection);
  (Sender as TclCommandConnection).OnReady := nil;
end;

procedure TclServerThread.CloseServerSocket;
begin
  if (FServerSocket <> INVALID_SOCKET) then
  begin
    shutdown(FServerSocket, SD_BOTH);
    closesocket(FServerSocket);
  end;
  if (FWindowHandle <> 0) then
  begin
    DeallocateHWnd(FWindowHandle);
  end;
  ClearConnections();
  FConnections.Free();
  if (FStopEvent > 0) then
  begin
    CloseHandle(FStopEvent);
    FStopEvent := 0;
  end;
end;

procedure TclServerThread.OpenServerSocket;
var
  srv_address: TSockAddrIn;
  res: Integer;
begin
  FStopEvent := CreateEvent(nil, False, False, nil);
  if (FStopEvent = 0) then
  begin
    RaiseSocketError(GetLastError());
  end;

  FConnections := TList.Create();
  FWindowHandle := AllocateHWnd(WndProc);
  if (FWindowHandle = 0) then
  begin
    RaiseSocketError(GetLastError());
  end;

  FServerSocket := socket(AF_INET, SOCK_STREAM, 0);
  if (FServerSocket = INVALID_SOCKET) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  srv_address.sin_family := AF_INET;
  srv_address.sin_addr.s_addr := INADDR_ANY;

  if (FServer.Port <= 0) then
  begin
    raise EclSocketError.Create(cInvalidPort, -1);
  end;
  srv_address.sin_port := htons(FServer.Port);

  res := bind(FServerSocket, TSockAddr(srv_address), SizeOf(TSockAddrIn));
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  res := WSAAsyncSelect(FServerSocket, FWindowHandle, CL_SOCKETEVENT, FD_ACCEPT);
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  res := listen(FServerSocket, SOMAXCONN);
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;
end;

function TclServerThread.FindConnection(ASocket: TSocket): TclCommandConnection;
var
  i: Integer;
begin
  for i := 0 to FConnections.Count - 1 do
  begin
    Result := TclCommandConnection(FConnections[i]);
    if (Result.Socket = ASocket) then Exit;
  end;
  Result := nil;
end;

procedure TclServerThread.ClearConnections;
begin
  while FConnections.Count > 0 do
  begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'ClearConnections, %d', nil, [FConnections.Count]);{$ENDIF}
    TclCommandConnection(FConnections[FConnections.Count - 1])._Release();
    FConnections.Delete(FConnections.Count - 1);
  end;
end;

procedure TclServerThread.WndProc(var Message: TMessage);
begin
  if (Message.Msg <> CL_SOCKETEVENT) then Exit;
  case LOWORD(Message.lParam) of
    FD_ACCEPT: AcceptConnection();
    FD_READ: ReadConnection(FindConnection(TSocket(Message.wParam)));
    FD_WRITE: WriteConnection(FindConnection(TSocket(Message.wParam)));
    FD_CLOSE: CloseConnection(FindConnection(TSocket(Message.wParam)));
  end;
end;

procedure TclServerThread.DispatchMessages;
var
  msg: TMsg;
begin
  while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
  begin
    DispatchMessage(msg);
  end;
end;

procedure TclServerThread.Stop;
begin
  SetEvent(FStopEvent);
  WaitForSingleObject(Handle, INFINITE);
end;

procedure TclServerThread.WriteConnection(AConnection: TclCommandConnection);
begin
  Assert(FServer <> nil);
  FServer.WriteConnection(AConnection);
end;

procedure TclServerThread.Start;
begin
  FStartedEvent := CreateEvent(nil, False, False, nil);
  if (FStartedEvent = 0) then
  begin
    RaiseSocketError(GetLastError());
  end;
  try
    Resume();
    WaitForSingleObject(FStartedEvent, INFINITE);
  finally
    CloseHandle(FStartedEvent);
    FStartedEvent := 0;
  end;
end;

{ TclTcpCommandServer }

procedure TclTcpCommandServer.AddCommand(AInfo: TclTcpCommandInfo);
begin
  FCommands.Add(AInfo);
end;

procedure TclTcpCommandServer.ClearCommands;
var
  i: Integer;
begin
  for i := 0 to FCommands.Count - 1 do
  begin
    TObject(FCommands[i]).Free();
  end;
  FCommands.Clear();
end;

constructor TclTcpCommandServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCommands := TList.Create();
  RegisterCommands();
end;

procedure TclTcpCommandServer.DoReadConnection(AConnection: TclCommandConnection; AData: TStream);
var
  command: string;
begin
  inherited DoReadConnection(AConnection, AData);

  AData.Position := 0;
  SetLength(command, AData.Size);
  AData.Read(PChar(command)^, AData.Size);

  ProcessData(AConnection, command);
end;

function TclTcpCommandServer.GetCommand(const AName: string): TclTcpCommandInfo;
var
  i: Integer;
begin
  for i := 0 to FCommands.Count - 1 do
  begin
    Result := TclTcpCommandInfo(FCommands[i]);
    if (Result.Name = AName) then Exit;
  end;
  Result := nil;
end;

function TclTcpCommandServer.GetCommandParams(const AData: string): TclTcpCommandParams;
var
  ind: Integer;
begin
  Result := TclTcpCommandParams.Create();

  ind := Pos(#32, AData);
  if (ind > 0) then
  begin
    Result.Command := UpperCase(system.Copy(AData, 1, ind - 1));
    Result.Params := system.Copy(AData, ind + 1, Length(AData));
  end else
  begin
    Result.Command := UpperCase(AData);
  end;
end;

procedure TclTcpCommandServer.ProcessData(AConnection: TclCommandConnection;
  const AData: string);
var
  i: Integer;
  data: string;
  cmdList: TStrings;
  info: TclTcpCommandInfo;
  params: TclTcpCommandParams;
begin
  cmdList := TStringList.Create();
  try
    if AddTextStr(cmdList, AConnection.FCommandRaw + AData) and (cmdList.Count > 0) then
    begin
      AConnection.FCommandRaw := cmdList[cmdList.Count - 1];
      cmdList.Delete(cmdList.Count - 1);
    end else
    begin
      AConnection.FCommandRaw := '';
    end;

    for i := 0 to cmdList.Count - 1 do
    begin
      data := Trim(cmdList[i]);
      if (data <> '') then
      begin
        params := GetCommandParams(data);
        try
          info := GetCommand(params.Command);

          if (info <> nil) then
          begin
            ProcessCommand(AConnection, info, params);
          end else
          begin
            info := GetNullCommand(params.Command);
            try
              ProcessCommand(AConnection, info, params);
            finally
              info.Free();
            end;
          end;
        finally
          params.Free();
        end;
      end;
    end;
  finally
    cmdList.Free();
  end;
end;

procedure TclTcpCommandServer.DoProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
begin
  Assert(AInfo <> nil);
  Assert(AParams <> nil);
  DoReceiveCommand(AConnection, AParams.Command, AParams.Params);
  AInfo.Execute(AConnection, AParams);
end;

procedure TclTcpCommandServer.SendResponse(AConnection: TclCommandConnection;
  const ACommand, AResponse: string);
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'SendResponse, command: %s ', nil, [ACommand]);{$ENDIF}
  AConnection.WriteString(AResponse + #13#10);
  DoSendResponse(AConnection, ACommand, AResponse);
end;

procedure TclTcpCommandServer.SendResponse(AConnection: TclCommandConnection;
  const ACommand, AResponse: string; const Args: array of const);
begin
  SendResponse(AConnection, ACommand, Format(AResponse, Args));
end;

procedure TclTcpCommandServer.DoReceiveCommand(AConnection: TclCommandConnection;
  const ACommand, AParams: string);
begin
  if Assigned(OnReceiveCommand) then
  begin
    OnReceiveCommand(Self, AConnection, ACommand, AParams);
  end;
end;

procedure TclTcpCommandServer.DoSendResponse(
  AConnection: TclCommandConnection; const ACommand, AResponse: string);
begin
  if Assigned(OnSendResponse) then
  begin
    OnSendResponse(Self, AConnection, ACommand, AResponse);
  end;
end;

procedure TclTcpCommandServer.DoDestroy;
begin
  ClearCommands();
  FCommands.Free();
  inherited DoDestroy();
end;

procedure TclTcpCommandServer.DoWriteConnection(AConnection: TclCommandConnection);

  procedure WriteLine(AStream: TStream; const ALine: string);
  begin
    AStream.Write(PChar(ALine)^, Length(ALine));
  end;

const
  cDot = '.';
  cCRLF = #13#10;

var
  line: string;
  stream: TStream;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoWriteConnection');{$ENDIF}
  if (AConnection.FLines = nil) then Exit;

{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'DoWriteConnection, FLines <> nil');{$ENDIF}

  stream := TMemoryStream.Create();
  try
    while (AConnection.FCurrentLine < AConnection.FLines.Count) do
    begin
      line := AConnection.FLines[AConnection.FCurrentLine];

      if ((stream.Size + 3 + Length(line)) <= BatchSize) then
      begin
        if (Length(line) > 0) then
        begin
          if AConnection.FUseDotTerminator and (line[1] = '.') then
          begin
            WriteLine(stream, cDot);
          end;
          WriteLine(stream, line);
        end;
        WriteLine(stream, cCRLF);
      end else
      if (stream.Size > 0) then
      begin
        stream.Position := 0;
        AConnection.WriteData(stream);
        stream.Size := 0;
        stream.Position := 0;
        Continue;
      end;

      Inc(AConnection.FCurrentLine);
    end;

    if (stream.Size > 0) then
    begin
      stream.Position := 0;
      AConnection.WriteData(stream);
      stream.Size := 0;
      stream.Position := 0;
    end;

    WriteLine(stream, AConnection.FLinesTrailer + cCRLF);

    AConnection.SetLines(nil);
    AConnection.FLinesTrailer := '';

    stream.Position := 0;
    AConnection.WriteData(stream);
  finally
    stream.Free();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoWriteConnection'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoWriteConnection', E); raise; end; end;{$ENDIF}
end;

procedure TclTcpCommandServer.AddMultipleLines(AConnection: TclCommandConnection; ALines: TStrings);
begin
  AConnection.SetLines(ALines);
end;

procedure TclTcpCommandServer.SendMultipleLines(AConnection: TclCommandConnection;
  const ALinesTrailer: string; AUseDotTerminator: Boolean);
begin
  Assert(AConnection.FLines <> nil);
  AConnection.FLinesTrailer := ALinesTrailer;
  AConnection.FUseDotTerminator := AUseDotTerminator;
  DoWriteConnection(AConnection);
end;

function TclTcpCommandServer.CheckForEndOfData(const AData: string): Boolean;
var
  len: Integer;
begin
  len := Length(AData);
  Result := False;

  if (len > 4) then
  begin
    Result := (system.Copy(AData, len - 4, 5) = #13#10'.'#13#10); //TODO check
  end else
  if (len = 3) then
  begin
    Result := (AData = '.'#13#10);
  end;
end;

procedure TclTcpCommandServer.ProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
begin
  try
    DoProcessCommand(AConnection, AInfo, AParams);
  except
    on E: EclTcpCommandError do
    begin
      SendResponse(AConnection, E.Command, E.Message);
    end;
    on EAbort do ;
    on E: Exception do
    begin
      ProcessUnhandledError(AConnection, AParams, E);
      raise;
    end;
  end;
end;

procedure TclTcpCommandServer.ProcessUnhandledError(AConnection: TclCommandConnection;
  AParams: TclTcpCommandParams; E: Exception);
begin
end;

{ TclCommandConnection }

procedure TclCommandConnection.BeginWork;
begin
  FAccessor.Enter();
end;

constructor TclCommandConnection.Create;
begin
  inherited Create();
  FAccessor := TCriticalSection.Create();
  FWriteStream := TMemoryStream.Create();
end;

procedure TclCommandConnection.DoDestroy;
begin
  FLines.Free();
  FLines := nil;
  FWriteStream.Free();
  FAccessor.Free();
  inherited DoDestroy();
end;

procedure TclCommandConnection.EndWork;
begin
  FAccessor.Leave();
end;

procedure TclCommandConnection.SetLines(const Value: TStrings);
begin
  FCurrentLine := 0;
  FLines.Free();
  FLines := Value;
end;

procedure TclCommandConnection.WriteString(const AString: string);
var
  stream: TStream;
begin
  stream := TStringStream.Create(AString);
  try
    WriteData(stream);
  finally
    stream.Free();
  end;
end;

procedure TclCommandConnection.WriteData(AData: TStream);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'WriteData');{$ENDIF}
  inherited WriteData(AData);

  if (AData.Position < AData.Size - 1) then
  begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'WriteData, if (Size = 0), %d, %d', nil, [FWriteStream.Size, AData.Size]);{$ENDIF}
    if (FWriteStream.Size = 0) then
    begin
      FWriteStream.Size := 0;
      FWriteStream.Position := 0;
      FWriteStream.CopyFrom(AData, AData.Size - AData.Position);
      FWriteStream.Position := 0;
    end;
    raise EAbort.Create('Would Block');
  end;

  FWriteStream.Size := 0;
  FWriteStream.Position := 0;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'WriteData'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'WriteData', E); raise; end; end;{$ENDIF}
end;

function TclCommandConnection.GetIsTls: Boolean;
begin
  Result := (NetworkStream is TclTlsNetworkStream);
end;

{ EclTcpCommandError }

constructor EclTcpCommandError.Create(const ACommand, AErrorMsg: string; AErrorCode: Integer);
begin
  inherited Create(AErrorMsg, AErrorCode);
  FCommand := ACommand;
end;

end.
