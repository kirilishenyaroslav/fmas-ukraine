{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSocket;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  Classes, SysUtils, Windows, WinSock, Messages, clWinSock2;

type
  TclSocketProgress64Event = procedure(Sender: TObject; ABytesProceed, ATotalBytes: Int64) of object;
  TclSocketProgressEvent = procedure(Sender: TObject; ABytesProceed, ATotalBytes: Integer) of object;

  EclSocketError = class(Exception)
  private
    FErrorCode: Integer;
  public
    constructor Create(const AErrorMsg: string; AErrorCode: Integer);
    property ErrorCode: Integer read FErrorCode;
  end;

  TclNetworkStreamAction = (saNone, saRead, saWrite);
  
  TclConnection = class;

  TclNetworkStream = class
  private
    FConnection: TclConnection;
    FSleepEvent: THandle;
    FNextAction: TclNetworkStreamAction;
    FListenPort: Integer;
    FPeerName: string;
    FPeerIP: string;
    FHasReadData: Boolean;
    FPort: Integer;
    FIP: string;
    FNeedClose: Boolean;
    procedure DoSleep(AMilliseconds: Integer);
    function DoRecv(s: TSocket; var Buf; len, flags: Integer): Integer;
    function DoSend(s: TSocket; var Buf; len, flags: Integer): Integer;
    function GetConnection: TclConnection;
    function NeedStop: Boolean;
  protected
    procedure UpdateProgress(ABytesProceed: Int64); virtual;
    procedure StreamReady; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(ASource: TclNetworkStream); virtual;
    function Connect(const AIP: string; APort: Integer): Boolean; virtual;
    procedure Listen(APort: Integer); virtual;
    procedure Accept; virtual;
    procedure Close(ANotifyPeer: Boolean); virtual;
    function Read(AData: TStream): Boolean; virtual;
    function Write(AData: TStream): Boolean; virtual;
    function GetBatchSize: Integer; virtual;
    procedure OpenClientSession; virtual;
    procedure OpenServerSession; virtual;
    procedure ClearNextAction;
    procedure SetNextAction(Action: TclNetworkStreamAction);
    property Connection: TclConnection read GetConnection;
    property NextAction: TclNetworkStreamAction read FNextAction;
    property HasReadData: Boolean read FHasReadData write FHasReadData;
    property ListenPort: Integer read FListenPort;
    property PeerName: string read FPeerName;
    property PeerIP: string read FPeerIP;
    property IP: string read FIP;
    property Port: Integer read FPort;
    property NeedClose: Boolean read FNeedClose;
  end;
  
  TclConnection = class
  private
    FSocket: TSocket;
    FBatchSize: Integer;
    FIsAborted: Boolean;
    FNetworkStream: TclNetworkStream;
    FActive: Boolean;
    FBitsPerSec: Integer;
    FTotalBytesProceed: Int64;
    FBytesProceed: Int64;
    FTotalBytes: Int64;
    FBytesToProceed: Int64;
    FOnProgress: TclSocketProgress64Event;
    FOnReady: TNotifyEvent;
    function GetNetworkStream: TclNetworkStream;
    procedure SetNetworkStream(const Value: TclNetworkStream);
    procedure ShutdownSocket;
  protected
    function IsProceedLimit: Boolean;
    procedure DoDestroy; virtual;
    procedure DoProgress(ABytesProceed, ATotalBytes: Int64); virtual;
    procedure DoReady; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure DispatchNextAction; virtual; abstract;
    procedure InitProgress(ABytesProceed, ATotalBytes: Int64);
    procedure ReadData(AData: TStream); virtual; abstract;
    procedure WriteData(AData: TStream); virtual; abstract;
    procedure Close(ANotifyPeer: Boolean);
    procedure CloseSession(ANotifyPeer: Boolean);
    procedure Abort;
    property NetworkStream: TclNetworkStream read GetNetworkStream write SetNetworkStream;
    property IsAborted: Boolean read FIsAborted;
    property Active: Boolean read FActive;
    property BytesProceed: Int64 read FTotalBytesProceed;
    property Socket: TSocket read FSocket write FSocket;
    property BatchSize: Integer read FBatchSize write FBatchSize;
    property BitsPerSec: Integer read FBitsPerSec write FBitsPerSec;
    property BytesToProceed: Int64 read FBytesToProceed write FBytesToProceed;
    property OnProgress: TclSocketProgress64Event read FOnProgress write FOnProgress;
    property OnReady: TNotifyEvent read FOnReady write FOnReady;
  end;

  TclAsyncConnection = class(TclConnection)
  private
    FRefCount: Integer;
    function GetPeerIP: string;
    function GetPeerName: string;
  public
    constructor Create;
    procedure DispatchNextAction; override;
    procedure ReadData(AData: TStream); override;
    procedure WriteData(AData: TStream); override;
    procedure AcceptConnection;
    procedure AcceptConnectionDone;
    procedure OpenSession;
    function _AddRef: Integer;
    function _Release: Integer;
    property PeerName: string read GetPeerName;
    property PeerIP: string read GetPeerIP;
  end;

  TclSyncConnection = class(TclConnection)
  private
    FTimeOut: Integer;
    FSocketEvent: THandle;
    FIsReadUntilClose: Boolean;
    FTimeOutTicks: DWORD;
    procedure InitTimeOutTicks;
    procedure InternalReadData(AData: TStream);
    procedure InternalWriteData(AData: TStream);
  protected
    procedure CreateSocket(AStruct, AProtocol: Integer);
    procedure SelectSocketEvent(lNetworkEvents: DWORD);
    procedure DoDestroy; override;
  public
    constructor Create;
    procedure DispatchNextAction; override;
    procedure ReadData(AData: TStream); override;
    procedure WriteData(AData: TStream); override;
    procedure WriteString(const AString: string);
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property SocketEvent: THandle read FSocketEvent;
    property IsReadUntilClose: Boolean read FIsReadUntilClose write FIsReadUntilClose;
  end;

  TclUdpClientConnection = class(TclSyncConnection)
  private
    function GetIP: string;
    function GetPort: Integer;
  public
    procedure Open(const AIP: string; APort: Integer);
    property IP: string read GetIP;
    property Port: Integer read GetPort;
  end;

  TclTcpClientConnection = class(TclSyncConnection)
  private
    function GetIP: string;
    function GetPort: Integer;
  public
    procedure Open(const AIP: string; APort: Integer);
    procedure OpenSession;
    property IP: string read GetIP;
    property Port: Integer read GetPort;
  end;

  TclTcpServerConnection = class(TclSyncConnection)
  public
    function Open(APort: Integer): Integer;
    procedure AcceptConnection;
    procedure OpenSession;
  end;

  TclHostIPResolver = class
  private
    FAsyncError: Integer;
    FLookupHandle: THandle;
    FCompleted: THandle;
    FIsAborted: Boolean;
    function GetHostEntry(const AHostName: string; ATimeOut: Integer): PHostEnt;
    procedure WndProc(var Message: TMessage);
    procedure DestroyWindowHandle(AWndHandle: HWND);
  public
    function GetHostIP(const AHostName: string; ATimeOut: Integer): string;
    procedure Abort;
  end;
  
function GetLocalHost: string;
function GetHostIP(const AHostName: string; ATimeOut: Integer = 5000): string;
function GetWSAErrorText(AErrorCode: Integer): string;
procedure RaiseSocketError(AErrorCode: Integer); overload;
procedure RaiseSocketError(const AErrorMessage: string; AErrorCode: Integer); overload;

resourcestring
  cInvalidAddress = 'Invalid host address';
  cInvalidPort = 'Invalid port number';
  cTimeoutOccured = 'Timeout error occured';
  cBatchSizeInvalid = 'Invalid Batch Size';
  cNoNetworkStream = 'NetworkStream is required';

implementation

uses
  clUtils{$IFNDEF DELPHI6}, Forms{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

const
  CL_SOCKETEVENT = WM_USER + 2110;

function WaitForEvent(AEvent: THandle; ATimeOutTicks, ATimeOut: Integer): Boolean;
var
  res: DWORD;
  Msg: TMsg;
  events: array[0..0] of THandle;
begin
  events[0] := AEvent;
  res := MsgWaitForMultipleObjects(1, events, FALSE, DWORD(ATimeOut), QS_ALLEVENTS);
  case res of
    WAIT_FAILED:
      begin
        RaiseSocketError(WSAGetLastError());
      end;
    WAIT_TIMEOUT:
      begin
        RaiseSocketError(cTimeoutOccured, -1);
      end;
    WAIT_OBJECT_0 + 1:
      begin
        while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
        begin
          TranslateMessage(Msg);
          DispatchMessage(Msg);
          if Integer(GetTickCount()) - ATimeOutTicks > ATimeOut then
          begin
            RaiseSocketError(cTimeoutOccured, -1);
          end;
        end;
        if Integer(GetTickCount()) - ATimeOutTicks > ATimeOut then
        begin
          RaiseSocketError(cTimeoutOccured, -1);
        end;
      end;
  end;
  Result := (res = WAIT_OBJECT_0);
end;

type
  TclLookupComplete = record
    Msg: Cardinal;
    LookupHandle: THandle;
    AsyncBufLen: Word;
    AsyncError: Word;
    Result: Longint;
  end;

{ TclHostIPResolver }

procedure TclHostIPResolver.WndProc(var Message: TMessage);
begin
  if (Message.Msg = CL_SOCKETEVENT)
    and (TclLookupComplete(Message).LookupHandle = FLookupHandle) then
  begin
    FAsyncError := TclLookupComplete(Message).AsyncError;
    SetEvent(FCompleted);
  end;
end;

procedure TclHostIPResolver.DestroyWindowHandle(AWndHandle: HWND);
var
  lpMsg: TMsg;
begin
  while PeekMessage(lpMsg, AWndHandle, 0, 0, PM_REMOVE) do;
  DeallocateHWnd(AWndHandle);
end;

function TclHostIPResolver.GetHostEntry(const AHostName: string; ATimeOut: Integer): PHostEnt;
var
  wndHandle: HWND;
  hostData: PChar;
begin
  Result := AllocMem(MAXGETHOSTSTRUCT);
  try
    FCompleted := CreateEvent(nil, False, False, nil);
    wndHandle := AllocateHWnd(WndProc);
    try
      FAsyncError := 0;
      hostData := PChar(Result);
      FLookupHandle := WSAAsyncGetHostByName(wndHandle, CL_SOCKETEVENT, PChar(AHostName), hostData, MAXGETHOSTSTRUCT);
      if (FLookupHandle = 0) then
      begin
        RaiseSocketError(WSAGetLastError());
      end;

      FIsAborted := False;
      repeat
        try
          if WaitForEvent(FCompleted, GetTickCount(), ATimeOut) then Break;
        except
          WSACancelAsyncRequest(FLookupHandle);
          FLookupHandle := 0;
          raise;
        end;
      until FIsAborted;
      FLookupHandle := 0;

      if (FAsyncError <> 0) then
      begin
        RaiseSocketError(FAsyncError);
      end;
    finally
      DestroyWindowHandle(wndHandle);
      CloseHandle(FCompleted);
    end;
  except
    FreeMem(Result);
    raise;
  end;
end;

function TclHostIPResolver.GetHostIP(const AHostName: string; ATimeOut: Integer): string;
var
  hostEnt: PHostEnt;
  addrList: PChar;
begin
  hostEnt := GetHostEntry(AHostName, ATimeOut);
  try
    addrList := hostEnt^.h_addr_list^;
    Result := Format('%d.%d.%d.%d',
      [Ord(addrList[0]), Ord(addrList[1]), Ord(addrList[2]), Ord(addrList[3])]);
  finally
    FreeMem(hostEnt);
  end;
end;

function GetLocalHost: string;
var
  LocalName: array[0..255] of Char;
begin
  Result := '';
  if gethostname(LocalName, SizeOf(LocalName)) = 0 then
    Result := LocalName;
end;

function GetHostIP(const AHostName: string; ATimeOut: Integer): string;
var
  resolver: TclHostIPResolver;
begin
  resolver := TclHostIPResolver.Create();
  try
    Result := resolver.GetHostIP(AHostName, ATimeOut);
  finally
    resolver.Free();
  end;
end;

function GetWSAErrorText(AErrorCode: Integer): string;
var
  Buffer: array[0..255] of Char;
begin
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, AErrorCode, 0, Buffer, SizeOf(Buffer), nil);
  Result := Trim(Buffer);
end;

procedure RaiseSocketError(AErrorCode: Integer);
begin
  raise EclSocketError.Create(GetWSAErrorText(AErrorCode), AErrorCode);
end;

procedure RaiseSocketError(const AErrorMessage: string; AErrorCode: Integer);
begin
  raise EclSocketError.Create(AErrorMessage, AErrorCode);
end;

procedure TclHostIPResolver.Abort;
begin
  FIsAborted := True;
  if (FLookupHandle <> 0) then
  begin
    WSACancelAsyncRequest(FLookupHandle);
  end;
end;

{ TclConnection }

constructor TclConnection.Create;
begin
  inherited Create();
  FSocket := INVALID_SOCKET;
  FBatchSize := 8192;
  FBytesToProceed := -1;
end;

destructor TclConnection.Destroy;
begin
  try
    Close(False);
  except
    on EclSocketError do ;
  end;
  DoDestroy();
  inherited Destroy();
end;

procedure TclConnection.ShutdownSocket;
begin
  FActive := False;
  if (FSocket <> INVALID_SOCKET) then
  begin
    shutdown(FSocket, SD_BOTH);
    closesocket(FSocket);
    FSocket := INVALID_SOCKET;
  end;
end;

procedure TclConnection.CloseSession(ANotifyPeer: Boolean);
begin
  NetworkStream.Close(ANotifyPeer);
  if ANotifyPeer then
  begin
    DispatchNextAction();
  end;
end;

procedure TclConnection.Close(ANotifyPeer: Boolean);
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Close');{$ENDIF}
  try
    if Active then
    begin
      CloseSession(ANotifyPeer);
    end;
  finally
    ShutdownSocket();
  end;
end;

procedure TclConnection.Abort;
begin
  FIsAborted := True;
end;

procedure TclConnection.DoDestroy;
begin
  NetworkStream := nil;
end;

procedure TclConnection.DoProgress(ABytesProceed, ATotalBytes: Int64);
begin
  if Assigned(OnProgress) then
  begin
    OnProgress(Self, ABytesProceed, ATotalBytes);
  end;
end;

procedure TclConnection.InitProgress(ABytesProceed, ATotalBytes: Int64);
begin
  FTotalBytesProceed := ABytesProceed;
  FBytesProceed := 0;
  FTotalBytes := ATotalBytes;
end;

function TclConnection.IsProceedLimit: Boolean;
begin
  Result := (FBytesToProceed > -1) and (FBytesToProceed <= FBytesProceed);
end; 

procedure TclConnection.SetNetworkStream(const Value: TclNetworkStream);
begin
  if (FNetworkStream = Value) then Exit;

  if (FNetworkStream <> nil) and (Value <> nil) then
  begin
    Value.Assign(FNetworkStream);
  end;
  
  FNetworkStream.Free();
  FNetworkStream := Value;

  if (FNetworkStream <> nil) then
  begin
    FNetworkStream.FConnection := Self;
  end;
end;

function TclConnection.GetNetworkStream: TclNetworkStream;
begin
  if (FNetworkStream = nil) then
  begin
    raise EclSocketError.Create(cNoNetworkStream, -1);
  end;
  Result := FNetworkStream;
end;

procedure TclConnection.DoReady;
begin
  if Assigned(OnReady) then
  begin
    OnReady(Self);
  end;
end;

{ TclTcpClientConnection }

function TclTcpClientConnection.GetIP: string;
begin
  Result := NetworkStream.IP;
end;

function TclTcpClientConnection.GetPort: Integer;
begin
  Result := NetworkStream.Port;
end;

procedure TclTcpClientConnection.Open(const AIP: string; APort: Integer);
var
  res: Integer;
  networkEvents: TWSANetworkEvents;
  isReadIntilCloseOld: Boolean;
begin
  isReadIntilCloseOld := IsReadUntilClose;
  IsReadUntilClose := False;
  
  CreateSocket(SOCK_STREAM, IPPROTO_TCP);
  SelectSocketEvent(FD_CONNECT);

  if not NetworkStream.Connect(AIP, APort) then
  begin
    InitTimeOutTicks();

    repeat
      if WaitForEvent(SocketEvent, FTimeOutTicks, TimeOut) then
      begin
        res := WSAEnumNetworkEvents(Socket, SocketEvent, @networkEvents);
        if (res = SOCKET_ERROR) then
        begin
          RaiseSocketError(WSAGetLastError());
        end;
        if ((networkEvents.lNetworkEvents and FD_CONNECT) > 0) then
        begin
          if (networkEvents.iErrorCode[FD_CONNECT_BIT] <> 0) then
          begin
            RaiseSocketError(networkEvents.iErrorCode[FD_CONNECT_BIT]);
          end;
          Break;
        end;
      end;
    until IsAborted;
  end;

  SelectSocketEvent(FD_READ or FD_CLOSE or FD_WRITE);
  
  if IsAborted then
  begin
    Close(False);
  end else
  begin
    FActive := True;
    DispatchNextAction();
    NetworkStream.StreamReady();
  end;

  IsReadUntilClose := isReadIntilCloseOld;
end;

procedure TclTcpClientConnection.OpenSession;
var
  isReadIntilCloseOld: Boolean;
begin
  Assert(Active);
  
  isReadIntilCloseOld := IsReadUntilClose;
  IsReadUntilClose := False;

  NetworkStream.OpenClientSession();

  if IsAborted then
  begin
    Close(False);
  end else
  begin
    DispatchNextAction();
    NetworkStream.StreamReady();
  end;
  
  IsReadUntilClose := isReadIntilCloseOld;
end;

{ TclTcpServerConnection }

function TclTcpServerConnection.Open(APort: Integer): Integer;
begin
  CreateSocket(SOCK_STREAM, IPPROTO_TCP);
  NetworkStream.Listen(APort);
  Result := NetworkStream.ListenPort;
end;

procedure TclTcpServerConnection.AcceptConnection;
var
  sock: TSocket;
  res: Integer;
  networkEvents: TWSANetworkEvents;
  isReadIntilCloseOld: Boolean;
begin
  isReadIntilCloseOld := IsReadUntilClose;
  IsReadUntilClose := False;

  SelectSocketEvent(FD_ACCEPT);

  InitTimeOutTicks();

  repeat
    if WaitForEvent(SocketEvent, FTimeOutTicks, TimeOut) then
    begin
      res := WSAEnumNetworkEvents(Socket, SocketEvent, @networkEvents);
      if (res = SOCKET_ERROR) then
      begin
        RaiseSocketError(WSAGetLastError());
      end;
      if ((networkEvents.lNetworkEvents and FD_ACCEPT) > 0) then
      begin
        if (networkEvents.iErrorCode[FD_ACCEPT_BIT] <> 0) then
        begin
          RaiseSocketError(networkEvents.iErrorCode[FD_ACCEPT_BIT]);
        end;
        Break;
      end;
    end;
  until IsAborted;

  sock := Socket;
  NetworkStream.Accept();
  winsock.closesocket(sock);

  SelectSocketEvent(FD_READ or FD_CLOSE or FD_WRITE);

  if IsAborted then
  begin
    Close(False);
  end else
  begin
    FActive := True;
    DispatchNextAction();
    NetworkStream.StreamReady();
  end;

  IsReadUntilClose := isReadIntilCloseOld;
end;

procedure TclTcpServerConnection.OpenSession;
var
  isReadIntilCloseOld: Boolean;
begin
  Assert(Active);
  
  isReadIntilCloseOld := IsReadUntilClose;
  IsReadUntilClose := False;

  NetworkStream.OpenServerSession();

  if IsAborted then
  begin
    Close(False);
  end else
  begin
    DispatchNextAction();
    NetworkStream.StreamReady();
  end;
  
  IsReadUntilClose := isReadIntilCloseOld;
end;

{ EclSocketError }

constructor EclSocketError.Create(const AErrorMsg: string; AErrorCode: Integer);
begin
  inherited Create(AErrorMsg);
  FErrorCode := AErrorCode;
end;

{ TclSyncConnection }

constructor TclSyncConnection.Create;
begin
  inherited Create();
  //TODOFSocketEvent := CreateEvent(nil, False, False, nil);
  FSocketEvent := WSACreateEvent();
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'FSocketEvent created');{$ENDIF}
  if (FSocketEvent = WSA_INVALID_EVENT) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;
  TimeOut := 5000;
