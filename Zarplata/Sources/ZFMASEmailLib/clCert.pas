{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clCert;

interface

{$I clVer.inc}

uses
  Classes, SysUtils, clCryptAPI, Windows, clUtils;

type
  TclCertificateFlag = (cfIgnoreCommonNameInvalid, cfIgnoreDateInvalid, cfIgnoreUnknownAuthority,
    cfIgnoreRevocation, cfIgnoreWrongUsage);
  TclCertificateFlags = set of TclCertificateFlag;

  TclCertificate = class;

  EclCryptError = class(Exception)
  private
    FErrorCode: Integer;
  public
    constructor Create(const AErrorMsg: string; AErrorCode: Integer);
    property ErrorCode: Integer read FErrorCode;
  end;

  TclOnGetCertificateEvent = procedure (Sender: TObject; var ACertificate: TclCertificate;
    var Handled: Boolean) of object;

  TclCryptData = class(TclBinaryData);

  TclCertificateStore = class;

  TclCertificate = class
  private
    FCertContext: PCCERT_CONTEXT;
    FIssuedTo: string;
    FEmail: string;
    FIssuedBy: string;
    FValidTo: TDateTime;
    FValidFrom: TDateTime;
    FSerialNumber: string;
    FFriendlyName: string;
    function GetEMailFromSubject: string;
    function GetEMailFromAltSubject: string;
    class function GetLastErrorText: string;
    procedure GetCertInfo;
  public
    constructor Create(ACertContext: PCCERT_CONTEXT);
    constructor CreateFromBinary(AEncoded: PByte; ALength: Integer);
    destructor Destroy; override;
    function Sign(const AData: TclCryptData;
      ADetachedSignature, AIncludeCertificate: Boolean): TclCryptData;
    function VerifyEnveloped(const AData: TclCryptData): TclCryptData;
    procedure VerifyDetached(const AData, ASignature: TclCryptData);
    function Decrypt(const AData: TclCryptData): TclCryptData;
    function Encrypt(const AData: TclCryptData): TclCryptData;
    property Context: PCCERT_CONTEXT read FCertContext;
    property IssuedTo: string read FIssuedTo;
    property IssuedBy: string read FIssuedBy;
    property FriendlyName: string read FFriendlyName;
    property Email: string read FEmail;
    property ValidFrom: TDateTime read FValidFrom;
    property ValidTo: TDateTime read FValidTo;
    property SerialNumber: string read FSerialNumber;
  end;

  TclCertificateInfo = class
  private
    FInfo: CERT_INFO;
    function GetInfo: PCERT_INFO;
  public
    constructor Create;
    destructor Destroy; override;
    property Info: PCERT_INFO read GetInfo;
  end;

  TclCertificateStore = class(TComponent)
  private
    FList: TList;
    FStoreName: string;
    FStoreHandle: HCERTSTORE;
    function GetCount: Integer;
    function GetItem(Index: Integer): TclCertificate;
    procedure InternalLoad(hStore: HCERTSTORE);
    function GenerateKey(AContext: HCRYPTPROV; AKeySpec: DWORD): HCRYPTKEY;
    function GenerateSubject(const ASubject: string): TclCryptData;
    function GenerateCertInfo(ASubject, AIssuer: TclCryptData; ASerialNumber: Integer;
      AValidFrom, AValidTo: TDateTime): TclCertificateInfo;
    function GeneratePublicKeyInfo(AContext: HCRYPTPROV; AKeySpec: DWORD): TclCryptData;
    function SignAndEncodeCert(AContext: HCRYPTPROV; AKeySpec: DWORD; ACertInfo: TclCertificateInfo): TclCryptData;
    procedure SetCertPrivateKey(const AContainer: string; AKeySpec: DWORD; ACertificate: TclCertificate);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Close;
    procedure Add(ACertificate: TclCertificate);
    function AddFrom(ACertificate: TclCertificate): TclCertificate;
    procedure AddFromBinary(const AData: TclCryptData);
    function AddSelfSigned(const ASubject: string; ASerialNumber: Integer;
      AValidFrom, AValidTo: TDateTime): TclCertificate;
    procedure Delete(Index: Integer);
    procedure Remove(ACertificate: TclCertificate);
    procedure LoadFromSystemStore(const AStoreName: string);
    procedure LoadFromStore(AStoreHandle: HCERTSTORE);
    procedure ImportFromPFX(const AFileName, APassword: string);
    procedure ExportToPFX(ACertificate: TclCertificate; const AFileName, APassword: string; AExportPrivateKey: Boolean);
    procedure Install(ACertificate: TclCertificate);
    procedure Uninstall(ACertificate: TclCertificate);
    function IsInstalled(ACertificate: TclCertificate): Boolean;
    function CertificateByEmail(const AEmail: string): TclCertificate;
    function CertificateByIssuedTo(const AIssuedTo: string): TclCertificate;
    function Encrypt(const AData: TclCryptData): TclCryptData;
    property Items[Index: Integer]: TclCertificate read GetItem; default;
    property Count: Integer read GetCount;
  published
    property StoreName: string read FStoreName write FStoreName;
  end;

resourcestring
  cMessageNotEncrypted = 'The message is not encrypted';
  cMessageEncrypted = 'The message is already encrypted';
  cMessageSigned = 'The message is already signed';
  cMessageNotSigned = 'The message is not signed';
  cCertificateRequired = 'Certificate required to complete operation';
  cCertificateNotFound = 'The specified certificate not found';

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsCertDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}
  
