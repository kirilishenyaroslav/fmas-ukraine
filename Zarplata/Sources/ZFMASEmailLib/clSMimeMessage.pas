{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSMimeMessage;

interface

{$I clVer.inc}

uses
  Classes, SysUtils, clMailMessage, clCert, clCryptAPI, clEncoder;

type
  TclSMimeBody = class(TclMessageBody)
  private
    FSource: TStrings;
    FBoundary: string;
    procedure SetSource(const Value: TStrings);
    procedure SetBoundary(const Value: string);
    function GetHeader: TStrings;
    procedure SetHeader(const Value: TStrings);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure AssignBodyHeader(ASource: TStrings); override;
    procedure ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings); override;
    function GetSourceStream: TStream; override;
    function GetDestinationStream: TStream; override;
    procedure BeforeDataAdded(AData: TStream); override; 
    procedure DataAdded(AData: TStream); override;
    procedure DecodeData(ASource, ADestination: TStream); override;
    procedure EncodeData(ASource, ADestination: TStream); override;
    procedure DoCreate; override;
  public
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear(); override;
    property Header: TStrings read GetHeader write SetHeader;
    property Source: TStrings read FSource write SetSource;
    property Boundary: string read FBoundary write SetBoundary;
  end;

  TclEnvelopedBody = class(TclAttachmentBody)
  private
    FData: TclCryptData;
    procedure SetData(const Value: TclCryptData);
  protected
    function GetSourceStream: TStream; override;
    function GetDestinationStream: TStream; override;
    procedure DataAdded(AData: TStream); override;
    procedure DoCreate; override;
  public
    destructor Destroy; override;
    procedure Clear(); override;
    property Data: TclCryptData read FData write SetData;
  end;

  TclSMimeMessage = class(TclMailMessage)
  private
    FSMimeContentType: string;
    FIsDetachedSignature: Boolean;
    FIsIncludeCertificate: Boolean;
    FOnGetCertificate: TclOnGetCertificateEvent;
    FCertificates: TclCertificateStore;
    FInternalCertStore: TclCertificateStore;
    FIsSecuring: Boolean;
    procedure SetSMimeContentType(const Value: string);
    function GetIsEncrypted: Boolean;
    function GetIsSigned: Boolean;
    function GetCertificate(const AStoreName: string; IsUseSender: Boolean): TclCertificate;
    function GetEncryptCertificates(const AStoreName: string): TclCertificateStore;
    procedure SetIsDetachedSignature(const Value: Boolean);
    procedure SetIsIncludeCertificate(const Value: Boolean);
    procedure SignEnveloped(ACertificate: TclCertificate);
    procedure SignDetached(ACertificate: TclCertificate);
    procedure VerifyDetached;
    procedure VerifyEnveloped;
    function GetRecipientCertificate(const AStoreName: string;
      AEmailList: TStrings): TclCertificate;
    procedure InternalVerify;
    procedure InternalDecrypt;
    function GetEmailCertificate(const AFullEmail,
      AStoreName: string): TclCertificate;
  protected
    procedure DoGetCertificate(var ACertificate: TclCertificate;
      var Handled: Boolean); dynamic;
    procedure ParseContentType(ASource, AFieldList: TStrings); override;
    procedure AssignContentType(ASource: TStrings); override;
    function GetIsMultiPartContent: Boolean; override;
    function CreateBody(ABodies: TclMessageBodies;
      const AContentType, ADisposition: string): TclMessageBody; override;
    function CreateSingleBody(ASource: TStrings; ABodies: TclMessageBodies): TclMessageBody; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
    procedure Sign;
    procedure Verify;
    procedure Encrypt;
    procedure Decrypt;
    procedure DecryptAndVerify;
    property IsEncrypted: Boolean read GetIsEncrypted;
    property IsSigned: Boolean read GetIsSigned;
    property Certificates: TclCertificateStore read FCertificates;
  published
    property IsDetachedSignature: Boolean read FIsDetachedSignature write SetIsDetachedSignature default True;
    property IsIncludeCertificate: Boolean read FIsIncludeCertificate write SetIsIncludeCertificate default True;
    property SMimeContentType: string read FSMimeContentType write SetSMimeContentType;
    property OnGetCertificate: TclOnGetCertificateEvent read FOnGetCertificate write FOnGetCertificate;
  end;

implementation