end;

procedure TclSyncConnection.DoDestroy;
begin
  if (FSocketEvent <> WSA_INVALID_EVENT) then
  begin
    WSACloseEvent(FSocketEvent);
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'FSocketEvent closed');{$ENDIF}
  end;
  inherited DoDestroy();
end;

procedure TclSyncConnection.InitTimeOutTicks;
begin
  FTimeOutTicks := GetTickCount();
end;

procedure TclSyncConnection.WriteString(const AString: string);
var
  Data: TStream;
begin
  Data := TStringStream.Create(AString);
  try
    WriteData(Data);
    Assert(Data.Position >= (Data.Size - 1));
  finally
    Data.Free()
  end;
end;

procedure TclSyncConnection.SelectSocketEvent(lNetworkEvents: DWORD);
var
  res: Integer;
begin
  res := WSAEventSelect(Socket, SocketEvent, lNetworkEvents);
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;
end;

procedure TclSyncConnection.InternalReadData(AData: TStream);
var
  res: Integer;
  networkEvents: TWSANetworkEvents;
{$IFDEF LOGGER}
  oldSize: Int64;
{$ENDIF}
begin
  InitTimeOutTicks();

{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'InternalReadData begin, NextAction = %d', nil, [Integer(NetworkStream.NextAction)]);
  oldSize := 0;
  if (AData <> nil) then
  begin
    oldSize := AData.Size;
  end;
  try
{$ENDIF}
  if NetworkStream.HasReadData then
  begin
    NetworkStream.HasReadData := False;
    NetworkStream.Read(AData);
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalReadData: HasReadData', AData, oldSize);{$ENDIF}

    if (not IsReadUntilClose) or (not Active) then
    begin
      if not Active then
      begin
        NetworkStream.ClearNextAction();
      end;
      
      Exit;
    end;
  end;

  repeat
    if not Active then
    begin
      RaiseSocketError(WSAENOTSOCK);
    end;

    if WaitForEvent(SocketEvent, FTimeOutTicks, TimeOut) then
    begin
      res := WSAEnumNetworkEvents(Socket, SocketEvent, @networkEvents);
      if (res = SOCKET_ERROR) then
      begin
        RaiseSocketError(WSAGetLastError());
      end;
      if ((networkEvents.lNetworkEvents and FD_READ) > 0) then
      begin
        if (networkEvents.iErrorCode[FD_READ_BIT] <> 0) then
        begin
          RaiseSocketError(networkEvents.iErrorCode[FD_READ_BIT]);
        end;
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalReadData inside repeat-until, before NetworkStream.Read');{$ENDIF}
        {$IFDEF LOGGER}
          res := Integer(NetworkStream.Read(AData));
        {$ELSE}
          NetworkStream.Read(AData);
        {$ENDIF}
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalReadData inside repeat-until, after NetworkStream.Read, %d', nil, [res]);{$ENDIF}
        if not IsReadUntilClose then
        begin
          Break;
        end;
        InitTimeOutTicks();
      end;

      if ((networkEvents.lNetworkEvents and FD_CLOSE) > 0) then
      begin
        if (networkEvents.iErrorCode[FD_CLOSE_BIT] <> 0) then
        begin
          RaiseSocketError(networkEvents.iErrorCode[FD_CLOSE_BIT]);
        end;
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalReadData inside repeat-until, FD_CLOSE');{$ENDIF}
        Close(False);
        Break;
      end;

      if NetworkStream.NeedClose then
      begin
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalReadData inside NetworkStream.NeedClose');{$ENDIF}
        Close(False);
        Break;
      end;
    end;
  until NetworkStream.NeedStop();