implementation

uses
  clEncoder{$IFDEF DEMO}, Forms{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

{ TclCertificate }

constructor TclCertificate.Create(ACertContext: PCCERT_CONTEXT);
begin
  inherited Create();
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Create');{$ENDIF}
  FCertContext := CertDuplicateCertificateContext(ACertContext);
  GetCertInfo();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Create'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Create', E); raise; end; end;{$ENDIF}
end;

procedure TclCertificate.GetCertInfo();
  function GetDecodedName(AType, AFlags: Integer): string;
  var
    len: Integer;
    p: PChar;
  begin
    len := CertGetNameString(FCertContext, AType, AFlags, nil, nil, 0);
    if (len > 1) then
    begin
      GetMem(p, len);
      CertGetNameString(FCertContext, AType, AFlags, nil, p, len);
      SetString(Result, p, len - 1);
      FreeMem(p);
    end else
    begin
      Result := '';
    end;
  end;

  function GetBinToHex(ABlob: CRYPTOAPI_BLOB): string;
  var
    i: Integer;
    p: Pointer;
  begin
    Result := '';
    for i := ABlob.cbData - 1 downto 0 do
    begin
      p := Pointer(Integer(ABlob.pbData) + i);
      Result := Result + IntToHex(Byte(p^), 2);
    end;
  end;

  function GetFriendlyName: string;
  var
    cbSize: DWORD;
    p: PWideChar;
  begin
    Result := '';
    cbSize := 0;
    if not CertGetCertificateContextProperty(FCertContext,
      CERT_FRIENDLY_NAME_PROP_ID, nil, @cbSize) then Exit;
    if (cbSize < 1) then Exit;

    GetMem(p, cbSize);
    try
      CertGetCertificateContextProperty(FCertContext, CERT_FRIENDLY_NAME_PROP_ID, p, @cbSize);
      Result := string(system.Copy(p, 1, cbSize));
    finally
      FreeMem(p);
    end;
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
    if not IsCertDemoDisplayed then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  FIssuedBy := GetDecodedName(CERT_NAME_SIMPLE_DISPLAY_TYPE, CERT_NAME_ISSUER_FLAG);
  FIssuedTo := GetDecodedName(CERT_NAME_SIMPLE_DISPLAY_TYPE, 0);

  FEmail := GetEMailFromSubject();
  if (FEmail = '') then
  begin
    FEmail := GetEMailFromAltSubject();
  end;

  FValidFrom := ConvertFileTimeToDateTime(FCertContext^.pCertInfo.NotBefore);
  FValidTo := ConvertFileTimeToDateTime(FCertContext^.pCertInfo.NotAfter);

  FSerialNumber := GetBinToHex(FCertContext^.pCertInfo.SerialNumber);

  FFriendlyName := GetFriendlyName();
end;

function TclCertificate.Decrypt(const AData: TclCryptData): TclCryptData;
var
  decryptPara: CRYPT_DECRYPT_MESSAGE_PARA;
  cbDecrypted: DWORD;
  rghCertStore: array[0..0] of HCERTSTORE;
  hStore: HCERTSTORE;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Decrypt');{$ENDIF}
  Result := TclCryptData.Create();
  try
    ZeroMemory(@decryptPara, SizeOf(decryptPara));
    decryptPara.cbSize := SizeOf(decryptPara);
    decryptPara.dwMsgAndCertEncodingType := (X509_ASN_ENCODING or PKCS_7_ASN_ENCODING);
    decryptPara.rghCertStore := @rghCertStore[0];
    decryptPara.cCertStore := 1;
    cbDecrypted := 0;

    hStore := CertOpenStore(CERT_STORE_PROV_MEMORY, 0, 0, 0, nil);
    try
      if (hStore = nil)
        or (not CertAddCertificateContextToStore(hStore, Context, CERT_STORE_ADD_NEW, nil)) then
      begin
        raise EclCryptError.Create(GetLastErrorText(), GetLastError());
      end;
      rghCertStore[0] := hStore;
      if CryptDecryptMessage(@decryptPara, AData.Data, AData.DataSize, nil, @cbDecrypted, nil) then
      begin
        Result.Allocate(cbDecrypted);
        if CryptDecryptMessage(@decryptPara, AData.Data, AData.DataSize, Result.Data, @cbDecrypted, nil) then
        begin
          Result.Reduce(cbDecrypted);
          Exit;
        end;
      end;
    finally
      if (hStore <> nil) then
      begin
        CertCloseStore(hStore, 0);
      end;
    end;
    raise EclCryptError.Create(GetLastErrorText(), GetLastError());
  except
    Result.Free();
    raise;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Decrypt'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Decrypt', E); raise; end; end;{$ENDIF}
end;

