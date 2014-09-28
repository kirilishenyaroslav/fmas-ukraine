{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clTcpClient;

interface

{$I clVer.inc}

uses
  Classes, clTlsSocket, clSocket, clCert, clSspi;

type
  TclTcpTextEvent = procedure(Sender: TObject; const AText: string) of object;
  TclTcpListEvent = procedure(Sender: TObject; AList: TStrings) of object;

  TclClientTlsMode = (ctNone, ctAutomatic, ctImplicit, ctExplicit);

  TclTcpClient = class(TComponent)
  private
    FConnection: TclTcpClientConnection;
    FServer: string;
    FPort: Integer;
    FUseTLS: TclClientTlsMode;
    FInProgress: Boolean;
    FOnChanged: TNotifyEvent;
    FOnClose: TNotifyEvent;
    FOnOpen: TNotifyEvent;
    FOnGetCertificate: TclOnGetCertificateEvent;
    FOnVerifyServer: TclOnVerifyPeerEvent;
    FCertificateFlags: TclCertificateFlags;
    FTLSFlags: TclTlsFlags;
    FIPResolver: TclHostIPResolver;
    procedure SetServer(const Value: string);
    procedure SetPort_(const Value: Integer);
    procedure SetBatchSize(const Value: Integer);
    procedure SetTimeOut(const Value: Integer);
    procedure SetBitsPerSec(const Value: Integer);
    procedure SetCertificateFlags(const Value: TclCertificateFlags);
    procedure SetTLSFlags(const Value: TclTlsFlags);
    function GetBatchSize: Integer;
    function GetBitsPerSec: Integer;
    function GetTimeOut: Integer;
    function GetActive: Boolean;
    function GetIsTls: Boolean;
  protected
    procedure GetCertificate(Sender: TObject; var ACertificate: TclCertificate; var Handled: Boolean);
    procedure VerifyServer(Sender: TObject; ACertificate: TclCertificate;
      const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean);
    procedure CheckConnected;
    procedure ExplicitStartTls;
    procedure AssignTlsStream(AConnection: TclSyncConnection);
    function GetDefaultPort: Integer; virtual;
    procedure OpenConnection(const AServer: string; APort: Integer); virtual;
    procedure InternalOpen; virtual;
    procedure InternalClose; virtual;
    procedure SetUseTLS(const Value: TclClientTlsMode); virtual;
    procedure DoDestroy; virtual;
    procedure Changed; dynamic;
    procedure DoOpen; dynamic;
    procedure DoClose; dynamic;
    procedure DoGetCertificate(var ACertificate: TclCertificate; var Handled: Boolean); dynamic;
    procedure DoVerifyServer(ACertificate: TclCertificate;
      const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure StartTls; virtual;
    property IsTls: Boolean read GetIsTls;
    property Connection: TclTcpClientConnection read FConnection;
    property Active: Boolean read GetActive;
    property Server: string read FServer write SetServer;
    property Port: Integer read FPort write SetPort_;
    property BatchSize: Integer read GetBatchSize write SetBatchSize default 8192;
    property TimeOut: Integer read GetTimeOut write SetTimeOut default 60000;
    property UseTLS: TclClientTlsMode read FUseTLS write SetUseTLS default ctNone;
    property CertificateFlags: TclCertificateFlags read FCertificateFlags write SetCertificateFlags default [];
    property TLSFlags: TclTlsFlags read FTLSFlags write SetTLSFlags default [tfUseTLS];
    property BitsPerSec: Integer read GetBitsPerSec write SetBitsPerSec default 0;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnGetCertificate: TclOnGetCertificateEvent read FOnGetCertificate write FOnGetCertificate;
    property OnVerifyServer: TclOnVerifyPeerEvent read FOnVerifyServer write FOnVerifyServer;
  end;

  TclTcpCommandClient = class(TclTcpClient)
  private
    FUserName: string;
    FPassword: string;
    FResponse: TStrings;
    FLastResponseCode: Integer;
    FOnReceiveResponse: TclTcpListEvent;
    FOnSendCommand: TclTcpTextEvent;
    FOnProgress: TclSocketProgressEvent;
    FOnProgress64: TclSocketProgress64Event;
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    function ReceiveResponse(AddToLastString: Boolean): Boolean;
    function IsOkResponse(AResponseCode: Integer; const AOkResponses: array of Integer): Boolean;
    procedure DoDataProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
  protected
    procedure InternalOpen; override;
    procedure InternalClose; override;
    procedure DoDestroy; override;
    procedure OpenSession; virtual; abstract;
    procedure CloseSession; virtual; abstract;
    function GetResponseCode(const AResponse: string): Integer; virtual;
    function ParseResponse(AStartFrom: Integer; const AOkResponses: array of Integer): Integer;
    function InternalWaitingResponse(AStartFrom: Integer;
      const AOkResponses: array of Integer): Integer;
    procedure WaitingResponse(const AOkResponses: array of Integer); virtual;
    procedure InternalSendCommandSync(const ACommand: string;
      const AOkResponses: array of Integer); virtual;
    procedure DoSendCommand(const AText: string); dynamic;
    procedure DoReceiveResponse(AList: TStrings); dynamic;
    procedure DoProgress(ABytesProceed, ATotalBytes: Int64); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SendCommand(const ACommand: string);
    procedure SendCommandSync(const ACommand: string;
      const AOkResponses: array of Integer); overload;
    procedure SendCommandSync(const ACommand: string;
      const AOkResponses: array of Integer; const Args: array of const); overload;
    procedure SendSilentCommand(const ACommand: string;
      const AOkResponses: array of Integer); overload;
    procedure SendSilentCommand(const ACommand: string;
      const AOkResponses: array of Integer; const Args: array of const); overload;
    procedure SendMultipleLines(ALines: TStrings);
    procedure WaitMultipleLines(ATotalBytes: Int64); virtual;
    property Response: TStrings read FResponse;
    property LastResponseCode: Integer read FLastResponseCode;
    property UserName: string read FUserName write SetUserName;
    property Password: string read FPassword write SetPassword;
    property OnSendCommand: TclTcpTextEvent read FOnSendCommand write FOnSendCommand;
    property OnReceiveResponse: TclTcpListEvent read FOnReceiveResponse write FOnReceiveResponse;
    property OnProgress: TclSocketProgressEvent read FOnProgress write FOnProgress;
    property OnProgress64: TclSocketProgress64Event read FOnProgress64 write FOnProgress64;
  end;

resourcestring
  cNotConnectedError = 'The connection is not active';
  cLineSizeInvalid = 'The data line length must be lower or equal to BatchSize';

const
  SOCKET_WAIT_RESPONSE = 0;
  SOCKET_DOT_RESPONSE = 1;

implementation

uses
  SysUtils, WinSock, clUtils{$IFDEF DEMO}, Forms, Windows{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

{ TclTcpClient }

procedure TclTcpClient.Changed;
begin
  if Assigned(FOnChanged) then
  begin
    FOnChanged(Self);
  end;
end;

procedure TclTcpClient.CheckConnected;
begin
  if not Active then
  begin
    RaiseSocketError(cNotConnectedError, -1);
  end;
  Assert(FConnection <> nil);
end;

procedure TclTcpClient.Close;
var
  b: Boolean;
begin
  FIPResolver.Abort();
  b := Active;
  InternalClose();
  if b then
  begin
    DoClose();
  end;
end;

constructor TclTcpClient.Create(AOwner: TComponent);
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
  FIPResolver := TclHostIPResolver.Create();
  FConnection := TclTcpClientConnection.Create();
  BatchSize := 8192;
  TimeOut := 60000;
  BitsPerSec := 0;
  FUseTLS := ctNone;
  FTLSFlags := [tfUseTLS];
end;

destructor TclTcpClient.Destroy;
begin
  Close();
  DoDestroy();
  FConnection.Free();
  FIPResolver.Free();
  WSACleanup();
  inherited Destroy();
end;

procedure TclTcpClient.DoClose;
begin
  if Assigned(OnClose) then
  begin
    OnClose(Self);
  end;
end;

procedure TclTcpClient.DoDestroy;
begin
end;

procedure TclTcpClient.DoOpen;
begin
  if Assigned(OnOpen) then
  begin
    OnOpen(Self);
  end;
end;

procedure TclTcpClient.InternalClose;
begin
  FConnection.Close(True);
end;

procedure TclTcpClient.InternalOpen;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' +
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end;
{$ENDIF}
{$ENDIF}

  if (BatchSize < 1) then
  begin
    RaiseSocketError(cBatchSizeInvalid, -1);
  end;
  OpenConnection(Server, Port);
end;

procedure TclTcpClient.Open;
begin
  if Active then Exit;
  try
    InternalOpen();
    DoOpen();
  except
    FInProgress := True;
    try
      Close();
    except
      on EclSocketError do ;
    end;
    FInProgress := False;

    raise;
  end;
end;

procedure TclTcpClient.SetBatchSize(const Value: Integer);
begin
  if (BatchSize <> Value) then
  begin
    Connection.BatchSize := Value;
    Changed();
  end;
end;

procedure TclTcpClient.SetPort_(const Value: Integer);
begin
  if (FPort <> Value) then
  begin
    FPort := Value;
    Changed();
  end;
end;

procedure TclTcpClient.SetServer(const Value: string);
begin
  if (FServer <> Value) then
  begin
    FServer := Value;
    Changed();
  end;
end;

procedure TclTcpClient.SetTimeOut(const Value: Integer);
begin
  if (TimeOut <> Value) then
  begin
    Connection.TimeOut := Value;
    Changed();
  end;
end;

procedure TclTcpClient.SetUseTLS(const Value: TclClientTlsMode);
begin
  if (FUseTLS <> Value) then
  begin
    FUseTLS := Value;
    Changed();
  end;
end;

procedure TclTcpClient.SetBitsPerSec(const Value: Integer);
begin
  if (BitsPerSec <> Value) then
  begin
    Connection.BitsPerSec := Value;
    Changed();
  end;
end;

function TclTcpClient.GetBatchSize: Integer;
begin
  Result := Connection.BatchSize;
end;

function TclTcpClient.GetBitsPerSec: Integer;
begin
  Result := Connection.BitsPerSec;
end;

function TclTcpClient.GetTimeOut: Integer;
begin
  Result := Connection.TimeOut;
end;

function TclTcpClient.GetActive: Boolean;
begin
  Result := Connection.Active;
end;

procedure TclTcpClient.DoGetCertificate(var ACertificate: TclCertificate; var Handled: Boolean);
begin
  if Assigned(OnGetCertificate) then
  begin
    OnGetCertificate(Self, ACertificate, Handled);
  end;
end;

procedure TclTcpClient.GetCertificate(Sender: TObject;
  var ACertificate: TclCertificate; var Handled: Boolean);
begin
  DoGetCertificate(ACertificate, Handled);
end;

function TclTcpClient.GetDefaultPort: Integer;
begin
  Result := 0;
end;

procedure TclTcpClient.AssignTlsStream(AConnection: TclSyncConnection);
var
  tlsStream: TclTlsNetworkStream;
begin
  tlsStream := TclTlsNetworkStream.Create();
  AConnection.NetworkStream := tlsStream;
  tlsStream.CertificateFlags := CertificateFlags;
  tlsStream.TLSFlags := TLSFlags;
  tlsStream.TargetName := Server;
  tlsStream.OnGetCertificate := GetCertificate;
  tlsStream.OnVerifyPeer := VerifyServer;
end;

procedure TclTcpClient.OpenConnection(const AServer: string; APort: Integer);
var
  ip: string;
  addr: Integer;
begin
  ip := AServer;
  addr := inet_addr(PChar(ip));
  if (addr = Integer(INADDR_NONE)) then
  begin
    ip := FIPResolver.GetHostIP(ip, TimeOut);
  end;

  if ((UseTLS = ctAutomatic) and (Port <> GetDefaultPort()))
    or (UseTLS = ctImplicit) then
  begin
    AssignTlsStream(Connection);
  end else
  begin
    Connection.NetworkStream := TclNetworkStream.Create();
  end;

  Connection.Open(ip, APort);
end;

procedure TclTcpClient.ExplicitStartTls;
begin
  if ((UseTLS = ctAutomatic) and (Port = GetDefaultPort()))
    or (UseTLS = ctExplicit) then
  begin
    StartTls();
  end;
end;

procedure TclTcpClient.StartTls;
begin
  if (UseTLS = ctNone) then
  begin
    UseTLS := ctExplicit;
  end;
  try
    AssignTlsStream(Connection);
    Connection.OpenSession();
  except
    FInProgress := True;
    try
      Close();
    except
      on EclSocketError do ;
    end;
    FInProgress := False;

    raise;
  end;
end;

procedure TclTcpClient.DoVerifyServer(ACertificate: TclCertificate;
  const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean);
begin
  if Assigned(OnVerifyServer) then
  begin
    OnVerifyServer(Self, ACertificate, AStatusText, AStatusCode, AVerified);
  end;
end;

procedure TclTcpClient.VerifyServer(Sender: TObject; ACertificate: TclCertificate;
  const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean);
begin
  DoVerifyServer(ACertificate, AStatusText, AStatusCode, AVerified);
end;

procedure TclTcpClient.SetCertificateFlags(const Value: TclCertificateFlags);
begin
  if (FCertificateFlags <> Value) then
  begin
    FCertificateFlags := Value;
    Changed();
  end;
end;

procedure TclTcpClient.SetTLSFlags(const Value: TclTlsFlags);
begin
  if (FTLSFlags <> Value) then
  begin
    FTLSFlags := Value;
    Changed();
  end;
end;

function TclTcpClient.GetIsTls: Boolean;
begin
  Result := (Connection.NetworkStream is TclTlsNetworkStream);
end;

{ TclTcpCommandClient }

procedure TclTcpCommandClient.SendCommand(const ACommand: string);
var
  cmd: string;
begin
  CheckConnected();
  cmd := ACommand + #13#10;
  Connection.InitProgress(0, 0);
  Connection.WriteString(cmd);
  DoSendCommand(cmd);
end;

function TclTcpCommandClient.ReceiveResponse(AddToLastString: Boolean): Boolean;
var
  stream: TStream;
begin
  stream := TMemoryStream.Create();
  try
    Connection.ReadData(stream);
    stream.Position := 0;
    Result := AddTextStream(Response, stream, AddToLastString);
  finally
    stream.Free();
  end;
end;

function TclTcpCommandClient.IsOkResponse(AResponseCode: Integer; const AOkResponses: array of Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := Low(AOkResponses);
  while (i <= High(AOkResponses)) and (AOkResponses[i] <> 0) do
  begin
    if (AOkResponses[i] = AResponseCode) then
    begin
      Result := True;
      Break;
    end;
    Inc(i);
  end;
end;

procedure TclTcpCommandClient.WaitingResponse(const AOkResponses: array of Integer);
begin
  Response.Clear();
  InternalWaitingResponse(0, AOkResponses);
  DoReceiveResponse(Response);
end;

procedure TclTcpCommandClient.InternalSendCommandSync(const ACommand: string;
  const AOkResponses: array of Integer);
begin
  SendCommand(ACommand);
  WaitingResponse(AOkResponses);
end;

procedure TclTcpCommandClient.SendCommandSync(const ACommand: string;
  const AOkResponses: array of Integer);
begin
  FInProgress := True;
  try
    InternalSendCommandSync(ACommand, AOkResponses);
  finally
    FInProgress := False;
  end;
end;

procedure TclTcpCommandClient.SendCommandSync(const ACommand: string;
  const AOkResponses: array of Integer; const Args: array of const);
begin
  SendCommandSync(Format(ACommand, Args), AOkResponses);
end;

procedure TclTcpCommandClient.SetPassword(const Value: string);
begin
  if (FPassword <> Value) then
  begin
    FPassword := Value;
    Changed();
  end;
end;

procedure TclTcpCommandClient.SetUserName(const Value: string);
begin
  if (FUserName <> Value) then
  begin
    FUserName := Value;
    Changed();
  end;
end;

constructor TclTcpCommandClient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FResponse := TStringList.Create();
end;

function TclTcpCommandClient.GetResponseCode(const AResponse: string): Integer;
begin
  Result := SOCKET_WAIT_RESPONSE;
end;

procedure TclTcpCommandClient.InternalClose;
begin
  try
    if Active and not FInProgress then
    begin
      CloseSession();
    end;
  finally
    inherited InternalClose();
  end;
end;

procedure TclTcpCommandClient.InternalOpen;
begin
  inherited InternalOpen();
  OpenSession();
end;

procedure TclTcpCommandClient.SendMultipleLines(ALines: TStrings);
const
  cDot = '.';
  cCRLF = #13#10;

  procedure WriteLine(AStream: TStream; const ALine: string);
  begin
    AStream.Write(PChar(ALine)^, Length(ALine));
  end;

  function GetTotalBytes(ALines: TStrings): Int64;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to ALines.Count - 1 do
    begin
      if (Length(ALines[i]) + Length(cCRLF) + 1 > BatchSize) then
      begin
        RaiseSocketError(cLineSizeInvalid, -1);
      end;
      Result := Result + Length(ALines[i]) + Length(cCRLF);
    end;
  end;
var
  i: Integer;
  stream: TStream;
  line: string;
begin
  if (BatchSize < 1) then
  begin
    RaiseSocketError(cBatchSizeInvalid, -1);
  end;

  stream := TMemoryStream.Create();
  Connection.OnProgress := DoDataProgress;
  FInProgress := True;
  try
    i := 0;
    line := '';
    Connection.InitProgress(0, GetTotalBytes(ALines));

    while (i < ALines.Count) do
    begin
      line := ALines[i];
      if ((stream.Size + 3 + Length(line)) <= BatchSize) then
      begin
        if (Length(line) > 0) then
        begin
          if (line[1] = '.') then
          begin
            WriteLine(stream, cDot);
          end;
          WriteLine(stream, line);
        end;
        WriteLine(stream, cCRLF);
      end else
      begin
        stream.Position := 0;
        Connection.WriteData(stream);
        stream.Position := 0;
        stream.Size := 0;

        Continue;
      end;
      Inc(i);
    end;

    if (stream.Size > 0) then
    begin
      stream.Position := 0;
      Connection.WriteData(stream);
    end;
  finally
    FInProgress := False;
    Connection.OnProgress := nil;
    stream.Free();
  end;
end;

procedure TclTcpCommandClient.DoReceiveResponse(AList: TStrings);
begin
  if Assigned(OnReceiveResponse) then
  begin
    OnReceiveResponse(Self, AList);
  end;
end;

procedure TclTcpCommandClient.DoSendCommand(const AText: string);
begin
  if Assigned(OnSendCommand) then
  begin
    OnSendCommand(Self, AText);
  end;
end;

procedure TclTcpCommandClient.DoProgress(ABytesProceed, ATotalBytes: Int64);
begin
  if Assigned(OnProgress) then
  begin
    OnProgress(Self, ABytesProceed, ATotalBytes);
  end;
  if Assigned(OnProgress64) then
  begin
    OnProgress64(Self, ABytesProceed, ATotalBytes);
  end;
end;

procedure TclTcpCommandClient.DoDestroy;
begin
  FResponse.Free();
  inherited DoDestroy();
end;

procedure TclTcpCommandClient.WaitMultipleLines(ATotalBytes: Int64);

  function CheckForDotTerminator: Boolean;
  begin
    Result := (Response.Count > 0) and (Response[Response.Count - 1] = '.');
  end;

  procedure RemoveResponseLine;
  begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'WaitMultipleLines, RemoveResponseLine');{$ENDIF}
    if (Response.Count > 0) then
    begin
      Response.Delete(0);
    end;
  end;

  procedure RemoveDotTerminatorLine;
  begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'WaitMultipleLines, RemoveDotTerminatorLine');{$ENDIF}
    Assert(Response.Count > 0);
    Response.Delete(Response.Count - 1);
  end;

  procedure ReplaceLeadingDotTerminator;
  var
    i: Integer;
  begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'WaitMultipleLines, ReplaceLeadingDotTerminator');{$ENDIF}
    for i := 0 to Response.Count - 1 do
    begin
      if (system.Pos('..', Response[i]) = 1) then
      begin
        Response[i] := system.Copy(Response[i], 2, Length(Response[i]));
      end;
    end;
  end;

begin
  Connection.OnProgress := DoDataProgress;
  FInProgress := True;
  try
    if (ATotalBytes > 0) then
    begin
      Connection.InitProgress(GetStringsSize(Response), ATotalBytes);
    end else
    begin
      Connection.InitProgress(0, 0);
    end;

    RemoveResponseLine();
    if not CheckForDotTerminator then
    begin
      InternalWaitingResponse(0, [SOCKET_DOT_RESPONSE]);
    end;
    ReplaceLeadingDotTerminator();
    RemoveDotTerminatorLine();
  finally
    FInProgress := False;
    Connection.OnProgress := nil;
  end;
  if (ATotalBytes > 0) then
  begin
    DoProgress(ATotalBytes, ATotalBytes);
  end;
end;

procedure TclTcpCommandClient.DoDataProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
begin
  if (ABytesProceed <= ATotalBytes) then
  begin
    DoProgress(ABytesProceed, ATotalBytes);
  end;
end;

function TclTcpCommandClient.ParseResponse(AStartFrom: Integer; const AOkResponses: array of Integer): Integer;
var
  i, tempCode: Integer;
begin
  Result := -1;
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ParseResponse');{$ENDIF}
  for i := AStartFrom to Response.Count - 1 do
  begin
    tempCode := GetResponseCode(Response[i]);
    if (tempCode <> SOCKET_WAIT_RESPONSE) then
    begin
      FLastResponseCode := tempCode;
      if IsOkResponse(LastResponseCode, AOkResponses) then
      begin
        Result := i;
        Exit;
      end;
    end;
  end;
{$IFDEF LOGGER}
  finally
    if(Result > -1) then
    begin
      clPutLogMessage(Self, edLeave, 'ParseResponse %d, %s', nil, [Result, Response[Result]]);
    end else
    begin
      clPutLogMessage(Self, edLeave, 'ParseResponse %d', nil, [Result]);
    end;
  end;
{$ENDIF}
end;

function TclTcpCommandClient.InternalWaitingResponse(AStartFrom: Integer;
  const AOkResponses: array of Integer): Integer;
var
  keepLastString: Boolean;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InternalWaitingResponse');{$ENDIF}
  Result := -1;
  keepLastString := False;
  repeat
    keepLastString := ReceiveResponse(keepLastString);

    if keepLastString then
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalWaitingResponse inside if(keepLastString)then');{$ENDIF}
      Continue;
    end;

    FLastResponseCode := SOCKET_WAIT_RESPONSE;

    if (Response.Count = AStartFrom) and (Length(AOkResponses) = 0) then
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalWaitingResponse inside if(Response.Count = AStartFrom)');{$ENDIF}
      Break;
    end;

    Result := ParseResponse(AStartFrom, AOkResponses);
    if Result > -1 then
    begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'InternalWaitingResponse inside if(Result > -1)');{$ENDIF}
      Break;
    end;

    if not ((Length(AOkResponses) = 1) and (AOkResponses[Low(AOkResponses)] = SOCKET_DOT_RESPONSE))
      and (LastResponseCode <> SOCKET_WAIT_RESPONSE) then
    begin
      RaiseSocketError(Trim(Response.Text), LastResponseCode);
    end;
  until False;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InternalWaitingResponse'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InternalWaitingResponse', E); raise; end; end;{$ENDIF}
end;

procedure TclTcpCommandClient.SendSilentCommand(const ACommand: string;
  const AOkResponses: array of Integer; const Args: array of const);
begin
  try
    SendCommandSync(ACommand, AOkResponses, Args);
  except
    on EclSocketError do ;
  end;
end;

procedure TclTcpCommandClient.SendSilentCommand(const ACommand: string;
  const AOkResponses: array of Integer);
begin
  try
    SendCommandSync(ACommand, AOkResponses);
  except
    on EclSocketError do ;
  end;
end;

end.