{$IFDEF LOGGER}
  finally
    if (AData <> nil) and ((AData.Size - oldSize) > 0) then
    begin
      clPutLogMessage(Self, edInside, 'InternalReadData, received data', AData, oldSize);
    end;
    clPutLogMessage(Self, edInside, 'InternalReadData end, NextAction = %d', nil, [Integer(NetworkStream.NextAction)]);
  end;
{$ENDIF}
end;

procedure TclSyncConnection.ReadData(AData: TStream);
begin
  InternalReadData(AData);
  repeat
    case NetworkStream.NextAction of
      saRead: InternalReadData(nil);
      saWrite: WriteData(nil);
    else
      Break;
    end;
  until False;
end;

procedure TclSyncConnection.InternalWriteData(AData: TStream);
var
  res: Integer;
  networkEvents: TWSANetworkEvents;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InternalWriteData');{$ENDIF}
  InitTimeOutTicks();

  if NetworkStream.Write(AData) then Exit;

  repeat
    if WaitForEvent(SocketEvent, FTimeOutTicks, TimeOut) then
    begin
      res := WSAEnumNetworkEvents(Socket, SocketEvent, @networkEvents);
      if (res = SOCKET_ERROR) then
      begin
        RaiseSocketError(WSAGetLastError());
      end;

      if ((networkEvents.lNetworkEvents and FD_READ) > 0) then
      begin
        if (networkEvents.iErrorCode[FD_READ_BIT] <> 0) then
        begin
          RaiseSocketError(networkEvents.iErrorCode[FD_READ_BIT]);
        end;
        NetworkStream.HasReadData := True;
      end;

      if ((networkEvents.lNetworkEvents and FD_WRITE) > 0) then
      begin
        if (networkEvents.iErrorCode[FD_WRITE_BIT] <> 0) then
        begin
          RaiseSocketError(networkEvents.iErrorCode[FD_WRITE_BIT]);
        end;
        InitTimeOutTicks();

        if NetworkStream.Write(AData) then Break;
      end;

      if ((networkEvents.lNetworkEvents and FD_CLOSE) > 0) then
      begin
        if (networkEvents.iErrorCode[FD_CLOSE_BIT] <> 0) then
        begin
          RaiseSocketError(networkEvents.iErrorCode[FD_CLOSE_BIT]);
        end;
        Close(False);
        Break;
      end;
    end;
  until NetworkStream.NeedStop();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InternalWriteData'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InternalWriteData', E); raise; end; end;{$ENDIF}