destructor TclCertificate.Destroy;
begin
  CertFreeCertificateContext(FCertContext);
  inherited Destroy();
end;

function TclCertificate.Encrypt(const AData: TclCryptData): TclCryptData;
var
  encryptPara: CRYPT_ENCRYPT_MESSAGE_PARA;
  cbEncrypted: DWORD;
  gpRecipientCert: array[0..0] of PCCERT_CONTEXT;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Encrypt');{$ENDIF}
  Result := TclCryptData.Create();
  try
    ZeroMemory(@encryptPara, SizeOf(encryptPara));
    encryptPara.cbSize := SizeOf(encryptPara);
    encryptPara.dwMsgEncodingType := (X509_ASN_ENCODING or PKCS_7_ASN_ENCODING);
    encryptPara.ContentEncryptionAlgorithm.pszObjId := szOID_RSA_RC2CBC;
    gpRecipientCert[0] := Context;
    cbEncrypted := 0;
    if CryptEncryptMessage(@encryptPara, 1, @gpRecipientCert[0], AData.Data, AData.DataSize, nil, @cbEncrypted) then
    begin
      Result.Allocate(cbEncrypted);
      if CryptEncryptMessage(@encryptPara, 1, @gpRecipientCert[0], AData.Data, AData.DataSize, Result.Data, @cbEncrypted) then
      begin
        Result.Reduce(cbEncrypted);
        Exit;
      end;
    end;
    raise EclCryptError.Create(GetLastErrorText(), GetLastError());
  except
    Result.Free();
    raise;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Encrypt'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Encrypt', E); raise; end; end;{$ENDIF}
end;

function TclCertificate.GetEMailFromAltSubject: string;
var
  i: Integer;
  pCertExtension: PCERT_EXTENSION;
  pStruct: Pointer;
  cbStruct: DWORD;
  pInfo: PCERT_ALT_NAME_INFO;
  pEntry: PCERT_ALT_NAME_ENTRY;
begin
  Assert(FCertContext <> nil);
	Assert(FCertContext.pCertInfo <> nil);
	Result := '';
	if (FCertContext.pCertInfo <> nil) then
	begin
		pCertExtension := CertFindExtension(szOID_SUBJECT_ALT_NAME2,
      FCertContext.pCertInfo.cExtension, FCertContext.pCertInfo.rgExtension);
		if (pCertExtension <> nil) then
    begin
      cbStruct := 0;
      if (CryptDecodeObject(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING, szOID_SUBJECT_ALT_NAME2,
        pCertExtension.Value.pbData, pCertExtension.Value.cbData, 0, nil, @cbStruct)) then
      begin
        GetMem(pStruct, cbStruct);
        CryptDecodeObject(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING, szOID_SUBJECT_ALT_NAME2,
          pCertExtension.Value.pbData, pCertExtension.Value.cbData, 0, pStruct, @cbStruct);
				pInfo := PCERT_ALT_NAME_INFO(pStruct);
				for i := 0 to pInfo.cAltEntry - 1 do
        begin
					pEntry := PCERT_ALT_NAME_ENTRY(Integer(pInfo.rgAltEntry) + i * SizeOf(CERT_ALT_NAME_ENTRY));
          if (pEntry.dwAltNameChoice = CERT_ALT_NAME_RFC822_NAME) then
          begin
            Result := string(WideString(pEntry.pwszRfc822Name));
            Break;
          end;
        end;
        FreeMem(pStruct);
      end;
    end;
  end;
end;

function TclCertificate.GetEMailFromSubject: string;
var
  i, j: Integer;
  pStruct: Pointer;
  cbStruct: DWORD;
  pInfo: PCERT_NAME_INFO;
  pEntry: PCERT_RDN;
  pRDNAttr: PCERT_RDN_ATTR;
begin
  Assert(FCertContext <> nil);
	Assert(FCertContext.pCertInfo <> nil);
	Result := '';
	if (FCertContext.pCertInfo <> nil) then
	begin
    cbStruct := 0;
		if (CryptDecodeObject(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING, X509_NAME,
			FCertContext.pCertInfo.Subject.pbData, FCertContext.pCertInfo.Subject.cbData,
			0, nil, @cbStruct)) then
    begin
      GetMem(pStruct, cbStruct);
      CryptDecodeObject(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING, X509_NAME,
        FCertContext.pCertInfo.Subject.pbData, FCertContext.pCertInfo.Subject.cbData,
        0, pStruct, @cbStruct);
			pInfo := PCERT_NAME_INFO(pStruct);
			for i := 0 to pInfo.cRDN - 1 do
      begin
				pEntry := PCERT_RDN(Integer(pInfo.rgRDN) + i * SizeOf(CERT_RDN));
				for j := 0 to pEntry.cRDNAttr - 1 do
        begin
          pRDNAttr := PCERT_RDN_ATTR(Integer(pEntry.rgRDNAttr) + j * SizeOf(CERT_RDN_ATTR));
          if (SameText(string(pRDNAttr.pszObjId), szOID_RSA_emailAddr)) then
					begin
            Result := string(PChar(pRDNAttr.Value.pbData));
						Break;
          end;
        end;
				if (Result <> '') then Break;
      end;
      FreeMem(pStruct);
    end;
  end;
