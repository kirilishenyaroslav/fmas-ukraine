{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clPop3Server;

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
  Classes, SysUtils, WinSock, clTcpServer, clSocket, clUserMgr, SyncObjs, clMCUtils,
  clSspi, clSspiAuth;

type
  TclPop3ConnectionState = (csPop3Authorization, csPop3Transaction, csPop3Update);
  TclPop3ReceivingData = (rdPop3Command, rdPop3CramMD5, rdPop3NTLM);
  TclPop3AuthMode = (pmPopAuth, pmSASL, pmBoth);

  TclPop3MessageItem = class(TCollectionItem)
  private
    FIsDeleted: Boolean;
    FSize: Integer;
    FUID: string;
    FExtraInfo: string;
  public
    procedure Assign(Source: TPersistent); override;
    property UID: string read FUID write FUID;
    property Size: Integer read FSize write FSize;
    property IsDeleted: Boolean read FIsDeleted write FIsDeleted;
    property ExtraInfo: string read FExtraInfo write FExtraInfo;
  end;

  TclPop3MessageList = class(TCollection)
  private
    function GetItem(Index: Integer): TclPop3MessageItem;
    procedure SetItem(Index: Integer; const Value: TclPop3MessageItem);
    function GetActiveSize: Integer;
    function GetActiveCount: Integer;
  public
    function Add: TclPop3MessageItem;
    function MessageExists(AMessageNo: Integer): Boolean;
    procedure MarkDeleted(AMessageNo: Integer);
    procedure Reset;
    property Items[Index: Integer]: TclPop3MessageItem read GetItem write SetItem; default;
    property ActiveSize: Integer read GetActiveSize;
    property ActiveCount: Integer read GetActiveCount;
  end;

  TclPop3CommandConnection = class(TclCommandConnection)
  private
    FConnectionState: TclPop3ConnectionState;
    FTimeStamp: string;
    FUserName: string;
    FMailBox: TclPop3MessageList;
    FReceivingData: TclPop3ReceivingData;
    FCramMD5Key: string;
    FNTLMAuth: TclNtAuthServerSspi;
    FRawData: string;
  protected
    procedure DoDestroy; override;
  public
    constructor Create;
    procedure InitParams;
    property ConnectionState: TclPop3ConnectionState read FConnectionState;
    property ReceivingData: TclPop3ReceivingData read FReceivingData;
    property TimeStamp: string read FTimeStamp;
    property UserName: string read FUserName;
    property CramMD5Key: string read FCramMD5Key;
    property RawData: string read FRawData write FRawData;
    property MailBox: TclPop3MessageList read FMailBox;
  end;

  TclPop3CommandHandler = procedure (AConnection: TclPop3CommandConnection;
    const ACommand, AParams: string) of object;

  TclPop3CommandInfo = class(TclTcpCommandInfo)
  private
    FHandler: TclPop3CommandHandler;
  protected
    procedure Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams); override;
  end;

  TclPop3LoginAuthenticateEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection;
    Account: TclUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean) of object;

  TclPop3APopAuthenticateEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection;
    Account: TclUserAccountItem; const ADigest: string; var IsAuthorized, Handled: Boolean) of object;

  TclPop3AuthAuthenticateEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection;
    Account: TclUserAccountItem; const AKey, AHash: string; var IsAuthorized, Handled: Boolean) of object;

  TclPop3MailBoxEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection;
    AMailBox: TclPop3MessageList) of object;

  TclPop3RetrieveEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection;
    AMessageNo, ATopLines: Integer; ARetrieveAll: Boolean; AMessageSource: TStrings;
    var Success: Boolean) of object;

  TclPop3DeleteEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection;
    AMessageNo: Integer; var ACanDelete: Boolean) of object;

  TclPop3ConnectionEvent = procedure (Sender: TObject; AConnection: TclPop3CommandConnection) of object;

  TclPop3Server = class(TclTcpCommandServer)
  private
    FUserAccounts: TclUserAccountList;
    FUseAuth: TclPop3AuthMode;
    FSASLFlags: TclServerSaslFlags;
    FHelpText: TStrings;
    FConnectionAccess: TCriticalSection;
    FOnAPopAuthenticate: TclPop3APopAuthenticateEvent;
    FOnLoginAuthenticate: TclPop3LoginAuthenticateEvent;
    FOnMailBoxInfo: TclPop3MailBoxEvent;
    FOnRetrieve: TclPop3RetrieveEvent;
    FOnDelete: TclPop3DeleteEvent;
    FOnStateChanged: TclPop3ConnectionEvent;
    FOnReset: TclPop3ConnectionEvent;
    FOnAuthAuthenticate: TclPop3AuthAuthenticateEvent;
    procedure HandleNullCommand(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleUSER(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandlePASS(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleAPOP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleAUTH(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleQUIT(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleNOOP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleSTAT(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleRETR(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleTOP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleDELE(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleRSET(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleLIST(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleUIDL(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleSTLS(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleHELP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);

    procedure HandleEndCommand(AConnection: TclPop3CommandConnection;
      const ACommand: string; AHandler: TclPop3CommandHandler);
    procedure HandleCramMD5(AConnection: TclPop3CommandConnection; const AData: string);
    procedure HandleCramMD5End(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
    procedure HandleNTLM(AConnection: TclPop3CommandConnection; const AData: string);
    procedure HandleNTLMEnd(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);

    procedure CheckAuthAbort(AConnection: TclPop3CommandConnection; const AParams: string);
    procedure CheckTlsMode(AConnection: TclPop3CommandConnection; const ACommand: string);
    procedure CheckConnectionState(const ACommand: string; AState, ARequired: TclPop3ConnectionState);
    procedure RaiseSyntaxError(const ACommand: string);
    procedure RaiseNotFoundError(const ACommand: string);
    procedure SetUserAccounts(const Value: TclUserAccountList);
    function GetCaseInsensitive: Boolean;
    procedure SetCaseInsensitive(const Value: Boolean);
    function LoginAuthenticate(AConnection: TclPop3CommandConnection;
      Account: TclUserAccountItem; const APassword: string): Boolean;
    function APopAuthenticate(AConnection: TclPop3CommandConnection;
      Account: TclUserAccountItem; const ADigest: string): Boolean;
    function CramMD5Authenticate(AConnection: TclPop3CommandConnection;
      Account: TclUserAccountItem; const AKey, AHash: string): Boolean;
    function NtlmAuthenticate(AConnection: TclPop3CommandConnection;
      Account: TclUserAccountItem): Boolean;
    function GetMailBoxInfo(AConnection: TclPop3CommandConnection; const AFormat: string): string;
    procedure ChangeState(const ACommand: string; AConnection: TclPop3CommandConnection;
      ANewState: TclPop3ConnectionState);
    function GetConnectionByUser(const AUserName: string): TclPop3CommandConnection;
    procedure CollectActiveMessages(AConnection: TclPop3CommandConnection; AList: TStrings);
    procedure CollectActiveMessageUids(AConnection: TclPop3CommandConnection; AList: TStrings);
    procedure SetHelpText(const Value: TStrings);
    procedure FillDefaultHelpText;
  protected
    procedure AddPopCommand(const ACommand: string; AHandler: TclPop3CommandHandler);
    procedure RegisterCommands; override;
    function GetNullCommand(const ACommand: string): TclTcpCommandInfo; override;
    procedure ProcessUnhandledError(AConnection: TclCommandConnection;
      AParams: TclTcpCommandParams; E: Exception); override;
    procedure DoCloseConnection(AConnection: TclCommandConnection); override;
    procedure DoProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams); override;
    procedure DoAcceptConnection(AConnection: TclCommandConnection); override;
    function CreateDefaultConnection: TclCommandConnection; override;
    procedure ProcessData(AConnection: TclCommandConnection; const AData: string); override;
    procedure DoDestroy; override;
    function GenerateTimeStamp: string; virtual;
    procedure DoLoginAuthenticate(AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
      const APassword: string; var IsAuthorized, Handled: Boolean); virtual;
    procedure DoAPopAuthenticate(AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
      const ADigest: string; var IsAuthorized, Handled: Boolean); virtual;
    procedure DoAuthAuthenticate(AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
      const AKey, AHash: string; var IsAuthorized, Handled: Boolean); virtual;
    procedure DoMailBoxInfo(AConnection: TclPop3CommandConnection;
      AMailBox: TclPop3MessageList); virtual;
    procedure DoRetrieve(AConnection: TclPop3CommandConnection;
      AMessageNo, ATopLines: Integer; ARetrieveAll: Boolean; AMessageSource: TStrings;
      var Success: Boolean); virtual;
    procedure DoDelete(AConnection: TclPop3CommandConnection; AMessageNo: Integer;
      var ACanDelete: Boolean); virtual;
    procedure DoStateChanged(AConnection: TclPop3CommandConnection); virtual;
    procedure DoReset(AConnection: TclPop3CommandConnection); virtual;
    function GenCramMD5Key: string; virtual;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Port default cDefaultPop3Port;
    property UseAuth: TclPop3AuthMode read FUseAuth write FUseAuth default pmBoth;
    property SASLFlags: TclServerSaslFlags read FSASLFlags write FSASLFlags default [ssUseCramMD5, ssUseNTLM];
    property UserAccounts: TclUserAccountList read FUserAccounts write SetUserAccounts;
    property CaseInsensitive: Boolean read GetCaseInsensitive write SetCaseInsensitive default True;
    property HelpText: TStrings read FHelpText write SetHelpText;
    property OnLoginAuthenticate: TclPop3LoginAuthenticateEvent read FOnLoginAuthenticate
      write FOnLoginAuthenticate;
    property OnAPopAuthenticate: TclPop3APopAuthenticateEvent read FOnAPopAuthenticate
      write FOnAPopAuthenticate;
    property OnAuthAuthenticate: TclPop3AuthAuthenticateEvent read FOnAuthAuthenticate write
      FOnAuthAuthenticate;
    property OnMailBoxInfo: TclPop3MailBoxEvent read FOnMailBoxInfo write FOnMailBoxInfo;
    property OnRetrieve: TclPop3RetrieveEvent read FOnRetrieve write FOnRetrieve;
    property OnDelete: TclPop3DeleteEvent read FOnDelete write FOnDelete;
    property OnStateChanged: TclPop3ConnectionEvent read FOnStateChanged write FOnStateChanged;
    property OnReset: TclPop3ConnectionEvent read FOnReset write FOnReset;
  end;

procedure RaisePopError(const ACommand, AMessage: string);

implementation

uses
  Windows, clTlsSocket, clUtils, clCryptUtils, clEncoder;

const
  OkResponse = '+OK';
  ErrResponse = '-ERR';
  cMailBoxInfoFormat = '%d messages (%d octets)';

procedure RaisePopError(const ACommand, AMessage: string);
begin
  raise EclTcpCommandError.Create(ACommand, ErrResponse + ' ' + AMessage, -1);
end;

{ TclPop3Server }

procedure TclPop3Server.AddPopCommand(const ACommand: string;
  AHandler: TclPop3CommandHandler);
var
  info: TclPop3CommandInfo;
begin
  info := TclPop3CommandInfo.Create();
  AddCommand(info);
  info.Name := ACommand;
  info.FHandler := AHandler;
end;

constructor TclPop3Server.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConnectionAccess := TCriticalSection.Create();
  FUserAccounts := TclUserAccountList.Create(Self, TclUserAccountItem);
  FHelpText := TStringList.Create();
  FillDefaultHelpText();
  Port := cDefaultPop3Port;
  ServerName := 'Clever Internet Suite POP3 service';
  CaseInsensitive := True;
  FUseAuth := pmBoth;
  SASLFlags := [ssUseCramMD5, ssUseNTLM];
end;

function TclPop3Server.CreateDefaultConnection: TclCommandConnection;
begin
  Result := TclPop3CommandConnection.Create();
end;

procedure TclPop3Server.DoAcceptConnection(AConnection: TclCommandConnection);
var
  command: TclPop3CommandConnection;
  banner: string;
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
  command := (AConnection as TclPop3CommandConnection);
  command.FTimeStamp := GenerateTimeStamp();
  banner := OkResponse + ' ' + ServerName + ' ready';

  if (UseAuth in [pmPopAuth, pmBoth]) then
  begin
    banner := banner + ' ' + command.TimeStamp;
  end;

  SendResponse(AConnection, '', banner);
end;

procedure TclPop3Server.RegisterCommands;
begin
  AddPopCommand('USER', HandleUSER);
  AddPopCommand('PASS', HandlePASS);
  AddPopCommand('APOP', HandleAPOP);
  AddPopCommand('AUTH', HandleAUTH);
  AddPopCommand('NOOP', HandleNOOP);
  AddPopCommand('QUIT', HandleQUIT);
  AddPopCommand('RSET', HandleRSET);
  AddPopCommand('STAT', HandleSTAT);
  AddPopCommand('RETR', HandleRETR);
  AddPopCommand('TOP', HandleTOP);
  AddPopCommand('DELE', HandleDELE);
  AddPopCommand('LIST', HandleLIST);
  AddPopCommand('UIDL', HandleUIDL);
  AddPopCommand('STLS', HandleSTLS);
  AddPopCommand('HELP', HandleHELP);
end;

procedure TclPop3Server.CheckConnectionState(const ACommand: string; AState, ARequired: TclPop3ConnectionState);
const
  states: array[TclPop3ConnectionState] of string = ('AUTHORIZATION', 'TRANSACTION', 'UPDATE');
begin
  if (AState <> ARequired) then
  begin
    RaisePopError(ACommand, 'that command is valid only in the ' + states[ARequired] + ' state!');
  end;
end;

procedure TclPop3Server.HandleUSER(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Authorization);
  if not (UseAuth in [pmPopAuth, pmBoth]) then
  begin
    RaiseSyntaxError(ACommand);
  end;
  AConnection.FUserName := AParams;
  SendResponse(AConnection, ACommand, OkResponse + ' please send the PASS');
end;

procedure TclPop3Server.HandlePASS(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Authorization);
  if not (UseAuth in [pmPopAuth, pmBoth]) then
  begin
    RaiseSyntaxError(ACommand);
  end;

  if not LoginAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName), AParams) then
  begin
    AConnection.FUserName := '';
    RaisePopError(ACommand, 'incorrect password or account name');
  end;
  ChangeState(ACommand, AConnection, csPop3Transaction);
  SendResponse(AConnection, ACommand, OkResponse + ' ' + GetMailBoxInfo(AConnection, cMailBoxInfoFormat));
end;

procedure TclPop3Server.HandleAPOP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  digest: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Authorization);
  if not (UseAuth in [pmPopAuth, pmBoth]) then
  begin
    RaiseSyntaxError(ACommand);
  end;

  digest := Trim(AParams);
  if (WordCount(digest, [' ']) <> 2) then
  begin
    RaiseSyntaxError(ACommand);
  end;

  AConnection.FUserName := ExtractWord(1, digest, [' ']);
  digest := ExtractWord(2, digest, [' ']);

  if not APopAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName), digest) then
  begin
    AConnection.FUserName := '';
    RaisePopError(ACommand, 'incorrect password or account name');
  end;
  ChangeState(ACommand, AConnection, csPop3Transaction);
  SendResponse(AConnection, ACommand, OkResponse + ' ' + GetMailBoxInfo(AConnection, cMailBoxInfoFormat));
end;

function TclPop3Server.LoginAuthenticate(AConnection: TclPop3CommandConnection;
  Account: TclUserAccountItem; const APassword: string): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := False;
  DoLoginAuthenticate(AConnection, Account, APassword, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    Result := Account.Authenticate(APassword);
  end;
end;

function TclPop3Server.APopAuthenticate(AConnection: TclPop3CommandConnection;
  Account: TclUserAccountItem; const ADigest: string): Boolean;
var
  handled: Boolean;
  calculated: string;
begin
  handled := False;
  Result := False;
  DoAPopAuthenticate(AConnection, Account, ADigest, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    calculated := MD5(AConnection.TimeStamp + Account.Password);
    Result := (calculated = ADigest);
  end;
end;

procedure TclPop3Server.DoLoginAuthenticate(AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
  const APassword: string; var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnLoginAuthenticate) then
  begin
    OnLoginAuthenticate(Self, AConnection, Account, APassword, IsAuthorized, Handled);
  end;
end;

procedure TclPop3Server.DoAPopAuthenticate(AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
  const ADigest: string; var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnAPopAuthenticate) then
  begin
    OnAPopAuthenticate(Self, AConnection, Account, ADigest, IsAuthorized, Handled);
  end;
end;

procedure TclPop3Server.HandleNOOP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);
  SendResponse(AConnection, ACommand, OkResponse);
end;

procedure TclPop3Server.HandleQUIT(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  try
    if (AConnection.ConnectionState = csPop3Transaction) then
    begin
      ChangeState(ACommand, AConnection, csPop3Update);
    end;
    SendResponse(AConnection, ACommand, OkResponse + ' ' + ServerName + ' connection closed');
    AConnection.Close(False);
  except
    on EclSocketError do ;
  end;
end;

procedure TclPop3Server.HandleRSET(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);

  DoReset(AConnection);

  AConnection.MailBox.Reset();

  SendResponse(AConnection, ACommand, OkResponse);
end;

procedure TclPop3Server.HandleSTAT(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);
  SendResponse(AConnection, ACommand, '%s %d %d',
    [OkResponse, AConnection.MailBox.ActiveCount, AConnection.MailBox.ActiveSize]);
end;

procedure TclPop3Server.HandleRETR(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  messageNo: Integer;
  msg: TStrings;
  success: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);

  messageNo := StrToIntDef(Trim(AParams), 0);

  if not AConnection.MailBox.MessageExists(messageNo) then
  begin
    RaiseNotFoundError(ACommand);
  end;

  msg := TStringList.Create();
  AddMultipleLines(AConnection, msg);
  success := True;
  DoRetrieve(AConnection, messageNo, 0, True, msg, success);
  if not success then
  begin
    RaiseNotFoundError(ACommand);
  end;

  SendResponse(AConnection, ACommand, OkResponse + ' %d', [GetStringsSize(msg)]);
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclPop3Server.HandleTOP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  messageNo, lines: Integer;
  msg: TStrings;
  params: string;
  success: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);

  params := Trim(AParams);

  if (WordCount(params, [#32]) < 2) then
  begin
    RaiseSyntaxError(ACommand);
  end;

  messageNo := StrToIntDef(ExtractWord(1, params, [#32]), 0);
  lines := StrToIntDef(ExtractWord(2, params, [#32]), 0);

  if not AConnection.MailBox.MessageExists(messageNo) then
  begin
    RaiseNotFoundError(ACommand);
  end;

  msg := TStringList.Create();
  AddMultipleLines(AConnection, msg);
  success := True;
  DoRetrieve(AConnection, messageNo, lines, False, msg, success);
  if not success then
  begin
    RaiseNotFoundError(ACommand);
  end;

  SendResponse(AConnection, ACommand, OkResponse);
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclPop3Server.HandleDELE(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  messageNo: Integer;
  canDelete: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);

  messageNo := StrToIntDef(Trim(AParams), 0);
  canDelete := True;

  if not AConnection.MailBox.MessageExists(messageNo) then
  begin
    RaiseNotFoundError(ACommand);
  end;
  
  DoDelete(AConnection, messageNo, canDelete);
  if not canDelete then
  begin
    RaiseNotFoundError(ACommand);
  end;

  AConnection.MailBox.MarkDeleted(messageNo);

  SendResponse(AConnection, ACommand, '%s message %d deleted', [OkResponse, messageNo]);
end;

procedure TclPop3Server.HandleLIST(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  messageNo: Integer;
  list: TStrings;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);

  messageNo := StrToIntDef(Trim(AParams), 0);

  if (messageNo > 0) then
  begin
    if not AConnection.MailBox.MessageExists(messageNo) then
    begin
      RaiseNotFoundError(ACommand);
    end;

    SendResponse(AConnection, ACommand, '%s %d %d',
      [OkResponse, messageNo, AConnection.MailBox[messageNo - 1].Size]);
  end else
  begin
    SendResponse(AConnection, ACommand, '%s %d %d',
      [OkResponse, AConnection.MailBox.ActiveCount, AConnection.MailBox.ActiveSize]);

    list := TStringList.Create();
    AddMultipleLines(AConnection, list);
    CollectActiveMessages(AConnection, list);
    SendMultipleLines(AConnection, '.', True);
  end;
end;

procedure TclPop3Server.HandleUIDL(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  messageNo: Integer;
  list: TStrings;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Transaction);

  messageNo := StrToIntDef(Trim(AParams), 0);

  if (messageNo > 0) then
  begin
    if not AConnection.MailBox.MessageExists(messageNo) then
    begin
      RaiseNotFoundError(ACommand);
    end;
    SendResponse(AConnection, ACommand, '%s %d %s',
      [OkResponse, messageNo, AConnection.MailBox[messageNo - 1].UID]);
  end else
  begin
    SendResponse(AConnection, ACommand, OkResponse);

    list := TStringList.Create();
    AddMultipleLines(AConnection, list);
    CollectActiveMessageUids(AConnection, list);
    SendMultipleLines(AConnection, '.', True);
  end;
end;

procedure TclPop3Server.CollectActiveMessages(AConnection: TclPop3CommandConnection; AList: TStrings);
var
  i: Integer;
begin
  AList.Clear();
  for i := 0 to AConnection.MailBox.Count - 1 do
  begin
    if (not AConnection.MailBox[i].IsDeleted) then
    begin
      AList.Add(Format('%d %d', [i + 1, AConnection.MailBox[i].Size]));
    end;
  end;
end;

procedure TclPop3Server.CollectActiveMessageUids(AConnection: TclPop3CommandConnection; AList: TStrings);
var
  i: Integer;
begin
  AList.Clear();
  for i := 0 to AConnection.MailBox.Count - 1 do
  begin
    if (not AConnection.MailBox[i].IsDeleted) then
    begin
      AList.Add(Format('%d %s', [i + 1, AConnection.MailBox[i].UID]));
    end;
  end;
end;

procedure TclPop3Server.SetUserAccounts(const Value: TclUserAccountList);
begin
  FUserAccounts.Assign(Value);
end;

function TclPop3Server.GetCaseInsensitive: Boolean;
begin
  Result := FUserAccounts.CaseInsensitive;
end;

procedure TclPop3Server.SetCaseInsensitive(const Value: Boolean);
begin
  FUserAccounts.CaseInsensitive := Value;
end;

procedure TclPop3Server.RaiseSyntaxError(const ACommand: string);
begin
  RaisePopError(ACommand, 'Invalid command');
end;

procedure TclPop3Server.DoDestroy;
begin
  FHelpText.Free();
  FUserAccounts.Free();
  FConnectionAccess.Free();
  inherited DoDestroy();
end;

function TclPop3Server.GenerateTimeStamp: string;
begin
  Result := GenerateMessageID();
end;

procedure TclPop3Server.DoMailBoxInfo(AConnection: TclPop3CommandConnection;
  AMailBox: TclPop3MessageList);
begin
  if Assigned(OnMailBoxInfo) then
  begin
    OnMailBoxInfo(Self, AConnection, AMailBox);
  end;
end;

function TclPop3Server.GetMailBoxInfo(AConnection: TclPop3CommandConnection;
  const AFormat: string): string;
begin
  DoMailBoxInfo(AConnection, AConnection.MailBox);
  Result := Format(AFormat, [AConnection.MailBox.ActiveCount, AConnection.MailBox.ActiveSize]);
end;

procedure TclPop3Server.RaiseNotFoundError(const ACommand: string);
begin
  RaisePopError(ACommand, 'no such message');
end;

procedure TclPop3Server.DoRetrieve(AConnection: TclPop3CommandConnection;
  AMessageNo, ATopLines: Integer; ARetrieveAll: Boolean; AMessageSource: TStrings;
  var Success: Boolean);
begin
  if Assigned(OnRetrieve) then
  begin
    OnRetrieve(Self, AConnection, AMessageNo, ATopLines, ARetrieveAll, AMessageSource, Success);
  end;
end;

procedure TclPop3Server.DoDelete(AConnection: TclPop3CommandConnection;
  AMessageNo: Integer; var ACanDelete: Boolean);
begin
  if Assigned(OnDelete) then
  begin
    OnDelete(Self, AConnection, AMessageNo, ACanDelete);
  end;
end;

procedure TclPop3Server.DoStateChanged(AConnection: TclPop3CommandConnection);
begin
  if Assigned(OnStateChanged) then
  begin
    OnStateChanged(Self, AConnection);
  end;
end;

procedure TclPop3Server.DoCloseConnection(AConnection: TclCommandConnection);
var
  command: TclPop3CommandConnection;
begin
  inherited DoCloseConnection(AConnection);

  command := AConnection as TclPop3CommandConnection;
  ChangeState('', command, csPop3Authorization);
end;

procedure TclPop3Server.DoReset(AConnection: TclPop3CommandConnection);
begin
  if Assigned(OnReset) then
  begin
    OnReset(Self, AConnection);
  end;
end;

function TclPop3Server.GetConnectionByUser(const AUserName: string): TclPop3CommandConnection;
var
  i: Integer;
begin
  for i := 0 to ConnectionCount - 1 do
  begin
    Result := (Connections[i] as TclPop3CommandConnection);
    if SameText(Result.UserName, AUserName)
      and (Result.ConnectionState = csPop3Transaction) then
    begin
      Exit;
    end;
  end;
  Result := nil;
end;

procedure TclPop3Server.ChangeState(const ACommand: string; AConnection: TclPop3CommandConnection;
  ANewState: TclPop3ConnectionState);
begin
  FConnectionAccess.Enter();
  try
    if (ANewState = csPop3Transaction) and (GetConnectionByUser(AConnection.UserName) <> nil) then
    begin
      RaisePopError(ACommand, 'maildrop already locked');
    end;
    AConnection.FConnectionState := ANewState;
    DoStateChanged(AConnection);
  finally
    FConnectionAccess.Leave();
  end;
end;

procedure TclPop3Server.HandleNullCommand(AConnection: TclPop3CommandConnection;
  const ACommand, AParams: string);
begin
  RaiseSyntaxError(ACommand);
end;

function TclPop3Server.GetNullCommand(const ACommand: string): TclTcpCommandInfo;
var
  info: TclPop3CommandInfo;
begin
  info := TclPop3CommandInfo.Create();
  info.Name := ACommand;
  info.FHandler := HandleNullCommand;
  Result := info;
end;

procedure TclPop3Server.ProcessUnhandledError(AConnection: TclCommandConnection;
  AParams: TclTcpCommandParams; E: Exception);
begin
  SendResponse(AConnection, AParams.Command, ErrResponse + ' access denied ');
end;

procedure TclPop3Server.DoProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
begin
  AConnection.BeginWork();
  try
    inherited DoProcessCommand(AConnection, AInfo, AParams);
  finally
    AConnection.EndWork();
  end;
end;

procedure TclPop3Server.HandleSTLS(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
begin
  if (UseTLS = stNone) or (UseTLS = stImplicit) or AConnection.IsTls then
  begin
    RaiseSyntaxError(ACommand);
  end;

  SendResponse(AConnection, ACommand, OkResponse + ' start TLS negotiation');
  AConnection.InitParams();
  StartTls(AConnection);
end;

procedure TclPop3Server.CheckTlsMode(AConnection: TclPop3CommandConnection; const ACommand: string);
begin
  if (UseTLS = stExplicitRequire) and (not AConnection.IsTls) then
  begin
    RaisePopError(ACommand, 'Must issue a STLS command first');
  end;
end;

procedure TclPop3Server.HandleHELP(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  helpStr: string;
begin
  helpStr := HelpText.Text;
  helpStr := StringReplace(helpStr, #13#10, ', ', [rfReplaceAll]);
  helpStr := Trim(helpStr);
  if (helpStr <> '') and (helpStr[Length(helpStr)] = ',') then
  begin
    helpStr := ' ' + system.Copy(helpStr, 1, Length(helpStr) - 1);
  end;

  SendResponse(AConnection, ACommand, OkResponse + helpStr);
end;

procedure TclPop3Server.SetHelpText(const Value: TStrings);
begin
  FHelpText.Assign(Value);
end;

procedure TclPop3Server.FillDefaultHelpText;
begin
  HelpText.Add('Valid commands: USER');
  HelpText.Add('PASS');
  HelpText.Add('APOP');
  HelpText.Add('AUTH');
  HelpText.Add('QUIT');
  HelpText.Add('NOOP');
  HelpText.Add('HELP');
  HelpText.Add('STAT');
  HelpText.Add('RETR');
  HelpText.Add('TOP');
  HelpText.Add('DELE');
  HelpText.Add('RSET');
  HelpText.Add('LIST');
  HelpText.Add('UIDL');
  HelpText.Add('STLS');
end;

procedure TclPop3Server.HandleAUTH(AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  encoder: TclEncoder;
  method, s: string;
  list: TStrings;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckConnectionState(ACommand, AConnection.ConnectionState, csPop3Authorization);

  if not (UseAuth in [pmSASL, pmBoth]) then
  begin
    RaiseSyntaxError(ACommand);
  end;

  method := UpperCase(Trim(AParams));

  if (method = '') then
  begin
    list := TStringList.Create();
    AddMultipleLines(AConnection, list);
    if (ssUseNTLM in SASLFlags) then
    begin
      list.Add('NTLM');
    end;
    if (ssUseCramMD5 in SASLFlags) then
    begin
      list.Add('CRAM-MD5');
    end;
    SendResponse(AConnection, ACommand, OkResponse);
    SendMultipleLines(AConnection, '.', True);
  end else
  if (method = 'CRAM-MD5') and (ssUseCramMD5 in SASLFlags) then
  begin
    encoder := TclEncoder.Create(nil);
    try
      AConnection.FCramMD5Key := GenCramMD5Key();
      encoder.EncodeString(AConnection.CramMD5Key, s, cmMIMEBase64);
      AConnection.FReceivingData := rdPop3CramMD5;
      SendResponse(AConnection, ACommand, '+ ' + s);
    finally
      encoder.Free();
    end;
  end else
  if (method = 'NTLM') and (ssUseNTLM in SASLFlags) then
  begin
    AConnection.FNTLMAuth.Free();
    AConnection.FNTLMAuth := TclNtAuthServerSspi.Create();
    AConnection.FReceivingData := rdPop3NTLM;
    SendResponse(AConnection, ACommand, '+ OK'); //NTLM + OK
  end else
  begin
    RaiseSyntaxError(ACommand);
  end;
end;

procedure TclPop3Server.HandleNTLM(AConnection: TclPop3CommandConnection;
  const AData: string);
begin
  AConnection.RawData := AData;
  HandleEndCommand(AConnection, 'AUTH', HandleNTLMEnd);
end;

procedure TclPop3Server.HandleNTLMEnd(
  AConnection: TclPop3CommandConnection; const ACommand, AParams: string);
var
  buf: TStream;
  encoder: TclEncoder;
  challenge: string;
begin
  CheckAuthAbort(AConnection, Trim(AConnection.RawData));

  try
    encoder := nil;
    buf := nil;
    try
      encoder := TclEncoder.Create(nil);
      encoder.SuppressCrlf := True;
      buf := TMemoryStream.Create();

      encoder.DecodeFromString(Trim(AConnection.RawData), buf, cmMIMEBase64);
      buf.Position := 0;

      if AConnection.FNTLMAuth.GenChallenge('NTLM', buf, nil) then
      begin
        AConnection.FNTLMAuth.ImpersonateUser();
        try
          AConnection.FUserName := GetCurrentThreadUser();

          if not NtlmAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName)) then
          begin
            AConnection.FUserName := '';
            RaisePopError(ACommand, 'incorrect password or account name');
          end;
        finally
          AConnection.FNTLMAuth.RevertUser();
        end;

        AConnection.FReceivingData := rdPop3Command;
        ChangeState(ACommand, AConnection, csPop3Transaction);
        SendResponse(AConnection, ACommand, OkResponse + ' ' + GetMailBoxInfo(AConnection, cMailBoxInfoFormat));
      end else
      begin
        buf.Position := 0;
        challenge := '';
        encoder.EncodeToString(buf, challenge, cmMIMEBase64);

        SendResponse(AConnection, ACommand, '+ ' + challenge);
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

procedure TclPop3Server.HandleCramMD5(AConnection: TclPop3CommandConnection; const AData: string);
begin
  AConnection.RawData := AData;
  AConnection.FReceivingData := rdPop3Command;
  HandleEndCommand(AConnection, 'AUTH', HandleCramMD5End);
end;

procedure TclPop3Server.HandleCramMD5End(AConnection: TclPop3CommandConnection;
  const ACommand, AParams: string);
var
  encoder: TclEncoder;
  hash: string;
begin
  CheckAuthAbort(AConnection, AConnection.RawData);

  encoder := TclEncoder.Create(nil);
  try
    hash := '';
    try
      encoder.DecodeString(Trim(AConnection.RawData), hash, cmMIMEBase64);
    except
      on EclEncoderError do CheckAuthAbort(AConnection, '*');
    end;
    if (WordCount(hash, [' ']) <> 2) then
    begin
      CheckAuthAbort(AConnection, '*');
    end;
    AConnection.FUserName := ExtractWord(1, hash, [' ']);
    hash := ExtractWord(2, hash, [' ']);

    if not CramMD5Authenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName),
      AConnection.CramMD5Key, hash) then
    begin
      AConnection.FUserName := '';
      RaisePopError(ACommand, 'incorrect password or account name');
    end;
    ChangeState(ACommand, AConnection, csPop3Transaction);
    SendResponse(AConnection, ACommand, OkResponse + ' ' + GetMailBoxInfo(AConnection, cMailBoxInfoFormat));
  finally
    encoder.Free();
  end;
end;

procedure TclPop3Server.CheckAuthAbort(AConnection: TclPop3CommandConnection; const AParams: string);
begin
  if (Trim(AParams) = '*') then
  begin
    AConnection.InitParams();
    RaisePopError('AUTH', 'authentication aborted');
  end;
end;

procedure TclPop3Server.ProcessData(AConnection: TclCommandConnection; const AData: string);
var
  connection: TclPop3CommandConnection;
begin
  connection := AConnection as TclPop3CommandConnection;
  case connection.ReceivingData of
    rdPop3CramMD5: HandleCramMD5(connection, AData);
    rdPop3NTLM: HandleNTLM(connection, AData)
  else
    inherited ProcessData(connection, AData);
  end;
end;

function TclPop3Server.GenCramMD5Key: string;
begin
  Result := GenerateCramMD5Key();
end;

procedure TclPop3Server.HandleEndCommand(
  AConnection: TclPop3CommandConnection; const ACommand: string;
  AHandler: TclPop3CommandHandler);
var
  info: TclPop3CommandInfo;
  params: TclTcpCommandParams;
begin
  info := nil;
  params := nil;
  try
    info := TclPop3CommandInfo.Create();
    params := TclTcpCommandParams.Create();
    info.Name := ACommand;
    info.FHandler := AHandler;
    ProcessCommand(AConnection, info, params);
  finally
    params.Free();
    info.Free();
  end;
end;

function TclPop3Server.CramMD5Authenticate(
  AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
  const AKey, AHash: string): Boolean;
var
  handled: Boolean;
  calculated: string;
begin
  handled := False;
  Result := False;
  DoAuthAuthenticate(AConnection, Account, AKey, AHash, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    calculated := HMAC_MD5(AKey, Account.Password);
    Result := (calculated = AHash);
  end;
end;

function TclPop3Server.NtlmAuthenticate(
  AConnection: TclPop3CommandConnection; Account: TclUserAccountItem): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := True;
  DoAuthAuthenticate(AConnection, Account, '', '', Result, handled);
end;

procedure TclPop3Server.DoAuthAuthenticate(
  AConnection: TclPop3CommandConnection; Account: TclUserAccountItem;
  const AKey, AHash: string; var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnAuthAuthenticate) then
  begin
    OnAuthAuthenticate(Self, AConnection, Account, AKey, AHash, IsAuthorized, handled);
  end;
end;

{ TclPop3MessageList }

function TclPop3MessageList.Add: TclPop3MessageItem;
begin
  Result := TclPop3MessageItem(inherited Add());
end;

function TclPop3MessageList.GetItem(Index: Integer): TclPop3MessageItem;
begin
  Result := TclPop3MessageItem(inherited GetItem(Index));
end;

function TclPop3MessageList.GetActiveSize: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    if (not Items[i].IsDeleted) then
    begin
      Result := Result + Items[i].Size;
    end;
  end;
end;

procedure TclPop3MessageList.SetItem(Index: Integer; const Value: TclPop3MessageItem);
begin
  inherited SetItem(Index, Value);
end;

function TclPop3MessageList.GetActiveCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    if (not Items[i].IsDeleted) then
    begin
      Inc(Result);
    end;
  end;
end;

function TclPop3MessageList.MessageExists(AMessageNo: Integer): Boolean;
begin
  Result := (AMessageNo > 0) and (AMessageNo <= Count) and (not Items[AMessageNo - 1].IsDeleted);
end;

procedure TclPop3MessageList.MarkDeleted(AMessageNo: Integer);
begin
  Items[AMessageNo - 1].IsDeleted := True;
end;

procedure TclPop3MessageList.Reset;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].IsDeleted := False;
  end;
end;

{ TclPop3MessageItem }

procedure TclPop3MessageItem.Assign(Source: TPersistent);
var
  Src: TclPop3MessageItem;
begin
  if (Source is TclPop3MessageItem) then
  begin
    Src := (Source as TclPop3MessageItem);
    UID := Src.UID;
    Size := Src.Size;
    IsDeleted := Src.IsDeleted;
    ExtraInfo := Src.ExtraInfo;
  end else
  begin
    inherited Assign(Source);
  end;
end;

{ TclPop3CommandConnection }

constructor TclPop3CommandConnection.Create;
begin
  inherited Create();
  FMailBox := TclPop3MessageList.Create(TclPop3MessageItem);
  InitParams();
end;

procedure TclPop3CommandConnection.DoDestroy;
begin
  FNTLMAuth.Free();
  FMailBox.Free();
  inherited DoDestroy();
end;

procedure TclPop3CommandConnection.InitParams;
begin
  FConnectionState := csPop3Authorization;
  FReceivingData := rdPop3Command;
  FTimeStamp := '';
  FUserName := '';
  FCramMD5Key := '';
  FRawData := '';
  FMailBox.Clear();
  FNTLMAuth.Free();
  FNTLMAuth := nil;
end;

{ TclPop3CommandInfo }

procedure TclPop3CommandInfo.Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams);
begin
  FHandler(AConnection as TclPop3CommandConnection, Name, AParams.Params);
end;

end.