end;

procedure TclSyncConnection.WriteData(AData: TStream);
begin
  InternalWriteData(AData);
  repeat
    case NetworkStream.NextAction of
      saRead: ReadData(nil);
      saWrite: InternalWriteData(nil)
    else
      Break;
    end;
  until False;
end;

procedure TclSyncConnection.CreateSocket(AStruct, AProtocol: Integer);
begin
  Assert(Socket = INVALID_SOCKET);
  Socket := winsock.socket(AF_INET, AStruct, AProtocol);
  if (Socket = INVALID_SOCKET) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;
end;

procedure TclSyncConnection.DispatchNextAction;
begin
  case NetworkStream.NextAction of
    saRead: ReadData(nil);
    saWrite: WriteData(nil);
  end;
end;

{ TclAsyncConnection }

procedure TclAsyncConnection.AcceptConnection;
begin
  NetworkStream.Accept();
  FActive := True;
end;

constructor TclAsyncConnection.Create;
begin
  inherited Create();
  FRefCount := 0;
end;

function TclAsyncConnection._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount);
(*{$IFDEF LOGGER}clPutLogMessage(Self, edInside, '_AddRef, %d', nil, [FRefCount]);{$ENDIF}*)
end;

function TclAsyncConnection._Release: Integer;
begin
  if (Self <> nil) then
  begin
    Result := InterlockedDecrement(FRefCount);
    if (Result = 0) then
    begin