end;

class function TclCertificate.GetLastErrorText: string;
var
  code: DWORD;
  Len: Integer;
  Buffer: array[0..255] of Char;
begin
  code := GetLastError();
  Len := FormatMessage(FORMAT_MESSAGE_FROM_HMODULE or FORMAT_MESSAGE_FROM_SYSTEM,
    Pointer(GetModuleHandle('crypt32.dll')), code, 0, Buffer, SizeOf(Buffer), nil);
  while (Len > 0) and (Buffer[Len - 1] in [#0..#32, '.']) do Dec(Len);
  SetString(Result, Buffer, Len);
end;

function TclCertificate.Sign(const AData: TclCryptData;
  ADetachedSignature, AIncludeCertificate: Boolean): TclCryptData;
var
  data: array[0..0] of PByte;
  msgCert: array[0..0] of PCCERT_CONTEXT;
  dwDataSizeArray: array[0..0] of DWORD;
  sigParams: CRYPT_SIGN_MESSAGE_PARA;
  cbSignedBlob: DWORD;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Sign');{$ENDIF}
  Result := TclCryptData.Create();
  try
    ZeroMemory(@sigParams, SizeOf(CRYPT_SIGN_MESSAGE_PARA));
    sigParams.cbSize := SizeOf(CRYPT_SIGN_MESSAGE_PARA);
    sigParams.dwMsgEncodingType := (X509_ASN_ENCODING or PKCS_7_ASN_ENCODING);
    sigParams.pSigningCert := Context;
    sigParams.HashAlgorithm.pszObjId := szOID_RSA_SHA1RSA; //szOID_RSA_MD5
    if AIncludeCertificate then
    begin
      sigParams.cMsgCert := 1;
      sigParams.rgpMsgCert := @msgCert;
      msgCert[0] := Context;
    end;
    data[0] := AData.Data;
    dwDataSizeArray[0] := AData.DataSize;
    cbSignedBlob := 0;
    if CryptSignMessage(@sigParams, ADetachedSignature, 1, @data[0], @dwDataSizeArray[0], nil, @cbSignedBlob) then
    begin
      Result.Allocate(cbSignedBlob);
      if CryptSignMessage(@sigParams, ADetachedSignature, 1, @data[0], @dwDataSizeArray[0], Result.Data, @cbSignedBlob) then
      begin
        Result.Reduce(cbSignedBlob);
        Exit;
      end;
    end;
    raise EclCryptError.Create(GetLastErrorText(), GetLastError());
  except
    Result.Free();
    raise;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Sign'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Sign', E); raise; end; end;{$ENDIF}
end;

function GetSignerCertificate(pvGetArg: PVOID;
  dwCertEncodingType: DWORD; pSignerId: PCERT_INFO;
  hMsgCertStore: HCERTSTORE): PCCERT_CONTEXT; stdcall;
begin
  Result := CertDuplicateCertificateContext(PCCERT_CONTEXT(pvGetArg));
end;

function TclCertificate.VerifyEnveloped(const AData: TclCryptData): TclCryptData;
var
  verifyPara: CRYPT_VERIFY_MESSAGE_PARA;
  cbVerified: DWORD;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'VerifyEnveloped');{$ENDIF}
  Result := TclCryptData.Create();
  try
    ZeroMemory(@verifyPara, SizeOf(verifyPara));
    verifyPara.cbSize := SizeOf(verifyPara);
    verifyPara.dwMsgAndCertEncodingType := (X509_ASN_ENCODING or PKCS_7_ASN_ENCODING);
    verifyPara.pfnGetSignerCertificate := GetSignerCertificate;
    verifyPara.pvGetArg := Context;
    cbVerified := 0;
    if CryptVerifyMessageSignature(@verifyPara, 0, AData.Data, AData.DataSize, nil, @cbVerified, nil) then
    begin
      Result.Allocate(cbVerified);
      if CryptVerifyMessageSignature(@verifyPara, 0, AData.Data, AData.DataSize, Result.Data, @cbVerified, nil) then
      begin
        Result.Reduce(cbVerified);
        Exit;
      end;
    end;
    raise EclCryptError.Create(GetLastErrorText(), GetLastError());
  except
    Result.Free();
    raise;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'VerifyEnveloped'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'VerifyEnveloped', E); raise; end; end;{$ENDIF}
end;

procedure TclCertificate.VerifyDetached(const AData, ASignature: TclCryptData);
var
  verifyPara: CRYPT_VERIFY_MESSAGE_PARA;
  rgpbToBeSigned: array[0..0] of PBYTE;
  rgcbToBeSigned: array[0..0] of DWORD;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'VerifyDetached');{$ENDIF}
  ZeroMemory(@verifyPara, SizeOf(verifyPara));
  verifyPara.cbSize := SizeOf(verifyPara);
  verifyPara.dwMsgAndCertEncodingType := (X509_ASN_ENCODING or PKCS_7_ASN_ENCODING);
  verifyPara.pfnGetSignerCertificate := GetSignerCertificate;
  verifyPara.pvGetArg := Context;
  rgpbToBeSigned[0] := AData.Data;
  rgcbToBeSigned[0] := AData.DataSize;
  if not CryptVerifyDetachedMessageSignature(@verifyPara,
    0, ASignature.Data, ASignature.DataSize, 1, @rgpbToBeSigned[0], @rgcbToBeSigned[0], nil) then
  begin
    raise EclCryptError.Create(GetLastErrorText(), GetLastError());
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'VerifyDetached'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'VerifyDetached', E); raise; end; end;{$ENDIF}
end;