uses
  clUtils, Windows{$IFDEF DEMO}, Forms{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

{ TclSMimeMessage }

procedure TclSMimeMessage.AssignContentType(ASource: TStrings);
begin
  if IsEncrypted or (IsSigned and not IsDetachedSignature) then
  begin
    AddHeaderArrayField(ASource, [ContentType,
      'smime-type=' + SMimeContentType,
      'boundary="' + Boundary + '"',
      'name="smime.p7m"'], 'Content-Type', ';');
    AddHeaderArrayField(ASource, ['attachment',
      'filename="smime.p7m"'], 'Content-Disposition', ';');
  end else
  if (IsSigned and IsDetachedSignature) then
  begin
    AddHeaderArrayField(ASource, [ContentType,
      'boundary="' + Boundary + '"',
      'protocol="application/x-pkcs7-signature"',
      'micalg=SHA1'], 'Content-Type', ';');
  end else
  begin
    inherited AssignContentType(ASource);
  end;
end;

procedure TclSMimeMessage.Clear;
begin
  BeginUpdate();
  try
    if not FIsSecuring then
    begin
      Certificates.Close();
    end;
    SMimeContentType := '';
    inherited Clear();
  finally
    EndUpdate();
  end;
end;

constructor TclSMimeMessage.Create(AOwner: TComponent);
begin
  FInternalCertStore := TclCertificateStore.Create(nil);
  FCertificates := TclCertificateStore.Create(nil);
  FCertificates.StoreName := 'addressbook';
  inherited Create(AOwner);
  FIsDetachedSignature := True;
  FIsIncludeCertificate := True;
  FIsSecuring := False;
end;

procedure TclSMimeMessage.Decrypt;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  InternalDecrypt();
end;

procedure TclSMimeMessage.DecryptAndVerify;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DecryptAndVerify');{$ENDIF}
  repeat
    if IsEncrypted then
    begin
      InternalDecrypt();
    end else
    if IsSigned then
    begin
      InternalVerify();
    end else
    begin
      Break;
    end;
  until False;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DecryptAndVerify'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DecryptAndVerify', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.DoGetCertificate(var ACertificate: TclCertificate;
  var Handled: Boolean);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoGetCertificate');{$ENDIF}
  if Assigned(OnGetCertificate) then
  begin
    OnGetCertificate(Self, ACertificate, Handled);
{$IFDEF LOGGER}clPutLogMessage(Self, edEnter, 'DoGetCertificate - event exists, cert: %d, handled: %d', nil, [Integer(ACertificate), Integer(Handled)]);{$ENDIF}
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoGetCertificate'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoGetCertificate', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.Encrypt;
var
  certs: TclCertificateStore;
  srcData, encData: TclCryptData;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Encrypt');{$ENDIF}

  if IsEncrypted then
  begin
    raise EclMailMessageError.Create(cMessageEncrypted);
  end;
  FIsSecuring := True;
  srcData := nil;
  certs := nil;
  BeginUpdate();
  try
    certs := GetEncryptCertificates('addressbook');

    srcData := TclCryptData.Create();
    srcData.AssignByStrings(MessageSource);
    encData := certs.Encrypt(srcData);
    try
      Bodies.Clear();
      TclEnvelopedBody.Create(Bodies).Data := encData;
    except
      encData.Free();
      raise;
    end;
    ContentType := 'application/x-pkcs7-mime';
    SMimeContentType := 'enveloped-data';
    Encoding := cmMIMEBase64;
  finally
    srcData.Free();
    certs.Free();
    EndUpdate();
    FIsSecuring := False;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Encrypt'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Encrypt', E); raise; end; end;{$ENDIF}
end;

function TclSMimeMessage.GetEmailCertificate(const AFullEmail,
  AStoreName: string): TclCertificate;
  
  function GetCertificateByStore(AStore: TclCertificateStore; const AEmail: string): TclCertificate;
  begin
    try
      Result := AStore.CertificateByEmail(AEmail);
    except
      on EclCryptError do
      begin
        Result := nil;
      end;
    end;
  end;

var
  name, email: string;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'GetEmailCertificate, email: %s, store: %s', nil, [AFullEmail, AStoreName]);{$ENDIF}
  GetEmailAddressParts(AFullEmail, name, email);
  Result := GetCertificateByStore(Certificates, email);
  if (Result = nil) then
  begin
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'GetEmailCertificate before FInternalCertStore');{$ENDIF}
    FInternalCertStore.LoadFromSystemStore(AStoreName);
    Result := GetCertificateByStore(FInternalCertStore, email);
  end;