(*      {$IFDEF LOGGER}clPutLogMessage(Self, edInside, '_Release.Destroy');{$ENDIF}*)
      Destroy();
    end;
  end else
  begin
    Result := 0;
  end;
(*{$IFDEF LOGGER}clPutLogMessage(Self, edInside, '_Release, %d', nil, [FRefCount]);{$ENDIF}*)
end;

function TclAsyncConnection.GetPeerIP: string;
begin
  Result := NetworkStream.PeerIP;
end;

function TclAsyncConnection.GetPeerName: string;
begin
  Result := NetworkStream.PeerName;
end;

procedure TclAsyncConnection.ReadData(AData: TStream);
begin
  NetworkStream.Read(AData);
end;

procedure TclAsyncConnection.WriteData(AData: TStream);
begin
  NetworkStream.Write(AData);
end;

procedure TclAsyncConnection.DispatchNextAction;
begin
end;

procedure TclAsyncConnection.AcceptConnectionDone;
begin
  NetworkStream.StreamReady();
end;

procedure TclAsyncConnection.OpenSession;
begin
  NetworkStream.OpenServerSession();
end;

{ TclUdpClientConnection }

function TclUdpClientConnection.GetIP: string;
begin
  Result := NetworkStream.IP;
end;

function TclUdpClientConnection.GetPort: Integer;
begin
  Result := NetworkStream.Port;