constructor TclCertificate.CreateFromBinary(AEncoded: PByte; ALength: Integer);
begin
  inherited Create();
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'CreateFromBinary');{$ENDIF}
  FCertContext := CertCreateCertificateContext(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING,
    AEncoded, ALength);
  FCertContext := CertDuplicateCertificateContext(FCertContext);
  if (FCertContext = nil) then
  begin
    raise EclCryptError.Create(GetLastErrorText(), GetLastError());
  end;
  GetCertInfo();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'CreateFromBinary'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'CreateFromBinary', E); raise; end; end;{$ENDIF}
end;

{ TclCertificateStore }

procedure TclCertificateStore.Add(ACertificate: TclCertificate);
begin
  FList.Add(ACertificate);
end;

procedure TclCertificateStore.Close;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].Free();
  end;
  FList.Clear();
  if (FStoreHandle <> nil) then
  begin
    CertCloseStore(FStoreHandle, 0);
    FStoreHandle := nil;
  end;
end;

constructor TclCertificateStore.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FList := TList.Create();
  FStoreName := '';
end;

destructor TclCertificateStore.Destroy;
begin
  Close();
  FList.Free();
  inherited Destroy();
end;

procedure TclCertificateStore.AddFromBinary(const AData: TclCryptData);
var
  hStore: HCERTSTORE;
begin
  hStore := CryptGetMessageCertificates((X509_ASN_ENCODING or PKCS_7_ASN_ENCODING),
    0, 0, AData.Data, AData.DataSize);
  if (hStore <> nil) then
  begin
    try
      InternalLoad(hStore);
    finally
      CertCloseStore(hStore, 0);
    end;
  end else
  begin
    raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
  end;
end;

function TclCertificateStore.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TclCertificateStore.GetItem(Index: Integer): TclCertificate;
begin
  Result := TclCertificate(FList[Index]);
end;

procedure TclCertificateStore.LoadFromSystemStore(const AStoreName: string);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'LoadFromSystemStore: ' + AStoreName);{$ENDIF}
  Close();
  FStoreName := AStoreName;
  FStoreHandle := CertOpenSystemStore(0, PChar(StoreName));
  if (FStoreHandle <> nil) then
  begin
    InternalLoad(FStoreHandle);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'LoadFromSystemStore'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'LoadFromSystemStore', E); raise; end; end;{$ENDIF}
end;

function TclCertificateStore.CertificateByEmail(const AEmail: string): TclCertificate;
var
  i: Integer;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'CertificateByEmail: ' + AEmail);{$ENDIF}
  for i := 0 to Count -1 do
  begin
    Result := Items[i];
    if SameText(Result.GetEMailFromSubject(), AEmail) or
      SameText(Result.GetEMailFromAltSubject(), AEmail) then
    begin
      Exit;
    end;
  end;
  raise EclCryptError.Create(cCertificateNotFound, -1);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'CertificateByEmail'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'CertificateByEmail', E); raise; end; end;{$ENDIF}
end;

function TclCertificateStore.CertificateByIssuedTo(const AIssuedTo: string): TclCertificate;
var
  i: Integer;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'CertificateByIssuedTo: ' + AIssuedTo);{$ENDIF}
  for i := 0 to Count -1 do
  begin
    Result := Items[i];
    if SameText(Result.IssuedTo, AIssuedTo) then
    begin
      Exit;
    end;
  end;
  raise EclCryptError.Create(cCertificateNotFound, -1);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'CertificateByIssuedTo'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'CertificateByIssuedTo', E); raise; end; end;{$ENDIF}
end;

procedure TclCertificateStore.Delete(Index: Integer);
begin
  Items[Index].Free();
  FList.Delete(Index);
end;

procedure TclCertificateStore.ImportFromPFX(const AFileName, APassword: string);
var
  PFX: CRYPT_DATA_BLOB;
  data: TclCryptData;
  stream: TStream;
  psw: PWideChar;
  hStore: HCERTSTORE;
begin
  stream := nil;
  data := nil;
  try
    stream := TFileStream.Create(AFileName, fmOpenRead);
    data := TclCryptData.Create();
    data.Allocate(stream.Size);
    stream.Read(data.Data^, data.DataSize);
    PFX.cbData := data.DataSize;
    PFX.pbData := data.Data;
    psw := PWideChar(WideString(APassword));

    hStore := PFXImportCertStore(@PFX, psw, CRYPT_EXPORTABLE);
    if (hStore <> nil) then
    begin
      try
        InternalLoad(hStore);
      finally
        CertCloseStore(hStore, 0);
      end;
    end else
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
  finally
    data.Free();
    stream.Free();
  end;
