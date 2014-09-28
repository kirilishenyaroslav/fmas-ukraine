{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSmtp;

interface

{$I clVer.inc}

uses
  Classes, clMC, clMailMessage, clMCUtils;

type
  TclCustomSmtp = class(TclCustomMail)
  private
    FMailFrom: string;
    FMailToList: TStrings;
    FMailData: TStrings;
    FExtensions: TStrings;
    FAuthMechanisms: TStrings;
    FUseEHLO: Boolean;
    FMailAgent: string;
    procedure GetExtensions;
    function GetAuthExtension: string;
    procedure GetAuthMechanisms(const AuthExtension: string);
    procedure SetMailToList(AValue: TStrings);
    procedure SetMailData(AValue: TStrings);
    procedure SetMailFrom(const Value: string);
    procedure SetUseEHLO(const Value: Boolean);
    procedure SetMailAgent(const Value: string);
    procedure HELO(const AOkResponses: array of Integer);
    procedure MAIL;
    procedure RCPT(AMailToList: TStrings);
    procedure DATA(AMailData: TStrings);
    procedure QUIT;
    procedure EHLO(const AOkResponses: array of Integer);
    procedure AUTH;
    procedure DoStringsChanged(Sender: TObject);
    procedure RemoveBcc(AMailData: TStrings);
    procedure CramMD5Authenticate;
    procedure LoginAuthenticate;
    procedure NtlmAuthenticate;
  protected
    function GenMessageID: string; virtual;
    function GetDefaultPort: Integer; override;
    procedure OpenSession; override;
    procedure CloseSession; override;
    procedure DoDestroy; override;
    function GetResponseCode(const AResponse: string): Integer; override;
    procedure InternalSend(AMailData, AMailToList: TStrings); virtual;

    property MailFrom: string read FMailFrom write SetMailFrom;
    property MailToList: TStrings read FMailToList write SetMailToList;
    property UseEHLO: Boolean read FUseEHLO write SetUseEHLO default True;
    property MailAgent: string  read FMailAgent write SetMailAgent;
  public
    constructor Create(AOwner: TComponent); override;
    procedure StartTls; override;
    procedure Send; overload;
    procedure Send(AMessage: TclMailMessage); overload;
    procedure Send(AMessage: TStrings); overload;
    procedure Reset;
    property AuthMechanisms: TStrings read FAuthMechanisms;
    property Extensions: TStrings read FExtensions;
    property MailData: TStrings read FMailData write SetMailData;
  end;

  TclSmtp = class(TclCustomSmtp)
  published
    property BatchSize;
    property UserName;
    property Password;
    property MailFrom;
    property MailToList;
    property Server;
    property Port default cDefaultSmtpPort;
    property TimeOut;
    property UseTLS;
    property CertificateFlags;
    property TLSFlags;
    property BitsPerSec;
    property UseSPA;
    property UseEHLO;
    property MailAgent;
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

resourcestring
  cSMTPErrorDataListEmpty = 'The data list is empty';
  cSMTPErrorRcptListEmpty = 'The recipient list is empty';

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsSmtpDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}
  
implementation

uses
  Windows, SysUtils, clEncoder, clUtils, clCryptUtils, clSocket, clSspiAuth,
  clTcpClient{$IFDEF DEMO}, Forms, clCert{$ENDIF};

{ TclCustomSmtp }

constructor TclCustomSmtp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMailFrom := '';
  FUseEHLO := True;
  FMailToList := TStringList.Create();
  TStringList(FMailToList).OnChange := DoStringsChanged;
  FMailData := TStringList.Create();
  TStringList(FMailData).OnChange := DoStringsChanged;
  FExtensions := TStringList.Create();
  FAuthMechanisms := TStringList.Create();
  Port := cDefaultSmtpPort;
  FMailAgent := cMailAgent;
end;

procedure TclCustomSmtp.DoStringsChanged(Sender: TObject);
begin
  Changed();
end;

function TclCustomSmtp.GetResponseCode(const AResponse: string): Integer;
begin
  if (Pos('-', AResponse) = 4) then
  begin
    Result := SOCKET_WAIT_RESPONSE;
  end else
  begin
    Result := StrToIntDef(Copy(AResponse, 1, 3), SOCKET_WAIT_RESPONSE);
  end;
end;

procedure TclCustomSmtp.GetExtensions;
var
  i: Integer;
  Extension: string;
begin
  FExtensions.Clear;
  for i := 1 to Response.Count - 1 do
  begin
    Extension := Response[i];
    if (Pos('-', Extension) = 4) or (Pos(' ', Extension) = 4) then
    begin
      Extension := Copy(Extension, 5, MaxInt);
      FExtensions.Add(Extension);
    end;
  end;
end;

function TclCustomSmtp.GetAuthExtension: string;
var
  I: Integer;
  Extension: string;
begin
  for I := 0 to FExtensions.Count - 1 do
  begin
    Extension := FExtensions[I];
    if (Pos('AUTH', Extension) = 1) then
    begin
      Result := Copy(Extension, 6, MaxInt);
      Exit;
    end;
  end;
  Result := '';
