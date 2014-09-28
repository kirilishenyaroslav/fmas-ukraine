{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSmtpServer;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  Classes, SysUtils, WinSock, clTcpServer, clSocket, clUserMgr, clMCUtils,
  clEncoder, clSspi, clSspiAuth;

type
  TclSmtpUserAccountItem = class(TclUserAccountItem)
  private
    FEmail: string;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Email: string read FEmail write FEmail;
  end;

  TclSmtpUserAccountList = class(TclUserAccountList)
  private
    function GetItem(Index: Integer): TclSmtpUserAccountItem;
    procedure SetItem(Index: Integer; const Value: TclSmtpUserAccountItem);
  public
    function Add: TclSmtpUserAccountItem;
    function AccountByEmail(const AEmail: string): TclSmtpUserAccountItem;
    property Items[Index: Integer]: TclSmtpUserAccountItem read GetItem write SetItem; default;
  end;

  TclSmtpConnectionState = (csSmtpConnect, csSmtpHelo, csSmtpMail, csSmtpRcpt, csSmtpData);

  TclSmtpReceivingData = (rdSmtpCommand, rdSmtpUser, rdSmtpPassword, rdSmtpCramMD5, rdSmtpNTLM, rdSmtpData);

  TclSmtpMailFromAction = (mfAccept, mfReject);

  TclSmtpRcptToAction = (rtAddressOk, rtRelayDenied, rtBadAddress, rtForward, rtNotForward,
    rtTooManyAddresses, rtDisabled);

  TclSmtpMailDataAction = (mdNone, mdOk, mdMailBoxFull, mdSystemFull, mdProcessingError, mdTransactionFailed);

  TclSmtpCommandConnection = class(TclCommandConnection)
  private
    FConnectionState: TclSmtpConnectionState;
    FReceivingData: TclSmtpReceivingData;
    FUserName: string;
    FIsEHLO: Boolean;
    FIsAuthorized: Boolean;
    FCramMD5Key: string;
    FNTLMAuth: TclNtAuthServerSspi;
    FMailFrom: string;
    FRcptToList: TStrings;
    FRawData: TMemoryStream;
    procedure Reset;
  protected
    procedure DoDestroy; override;
  public
    constructor Create;
    procedure InitParams;
    property ConnectionState: TclSmtpConnectionState read FConnectionState;
    property ReceivingData: TclSmtpReceivingData read FReceivingData;
    property IsEHLO: Boolean read FIsEHLO;
    property IsAuthorized: Boolean read FIsAuthorized;
    property UserName: string read FUserName;
    property CramMD5Key: string read FCramMD5Key;
    property MailFrom: string read FMailFrom;
    property RcptToList: TStrings read FRcptToList;
    property RawData: TMemoryStream read FRawData;
  end;

  TclSmtpCommandHandler = procedure (AConnection: TclSmtpCommandConnection;
    const ACommand, AParams: string) of object;

  TclSmtpCommandInfo = class(TclTcpCommandInfo)
  private
    FHandler: TclSmtpCommandHandler;
  protected
    procedure Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams); override;
  end;

  TclSmtpLoginAuthenticateEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection;
    Account: TclSmtpUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean) of object;

  TclSmtpAuthAuthenticateEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection;
    Account: TclSmtpUserAccountItem; const AKey, AHash: string; var IsAuthorized, Handled: Boolean) of object;
    
  TclSmtpMailFromEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection;
    const AMailFrom: string; var Action: TclSmtpMailFromAction) of object;

  TclSmtpRecipientToEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection;
    const ARcptTo: string; var AForwardTo: string; var Action: TclSmtpRcptToAction) of object;

  TclSmtpMessageReceivedEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection;
    const ARecipient: string; IsFinalDelivery: Boolean; AMessage: TStrings;
    var Action: TclSmtpMailDataAction) of object;

  TclSmtpConnectionEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection) of object;

  TclSmtpDispatchMessageEvent = procedure (Sender: TObject; AConnection: TclSmtpCommandConnection;
    ARelayHeader: TStrings; AMessage: TStream; var Action: TclSmtpMailDataAction) of object;

  TclSmtpServer = class(TclTcpCommandServer)
  private
    FUserAccounts: TclSmtpUserAccountList;
    FUseAuth: Boolean;
    FSASLFlags: TclServerSaslFlags;
    FMaxRecipients: Integer;
    FHelpText: TStrings;
    FOnAuthAuthenticate: TclSmtpAuthAuthenticateEvent;
    FOnLoginAuthenticate: TclSmtpLoginAuthenticateEvent;
    FOnMailFrom: TclSmtpMailFromEvent;
    FOnRecipientTo: TclSmtpRecipientToEvent;
    FOnMessageReceived: TclSmtpMessageReceivedEvent;
    FOnStateChanged: TclSmtpConnectionEvent;
    FOnDispatchReceivedMessage: TclSmtpDispatchMessageEvent;
    procedure HandleNullCommand(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleAUTH(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleDATA(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleEHLO(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleHELO(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleMAIL(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleNOOP(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleQUIT(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleRCPT(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleRSET(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTARTTLS(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleHELP(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);

    procedure HandleEndCommand(AConnection: TclSmtpCommandConnection;
      const ACommand: string; AHandler: TclSmtpCommandHandler);
    procedure HandleUser(AConnection: TclSmtpCommandConnection; AData: TStream);
    procedure HandleUserEnd(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePassword(AConnection: TclSmtpCommandConnection; AData: TStream);
    procedure HandlePasswordEnd(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleCramMD5(AConnection: TclSmtpCommandConnection; AData: TStream);
    procedure HandleCramMD5End(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleNTLM(AConnection: TclSmtpCommandConnection; AData: TStream);
    procedure HandleNTLMEnd(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure HandleDataLine(AConnection: TclSmtpCommandConnection; AData: TStream);
    procedure HandleDataLineEnd(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
    procedure RaiseBadSequenceError(const ACommand: string);
    procedure RaiseSyntaxError(const ACommand: string);
    procedure SetUserAccounts(const Value: TclSmtpUserAccountList);
    function GetCaseInsensitive: Boolean;
    procedure SetCaseInsensitive(const Value: Boolean);
    function LoginAuthenticate(AConnection: TclSmtpCommandConnection;
      Account: TclUserAccountItem; const APassword: string): Boolean;
    function CramMD5Authenticate(AConnection: TclSmtpCommandConnection;
      Account: TclUserAccountItem; const AKey, AHash: string): Boolean;
    function NtlmAuthenticate(AConnection: TclSmtpCommandConnection; Account: TclUserAccountItem): Boolean;
    procedure CheckAuthAbort(AConnection: TclSmtpCommandConnection; const AParams: string); overload;
    procedure CheckAuthAbort(AConnection: TclSmtpCommandConnection; AParams: TStream); overload;
    function IsRoutedMail(const AEmail: string): Boolean;
    function GetMessageID(AMessage: TStrings): string;
    procedure ChangeState(AConnection: TclSmtpCommandConnection; ANewState: TclSmtpConnectionState);
    procedure CheckTlsMode(AConnection: TclSmtpCommandConnection; const ACommand: string);
    procedure SetHelpText(const Value: TStrings);
    procedure FillDefaultHelpText;
    function GetAuthData(AConnection: TclSmtpCommandConnection; AEncoder: TclEncoder): string;
    function ProcessReceivedMessage(AConnection: TclSmtpCommandConnection;
      IsFinalDelivery: Boolean; ARecipientPos: Integer; AMessage: TStrings): TclSmtpMailDataAction;
    function DispatchReceivedMessage(AConnection: TclSmtpCommandConnection): TclSmtpMailDataAction;
    procedure FillRelayHeader(AConnection: TclSmtpCommandConnection; AHeader: TStrings);
  protected
    procedure AddSmtpCommand(const ACommand: string; AHandler: TclSmtpCommandHandler);
    procedure RegisterCommands; override;
    function GetNullCommand(const ACommand: string): TclTcpCommandInfo; override;
    procedure DoReadConnection(AConnection: TclCommandConnection; AData: TStream); override;
    procedure ProcessUnhandledError(AConnection: TclCommandConnection;
      AParams: TclTcpCommandParams; E: Exception); override;
    procedure DoProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams); override;
    procedure DoAcceptConnection(AConnection: TclCommandConnection); override;
    function CreateDefaultConnection: TclCommandConnection; override;
    procedure DoDestroy; override;
    function GenCramMD5Key: string; virtual;
    function GenMessageID: string; virtual;
    procedure DoAuthAuthenticate(AConnection: TclSmtpCommandConnection;
      Account: TclSmtpUserAccountItem; const AKey, AHash: string;
      var IsAuthorized, Handled: Boolean); virtual;
    procedure DoLoginAuthenticate(AConnection: TclSmtpCommandConnection;
      Account: TclSmtpUserAccountItem; const APassword: string;
      var IsAuthorized, Handled: Boolean); virtual;
    procedure DoMailFrom(AConnection: TclSmtpCommandConnection; const AMailFrom: string;
      var Action: TclSmtpMailFromAction); virtual;
    procedure DoRecipientTo(AConnection: TclSmtpCommandConnection; const ARcptTo: string; var AForwardTo: string;
      var Action: TclSmtpRcptToAction); virtual;
    procedure DoMessageReceived(AConnection: TclSmtpCommandConnection;
      const ARecipient: string; IsFinalDelivery: Boolean; AMessage: TStrings;
      var Action: TclSmtpMailDataAction); virtual;
    procedure DoStateChanged(AConnection: TclSmtpCommandConnection); virtual;
    procedure DoDispatchReceivedMessage(AConnection: TclSmtpCommandConnection;
      ARelayHeader: TStrings; AMessage: TStream; var Action: TclSmtpMailDataAction); virtual;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Port default cDefaultSmtpPort;
    property UserAccounts: TclSmtpUserAccountList read FUserAccounts write SetUserAccounts;
    property CaseInsensitive: Boolean read GetCaseInsensitive write SetCaseInsensitive default True;
    property UseAuth: Boolean read FUseAuth write FUseAuth default True;
    property SASLFlags: TclServerSaslFlags read FSASLFlags write FSASLFlags default [ssUseLogin, ssUseCramMD5, ssUseNTLM];
    property MaxRecipients: Integer read FMaxRecipients write FMaxRecipients default 100;
    property HelpText: TStrings read FHelpText write SetHelpText;
    property OnLoginAuthenticate: TclSmtpLoginAuthenticateEvent read FOnLoginAuthenticate
      write FOnLoginAuthenticate;
    property OnAuthAuthenticate: TclSmtpAuthAuthenticateEvent read FOnAuthAuthenticate
      write FOnAuthAuthenticate;
    property OnMailFrom: TclSmtpMailFromEvent read FOnMailFrom write FOnMailFrom;
    property OnRecipientTo: TclSmtpRecipientToEvent read FOnRecipientTo write FOnRecipientTo;
    property OnMessageReceived: TclSmtpMessageReceivedEvent read FOnMessageReceived write FOnMessageReceived;
    property OnStateChanged: TclSmtpConnectionEvent read FOnStateChanged write FOnStateChanged;
    property OnDispatchReceivedMessage: TclSmtpDispatchMessageEvent read FOnDispatchReceivedMessage
      write FOnDispatchReceivedMessage;
  end;

procedure RaiseSmtpError(const ACommand, AMessage: string; ACode: Integer);

implementation

uses
  Windows, clMailMessage, clCryptUtils, clUtils, clTlsSocket{$IFDEF LOGGER}, clLogger{$ENDIF};

procedure RaiseSmtpError(const ACommand, AMessage: string; ACode: Integer);
begin
  raise EclTcpCommandError.Create(ACommand, Format('%d %s', [ACode, AMessage]), ACode);
end;
  
{ TclSmtpServer }

procedure TclSmtpServer.AddSmtpCommand(const ACommand: string;
  AHandler: TclSmtpCommandHandler);
var
  info: TclSmtpCommandInfo;
begin
  info := TclSmtpCommandInfo.Create();
  AddCommand(info);
  info.Name := ACommand;
  info.FHandler := AHandler;
end;

constructor TclSmtpServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUserAccounts := TclSmtpUserAccountList.Create(Self, TclSmtpUserAccountItem);
  FHelpText := TStringList.Create();
  FillDefaultHelpText();
  Port := cDefaultSmtpPort;
  ServerName := 'Clever Internet Suite SMTP service';
  CaseInsensitive := True;
  UseAuth := True;
  SASLFlags := [ssUseLogin, ssUseCramMD5, ssUseNTLM];
  MaxRecipients := 100;
end;

function TclSmtpServer.CreateDefaultConnection: TclCommandConnection;
begin
  Result := TclSmtpCommandConnection.Create();
end;

procedure TclSmtpServer.DoAcceptConnection(AConnection: TclCommandConnection);
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

  inherited DoAcceptConnection(AConnection);
  SendResponse(AConnection, '', '220 ' + GetLocalHost() + ' ' + ServerName
     + '; ' + DateTimeToMailTime(Now()));
end;

procedure TclSmtpServer.RegisterCommands;
begin
  AddSmtpCommand('EHLO', HandleEHLO);
  AddSmtpCommand('HELO', HandleHELO);
  AddSmtpCommand('AUTH', HandleAUTH);
  AddSmtpCommand('NOOP', HandleNOOP);
  AddSmtpCommand('QUIT', HandleQUIT);
  AddSmtpCommand('RSET', HandleRSET);
  AddSmtpCommand('MAIL', HandleMAIL);
  AddSmtpCommand('RCPT', HandleRCPT);
  AddSmtpCommand('DATA', HandleDATA);
  AddSmtpCommand('HELP', HandleHELP);
  AddSmtpCommand('STARTTLS', HandleSTARTTLS);
end;

procedure TclSmtpServer.RaiseBadSequenceError(const ACommand: string);
begin
  RaiseSmtpError(ACommand, 'Bad sequence of commands', 503);
end;

procedure TclSmtpServer.HandleEHLO(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  if (AConnection.ConnectionState <> csSmtpConnect) then
  begin
    RaiseBadSequenceError(ACommand);
  end;
  s := Trim(AParams);
  if (s = '') then
  begin
    RaiseSmtpError(ACommand, 'EHLO requires domain address', 501);
  end;
  ChangeState(AConnection, csSmtpHelo);
  AConnection.FIsEHLO := True;
  if (not UseAuth) then
  begin
    AConnection.FIsAuthorized := True;
  end;
  SendResponse(AConnection, ACommand, '250-%s Hello %s, pleased to meet you',
    [GetLocalHost(), s]);

  if UseAuth then
  begin
    s := '';
    if (ssUseLogin in SASLFlags) then
    begin
      s := s + 'LOGIN ';
    end;
    if (ssUseCramMD5 in SASLFlags) then
    begin
      s := s + 'CRAM-MD5 ';
    end;
    if (ssUseNTLM in SASLFlags) then
    begin
      s := s + 'NTLM ';
    end;
    if (s <> '') then
    begin
      s := system.Copy(s, 1, Length(s) - 1);
    end;

    if (s <> '') then
    begin
      SendResponse(AConnection, ACommand, '250-AUTH %s', [s]);
      SendResponse(AConnection, ACommand, '250-AUTH=%s', [s]);
    end;
  end;

  if (UseTLS <> stNone) and (not AConnection.IsTls) then
  begin
    SendResponse(AConnection, ACommand, '250-STARTTLS');
  end;
  SendResponse(AConnection, ACommand, '250 HELP');
end;

procedure TclSmtpServer.HandleHELO(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  if (AConnection.ConnectionState <> csSmtpConnect) then
  begin
    RaiseBadSequenceError(ACommand);
  end;
  s := Trim(AParams);
  if (s = '') then
  begin
    RaiseSmtpError(ACommand, 'HELO requires domain address', 501);
  end;
  ChangeState(AConnection, csSmtpHelo);
  if (not UseAuth) then
  begin
    AConnection.FIsAuthorized := True;
  end;
  SendResponse(AConnection, ACommand, '250 %s Hello %s, pleased to meet you',
    [GetLocalHost(), s]);
end;

procedure TclSmtpServer.CheckAuthAbort(AConnection: TclSmtpCommandConnection; const AParams: string);
begin
  if (Trim(AParams) = '*') then
  begin
    AConnection.InitParams();
    AConnection.FConnectionState := csSmtpHelo;
    RaiseSmtpError('AUTH', 'Authentication aborted', 501);
  end;
end;

procedure TclSmtpServer.CheckAuthAbort(AConnection: TclSmtpCommandConnection; AParams: TStream);
var
  s: string;
begin
  AParams.Position := 0;
  SetLength(s, AParams.Size);
  AParams.Read(PChar(s)^, AParams.Size);
  CheckAuthAbort(AConnection, s);
end;

procedure TclSmtpServer.HandleUser(AConnection: TclSmtpCommandConnection; AData: TStream);
begin
  AConnection.BeginWork();
  try
    AConnection.RawData.LoadFromStream(AData);
  finally
    AConnection.EndWork();
  end;
  AConnection.FReceivingData := rdSmtpPassword;
  HandleEndCommand(AConnection, 'AUTH', HandleUserEnd);
end;

procedure TclSmtpServer.HandlePassword(AConnection: TclSmtpCommandConnection; AData: TStream);
begin
  AConnection.BeginWork();
  try
    AConnection.RawData.LoadFromStream(AData);
  finally
    AConnection.EndWork();
  end;
  AConnection.FReceivingData := rdSmtpCommand;
  HandleEndCommand(AConnection, 'AUTH', HandlePasswordEnd);
end;

procedure TclSmtpServer.HandleCramMD5(AConnection: TclSmtpCommandConnection; AData: TStream);
begin
  AConnection.BeginWork();
  try
    AConnection.RawData.LoadFromStream(AData);
  finally
    AConnection.EndWork();
  end;
  AConnection.FReceivingData := rdSmtpCommand;
  HandleEndCommand(AConnection, 'AUTH', HandleCramMD5End);
end;

procedure TclSmtpServer.HandleDataLine(AConnection: TclSmtpCommandConnection; AData: TStream);
var
  s: string;
  len: Integer;
begin
  AConnection.BeginWork();
  try
    AConnection.RawData.CopyFrom(AData, 0);
  finally
    AConnection.EndWork();
  end;
  try
    len := AConnection.RawData.Size;
    if (len > 4) then
    begin
      len := 5;
    end;

    AConnection.RawData.Position := AConnection.RawData.Size - len;
    SetLength(s, len);
    AConnection.RawData.Read(PChar(s)^, len);
    if CheckForEndOfData(s) then
    begin
      AConnection.RawData.Size := AConnection.RawData.Size - 3;
      AConnection.FReceivingData := rdSmtpCommand;
      HandleEndCommand(AConnection, 'DATA', HandleDataLineEnd);
    end;
  finally
    AConnection.RawData.Position := AConnection.RawData.Size;
  end;
end;

procedure TclSmtpServer.DoMessageReceived(AConnection: TclSmtpCommandConnection;
  const ARecipient: string; IsFinalDelivery: Boolean; AMessage: TStrings;
  var Action: TclSmtpMailDataAction);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoMessageReceived');{$ENDIF}
  if Assigned(OnMessageReceived) then
  begin
    OnMessageReceived(Self, AConnection, ARecipient, IsFinalDelivery, AMessage, Action);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoMessageReceived'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoMessageReceived', E); raise; end; end;{$ENDIF}
end;

procedure TclSmtpServer.DoLoginAuthenticate(AConnection: TclSmtpCommandConnection;
  Account: TclSmtpUserAccountItem; const APassword: string;
  var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnLoginAuthenticate) then
  begin
    OnLoginAuthenticate(Self, AConnection, Account, APassword, IsAuthorized, handled);
  end;
end;

procedure TclSmtpServer.DoAuthAuthenticate(AConnection: TclSmtpCommandConnection;
  Account: TclSmtpUserAccountItem; const AKey, AHash: string;
  var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnAuthAuthenticate) then
  begin
    OnAuthAuthenticate(Self, AConnection, Account, AKey, AHash, IsAuthorized, handled);
  end;
end;

function TclSmtpServer.LoginAuthenticate(AConnection: TclSmtpCommandConnection;
  Account: TclUserAccountItem; const APassword: string): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := False;
  DoLoginAuthenticate(AConnection, TclSmtpUserAccountItem(Account), APassword, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    Result := Account.Authenticate(APassword);
  end;
end;

function TclSmtpServer.CramMD5Authenticate(AConnection: TclSmtpCommandConnection;
  Account: TclUserAccountItem; const AKey, AHash: string): Boolean;
var
  handled: Boolean;
  calculated: string;
begin
  handled := False;
  Result := False;
  DoAuthAuthenticate(AConnection, TclSmtpUserAccountItem(Account), AKey, AHash, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    calculated := HMAC_MD5(AKey, Account.Password);
    Result := (calculated = AHash);
  end;
end;

function TclSmtpServer.GenCramMD5Key: string;
begin
  Result := GenerateCramMD5Key();
end;

function TclSmtpServer.GenMessageID: string;
begin
  Result := GenerateMessageID();
end;

procedure TclSmtpServer.HandleAUTH(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  encoder: TclEncoder;
  method: string;
  s: string; 
begin
  CheckTlsMode(AConnection, ACommand);
  if AConnection.IsAuthorized or (not AConnection.IsEHLO) then
  begin
    RaiseBadSequenceError(ACommand);
  end;

  if not UseAuth then
  begin
    RaiseBadSequenceError(ACommand);
  end;

  encoder := TclEncoder.Create(nil);
  try
    encoder.SuppressCrlf := True;
    method := UpperCase(Trim(AParams));
    if (method = 'LOGIN') and (ssUseLogin in SASLFlags) then
    begin
      encoder.EncodeString('Username:', s, cmMIMEBase64);
      AConnection.FReceivingData := rdSmtpUser; 
      SendResponse(AConnection, ACommand, '334 ' + s);
    end else
    if (method = 'CRAM-MD5') and (ssUseCramMD5 in SASLFlags) then
    begin
      AConnection.FCramMD5Key := GenCramMD5Key();
      encoder.EncodeString(AConnection.CramMD5Key, s, cmMIMEBase64);
      AConnection.FReceivingData := rdSmtpCramMD5;
      SendResponse(AConnection, ACommand, '334 ' + s);
    end else
    if (system.Pos('NTLM', method) = 1) and (ssUseNTLM in SASLFlags) then
    begin
      AConnection.FNTLMAuth.Free();
      AConnection.FNTLMAuth := TclNtAuthServerSspi.Create();

      AConnection.FReceivingData := rdSmtpNTLM;

      s := system.Copy(method, Length('NTLM ') + 1, Length(method));
      s := Trim(s);
      if (s <> '') then
      begin
        AConnection.BeginWork();
        try
          AConnection.RawData.Size := 0;
          AConnection.RawData.Position := 0;
          AConnection.RawData.Read(PChar(s)^, Length(s));
        finally
          AConnection.EndWork();
        end;

        HandleNTLMEnd(AConnection, ACommand, AParams);
      end else
      begin
        SendResponse(AConnection, ACommand, '334');
      end;
    end else
    begin
      RaiseSmtpError(ACommand, 'Unrecognized authentication type', 504);
    end;
  finally
    encoder.Free();
  end;
end;

procedure TclSmtpServer.HandleNOOP(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
begin
  SendResponse(AConnection, ACommand, '250 OK');
end;

procedure TclSmtpServer.HandleQUIT(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
begin
  try
    SendResponse(AConnection, ACommand, '221 %s closing connection', [GetLocalHost()]);
    AConnection.Close(False);
  except
    on EclSocketError do ;
  end;
end;

procedure TclSmtpServer.HandleRCPT(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  ind: Integer;
  name, email, forwardTo: string;
  action: TclSmtpRcptToAction;
  isRouted: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  if not (AConnection.ConnectionState in [csSmtpMail, csSmtpRcpt]) then
  begin
    RaiseBadSequenceError(ACommand);
  end;
  ind := system.Pos('TO:', UpperCase(AParams));
  if (ind = 0) then
  begin
    RaiseSyntaxError(ACommand);
  end;
  GetEmailAddressParts(system.Copy(AParams, ind + Length('TO:'), 1000), name, email);

  if (email <> '') then
  begin
    action := rtAddressOk;
    isRouted := IsRoutedMail(email);
    if (AConnection.RcptToList.Count >= MaxRecipients) then
    begin
      action := rtTooManyAddresses;
    end else
    if isRouted then
    begin
      action := rtRelayDenied;
    end else
    if (UserAccounts.AccountByEmail(email) = nil) and (not AConnection.IsAuthorized) then
    begin
      action := rtRelayDenied;
    end;
  end else
  begin
    action := rtBadAddress;
  end;

  DoRecipientTo(AConnection, email, forwardTo, action);

  case action of
    rtAddressOk:
      begin
        ChangeState(AConnection, csSmtpRcpt);
        AConnection.FRcptToList.Add(email);
        SendResponse(AConnection, ACommand, '250 <%s> Recipient ok', [email]);
      end;
    rtForward:
      begin
        ChangeState(AConnection, csSmtpRcpt);
        AConnection.FRcptToList.Add(forwardTo);                        
        SendResponse(AConnection, ACommand, '250 <%s> Recipient ok', [email]);
      end;
    rtRelayDenied: RaiseSmtpError(ACommand, Format('<%s> Relay denied', [email]), 550);
    rtNotForward: RaiseSmtpError(ACommand, Format('<%s> User not local; please try <%s>', [email, forwardTo]), 551);
    rtTooManyAddresses: RaiseSmtpError(ACommand, 'Too many recipients', 452);
    rtDisabled: RaiseSmtpError(ACommand, Format('<%s> Account disabled', [email]), 550);
  else
    RaiseSmtpError(ACommand, Format('<%s> Invalid address', [email]), 500);
  end;
end;

function TclSmtpServer.IsRoutedMail(const AEmail: string): Boolean;
  function GetSymbolCount(const AStr, ASymbol: string): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 1 to Length(AStr) do
    begin
      if (AStr[i] = ASymbol) then
      begin
        Inc(Result);
      end;
    end;
  end;
  
begin
  Result := (GetSymbolCount(AEmail, '@') > 1);
end;

procedure TclSmtpServer.HandleMAIL(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  ind: Integer;
  name, email: string;
  action: TclSmtpMailFromAction;
  isRouted: Boolean;
begin
  //UseAuth
  CheckTlsMode(AConnection, ACommand);
  if (AConnection.ConnectionState <> csSmtpHelo) then
  begin
    RaiseBadSequenceError(ACommand);
  end;
  ind := system.Pos('FROM:', UpperCase(AParams));
  if (ind = 0) then
  begin
    RaiseSyntaxError(ACommand);
  end;
  GetEmailAddressParts(system.Copy(AParams, ind + Length('FROM:'), 1000), name, email);

  action := mfAccept;
  isRouted := IsRoutedMail(email);
  if isRouted then
  begin
    action := mfReject;
  end;

  DoMailFrom(AConnection, email, action);

  if (action = mfAccept) then
  begin
    ChangeState(AConnection, csSmtpMail);
    AConnection.FMailFrom := email;
    SendResponse(AConnection, ACommand, '250 <%s> Sender ok', [email]);
  end else
  if isRouted then
  begin
    RaiseSmtpError(ACommand, 'This server does not accept routed mail', 553);
  end else
  begin
    RaiseSmtpError(ACommand, Format('<%s> Sender not permitted', [email]), 553);
  end;
end;

procedure TclSmtpServer.HandleDATA(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  if (AConnection.ConnectionState <> csSmtpRcpt) then
  begin
    RaiseBadSequenceError(ACommand);
  end;
  ChangeState(AConnection, csSmtpData);
  AConnection.FReceivingData := rdSmtpData;
  AConnection.RawData.Clear();
  SendResponse(AConnection, ACommand, '354 Start mail input, end with <CRLF>.<CRLF>');
end;

procedure TclSmtpServer.HandleRSET(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  AConnection.Reset();
  if (AConnection.ConnectionState <> csSmtpConnect) then
  begin
    ChangeState(AConnection, csSmtpHelo);
  end;
  SendResponse(AConnection, ACommand, '250 Reset state');
end;

procedure TclSmtpServer.DoReadConnection(AConnection: TclCommandConnection; AData: TStream);
var
  connection: TclSmtpCommandConnection;
begin
  connection := (AConnection as TclSmtpCommandConnection);
  case connection.ReceivingData of
    rdSmtpUser: HandleUser(connection, AData);
    rdSmtpPassword: HandlePassword(connection, AData);
    rdSmtpCramMD5: HandleCramMD5(connection, AData);
    rdSmtpNTLM: HandleNTLM(connection, AData);
    rdSmtpData: HandleDataLine(connection, AData);
  else
    inherited DoReadConnection(connection, AData);
  end;
end;

procedure TclSmtpServer.SetUserAccounts(const Value: TclSmtpUserAccountList);
begin
  FUserAccounts.Assign(Value);
end;

function TclSmtpServer.GetCaseInsensitive: Boolean;
begin
  Result := FUserAccounts.CaseInsensitive;
end;

procedure TclSmtpServer.SetCaseInsensitive(const Value: Boolean);
begin
  FUserAccounts.CaseInsensitive := Value;
end;

procedure TclSmtpServer.RaiseSyntaxError(const ACommand: string);
begin
  RaiseSmtpError(ACommand, 'Syntax error in parameters or arguments', 501);
end;

procedure TclSmtpServer.DoMailFrom(AConnection: TclSmtpCommandConnection;
  const AMailFrom: string; var Action: TclSmtpMailFromAction);
begin
  if Assigned(OnMailFrom) then
  begin
    OnMailFrom(Self, AConnection, AMailFrom, Action);
  end;
end;

procedure TclSmtpServer.DoRecipientTo(AConnection: TclSmtpCommandConnection;
  const ARcptTo: string; var AForwardTo: string; var Action: TclSmtpRcptToAction);
begin
  if Assigned(OnRecipientTo) then
  begin
    OnRecipientTo(Self, AConnection, ARcptTo, AForwardTo, Action);
  end;
end;

procedure TclSmtpServer.DoDestroy;
begin
  FHelpText.Free();
  FUserAccounts.Free();
  inherited DoDestroy();
end;

function TclSmtpServer.GetMessageID(AMessage: TStrings): string;
var
  fieldList: TStrings;
begin
  fieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, AMessage, fieldList);
    Result := GetHeaderFieldValue(AMessage, fieldList, 'Message-ID');
  finally
    fieldList.Free();
  end;
end;

procedure TclSmtpServer.ChangeState(AConnection: TclSmtpCommandConnection; ANewState: TclSmtpConnectionState);
begin
  if (AConnection.ConnectionState <> ANewState) then
  begin
    AConnection.FConnectionState := ANewState;
    DoStateChanged(AConnection);
  end;
end;

procedure TclSmtpServer.DoStateChanged(AConnection: TclSmtpCommandConnection);
begin
  if Assigned(OnStateChanged) then
  begin
    OnStateChanged(Self, AConnection);
  end;
end;

function TclSmtpServer.GetNullCommand(const ACommand: string): TclTcpCommandInfo;
var
  info: TclSmtpCommandInfo;
begin
  info := TclSmtpCommandInfo.Create();
  info.Name := ACommand;
  info.FHandler := HandleNullCommand;
  Result := info;
end;

procedure TclSmtpServer.HandleNullCommand(AConnection: TclSmtpCommandConnection;
  const ACommand, AParams: string);
begin
  RaiseSmtpError(ACommand, 'Syntax error, command unrecognized: ' + ACommand, 500);
end;

procedure TclSmtpServer.HandleEndCommand(AConnection: TclSmtpCommandConnection;
  const ACommand: string; AHandler: TclSmtpCommandHandler);
var
  info: TclSmtpCommandInfo;
  params: TclTcpCommandParams;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'HandleEndCommand, command: %s ', nil, [ACommand]);{$ENDIF}
  info := nil;
  params := nil;
  try
    info := TclSmtpCommandInfo.Create();
    params := TclTcpCommandParams.Create();
    info.Name := ACommand;
    info.FHandler := AHandler;
    ProcessCommand(AConnection, info, params);
  finally
    params.Free();
    info.Free();
  end;
end;

function TclSmtpServer.GetAuthData(AConnection: TclSmtpCommandConnection; AEncoder: TclEncoder): string;
var
  s: string;
begin
  AConnection.RawData.Position := 0;
  SetLength(s, AConnection.RawData.Size);
  AConnection.RawData.Read(PChar(s)^, AConnection.RawData.Size);
  try
    Result := '';
    AEncoder.DecodeString(Trim(s), Result, cmMIMEBase64);
  except
    on EclEncoderError do
    begin
      CheckAuthAbort(AConnection, '*');
    end;
  end;
end;

procedure TclSmtpServer.HandleUserEnd(AConnection: TclSmtpCommandConnection;
  const ACommand, AParams: string);
var
  encoder: TclEncoder;
  s: string;
begin
  CheckAuthAbort(AConnection, AConnection.RawData);
  encoder := TclEncoder.Create(nil);
  try
    AConnection.FUserName := GetAuthData(AConnection, encoder);
    encoder.EncodeString('Password:', s, cmMIMEBase64);
    SendResponse(AConnection, ACommand, '334 ' + s);
  finally
    encoder.Free();
  end;
end;

procedure TclSmtpServer.HandlePasswordEnd(AConnection: TclSmtpCommandConnection;
  const ACommand, AParams: string);
var
  encoder: TclEncoder;
  psw: string;
begin
  CheckAuthAbort(AConnection, AConnection.RawData);
  encoder := TclEncoder.Create(nil);
  try
    psw := GetAuthData(AConnection, encoder);
    if not LoginAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName), psw) then
    begin
      RaiseSmtpError(ACommand, 'Authentication failed', 535);
    end;

    AConnection.FIsAuthorized := True;
    SendResponse(AConnection, ACommand, '235 Authentication successful');
  finally
    encoder.Free();
  end;
end;

procedure TclSmtpServer.HandleCramMD5End(AConnection: TclSmtpCommandConnection;
  const ACommand, AParams: string);
var
  encoder: TclEncoder;
  hash: string;
begin
  CheckAuthAbort(AConnection, AConnection.RawData);
  encoder := TclEncoder.Create(nil);
  try
    encoder.SuppressCrlf := True;
    hash := GetAuthData(AConnection, encoder);
    if (WordCount(hash, [' ']) <> 2) then
    begin
      CheckAuthAbort(AConnection, '*');
    end;
    AConnection.FUserName := ExtractWord(1, hash, [' ']);
    hash := ExtractWord(2, hash, [' ']);
    if not CramMD5Authenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName),
      AConnection.CramMD5Key, hash) then
    begin
      RaiseSmtpError(ACommand, 'Authentication failed', 535);
    end;

    AConnection.FIsAuthorized := True;
    SendResponse(AConnection, ACommand, '235 Authentication successful');
  finally
    encoder.Free();
  end;
end;

procedure TclSmtpServer.HandleNTLM(AConnection: TclSmtpCommandConnection; AData: TStream);
begin
  AConnection.BeginWork();
  try
    AConnection.RawData.LoadFromStream(AData);
  finally
    AConnection.EndWork();
  end;
  HandleEndCommand(AConnection, 'AUTH', HandleNTLMEnd);
end;

procedure TclSmtpServer.HandleNTLMEnd(
  AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  buf: TStream;
  encoder: TclEncoder;
  challenge: string;
begin
  CheckAuthAbort(AConnection, AConnection.RawData);

  try
    encoder := nil;
    buf := nil;
    try
      encoder := TclEncoder.Create(nil);
      encoder.SuppressCrlf := True;
      buf := TMemoryStream.Create();

      AConnection.RawData.Position := 0;
      encoder.DecodeStream(AConnection.RawData, buf, cmMIMEBase64);
      buf.Position := 0;

      if AConnection.FNTLMAuth.GenChallenge('NTLM', buf, nil) then
      begin
        AConnection.FNTLMAuth.ImpersonateUser();
        try
          AConnection.FUserName := GetCurrentThreadUser();

          if not NtlmAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName)) then
          begin
            AConnection.FUserName := '';
            RaiseSmtpError(ACommand, 'Authentication failed', 535);
          end;
        finally
          AConnection.FNTLMAuth.RevertUser();
        end;

        AConnection.FReceivingData := rdSmtpCommand;
        AConnection.FIsAuthorized := True;
        SendResponse(AConnection, ACommand, '235 Authentication successful');
      end else
      begin
        buf.Position := 0;
        challenge := '';
        encoder.EncodeToString(buf, challenge, cmMIMEBase64);

        SendResponse(AConnection, ACommand, '334 ' + challenge);
      end;
    finally
      buf.Free();
      encoder.Free();
    end;
  except
    on EclEncoderError do CheckAuthAbort(AConnection, '*');
    on EclSSPIError do CheckAuthAbort(AConnection, '*');
  end;
end;

procedure TclSmtpServer.FillRelayHeader(AConnection: TclSmtpCommandConnection; AHeader: TStrings);
begin
  AHeader.Add(Format('Received: from %s [%s]', [AConnection.PeerName, AConnection.PeerIP]));
  AHeader.Add(Format(#9'by %s [%s]', [GetLocalHost(), GetHostIP(GetLocalHost())]));
  AHeader.Add(Format(#9'with SMTP (%s)', [ServerName]));
  AHeader.Add(#9'for');
end;

function TclSmtpServer.ProcessReceivedMessage(AConnection: TclSmtpCommandConnection;
  IsFinalDelivery: Boolean; ARecipientPos: Integer; AMessage: TStrings): TclSmtpMailDataAction;
var
  i: Integer;
  s: string;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ProcessReceivedMessage');{$ENDIF}
  Result := mdOk;
  i := 0;
  while (i < AConnection.RcptToList.Count) and (Result = mdOk) do
  begin
    s := AConnection.RcptToList[i];
    if IsFinalDelivery = (UserAccounts.AccountByEmail(s) <> nil) then
    begin
      AMessage[ARecipientPos] := Format(#9'for <%s>; %s', [s, DateTimeToMailTime(Now())]);
      DoMessageReceived(AConnection, s, IsFinalDelivery, AMessage, Result);
    end;
    Inc(i);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ProcessReceivedMessage'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ProcessReceivedMessage', E); raise; end; end;{$ENDIF}
end;

procedure TclSmtpServer.DoDispatchReceivedMessage(AConnection: TclSmtpCommandConnection;
  ARelayHeader: TStrings; AMessage: TStream; var Action: TclSmtpMailDataAction);
begin
  if Assigned(OnDispatchReceivedMessage) then
  begin
    OnDispatchReceivedMessage(Self, AConnection, ARelayHeader, AMessage, Action);
  end;
end;

function TclSmtpServer.DispatchReceivedMessage(AConnection: TclSmtpCommandConnection): TclSmtpMailDataAction;
var
  msg: TStrings;
  messageID: string;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DispatchReceivedMessage');{$ENDIF}
  msg := TStringList.Create();
  try
    FillRelayHeader(AConnection, msg);

    Result := mdNone;
    DoDispatchReceivedMessage(AConnection, msg, AConnection.RawData, Result);

    if (Result = mdNone) then
    begin
      AConnection.RawData.Position := 0;
      AddTextStream(msg, AConnection.RawData, False, BatchSize);

      messageID := GetMessageID(msg);
      if (messageID = '') then
      begin
        messageID := GenMessageID();
        msg.Insert(4, 'Message-ID: ' + messageID);
      end;

      Result := ProcessReceivedMessage(AConnection, False, 3, msg);
      if (Result = mdOk) then
      begin
        msg.Insert(0, 'Return-path: <' + AConnection.MailFrom + '>');
        Result := ProcessReceivedMessage(AConnection, True, 4, msg);
      end;
    end;
  finally
    msg.Free();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DispatchReceivedMessage'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DispatchReceivedMessage', E); raise; end; end;{$ENDIF}
end;

procedure TclSmtpServer.HandleDataLineEnd(AConnection: TclSmtpCommandConnection;
  const ACommand, AParams: string);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'HandleDataLineEnd');{$ENDIF}
  ChangeState(AConnection, csSmtpHelo);
  try
    case DispatchReceivedMessage(AConnection) of
      mdOk: SendResponse(AConnection, ACommand, '250 Ok');
      mdMailBoxFull: RaiseSmtpError(ACommand, 'Requested mail action aborted: exceeded storage allocation', 552);
      mdSystemFull: RaiseSmtpError(ACommand, 'Requested action not taken: insufficient system storage', 452);
      mdProcessingError: RaiseSmtpError(ACommand, 'Requested action aborted: error in processing', 451);
    else
      RaiseSmtpError(ACommand, 'Transaction failed', 554);
    end;
  finally
    AConnection.Reset();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'HandleDataLineEnd'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'HandleDataLineEnd', E); raise; end; end;{$ENDIF}
end;

procedure TclSmtpServer.ProcessUnhandledError(AConnection: TclCommandConnection;
  AParams: TclTcpCommandParams; E: Exception);
begin
  SendResponse(AConnection, AParams.Command, '451 Requested action aborted: ' + Trim(E.Message));
end;

procedure TclSmtpServer.DoProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
begin
  AConnection.BeginWork();
  try
    inherited DoProcessCommand(AConnection, AInfo, AParams);
  finally
    AConnection.EndWork();
  end;
end;

procedure TclSmtpServer.HandleSTARTTLS(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
begin
  if (UseTLS = stNone) then
  begin
    RaiseSmtpError(ACommand, 'TLS not available', 454);
  end;
  if (UseTLS = stImplicit) or AConnection.IsTls then
  begin
    RaiseSmtpError(ACommand, 'connection is already secured', 454);
  end;

  SendResponse(AConnection, ACommand, '220 please start a TLS connection');
  AConnection.InitParams();
  StartTls(AConnection);
end;

procedure TclSmtpServer.CheckTlsMode(AConnection: TclSmtpCommandConnection; const ACommand: string);
begin
  if (UseTLS = stExplicitRequire) and (not AConnection.IsTls) then
  begin
    RaiseSmtpError(ACommand, 'Must issue a STARTTLS command first', 530);
  end;
end;

procedure TclSmtpServer.HandleHELP(AConnection: TclSmtpCommandConnection; const ACommand, AParams: string);
var
  i: Integer;
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  list.Assign(HelpText);
  for i := 0 to list.Count - 1 do
  begin
    list[i] := '214-' + list[i];
  end;
  SendMultipleLines(AConnection, '214 End Of Help', True);
end;

procedure TclSmtpServer.SetHelpText(const Value: TStrings);
begin
  FHelpText.Assign(Value);
end;

procedure TclSmtpServer.FillDefaultHelpText;
begin
  HelpText.Add('Commands Supported:');
  HelpText.Add('HELO EHLO AUTH HELP QUIT MAIL NOOP RSET RCPT DATA STARTTLS');
end;

function TclSmtpServer.NtlmAuthenticate(
  AConnection: TclSmtpCommandConnection; Account: TclUserAccountItem): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := True;
  DoAuthAuthenticate(AConnection, TclSmtpUserAccountItem(Account), '', '', Result, handled);
end;

{ TclSmtpCommandConnection }

constructor TclSmtpCommandConnection.Create;
begin
  inherited Create();
  FRcptToList := TStringList.Create();
  FRawData := TMemoryStream.Create();
  InitParams();
end;

procedure TclSmtpCommandConnection.Reset;
begin
  FMailFrom := '';
  FRcptToList.Clear();
  FRawData.Clear();
end;

procedure TclSmtpCommandConnection.DoDestroy;
begin
  FNTLMAuth.Free();
  FRawData.Free();
  FRcptToList.Free();
  inherited DoDestroy();
end;

procedure TclSmtpCommandConnection.InitParams;
begin
  FIsAuthorized := False;
  FUserName := '';
  FReceivingData := rdSmtpCommand;
  FCramMD5Key := '';
  FConnectionState := csSmtpConnect;
  FNTLMAuth.Free();
  FNTLMAuth := nil;
end;

{ TclSmtpUserAccountItem }

procedure TclSmtpUserAccountItem.Assign(Source: TPersistent);
begin
  if (Source is TclSmtpUserAccountItem) then
  begin
    FEmail := (Source as TclSmtpUserAccountItem).Email;
  end;
  inherited Assign(Source);
end;

{ TclSmtpUserAccountList }

function TclSmtpUserAccountList.AccountByEmail(const AEmail: string): TclSmtpUserAccountItem;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Result := Items[i];
    if CaseInsensitive then
    begin
      if SameText(Result.Email, AEmail) then Exit;
    end else
    begin
      if (Result.Email = AEmail) then Exit;
    end;
  end;
  Result := nil;
end;

function TclSmtpUserAccountList.Add: TclSmtpUserAccountItem;
begin
  Result := TclSmtpUserAccountItem(inherited Add());
end;

function TclSmtpUserAccountList.GetItem(Index: Integer): TclSmtpUserAccountItem;
begin
  Result := TclSmtpUserAccountItem(inherited GetItem(Index));
end;

procedure TclSmtpUserAccountList.SetItem(Index: Integer;
  const Value: TclSmtpUserAccountItem);
begin
  inherited SetItem(Index, Value);
end;

{ TclSmtpCommandInfo }

procedure TclSmtpCommandInfo.Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams);
begin
  FHandler(AConnection as TclSmtpCommandConnection, Name, AParams.Params);
end;

end.