{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'GetEmailCertificate before return, Result: %d', nil, [Integer(Result)]);{$ENDIF}

{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'GetEmailCertificate'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'GetEmailCertificate', E); raise; end; end;{$ENDIF}
end;

function TclSMimeMessage.GetRecipientCertificate(const AStoreName: string;
  AEmailList: TStrings): TclCertificate;
var
  i: Integer;
begin
  for i := 0 to AEmailList.Count - 1 do
  begin
    Result := GetEmailCertificate(AEmailList[i], AStoreName);
    if (Result <> nil) then Exit;
  end;
  Result := nil;
end;

function TclSMimeMessage.GetCertificate(const AStoreName: string; IsUseSender: Boolean): TclCertificate;
var
  handled: Boolean;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'GetCertificate, storename: %s, usesender %d', nil, [AStoreName, Integer(IsUseSender)]);{$ENDIF}
  Result := nil;
  handled := False;
  DoGetCertificate(Result, handled);
  if (Result = nil) then
  begin
    if IsUseSender then
    begin
      Result := GetEmailCertificate(From, AStoreName);
    end else
    begin
      Result := GetRecipientCertificate(AStoreName, ToList);
      if (Result = nil) then
      begin
        Result := GetRecipientCertificate(AStoreName, CcList);
      end;
      if (Result = nil) then
      begin
        Result := GetRecipientCertificate(AStoreName, BccList);
      end;
    end;
  end;
  if (Result = nil) then
  begin
    raise EclMailMessageError.Create(cCertificateRequired);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'GetCertificate'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'GetCertificate', E); raise; end; end;{$ENDIF}
end;

function TclSMimeMessage.GetIsEncrypted: Boolean;
begin
  Result := (Pos('pkcs7-mime', LowerCase(ContentType)) > 0)
    and (not SameText(SMimeContentType, 'signed-data'));
end;

function TclSMimeMessage.GetIsMultiPartContent: Boolean;
begin
  Result := inherited GetIsMultiPartContent() and not IsEncrypted;
  if IsParse then
  begin
    Result := Result and not (IsSigned and (LowerCase(ContentType) <> 'multipart/signed'));
  end else
  begin
    Result := Result and not (IsSigned and not IsDetachedSignature);
  end;
end;

function TclSMimeMessage.GetIsSigned: Boolean;
begin
  Result := SameText(ContentType, 'multipart/signed')
    or ((Pos('pkcs7-mime', LowerCase(ContentType)) > 0) and SameText(SMimeContentType, 'signed-data'));
end;

function TclSMimeMessage.CreateSingleBody(ASource: TStrings; ABodies: TclMessageBodies): TclMessageBody;
begin
  if IsEncrypted or (IsSigned and (LowerCase(ContentType) <> 'multipart/signed')) then
  begin
    Result := TclEnvelopedBody.Create(ABodies);
  end else
  begin
    Result := inherited CreateSingleBody(ASource, ABodies);
  end;
end;

procedure TclSMimeMessage.ParseContentType(ASource, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseContentType(ASource, AFieldList);
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  SMimeContentType := GetHeaderFieldValueItem(s, 'smime-type=');
end;

procedure TclSMimeMessage.SetIsDetachedSignature(const Value: Boolean);
begin
  if (FIsDetachedSignature <> Value) then
  begin
    FIsDetachedSignature := Value;
    Update();
  end;
end;

procedure TclSMimeMessage.SetIsIncludeCertificate(const Value: Boolean);
begin
  if (FIsIncludeCertificate <> Value) then
  begin
    FIsIncludeCertificate := Value;
    Update();
  end;
end;

procedure TclSMimeMessage.SetSMimeContentType(const Value: string);
begin
  if (FSMimeContentType <> Value) then
  begin
    FSMimeContentType := Value;
    Update();
  end;
end;

procedure TclSMimeMessage.SignEnveloped(ACertificate: TclCertificate);
var
  srcData, signedData: TclCryptData;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'SignEnveloped');{$ENDIF}
  srcData := TclCryptData.Create();
  try
    srcData.AssignByStrings(MessageSource);

    signedData := ACertificate.Sign(srcData, IsDetachedSignature, IsIncludeCertificate);
    try
      Bodies.Clear();
      TclEnvelopedBody.Create(Bodies).Data := signedData;
    except
      signedData.Free();
      raise;
    end;

    ContentType := 'application/x-pkcs7-mime';
    SMimeContentType := 'signed-data';
    Encoding := cmMIMEBase64;
  finally
    srcData.Free();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'SignEnveloped'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'SignEnveloped', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.SignDetached(ACertificate: TclCertificate);