end;

procedure TclCustomSmtp.GetAuthMechanisms(const AuthExtension: string);
var
  I: Integer;
  AuthMechanism: string;
begin
  FAuthMechanisms.Clear;
  for I := 1 to WordCount(AuthExtension, [' ']) do
  begin
    AuthMechanism := ExtractWord(I, AuthExtension, [' ']);
    FAuthMechanisms.Add(AuthMechanism);
  end;
end;

procedure TclCustomSmtp.SetMailToList(AValue: TStrings);
begin
  FMailToList.Assign(AValue);
end;

procedure TclCustomSmtp.SetMailData(AValue: TStrings);
begin
  FMailData.Assign(AValue);
end;

procedure TclCustomSmtp.HELO(const AOkResponses: array of Integer);
begin
  FExtensions.Clear();
  FAuthMechanisms.Clear();
  SendCommandSync('HELO %s', AOkResponses, [GetLocalHost()]);
end;

procedure TclCustomSmtp.MAIL;
var
  name, email: string;
begin
  GetEmailAddressParts(FMailFrom, name, email);
  SendCommandSync('MAIL FROM: <%s>', [250], [email]);
end;

procedure TclCustomSmtp.RCPT(AMailToList: TStrings);
var
  i: Integer;
  name, email: string;
begin
  if (AMailToList.Count = 0) then
  begin
    RaiseSocketError(cSMTPErrorRcptListEmpty, -1);
  end;
  i := 0;
  while (i < AMailToList.Count) do
  begin
    GetEmailAddressParts(AMailToList[i], name, email);
    SendCommandSync('RCPT TO: <%s>', [250], [email]);
    Inc(i);
  end;
end;

procedure TclCustomSmtp.DATA(AMailData: TStrings);
begin
  if (AMailData.Count = 0) then
  begin
    RaiseSocketError(cSMTPErrorDataListEmpty, -1);
  end;
  SendCommandSync('DATA', [354]);
  SendMultipleLines(AMailData);
  SendCommandSync('.', [250]);
end;

procedure TclCustomSmtp.QUIT;
begin
  try           
    SendCommandSync('QUIT', [221]);
  except
    on EclSocketError do ;
  end;
end;

procedure TclCustomSmtp.EHLO(const AOkResponses: array of Integer);
begin
  SendCommandSync('EHLO %s', AOkResponses, [GetLocalHost()]);
  GetExtensions();
  GetAuthMechanisms(GetAuthExtension());
end;

procedure TclCustomSmtp.NtlmAuthenticate;
var
  sspi: TclNtAuthClientSspi;
  encoder: TclEncoder;
  buf: TStream;
  authIdentity: TclAuthIdentity;
  challenge: string;
begin
  SendCommandSync('AUTH NTLM', [334]);

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
      SendCommandSync(challenge, [334]);

      challenge := system.Copy(Response.Text, Length('334 ') + 1, MaxInt);
      buf.Size := 0;
      encoder.DecodeFromString(challenge, buf, cmMIMEBase64);
      buf.Position := 0;
    end;

    if (buf.Size > 0) then
    begin
      buf.Position := 0;
      encoder.EncodeToString(buf, challenge, cmMIMEBase64);
      SendCommandSync(challenge, [235]);
    end;
  finally
    authIdentity.Free();
    buf.Free();
    encoder.Free();
    sspi.Free();
  end;
end;

procedure TclCustomSmtp.CramMD5Authenticate;
var
  respLine, DecodedResponse: string;
  Encoder: TclEncoder;
begin
  Encoder := TclEncoder.Create(nil);
  try
    Encoder.SuppressCrlf := True;
    SendCommandSync('AUTH %s', [334], ['CRAM-MD5']);
    respLine := Trim(Response.Text);
    respLine := Copy(respLine, 5, MaxInt);
    Encoder.DecodeString(respLine, DecodedResponse, cmMIMEBase64);
    DecodedResponse := HMAC_MD5(DecodedResponse, PassWord);
    DecodedResponse := UserName + ' ' + DecodedResponse;
    Encoder.EncodeString(DecodedResponse, respLine, cmMIMEBase64);
    SendCommandSync(respLine, [235]);
  finally
    Encoder.Free();
  end;
end;

procedure TclCustomSmtp.LoginAuthenticate;
var
  EncodedUserName: string;
  EncodedPassWord: string;
  Encoder: TclEncoder;
begin
  Encoder := TclEncoder.Create(nil);
  try
    Encoder.SuppressCrlf := True;
    SendCommandSync('AUTH %s', [334], ['LOGIN']);
    Encoder.EncodeString(UserName, EncodedUserName, cmMIMEBase64);
    SendCommandSync(EncodedUserName, [334]);
    Encoder.EncodeString(PassWord, EncodedPassWord, cmMIMEBase64);
    SendCommandSync(EncodedPassWord, [235]);
  finally
    Encoder.Free();
  end;
