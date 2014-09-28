{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clImap4Server;

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
  Classes, SysUtils, WinSock, clTcpServer, clSocket, clUserMgr, clImapUtils, SyncObjs,
  clSspi, clSspiAuth;

type
  EclImap4CommandError = class(EclTcpCommandError)
  private
    FTag: string;
  public
    constructor Create(const ATag, ACommand, AErrorMsg: string; AErrorCode: Integer);
    property Tag: string read FTag;
  end;

  TclImap4ReceivingData = (rdImapCommand, rdImapCramMD5, rdImapNTLM, rdImapData);
  TclImap4MailBoxResult = (mrSuccess, mrAlreadyExists, mrNotFound, mrAccessDenied);
  TclImap4MessageResult = (msOk, msNo, msBad);
  TclImap4AuthMode = (imImapLogin, imSASL, imBoth);

  TclImap4MailBoxAttribute = (maNoinferiors, maNoselect, maMarked, maUnmarked);
  TclImap4MailBoxAttributes = set of TclImap4MailBoxAttribute;

  TclImap4MailBoxItem = class(TCollectionItem)
  private
    FName: string;
    FAttributes: TclImap4MailBoxAttributes;
    FIsSubscribed: Boolean;
  public
    property Name: string read FName write FName;
    property IsSubscribed: Boolean read FIsSubscribed write FIsSubscribed;
    property Attributes: TclImap4MailBoxAttributes read FAttributes write FAttributes;
  end;

  TclImap4MailBoxList = class(TCollection)
  private
    function GetItem(Index: Integer): TclImap4MailBoxItem;
    procedure SetItem(Index: Integer; const Value: TclImap4MailBoxItem);
  public
    function Add: TclImap4MailBoxItem;
    property Items[Index: Integer]: TclImap4MailBoxItem read GetItem write SetItem; default;
  end;

  TclImap4CommandConnection = class(TclCommandConnection)
  private
    FConnectionState: TclImapConnectionState;
    FReceivingData: TclImap4ReceivingData;
    FCramMD5Key: string;
    FRawTag: string;
    FUserName: string;
    FReadOnlyAccess: Boolean;
    FCurrentMailBox: TclImap4MailBoxInfo;
    FAppendDataSize: Integer;
    FAppendFlags: TclMailMessageFlags;
    FAppendMailBox: string;
    FRawData: string;
    FNTLMAuth: TclNtAuthServerSspi;
  protected
    procedure DoDestroy; override;
  public
    constructor Create;
    procedure InitParams;
    property ConnectionState: TclImapConnectionState read FConnectionState;
    property CurrentMailBox: TclImap4MailBoxInfo read FCurrentMailBox;
    property ReceivingData: TclImap4ReceivingData read FReceivingData;
    property UserName: string read FUserName;
    property CramMD5Key: string read FCramMD5Key;
    property ReadOnlyAccess: Boolean read FReadOnlyAccess;
    property RawData: string read FRawData write FRawData;
    property RawTag: string read FRawTag;
  end;

  TclImap4CommandHandler = procedure (AConnection: TclImap4CommandConnection;
    const ATag, ACommand, AParams: string) of object;

  TclImap4CommandParams = class(TclTcpCommandParams)
  private
    FTag: string;
  public
    property Tag: string read FTag write FTag;
  end;

  TclImap4CommandInfo = class(TclTcpCommandInfo)
  private
    FHandler: TclImap4CommandHandler;
  protected
    procedure Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams); override;
  end;

  TclTaggedCommandConnectionEvent = procedure (Sender: TObject; AConnection: TclCommandConnection;
    const ATag, ACommand, AText: string) of object;

  TclImap4LoginAuthenticateEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    Account: TclUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean) of object;

  TclImap4AuthAuthenticateEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    Account: TclUserAccountItem; const AKey, AHash: string; var IsAuthorized, Handled: Boolean) of object;

  TclImap4ConnectionEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection) of object;

  TclImap4MailBoxesEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AReferenceName, ACriteria: string; AMailBoxes: TclImap4MailBoxList) of object;

  TclImap4MailBoxEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMailBox: string; var Result: TclImap4MailBoxResult) of object;

  TclImap4RenameMailBoxEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const ACurrentName, ANewName: string; var Result: TclImap4MailBoxResult) of object;

  TclImap4MailBoxInfoEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMailBox: string; IsSelectMailBox: Boolean; AMailBoxInfo: TclImap4MailBoxInfo;
    var Result: TclImap4MailBoxResult) of object;

  TclImap4SearchMessagesEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const ASearchCriteria: string; AUseUID: Boolean; AMessageIDs: TStrings;
    var Result: TclImap4MessageResult) of object;

  TclImap4CopyMessagesEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMessageSet, AMailBox: string; AUseUID: Boolean; var Result: TclImap4MailBoxResult) of object;

  TclImap4FetchMessagesEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMessageSet, ADataItems: string; AUseUID: Boolean;
    AResponse: TclImap4FetchResponseList; var Result: TclImap4MessageResult) of object;

  TclImap4StoreMessagesEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMessageSet: string; AFlagsMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags;
    IsSilent: Boolean; AUseUID: Boolean; AResponse: TclImap4FetchResponseList;
    var Result: TclImap4MessageResult) of object;

  TclImap4PurgeMessagesEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    IsSilent: Boolean; AMessageIDs: TStrings; var Result: TclImap4MessageResult) of object;

  TclImap4CanAppendMessageEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMailBox: string; var Result: TclImap4MailBoxResult) of object;

  TclImap4MessageAppendedEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMailBox: string; AFlags: TclMailMessageFlags; AMessage: TStrings;
    var Result: TclImap4MailBoxResult) of object;

  TclImap4Server = class(TclTcpCommandServer)
  private
    FUserAccounts: TclUserAccountList;
    FUseAuth: TclImap4AuthMode;
    FSASLFlags: TclServerSaslFlags;
    FOnReceiveTaggedCommand: TclTaggedCommandConnectionEvent;
    FOnSendTaggedResponse: TclTaggedCommandConnectionEvent;
    FOnLoginAuthenticate: TclImap4LoginAuthenticateEvent;
    FOnAuthAuthenticate: TclImap4AuthAuthenticateEvent;
    FOnStateChanged: TclImap4ConnectionEvent;
    FOnGetMailBoxes: TclImap4MailBoxesEvent;
    FMailBoxSeparator: Char;
    FOnCreateMailBox: TclImap4MailBoxEvent;
    FOnDeleteMailBox: TclImap4MailBoxEvent;
    FOnRenameMailBox: TclImap4RenameMailBoxEvent;
    FOnSubscribeMailBox: TclImap4MailBoxEvent;
    FOnUnsubscribeMailBox: TclImap4MailBoxEvent;
    FOnGetMailBoxInfo: TclImap4MailBoxInfoEvent;
    FCapabilities: TStrings;
    FOnSearchMessages: TclImap4SearchMessagesEvent;
    FOnCopyMessages: TclImap4CopyMessagesEvent;
    FOnFetchMessages: TclImap4FetchMessagesEvent;
    FOnStoreMessages: TclImap4StoreMessagesEvent;
    FOnPurgeMessages: TclImap4PurgeMessagesEvent;
    FOnCanAppendMessage: TclImap4CanAppendMessageEvent;
    FOnMessageAppended: TclImap4MessageAppendedEvent;
    procedure SetUserAccounts(const Value: TclUserAccountList);
    function GetCaseInsensitive: Boolean;
    procedure SetCaseInsensitive(const Value: Boolean);
    procedure RaiseBadStateError(const ATag, ACommand: string);
    procedure HandleNullCommand(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleLOGIN(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleAUTHENTICATE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleLOGOUT(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleLIST(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleCREATE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleDELETE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleRENAME(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleLSUB(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleSUBSCRIBE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleUNSUBSCRIBE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleSELECT(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleEXAMINE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleSTATUS(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleNOOP(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleCHECK(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleCAPABILITY(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleSEARCH(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleCOPY(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleFETCH(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleSTORE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleUID(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleCLOSE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleEXPUNGE(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleAPPEND(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleSTARTTLS(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);

    procedure HandleEndCommand(AConnection: TclImap4CommandConnection;
      const ATag, ACommand: string; AHandler: TclImap4CommandHandler);
    procedure HandleCramMD5(AConnection: TclImap4CommandConnection; const AData: string);
    procedure HandleCramMD5End(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleNTLM(AConnection: TclImap4CommandConnection; const AData: string);
    procedure HandleNTLMEnd(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    procedure HandleDataLine(AConnection: TclImap4CommandConnection; const AData: string);
    procedure HandleDataLineEnd(AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
    function LoginAuthenticate(AConnection: TclImap4CommandConnection;
      Account: TclUserAccountItem; const APassword: string): Boolean;
    function CramMD5Authenticate(AConnection: TclImap4CommandConnection;
      Account: TclUserAccountItem; const AKey, AHash: string): Boolean;
    function NtlmAuthenticate(AConnection: TclImap4CommandConnection;
      Account: TclUserAccountItem): Boolean;
    procedure CheckAuthAbort(AConnection: TclImap4CommandConnection; const AParams: string);
    procedure CheckTlsMode(AConnection: TclImap4CommandConnection; const ATag, ACommand: string);
    procedure CheckConnectionState(const ATag, ACommand: string; AState: TclImapConnectionState;
      ARequired: array of TclImapConnectionState);
    procedure ChangeState(AConnection: TclImap4CommandConnection; ANewState: TclImapConnectionState);
    procedure CollectMailBoxListResponse(AMailBoxes: TclImap4MailBoxList;
      const ACommand: string; AList: TStrings; AGetAll: Boolean);
    function GetMailBoxAttrsStr(Attrs: TclImap4MailBoxAttributes): string;
    procedure SendMailBoxListResponse(AConnection: TclImap4CommandConnection;
      const ATag, ACommand: string; AMailBoxes: TclImap4MailBoxList; AGetAll: Boolean);
    function GetMailBoxListCriteria(const AParams: string;
      var AReferenceName, ACriteria: string): Boolean;
    procedure InternalHandleSelect(AConnection: TclImap4CommandConnection;
      const ATag, ACommand, AMailBox: string; AReadOnly: Boolean);
    procedure SendMailBoxInfo(AConnection: TclImap4CommandConnection;
      const ATag, ACommand: string; AMailBoxInfo: TclImap4MailBoxInfo; AReadOnly: Boolean);
    procedure SendStatusResponse(AConnection: TclImap4CommandConnection;
      const ATag, AMailBox: string; AStatusNames: TStrings; AMailBoxInfo: TclImap4MailBoxInfo);
    procedure FillDefaultCapabilities;
    procedure InternalHandleSearch(AConnection: TclImap4CommandConnection;
      const ATag, ASearchCriteria: string; AUseUID: Boolean);
    procedure SendSearchResponse(AConnection: TclImap4CommandConnection;
      const ATag: string; AList: TStrings);
    procedure InternalHandleCopy(AConnection: TclImap4CommandConnection;
      const ATag, AParams: string; AUseUID: Boolean);
    procedure InternalHandleFetch(AConnection: TclImap4CommandConnection;
      const ATag, AParams: string; AUseUID: Boolean);
    procedure InternalHandleStore(AConnection: TclImap4CommandConnection;
      const ATag, AParams: string; AUseUID: Boolean);
    procedure ExtractFlagsParameters(const ATag, ASource: string;
      var AFlagsMethod: TclSetFlagsMethod; var AFlags: TclMailMessageFlags;
      var IsSilent: Boolean);
    procedure InternalExpunge(AConnection: TclImap4CommandConnection;
      const ATag, ACommand: string; IsSilent: Boolean);
    procedure SetCapabilities(const Value: TStrings);
    procedure GetMailBoxes(AConnection: TclImap4CommandConnection;
      const AReferenceName, ACriteria: string; AMailBoxes: TclImap4MailBoxList);
  protected
    procedure AddImapCommand(const ACommand: string; AHandler: TclImap4CommandHandler);
    procedure RegisterCommands; override;
    function GetNullCommand(const ACommand: string): TclTcpCommandInfo; override;
    function GetCommandParams(const AData: string): TclTcpCommandParams; override;
    procedure ProcessData(AConnection: TclCommandConnection; const AData: string); override;
    procedure ProcessUnhandledError(AConnection: TclCommandConnection;
      AParams: TclTcpCommandParams; E: Exception); override;
    procedure DoProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams); override;
    procedure DoAcceptConnection(AConnection: TclCommandConnection); override;
    function CreateDefaultConnection: TclCommandConnection; override;
    procedure DoDestroy; override;
   procedure DoReceiveTaggedCommand(AConnection: TclCommandConnection;
      const ATag, ACommand, AParams: string); virtual;
    procedure DoSendTaggedResponse(AConnection: TclCommandConnection;
      const ATag, ACommand, AResponse: string); virtual;
    procedure DoLoginAuthenticate(AConnection: TclImap4CommandConnection;
      Account: TclUserAccountItem; const APassword: string;
      var IsAuthorized, Handled: Boolean); virtual;
    procedure DoAuthAuthenticate(AConnection: TclImap4CommandConnection;
      Account: TclUserAccountItem; const AKey, AHash: string;
      var IsAuthorized, Handled: Boolean); virtual;
    procedure DoStateChanged(AConnection: TclImap4CommandConnection); virtual;
    procedure DoGetMailBoxes(AConnection: TclImap4CommandConnection;
      const AReferenceName, ACriteria: string; AMailBoxes: TclImap4MailBoxList); virtual;
    procedure DoCreateMailBox(AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult); virtual;
    procedure DoDeleteMailBox(AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult); virtual;
    procedure DoRenameMailBox(AConnection: TclImap4CommandConnection;
      const ACurrentName, ANewName: string; var Result: TclImap4MailBoxResult); virtual;
    procedure DoSubscribeMailBox(AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult); virtual;
    procedure DoUnsubscribeMailBox(AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult); virtual;
    procedure DoGetMailBoxInfo(AConnection: TclImap4CommandConnection;
      const AMailBox: string; IsSelectMailBox: Boolean; AMailBoxInfo: TclImap4MailBoxInfo;
      var Result: TclImap4MailBoxResult); virtual;
    procedure DoSearchMessages(AConnection: TclImap4CommandConnection;
      const ASearchCriteria: string; AUseUID: Boolean; AMessageIDs: TStrings;
      var Result: TclImap4MessageResult); virtual;
    procedure DoCopyMessages(AConnection: TclImap4CommandConnection;
      const AMessageSet, AMailBox: string; AUseUID: Boolean; var Result: TclImap4MailBoxResult); virtual;
    procedure DoFetchMessages(AConnection: TclImap4CommandConnection; const AMessageSet, ADataItems: string;
      AUseUID: Boolean; AResponse: TclImap4FetchResponseList; var Result: TclImap4MessageResult); virtual;
    procedure DoStoreMessages(AConnection: TclImap4CommandConnection;
      const AMessageSet: string; AFlagsMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags;
      IsSilent: Boolean; AUseUID: Boolean; AResponse: TclImap4FetchResponseList;
      var Result: TclImap4MessageResult); virtual;
    procedure DoExpungeMessages(AConnection: TclImap4CommandConnection;
      IsSilent: Boolean; AMessageIDs: TStrings; var Result: TclImap4MessageResult); virtual;
    procedure DoCanAppendMessage(AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult); virtual;
    procedure DoMessageAppended(AConnection: TclImap4CommandConnection;
      const AMailBox: string; AFlags: TclMailMessageFlags; AMessage: TStrings;
      var Result: TclImap4MailBoxResult); virtual;
    function GenCramMD5Key: string; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SendTaggedResponse(AConnection: TclCommandConnection;
      const ATag, ACommand, AResponse: string);
  published
    property Port default cDefaultImapPort;
    property UseAuth: TclImap4AuthMode read FUseAuth write FUseAuth default imBoth;
    property SASLFlags: TclServerSaslFlags read FSASLFlags write FSASLFlags default [ssUseCramMD5, ssUseNTLM];
    property UserAccounts: TclUserAccountList read FUserAccounts write SetUserAccounts;
    property CaseInsensitive: Boolean read GetCaseInsensitive write SetCaseInsensitive default True;
    property MailBoxSeparator: Char read FMailBoxSeparator write FMailBoxSeparator default '/';
    property Capabilities: TStrings read FCapabilities write SetCapabilities;

    property OnReceiveTaggedCommand: TclTaggedCommandConnectionEvent
      read FOnReceiveTaggedCommand write FOnReceiveTaggedCommand;
    property OnSendTaggedResponse: TclTaggedCommandConnectionEvent
      read FOnSendTaggedResponse write FOnSendTaggedResponse;
    property OnLoginAuthenticate: TclImap4LoginAuthenticateEvent read FOnLoginAuthenticate
      write FOnLoginAuthenticate;
    property OnAuthAuthenticate: TclImap4AuthAuthenticateEvent read FOnAuthAuthenticate
      write FOnAuthAuthenticate;
    property OnStateChanged: TclImap4ConnectionEvent read FOnStateChanged write FOnStateChanged;
    property OnGetMailBoxes: TclImap4MailBoxesEvent read FOnGetMailBoxes write FOnGetMailBoxes;
    property OnCreateMailBox: TclImap4MailBoxEvent read FOnCreateMailBox write FOnCreateMailBox;
    property OnDeleteMailBox: TclImap4MailBoxEvent read FOnDeleteMailBox write FOnDeleteMailBox;
    property OnRenameMailBox: TclImap4RenameMailBoxEvent read FOnRenameMailBox write FOnRenameMailBox;
    property OnSubscribeMailBox: TclImap4MailBoxEvent read FOnSubscribeMailBox write FOnSubscribeMailBox;
    property OnUnsubscribeMailBox: TclImap4MailBoxEvent read FOnUnsubscribeMailBox write FOnUnsubscribeMailBox;
    property OnGetMailBoxInfo: TclImap4MailBoxInfoEvent read FOnGetMailBoxInfo write FOnGetMailBoxInfo;
    property OnSearchMessages: TclImap4SearchMessagesEvent read FOnSearchMessages write FOnSearchMessages;
    property OnCopyMessages: TclImap4CopyMessagesEvent read FOnCopyMessages write FOnCopyMessages;
    property OnFetchMessages: TclImap4FetchMessagesEvent read FOnFetchMessages write FOnFetchMessages;
    property OnStoreMessages: TclImap4StoreMessagesEvent read FOnStoreMessages write FOnStoreMessages;
    property OnPurgeMessages: TclImap4PurgeMessagesEvent read FOnPurgeMessages write FOnPurgeMessages;
    property OnCanAppendMessage: TclImap4CanAppendMessageEvent read FOnCanAppendMessage write FOnCanAppendMessage;
    property OnMessageAppended: TclImap4MessageAppendedEvent read FOnMessageAppended write FOnMessageAppended;  
  end;

procedure RaiseImapError(const ATag, ACommand, AMessage: string);
procedure RaiseImapNoResponse(const ATag, ACommand, AMessage: string);

implementation

uses
  Windows, clTlsSocket, clMCUtils, clUtils, clCryptUtils,
  clEncoder;

const
  OkResponse = 'OK';
  NoResponse = 'NO';
  BadResponse = 'BAD';

procedure RaiseImapError(const ATag, ACommand, AMessage: string);
begin
  raise EclImap4CommandError.Create(ATag, ACommand, Format('%s %s %s', [ATag, BadResponse, AMessage]), -1);
end;

procedure RaiseImapNoResponse(const ATag, ACommand, AMessage: string);
begin
  raise EclImap4CommandError.Create(ATag, ACommand, Format('%s %s %s', [ATag, NoResponse, AMessage]), -1);
end;

{ TclImap4Server }

procedure TclImap4Server.AddImapCommand(const ACommand: string;
  AHandler: TclImap4CommandHandler);
var
  info: TclImap4CommandInfo;
begin
  info := TclImap4CommandInfo.Create();
  AddCommand(info);
  info.Name := ACommand;
  info.FHandler := AHandler;
end;

constructor TclImap4Server.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCapabilities := TStringList.Create();
  FillDefaultCapabilities();
  FUserAccounts := TclUserAccountList.Create(Self, TclUserAccountItem);
  Port := cDefaultImapPort;
  ServerName := 'Clever Internet Suite IMAP4 service';
  CaseInsensitive := True;
  MailBoxSeparator := '/';
  FUseAuth := imBoth;
  SASLFlags := [ssUseCramMD5, ssUseNTLM];
end;

procedure TclImap4Server.FillDefaultCapabilities;
begin
  Capabilities.Clear();
  Capabilities.Add('IMAP4rev1');
end;

function TclImap4Server.CreateDefaultConnection: TclCommandConnection;
begin
  Result := TclImap4CommandConnection.Create();
end;

procedure TclImap4Server.DoAcceptConnection(AConnection: TclCommandConnection);
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
  SendTaggedResponse(AConnection, '*', '', OkResponse + ' IMAP4rev1 ' + ServerName + ' Ready');
end;

procedure TclImap4Server.RegisterCommands;
begin
  AddImapCommand('LOGIN', HandleLOGIN);
  AddImapCommand('AUTHENTICATE', HandleAUTHENTICATE);
  AddImapCommand('LOGOUT', HandleLOGOUT);
  AddImapCommand('LIST', HandleLIST);
  AddImapCommand('CREATE', HandleCREATE);
  AddImapCommand('DELETE', HandleDELETE);
  AddImapCommand('RENAME', HandleRENAME);
  AddImapCommand('LSUB', HandleLSUB);
  AddImapCommand('SUBSCRIBE', HandleSUBSCRIBE);
  AddImapCommand('UNSUBSCRIBE', HandleUNSUBSCRIBE);
  AddImapCommand('SELECT', HandleSELECT);
  AddImapCommand('EXAMINE', HandleEXAMINE);
  AddImapCommand('STATUS', HandleSTATUS);
  AddImapCommand('NOOP', HandleNOOP);
  AddImapCommand('CHECK', HandleCHECK);
  AddImapCommand('CAPABILITY', HandleCAPABILITY);
  AddImapCommand('SEARCH', HandleSEARCH);
  AddImapCommand('COPY', HandleCOPY);
  AddImapCommand('FETCH', HandleFETCH);
  AddImapCommand('STORE', HandleSTORE);
  AddImapCommand('UID', HandleUID);
  AddImapCommand('CLOSE', HandleCLOSE);
  AddImapCommand('EXPUNGE', HandleEXPUNGE);
  AddImapCommand('APPEND', HandleAPPEND);
  AddImapCommand('STARTTLS', HandleSTARTTLS);
end;

procedure TclImap4Server.SetUserAccounts(const Value: TclUserAccountList);
begin
  FUserAccounts.Assign(Value);
end;

function TclImap4Server.GetCaseInsensitive: Boolean;
begin
  Result := FUserAccounts.CaseInsensitive;
end;

procedure TclImap4Server.SetCaseInsensitive(const Value: Boolean);
begin
  FUserAccounts.CaseInsensitive := Value;
end;

procedure TclImap4Server.DoDestroy;
begin
  FUserAccounts.Free();
  inherited DoDestroy();
end;

procedure TclImap4Server.ProcessData(AConnection: TclCommandConnection; const AData: string);
var
  connection: TclImap4CommandConnection;
begin
  connection := AConnection as TclImap4CommandConnection;
  case connection.ReceivingData of
    rdImapCramMD5: HandleCramMD5(connection, AData);
    rdImapNTLM: HandleNTLM(connection, AData);
    rdImapData: HandleDataLine(connection, AData);
  else
    inherited ProcessData(connection, AData);
  end;
end;

procedure TclImap4Server.SendTaggedResponse(AConnection: TclCommandConnection;
  const ATag, ACommand, AResponse: string);
var
  s: string;
begin
  s := ATag;
  if (s = '') then
  begin
    s := '*';
  end;
  SendResponse(AConnection, ACommand, s + ' ' + AResponse);
  DoSendTaggedResponse(AConnection, ATag, ACommand, AResponse);
end;

procedure TclImap4Server.DoReceiveTaggedCommand(AConnection: TclCommandConnection;
  const ATag, ACommand, AParams: string);
begin
  if Assigned(OnReceiveTaggedCommand) then
  begin
    OnReceiveTaggedCommand(Self, AConnection, ATag, ACommand, AParams);
  end;
end;

procedure TclImap4Server.DoSendTaggedResponse(AConnection: TclCommandConnection;
  const ATag, ACommand, AResponse: string);
begin
  if Assigned(OnSendTaggedResponse) then
  begin
    OnSendTaggedResponse(Self, AConnection, ATag, ACommand, AResponse);
  end;
end;

procedure TclImap4Server.HandleLOGIN(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  ind: Integer;
  psw: string;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csNonAuthenticated]);

  if not (UseAuth in [imImapLogin, imBoth]) then
  begin
    RaiseImapError(ATag, ACommand, 'Unrecognized authentication type');
  end;
  
  AConnection.FUserName := '';
  psw := '';
  ind := system.Pos(#32, AParams);
  if (ind > 0) then
  begin
    AConnection.FUserName := Trim(system.Copy(AParams, 1, ind - 1));
    psw := Trim(system.Copy(AParams, ind + 1, Length(AParams)));
  end;

  if (AConnection.UserName = '') or (psw = '') then
  begin
    RaiseImapError(ATag, ACommand, 'LOGIN parse error');
  end;

  AConnection.FUserName := ExtractQuotedString(AConnection.UserName, '"');
  psw := ExtractQuotedString(psw, '"');

  if LoginAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName), psw) then
  begin
    ChangeState(AConnection, csAuthenticated);
    SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' LOGIN completed');
  end else
  begin
    SendTaggedResponse(AConnection, ATag, ACommand, BadResponse + ' LOGIN failed');
  end;
end;

function TclImap4Server.LoginAuthenticate(AConnection: TclImap4CommandConnection;
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

procedure TclImap4Server.HandleAUTHENTICATE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  s: string;
  encoder: TclEncoder;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csNonAuthenticated]);

  if not (UseAuth in [imSASL, imBoth]) then
  begin
    RaiseImapError(ATag, ACommand, 'Unrecognized authentication type');
  end;
  
  AConnection.FRawTag := ATag;
  
  if (system.Pos('CRAM-MD5', UpperCase(AParams)) = 1) and (ssUseCramMD5 in SASLFlags) then
  begin
    AConnection.FCramMD5Key := GenCramMD5Key();

    encoder := TclEncoder.Create(nil);
    try
      encoder.SuppressCrlf := True;
      encoder.EncodeString(AConnection.CramMD5Key, s, cmMIMEBase64);
    finally
      encoder.Free();
    end;

    AConnection.FReceivingData := rdImapCramMD5;
    SendTaggedResponse(AConnection, '+', ACommand, s);
  end else
  if (system.Pos('NTLM', AParams) = 1) and (ssUseNTLM in SASLFlags) then
  begin
    AConnection.FNTLMAuth.Free();
    AConnection.FNTLMAuth := TclNtAuthServerSspi.Create();

    AConnection.FReceivingData := rdImapNTLM;
    SendTaggedResponse(AConnection, '+', ACommand, '');
  end else
  begin
    RaiseImapError(ATag, ACommand, 'Unrecognized authentication type');
  end;
end;

procedure TclImap4Server.HandleLOGOUT(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  try
    SendTaggedResponse(AConnection, '*', ACommand, 'BYE IMAP engine signing off');
    SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' LOGOUT completed');
    AConnection.Close(False);
  except
    on EclSocketError do ;
  end;
end;

procedure TclImap4Server.RaiseBadStateError(const ATag, ACommand: string);
begin
  RaiseImapError(ATag, ACommand, 'Bad state for ' + ACommand);
end;

procedure TclImap4Server.DoLoginAuthenticate(
  AConnection: TclImap4CommandConnection; Account: TclUserAccountItem;
  const APassword: string; var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnLoginAuthenticate) then
  begin
    OnLoginAuthenticate(Self, AConnection, Account, APassword, IsAuthorized, handled);
  end;
end;

function TclImap4Server.GenCramMD5Key: string;
begin
  Result := GenerateCramMD5Key();
end;

procedure TclImap4Server.HandleCramMD5(AConnection: TclImap4CommandConnection; const AData: string);
begin
  AConnection.RawData := AData;
  AConnection.FReceivingData := rdImapCommand;
  HandleEndCommand(AConnection, AConnection.FRawTag, 'AUTHENTICATE', HandleCramMD5End);
end;

procedure TclImap4Server.CheckAuthAbort(AConnection: TclImap4CommandConnection; const AParams: string);
begin
  if (Trim(AParams) = '*') then
  begin
    ChangeState(AConnection, csNonAuthenticated);
    AConnection.InitParams();
    RaiseImapError(AConnection.FRawTag, 'AUTHENTICATE', 'Authentication aborted');
  end;
end;

function TclImap4Server.CramMD5Authenticate(
  AConnection: TclImap4CommandConnection; Account: TclUserAccountItem;
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

procedure TclImap4Server.DoAuthAuthenticate(
  AConnection: TclImap4CommandConnection; Account: TclUserAccountItem;
  const AKey, AHash: string; var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnAuthAuthenticate) then
  begin
    OnAuthAuthenticate(Self, AConnection, Account, AKey, AHash, IsAuthorized, handled);
  end;
end;

procedure TclImap4Server.ChangeState(AConnection: TclImap4CommandConnection;
  ANewState: TclImapConnectionState);
begin
  if (AConnection.ConnectionState <> ANewState) then
  begin
    AConnection.FConnectionState := ANewState;
    AConnection.CurrentMailBox.Clear();
    DoStateChanged(AConnection);
  end;
end;

procedure TclImap4Server.DoStateChanged(AConnection: TclImap4CommandConnection);
begin
  if Assigned(OnStateChanged) then
  begin
    OnStateChanged(Self, AConnection);
  end;
end;

procedure TclImap4Server.HandleLIST(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  referenceName, criteria: string;
  mailboxes: TclImap4MailBoxList;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  if not GetMailBoxListCriteria(AParams, referenceName, criteria) then
  begin
    RaiseImapError(ATag, ACommand, 'LIST parse error');
  end;

  mailboxes := TclImap4MailBoxList.Create(TclImap4MailBoxItem);
  try
    DoGetMailBoxes(AConnection, referenceName, criteria, mailboxes);
    SendMailBoxListResponse(AConnection, ATag, ACommand, mailboxes, True);
  finally
    mailboxes.Free();
  end;
end;

function TclImap4Server.GetMailBoxListCriteria(const AParams: string;
  var AReferenceName, ACriteria: string): Boolean;
var
  ind: Integer;
begin
  AReferenceName := '';
  ACriteria := Trim(AParams);


  if (Length(ACriteria) > 1) and (ACriteria[1] = '"') then
  begin
    ind := TextPos('"', ACriteria, 2);
  end else
  begin
    ind := system.Pos(#32, ACriteria);
  end;
  if (ind > 0) then
  begin
    AReferenceName := Trim(system.Copy(ACriteria, 1, ind));
    ACriteria := TrimLeft(system.Copy(ACriteria, ind + 1, Length(ACriteria)));
  end;
  Result := (AReferenceName <> '') and (ACriteria <> '');

  AReferenceName := ExtractQuotedString(AReferenceName, '"');
  ACriteria := ExtractQuotedString(ACriteria, '"');
end;

procedure TclImap4Server.CollectMailBoxListResponse(AMailBoxes: TclImap4MailBoxList;
  const ACommand: string; AList: TStrings; AGetAll: Boolean);
var
  i: Integer;
begin
  AList.Clear();
  for i := 0 to AMailBoxes.Count - 1 do
  begin
    if AGetAll or AMailBoxes[i].IsSubscribed then
    begin
      AList.Add(Format('* %s (%s) "%s" "%s"',
        [ACommand, GetMailBoxAttrsStr(AMailBoxes[i].Attributes), MailBoxSeparator,  AMailBoxes[i].Name]));
    end;
  end;
end;

procedure TclImap4Server.SendMailBoxListResponse(AConnection: TclImap4CommandConnection;
  const ATag, ACommand: string; AMailBoxes: TclImap4MailBoxList; AGetAll: Boolean);
var
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  CollectMailBoxListResponse(AMailBoxes, ACommand, list, AGetAll);
  SendMultipleLines(AConnection, Format('%s %s %s completed', [ATag, OkResponse, ACommand]), False);
end;

function TclImap4Server.GetMailBoxAttrsStr(Attrs: TclImap4MailBoxAttributes): string;
const
  attrLexems: array[TclImap4MailBoxAttribute] of string =
    ('\Noinferiors', '\Noselect', '\Marked', '\Unmarked');
var
  attr: TclImap4MailBoxAttribute;
begin
  Result := '';
  for attr := Low(TclImap4MailBoxAttribute) to High(TclImap4MailBoxAttribute) do
  begin
    if (attr in Attrs) then
    begin
      Result := Result + ' ' + attrLexems[attr];
    end;
  end;
  Result := Trim(Result);
end;

procedure TclImap4Server.GetMailBoxes(AConnection: TclImap4CommandConnection;
  const AReferenceName, ACriteria: string; AMailBoxes: TclImap4MailBoxList);
var
  item: TclImap4MailBoxItem;
begin
  if (ACriteria = '') then
  begin
    item := AMailBoxes.Add();
    item.Name := system.Copy(AReferenceName, 1, system.Pos(MailBoxSeparator, AReferenceName) - 1);
    item.Attributes := [maNoselect];
    item.IsSubscribed := True;
  end else
  begin
    DoGetMailBoxes(AConnection, AReferenceName, ACriteria, AMailboxes);
  end;
end;

procedure TclImap4Server.DoGetMailBoxes(AConnection: TclImap4CommandConnection;
  const AReferenceName, ACriteria: string; AMailBoxes: TclImap4MailBoxList);
begin
  if Assigned(OnGetMailBoxes) then
  begin
    OnGetMailBoxes(Self, AConnection, AReferenceName, ACriteria, AMailBoxes);
  end;
end;

procedure TclImap4Server.HandleCREATE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  mailbox: string;
  result: TclImap4MailBoxResult;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  mailbox := Trim(AParams);
  if (mailbox = '') then
  begin
    RaiseImapError(ATag, ACommand, 'CREATE parse error');
  end;

  mailbox := ExtractQuotedString(mailbox, '"');

  result := mrSuccess;
  DoCreateMailBox(AConnection, mailbox, result);

  case result of
    mrSuccess: SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' CREATE completed');
    mrAlreadyExists: RaiseImapNoResponse(ATag, ACommand, 'Mailbox already exists');
    mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, 'CREATE parse error');
  end;
end;

procedure TclImap4Server.DoCreateMailBox(AConnection: TclImap4CommandConnection;
  const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnCreateMailBox) then
  begin
    OnCreateMailBox(Self, AConnection, AMailBox, Result);
  end;
end;

procedure TclImap4Server.HandleDELETE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  mailbox: string;
  result: TclImap4MailBoxResult;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  mailbox := Trim(AParams);
  if (mailbox = '') then
  begin
    RaiseImapError(ATag, ACommand, 'DELETE parse error');
  end;

  mailbox := ExtractQuotedString(mailbox, '"');

  result := mrSuccess;
  DoDeleteMailBox(AConnection, mailbox, result);

  case result of
    mrSuccess: SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' DELETE completed');
    mrNotFound,
    mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, 'DELETE parse error');
  end;
end;

procedure TclImap4Server.DoDeleteMailBox(AConnection: TclImap4CommandConnection;
  const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnDeleteMailBox) then
  begin
    OnDeleteMailBox(Self, AConnection, AMailBox, Result);
  end;
end;

procedure TclImap4Server.HandleRENAME(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  ind: Integer;
  currentName, newName: string;
  result: TclImap4MailBoxResult;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  currentName := '';
  newName := Trim(AParams);

  if (Length(newName) > 1) and (newName[1] = '"') then
  begin
    ind := TextPos('"', newName, 2);
  end else
  begin
    ind := system.Pos(#32, newName);
  end;
  if (ind > 0) then
  begin
    currentName := Trim(system.Copy(newName, 1, ind));
    newName := TrimLeft(system.Copy(newName, ind + 1, Length(newName)));
  end;

  if (currentName = '') or (newName = '') then
  begin
    RaiseImapError(ATag, ACommand, 'RENAME parse error');
  end;
  
  currentName := ExtractQuotedString(currentName, '"');
  newName := ExtractQuotedString(newName, '"');

  result := mrSuccess;
  DoRenameMailBox(AConnection, currentName, newName, result);

  case result of
    mrSuccess: SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' RENAME completed');
    mrAlreadyExists: RaiseImapNoResponse(ATag, ACommand, 'Mailbox already exists');
    mrNotFound: RaiseImapNoResponse(ATag, ACommand, 'Mailbox does not exist');
    mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, 'RENAME parse error');
  end;
end;

procedure TclImap4Server.DoRenameMailBox(AConnection: TclImap4CommandConnection;
  const ACurrentName, ANewName: string; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnRenameMailBox) then
  begin
    OnRenameMailBox(Self, AConnection, ACurrentName, ANewName, Result);
  end;
end;

procedure TclImap4Server.HandleLSUB(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  referenceName, criteria: string;
  mailboxes: TclImap4MailBoxList;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  if not GetMailBoxListCriteria(AParams, referenceName, criteria) then
  begin
    RaiseImapError(ATag, ACommand, 'LSUB parse error');
  end;

  mailboxes := TclImap4MailBoxList.Create(TclImap4MailBoxItem);
  try
    GetMailBoxes(AConnection, referenceName, criteria, mailboxes);
    SendMailBoxListResponse(AConnection, ATag, ACommand, mailboxes, False);
  finally
    mailboxes.Free();
  end;
end;

procedure TclImap4Server.HandleSUBSCRIBE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  mailbox: string;
  result: TclImap4MailBoxResult;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  mailbox := Trim(AParams);
  if (mailbox = '') then
  begin
    RaiseImapError(ATag, ACommand, 'SUBSCRIBE parse error');
  end;

  mailbox := ExtractQuotedString(mailbox, '"');

  result := mrSuccess;
  DoSubscribeMailBox(AConnection, mailbox, result);

  case result of
    mrSuccess,
    mrAlreadyExists: SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' SUBSCRIBE completed');
    mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, 'SUBSCRIBE parse error');
  end;
end;

procedure TclImap4Server.DoSubscribeMailBox(AConnection: TclImap4CommandConnection;
  const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnSubscribeMailBox) then
  begin
    OnSubscribeMailBox(Self, AConnection, AMailBox, Result);
  end;
end;

procedure TclImap4Server.HandleUNSUBSCRIBE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  mailbox: string;
  result: TclImap4MailBoxResult;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  mailbox := Trim(AParams);
  if (mailbox = '') then
  begin
    RaiseImapError(ATag, ACommand, 'UNSUBSCRIBE parse error');
  end;

  mailbox := ExtractQuotedString(mailbox, '"');
  
  result := mrSuccess;
  DoUnsubscribeMailBox(AConnection, mailbox, result);

  case result of
    mrSuccess: SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' UNSUBSCRIBE completed');
    mrNotFound: RaiseImapNoResponse(ATag, ACommand, 'Mailbox not subscribed');
    mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, 'UNSUBSCRIBE parse error');
  end;
end;

procedure TclImap4Server.DoUnsubscribeMailBox(AConnection: TclImap4CommandConnection;
  const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnUnsubscribeMailBox) then
  begin
    OnUnsubscribeMailBox(Self, AConnection, AMailBox, Result);
  end;
end;

procedure TclImap4Server.HandleSELECT(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  InternalHandleSelect(AConnection, ATag, ACommand, ExtractQuotedString(Trim(AParams), '"'), False);
end;

procedure TclImap4Server.HandleEXAMINE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  InternalHandleSelect(AConnection, ATag, ACommand, ExtractQuotedString(Trim(AParams), '"'), True);
end;

procedure TclImap4Server.InternalHandleSelect(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AMailBox: string; AReadOnly: Boolean);
var
  result: TclImap4MailBoxResult;
  mailboxInfo: TclImap4MailBoxInfo;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  AConnection.FReadOnlyAccess := AReadOnly;

  mailboxInfo := TclImap4MailBoxInfo.Create();
  try
    result := mrSuccess;
    DoGetMailBoxInfo(AConnection, AMailBox, True, mailboxInfo, result);

    try
      case result of
        mrSuccess:
          begin
            SendMailBoxInfo(AConnection, ATag, ACommand, mailboxInfo, AReadOnly);
            ChangeState(AConnection, csSelected);
            AConnection.CurrentMailBox.Assign(mailboxInfo);
            if (AConnection.CurrentMailBox.Name = '') then
            begin
              AConnection.CurrentMailBox.Name := AMailBox;
            end;
          end;
        mrNotFound: RaiseImapNoResponse(ATag, ACommand, 'Mailbox does not exist');
        mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
      else
        RaiseImapError(ATag, ACommand, ACommand + ' parse error');
      end;
    except
      ChangeState(AConnection, csAuthenticated);
      raise;
    end;

  finally
    mailboxInfo.Free();
  end;
end;

procedure TclImap4Server.DoGetMailBoxInfo(AConnection: TclImap4CommandConnection;
  const AMailBox: string; IsSelectMailBox: Boolean; AMailBoxInfo: TclImap4MailBoxInfo;
  var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnGetMailBoxInfo) then
  begin
    OnGetMailBoxInfo(Self, AConnection, AMailBox, IsSelectMailBox, AMailBoxInfo, Result);
  end;
end;

procedure TclImap4Server.SendMailBoxInfo(AConnection: TclImap4CommandConnection;
  const ATag, ACommand: string; AMailBoxInfo: TclImap4MailBoxInfo; AReadOnly: Boolean);
const
  cPermissions: array[Boolean] of string = ('READ-WRITE', 'READ-ONLY');
var
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  list.Add(Format('* FLAGS (%s)', [GetStrByImapMessageFlags(AMailBoxInfo.Flags)]));
  list.Add(Format('* %d EXISTS', [AMailBoxInfo.ExistsMessages]));
  list.Add(Format('* %d RECENT', [AMailBoxInfo.RecentMessages]));
  if AMailBoxInfo.FirstUnseen > 0 then
  begin
    list.Add(Format('* OK [UNSEEN %d] first unseen', [AMailBoxInfo.FirstUnseen]));
  end;
  list.Add(Format('* OK [UIDVALIDITY %s] UIDs valid', [AMailBoxInfo.UIDValidity]));
  list.Add(Format('* OK [PERMANENTFLAGS (%s)] .',
    [GetStrByImapMessageFlags(AMailBoxInfo.ChangeableFlags)]));

  SendMultipleLines(AConnection, Format('%s %s [%s] %s completed',
    [ATag, OkResponse, cPermissions[AReadOnly], ACommand]), False);
end;

procedure TclImap4Server.HandleSTATUS(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  ind: Integer;
  mailBox: string;
  statusItems: string;
  statusNames: TStrings;
  result: TclImap4MailBoxResult;
  info: TclImap4MailBoxInfo;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  mailBox := '';
  statusItems := Trim(AParams);

  ind := system.Pos('(', statusItems);
  if (ind > 0) then
  begin
    mailBox :=  Trim(system.Copy(statusItems, 1, ind - 1));
    statusItems := Trim(system.Copy(statusItems, ind, Length(statusItems)));
  end;

  mailBox := ExtractQuotedString(mailBox, '"');

  if (mailBox = '') or (statusItems = '') then
  begin
    RaiseImapError(ATag, ACommand, 'STATUS parse error');
  end;

  statusItems := Trim(System.Copy(statusItems, 1, TextPos(')', statusItems)));
  statusItems := ExtractQuotedString(statusItems, '(', ')');

  statusNames := TStringList.Create();
  info := TclImap4MailBoxInfo.Create();
  try
    statusNames.Text := StringReplace(statusItems, #32, #13#10, [rfReplaceAll]);
    result := mrSuccess;
    DoGetMailBoxInfo(AConnection, mailBox, False, info, result);

    case result of
      mrSuccess: SendStatusResponse(AConnection, ATag, mailBox, statusNames, info);
      mrNotFound: RaiseImapNoResponse(ATag, ACommand, 'Mailbox does not exist');
      mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
    else
      RaiseImapError(ATag, ACommand, 'STATUS parse error');
    end;
  finally
    info.Free();
    statusNames.Free();
  end;
end;

procedure TclImap4Server.SendStatusResponse(AConnection: TclImap4CommandConnection;
  const ATag, AMailBox: string; AStatusNames: TStrings; AMailBoxInfo: TclImap4MailBoxInfo);
var
  i: Integer;
  response: string;
begin
  response := '';
  for i := 0 to AStatusNames.Count - 1 do
  begin
    if SameText('MESSAGES', AStatusNames[i]) then
    begin
      response := response + Format('MESSAGES %d ', [AMailBoxInfo.ExistsMessages]);
    end else
    if SameText('RECENT', AStatusNames[i]) then
    begin
      response := response + Format('RECENT %d ', [AMailBoxInfo.RecentMessages]);
    end else
    if SameText('UIDNEXT', AStatusNames[i]) then
    begin
      response := response + Format('UIDNEXT %s ', [AMailBoxInfo.UIDNext]);
    end else
    if SameText('UIDVALIDITY', AStatusNames[i]) then
    begin
      response := response + Format('UIDVALIDITY %s ', [AMailBoxInfo.UIDValidity]);
    end else
    if SameText('UNSEEN', AStatusNames[i]) then
    begin
      response := response + Format('UNSEEN %d ', [AMailBoxInfo.UnseenMessages]);
    end;
  end;
  if (response <> '') then
  begin
    SetLength(response, Length(response) - 1);
  end;

  SendTaggedResponse(AConnection, '*', 'STATUS', Format('STATUS "%s" (%s)', [AMailBox, response]));
  SendTaggedResponse(AConnection, ATag, 'STATUS', OkResponse + ' STATUS completed');
end;

procedure TclImap4Server.HandleNOOP(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' NOOP completed');
end;

procedure TclImap4Server.HandleCAPABILITY(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  i: Integer;
  s, cap: string;
begin
  s := 'CAPABILITY';
  for i := 0 to Capabilities.Count - 1 do
  begin
    cap := Capabilities[i];
    if (system.Pos('AUTH', UpperCase(cap)) = 0) and (system.Pos('STARTTLS', UpperCase(cap)) = 0) then
    begin
      s := s + #32 + cap;
    end;
  end;

  if (ssUseNTLM in SASLFlags) then
  begin
    s := s + ' AUTH=NTLM';
  end;
  if (ssUseCramMD5 in SASLFlags) then
  begin
    s := s + ' AUTH=CRAM-MD5';
  end;
  
  if (UseTLS <> stNone) and not AConnection.IsTls then
  begin
    s := s + ' STARTTLS';
  end;

  SendTaggedResponse(AConnection, '*', ACommand, s);
  SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' CAPABILITY completed');
end;

destructor TclImap4Server.Destroy;
begin
  FCapabilities.Free();
  inherited Destroy();
end;

procedure TclImap4Server.HandleCHECK(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' CHECK completed');
end;

procedure TclImap4Server.HandleSEARCH(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  InternalHandleSearch(AConnection, ATag, AParams, False);
end;

procedure TclImap4Server.HandleUID(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  ind: Integer;
  command, params: string;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  command := '';
  params := '';
  ind := system.Pos(#32, AParams);
  if (ind > 0) then
  begin
    command := UpperCase(system.Copy(AParams, 1, ind - 1));
    params := TrimLeft(system.Copy(AParams, ind + 1, Length(AParams)));
  end;

  if (command = 'SEARCH') then
  begin
    InternalHandleSearch(AConnection, ATag, params, True);
  end else
  if (command = 'COPY') then
  begin
    InternalHandleCopy(AConnection, ATag, params, True);
  end else
  if (command = 'FETCH') then
  begin
    InternalHandleFetch(AConnection, ATag, params, True);
  end else
  if (command = 'STORE') then
  begin
    InternalHandleStore(AConnection, ATag, params, True);
  end else
  begin
    RaiseImapError(ATag, ACommand, 'UID parse error');
  end;
end;

procedure TclImap4Server.InternalHandleCopy(AConnection: TclImap4CommandConnection;
  const ATag, AParams: string; AUseUID: Boolean);
var
  ind: Integer;
  messageSet, mailBox: string;
  result: TclImap4MailBoxResult;
begin
  if not (AConnection.ConnectionState in [csAuthenticated, csSelected]) then
  begin
    RaiseBadStateError(ATag, 'COPY');
  end;

  messageSet := '';
  mailBox := Trim(AParams);

  ind := system.Pos(#32, mailBox);
  if (ind > 0) then
  begin
    messageSet := system.Copy(mailBox, 1, ind - 1);
    mailBox := TrimLeft(system.Copy(mailBox, ind + 1, Length(mailBox)));
  end;

  if (messageSet = '') or (mailBox = '') then
  begin
    RaiseImapError(ATag, 'COPY', 'COPY parse error');
  end;
  
  messageSet := ExtractQuotedString(messageSet, '"');
  mailBox := ExtractQuotedString(mailBox, '"');

  result := mrSuccess;
  DoCopyMessages(AConnection, messageSet, mailBox, AUseUID, result);

  case result of
    mrSuccess: SendTaggedResponse(AConnection, ATag, 'COPY', OkResponse + ' COPY completed');
    mrNotFound: RaiseImapNoResponse(ATag, 'COPY', '[TRYCREATE] Mailbox does not exist');
    mrAccessDenied: RaiseImapNoResponse(ATag, 'COPY', 'Access denied');
  else
    RaiseImapError(ATag, 'COPY', 'COPY parse error');
  end;
end;

procedure TclImap4Server.DoCopyMessages(AConnection: TclImap4CommandConnection;
  const AMessageSet, AMailBox: string; AUseUID: Boolean; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnCopyMessages) then
  begin
    OnCopyMessages(Self, AConnection, AMessageSet, AMailBox, AUseUID, Result);
  end;
end;

procedure TclImap4Server.InternalHandleSearch(AConnection: TclImap4CommandConnection;
  const ATag, ASearchCriteria: string; AUseUID: Boolean);
var
  list: TStrings;
  result: TclImap4MessageResult;
begin
  list := TStringList.Create();
  try
    result := msOk;
    DoSearchMessages(AConnection, ASearchCriteria, AUseUID, list, result);

    case result of
      msOk: SendSearchResponse(AConnection, ATag, list);
      msNo: RaiseImapNoResponse(ATag, 'SEARCH', 'SEARCH error');
    else
      RaiseImapError(ATag, 'SEARCH', 'SEARCH parse error');
    end;
  finally
    list.Free();
  end;
end;

procedure TclImap4Server.SendSearchResponse(AConnection: TclImap4CommandConnection;
  const ATag: string; AList: TStrings);
var
  i: Integer;
  response: string;
begin
  response := '';
  for i := 0 to AList.Count - 1 do
  begin
    response := response + AList[i] + #32;
  end;

  if (response <> '') then
  begin
    SetLength(response, Length(response) - 1);
  end;

  SendTaggedResponse(AConnection, '*', 'SEARCH', 'SEARCH ' + response);
  SendTaggedResponse(AConnection, ATag, 'SEARCH', OkResponse + ' SEARCH completed');
end;

procedure TclImap4Server.DoSearchMessages(AConnection: TclImap4CommandConnection;
  const ASearchCriteria: string; AUseUID: Boolean; AMessageIDs: TStrings; var Result: TclImap4MessageResult);
begin
  if Assigned(OnSearchMessages) then
  begin
    OnSearchMessages(Self, AConnection, ASearchCriteria, AUseUID, AMessageIDs, Result);
  end;
end;

procedure TclImap4Server.HandleCOPY(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  InternalHandleCopy(AConnection, ATag, AParams, False);
end;

procedure TclImap4Server.HandleFETCH(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  InternalHandleFetch(AConnection, ATag, AParams, False);
end;

procedure TclImap4Server.InternalHandleFetch(AConnection: TclImap4CommandConnection;
  const ATag, AParams: string; AUseUID: Boolean);
var
  ind: Integer;
  messageSet, dataItems: string;
  rawResponse: TStrings;
  result: TclImap4MessageResult;
  fetchList: TclImap4FetchResponseList;
begin
  if not (AConnection.ConnectionState in [csAuthenticated, csSelected]) then
  begin
    RaiseBadStateError(ATag, 'FETCH');
  end;

  messageSet := '';
  dataItems := Trim(AParams);

  ind := system.Pos(#32, dataItems);
  if (ind > 0) then
  begin
    messageSet := system.Copy(dataItems, 1, ind - 1);
    dataItems := TrimLeft(system.Copy(dataItems, ind + 1, Length(dataItems)));
  end;

  if (messageSet = '') or (dataItems = '') then
  begin
    RaiseImapError(ATag, 'FETCH', 'FETCH parse error');
  end;
  
  messageSet := ExtractQuotedString(messageSet, '"');
  dataItems := ExtractQuotedString(dataItems, '(', ')');

  result := msOk;
  rawResponse := TStringList.Create();
  AddMultipleLines(AConnection, rawResponse);

  fetchList := TclImap4FetchResponseList.Create(TclImap4FetchResponseItem);
  try
    DoFetchMessages(AConnection, messageSet, dataItems, AUseUID, fetchList, result);
    case result of
      msOk:
        begin
          fetchList.BuildResponse(rawResponse);
          SendMultipleLines(AConnection, Format('%s %s FETCH completed', [ATag, OkResponse]), False);
        end;
      msNo: RaiseImapNoResponse(ATag, 'FETCH', 'FETCH error');
    else
      RaiseImapError(ATag, 'FETCH', 'FETCH parse error');
    end;
  finally
    fetchList.Free();
  end;
end;

procedure TclImap4Server.DoFetchMessages(AConnection: TclImap4CommandConnection;
  const AMessageSet, ADataItems: string; AUseUID: Boolean; AResponse: TclImap4FetchResponseList;
  var Result: TclImap4MessageResult);
begin
  if Assigned(OnFetchMessages) then
  begin
    OnFetchMessages(Self, AConnection, AMessageSet, ADataItems, AUseUID, AResponse, Result);
  end;
end;

procedure TclImap4Server.HandleSTORE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  InternalHandleStore(AConnection, ATag, AParams, False);
end;

procedure TclImap4Server.InternalHandleStore(AConnection: TclImap4CommandConnection;
  const ATag, AParams: string; AUseUID: Boolean);
var
  ind: Integer;
  messageSet, dataItems: string;
  flagsMethod: TclSetFlagsMethod;
  flags: TclMailMessageFlags;
  isSilent: Boolean;
  result: TclImap4MessageResult;
  rawResponse: TStrings;
  fetchList: TclImap4FetchResponseList;
begin
  if not (AConnection.ConnectionState in [csAuthenticated, csSelected]) then
  begin
    RaiseBadStateError(ATag, 'STORE');
  end;

  if AConnection.ReadOnlyAccess then
  begin
    RaiseImapNoResponse(ATag, 'STORE', 'Mailbox is read-only');
  end;
  
  messageSet := '';
  dataItems := Trim(AParams);

  ind := system.Pos(#32, dataItems);
  if (ind > 0) then
  begin
    messageSet := system.Copy(dataItems, 1, ind - 1);
    dataItems := TrimLeft(system.Copy(dataItems, ind + 1, Length(dataItems)));
  end;

  if (messageSet = '') or (dataItems = '') then
  begin
    RaiseImapError(ATag, 'STORE', 'STORE parse error');
  end;

  messageSet := ExtractQuotedString(messageSet, '"');
  dataItems := Trim(ExtractQuotedString(dataItems, '(', ')'));

  ExtractFlagsParameters(ATag, dataItems, flagsMethod, flags, isSilent);

  result := msOk;
  rawResponse := TStringList.Create();
  AddMultipleLines(AConnection, rawResponse);


  fetchList := TclImap4FetchResponseList.Create(TclImap4FetchResponseItem);
  try
    DoStoreMessages(AConnection, messageSet, flagsMethod, flags, isSilent, AUseUID, fetchList, result);
    case result of
      msOk:
        begin
          fetchList.BuildResponse(rawResponse);
          SendMultipleLines(AConnection, Format('%s %s STORE completed', [ATag, OkResponse]), False);
        end;
      msNo: RaiseImapNoResponse(ATag, 'STORE', 'Access denied');
    else
      RaiseImapError(ATag, 'STORE', 'STORE parse error');
    end;
  finally
    fetchList.Free();
  end;
end;

procedure TclImap4Server.ExtractFlagsParameters(const ATag, ASource: string;
  var AFlagsMethod: TclSetFlagsMethod; var AFlags: TclMailMessageFlags; var IsSilent: Boolean);
var
  params: string;
begin
  if (ASource = '') then
  begin
    RaiseImapError(ATag, 'STORE', 'STORE parse error');
  end;
  params := UpperCase(ASource);

  AFlags := GetImapMessageFlagsByStr(params);

  if params[1] = '+' then
  begin
    AFlagsMethod := fmAdd;
  end else
  if params[1] = '-' then
  begin
    AFlagsMethod := fmRemove;
  end else
  begin
    AFlagsMethod := fmReplace;
  end;

  IsSilent := (system.Pos('.SILENT', params) > 0);
end;

procedure TclImap4Server.DoStoreMessages(AConnection: TclImap4CommandConnection;
  const AMessageSet: string; AFlagsMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags;
  IsSilent: Boolean; AUseUID: Boolean; AResponse: TclImap4FetchResponseList; var Result: TclImap4MessageResult);
begin
  if Assigned(OnStoreMessages) then
  begin
    OnStoreMessages(Self, AConnection, AMessageSet, AFlagsMethod, AFlags, IsSilent,
      AUseUID, AResponse, Result);
  end;
end;

procedure TclImap4Server.HandleCLOSE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  InternalExpunge(AConnection, ATag, ACommand, True);
  ChangeState(AConnection, csAuthenticated);
end;

procedure TclImap4Server.HandleEXPUNGE(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csSelected]);

  InternalExpunge(AConnection, ATag, ACommand, False);
end;

procedure TclImap4Server.InternalExpunge(AConnection: TclImap4CommandConnection;
  const ATag, ACommand: string; IsSilent: Boolean);
var
  i: Integer;
  rawResponse: TStrings;
  result: TclImap4MessageResult;
begin
  if AConnection.ReadOnlyAccess then
  begin
    RaiseImapNoResponse(ATag, ACommand, 'Mailbox is read-only');
  end;

  rawResponse := TStringList.Create();
  AddMultipleLines(AConnection, rawResponse);

  result := msOk;
  DoExpungeMessages(AConnection, IsSilent, rawResponse, result);

  if IsSilent then
  begin
    rawResponse.Clear();
  end;

  for i := 0 to rawResponse.Count - 1 do
  begin
    rawResponse[i] :=  Format('* %s EXPUNGE', [rawResponse[i]]);
  end;

  case result of
    msOk: SendMultipleLines(AConnection, Format('%s %s %s completed', [ATag, OkResponse, ACommand]), False);
    msNo: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, ACommand + ' parse error');
  end;
end;

procedure TclImap4Server.DoExpungeMessages(AConnection: TclImap4CommandConnection;
  IsSilent: Boolean; AMessageIDs: TStrings; var Result: TclImap4MessageResult);
begin
  if Assigned(OnPurgeMessages) then
  begin
    OnPurgeMessages(Self, AConnection, IsSilent, AMessageIDs, Result);
  end;
end;

procedure TclImap4Server.HandleAPPEND(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  ind: Integer;
  params: string;
  result: TclImap4MailBoxResult;
begin
  CheckTlsMode(AConnection, ATag, ACommand);
  CheckConnectionState(ATag, ACommand, AConnection.ConnectionState, [csAuthenticated, csSelected]);

  AConnection.FAppendMailBox := '';
  params := Trim(AParams);

  if (Length(params) > 1) and (params[1] = '"') then
  begin
    ind := TextPos('"', params, 2);
  end else
  begin
    ind := system.Pos(#32, params);
  end;
  if (ind > 0) then
  begin
    AConnection.FAppendMailBox := Trim(system.Copy(params, 1, ind));
    params := Trim(system.Copy(params, ind + 1, Length(params)));
  end;

  AConnection.FAppendDataSize := ExtractMessageSize(params);

  if (AConnection.FAppendMailBox = '') or (AConnection.FAppendDataSize = 0) then
  begin
    RaiseImapError(ATag, ACommand, 'APPEND parse error');
  end;

  AConnection.FAppendMailBox := ExtractQuotedString(AConnection.FAppendMailBox, '"');
  params := Trim(system.Copy(params, 1, RTextPos('{', params) - 1));
  AConnection.FAppendFlags := GetImapMessageFlagsByStr(UpperCase(params));

  result := mrSuccess;
  DoCanAppendMessage(AConnection, AConnection.FAppendMailBox, result);

  case result of
    mrSuccess:
      begin
        AConnection.FReceivingData := rdImapData;
        AConnection.RawData := '';
        AConnection.FRawTag := ATag;
        SendTaggedResponse(AConnection, '+', ACommand, 'Ready for append literal');
      end;
    mrNotFound: RaiseImapNoResponse(ATag, ACommand, 'Mailbox does not exist');
    mrAccessDenied: RaiseImapNoResponse(ATag, ACommand, 'Access denied');
  else
    RaiseImapError(ATag, ACommand, 'APPEND parse error');
  end;
end;

procedure TclImap4Server.HandleDataLine(AConnection: TclImap4CommandConnection; const AData: string);
begin
  AConnection.RawData := AConnection.RawData + AData;

  if (Length(AConnection.RawData) >= AConnection.FAppendDataSize) then
  begin
    SetLength(AConnection.FRawData, AConnection.FAppendDataSize);
    AConnection.FReceivingData := rdImapCommand;
    HandleEndCommand(AConnection, AConnection.FRawTag, 'APPEND', HandleDataLineEnd);
  end;
end;

procedure TclImap4Server.DoCanAppendMessage(AConnection: TclImap4CommandConnection;
  const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnCanAppendMessage) then
  begin
    OnCanAppendMessage(Self, AConnection, AMailBox, Result);
  end;
end;

procedure TclImap4Server.DoMessageAppended(AConnection: TclImap4CommandConnection;
  const AMailBox: string; AFlags: TclMailMessageFlags; AMessage: TStrings;
  var Result: TclImap4MailBoxResult);
begin
  if Assigned(OnMessageAppended) then
  begin
    OnMessageAppended(Self, AConnection, AMailBox, AFlags, AMessage, Result);
  end;
end;

procedure TclImap4Server.HandleNullCommand(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  RaiseImapError(ATag, ACommand, 'Invalid command: ' + ACommand);
end;

function TclImap4Server.GetNullCommand(const ACommand: string): TclTcpCommandInfo;
var
  info: TclImap4CommandInfo;
begin
  info := TclImap4CommandInfo.Create();
  info.Name := ACommand;
  info.FHandler := HandleNullCommand;
  Result := info;
end;

function TclImap4Server.GetCommandParams(const AData: string): TclTcpCommandParams;
var
  ind: Integer;
  params: TclImap4CommandParams;
begin
  params := TclImap4CommandParams.Create();
  Result := params;

  params.Params := AData;
  
  ind := system.Pos(#32, params.Params);
  if (ind > 0) then
  begin
    params.Tag := system.Copy(params.Params, 1, ind - 1);
    params.Params := TrimLeft(system.Copy(params.Params, ind + 1, Length(params.Params)));
  end;
  ind := system.Pos(#32, params.Params);
  if (ind > 0) then
  begin
    params.Command := UpperCase(system.Copy(params.Params, 1, ind - 1));
    params.Params := TrimLeft(system.Copy(params.Params, ind + 1, Length(params.Params)));
  end else
  begin
    params.Command := UpperCase(Trim(params.Params));
    params.Params := '';
  end;
end;

procedure TclImap4Server.DoProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
var
  params: TclImap4CommandParams;
begin
  AConnection.BeginWork();
  try
    Assert(AParams <> nil);

    params := (AParams as TclImap4CommandParams);

    if (params.Tag = '') then
    begin
      RaiseImapError('*', params.Command, 'missing tag');
    end;

    DoReceiveTaggedCommand(AConnection, params.Tag, params.Command, params.Params);
    inherited DoProcessCommand(AConnection, AInfo, AParams);
  finally
    AConnection.EndWork();
  end;
end;

procedure TclImap4Server.HandleEndCommand(AConnection: TclImap4CommandConnection;
  const ATag, ACommand: string; AHandler: TclImap4CommandHandler);
var
  info: TclImap4CommandInfo;
  params: TclImap4CommandParams;
begin
  info := nil;
  params := nil;
  try
    info := TclImap4CommandInfo.Create();
    info.Name := ACommand;
    info.FHandler := AHandler;

    params := TclImap4CommandParams.Create();
    params.Tag := ATag;
    ProcessCommand(AConnection, info, params);
  finally
    params.Free();
    info.Free();
  end;
end;

procedure TclImap4Server.HandleCramMD5End(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
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
      on EclEncoderError do
      begin
        CheckAuthAbort(AConnection, '*');
      end;
    end;
    if (WordCount(hash, [' ']) <> 2) then
    begin
      CheckAuthAbort(AConnection, '*');
    end;
    AConnection.FUserName := ExtractWord(1, hash, [' ']);
    hash := ExtractWord(2, hash, [' ']);
    if CramMD5Authenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName),
      AConnection.CramMD5Key, hash) then
    begin
      ChangeState(AConnection, csAuthenticated);
      SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' AUTHENTICATE completed');
    end else
    begin
      SendTaggedResponse(AConnection, ATag, ACommand, BadResponse + ' AUTHENTICATE failed');
    end;
  finally
    encoder.Free();
  end;
end;

procedure TclImap4Server.HandleNTLM(AConnection: TclImap4CommandConnection; const AData: string);
begin
  AConnection.RawData := AData;
  HandleEndCommand(AConnection, AConnection.FRawTag, 'AUTHENTICATE', HandleNTLMEnd);
end;

procedure TclImap4Server.HandleNTLMEnd(
  AConnection: TclImap4CommandConnection; const ATag, ACommand, AParams: string);
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

      encoder.DecodeFromString(Trim(AConnection.RawData), buf, cmMIMEBase64);
      buf.Position := 0;

      if AConnection.FNTLMAuth.GenChallenge('NTLM', buf, nil) then
      begin
        AConnection.FNTLMAuth.ImpersonateUser();
        try
          AConnection.FUserName := GetCurrentThreadUser();

          if not NtlmAuthenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName)) then
          begin
            ChangeState(AConnection, csNonAuthenticated);
            AConnection.InitParams();
            RaiseImapError(ATag, 'AUTHENTICATE', 'AUTHENTICATE failed');
          end;
        finally
          AConnection.FNTLMAuth.RevertUser();
        end;

        AConnection.FReceivingData := rdImapCommand;
        ChangeState(AConnection, csAuthenticated);
        SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' AUTHENTICATE completed');
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
    on EclEncoderError do
      begin
        CheckAuthAbort(AConnection, '*');
      end;
    on EclSSPIError do
      begin
        ChangeState(AConnection, csNonAuthenticated);
        AConnection.InitParams();
        RaiseImapError(ATag, 'AUTHENTICATE', 'AUTHENTICATE failed');
      end;
  end;
end;

procedure TclImap4Server.HandleDataLineEnd(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
var
  msg: TStrings;
  result: TclImap4MailBoxResult;
begin
  msg := TStringList.Create();
  try
    msg.Text := AConnection.RawData;

    result := mrSuccess;
    DoMessageAppended(AConnection, AConnection.FAppendMailBox, AConnection.FAppendFlags, msg, result);

    case result of
      mrSuccess: SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' APPEND completed');
      mrNotFound: RaiseImapNoResponse(ATag, ACommand, 'Mailbox does not exist');
    else
      RaiseImapNoResponse(ATag, ACommand, 'Access denied');
    end;
  finally
    msg.Free();
  end;
end;

procedure TclImap4Server.ProcessUnhandledError(AConnection: TclCommandConnection;
  AParams: TclTcpCommandParams; E: Exception);
begin
  SendTaggedResponse(AConnection, (AParams as TclImap4CommandParams).Tag,
    AParams.Command, BadResponse + ' ' + Trim(E.Message));
end;

procedure TclImap4Server.HandleSTARTTLS(AConnection: TclImap4CommandConnection;
  const ATag, ACommand, AParams: string);
begin
  if (UseTLS = stNone) or (UseTLS = stImplicit) or AConnection.IsTls then
  begin
    RaiseImapNoResponse(ATag, ACommand, 'you have already logged in');
  end;

  SendTaggedResponse(AConnection, ATag, ACommand, OkResponse + ' begin TLS negotiation');
  AConnection.InitParams();
  StartTls(AConnection);
end;

procedure TclImap4Server.CheckTlsMode(AConnection: TclImap4CommandConnection; const ATag, ACommand: string);
begin
  if (UseTLS = stExplicitRequire) and (not AConnection.IsTls) then
  begin
    RaiseImapError(ATag, ACommand, 'Must issue a STARTTLS command first');
  end;
end;

procedure TclImap4Server.CheckConnectionState(const ATag, ACommand: string; AState: TclImapConnectionState;
  ARequired: array of TclImapConnectionState);
var
  i: Integer;
begin
  for i := Low(ARequired) to High(ARequired) do
  begin
    if AState = ARequired[i] then Exit;
  end;
  RaiseBadStateError(ATag, ACommand);
end;

procedure TclImap4Server.SetCapabilities(const Value: TStrings);
begin
  FCapabilities.Assign(Value);
end;

function TclImap4Server.NtlmAuthenticate(
  AConnection: TclImap4CommandConnection; Account: TclUserAccountItem): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := True;
  DoAuthAuthenticate(AConnection, Account, '', '', Result, handled);
end;

{ EclImap4CommandError }

constructor EclImap4CommandError.Create(const ATag, ACommand, AErrorMsg: string; AErrorCode: Integer);
begin
  inherited Create(ACommand, AErrorMsg, AErrorCode);
  FTag := ATag;
end;

{ TclImap4MailBoxList }

function TclImap4MailBoxList.Add: TclImap4MailBoxItem;
begin
  Result := TclImap4MailBoxItem(inherited Add());
end;

function TclImap4MailBoxList.GetItem(Index: Integer): TclImap4MailBoxItem;
begin
  Result := TclImap4MailBoxItem(inherited GetItem(Index));
end;

procedure TclImap4MailBoxList.SetItem(Index: Integer; const Value: TclImap4MailBoxItem);
begin
  inherited SetItem(Index, Value);
end;

{ TclImap4CommandInfo }

procedure TclImap4CommandInfo.Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams);
begin
  FHandler(AConnection as TclImap4CommandConnection,
    (AParams as TclImap4CommandParams).Tag, Name, AParams.Params);
end;

{ TclImap4CommandConnection }

constructor TclImap4CommandConnection.Create;
begin
  inherited Create();
  FCurrentMailBox := TclImap4MailBoxInfo.Create();
  InitParams();
end;

procedure TclImap4CommandConnection.DoDestroy;
begin
  FNTLMAuth.Free();
  FCurrentMailBox.Free();
  inherited DoDestroy();
end;

procedure TclImap4CommandConnection.InitParams;
begin
  FConnectionState := csNonAuthenticated;
  FReceivingData := rdImapCommand;
  FCramMD5Key := '';
  FUserName := '';
  FReadOnlyAccess := False;
  FCurrentMailBox.Clear();
  FRawData := '';
  FAppendDataSize := 0;
  FAppendFlags := [];
  FAppendMailBox := '';
  FNTLMAuth.Free();
  FNTLMAuth := nil;
end;

end.