end;

procedure TclUdpClientConnection.Open(const AIP: string; APort: Integer);
var
  isReadIntilCloseOld: Boolean;
begin
  isReadIntilCloseOld := IsReadUntilClose;
  IsReadUntilClose := False;
  
  CreateSocket(SOCK_DGRAM, IPPROTO_UDP);
  NetworkStream.Connect(AIP, APort);
  SelectSocketEvent(FD_READ or FD_CLOSE or FD_WRITE);
  FActive := True;
  DispatchNextAction();
  NetworkStream.StreamReady();

  IsReadUntilClose := isReadIntilCloseOld;
end;

{ TclNetworkStream }

procedure TclNetworkStream.Accept;
var
  client_addr: TSockAddrIn;
  hostInfo: PHostEnt;
  addrList: PChar;
  len: Integer;
begin
  ClearNextAction();

  len := SizeOf(client_addr);
  Connection.Socket := winsock.accept(Connection.Socket, PSOCKADDR(@client_addr), @len);
  if (Connection.Socket = INVALID_SOCKET) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  hostInfo := gethostbyaddr(@client_addr.sin_addr.S_addr, SizeOf(TSockAddr), AF_INET);
  if (hostInfo <> nil) then
  begin
    addrList := hostInfo^.h_addr_list^;
    FPeerIP := Format('%d.%d.%d.%d',
      [Ord(addrList[0]), Ord(addrList[1]), Ord(addrList[2]), Ord(addrList[3])]);
    FPeerName := Trim(string(hostInfo^.h_name));
    if (PeerName = '') then
    begin
      FPeerName := PeerIP;
    end;
  end;