end;

procedure TclCertificateStore.InternalLoad(hStore: HCERTSTORE);
var
  hCertContext: PCCERT_CONTEXT;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InternalLoad');{$ENDIF}
  hCertContext := nil;
  repeat
    hCertContext := CertEnumCertificatesInStore(hStore, hCertContext);
    if (hCertContext <> nil) then
    begin
      Add(TclCertificate.Create(hCertContext));
    end;
  until (hCertContext = nil);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InternalLoad'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InternalLoad', E); raise; end; end;{$ENDIF}
end;

procedure TclCertificateStore.LoadFromStore(AStoreHandle: HCERTSTORE);
begin
  Close();
  FStoreName := '';
  FStoreHandle := AStoreHandle;
  if (FStoreHandle <> nil) then
  begin
    InternalLoad(FStoreHandle);
  end;
end;

procedure TclCertificateStore.Install(ACertificate: TclCertificate);
var
  hStore, hPersistStore: HCERTSTORE;
begin
  hPersistStore := nil;
  hStore := FStoreHandle;
  try
    if (hStore = nil) then
    begin
      hPersistStore := CertOpenSystemStore(0, PChar(StoreName));
      hStore := hPersistStore;
    end;
    if (hStore = nil)
      or (not CertAddCertificateContextToStore(hStore, ACertificate.Context, CERT_STORE_ADD_NEW, nil)) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
  finally
    if (hPersistStore <> nil) then
    begin
      CertCloseStore(hPersistStore, CERT_CLOSE_STORE_FORCE_FLAG);
    end;
  end;
end;

procedure TclCertificateStore.Uninstall(ACertificate: TclCertificate);
begin
  if not CertDeleteCertificateFromStore(CertDuplicateCertificateContext(ACertificate.Context)) then
  begin
    raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
  end;
end;

function TclCertificateStore.IsInstalled(ACertificate: TclCertificate): Boolean;
var
  cont: PCCERT_CONTEXT;
  hStore, hPersistStore: HCERTSTORE;
begin
  Result := False;
  hPersistStore := nil;
  hStore := FStoreHandle;
  try
    if (hStore = nil) then
    begin
      hPersistStore := CertOpenSystemStore(0, PChar(StoreName));
      hStore := hPersistStore;
    end;
    if (hStore = nil) then              
    begin         
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;

    cont := CertGetSubjectCertificateFromStore(hStore,
      PKCS_7_ASN_ENCODING or X509_ASN_ENCODING, ACertificate.Context.pCertInfo);
      
    Result := (cont <> nil);
    
    if Result then
    begin
      CertFreeCertificateContext(cont);
    end;
  finally
    if (hPersistStore <> nil) then
    begin
      CertCloseStore(hPersistStore, 0);
    end;
  end;
end;

function TclCertificateStore.GenerateKey(AContext: HCRYPTPROV; AKeySpec: DWORD): HCRYPTKEY;
var
  flags: DWORD;
begin
  flags := ($400 shl $10) or 1;
  if not CryptGenKey(AContext, AKeySpec, flags, @Result) then
  begin
    raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
  end;
end;

function TclCertificateStore.GenerateSubject(const ASubject: string): TclCryptData;
var
  subjSize: DWORD;
begin
  Result := TclCryptData.Create();
  try
    if not CertStrToName(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING,
      PChar(ASubject), CERT_X500_NAME_STR, nil, nil, @subjSize, nil) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
    Result.Allocate(subjSize);

    if not CertStrToName(X509_ASN_ENCODING or PKCS_7_ASN_ENCODING,
      PChar(ASubject), CERT_X500_NAME_STR, nil, Result.Data, @subjSize, nil) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
    Result.Reduce(subjSize);
  except
    Result.Free();
    raise;
  end;
end;

function TclCertificateStore.GenerateCertInfo(ASubject, AIssuer: TclCryptData;
  ASerialNumber: Integer; AValidFrom, AValidTo: TDateTime): TclCertificateInfo;
  function GetCertDate(ADate: TDateTime): TFileTime;
  var
    sDate: TSystemTime;
  begin
    DateTimeToSystemTime(LocalTimeToGlobalTime(ADate), sDate);
    SystemTimeToFileTime(sDate, Result);
  end;
  
begin
  Result := TclCertificateInfo.Create();
  try
    if (ASerialNumber = 0) then
    begin
      ASerialNumber := GetTickCount();
    end;
    Result.Info^.SerialNumber.cbData := SizeOf(ASerialNumber);
    GetMem(Result.Info^.SerialNumber.pbData, Result.Info^.SerialNumber.cbData);
    CopyMemory(Result.Info^.SerialNumber.pbData, @ASerialNumber, Result.Info^.SerialNumber.cbData);

    Result.Info^.NotBefore := GetCertDate(AValidFrom);
    Result.Info^.NotAfter := GetCertDate(AValidTo);

    Result.Info^.Subject.cbData := ASubject.DataSize;
    Result.Info^.Subject.pbData := ASubject.Data;

    Result.Info^.Issuer.cbData := AIssuer.DataSize;
    Result.Info^.Issuer.pbData := AIssuer.Data;
  except
    Result.Free();
    raise;
  end;