var
  i, ind: Integer;
  srcData, signedData: TclCryptData;
  oldIncludeRFC822: Boolean;
  srcStrings, FieldList: TStrings;
  cryptBody: TclSMimeBody;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'SignDetached');{$ENDIF}
  srcData := nil;
  srcStrings := nil;
  FieldList := nil;
  oldIncludeRFC822 := IncludeRFC822Header;
  try
    srcData := TclCryptData.Create();
    srcStrings := TStringList.Create();
    IncludeRFC822Header := False;
    InternalAssignHeader(srcStrings);
    InternalAssignBodies(srcStrings);

    srcStrings.Add('');
    srcData.AssignByStrings(srcStrings);
    srcStrings.Delete(srcStrings.Count - 1);

    signedData := ACertificate.Sign(srcData, IsDetachedSignature, IsIncludeCertificate);
    try
      Bodies.Clear();

      cryptBody := TclSMimeBody.Create(Bodies);

      FieldList := TStringList.Create();
      ind := GetHeaderFieldList(0, srcStrings, FieldList);
      cryptBody.ParseBodyHeader(ind, srcStrings, FieldList);

      ind := ParseAllHeaders(0, srcStrings, cryptBody.Header);
      ParseExtraFields(cryptBody.Header, cryptBody.KnownFields, cryptBody.ExtraFields);
      for i := ind + 1 to srcStrings.Count - 1 do
      begin
        cryptBody.Source.Add(srcStrings[i]);
      end;

      TclEnvelopedBody.Create(Bodies).Data := signedData;
    except
      signedData.Free();
      raise;
    end;
  finally
    IncludeRFC822Header := oldIncludeRFC822;
    FieldList.Free();
    srcStrings.Free();
    srcData.Free();
  end;

  ContentType := 'multipart/signed';
  SMimeContentType := '';
  Encoding := cmNone;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'SignDetached'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'SignDetached', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.Sign;
var
  cert: TclCertificate;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Sign');{$ENDIF}

  if IsSigned then
  begin
    raise EclMailMessageError.Create(cMessageSigned);
  end;
  FIsSecuring := True;
  BeginUpdate();
  try
    cert := GetCertificate('MY', True);
    if IsDetachedSignature then
    begin
      SignDetached(cert);
    end else
    begin
      SignEnveloped(cert);
    end;
  finally
    EndUpdate();
    FIsSecuring := False;
  end;

{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Sign'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Sign', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.Verify;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  InternalVerify();
end;

function TclSMimeMessage.CreateBody(ABodies: TclMessageBodies;
  const AContentType, ADisposition: string): TclMessageBody;
begin
  if IsSigned then
  begin
    if (LowerCase(ADisposition) = 'attachment')
      and (system.Pos('-signature', LowerCase(AContentType)) > 1) then
    begin
      Result := TclEnvelopedBody.Create(ABodies);
    end else
    begin
      Result := TclSMimeBody.Create(ABodies);
    end;
  end else
  begin
    Result := inherited CreateBody(ABodies, AContentType, ADisposition);
  end;
end;

procedure TclSMimeMessage.VerifyDetached;
var
  cert: TclCertificate;
  msg: TStrings;
  mimeBody: TclSMimeBody;
  srcData: TclCryptData;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'VerifyDetached');{$ENDIF}
  srcData := nil;
  msg := nil;
  try
    srcData := TclCryptData.Create();
    msg := TStringList.Create();
    Assert(Bodies.Count = 2);
    mimeBody := (Bodies[0] as TclSMimeBody);
    msg.AddStrings(mimeBody.Header);
    msg.Add('');
    msg.AddStrings(mimeBody.Source);

    srcData.AssignByStrings(msg);

    Certificates.AddFromBinary((Bodies[1] as TclEnvelopedBody).Data);
    cert := GetCertificate('addressbook', True);
    cert.VerifyDetached(srcData, (Bodies[1] as TclEnvelopedBody).Data);

    ContentType := mimeBody.ContentType;
    SetBoundary(mimeBody.Boundary);

    Bodies.Clear();

    ParseBodies(msg);
  finally
    msg.Free();
    srcData.Free();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'VerifyDetached'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'VerifyDetached', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.VerifyEnveloped;