end;

procedure TclNetworkStream.Close(ANotifyPeer: Boolean);
begin
  ClearNextAction();
end;

constructor TclNetworkStream.Create;
begin
  inherited Create();
  FSleepEvent := CreateEvent(nil, False, False, nil);
end;

destructor TclNetworkStream.Destroy;
begin
  if (FSleepEvent <> INVALID_HANDLE_VALUE) then
  begin
    CloseHandle(FSleepEvent);
    FSleepEvent := INVALID_HANDLE_VALUE;
  end;
  inherited Destroy();
end;

function TclNetworkStream.DoRecv(s: TSocket; var Buf; len, flags: Integer): Integer;
var
  err: Integer;
begin
  Result := winsock.recv(s, Buf, len, flags);
  if Connection.BitsPerSec > 0 then
  begin
    err := WSAGetLastError();
    try
      DoSleep((len * 8 * 1000) div Connection.BitsPerSec);
    finally
      SetLastError(err);
    end;
  end;
end;

function TclNetworkStream.DoSend(s: TSocket; var Buf; len, flags: Integer): Integer;
var
  err: Integer;
begin
  Result := winsock.send(s, Buf, len, flags);
  if Connection.BitsPerSec > 0 then
  begin
    err := WSAGetLastError();
    try
      DoSleep((len * 8 * 1000) div Connection.BitsPerSec);
    finally
      SetLastError(err);
    end;
  end;
end;

procedure TclNetworkStream.DoSleep(AMilliseconds: Integer);
var
  Msg: TMsg;
  res: DWORD;
  events: array[0..0] of THandle;
  sleepTicks: DWORD;
begin
  events[0] := FSleepEvent;
  sleepTicks := GetTickCount();
  repeat
    res := MsgWaitForMultipleObjects(1, events, FALSE, DWORD(AMilliseconds), QS_ALLEVENTS);
    case res of
      WAIT_TIMEOUT,
      WAIT_OBJECT_0:
        begin
          Break;
        end;
      WAIT_OBJECT_0 + 1:
        begin
          while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
          begin
            TranslateMessage(Msg);
            DispatchMessage(Msg);
            if Integer(GetTickCount() - sleepTicks) > AMilliseconds then
            begin
              Break;
            end;
          end;
          if Integer(GetTickCount() - sleepTicks) > AMilliseconds then
          begin
            Break;
          end;
        end;
    end;
  until False;
end;

function TclNetworkStream.GetConnection: TclConnection;
begin
  Assert(FConnection <> nil);
  Result := FConnection;
end;

function TclNetworkStream.GetBatchSize: Integer;
begin
  if (Connection.BatchSize < 1) then
  begin
    RaiseSocketError(cBatchSizeInvalid, -1);
  end;

  Result := Connection.BatchSize;
  if (Connection.BytesToProceed > -1) and ((Connection.BytesToProceed - Connection.FBytesProceed) < Result) then
  begin
    Result := (Connection.BytesToProceed - Connection.FBytesProceed);
  end;
end;

procedure TclNetworkStream.Listen(APort: Integer);
var
  sa: TSockAddr;
  srv_address: TSockAddrIn;
  res, useNonblock, saLen: Integer;
begin
  ClearNextAction();

  srv_address.sin_family := AF_INET;
  srv_address.sin_addr.s_addr := INADDR_ANY;
  srv_address.sin_port := htons(APort);

  res := winsock.bind(Connection.Socket, TSockAddr(srv_address), SizeOf(TSockAddrIn));
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  useNonblock := 1;
  winsock.ioctlsocket(Connection.Socket, FIONBIO, useNonblock);

  res := winsock.listen(Connection.Socket, 1);
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  saLen := SizeOf(sa);
  res := winsock.getsockname(Connection.Socket, sa, saLen);
  if (res = SOCKET_ERROR) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  FListenPort := ntohs(sa.sin_port);
  FIP := '';
  FPort := APort;