end;

procedure TclCustomSmtp.AUTH;
begin
  if (UserName = '') and (Password = '') then Exit;
  if UseSPA then
  begin
    if FindInStrings(AuthMechanisms, 'NTLM') > -1 then
    begin
      NtlmAuthenticate();
    end else
    if FindInStrings(AuthMechanisms, 'CRAM-MD5') > -1 then
    begin
      CramMD5Authenticate();
    end else
    begin
      LoginAuthenticate();
    end;
  end else
  begin
    LoginAuthenticate();
  end;
end;

procedure TclCustomSmtp.OpenSession;
  function IsExplicitTls: Boolean;
  begin
    Result := ((UseTLS = ctAutomatic) and (Port = GetDefaultPort())) or (UseTLS = ctExplicit);
  end;

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
    if (not IsSmtpDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) and (not IsMailMessageDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsSmtpDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsMailMessageDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  WaitingResponse([220]);

  if UseEHLO then
  begin
    EHLO([250, 530]);
    ExplicitStartTls();

    if IsExplicitTls() then
    begin
      EHLO([250]);
    end;
    AUTH();
  end else
  begin
    HELO([250, 530]);
    ExplicitStartTls();
    
    if IsExplicitTls() then
    begin
      HELO([250]);
    end;
  end;
end;

procedure TclCustomSmtp.CloseSession;
begin
  QUIT();
end;

procedure TclCustomSmtp.SetMailFrom(const Value: string);
begin
  if (FMailFrom <> Value) then
  begin
    FMailFrom := Value;
    Changed();
  end;
end;

procedure TclCustomSmtp.RemoveBcc(AMailData: TStrings);
var
  FieldList: TStrings;
begin
  FieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, AMailData, FieldList);
    RemoveHeaderField(AMailData, FieldList, 'bcc');
  finally
    FieldList.Free();
  end;
end;

procedure TclCustomSmtp.InternalSend(AMailData, AMailToList: TStrings);
begin
  InsertHeaderFieldIfNeed(AMailData, 'X-Mailer', MailAgent);
  InsertHeaderFieldIfNeed(AMailData, 'Message-ID', GenMessageID());

  RemoveBcc(AMailData);
  MAIL();
  RCPT(AMailToList);
  DATA(AMailData);
end;

procedure TclCustomSmtp.Reset;
begin
  SendCommandSync('RSET', [250]);
end;

procedure TclCustomSmtp.SetUseEHLO(const Value: Boolean);
begin
  if (FUseEHLO <> Value) then
  begin
    FUseEHLO := Value;
    Changed();
  end;
end;

procedure TclCustomSmtp.Send;
begin
  Send(MailMessage);
end;

procedure TclCustomSmtp.Send(AMessage: TclMailMessage);
var
  rcpt: TStrings;
begin
  rcpt := TStringList.Create();
  try
    if (AMessage <> nil) then
    begin
      if (AMessage.From <> '') then
      begin
        MailFrom := AMessage.From;
      end;
      rcpt.Assign(MailToList);
      rcpt.AddStrings(AMessage.ToList);
      rcpt.AddStrings(AMessage.CCList);
      rcpt.AddStrings(AMessage.BCCList);
      InternalSend(AMessage.MessageSource, rcpt);
    end else
    begin
      rcpt.Assign(MailToList);
      InternalSend(MailData, rcpt);
    end;
  finally
    rcpt.Free();
  end;
end;

procedure TclCustomSmtp.DoDestroy;
begin
  FMailToList.Free();
  FMailData.Free();
  FExtensions.Free();
  FAuthMechanisms.Free();
  inherited DoDestroy();
end;

function TclCustomSmtp.GenMessageID: string;
begin
  Result := GenerateMessageID();
end;

procedure TclCustomSmtp.StartTls;
begin
  SendCommandSync('STARTTLS', [220]);
  inherited StartTls();
end;

function TclCustomSmtp.GetDefaultPort: Integer;
begin
  Result := cDefaultSmtpPort;
end;

procedure TclCustomSmtp.SetMailAgent(const Value: string);
begin
  if (FMailAgent <> Value) then
  begin
    FMailAgent := Value;
    Changed();
  end;
end;

procedure TclCustomSmtp.Send(AMessage: TStrings);
var
  rcpt: TStrings;
  msg: TclMailMessage;
begin
  rcpt := nil;
  msg := nil;
  try
    rcpt := TStringList.Create();
    msg := TclMailMessage.Create(nil);
    msg.HeaderSource := AMessage;

    if (msg.From <> '') then
    begin
      MailFrom := msg.From;
    end;
    rcpt.Assign(MailToList);
    rcpt.AddStrings(msg.ToList);
    rcpt.AddStrings(msg.CCList);
    rcpt.AddStrings(msg.BCCList);
    InternalSend(AMessage, rcpt);
  finally
    msg.Free();
    rcpt.Free();
  end;
end;

end.