var
  cert: TclCertificate;
  verified: TclCryptData;
  msg: TStrings;
  s: string;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'VerifyEnveloped');{$ENDIF}
  msg := nil;
  verified := nil;
  try
    Assert(Bodies.Count = 1);

    Certificates.AddFromBinary((Bodies[0] as TclEnvelopedBody).Data);
    cert := GetCertificate('addressbook', True);

    verified := cert.VerifyEnveloped((Bodies[0] as TclEnvelopedBody).Data);
    msg := TStringList.Create();
    SetLength(s, verified.DataSize);
    CopyMemory(PChar(s), verified.Data, verified.DataSize);
    msg.Text := s;
    MessageSource := msg;
  finally
    msg.Free();
    verified.Free();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'VerifyEnveloped'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'VerifyEnveloped', E); raise; end; end;{$ENDIF}
end;

destructor TclSMimeMessage.Destroy;
begin
  inherited Destroy();
  FCertificates.Free();
  FInternalCertStore.Free();
end;

procedure TclSMimeMessage.InternalDecrypt;
var
  cert: TclCertificate;
  decrypted: TclCryptData;
  msg: TStrings;
  s: string;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InternalDecrypt');{$ENDIF}
  if not IsEncrypted then
  begin
    raise EclMailMessageError.Create(cMessageNotEncrypted);
  end;
  FIsSecuring := True;
  msg := nil;
  decrypted := nil;
  BeginUpdate();
  try
    Assert(Bodies.Count = 1);

    Certificates.AddFromBinary((Bodies[0] as TclEnvelopedBody).Data);
    cert := GetCertificate('MY', False);

    decrypted := cert.Decrypt((Bodies[0] as TclEnvelopedBody).Data);
    msg := TStringList.Create();

    SetLength(s, decrypted.DataSize);
    CopyMemory(PChar(s), decrypted.Data, decrypted.DataSize);

    msg.Text := s;
    MessageSource := msg;
    SMimeContentType := '';
  finally
    msg.Free();
    decrypted.Free();
    EndUpdate();
    FIsSecuring := False;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InternalDecrypt'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InternalDecrypt', E); raise; end; end;{$ENDIF}
end;

procedure TclSMimeMessage.InternalVerify;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InternalVerify');{$ENDIF}
  if not IsSigned then
  begin
    raise EclMailMessageError.Create(cMessageNotSigned);
  end;
  FIsSecuring := True;
  BeginUpdate();
  try
    if (LowerCase(ContentType) = 'multipart/signed') then
    begin
      VerifyDetached();
    end else
    begin
      VerifyEnveloped();
    end;
  finally
    EndUpdate();
    FIsSecuring := False;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InternalVerify'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InternalVerify', E); raise; end; end;{$ENDIF}
end;

function TclSMimeMessage.GetEncryptCertificates(const AStoreName: string): TclCertificateStore;

  procedure FillRecipientCerts(AStore: TclCertificateStore; const AStoreName: string; AEmailList: TStrings);
  var
    i: Integer;
    cert: TclCertificate;
  begin
    for i := 0 to AEmailList.Count - 1 do
    begin
      cert := GetEmailCertificate(AEmailList[i], AStoreName);
      if (cert = nil) then
      begin
        raise EclCryptError.Create(cCertificateNotFound, -1);
      end;
      AStore.AddFrom(cert);
    end;
  end;

var
  handled: Boolean;
  cert: TclCertificate;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'GetEncryptCertificates: ' + AStoreName);{$ENDIF}
  Result := TclCertificateStore.Create(nil);
  handled := False;
  cert := nil;
  DoGetCertificate(cert, handled);
  if (cert = nil) then
  begin
    FillRecipientCerts(Result, AStoreName, ToList);
    FillRecipientCerts(Result, AStoreName, CcList);
    FillRecipientCerts(Result, AStoreName, BccList);
  end else
  begin
    Result.AddFrom(cert);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'GetEncryptCertificates, certcount: %d', nil, [Result.Count]);{$ENDIF}
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'GetEncryptCertificates'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'GetEncryptCertificates', E); raise; end; end;{$ENDIF}
end;

{ TclEnvelopedBody }

procedure TclEnvelopedBody.Clear;
begin
  inherited Clear();
  FileName := 'smime.p7s';
  ContentType := 'application/x-pkcs7-signature';
  Encoding := cmMIMEBase64;
end;

procedure TclEnvelopedBody.DataAdded(AData: TStream);
var
  p: Pointer;