end;

function TclNetworkStream.NeedStop: Boolean;
begin
  Result := Connection.IsAborted or Connection.IsProceedLimit()
end;

function TclNetworkStream.Connect(const AIP: string; APort: Integer): Boolean;
var
  sock_address: TSockAddrIn;
  res, addr: Integer;
begin
  ClearNextAction();

  addr := inet_addr(PChar(AIP));
  if (addr = Integer(INADDR_NONE)) then
  begin
    RaiseSocketError(cInvalidAddress, -1);
  end;

  sock_address.sin_family := AF_INET;

  if (APort <= 0) then
  begin
    RaiseSocketError(cInvalidPort, -1);
  end;
  
  sock_address.sin_port := htons(APort);
  sock_address.sin_addr.S_addr := addr;

  res := winsock.connect(Connection.Socket, TSockAddr(sock_address), sizeof(sock_address));

  Result := (res <> SOCKET_ERROR);
  if not Result and (WSAGetLastError() <> WSAEWOULDBLOCK) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  FIP := AIP;
  FPort := APort;
end;

function TclNetworkStream.Read(AData: TStream): Boolean;
var
  bytesRead, toRead: Integer;
  buf: PChar;
begin
  ClearNextAction();
  Result := True;

  toRead := GetBatchSize();
  if (toRead <= 0) then Exit;

  GetMem(buf, toRead);
  if (buf = nil) then
  begin
    RaiseSocketError(GetLastError());
  end;
  try
    repeat
      bytesRead := DoRecv(Connection.Socket, buf^, GetBatchSize(), 0);
      Result := (bytesRead <> SOCKET_ERROR);
      if not Result and (WSAGetLastError() <> WSAEWOULDBLOCK) then
      begin
        RaiseSocketError(WSAGetLastError());
      end;
      
      if Result and (bytesRead > 0) then
      begin
        AData.Write(buf^, bytesRead);
        UpdateProgress(bytesRead);
      end;

      if (bytesRead = 0) then
      begin
        FNeedClose := True;
      end;
    until (not Result) or (not (bytesRead > 0)) or NeedStop();

  finally
    FreeMem(buf)
  end;
end;

procedure TclNetworkStream.UpdateProgress(ABytesProceed: Int64);
begin
  Connection.FBytesProceed := Connection.FBytesProceed + ABytesProceed;
  Connection.FTotalBytesProceed := Connection.FTotalBytesProceed + ABytesProceed;
  Connection.DoProgress(Connection.FTotalBytesProceed, Connection.FTotalBytes);
end;

function TclNetworkStream.Write(AData: TStream): Boolean;
var
  buf: PChar;
  written, toWrite: Integer;
  total: Int64;
begin
  ClearNextAction();
  Result := True;

  if (AData.Size = 0) then Exit;

  toWrite := GetBatchSize();
  if (toWrite <= 0) then Exit;

  GetMem(buf, toWrite);
  if (buf = nil) then
  begin
    RaiseSocketError(GetLastError());
  end;
  try
    total := AData.Position;
    repeat
      toWrite := GetBatchSize();
      if (toWrite > (AData.Size - total)) then
      begin
        toWrite := (AData.Size - total);
      end;
      AData.Read(buf^, toWrite);

{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'TclNetworkStream.Write');{$ENDIF}
      written := DoSend(Connection.Socket, buf^, toWrite, 0);
      Result := (written <> SOCKET_ERROR);
      if not Result and (WSAGetLastError() <> WSAEWOULDBLOCK) then
      begin
        RaiseSocketError(WSAGetLastError());
      end;

      if Result then
      begin
        total := total + written;
        if (written < toWrite) then
        begin
          AData.Position := AData.Position - toWrite + written;
        end;
        UpdateProgress(written);
      end else
      begin
        AData.Position := AData.Position - toWrite;
        total := AData.Size;
      end;
    until (not Result) or (not (total < AData.Size)) or NeedStop();
  finally
    FreeMem(buf)
  end;
end;

procedure TclNetworkStream.ClearNextAction;
begin
  FNeedClose := False;
  FNextAction := saNone;
end;

procedure TclNetworkStream.SetNextAction(Action: TclNetworkStreamAction);
begin
  if (FNextAction = saNone) then
  begin
    FNextAction := Action;
  end;
end;

procedure TclNetworkStream.StreamReady;
begin
  Connection.DoReady();
end;

procedure TclNetworkStream.OpenClientSession;
begin
end;

procedure TclNetworkStream.OpenServerSession;
begin
end;

procedure TclNetworkStream.Assign(ASource: TclNetworkStream);
begin
  FListenPort := ASource.ListenPort;
  FPeerName := ASource.PeerName;
  FPeerIP := ASource.PeerIP;
  FIP := ASource.IP;
  FPort := ASource.Port;
end;

end.
