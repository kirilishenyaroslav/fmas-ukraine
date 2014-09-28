{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clHttpAuth;

interface

{$I clVer.inc}

uses
  Classes, contnrs, clUriUtils, SyncObjs, clSspiAuth;

type
  TclHttpAuthorization = class
  protected
    function GetSupportedAuthMethod(AuthChallenge: TStrings; const AMethod: string): string;
  public
    function Authenticate(AUrl: TclUrlParser; const AMethod, AUserName, APassword: string;
      AuthChallenge: TStrings; AContext: TObject): string; virtual; abstract;
  end;

  TclHttpBasicAuthorization = class(TclHttpAuthorization)
  private
    function BuildAuthorizationString(const AUser, APassword: string): string;
  public
    function Authenticate(AUrl: TclUrlParser; const AMethod, AUserName, APassword: string;
      AuthChallenge: TStrings; AContext: TObject): string; override;
  end;

  TclDigestChallenge = class
  private
    FStale: Boolean;
    FRealm: string;
    FAlgorithm: string;
    FQopOptions: string;
    FNonce: string;
    FDomain: string;
    FOpaque: string;
    FNonceCount: Integer;
    FUserName: string;
    FClientNonce: string;
    FResponse: string;
    FUri: string;
    FMethod: string;
    function BuildAttribute(const AName, AValue: string; ANeedQuite: Boolean = True): string;
  public
    procedure Parse(const AChallenge: string);
    function BuildAuthorization: string;
    property Realm: string read FRealm write FRealm;
    property Domain: string read FDomain write FDomain;
    property Nonce: string read FNonce write FNonce;
    property Opaque: string read FOpaque write FOpaque;
    property Stale: Boolean read FStale write FStale;
    property Algorithm: string read FAlgorithm write FAlgorithm;
    property QopOptions: string read FQopOptions write FQopOptions;

    property UserName: string read FUserName write FUserName;
    property Uri: string read FUri write FUri;
    property ClientNonce: string read FClientNonce write FClientNonce;
    property NonceCount: Integer read FNonceCount write FNonceCount;
    property Response: string read FResponse write FResponse;
    property Method: string read FMethod write FMethod;
  end;

  TclHttpDigestAuthorization = class(TclHttpAuthorization)
  private
    function BuildAuthorizationString(AUrl: TclUrlParser; const AMethod, AChallenge,
      AUserName, APassword: string): string;
    function CreateNonce: string;
    function CreateResponse(AChallenge: TclDigestChallenge; const AUserName, APassword: string): string;
    function ComputeData(AChallenge: TclDigestChallenge): string;
    function ComputeSectret(AChallenge: TclDigestChallenge;
      const AUserName, APassword: string): string;
  public
    function Authenticate(AUrl: TclUrlParser; const AMethod, AUserName, APassword: string;
      AuthChallenge: TStrings; AContext: TObject): string; override;
  end;

  TclHttpNtlmAuthorization = class(TclHttpAuthorization)
  private
    FSessions: TStrings;
    FAccessor: TCriticalSection;
    function BuildAuthorizationString(ASession: TclNtAuthClientSspi;
      AUrl: TclUrlParser; const APackage, AChallenge, AUserName, APassword: string;
      var ACompleted: Boolean): string;
  public
    constructor Create;
    destructor Destroy; override;
    function Authenticate(AUrl: TclUrlParser; const AMethod, AUserName, APassword: string;
      AuthChallenge: TStrings; AContext: TObject): string; override;
    procedure CloseSessions;
  end;
  
function GetRegisteredAuthorizations: TObjectList;
procedure RegisterAuthorization(Authorization: TclHttpAuthorization);

implementation

uses
  SysUtils, clEncoder, clUtils, clCryptUtils, Windows;

var
  RegisteredAuthorizations: TObjectList = nil;

function GetRegisteredAuthorizations: TObjectList;
begin
  if (RegisteredAuthorizations = nil) then
  begin
    RegisteredAuthorizations := TObjectList.Create();
  end;
  Result := RegisteredAuthorizations;
end;

procedure RegisterAuthorization(Authorization: TclHttpAuthorization);
begin
  GetRegisteredAuthorizations().Add(Authorization);
end;
  
{ TclHttpAuthorization }

function TclHttpAuthorization.GetSupportedAuthMethod(AuthChallenge: TStrings;
  const AMethod: string): string;
var
  i: Integer;
  s: string;
begin
  s := LowerCase(AMethod);
  for i := 0 to AuthChallenge.Count - 1 do
  begin
    if (system.Pos(s, LowerCase(AuthChallenge[i])) > 0) then
    begin
      Result := AuthChallenge[i];
      Exit;
    end;
  end;
  Result := '';
end;

{ TclHttpBasicAuthorization }

function TclHttpBasicAuthorization.Authenticate(AUrl: TclUrlParser;
  const AMethod, AUserName, APassword: string; AuthChallenge: TStrings; AContext: TObject): string;
begin
  Result := GetSupportedAuthMethod(AuthChallenge, 'basic');
  if (Result <> '') then
  begin
    Result := BuildAuthorizationString(AUserName, APassword);
  end;
end;

function TclHttpBasicAuthorization.BuildAuthorizationString(const AUser, APassword: string): string;
var
  s: string;
  encoder: TclEncoder;
begin
  s := AUser;
  if (s <> '') then
  begin
    s := s + ':';
  end;
  s := s + APassword;
  encoder := TclEncoder.Create(nil);
  try
    encoder.EncodeString(s, Result, cmMIMEBase64);
  finally
    encoder.Free();
  end;
  Result := 'Basic ' + Result;
end;

{ TclHttpDigestAuthorization }

function TclHttpDigestAuthorization.Authenticate(AUrl: TclUrlParser;
  const AMethod, AUserName, APassword: string; AuthChallenge: TStrings; AContext: TObject): string;
begin
  Result := GetSupportedAuthMethod(AuthChallenge, 'digest');
  if (Result <> '') then
  begin
    Result := BuildAuthorizationString(AUrl, AMethod, Result, AUserName, APassword);
  end;
end;

function TclHttpDigestAuthorization.CreateNonce: string;
var
  y, mm, d, h, m, s, ms: Word;
begin
  DecodeTime(Now(), h, m, s, ms);
  DecodeDate(Date(), y, mm, d);
  Result := IntToHex(mm, 2) + IntToHex(d, 2) + IntToHex(h, 2) + IntToHex(m, 2);
  Result := Result + IntToHex(s, 2) + IntToHex(ms, 4);
  Result := Result + IntToHex(GetTickCount(), 8) + IntToHex(GetTickCount() + 1, 8);
  Result := 'ab' + LowerCase(Result);
end;

function TclHttpDigestAuthorization.ComputeSectret(AChallenge: TclDigestChallenge;
  const AUserName, APassword: string): string;
begin
  Result := '';

  if (AUserName = '') then Exit;

  if (AChallenge.Algorithm = '') or SameText('md5', AChallenge.Algorithm) then
  begin
    Result := AUserName + ':' + AChallenge.Realm + ':' + APassword;
  end else
  if SameText('md5-sess', AChallenge.Algorithm) then
  begin
    Result := AUserName + ':' + AChallenge.Realm + ':' + APassword;
    Result := MD5(Result) + ':' + AChallenge.Nonce + ':' + AChallenge.ClientNonce;
  end;
end;

function TclHttpDigestAuthorization.ComputeData(AChallenge: TclDigestChallenge): string;
var
  options: TStrings;
begin
  Result := '';

  options := TStringList.Create();
  try
    options.Text := StringReplace(LowerCase(AChallenge.QopOptions), ',', #13#10, [rfReplaceAll]);
    if (options.IndexOf('auth') > -1) then
    begin
      Result := AChallenge.Method + ':' + AChallenge.Uri;
      AChallenge.QopOptions := 'auth';
    end;
  finally
    options.Free();
  end;
end;

function TclHttpDigestAuthorization.CreateResponse(AChallenge: TclDigestChallenge;
  const AUserName, APassword: string): string;
var
  secret, data: string;
begin
  secret := ComputeSectret(AChallenge, AUserName, APassword);
  data := ComputeData(AChallenge);
  if (secret = '') or (data = '') then
  begin
    Result := '';
    Exit;
  end;

  secret := MD5(secret);
  data := MD5(data);

  Result := AChallenge.Nonce + ':';
  if (AChallenge.QopOptions <> '') then
  begin
    Result := Result + IntToHex(AChallenge.NonceCount, 8) + ':'
      + AChallenge.ClientNonce + ':' + AChallenge.QopOptions + ':';
  end;
  Result := Result + data;
  
  Result := MD5(secret + ':' + Result);
end;

function TclHttpDigestAuthorization.BuildAuthorizationString(AUrl: TclUrlParser;
  const AMethod, AChallenge, AUserName, APassword: string): string;
var
  challenge: TclDigestChallenge;
begin
  Result := '';

  if (AUserName = '') then Exit;

  challenge := TclDigestChallenge.Create();
  try
    challenge.Parse(AChallenge);

    if (challenge.QopOptions <> '') then
    begin
      if (challenge.ClientNonce = '') or challenge.Stale then
      begin
        challenge.ClientNonce := CreateNonce();
        challenge.NonceCount := 1;
      end else
      begin
        challenge.NonceCount := challenge.NonceCount + 1;
      end;
    end;
    challenge.Method := AMethod;
    challenge.UserName := AUserName;
    challenge.Uri := AUrl.AbsolutePath;
    challenge.Response := CreateResponse(challenge, AUserName, APassword);

    if (challenge.Response <> '') then
    begin
      Result := challenge.BuildAuthorization();
    end;
  finally
    challenge.Free();
  end;
end;

{ TclDigestChallenge }

function TclDigestChallenge.BuildAttribute(const AName, AValue: string; ANeedQuite: Boolean): string;
const
  quotes: array[Boolean] of string = ('', '"');
begin
  if (AValue <> '') then
  begin
    Result := AName + '=' + quotes[ANeedQuite] + AValue + quotes[ANeedQuite] + ', ';
  end else
  begin
    Result := '';
  end;
end;

function TclDigestChallenge.BuildAuthorization: string;
begin
  Result := BuildAttribute('username', UserName) + BuildAttribute('realm', Realm);
  if (QopOptions <> '') then
  begin
    Result := Result + BuildAttribute('qop', QopOptions) + BuildAttribute('algorithm', Algorithm);
  end;
  Result := Result + BuildAttribute('uri', Uri) + BuildAttribute('nonce', Nonce);
  if (QopOptions <> '') then
  begin
    Result := Result + BuildAttribute('nc', IntToHex(NonceCount, 8), False) + BuildAttribute('cnonce', ClientNonce);
  end;
  Result := Result + BuildAttribute('opaque', Opaque) + BuildAttribute('response', Response);
  if (Result <> '') then
  begin
    SetLength(Result, Length(Result) - Length(', '));
  end;
  Result := 'Digest ' + Result;
end;

procedure TclDigestChallenge.Parse(const AChallenge: string);
var
  s: string;
begin
  FRealm := GetHeaderFieldValueItem(AChallenge, 'realm=');
  FDomain := GetHeaderFieldValueItem(AChallenge, 'domain=');
  FNonce := GetHeaderFieldValueItem(AChallenge, 'nonce=');
  FOpaque := GetHeaderFieldValueItem(AChallenge, 'opaque=');
  FStale := SameText('true', GetHeaderFieldValueItem(AChallenge, 'stale='));
  FAlgorithm := GetHeaderFieldValueItem(AChallenge, 'algorithm=');
  FQopOptions := GetHeaderFieldValueItem(AChallenge, 'qop=');
  FUserName := GetHeaderFieldValueItem(AChallenge, 'username=');
  FUri := GetHeaderFieldValueItem(AChallenge, 'uri=');
  FClientNonce := GetHeaderFieldValueItem(AChallenge, 'cnonce=');
  s := GetHeaderFieldValueItem(AChallenge, 'nc=');
  if (s <> '') then
  begin
    s := '$' + s;
  end;
  FNonceCount := StrToIntDef(s, 0);
  FResponse := GetHeaderFieldValueItem(AChallenge, 'response=');
end;

{ TclHttpNtlmAuthorization }

function TclHttpNtlmAuthorization.Authenticate(AUrl: TclUrlParser;
  const AMethod, AUserName, APassword: string; AuthChallenge: TStrings; AContext: TObject): string;
var
  ind: Integer;
  sspiSession: TclNtAuthClientSspi;
  completed: Boolean;
  package: string;
begin
  package := 'Negotiate';
  Result := GetSupportedAuthMethod(AuthChallenge, package);
  if (Result = '') then
  begin
    package := 'NTLM';
    Result := GetSupportedAuthMethod(AuthChallenge, package);
  end;
  if (Result = '') then Exit;

  FAccessor.Enter();
  try
    ind := FSessions.IndexOf(IntToStr(Integer(AContext)));
    if (ind < 0) then
    begin
      sspiSession := TclNtAuthClientSspi.Create();
      FSessions.AddObject(IntToStr(Integer(AContext)), sspiSession);
    end else
    begin
      sspiSession := TclNtAuthClientSspi(FSessions.Objects[ind]);
    end;

    Result := BuildAuthorizationString(sspiSession, AUrl, package, Result, AUserName, APassword, completed);
    if completed then
    begin
      sspiSession.Free();
      if (ind < 0) then
      begin
        ind := FSessions.Count - 1;
      end;
      FSessions.Delete(ind);
    end;
  finally
    FAccessor.Leave();
  end;
end;

function TclHttpNtlmAuthorization.BuildAuthorizationString(ASession: TclNtAuthClientSspi;
   AUrl: TclUrlParser; const APackage, AChallenge, AUserName, APassword: string;
   var ACompleted: Boolean): string;
var
  ind: Integer;
  inputChallenge: string;
  encoder: TclEncoder;
  buf: TStream;
  authIdentity: TclAuthIdentity;
begin
  ACompleted := True;
  Result := '';
  inputChallenge := Trim(AChallenge);
  ind := system.Pos(UpperCase(APackage), UpperCase(inputChallenge));

  if (ind <> 1) then Exit;
  inputChallenge := Trim(system.Copy(inputChallenge, Length(APackage) + 1, Length(inputChallenge)));

  encoder := nil;
  buf := nil;
  authIdentity := nil;
  try
    encoder := TclEncoder.Create(nil);
    encoder.SuppressCrlf := True;
    buf := TMemoryStream.Create();

    encoder.DecodeFromString(inputChallenge, buf, cmMIMEBase64);
    buf.Position := 0;

    if (AUserName <> '') then
    begin
      authIdentity := TclAuthIdentity.Create(AUserName, APassword);
    end;

    ACompleted := ASession.GenChallenge(APackage, buf, 'HTTP/' + AUrl.Host, authIdentity);

    buf.Position := 0;
    encoder.EncodeToString(buf, Result, cmMIMEBase64);
    Result := APackage + ' ' + Result;
  finally
    authIdentity.Free();
    buf.Free();
    encoder.Free();
  end;
end;

constructor TclHttpNtlmAuthorization.Create;
begin
  inherited Create();
  FAccessor := TCriticalSection.Create();
  FSessions := TStringList.Create();
end;

destructor TclHttpNtlmAuthorization.Destroy;
begin
  CloseSessions();
  FSessions.Free();
  FAccessor.Free();
  inherited Destroy();
end;

procedure TclHttpNtlmAuthorization.CloseSessions;
var
  i: Integer;
begin
  FAccessor.Enter();
  try
    for i := FSessions.Count - 1 downto 0 do
    begin
      FSessions.Objects[i].Free();
    end;
    FSessions.Clear();
  finally
    FAccessor.Leave();
  end;
end;

initialization
  RegisterAuthorization(TclHttpBasicAuthorization.Create());
  RegisterAuthorization(TclHttpDigestAuthorization.Create());
  RegisterAuthorization(TclHttpNtlmAuthorization.Create());

finalization
  RegisteredAuthorizations.Free();

end.