end;

function TclCertificateStore.GeneratePublicKeyInfo(AContext: HCRYPTPROV; AKeySpec: DWORD): TclCryptData;
var
  keyInfoSize: DWORD;
begin
  Result := TclCryptData.Create();
  try
    if not CryptExportPublicKeyInfo(AContext, AKeySpec, X509_ASN_ENCODING or PKCS_7_ASN_ENCODING,
      nil, @keyInfoSize) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;

    Result.Allocate(keyInfoSize);
    if not CryptExportPublicKeyInfo(AContext, AKeySpec, X509_ASN_ENCODING or PKCS_7_ASN_ENCODING,
      PCERT_PUBLIC_KEY_INFO(Result.Data), @keyInfoSize) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
    Result.Reduce(keyInfoSize);
  except
    Result.Free();
    raise;
  end;
end;

function TclCertificateStore.SignAndEncodeCert(AContext: HCRYPTPROV; AKeySpec: DWORD;
  ACertInfo: TclCertificateInfo): TclCryptData;
var
  encodedSize: DWORD;
begin
  Result := TclCryptData.Create();
  try
    if not CryptSignAndEncodeCertificate(AContext, AKeySpec, X509_ASN_ENCODING, X509_CERT_TO_BE_SIGNED,
      ACertInfo.Info, @ACertInfo.Info^.SignatureAlgorithm, nil, nil, @encodedSize) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;

    Result.Allocate(encodedSize);

    if not CryptSignAndEncodeCertificate(AContext, AKeySpec, X509_ASN_ENCODING, X509_CERT_TO_BE_SIGNED,
      ACertInfo.Info, @ACertInfo.Info^.SignatureAlgorithm, nil, Result.Data, @encodedSize) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
  except
    Result.Free();
    raise;
  end;
end;

procedure TclCertificateStore.SetCertPrivateKey(const AContainer: string; AKeySpec: DWORD;
  ACertificate: TclCertificate);
var
  info: CRYPT_KEY_PROV_INFO;
begin
  info.pwszContainerName := PWideChar(WideString(AContainer));
  info.pwszProvName := MS_DEF_PROV;
  info.dwProvType := PROV_RSA_FULL;
  info.dwFlags := 0;
  info.cProvParam := 0;
  info.rgProvParam := nil;
  info.dwKeySpec := AKeySpec;
  if not CertSetCertificateContextProperty(ACertificate.Context, CERT_KEY_PROV_INFO_PROP_ID,
    0, @info) then
  begin
    raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
  end;
end;

function TclCertificateStore.AddSelfSigned(const ASubject: string;
  ASerialNumber: Integer; AValidFrom, AValidTo: TDateTime): TclCertificate;
var
  context: HCRYPTPROV;
  key: HCRYPTKEY;
  container: string;
  subj, keyInfo, encodedCert: TclCryptData;
  certInfo: TclCertificateInfo;
  keySpec: DWORD;
  //TODO cc: TclCertificate;
begin
  keySpec := AT_KEYEXCHANGE {TODO or AT_SIGNATURE};
  context := 0;
  key := 0;
  subj := nil;
  certInfo := nil;
  keyInfo := nil;
  encodedCert := nil;
  Result := nil;
  try
    container := IntToStr(GetTickCount());
    if not CryptAcquireContext(@context, PChar(container), MS_DEF_PROV, PROV_RSA_FULL, CRYPT_NEWKEYSET) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;

    key := GenerateKey(context, keySpec);
    subj := GenerateSubject(ASubject);
    certInfo := GenerateCertInfo(subj, subj, ASerialNumber, AValidFrom, AValidTo);

    {TODO
    cc := CertificateByEmail('CleverTester@company.mail');

    certInfo.Info^.Issuer.cbData := cc.Context.pCertInfo.Subject.cbData;
    certInfo.Info^.Issuer.pbData := cc.Context.pCertInfo.Subject.pbData;
    }
    
    keyInfo := GeneratePublicKeyInfo(context, keySpec);
    certInfo.Info^.SubjectPublicKeyInfo := PCERT_PUBLIC_KEY_INFO(keyInfo.Data)^;
    encodedCert := SignAndEncodeCert(context, keySpec, certInfo);

    Result := TclCertificate.CreateFromBinary(encodedCert.Data, encodedCert.DataSize);
    try
      SetCertPrivateKey(container, keySpec, Result);
    except
      Result.Free();
      raise;
    end;
    Add(Result);
  finally
    encodedCert.Free();
    keyInfo.Free();
    certInfo.Free();
    subj.Free();
    if (key <> 0) then
    begin
      CryptDestroyKey(key);
    end;
    if (context <> 0) then
    begin
      CryptReleaseContext(context, 0);
    end;
  end;
end;

procedure TclCertificateStore.ExportToPFX(ACertificate: TclCertificate;
  const AFileName, APassword: string; AExportPrivateKey: Boolean);