begin
  Data.Allocate(AData.Size);
  p := Data.Data;
  AData.Position := 0;
  AData.Read(p^, Data.DataSize);
  inherited DataAdded(AData);
end;

destructor TclEnvelopedBody.Destroy;
begin
  FData.Free();
  inherited Destroy();
end;

procedure TclEnvelopedBody.DoCreate;
begin
  inherited DoCreate();
  FData := TclCryptData.Create();
end;

function TclEnvelopedBody.GetDestinationStream: TStream;
begin
  Result := TMemoryStream.Create();
end;

function TclEnvelopedBody.GetSourceStream: TStream;
begin
  Result := TMemoryStream.Create();
  Result.WriteBuffer(Data.Data^, Data.DataSize);
  Result.Position := 0;
end;

procedure TclEnvelopedBody.SetData(const Value: TclCryptData);
begin
  FData.Free();
  FData := Value;
  GetMailMessage().Update();
end;

{ TclSMimeBody }

procedure TclSMimeBody.Assign(Source: TPersistent);
begin
  if (Source is TclSMimeBody) then
  begin
    Source.Assign((Source as TclSMimeBody).Source);
    Boundary := (Source as TclSMimeBody).Boundary;
  end;
  inherited Assign(Source);
end;

procedure TclSMimeBody.AssignBodyHeader(ASource: TStrings);
begin
  ASource.AddStrings(Header);
  if (Header.Count > 0) then Exit;

  if (ContentType <> '') and (Boundary <> '') then
  begin
    AddHeaderArrayField(ASource, [ContentType, 'boundary="' + Boundary + '"'], 'Content-Type', ';');
  end;
  ASource.AddStrings(ExtraFields);
end;

procedure TclSMimeBody.BeforeDataAdded(AData: TStream);
begin
end;

procedure TclSMimeBody.Clear;
begin
  inherited Clear();
  Source.Clear();
  Boundary := '';
end;

procedure TclSMimeBody.DataAdded(AData: TStream);
var
  s: string;
begin
  SetString(s, nil, AData.Size);
  AData.Position := 0;
  AData.Read(PChar(s)^, AData.Size);
  AddTextStr(FSource, s);
  inherited DataAdded(AData);
end;

procedure TclSMimeBody.DecodeData(ASource, ADestination: TStream);
begin
  ADestination.CopyFrom(ASource, ASource.Size)
end;

destructor TclSMimeBody.Destroy;
begin
  FSource.Free();
  inherited Destroy();
end;

procedure TclSMimeBody.DoCreate;
begin
  inherited DoCreate();
  FSource := TStringList.Create();
  SetListChangedEvent(FSource as TStringList);
end;

procedure TclSMimeBody.EncodeData(ASource, ADestination: TStream);
begin
  ADestination.CopyFrom(ASource, ASource.Size)
end;

function TclSMimeBody.GetDestinationStream: TStream;
begin
  Result := TMemoryStream.Create();
end;

function TclSMimeBody.GetHeader: TStrings;
begin
  Result := RawHeader;
end;

function TclSMimeBody.GetSourceStream: TStream;
var
  s: string;
  size: Integer;
begin
  Result := TMemoryStream.Create();
  s := FSource.Text;
  size := Length(s);
  if (size - Length(#13#10) > 0) then
  begin
    size := size - Length(#13#10);
  end;
  Result.WriteBuffer(Pointer(s)^, size);
  Result.Position := 0;
end;

procedure TclSMimeBody.ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseBodyHeader(ABodyPos, ASource, AFieldList);
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  Boundary := GetHeaderFieldValueItem(s, 'boundary=');
end;

procedure TclSMimeBody.ReadData(Reader: TReader);
begin
  Source.Text := Reader.ReadString();
  Boundary := Reader.ReadString();
  inherited ReadData(Reader);
end;

procedure TclSMimeBody.SetBoundary(const Value: string);
begin
  if (FBoundary <> Value) then
  begin
    FBoundary := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclSMimeBody.SetHeader(const Value: TStrings);
begin
  RawHeader.Assign(Value);
  GetMailMessage().Update();
end;

procedure TclSMimeBody.SetSource(const Value: TStrings);
begin
  FSource.Assign(Value);
end;

procedure TclSMimeBody.WriteData(Writer: TWriter);
begin
  Writer.WriteString(Source.Text);
  Writer.WriteString(Boundary);
  inherited WriteData(Writer);
end;

end.
