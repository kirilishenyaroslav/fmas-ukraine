{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSoap;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
{$ENDIF}

uses
  Windows, Classes, SysUtils, clCert, clHttpRequest, clHttpHeader
  {$IFDEF DELPHI6}, Variants, msxml {$ELSE}, msxml_tlb{$ENDIF};

type
  EclSoapMessageError = class(Exception);

  TclSignatureStyle = (ssDotNet, ssJava);

  TclTransformDataEvent = procedure (Sender: TObject; const
    Algorithm: string; var ATemplate: string; var Handled: Boolean) of object;

  TclSoapMessageHeader = class(TclHttpRequestHeader)
  private
    FStart: string;
    FSoapAction: string;
    FSubType: string;
    procedure SetSoapAction(const Value: string);
    procedure SetStart(const Value: string);
    procedure SetSubType(const Value: string);
  protected
    procedure RegisterFields; override;
    procedure InternalParseHeader(AHeader, AFieldList: TStrings); override;
    procedure InternalAssignHeader(AHeader: TStrings); override;
    procedure ParseContentType(AHeader, AFieldList: TStrings); override;
    procedure AssignContentType(AHeader: TStrings); override;
  public
    procedure Clear; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Start: string read FStart write SetStart;
    property SubType: string read FSubType write SetSubType;
    property SoapAction: string read FSoapAction write SetSoapAction;
  end;  

  TclSoapMessageItem = class(TclHttpRequestItem)
  private
    FContentID: string;
    FContentType: string;
    FContentLocation: string;
    FContentTransferEncoding: string;
    FExtraFields: TStrings;
    FCharSet: string;
    FKnownFields: TStrings;
    procedure SetContentID(const Value: string);
    procedure SetContentLocation(const Value: string);
    procedure SetContentTransferEncoding(const Value: string);
    procedure SetContentType(const Value: string);
    procedure SetCharSet(const Value: string);
    procedure SetExtraFields(const Value: TStrings);
    procedure ListChangeEvent(Sender: TObject);
    function GetHeader: TStream;
    procedure ParseExtraFields(AHeader, AFieldList: TStrings);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure ParseHeader(AHeader, AFieldList: TStrings); override;
    function GetData: TStream; override;
    procedure RegisterField(const AField: string);
    procedure RegisterFields; virtual;
  public
    constructor Create(AOwner: TclHttpRequest); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property ContentType: string read FContentType write SetContentType;
    property CharSet: string read FCharSet write SetCharSet;
    property ContentID: string read FContentID write SetContentID;
    property ContentLocation: string read FContentLocation write SetContentLocation; 
    property ContentTransferEncoding: string read FContentTransferEncoding write SetContentTransferEncoding;
    property ExtraFields: TStrings read FExtraFields write SetExtraFields;
  end;

  TclXmlItem = class(TclSoapMessageItem)
  private
    FXmlData: string;
    procedure SetXmlData(const Value: string);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure AddData(const AData: PChar; ADataSize: Integer); override;
    procedure AfterAddData; override;
    function GetData: TStream; override;
  public
    procedure Assign(Source: TPersistent); override;
    property XmlData: string read FXmlData write SetXmlData;
  end;

  TclAttachmentItem = class(TclSoapMessageItem)
  protected            
    procedure AddData(const AData: PChar; ADataSize: Integer); override;
    procedure AfterAddData; override;
    function GetData: TStream; override;
  end;

  TclSoapMessage = class(TclHttpRequest)
  private
    FSignReferences: TStrings;
    FSignTransforms: TStrings;
    FIdName: string;
    FIsIncludeCertificate: Boolean;
    FSignatureStyle: TclSignatureStyle;
    FOnGetCertificate: TclOnGetCertificateEvent;
    FOnTransformData: TclTransformDataEvent;
    FCertificates: TclCertificateStore;
    function GetAvailableProviderType: DWORD;
    class function GetLastErrorText(const AFuncName: string): string;
    procedure SetSignReferences(const Value: TStrings);
    procedure SetSignTransforms(const Value: TStrings);
    procedure DoListChanged(Sender: TObject);
    function GetNameSpace(ANode: IXMLDOMNode): string;
    function CreateSignature(ACertificate: TclCertificate; ASignedInfo: IXMLDomNode): IXMLDomNode;
    function CreateSignedInfo(ADom: IXMLDomDocument): IXMLDomNode;
    function CreateSecuredKeyInfo(ACertificate: TclCertificate; ASignature: IXMLDOMNode): IXMLDOMNode;
    function GetDigestValue(const AXml: string): string;
    function GetSignatureValue(ACertificate: TclCertificate; const AXml: string): string;
    function GetCertificate: TclCertificate;
    procedure SetIdName(const Value: string);
    procedure SetSignatureStyle(const Value: TclSignatureStyle);
    function TransformData(const AData: IXMLDomNode; const Algorithm: string): IXMLDomNode;
    function CreateTransforms(const AReference, AData: IXMLDomNode): IXMLDomNode;
    function ApplyTransforms(const AReference, AData: IXMLDomNode): IXMLDomNode;
    procedure CheckRequestExists;
    procedure RemoveNode(ANode: IXMLDOMNode);
    function GetIsSigned: Boolean;
    procedure SetIsIncludeCertificate(const Value: Boolean);
    function GetCertificateFromNode(ANode: IXMLDOMNode): TclCertificate;
    procedure VerifySignature(ASecurity: IXMLDOMNode);
    procedure VerifyReferenceDigests(ADom: IXMLDOMDocument; ASignature: IXMLDOMNode);
    procedure VerifySignatureValue(ACertificate: TclCertificate;
      const AData, ASignature: string); overload;
    procedure VerifySignatureValue(ACertificate: TclCertificate;
      const AData: IXMLDOMNode; const ASignature: string); overload;
    procedure VerifyDigestValue(const AData: IXMLDOMNode; const ADigestValue: string);
    function GetDsNodeName(const AName: string): string;
    function GetDsNameSpace(const AName: string): string;
    function GetHeader: TclSoapMessageHeader;
    procedure SetHeader(const Value: TclSoapMessageHeader);
  protected
    function CreateHeader: TclHttpRequestHeader; override;
    function CreateItem(AHeader, AFieldList: TStrings): TclHttpRequestItem; override;
    procedure CreateSingleItem(AStream: TStream); override;
    function GetContentType: string; override;
    procedure InitHeader; override;
    procedure DoGetCertificate(var ACertificate: TclCertificate; var Handled: Boolean); dynamic;
    procedure DoTransformData(const Algorithm: string; var ATemplate: string; var Handled: Boolean); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BuildSoapMessage(const AEnvelope, ASoapAction: string); overload;
    procedure BuildSoapMessage(AEnvelope: TStrings; const ASoapAction: string); overload;
    procedure BuildSoapMessage(AEnvelope: IXMLDOMDocument; const ASoapAction: string); overload;
    function AddXmlData(const AXmlData: string): TclXmlItem;
    function AddAttachment: TclAttachmentItem;
    procedure Sign;
    procedure Verify;
    procedure Clear; override;
    property IsSigned: Boolean read GetIsSigned;
    property Certificates: TclCertificateStore read FCertificates;
  published
    property Header: TclSoapMessageHeader read GetHeader write SetHeader;
    property SignReferences: TStrings read FSignReferences write SetSignReferences;
    property SignTransforms: TStrings read FSignTransforms write SetSignTransforms;
    property IdName: string read FIdName write SetIdName;
    property IsIncludeCertificate: Boolean read FIsIncludeCertificate write SetIsIncludeCertificate default True;
    property SignatureStyle: TclSignatureStyle read FSignatureStyle write SetSignatureStyle default ssDotNet;
    property OnGetCertificate: TclOnGetCertificateEvent read FOnGetCertificate write FOnGetCertificate;
    property OnTransformData: TclTransformDataEvent read FOnTransformData write FOnTransformData;
  end;

  TclXmlCanonicalizer = class
  private
    function BuildXmlString(ARootNode: IXMLDOMNode): WideString;
    function BuildAttributes(ANode: IXMLDOMNode): WideString;
    function NormalizeAttributeValue(AValue: WideString): WideString;
    function NormalizeText(AText: WideString): WideString;
  public
    function Canonicalize(ARootNode: IXMLDOMNode): string;
  end;

resourcestring
  cSoapDataNotFound = 'Can not find the specified SOAP data item';
  cSoapFormatError = 'SOAP request format error';
  cGetNameSpaceFailed = 'Unable to obtain the namespace for the envelope node';
  cRequestEmpty = 'The xml data is not specified in the SOAP request object';
  cReferencesEmpty = 'The SOAP References are not defined for the SOAP request object';
  cVerifyDigestFailed = 'Digest values are different';
  
implementation

uses
  clCryptAPI{$IFDEF DEMO}, Forms{$ENDIF}, clEncoder, clUtils, clXmlUtils, clTranslator, clStreams;
                                           
const
  dsNameSpace = 'ds';
  wsseNameSpace = 'wsse';

{$IFNDEF DELPHI6}
function VarToWideStr(const V: Variant): WideString;
begin
  Result := WideString(VarToStr(V));
end;
{$ENDIF}

{ TclSoapMessage }

procedure TclSoapMessage.BuildSoapMessage(AEnvelope: TStrings; const ASoapAction: string);
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
    if (not IsHttpRequestDemoDisplayed) and (not IsCertDemoDisplayed)
      and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  Clear();
  AddXmlData(AEnvelope.Text);
  Header.ContentType := 'text/xml';
  Header.SoapAction := ASoapAction;
end;

constructor TclSoapMessage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCertificates := TclCertificateStore.Create(nil);
  FCertificates.StoreName := 'addressbook';
  FSignReferences := TStringList.Create();
  FSignTransforms := TStringList.Create();
  TStringList(FSignReferences).OnChange := DoListChanged;
  TStringList(FSignTransforms).OnChange := DoListChanged;
  FIdName := 'Id';
  FSignatureStyle := ssDotNet;
  FIsIncludeCertificate := True;
end;

destructor TclSoapMessage.Destroy;
begin
  FSignTransforms.Free();
  FSignReferences.Free();
  FCertificates.Free();
  inherited Destroy();
end;

procedure TclSoapMessage.DoListChanged(Sender: TObject);
begin
  BeginUpdate();
  EndUpdate();
end;

procedure TclSoapMessage.SetSignReferences(const Value: TStrings);
begin
  FSignReferences.Assign(Value);
end;

procedure TclSoapMessage.SetSignTransforms(const Value: TStrings);
begin
  FSignTransforms.Assign(Value);
end;

procedure TclSoapMessage.CheckRequestExists;
begin
  if (Self.Count = 0) or (not (Self.Items[0] is TclSoapMessageItem))
    or (TclXmlItem(Self.Items[0]).XmlData = '') then
  begin
    raise EclSoapMessageError.Create(cRequestEmpty);
  end;
end;

procedure TclSoapMessage.Sign;
var
  dom: IXMLDOMDocument;
  envNameSpace: string;
  envelope, header, security,
  signedInfo, signature: IXMLDOMNode;
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
    if (not IsHttpRequestDemoDisplayed) and (not IsCertDemoDisplayed)
      and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  CheckRequestExists();
  if (SignReferences.Count = 0) then
  begin
    raise EclSoapMessageError.Create(cReferencesEmpty);
  end;
  if IsSigned then
  begin
    raise EclSoapMessageError.Create(cMessageSigned);
  end;
  dom := CoDOMDocument.Create();
  dom.loadXML(TclXmlItem(Self.Items[0]).XmlData);
  envNameSpace := GetNameSpace(dom.lastChild);
  if (envNameSpace = '') then
  begin
    raise EclSoapMessageError.Create(cGetNameSpaceFailed);
  end;
  header := dom.selectSingleNode('//' + envNameSpace + ':Header');
  if (header = nil) then
  begin
    envelope := dom.selectSingleNode('//' + envNameSpace + ':Envelope');
    if (envelope = nil) then
    begin
      raise EclSoapMessageError.Create(cSoapFormatError);
    end;
    header := dom.createElement(envNameSpace + ':Header');
    envelope.insertBefore(header, envelope.firstChild);
  end;
  signedInfo := CreateSignedInfo(dom);

  cert := GetCertificate();

  signature := CreateSignature(cert, signedInfo);
  security := CreateSecuredKeyInfo(cert, signature);

  header.insertBefore(security, header.firstChild);
  TclXmlItem(Self.Items[0]).XmlData := dom.xml;
end;

procedure TclSoapMessage.RemoveNode(ANode: IXMLDOMNode);
begin
  if (ANode <> nil) and (ANode.parentNode <> nil) then
  begin
    ANode.parentNode.removeChild(ANode);
  end;
end;

function TclSoapMessage.GetCertificateFromNode(ANode: IXMLDOMNode): TclCertificate;
var
  certValue, encodedCertValue: string;
  encoder: TclEncoder;
begin
  Result := nil;
  if system.Pos('Base64Binary', GetAttributeValue(ANode, 'EncodingType')) = 0 then Exit;

  encoder := TclEncoder.Create(nil);
  try
    encodedCertValue := string(ANode.text);
    encodedCertValue := StringReplace(encodedCertValue, #32, '', [rfReplaceAll]);
    encoder.DecodeString(encodedCertValue, certValue, cmMIMEBase64);

    Result := TclCertificate.CreateFromBinary(PByte(certValue), Length(certValue));
    Certificates.Add(Result);
  finally
    encoder.Free();
  end;
end;

function TclSoapMessage.GetDsNodeName(const AName: string): string;
begin
  Result := AName;
  if (Result <> '') and (SignatureStyle = ssJava) then
  begin
    Result := dsNameSpace + ':' + Result;
  end;
end;

function TclSoapMessage.GetDsNameSpace(const AName: string): string;
begin
  Result := AName;
  if (Result <> '') and (SignatureStyle = ssJava) then
  begin
    Result := Result + ':' + dsNameSpace;
  end;
end;

procedure TclSoapMessage.VerifyDigestValue(const AData: IXMLDOMNode; const ADigestValue: string);
var
  canonicalizer: TclXmlCanonicalizer;
  encoder: TclEncoder;
  encodedDig, digest, calculated: string;
begin
  encoder := nil;
  canonicalizer := nil;
  try
    encoder := TclEncoder.Create(nil);
    canonicalizer := TclXmlCanonicalizer.Create();

    encodedDig := StringReplace(ADigestValue, #32, '', [rfReplaceAll]);
    encoder.DecodeString(encodedDig, digest, cmMIMEBase64);
    calculated := GetDigestValue(canonicalizer.Canonicalize(AData));
    if (calculated <> digest) then
    begin
      raise EclSoapMessageError.Create(cVerifyDigestFailed);
    end;
  finally
    canonicalizer.Free();
    encoder.Free();
  end;
end;

procedure TclSoapMessage.VerifySignatureValue(ACertificate: TclCertificate;
  const AData, ASignature: string);
var
  context: HCRYPTPROV;
  hash: HCRYPTHASH;
  key: HCRYPTKEY;
  s: string;
begin
  if not CryptAcquireContext(@context, nil, nil, GetAvailableProviderType(), 0) then
  begin
    if not CryptAcquireContext(@context, nil, nil, GetAvailableProviderType(), CRYPT_NEWKEYSET) then
    begin
      raise EclSoapMessageError.Create(GetLastErrorText('CryptAcquireContext'));
    end;
  end;
  try
    if not CryptImportPublicKeyInfoEx(context, X509_ASN_ENCODING or PKCS_7_ASN_ENCODING,
      @ACertificate.Context.pCertInfo.SubjectPublicKeyInfo, 0, 0, nil, @key) then
    begin
      raise EclSoapMessageError.Create(GetLastErrorText('CryptImportPublicKeyInfoEx'));
    end;
    try
      if not CryptCreateHash(context, CALG_SHA1, 0, 0, @hash) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptCreateHash'));
      end;
      try
        if not CryptHashData(hash, Pointer(AData), Length(AData), 0) then
        begin
          raise EclSoapMessageError.Create(GetLastErrorText('CryptHashData'));
        end;
        if not CryptVerifySignature(hash, Pointer(ASignature), Length(ASignature), key, nil, 0) then
        begin
          s := ReversedString(ASignature);
          if not CryptVerifySignature(hash, Pointer(s), Length(s), key, nil, 0) then
          begin
            raise EclSoapMessageError.Create(GetLastErrorText('CryptVerifySignature'));
          end;
        end;
      finally
        CryptDestroyHash(hash);
      end;
    finally
      CryptDestroyKey(key);
    end;
  finally
    CryptReleaseContext(context, 0);
  end;
end;

procedure TclSoapMessage.VerifySignatureValue(ACertificate: TclCertificate;
  const AData: IXMLDOMNode; const ASignature: string);
var
  encoder: TclEncoder;
  canonicalizer: TclXmlCanonicalizer;
  encodedSig, sig, data: string;
begin
  encoder := nil;
  canonicalizer := nil;
  try
    encoder := TclEncoder.Create(nil);
    canonicalizer := TclXmlCanonicalizer.Create();

    encodedSig := StringReplace(ASignature, #32, '', [rfReplaceAll]);
    encoder.DecodeString(encodedSig, sig, cmMIMEBase64);
    data := canonicalizer.Canonicalize(AData);

    VerifySignatureValue(ACertificate, data, sig);
  finally
    canonicalizer.Free();
    encoder.Free();
  end;
end;

procedure TclSoapMessage.VerifySignature(ASecurity: IXMLDOMNode);
var
  cert: TclCertificate;
  data, signature, keyInfo: IXMLDOMNode;
  s: string;
  handled: Boolean;
begin
  handled := False;
  DoGetCertificate(cert, handled);
  if (cert = nil) then
  begin
    keyInfo := ASecurity.selectSingleNode('//' + GetDsNodeName('KeyInfo') + '/' + wsseNameSpace
      + ':SecurityTokenReference/' + wsseNameSpace + ':Reference/@URI');
    if (keyInfo <> nil) then
    begin
      s := string(keyInfo.text);
      if (s <> '') and (s[1] = '#') then
      begin
        system.Delete(s, 1, 1);
      end;
      data := ASecurity.selectSingleNode('//*[@' + IdName + '="' + s + '"]');
      if (data = nil) then
      begin
        raise EclSoapMessageError.Create(cSoapDataNotFound);
      end;
      cert := GetCertificateFromNode(data);
    end;
  end;
  if (cert = nil) then
  begin
    raise EclSoapMessageError.Create(cCertificateRequired);
  end;
  signature := ASecurity.selectSingleNode('//' + GetDsNodeName('SignatureValue'));
  data := ASecurity.selectSingleNode('//' + GetDsNodeName('SignedInfo'));

  VerifySignatureValue(cert, data, string(signature.text));
end;

procedure TclSoapMessage.VerifyReferenceDigests(ADom: IXMLDOMDocument; ASignature: IXMLDOMNode);
var
  refList: IXMLDOMNodeList;
  data, reference: IXMLDOMNode;
  s: string;
begin
  refList := ASignature.selectNodes('//' + GetDsNodeName('Reference'));
  reference := refList.nextNode();
  while (reference <> nil) do
  begin
    s := GetAttributeValue(reference, 'URI');
    if (s <> '') and (s[1] = '#') then
    begin
      system.Delete(s, 1, 1);
    end;
    data := ADom.selectSingleNode('//*[@' + IdName + '="' + s + '"]');
    if (data = nil) then
    begin
      raise EclSoapMessageError.Create(cSoapDataNotFound);
    end;
    data := ApplyTransforms(reference, data);

    VerifyDigestValue(data, string(reference.selectSingleNode(GetDsNodeName('DigestValue')).text));

    reference := refList.nextNode();
  end;
end;

procedure TclSoapMessage.Verify;
var
  dom: IXMLDOMDocument;
  security, signature: IXMLDOMNode;
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
    if (not IsHttpRequestDemoDisplayed) and (not IsCertDemoDisplayed)
      and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  CheckRequestExists();
  if not IsSigned then
  begin
    raise EclSoapMessageError.Create(cMessageNotSigned);
  end;
  dom := CoDOMDocument.Create();
  dom.loadXML(TclXmlItem(Self.Items[0]).XmlData);
  security := dom.selectSingleNode('//' + wsseNameSpace + ':Security');
  if (security <> nil) then
  begin
    VerifySignature(security);
  end;
  signature := dom.selectSingleNode('//' + GetDsNodeName('Signature'));
  if (signature <> nil) then
  begin
    VerifyReferenceDigests(dom, signature);
  end;
  RemoveNode(signature);
  RemoveNode(security);
  TclXmlItem(Self.Items[0]).XmlData := dom.xml;
end;

function TclSoapMessage.GetCertificate: TclCertificate;
var
  handled: Boolean;
begin
  Result := nil;
  handled := False;
  DoGetCertificate(Result, handled);
  if (Result = nil) then
  begin
    raise EclSoapMessageError.Create(cCertificateRequired);
  end;
end;

procedure TclSoapMessage.DoGetCertificate(var ACertificate: TclCertificate; var Handled: Boolean);
begin
  if Assigned(OnGetCertificate) then
  begin
    OnGetCertificate(Self, ACertificate, Handled);
  end;
end;

function TclSoapMessage.CreateSecuredKeyInfo(ACertificate: TclCertificate;
  ASignature: IXMLDOMNode): IXMLDOMNode;
const
  KeyTokenId = 'X509Token';
var
  securityToken, keyInfo, node, reference: IXMLDOMNode;
  encoder: TclEncoder;
  certValue, encodedCertValue: string;
begin
  Result := ASignature.ownerDocument.createElement(wsseNameSpace + ':Security');
  SetAttributeValue(Result, 'xmlns:' + wsseNameSpace, 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');

  if IsIncludeCertificate then
  begin
    securityToken := ASignature.ownerDocument.createElement(wsseNameSpace + ':BinarySecurityToken');
    Result.appendChild(securityToken);

    SetAttributeValue(securityToken, 'ValueType', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3');
    SetAttributeValue(securityToken, 'EncodingType', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary');

    SetAttributeValue(securityToken, IdName, KeyTokenId);

    encoder := TclEncoder.Create(nil);
    try
      SetLength(certValue, ACertificate.Context.cbCertEncoded);
      system.Move(ACertificate.Context.pbCertEncoded^, Pointer(certValue)^, ACertificate.Context.cbCertEncoded);

      encoder.EncodeString(certValue, encodedCertValue, cmMIMEBase64);
      securityToken.text := encodedCertValue;
    finally
      encoder.Free();
    end;

    keyInfo := ASignature.ownerDocument.createElement(GetDsNodeName('KeyInfo'));
    ASignature.appendChild(keyInfo);

    node := ASignature.ownerDocument.createElement(wsseNameSpace + ':SecurityTokenReference');
    keyInfo.appendChild(node);

    reference := ASignature.ownerDocument.createElement(wsseNameSpace + ':Reference');
    node.appendChild(reference);

    SetAttributeValue(reference, 'URI', '#' + KeyTokenId);
  end;
  
  Result.appendChild(ASignature);
end;

function TclSoapMessage.GetNameSpace(ANode: IXMLDOMNode): string;
var
  ind: Integer;
begin
  ind := Pos(':', ANode.nodeName);
  if (ind > 0) then
  begin
    Result := Copy(ANode.nodeName, 1, ind - 1);
  end else
  begin
    Result := '';
  end;
end;

function TclSoapMessage.CreateSignedInfo(ADom: IXMLDomDocument): IXMLDomNode;
var
  i: Integer;
  reference, data, node: IXMLDomNode;
  canonicalizer: TclXmlCanonicalizer;
  encoder: TclEncoder;
  digestValue: string;
begin
  encoder := nil;
  canonicalizer := nil;
  try
    encoder := TclEncoder.Create(nil);
    canonicalizer := TclXmlCanonicalizer.Create();
    Result := ADom.createElement(GetDsNodeName('SignedInfo'));

    node := ADom.createElement(dsNameSpace + ':CanonicalizationMethod');
    Result.appendChild(node);
    SetAttributeValue(node, 'Algorithm', 'http://www.w3.org/2001/10/xml-exc-c14n#');
    if (SignatureStyle = ssDotNet) then
    begin
      SetAttributeValue(node, 'xmlns:' + dsNameSpace, 'http://www.w3.org/2000/09/xmldsig#');
    end;

    node := ADom.createElement(GetDsNodeName('SignatureMethod'));
    Result.appendChild(node);
    SetAttributeValue(node, 'Algorithm', 'http://www.w3.org/2000/09/xmldsig#rsa-sha1');

    for i := 0 to SignReferences.Count - 1 do
    begin
      reference := ADom.createElement(GetDsNodeName('Reference'));
      Result.appendChild(reference);
      SetAttributeValue(reference, 'URI', '#' + SignReferences[i]);

      data := ADom.selectSingleNode('//*[@' + IdName + '="' + SignReferences[i] + '"]');
      if (data = nil) then
      begin
        raise EclSoapMessageError.Create(cSoapDataNotFound);
      end;

      data := CreateTransforms(reference, data);

      node := ADom.createElement(GetDsNodeName('DigestMethod'));
      reference.appendChild(node);
      SetAttributeValue(node, 'Algorithm', 'http://www.w3.org/2000/09/xmldsig#sha1');

      node := ADom.createElement(GetDsNodeName('DigestValue'));
      reference.appendChild(node);
      encoder.EncodeString(GetDigestValue(canonicalizer.Canonicalize(data)), digestValue, cmMIMEBase64);
      node.text := digestValue;
    end;
  finally
    canonicalizer.Free();
    encoder.Free();
  end;
end;

function TclSoapMessage.CreateTransforms(const AReference, AData: IXMLDomNode): IXMLDomNode;
var
  i: Integer;
  transforms, node: IXMLDomNode;
begin
  Result := AData;

  transforms := AData.ownerDocument.createElement(GetDsNodeName('Transforms'));
  AReference.appendChild(transforms);

  for i := 0 to SignTransforms.Count - 1 do
  begin
    node := AData.ownerDocument.createElement(GetDsNodeName('Transform'));
    transforms.appendChild(node);
    SetAttributeValue(node, 'Algorithm', SignTransforms[i]);
    Result := TransformData(Result, SignTransforms[i]);
  end;
end;

function TclSoapMessage.ApplyTransforms(const AReference, AData: IXMLDomNode): IXMLDomNode;
var
  list: IXMLDOMNodeList;
  transform: IXMLDomNode;
begin
  Result := AData;
  list := AReference.selectNodes('//' + GetDsNodeName('Transform/@Algorithm'));
  transform := list.nextNode();
  while (transform <> nil) do
  begin
    Result := TransformData(Result, string(transform.text));
    transform := list.nextNode();
  end;
end;

function TclSoapMessage.TransformData(const AData: IXMLDomNode; const Algorithm: string): IXMLDomNode;
var
  transDom, resDom: IXMLDOMDocument;
  template: string;
  handled: Boolean;
begin
  Result := AData;

  transDom := CoDOMDocument.Create();
  resDom := CoDOMDocument.Create();

  handled := False;
  template := '';
  DoTransformData(Algorithm, template, handled);

  if handled then
  begin
    transDom.loadXML(template);
    if (transDom.xml = '') then
    begin
      raise EclSoapMessageError.Create(string(transDom.parseError.srcText + #13#10 + transDom.parseError.reason));
    end;
    Assert(transDom.xml <> '');

    AData.transformNodeToObject(transDom, resDom);
    if (resDom.xml = '') then
    begin
      raise EclSoapMessageError.Create(string(resDom.parseError.srcText + #13#10 + resDom.parseError.reason));
    end;

    Result := resDom.firstChild;
  end;
end;

function TclSoapMessage.CreateSignature(ACertificate: TclCertificate;
  ASignedInfo: IXMLDomNode): IXMLDomNode;
var
  node: IXMLDomNode;
  sigValue, encSigValue: string;
  encoder: TclEncoder;
  canonicalizer: TclXmlCanonicalizer;
begin
  encoder := nil;
  canonicalizer := nil;
  try
    encoder := TclEncoder.Create(nil);
    canonicalizer := TclXmlCanonicalizer.Create();

    Result := ASignedInfo.ownerDocument.createElement(GetDsNodeName('Signature'));
    Result.appendChild(ASignedInfo);

    SetAttributeValue(Result, GetDsNameSpace('xmlns'), 'http://www.w3.org/2000/09/xmldsig#');

    node := ASignedInfo.ownerDocument.createElement(GetDsNodeName('SignatureValue'));
    Result.appendChild(node);

    if (GetAttributeValue(ASignedInfo, GetDsNameSpace('xmlns')) = '') then
    begin
      SetAttributeValue(ASignedInfo, GetDsNameSpace('xmlns'), 'http://www.w3.org/2000/09/xmldsig#');
    end;

    sigValue := GetSignatureValue(ACertificate, canonicalizer.Canonicalize(ASignedInfo));

    if (SignatureStyle = ssDotNet) then
    begin
      sigValue := ReversedString(sigValue);
    end;

    encoder.EncodeString(sigValue, encSigValue, cmMIMEBase64);

    SetAttributeValue(ASignedInfo, GetDsNameSpace('xmlns'), '');

    node.text := encSigValue;
  finally
    canonicalizer.Free();
    encoder.Free();
  end;
end;

function TclSoapMessage.GetSignatureValue(ACertificate: TclCertificate; const AXml: string): string;
var
  context: HCRYPTPROV;
  hash: HCRYPTHASH;
  sigData: TclCryptData;
  sigSize, keySpec: DWORD;
  callerFree: BOOL;
begin
  if (not CryptAcquireCertificatePrivateKey(ACertificate.Context,
    CRYPT_ACQUIRE_COMPARE_KEY_FLAG, nil, @context, @keySpec, @callerFree)) or (not callerFree) then
  begin
    raise EclSoapMessageError.Create(GetLastErrorText('CryptAcquireCertificatePrivateKey'));
  end;
  try
    if not CryptCreateHash(context, CALG_SHA1, 0, 0, @hash) then
    begin
      raise EclSoapMessageError.Create(GetLastErrorText('CryptCreateHash'));
    end;
    sigData := TclCryptData.Create();
    try
      if not CryptHashData(hash, Pointer(AXml), Length(AXml), 0) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptHashData'));
      end;
      if not CryptSignHash(hash, AT_KEYEXCHANGE, nil, 0, nil, @sigSize) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptSignHash'));
      end;
      sigData.Allocate(sigSize);
      if not CryptSignHash(hash, AT_KEYEXCHANGE, nil, 0, sigData.Data, @sigSize) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptSignHash'));
      end;
      SetLength(Result, sigSize);
      system.Move(sigData.Data^, Pointer(Result)^, sigSize);
    finally
      sigData.Free();
      CryptDestroyHash(hash);
    end;
  finally
    CryptReleaseContext(context, 0);
  end;
end;

function TclSoapMessage.GetDigestValue(const AXml: string): string;
var
  context: HCRYPTPROV;
  hash: HCRYPTHASH;
  data: TclCryptData;
  hashSize, dwordSize: DWORD;
begin
  if not CryptAcquireContext(@context, nil, nil, GetAvailableProviderType(), 0) then
  begin
    if not CryptAcquireContext(@context, nil, nil, GetAvailableProviderType(), CRYPT_NEWKEYSET) then
    begin
      raise EclSoapMessageError.Create(GetLastErrorText('CryptAcquireContext'));
    end;
  end;
  try
    if not CryptCreateHash(context, CALG_SHA1, 0, 0, @hash) then
    begin
      raise EclSoapMessageError.Create(GetLastErrorText('CryptCreateHash'));
    end;
    data := TclCryptData.Create();
    try
      if not CryptHashData(hash, Pointer(AXml), Length(AXml), 0) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptHashData'));
      end;
      dwordSize := SizeOf(DWORD);
      if not CryptGetHashParam(hash, HP_HASHSIZE, @hashSize, @dwordSize, 0) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptGetHashParam'));
      end;
      data.Allocate(hashSize);
      if not CryptGetHashParam(hash, HP_HASHVAL, data.Data, @hashSize, 0) then
      begin
        raise EclSoapMessageError.Create(GetLastErrorText('CryptGetHashParam'));
      end;
      SetLength(Result, data.DataSize);
      system.Move(data.Data^, Pointer(Result)^, data.DataSize);
    finally
      data.Free();
      CryptDestroyHash(hash);
    end;
  finally
    CryptReleaseContext(context, 0);
  end;
end;

class function TclSoapMessage.GetLastErrorText(const AFuncName: string): string;
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
  if (Trim(Result) = '') then
  begin
    Result := Format('%s error - %d', [AFuncName, code]);
  end;
end;

procedure TclSoapMessage.SetIdName(const Value: string);
begin
  if (FIdName <> Value) then
  begin
    BeginUpdate();
    FIdName := Value;
    EndUpdate();
  end;
end;

procedure TclSoapMessage.DoTransformData(const Algorithm: string;
  var ATemplate: string; var Handled: Boolean);
begin
  if Assigned(OnTransformData) then
  begin
    OnTransformData(Self, Algorithm, ATemplate, Handled);
  end;
end;

procedure TclSoapMessage.BuildSoapMessage(AEnvelope: IXMLDOMDocument; const ASoapAction: string);
var
  src: TStrings;
begin
  src := TStringList.Create();
  try
    src.Text := string(AEnvelope.xml);
    BuildSoapMessage(src, ASoapAction);
  finally
    src.Free();
  end;
end;

function TclSoapMessage.GetIsSigned: Boolean;
var
  dom: IXMLDOMDocument;
begin
  try
    CheckRequestExists();
    dom := CoDOMDocument.Create();
    dom.loadXML(TclXmlItem(Self.Items[0]).XmlData);
    Result := (dom.selectSingleNode('//' + GetDsNodeName('Signature')) <> nil);
  except
    Result := False;
  end;
end;

procedure TclSoapMessage.SetIsIncludeCertificate(const Value: Boolean);
begin
  if (FIsIncludeCertificate <> Value) then
  begin
    BeginUpdate();
    FIsIncludeCertificate := Value;
    EndUpdate();
  end;
end;

procedure TclSoapMessage.Clear;
begin
  Certificates.Close();
  inherited Clear();
end;

procedure TclSoapMessage.SetSignatureStyle(const Value: TclSignatureStyle);
begin
  if (FSignatureStyle <> Value) then
  begin
    BeginUpdate();
    FSignatureStyle := Value;
    EndUpdate();
  end;
end;

procedure TclSoapMessage.BuildSoapMessage(const AEnvelope, ASoapAction: string);
var
  env: TStrings;
begin
  env := TStringList.Create();
  try
    env.Text := AEnvelope;
    BuildSoapMessage(env, ASoapAction);
  finally
    env.Free();
  end;
end;

function TclSoapMessage.GetAvailableProviderType: DWORD;
var
  i, len: DWORD;
begin
  i := 0;
  while CryptEnumProviderTypes(i, nil, 0, @Result, nil, @len) do
  begin
    if (Result in [PROV_RSA_FULL, PROV_DSS, PROV_RSA_SCHANNEL,
      PROV_DSS_DH, PROV_DH_SCHANNEL, PROV_RSA_AES]) then Exit;
    Inc(i);
  end;
  Result := PROV_RSA_FULL;
end;

function TclSoapMessage.CreateItem(AHeader, AFieldList: TStrings): TclHttpRequestItem;
var
  contentType: string;
begin
  if SameText(Header.ContentType, 'multipart/related') then
  begin
    contentType := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Type');
    if SameText(GetHeaderFieldValueItem(contentType, ''), 'text/xml') then
    begin
      Result := AddXmlData('');
    end else
    begin
      Result := AddAttachment();
    end;
  end else
  begin
    Result := inherited CreateItem(AHeader, AFieldList);
  end;
end;

procedure TclSoapMessage.CreateSingleItem(AStream: TStream);
var
  s: string;
begin
  if (Header.ContentType = '') or (system.Pos('multipart/related', LowerCase(Header.ContentType)) > 0)
    or (system.Pos('text/xml', LowerCase(Header.ContentType)) > 0) then
  begin
    SetLength(s, AStream.Size);
    AStream.Read(Pointer(s)^, AStream.Size);
    AddXmlData(s).AfterAddData();
  end else
  begin
    inherited CreateSingleItem(AStream);
  end;
end;

function TclSoapMessage.GetContentType: string;
const
  RequestTypes: array[Boolean] of string = ('text/xml', 'multipart/related');
var
  i: Integer;
  isXmlData: Boolean;
begin
  isXmlData := False;
  for i := 0 to Count - 1 do
  begin
    if (Items[i] is TclSoapMessageItem) then
    begin
      isXmlData := True;
    end;
  end;
  if isXmlData then
  begin
    Result := RequestTypes[Count > 1];
  end else
  begin
    Result := inherited GetContentType();
  end;
end;

function TclSoapMessage.AddXmlData(const AXmlData: string): TclXmlItem;
begin
  BeginUpdate();
  try
    Result := Add(TclXmlItem) as TclXmlItem;
    Result.XmlData := AXmlData;
  finally
    EndUpdate();
  end;
end;

function TclSoapMessage.AddAttachment: TclAttachmentItem;
begin
  Result := Add(TclAttachmentItem) as TclAttachmentItem;
end;

function TclSoapMessage.CreateHeader: TclHttpRequestHeader;
begin
  Result := TclSoapMessageHeader.Create();
end;

function TclSoapMessage.GetHeader: TclSoapMessageHeader;
begin
  Result := inherited Header as TclSoapMessageHeader;
end;

procedure TclSoapMessage.SetHeader(const Value: TclSoapMessageHeader);
begin
  Header := Value;
end;

procedure TclSoapMessage.InitHeader;
begin
  inherited InitHeader();
  if (Count > 1) and (Items[0] is TclSoapMessageItem) then
  begin
    if (Header.Start = '') then
    begin
      Header.Start := (Items[0] as TclSoapMessageItem).ContentID;
    end;

    if (Header.SubType = '') then
    begin
      Header.SubType := (Items[0] as TclSoapMessageItem).ContentType;
    end;
  end;
end;

{ TclXmlCanonicalizer }

function WideStringReplace(const S, OldPattern, NewPattern: WideString): WideString;
var
  SearchStr, Patt, NewStr: WideString;
  Offset: Integer;
begin
  SearchStr := S;
  Patt := OldPattern;

  NewStr := S;
  Result := '';
  while (SearchStr <> '') do
  begin
    Offset := system.Pos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    Result := Result + system.Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := system.Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    SearchStr := system.Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

function TclXmlCanonicalizer.NormalizeAttributeValue(AValue: WideString): WideString;
begin
  Result := AValue;
  Result := WideStringReplace(Result, '"', '&quot;');
  Result := WideStringReplace(Result, #9, #32);
  Result := WideStringReplace(Result, #13#10, #32);
  Result := WideStringReplace(Result, #13, #32);
  Result := WideStringReplace(Result, #10, #32);
end;

function TclXmlCanonicalizer.NormalizeText(AText: WideString): WideString;
begin
  Result := AText;
  Result := WideStringReplace(Result, #13#10, #10);
  Result := WideStringReplace(Result, #13, #10);
end;

function TclXmlCanonicalizer.BuildAttributes(ANode: IXMLDOMNode): WideString;
var
  i: Integer;
  attributes, namespaces: TclWideStringList;
  element: IXMLDOMElement;
  Temp: Pointer;
begin
  Result := '';
  if not Supports(ANode, IXMLDOMElement, Temp) then Exit;

  attributes := nil;
  namespaces := nil;
  try
    attributes := TclWideStringList.Create();
    attributes.Sorted := True;

    namespaces := TclWideStringList.Create();
    namespaces.Sorted := True;

    element := (ANode as IXMLDOMElement);
    for i := 0 to element.attributes.length - 1 do
    begin
      if (system.Pos('xmlns', LowerCase(element.attributes.item[i].nodeName)) = 1) then
      begin
        namespaces.Add(element.attributes.item[i].nodeName + '="'
          + NormalizeAttributeValue(VarToWideStr(element.attributes.item[i].nodeValue)) + '"');
      end else
      begin
        attributes.Add(element.attributes.item[i].nodeName + '="'
          + NormalizeAttributeValue(VarToWideStr(element.attributes.item[i].nodeValue)) + '"');
      end;
    end;
    for i := 0 to namespaces.Count - 1 do
    begin
      Result := Result + ' ' + Trim(namespaces[i]);
    end;
    for i := 0 to attributes.Count - 1 do
    begin
      Result := Result + ' ' + Trim(attributes[i]);
    end;
  finally
    namespaces.Free();
    attributes.Free();
  end;
end;

function TclXmlCanonicalizer.BuildXmlString(ARootNode: IXMLDOMNode): WideString;
var
  i: Integer;
  Temp: Pointer;
begin
  if Supports(ARootNode, IXMLDOMText, Temp) then
  begin
    Result := Result + NormalizeText(VarToWideStr(ARootNode.nodeValue));
  end else
  begin
    Result := '<' + ARootNode.nodeName + BuildAttributes(ARootNode) + '>';
    for i := 0 to ARootNode.childNodes.length - 1 do
    begin
      Result := Result + BuildXmlString(ARootNode.childNodes.item[i]);
    end;
    Result := Result + '</' + ARootNode.nodeName + '>';
  end;
end;

function TclXmlCanonicalizer.Canonicalize(ARootNode: IXMLDOMNode): string;
var
  dom: IXMLDOMDocument;
begin
  dom := CoDOMDocument.Create();
  dom.loadXML(ARootNode.xml);
  Result := TclCharSetTranslator.TranslateToUtf8(BuildXmlString(dom.lastChild));
end;

{ TclSoapMessageItem }

procedure TclSoapMessageItem.Assign(Source: TPersistent);
var
  Src: TclSoapMessageItem;
begin
  BeginUpdate();
  try
    if (Source is TclSoapMessageItem) then
    begin
      Src := (Source as TclSoapMessageItem);

      ContentType := Src.ContentType;
      CharSet := Src.CharSet;
      ContentID := Src.ContentID;
      ContentLocation := Src.ContentLocation;
      ContentTransferEncoding := Src.ContentTransferEncoding;
      ExtraFields := Src.ExtraFields;
    end;
    inherited Assign(Source);
  finally
    EndUpdate();
  end;
end;

procedure TclSoapMessageItem.ListChangeEvent(Sender: TObject);
begin
  Update();
end;

constructor TclSoapMessageItem.Create(AOwner: TclHttpRequest);
begin
  inherited Create(AOwner);
  FKnownFields := TStringList.Create();

  FExtraFields := TStringList.Create();
  TStringList(FExtraFields).OnChange := ListChangeEvent;

  RegisterFields();
  
  ContentType := 'text/xml';
end;

destructor TclSoapMessageItem.Destroy;
begin
  FExtraFields.Free();
  FKnownFields.Free();
  inherited Destroy();
end;

function TclSoapMessageItem.GetHeader: TStream;
var
  s: string;
  list: TStrings;
begin
  list := TStringList.Create();
  try
    s := ContentType;
    if (s <> '') then
    begin
      s := AddHttpFieldItem(s, 'charset', CharSet);
    end;
    AddHeaderField(list, 'Content-Type', s);

    AddHeaderField(list, 'Content-ID', ContentID);
    AddHeaderField(list, 'Content-Location', ContentLocation);
    AddHeaderField(list, 'Content-Transfer-Encoding', ContentTransferEncoding);
    list.AddStrings(ExtraFields);
    list.Add('');

    Result := TStringStream.Create(list.Text);
  finally
    list.Free();
  end;
end;

function TclSoapMessageItem.GetData: TStream;
begin
  if (Owner <> nil)and TclSoapMessage(Owner).IsMultiPart() then
  begin
    Result := GetHeader();
  end else
  begin
    Result := TclNullStream.Create();
  end;
end;

procedure TclSoapMessageItem.SetContentID(const Value: string);
begin
  if (FContentID <> Value) then
  begin
    FContentID := Value;
    Update();
  end;
end;

procedure TclSoapMessageItem.SetContentLocation(const Value: string);
begin
  if (FContentLocation <> Value) then
  begin
    FContentLocation := Value;
    Update();
  end;
end;

procedure TclSoapMessageItem.SetContentTransferEncoding(
  const Value: string);
begin
  if (FContentTransferEncoding <> Value) then
  begin
    FContentTransferEncoding := Value;
    Update();
  end;
end;

procedure TclSoapMessageItem.SetContentType(const Value: string);
begin
  if (FContentType <> Value) then
  begin
    FContentType := Value;
    Update();
  end;
end;

procedure TclSoapMessageItem.SetExtraFields(const Value: TStrings);
begin
  FExtraFields.Assign(Value);
end;

procedure TclSoapMessageItem.SetCharSet(const Value: string);
begin
  if (FCharSet <> Value) then
  begin
    FCharSet := Value;
    Update();
  end;
end;

procedure TclSoapMessageItem.ReadData(Reader: TReader);
begin
  BeginUpdate();
  try
    inherited ReadData(Reader);
    ContentType := Reader.ReadString();
    CharSet := Reader.ReadString();
    ContentID := Reader.ReadString();
    ContentLocation := Reader.ReadString();
    ContentTransferEncoding := Reader.ReadString();
    ExtraFields.Text := Reader.ReadString();
  finally
    EndUpdate();
  end;
end;

procedure TclSoapMessageItem.WriteData(Writer: TWriter);
begin
  inherited WriteData(Writer);
  Writer.WriteString(ContentType);
  Writer.WriteString(CharSet);
  Writer.WriteString(ContentID);
  Writer.WriteString(ContentLocation);
  Writer.WriteString(ContentTransferEncoding);
  Writer.WriteString(ExtraFields.Text);
end;

procedure TclSoapMessageItem.ParseHeader(AHeader, AFieldList: TStrings);
var
  s: string;
begin
  BeginUpdate();
  try
    inherited ParseHeader(AHeader, AFieldList);

    s := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Type');
    ContentType := GetHeaderFieldValueItem(s, '');
    CharSet := GetHeaderFieldValueItem(s, 'charset=');

    ContentID := GetHeaderFieldValue(AHeader, AFieldList, 'Content-ID');
    ContentLocation := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Location');
    ContentTransferEncoding := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Transfer-Encoding');

    ParseExtraFields(AHeader, AFieldList);
  finally
    EndUpdate();
  end;
end;

procedure TclSoapMessageItem.ParseExtraFields(AHeader, AFieldList: TStrings);
var
  i: Integer;
  s: string;
begin
  ExtraFields.Clear();
  for i := 0 to AFieldList.Count - 1 do
  begin
    if (FindInStrings(FKnownFields, AFieldList[i]) < 0) then
    begin
      s := system.Copy(AHeader[Integer(AFieldList.Objects[i])], 1, Length(AFieldList[i]));
      ExtraFields.Add(s + ': ' + GetHeaderFieldValue(AHeader, AFieldList, i));
    end;
  end;
end;

procedure TclSoapMessageItem.RegisterField(const AField: string);
begin
  if (FindInStrings(FKnownFields, AField) < 0) then
  begin
    FKnownFields.Add(AField);
  end;
end;

procedure TclSoapMessageItem.RegisterFields;
begin
  RegisterField('Content-Type');
  RegisterField('Content-ID');
  RegisterField('Content-Location');
  RegisterField('Content-Transfer-Encoding');
end;

{ TclAttachmentItem }

procedure TclAttachmentItem.AddData(const AData: PChar; ADataSize: Integer);
var
  stream: TStream;
begin
  if (Owner = nil) then Exit;

  stream := TclSoapMessage(Owner).DataStream;
  if (stream = nil) then
  begin
    TclSoapMessage(Owner).DoGetDataStream(Self, stream);
  end;
  if (stream <> nil) then
  begin
    stream.Write(AData^, ADataSize);
  end;
  TclSoapMessage(Owner).DataStream := stream;
end;

procedure TclAttachmentItem.AfterAddData;
var
  soapMessage: TclSoapMessage;
begin
  if (Owner = nil) or (not (Owner is TclSoapMessage)) then Exit;
  soapMessage := TclSoapMessage(Owner);

  if (soapMessage.DataStream <> nil) and Assigned(soapMessage.OnDataAdded) then
  begin
    soapMessage.DataStream.Position := 0;
    soapMessage.DoDataAdded(Self, soapMessage.DataStream);
  end;
end;

function TclAttachmentItem.GetData: TStream;
var
  stream: TStream;
begin
  Result := TclMultiStream.Create();
  try
    TclMultiStream(Result).AddStream(inherited GetData());

    stream := nil;
    if (Owner <> nil) then
    begin
      TclSoapMessage(Owner).DoGetDataSourceStream(Self, stream);
    end;

    if (stream <> nil) then
    begin
      stream.Position := 0;
      TclMultiStream(Result).AddStream(stream);
    end;
  except
    Result.Free();
    raise;
  end;
end;

{ TclSoapMessageHeader }

procedure TclSoapMessageHeader.Assign(Source: TPersistent);
var
  Src: TclSoapMessageHeader;
begin
  BeginUpdate();
  try
    inherited Assign(Source);

    if (Source is TclSoapMessageHeader) then
    begin
      Src := (Source as TclSoapMessageHeader);
      Start := Src.Start;
      SubType := Src.SubType;
      SoapAction := Src.SoapAction;
    end;
  finally
    EndUpdate();
  end;
end;

procedure TclSoapMessageHeader.AssignContentType(AHeader: TStrings);
var
  s: string;
begin
  s := ContentType;
  if (s <> '') then
  begin
    s := AddHttpFieldItem(s, 'boundary', Boundary);
    s := AddHttpFieldItem(s, 'type', SubType);
    s := AddHttpFieldItem(s, 'start', Start);
    AddHeaderField(AHeader, 'Content-Type', s);
  end;
end;

procedure TclSoapMessageHeader.Clear;
begin
  BeginUpdate();
  try
    inherited Clear();
    Start := '';
    SubType := '';
    SoapAction := '';
  finally
    EndUpdate();
  end;
end;

procedure TclSoapMessageHeader.InternalAssignHeader(AHeader: TStrings);
begin
  inherited InternalAssignHeader(AHeader);
  AddHeaderField(AHeader, 'SOAPAction', SoapAction);
end;

procedure TclSoapMessageHeader.InternalParseHeader(AHeader, AFieldList: TStrings);
begin
  inherited InternalParseHeader(AHeader, AFieldList);
  SoapAction := GetHeaderFieldValue(AHeader, AFieldList, 'SOAPAction');
end;

procedure TclSoapMessageHeader.ParseContentType(AHeader, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseContentType(AHeader, AFieldList);
  s := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Type');
  Start := GetHeaderFieldValueItem(s, 'start=');
  SubType := GetHeaderFieldValueItem(s, 'type=');
end;

procedure TclSoapMessageHeader.RegisterFields;
begin
  inherited RegisterFields();
  RegisterField('SOAPAction');
end;

procedure TclSoapMessageHeader.SetSoapAction(const Value: string);
begin
  if (FSoapAction <> Value) then
  begin
    FSoapAction := Value;
    Update();
  end;
end;

procedure TclSoapMessageHeader.SetStart(const Value: string);
begin
  if (FStart <> Value) then
  begin
    FStart := Value;
    Update();
  end;
end;

procedure TclSoapMessageHeader.SetSubType(const Value: string);
begin
  if (FSubType <> Value) then
  begin
    FSubType := Value;
    Update();
  end;
end;

{ TclXmlItem }

procedure TclXmlItem.AddData(const AData: PChar; ADataSize: Integer);
begin
  XmlData := XmlData + system.Copy(AData, 1, ADataSize);
end;

procedure TclXmlItem.AfterAddData;
var
  stream: TStream;
begin
  if (Owner = nil) then Exit;

  if Assigned(Owner.OnDataAdded) then
  begin
    stream := TStringStream.Create(XmlData);
    try
      TclSoapMessage(Owner).DoDataAdded(Self, stream);
    finally
      stream.Free();
    end;
  end;
end;

procedure TclXmlItem.Assign(Source: TPersistent);
begin
  BeginUpdate();
  try
    if (Source is TclXmlItem) then
    begin
      XmlData := (Source as TclXmlItem).XmlData;
    end;
    inherited Assign(Source);
  finally
    EndUpdate();
  end;
end;

function TclXmlItem.GetData: TStream;
begin
  Result := TclMultiStream.Create();
  try
    TclMultiStream(Result).AddStream(inherited GetData());
    TclMultiStream(Result).AddStream(TStringStream.Create(XmlData));
  except
    Result.Free();
    raise;
  end;
end;

procedure TclXmlItem.ReadData(Reader: TReader);
begin
  BeginUpdate();
  try
    inherited ReadData(Reader);
    XmlData := Reader.ReadString();
  finally
    EndUpdate();
  end;
end;

procedure TclXmlItem.SetXmlData(const Value: string);
begin
  if (FXmlData <> Value) then
  begin
    FXmlData := Value;
    Update();
  end;
end;

procedure TclXmlItem.WriteData(Writer: TWriter);
begin
  inherited WriteData(Writer);
  Writer.WriteString(XmlData);
end;

end.