var
  i: Integer;
  hStore: HCERTSTORE;
  pfxBlob: CRYPT_DATA_BLOB;
  pfx: TclCryptData;
  psw: PWideChar;
  flags: DWORD;
  stream: TStream;
begin
  hStore := nil;
  pfx := nil;
  stream := nil;
  try
    hStore := CertOpenStore(CERT_STORE_PROV_MEMORY, 0, 0, 0, nil);
    if (hStore = nil) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;

    if (ACertificate <> nil) then
    begin
      if not CertAddCertificateContextToStore(hStore, ACertificate.Context, CERT_STORE_ADD_NEW, nil) then
      begin
        raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
      end;
    end else
    begin
      for i := 0 to Count - 1 do
      begin
        if not CertAddCertificateContextToStore(hStore, Items[i].Context, CERT_STORE_ADD_NEW, nil) then
        begin
          raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
        end;
      end;
    end;

    pfx := TclCryptData.Create();
    stream := TFileStream.Create(AFileName, fmCreate);
      
    flags := 0;
    if AExportPrivateKey then
    begin
      flags := flags or EXPORT_PRIVATE_KEYS;
    end;

    pfxBlob.cbData := 0;
    pfxBlob.pbData := nil;
    psw := PWideChar(WideString(APassword));
    if not PFXExportCertStoreEx(hStore, @pfxBlob, psw, nil, flags) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;

    pfx.Allocate(pfxBlob.cbData);
    pfxBlob.pbData := pfx.Data;
    if not PFXExportCertStoreEx(hStore, @pfxBlob, psw, nil, flags) then
    begin
      raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
    end;
    pfx.Reduce(pfxBlob.cbData);

    stream.Write(pfx.Data^, pfx.DataSize);
  finally
    stream.Free();
    pfx.Free();
    CertCloseStore(hStore, 0);
  end;
end;

function TclCertificateStore.AddFrom(ACertificate: TclCertificate): TclCertificate;
begin
  Result := TclCertificate.Create(ACertificate.Context);
  Add(Result);
end;

procedure TclCertificateStore.Remove(ACertificate: TclCertificate);
begin
  Delete(FList.IndexOf(ACertificate));
end;

function TclCertificateStore.Encrypt(const AData: TclCryptData): TclCryptData;
var
  i: Integer;
  encryptPara: CRYPT_ENCRYPT_MESSAGE_PARA;
  cbEncrypted: DWORD;
  gpRecipientCerts: PCCERT_CONTEXT;
  p: ^PCCERT_CONTEXT;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Encrypt');{$ENDIF}
  Result := TclCryptData.Create();
  try
    ZeroMemory(@encryptPara, SizeOf(encryptPara));
    encryptPara.cbSize := SizeOf(encryptPara);
    encryptPara.dwMsgEncodingType := (X509_ASN_ENCODING or PKCS_7_ASN_ENCODING);
    encryptPara.ContentEncryptionAlgorithm.pszObjId := szOID_RSA_RC2CBC;

    GetMem(gpRecipientCerts, SizeOf(PCCERT_CONTEXT) * Count);
    try
      for i := 0 to Count - 1 do
      begin
        p := Pointer(Integer(gpRecipientCerts) + SizeOf(PCCERT_CONTEXT) * i);
        p^ := Items[i].Context;
      end;

      cbEncrypted := 0;
      if CryptEncryptMessage(@encryptPara, Count, gpRecipientCerts, AData.Data, AData.DataSize, nil, @cbEncrypted) then
      begin
        Result.Allocate(cbEncrypted);
        if CryptEncryptMessage(@encryptPara, Count, gpRecipientCerts, AData.Data, AData.DataSize, Result.Data, @cbEncrypted) then
        begin
          Result.Reduce(cbEncrypted);
          Exit;
        end;
      end;
    finally
      FreeMem(gpRecipientCerts);
    end;

    raise EclCryptError.Create(TclCertificate.GetLastErrorText(), GetLastError());
  except
    Result.Free();
    raise;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Encrypt'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Encrypt', E); raise; end; end;{$ENDIF}
end;

{ TclCertificateInfo }

constructor TclCertificateInfo.Create;
begin
  inherited Create();
  FInfo.SerialNumber.pbData := nil;
  FInfo.dwVersion := CERT_V3;
  FInfo.SignatureAlgorithm.pszObjId  := szOID_RSA_SHA1RSA;
  FInfo.SignatureAlgorithm.Parameters.cbData := 0;
  FInfo.cExtension := 0;
  FInfo.rgExtension := nil;
  FInfo.IssuerUniqueId.cbData := 0;
  FInfo.SubjectUniqueId.cbData := 0;
end;

destructor TclCertificateInfo.Destroy;
begin
  FreeMem(FInfo.SerialNumber.pbData);
  inherited Destroy();
end;

function TclCertificateInfo.GetInfo: PCERT_INFO;
begin
  Result := @FInfo;
end;

{ EclCryptError }

constructor EclCryptError.Create(const AErrorMsg: string; AErrorCode: Integer);
begin
  inherited Create(AErrorMsg);
  FErrorCode := AErrorCode;
end;

end.
