{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clImap4;

interface

{$I clVer.inc}

uses
  Classes, clMC, clMailMessage, clTcpClient, clImapUtils;

type
  TclCustomImap4 = class(TclCustomMail)
  private
    FCommandTag: Integer;
    FMailBoxSeparator: Char;
    FCurrentMailBox: TclImap4MailBoxInfo;
    FCurrentMessage: Integer;
    FConnectionState: TclImapConnectionState;
    FAutoReconnect: Boolean;
    FIsTaggedCommand: Boolean;
    FTotalBytesToReceive: Integer;
    procedure RaiseError(const AMessage: string);
    function GetNextCommandTag: string;
    function GetLastCommandTag: string;
    procedure SetAutoReconnect(const Value: Boolean);
    procedure Login;
    procedure Authenticate;
    procedure OpenImapSession;
    procedure Logout;
    procedure ParseMailBoxes(AList: TStrings; const ACommand: string);
    procedure ParseSelectedMailBox(const AName: string);
    procedure ParseSearchMessages(AList: TStrings);
    function ParseMessageSize(const AMessageId: string; AIsUid: Boolean): Integer;
    function ParseMessageUid(AIndex: Integer): string;
    function ParseMessageFlags(const AMessageId: string; AIsUid: Boolean): TclMailMessageFlags;
    procedure ParseMessage(const AMessageId: string; AMessage: TclMailMessage; AIsUid: Boolean);
    function GetMessageId(const ACommand, AResponseLine: string; AIsUid: Boolean): string;
    procedure CheckMessageValid(AIndex: Integer);
    procedure CheckUidValid(const AUid: string);
    procedure CheckConnection(AStates: array of TclImapConnectionState);
    procedure DoDataProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
    procedure CramMD5Authenticate;
    procedure NtlmAuthenticate;
    procedure GetCapability(AList: TStrings);
  protected
    function GetDefaultPort: Integer; override;
    function GetResponseCode(const AResponse: string): Integer; override;
    procedure WaitingResponse(const AOkResponses: array of Integer); override;
    procedure OpenSession; override;
    procedure CloseSession; override;

    property AutoReconnect: Boolean read FAutoReconnect write SetAutoReconnect default False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure StartTls; override;
    procedure SendTaggedCommand(const ACommand: string;
      const Args: array of const; const AOkResponses: array of Integer);
    procedure Noop;
    procedure SelectMailBox(const AName: string);
    procedure ExamineMailBox(const AName: string);
    procedure CreateMailBox(const AName: string);
    procedure DeleteMailBox(const AName: string);
    procedure RenameMailBox(const ACurrentName, ANewName: string);
    procedure SubscribeMailBox(const AName: string);
    procedure UnsubscribeMailBox(const AName: string);
    procedure GetMailBoxes(AList: TStrings; const ACriteria: string = '*');
    procedure GetSubscribedMailBoxes(AList: TStrings);

    procedure SearchMessages(const ASearchCriteria: string; AMessageList: TStrings);
    procedure UidSearchMessages(const ASearchCriteria: string; AMessageList: TStrings);
    procedure DeleteMessage(AIndex: Integer);
    procedure UidDeleteMessage(const AUid: string);
    procedure PurgeMessages;
    procedure CopyMessage(AIndex: Integer; const ADestMailBox: string);
    procedure UidCopyMessage(const AUid, ADestMailBox: string);
    procedure SetMessageFlags(AIndex: Integer; AMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags);
    procedure UidSetMessageFlags(const AUid: string; AMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags);
    function GetMessageFlags(AIndex: Integer): TclMailMessageFlags;
    function UidGetMessageFlags(const AUid: string): TclMailMessageFlags;
    function GetMessageSize(AIndex: Integer): Integer;
    function UidGetMessageSize(const AUid: string): Integer;
    function GetMessageUid(AIndex: Integer): string;

    procedure RetrieveMessage(AIndex: Integer); overload;
    procedure RetrieveMessage(AIndex: Integer; AMessage: TclMailMessage); overload;
    procedure UidRetrieveMessage(const AUid: string; AMessage: TclMailMessage);
    procedure RetrieveHeader(AIndex: Integer); overload;
    procedure RetrieveHeader(AIndex: Integer; AMessage: TclMailMessage); overload;
    procedure UidRetrieveHeader(const AUid: string; AMessage: TclMailMessage);
    procedure AppendMessage(const AMailBoxName: string; AFlags: TclMailMessageFlags); overload;
    procedure AppendMessage(const AMailBoxName: string; AMessage: TclMailMessage;
      AFlags: TclMailMessageFlags); overload;
    procedure AppendMessage(const AMailBoxName: string; AMessage: TStrings;
      AFlags: TclMailMessageFlags); overload;

    property CurrentMailBox: TclImap4MailBoxInfo read FCurrentMailBox;
    property MailBoxSeparator: Char read FMailBoxSeparator;
    property CurrentMessage: Integer read FCurrentMessage;
    property ConnectionState: TclImapConnectionState read FConnectionState;
    property LastCommandTag: string read GetLastCommandTag;
  end;

  TclImap4 = class(TclCustomImap4)
  published
    property AutoReconnect;
    property BatchSize;
    property UserName;
    property Password;
    property Server;
    property Port default cDefaultImapPort;
    property TimeOut;
    property UseTLS;
    property CertificateFlags;
    property TLSFlags;
    property BitsPerSec;
    property UseSPA;
    property MailMessage;
    property OnChanged;
    property OnOpen;
    property OnClose;
    property OnGetCertificate;
    property OnVerifyServer;
    property OnSendCommand;
    property OnReceiveResponse;
    property OnProgress;
  end;

const
  IMAP_OK = 10;
  IMAP_NO = 20;
  IMAP_BAD = 30;
  IMAP_PREAUTH = 40;
  IMAP_BYE = 50;
  IMAP_CONTINUE = 60;

resourcestring
  cImapInvalidMailboxName = 'Mailbox name is invalid, it must not be empty or begin with mailbox separator';
  cInvalidArgument = 'Function arguments are invalid';
  cMailMessageNoInvalid = 'Message number is invalid, must be greater than 0';
  cMailMessageUidInvalid = 'Message UID is invalid, must be numeric and greater than 0';
  cSocketErrorConnect = 'The connection to the server has failed';
  cInvalidAuthMethod = 'Unable to logon to the server using Secure Password Authentication';

implementation

uses 
  SysUtils, clUtils, clCryptUtils, clSocket, clSspiAuth,
  clEncoder{$IFDEF DEMO}, Forms, Windows, clCert{$ENDIF};

{ TclCustomImap4 }

constructor TclCustomImap4.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCurrentMailBox := TclImap4MailBoxInfo.Create();
  Port := cDefaultImapPort;
  FIsTaggedCommand := False;
  FMailBoxSeparator := '/';
end;

procedure TclCustomImap4.CloseSession;
begin
  Logout();
end;

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

procedure TclCustomImap4.OpenSession;
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
    if (not IsDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) and (not IsMailMessageDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsMailMessageDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  WaitingResponse([IMAP_OK, IMAP_PREAUTH]);

  FCommandTag := 0;
  ExplicitStartTls();

  OpenImapSession();
end;

procedure TclCustomImap4.Login;
begin
  if (Password <> '') then
  begin
    SendTaggedCommand('LOGIN "%s" "%s"', [UserName, Password], [IMAP_OK]);
  end else
  begin
    SendTaggedCommand('LOGIN "%s"', [UserName], [IMAP_OK]);
  end;
end;

procedure TclCustomImap4.CramMD5Authenticate;
var
  resp, DecodedResponse: string;
  Encoder: TclEncoder;
begin
  SendTaggedCommand('AUTHENTICATE %s', ['CRAM-MD5'], [IMAP_CONTINUE]);
  Encoder := TclEncoder.Create(nil);
  try
    resp := Copy(Response.Text, 3, MaxInt);
    Encoder.DecodeString(resp, DecodedResponse, cmMIMEBase64);
    DecodedResponse := HMAC_MD5(DecodedResponse, Password);
    DecodedResponse := UserName + ' ' + DecodedResponse;
    Encoder.EncodeString(DecodedResponse, resp, cmMIMEBase64);
    SendCommandSync(resp, [IMAP_OK]);
  finally
    Encoder.Free();
  end;
end;

procedure TclCustomImap4.NtlmAuthenticate;
var
  sspi: TclNtAuthClientSspi;
  encoder: TclEncoder;
  buf: TStream;
  authIdentity: TclAuthIdentity;
  challenge: string;
begin
  SendTaggedCommand('AUTHENTICATE %s', ['NTLM'], [IMAP_CONTINUE]);

  sspi := nil;
  encoder := nil;
  buf := nil;
  authIdentity := nil;
  try
    sspi := TclNtAuthClientSspi.Create();
    encoder := TclEncoder.Create(nil);
    encoder.SuppressCrlf := True;

    buf := TMemoryStream.Create();

    if (UserName <> '') then
    begin
      authIdentity := TclAuthIdentity.Create(UserName, Password);
    end;

    while not sspi.GenChallenge('NTLM', buf, Server, authIdentity) do
    begin
      buf.Position := 0;
      encoder.EncodeToString(buf, challenge, cmMIMEBase64);
      SendCommandSync(challenge, [IMAP_CONTINUE]);

      challenge := system.Copy(Response.Text, 3, MaxInt);
      buf.Size := 0;
      encoder.DecodeFromString(challenge, buf, cmMIMEBase64);
      buf.Position := 0;
    end;

    if (buf.Size > 0) then
    begin
      buf.Position := 0;
      encoder.EncodeToString(buf, challenge, cmMIMEBase64);
      SendCommandSync(challenge, [IMAP_OK]);
    end;
  finally
    authIdentity.Free();
    buf.Free();
    encoder.Free();
    sspi.Free();
  end;
end;

procedure TclCustomImap4.GetCapability(AList: TStrings);
var
  i: Integer;
  s: string;
begin
  SendTaggedCommand('CAPABILITY', [], [IMAP_OK]);
  AList.Clear();
  for i := 0 to Response.Count - 1 do
  begin
    s := Response[i];
    if (System.Pos('* CAPABILITY ', UpperCase(s)) = 1) then
    begin
      s := system.Copy(s, Length('* CAPABILITY ') + 1, Length(s));
      s := StringReplace(s, ' ', #13#10, [rfReplaceAll]);
      AddTextStr(AList, s, False);
    end;
  end;
end;

procedure TclCustomImap4.Authenticate;
var
  list: TStrings;
begin
  list := TStringList.Create();
  try
    GetCapability(list);
    if FindInStrings(list, 'AUTH=NTLM') > -1 then
    begin
      NtlmAuthenticate();
    end else
    if FindInStrings(list, 'AUTH=CRAM-MD5') > -1 then
    begin
      CramMD5Authenticate();
    end else
    begin
      RaiseError(cInvalidAuthMethod);
    end;
  finally
    list.Free();
  end;
end;

procedure TclCustomImap4.OpenImapSession;
begin
  FCommandTag := 0;
  if (LastResponseCode = IMAP_OK) then
  begin
    if UseSPA then
    begin
      Authenticate();
    end else
    begin
      Login();
    end;
    FConnectionState := csAuthenticated;
  end else
  if (LastResponseCode = IMAP_PREAUTH) then
  begin
    FConnectionState := csAuthenticated;
  end;
end;

function TclCustomImap4.GetNextCommandTag: string;
begin
  Inc(FCommandTag);
  Result := GetLastCommandTag();
end;

procedure TclCustomImap4.SelectMailBox(const AName: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  try
    SendTaggedCommand('SELECT "%s"', [AName], [IMAP_OK]);
    ParseSelectedMailBox(AName);
    FConnectionState := csSelected;
  except
    on E: EclSocketError do
    begin
      FCurrentMailBox.Clear();
      FConnectionState := csAuthenticated;
      raise;
    end;
  end;
end;

procedure TclCustomImap4.CreateMailBox(const AName: string);
begin
  if (Trim(AName) = '') or (Trim(AName)[1] = MailBoxSeparator) then
  begin
    RaiseError(cImapInvalidMailboxName);
  end;
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('CREATE "%s"', [AName], [IMAP_OK]);
end;

procedure TclCustomImap4.DeleteMailBox(const AName: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('DELETE "%s"', [AName], [IMAP_OK]);
end;

procedure TclCustomImap4.RenameMailBox(const ACurrentName, ANewName: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('RENAME "%s" "%s"', [ACurrentName, ANewName], [IMAP_OK]);
end;

function TclCustomImap4.GetMessageFlags(AIndex: Integer): TclMailMessageFlags;
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('FETCH %d (FLAGS)', [AIndex], [IMAP_OK]);
  Result := ParseMessageFlags(IntToStr(AIndex), False);
  FCurrentMessage := AIndex;
end;

procedure TclCustomImap4.AppendMessage(const AMailBoxName: string; AFlags: TclMailMessageFlags);
begin
  AppendMessage(AMailBoxName, MailMessage, AFlags);
end;

procedure TclCustomImap4.AppendMessage(const AMailBoxName: string; AMessage: TclMailMessage;
  AFlags: TclMailMessageFlags);
begin
  if (AMessage = nil) then
  begin
    RaiseError(cInvalidArgument);
  end;
  AppendMessage(AMailBoxName, AMessage.MessageSource, AFlags);
end;

procedure TclCustomImap4.CopyMessage(AIndex: Integer;
  const ADestMailBox: string);
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('COPY %d "%s"', [AIndex, ADestMailBox], [IMAP_OK]);
  FCurrentMessage := AIndex;
end;

procedure TclCustomImap4.DeleteMessage(AIndex: Integer);
begin
  SetMessageFlags(AIndex, fmAdd, [mfDeleted]);
end;

procedure TclCustomImap4.ParseMailBoxes(AList: TStrings; const ACommand: string);
var
  i: Integer;
  s: string;
begin
  AList.Clear();
  for i := 0 to Response.Count - 1 do
  begin
    if (System.Pos(Format('* %s ', [UpperCase(ACommand)]), UpperCase(Response[i])) = 1) then
    begin
      ParseMailboxInfo(Response[i], FMailBoxSeparator, s);
      if (s <> '') then
      begin
        AList.Add(s);
      end;
    end;
  end;
end;

procedure TclCustomImap4.GetMailBoxes(AList: TStrings; const ACriteria: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('LIST "" "%s"', [ACriteria], [IMAP_OK]);
  ParseMailBoxes(AList, 'LIST');
end;

function TclCustomImap4.GetMessageSize(AIndex: Integer): Integer;
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('FETCH %d (RFC822.SIZE)', [AIndex], [IMAP_OK]);
  Result := ParseMessageSize(IntToStr(AIndex), False);
  FCurrentMessage := AIndex;
end;

procedure TclCustomImap4.GetSubscribedMailBoxes(AList: TStrings);
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('LSUB "" "*"', [], [IMAP_OK]);
  ParseMailBoxes(AList, 'LSUB');
end;

procedure TclCustomImap4.RetrieveHeader(AIndex: Integer; AMessage: TclMailMessage);
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('FETCH %d (BODY.PEEK[HEADER])', [AIndex], [IMAP_OK]);
  ParseMessage(IntToStr(AIndex), AMessage, False);
  FCurrentMessage := AIndex;
end;

procedure TclCustomImap4.RetrieveHeader(AIndex: Integer);
begin
  RetrieveHeader(AIndex, MailMessage);
end;

procedure TclCustomImap4.RetrieveMessage(AIndex: Integer);
begin
  RetrieveMessage(AIndex, MailMessage);
end;

procedure TclCustomImap4.RetrieveMessage(AIndex: Integer; AMessage: TclMailMessage);
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);

  FTotalBytesToReceive := 0;
  if Assigned(OnProgress) then
  begin
    FTotalBytesToReceive := GetMessageSize(AIndex);
  end;
  try
    SendTaggedCommand('FETCH %d (BODY.PEEK[])', [AIndex], [IMAP_OK]);
    if Assigned(OnProgress) then
    begin
      DoProgress(FTotalBytesToReceive, FTotalBytesToReceive);
    end;
  finally
    FTotalBytesToReceive := 0;
    Connection.OnProgress := nil;
  end;
  
  ParseMessage(IntToStr(AIndex), AMessage, False);
  FCurrentMessage := AIndex;
end;

procedure TclCustomImap4.WaitingResponse(const AOkResponses: array of Integer);
begin
  if (FTotalBytesToReceive > 0) then
  begin
    Connection.OnProgress := DoDataProgress;
    Connection.InitProgress(0, FTotalBytesToReceive);
  end;
  inherited WaitingResponse(AOkResponses);
end;

procedure TclCustomImap4.DoDataProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
begin
  DoProgress(ABytesProceed, ATotalBytes);
end;

procedure TclCustomImap4.SearchMessages(const ASearchCriteria: string;
  AMessageList: TStrings);
begin
  CheckConnection([csSelected]);
  SendTaggedCommand('SEARCH %s', [ASearchCriteria], [IMAP_OK]);
  ParseSearchMessages(AMessageList);
end;

procedure TclCustomImap4.SetMessageFlags(AIndex: Integer;
  AMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags);
const
  methodLexem: array[TclSetFlagsMethod] of string = ('', '+', '-');
var
  cmd: string;
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);
  cmd := GetStrByImapMessageFlags(AFlags);
  SendTaggedCommand('STORE %d %sFLAGS.SILENT (%s)',
    [AIndex, methodLexem[AMethod], Trim(cmd)], [IMAP_OK]);
  FCurrentMessage := AIndex;
end;

procedure TclCustomImap4.SubscribeMailBox(const AName: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('SUBSCRIBE "%s"', [AName], [IMAP_OK]);
end;

procedure TclCustomImap4.UnsubscribeMailBox(const AName: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('UNSUBSCRIBE "%s"', [AName], [IMAP_OK]);
end;

procedure TclCustomImap4.SetAutoReconnect(const Value: Boolean);
begin
  if (FAutoReconnect <> Value) then
  begin
    FAutoReconnect := Value;
    Changed();
  end;
end;

function TclCustomImap4.GetResponseCode(const AResponse: string): Integer;
var
  s: string;
  ind: Integer;
begin
  Result := SOCKET_WAIT_RESPONSE;
  if (AResponse = '') then Exit;

  if (System.Pos('+ ', AResponse) = 1) or ('+' = Trim(AResponse)) then
  begin
    Result := IMAP_CONTINUE;
    Exit;
  end;

  ind := System.Pos(' ', AResponse);
  if (ind < 2) or (ind > Length(AResponse) - 1) then Exit;

  s := Trim(System.Copy(AResponse, ind + 1, Length(AResponse)));
  ind := System.Pos(' ', s);
  if (ind < 1) then
  begin
    ind := Length(s);
  end;

  if FIsTaggedCommand
    and (System.Pos(UpperCase(LastCommandTag), UpperCase(AResponse)) <> 1) then Exit;

  s := Trim(System.Copy(s, 1, ind));
  if (s = 'OK') then
  begin
    Result := IMAP_OK;
  end else
  if (s = 'NO') then
  begin
    Result := IMAP_NO;
  end else
  if (s = 'BAD') then
  begin
    Result := IMAP_BAD;
  end else
  if (s = 'PREAUTH') then
  begin
    Result := IMAP_PREAUTH;
  end else
  if (s = 'BYE') then
  begin
    Result := IMAP_BYE;
  end;
end;

procedure TclCustomImap4.RaiseError(const AMessage: string);
begin
  raise EclSocketError.Create(AMessage, -1);
end;

procedure TclCustomImap4.Logout;
begin
  if (ConnectionState in [csAuthenticated, csSelected]) then
  begin
    try
      SendTaggedCommand('LOGOUT', [], [IMAP_OK]);
    except
      on EclSocketError do ;
    end;
  end;
  FConnectionState := csNonAuthenticated;
end;

procedure TclCustomImap4.CheckConnection(AStates: array of TclImapConnectionState);
  function IsInState: Boolean;
  var
    i: Integer;
  begin
    for i := Low(AStates) to High(AStates) do
    begin
      if (ConnectionState = AStates[i]) then
      begin
        Result := True;
        Exit;
      end;
    end;
    Result := False;
  end;

begin
  if not IsInState() then
  begin
    if AutoReconnect then
    begin
      if not Active then
      begin
        Open();
      end else
      begin
        OpenImapSession();
      end;
    end else
    begin
      RaiseError(cSocketErrorConnect);
    end;
  end;
end;

destructor TclCustomImap4.Destroy;
begin
  FCurrentMailBox.Free();
  inherited Destroy();
end;

procedure TclCustomImap4.ParseSelectedMailBox(const AName: string);
  function GetLexemPos(const ALexem, AText: string; var APos: Integer): Boolean;
  begin
    APos := System.Pos(ALexem, AText);
    Result := APos > 0;
  end;

var
  i, ind: Integer;
  responseStr: string;
begin
  CurrentMailBox.Clear();
  CurrentMailBox.Name := AName;
  for i := 0 to Response.Count - 1 do
  begin
    responseStr := UpperCase(Response[i]);
    if GetLexemPos('EXISTS', responseStr, ind) then
    begin
      CurrentMailBox.ExistsMessages := StrToIntDef(Trim(System.Copy(responseStr, 3, ind - 3)), 0);
    end else
    if not GetLexemPos('FLAGS', responseStr, ind)
      and GetLexemPos('RECENT', responseStr, ind) then
    begin
      CurrentMailBox.RecentMessages := StrToIntDef(Trim(System.Copy(responseStr, 3, ind - 3)), 0);
    end else
    if GetLexemPos('[UNSEEN', responseStr, ind) then
    begin
      CurrentMailBox.FirstUnseen := StrToIntDef(Trim(System.Copy(responseStr, ind + Length('[UNSEEN'),
        System.Pos(']', responseStr) - ind - Length('[UNSEEN'))), 0);
    end else
    if GetLexemPos('[READ-WRITE]', responseStr, ind) then
    begin
      CurrentMailBox.ReadOnly := False;
    end else
    if GetLexemPos('[READ-ONLY]', responseStr, ind) then
    begin
      CurrentMailBox.ReadOnly := True;
    end else
    if not GetLexemPos('[PERMANENTFLAGS', responseStr, ind)
      and GetLexemPos('FLAGS', responseStr, ind) then
    begin
      CurrentMailBox.Flags := GetImapMessageFlagsByStr(System.Copy(responseStr, ind, TextPos(')', responseStr, ind) - ind));
    end else
    if GetLexemPos('[PERMANENTFLAGS', responseStr, ind) then
    begin
      CurrentMailBox.ChangeableFlags := GetImapMessageFlagsByStr(System.Copy(responseStr, ind, TextPos(')', responseStr, ind) - ind));
    end;
    if GetLexemPos('[UIDVALIDITY', responseStr, ind) then
    begin
      ind := ind + Length('[UIDVALIDITY');
      CurrentMailBox.UIDValidity := Trim(System.Copy(responseStr, ind, TextPos(']', responseStr, ind) - ind));
    end;
  end;
end;

procedure TclCustomImap4.ParseSearchMessages(AList: TStrings);
var
  i: Integer;
begin
  AList.Clear();
  for i := 0 to Response.Count - 1 do
  begin
    if (System.Pos('* SEARCH', UpperCase(Response[i])) = 1) then
    begin
      AList.Text := Trim(StringReplace(
        System.Copy(Response[i], Length('* SEARCH') + 1, MaxInt), ' ', #13#10, [rfReplaceAll]));
      Break;
    end;
  end;
end;

function TclCustomImap4.ParseMessageSize(const AMessageId: string; AIsUid: Boolean): Integer;
var
  i, ind: Integer;
  responseStr: string;
begin
  Result := 0;
  for i := 0 to Response.Count - 1 do
  begin
    responseStr := UpperCase(Response[i]);
    if (GetMessageId('FETCH', responseStr, AIsUid) = AMessageId) then
    begin
      ind := System.Pos('RFC822.SIZE ', responseStr);
      if (ind > 0) then
      begin
        Result := StrToIntDef(Trim(ExtractNumeric(responseStr, ind + Length('RFC822.SIZE '))), 0);
      end;
      Break;
    end;
  end;
end;

function TclCustomImap4.ParseMessageFlags(const AMessageId: string; AIsUid: Boolean): TclMailMessageFlags;
var
  i, ind: Integer;
  responseStr: string;
begin
  Result := [];
  for i := 0 to Response.Count - 1 do
  begin
    responseStr := UpperCase(Response[i]);
    if (GetMessageId('FETCH', responseStr, AIsUid) = AMessageId) then
    begin
      ind := System.Pos('FLAGS', responseStr);
      if (ind > 0) then
      begin
        Result := GetImapMessageFlagsByStr(System.Copy(responseStr, ind, TextPos(')', responseStr, ind) - ind));
      end;
      Break;
    end;
  end;
end;

procedure TclCustomImap4.PurgeMessages;
begin
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('CLOSE', [], [IMAP_OK]);
  FCurrentMailBox.Clear();
  FConnectionState := csAuthenticated;
end;

procedure TclCustomImap4.ParseMessage(const AMessageId: string; AMessage: TclMailMessage; AIsUid: Boolean);
var
  i, msgSize, size: Integer;
begin
  if (Response.Count < 4) then Exit;

  msgSize := ExtractMessageSize(Response[0]);
  if (msgSize = 0) then Exit;

  Response.Delete(0);

  i := 0;
  size := 0;
  while (i < Response.Count) do
  begin
    size := size + Length(Response[i]) + Length(#13#10);
    if (size <= msgSize) then
    begin
      Inc(i);
    end else
    if (size - msgSize) < (Length(Response[i]) + Length(#13#10)) then
    begin
      Response[i] := system.Copy(Response[i], 1, Length(Response[i]) - (size - msgSize));
      Inc(i);
    end else
    begin
      Response.Delete(i);
    end;
  end;

  if (AMessage <> nil) then
  begin
    AMessage.Clear();
    AMessage.MessageSource := Response;
  end;
end;

function TclCustomImap4.GetMessageId(const ACommand, AResponseLine: string; AIsUid: Boolean): string;
var
  ind: Integer;
begin
  ind := System.Pos(#32 + ACommand, UpperCase(AResponseLine));
  Result := '0';
  if (ind < 4) then Exit;
  if AIsUid then
  begin
    ind := TextPos('UID ', AResponseLine, ind);
    if (ind > 0) then
    begin
      Result := ExtractNumeric(AResponseLine, ind + Length('UID '));
    end;
  end else
  begin
    Result := IntToStr(StrToIntDef(Trim(System.Copy(AResponseLine, 2, ind - 1)), 0));
  end;
end;

procedure TclCustomImap4.CheckMessageValid(AIndex: Integer);
begin
  if (AIndex < 1) then
  begin
    RaiseError(cMailMessageNoInvalid);
  end;
end;

function TclCustomImap4.GetLastCommandTag: string;
begin
  Result := Format('a%.4d', [FCommandTag]);
end;

procedure TclCustomImap4.SendTaggedCommand(const ACommand: string;
  const Args: array of const; const AOkResponses: array of Integer);
begin
  FIsTaggedCommand := True;
  try
    SendCommandSync(GetNextCommandTag() + #32 + ACommand, AOkResponses, Args);
  finally
    FIsTaggedCommand := False;
  end;
end;

procedure TclCustomImap4.UidDeleteMessage(const AUid: string);
begin
  UidSetMessageFlags(AUid, fmAdd, [mfDeleted]);
end;

procedure TclCustomImap4.UidCopyMessage(const AUid, ADestMailBox: string);
begin
  CheckUidValid(AUid);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('UID COPY %s "%s"', [AUid, ADestMailBox], [IMAP_OK]);
  FCurrentMessage := 0;
end;

procedure TclCustomImap4.UidSetMessageFlags(const AUid: string;
  AMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags);
const
  methodLexem: array[TclSetFlagsMethod] of string = ('', '+', '-');
var
  cmd: string;
begin
  CheckUidValid(AUid);
  CheckConnection([csAuthenticated, csSelected]);
  cmd := GetStrByImapMessageFlags(AFlags);
  SendTaggedCommand('UID STORE %s %sFLAGS.SILENT (%s)',
    [AUid, methodLexem[AMethod], Trim(cmd)], [IMAP_OK]);
  FCurrentMessage := 0;
end;

function TclCustomImap4.UidGetMessageFlags(
  const AUid: string): TclMailMessageFlags;
begin
  CheckUidValid(AUid);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('UID FETCH %s (FLAGS)', [AUid], [IMAP_OK]);
  Result := ParseMessageFlags(AUid, True);
  FCurrentMessage := 0;
end;

function TclCustomImap4.UidGetMessageSize(const AUid: string): Integer;
begin
  CheckUidValid(AUid);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('UID FETCH %s (RFC822.SIZE)', [AUid], [IMAP_OK]);
  Result := ParseMessageSize(AUid, True);
  FCurrentMessage := 0;
end;

procedure TclCustomImap4.UidRetrieveMessage(const AUid: string;
  AMessage: TclMailMessage);
begin
  CheckUidValid(AUid);
  CheckConnection([csAuthenticated, csSelected]);

  FTotalBytesToReceive := 0;
  if Assigned(OnProgress) then
  begin
    FTotalBytesToReceive := UidGetMessageSize(AUid);
  end;
  try
    SendTaggedCommand('UID FETCH %s (BODY.PEEK[])', [AUid], [IMAP_OK]);
    if Assigned(OnProgress) then
    begin
      DoProgress(FTotalBytesToReceive, FTotalBytesToReceive);
    end;
  finally
    FTotalBytesToReceive := 0;
    Connection.OnProgress := nil;
  end;

  ParseMessage(AUid, AMessage, True);
  FCurrentMessage := 0;
end;

procedure TclCustomImap4.UidRetrieveHeader(const AUid: string;
  AMessage: TclMailMessage);
begin
  CheckUidValid(AUid);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('UID FETCH %s (BODY.PEEK[HEADER])', [AUid], [IMAP_OK]);
  ParseMessage(AUid, AMessage, True);
  FCurrentMessage := 0;
end;

procedure TclCustomImap4.CheckUidValid(const AUid: string);
begin
  if (AUid = '') then
  begin
    RaiseError(cMailMessageUidInvalid);
  end;
  if StrToIntDef(AUid, 0) < 1 then
  begin
    RaiseError(cMailMessageUidInvalid);
  end;
end;

procedure TclCustomImap4.UidSearchMessages(const ASearchCriteria: string; AMessageList: TStrings);
begin
  CheckConnection([csSelected]);
  SendTaggedCommand('UID SEARCH %s', [ASearchCriteria], [IMAP_OK]);
  ParseSearchMessages(AMessageList);
end;

function TclCustomImap4.GetMessageUid(AIndex: Integer): string;
begin
  CheckMessageValid(AIndex);
  CheckConnection([csAuthenticated, csSelected]);
  SendTaggedCommand('FETCH %d (UID)', [AIndex], [IMAP_OK]);
  Result := ParseMessageUid(AIndex);
  FCurrentMessage := AIndex;
end;

function TclCustomImap4.ParseMessageUid(AIndex: Integer): string;
begin
  if (Response.Count > 0) and
    (GetMessageId('FETCH', Response[0], False) = IntToStr(AIndex)) then
  begin
    Result := GetMessageId('FETCH', Response[0], True);
  end else
  begin
    Result := '';
  end;
end;

procedure TclCustomImap4.AppendMessage(const AMailBoxName: string;
  AMessage: TStrings; AFlags: TclMailMessageFlags);
var
  flags: string;
begin
  if (Trim(AMailBoxName) = '') then
  begin
    RaiseError(cInvalidArgument);
  end;
  CheckConnection([csAuthenticated, csSelected]);
  flags := GetStrByImapMessageFlags(AFlags);
  if (flags <> '') then
  begin
    flags := Format('(%s) ', [flags]);
  end;

  SendTaggedCommand('APPEND "%s" %s{%d}',
    [AMailBoxName, flags, Length(AMessage.Text)], [IMAP_CONTINUE]);

  SendMultipleLines(AMessage);
  SendCommandSync('', [IMAP_OK]);
end;

procedure TclCustomImap4.ExamineMailBox(const AName: string);
begin
  CheckConnection([csAuthenticated, csSelected]);
  try
    SendTaggedCommand('EXAMINE "%s"', [AName], [IMAP_OK]);
    ParseSelectedMailBox(AName);
    FConnectionState := csSelected;
  except
    on E: EclSocketError do
    begin
      FCurrentMailBox.Clear();
      FConnectionState := csAuthenticated;
      raise;
    end;
  end;
end;

procedure TclCustomImap4.Noop;
begin
  SendTaggedCommand('NOOP', [], [IMAP_OK]);
end;

procedure TclCustomImap4.StartTls;
begin
  SendTaggedCommand('STARTTLS', [], [IMAP_OK]);
  inherited StartTls();
end;

function TclCustomImap4.GetDefaultPort: Integer;
begin
  Result := cDefaultImapPort;
end;

end.
