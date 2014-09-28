{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clPop3;

interface

{$I clVer.inc}

uses
  Classes, clMC, clTcpClient, clMailMessage, clMCUtils;

type
  TclCustomPop3 = class(TclCustomMail)
  private
    FMessageCount: Integer;
    FCurrentMessage: Integer;
    FTimeStamp: string;
    procedure GetTimeStamp;
    function GetMsgCount: Integer;
    procedure GetUIDLs(AUIDLs: TStrings);
    function GetDigest: string;
    procedure USER;
    procedure PASS;
    procedure QUIT;
    procedure RETR;
    procedure STAT;
    procedure DELE;
    procedure UIDL;
    procedure APOP;
    procedure TOP;
    procedure LIST;
    function GetMessageCount: Integer;
    procedure InternalRetrieve(AMessage: TclMailMessage; ATotalBytes: Integer);
    procedure Authenticate;
    procedure NtlmAuthenticate;
    procedure CramMD5Authenticate;
  protected
    function GetDefaultPort: Integer; override;
    function GetResponseCode(const AResponse: string): Integer; override;
    procedure OpenSession; override;
    procedure CloseSession; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure StartTls; override;
    procedure Retrieve(AIndex: Integer); overload;
    procedure Retrieve(AIndex: Integer; AMessage: TclMailMessage); overload;
    procedure RetrieveHeader(AIndex: Integer); overload;
    procedure RetrieveHeader(AIndex: Integer; AMessage: TclMailMessage); overload;
    procedure Delete(AIndex: Integer);
    procedure Reset;
    function GetSize(AIndex: Integer): Integer;
    procedure GetUIDList(AUIDList: TStrings);
    function GetUID(AIndex: Integer): string;
    property MessageCount: Integer read GetMessageCount;
    property CurrentMessage: Integer read FCurrentMessage;
  end;

  TclPop3 = class(TclCustomPop3)
  published
    property BatchSize;
    property UserName;
    property Password;
    property Server;
    property Port default cDefaultPop3Port;
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
  POP3_OK = 10;
  POP3_ERR = 20;
  POP3_CONTINUE = 30;
  POP3_DOT = SOCKET_DOT_RESPONSE;

implementation

uses
  SysUtils, clUtils, clCryptUtils, clSspiAuth, clEncoder,
  clSocket{$IFDEF DEMO}, Forms, Windows, clCert{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

{ TclCustomPop3 }

constructor TclCustomPop3.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMessageCount := -1;
  FCurrentMessage := -1;
  FTimeStamp := '';
  Port := cDefaultPop3Port;
end;

function TclCustomPop3.GetResponseCode(const AResponse: string): Integer;
begin
  Result := SOCKET_WAIT_RESPONSE;

  if (System.Pos('+ ', AResponse) = 1) or ('+' = Trim(AResponse)) then
  begin
    Result := POP3_CONTINUE;
    Exit;
  end;

  if (system.Pos('+OK', AResponse) = 1) then
  begin
    Result := POP3_OK;
  end else
  if (system.Pos('-ERR', AResponse) = 1) then
  begin
    Result := POP3_ERR;
  end else
  if AResponse = '.' then
  begin
    Result := POP3_DOT;
  end;
end;

procedure TclCustomPop3.USER;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Send USER');{$ENDIF}
  SendCommandSync('USER %s', [POP3_OK], [UserName]);
end;

procedure TclCustomPop3.PASS;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Send PASS');{$ENDIF}
  SendCommandSync('PASS %s', [POP3_OK], [PassWord]);
end;

procedure TclCustomPop3.QUIT;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Send QUIT');{$ENDIF}
  try
    SendCommandSync('QUIT', [POP3_OK]);
  except
    on EclSocketError do ;
  end;
end;

procedure TclCustomPop3.STAT;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Send STAT');{$ENDIF}
  SendCommandSync('STAT', [POP3_OK]);
end;

procedure TclCustomPop3.RETR;
begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Send RETR');{$ENDIF}
  SendCommandSync('RETR %d', [POP3_OK], [FCurrentMessage + 1]);
end;

procedure TclCustomPop3.TOP;
begin
  SendCommandSync('TOP %d 0', [POP3_OK], [FCurrentMessage + 1]);
end;

procedure TclCustomPop3.DELE;
begin
  SendCommandSync('DELE %d', [POP3_OK], [FCurrentMessage + 1]);
end;

procedure TclCustomPop3.UIDL;
begin
  SendCommandSync('UIDL', [POP3_OK]);
end;

procedure TclCustomPop3.LIST;
begin
  SendCommandSync('LIST %d', [POP3_OK], [FCurrentMessage + 1]);
end;

procedure TclCustomPop3.APOP;
begin
  SendCommandSync('APOP %s %s', [POP3_OK], [UserName, GetDigest]);
end;

procedure TclCustomPop3.CramMD5Authenticate;
var
  resp, DecodedResponse: string;
  Encoder: TclEncoder;
begin
  SendCommandSync('AUTH CRAM-MD5', [POP3_OK, POP3_CONTINUE]);
  Encoder := TclEncoder.Create(nil);
  try
    Encoder.SuppressCrlf := True;
    resp := Copy(Response.Text, 3, MaxInt);
    Encoder.DecodeString(resp, DecodedResponse, cmMIMEBase64);
    DecodedResponse := HMAC_MD5(DecodedResponse, Password);
    DecodedResponse := UserName + ' ' + DecodedResponse;
    Encoder.EncodeString(DecodedResponse, resp, cmMIMEBase64);
    SendCommandSync(resp, [POP3_OK]);
  finally
    Encoder.Free();
  end;
end;

procedure TclCustomPop3.NtlmAuthenticate;
var
  sspi: TclNtAuthClientSspi;
  encoder: TclEncoder;
  buf: TStream;
  authIdentity: TclAuthIdentity;
  challenge: string;
begin
  SendCommandSync('AUTH NTLM', [POP3_OK, POP3_CONTINUE]);

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
      SendCommandSync(challenge, [POP3_CONTINUE]);

      challenge := system.Copy(Response.Text, 3, MaxInt);
      buf.Size := 0;
      encoder.DecodeFromString(challenge, buf, cmMIMEBase64);
      buf.Position := 0;
    end;

    if (buf.Size > 0) then
    begin
      buf.Position := 0;
      encoder.EncodeToString(buf, challenge, cmMIMEBase64);
      SendCommandSync(challenge, [POP3_OK]);
    end;
  finally
    authIdentity.Free();
    buf.Free();
    encoder.Free();
    sspi.Free();
  end;
end;

procedure TclCustomPop3.Authenticate;
begin
  SendCommandSync('AUTH', [POP3_OK, POP3_ERR]);
  if (LastResponseCode = POP3_OK) then
  begin
    WaitMultipleLines(0);
    if FindInStrings(Response, 'NTLM') > -1 then
    begin
      NtlmAuthenticate();
    end else
    if FindInStrings(Response, 'CRAM-MD5') > -1 then
    begin
      CramMD5Authenticate();
    end else
    begin
      APOP();
    end;
  end else
  begin
    APOP();
  end;
end;

procedure TclCustomPop3.GetTimeStamp;
var
  s: string;
  P1, P2: Integer;
begin
  FTimeStamp := '';
  s := Response.Text;
  P1 := Pos('<', s);
  P2 := Pos('>', s);
  if (P1 > 0) and (P2 > 0) and (P1 < P2) then
  begin
    FTimeStamp := Copy(s, P1, P2 - P1 + 1);
  end;
end;

function TclCustomPop3.GetMsgCount: Integer;
var
  s: string;
  nn, mm: string;
begin
  Result := 0;
  s := Response.Text;
  if (WordCount(s, [' ']) = 3) then
  begin
    nn := ExtractWord(2, s, [' ']);
    mm := ExtractWord(3, s, [' ']);
    Result := StrToIntDef(nn, 0);
  end;
end;

procedure TclCustomPop3.GetUIDLs(AUIDLs: TStrings);
var
  i, ind: Integer;
  UIDLStr: string;
begin
  AUIDLs.Clear();
  for i := 0 to Response.Count - 1 do
  begin
    UIDLStr := Response[i];
    ind := system.Pos(#32, UIDLStr);
    if (ind > 0) and (StrToIntDef(system.Copy(UIDLStr, 1, ind - 1), 0) > 0) then
    begin
      UIDLStr := system.Copy(UIDLStr, ind + 1, Length(UIDLStr));
      AUIDLs.Add(Trim(UIDLStr));
    end;
  end;
end;

function TclCustomPop3.GetDigest: string;
begin
  Result := '';
  if (FTimeStamp <> '') then
  begin
    Result := MD5(FTimeStamp + Password);
  end;
end;

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

procedure TclCustomPop3.OpenSession;
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
  FMessageCount := -1;
  WaitingResponse([POP3_OK]);
  GetTimeStamp();

  ExplicitStartTls();

  if UseSPA then
  begin
    Authenticate();
  end else
  begin
    USER();
    PASS();
  end;
end;

procedure TclCustomPop3.CloseSession;
begin
  QUIT();
end;

function TclCustomPop3.GetMessageCount: Integer;
begin
  if (FMessageCount < 0) then
  begin
    STAT();
    FMessageCount := GetMsgCount();
  end;
  Result := FMessageCount;
end;

procedure TclCustomPop3.Delete(AIndex: Integer);
begin
  FCurrentMessage := AIndex;
  DELE();
  Dec(FMessageCount);
end;

procedure TclCustomPop3.GetUIDList(AUIDList: TStrings);
begin
  UIDL();
  WaitMultipleLines(0);
  GetUIDLs(AUIDList);
end;

procedure TclCustomPop3.RetrieveHeader(AIndex: Integer);
begin
  RetrieveHeader(AIndex, MailMessage);
end;

procedure TclCustomPop3.RetrieveHeader(AIndex: Integer; AMessage: TclMailMessage);
begin
  FCurrentMessage := AIndex;
  TOP();
  InternalRetrieve(AMessage, 0);
end;

procedure TclCustomPop3.Retrieve(AIndex: Integer);
begin
  Retrieve(AIndex, MailMessage);
end;

procedure TclCustomPop3.Retrieve(AIndex: Integer; AMessage: TclMailMessage);
var
  size: Integer;
begin
  FCurrentMessage := AIndex;
  
  size := 0;
  if Assigned(OnProgress) then
  begin
    size := GetSize(FCurrentMessage);
  end;
  
  RETR();
  InternalRetrieve(AMessage, size);
end;

function TclCustomPop3.GetSize(AIndex: Integer): Integer;
var
  s: string;
begin
  FCurrentMessage := AIndex;
  LIST();
  s := Response.Text;
  s := StringReplace(s, Chr(10), '', []);
  s := StringReplace(s, Chr(13), '', []);
  s := Copy(s, Pos(' ', s) + 1, 100);
  s := Copy(s, Pos(' ', s) + 1, 100);
  Result := StrToIntDef(s, 0);
end;

procedure TclCustomPop3.InternalRetrieve(AMessage: TclMailMessage; ATotalBytes: Integer);
begin
  WaitMultipleLines(ATotalBytes);

  if (AMessage <> nil) then
  begin
    AMessage.MessageSource := Response;
  end;
end;

procedure TclCustomPop3.Reset;
begin
  FMessageCount := -1;
  SendCommandSync('RSET', [POP3_OK]);
end;

function TclCustomPop3.GetUID(AIndex: Integer): string;
begin
  SendCommandSync('UIDL %d', [POP3_OK], [AIndex + 1]);
  Result := Trim(Response.Text);
  if (WordCount(Result, [' ']) = 3) then
  begin
    Result := ExtractWord(3, Result, [' ']);
  end else
  begin
    Result := '';
  end;
end;

procedure TclCustomPop3.StartTls;
begin
  SendCommandSync('STLS', [POP3_OK]);
  inherited StartTls();
end;

function TclCustomPop3.GetDefaultPort: Integer;
begin
  Result := cDefaultPop3Port;
end;

end.

