{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSspi;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARNINGS OFF}
{$ENDIF}

uses
  Classes, SysUtils, Windows, clCryptAPI, clSocket, clCert;
 
type
  EclSSPIError = class(EclSocketError);

  TSecHandle = record
    dwLower: Cardinal;
    dwUpper: Cardinal;
  end;
  PSecHandle = TSecHandle;

  TCredHandle = TSecHandle;
  PCredHandle = ^TSecHandle;
  TCtxtHandle = TSecHandle;
  PCtxtHandle = ^TSecHandle;

  PLUID = PLargeInteger;

  PCardinal = ^Cardinal;
  PTimeStamp = ^TTimeStamp;

{$IFDEF DELPHI5}
  SECURITY_STATUS = HRESULT;
{$ELSE}
  SECURITY_STATUS = type Longint;
{$ENDIF}

  PSecBuffer = ^TSecBuffer;
  TSecBuffer = record
    cbBuffer: Cardinal;             // Size of the buffer, in bytes
    BufferType: Cardinal;           // Type of the buffer (below)
    pvBuffer: Pointer;              // Pointer to the buffer
  end;

  PSecBufferDesc = ^TSecBufferDesc;
  TSecBufferDesc = record
    ulVersion: Cardinal;            // Version number
    cBuffers: Cardinal;             // Number of buffers
    pBuffers: PSecBuffer;           // Pointer to array of buffers
  end;

  PSecPkgInfo = ^TSecPkgInfo;
  TSecPkgInfo = record
    fCapabilities: Cardinal;        // capability of bit mask
    wVersion: Word;                 // version of driver
    wRPCID: Word;                   // identifier for RPC run time
    cbMaxToken: Cardinal;           // size of authentication token
    Name: PChar;                    // text name
    Comment: PChar;                 // comment
  end;
  PSecPkgInfoArray = ^TSecPkgInfoArray;
  TSecPkgInfoArray = array[0..0] of TSecPkgInfo;

  PSecPkgContext_Sizes = ^TSecPkgContext_Sizes;
  TSecPkgContext_Sizes = record
    cbMaxToken: Cardinal;
    cbMaxSignature: Cardinal;
    cbBlockSize: Cardinal;
    cbSecurityTrailer: Cardinal;
  end;

  PSecPkgContext_StreamSizes = ^TSecPkgContext_StreamSizes;
  TSecPkgContext_StreamSizes = record
    cbHeader: Cardinal;
    cbTrailer: Cardinal;
    cbMaximumMessage: Cardinal;
    cBuffers: Cardinal;
    cbBlockSize: Cardinal;
  end;

  PSecPkgCred_SupportedAlgs = ^TSecPkgCred_SupportedAlgs;
  TSecPkgCred_SupportedAlgs = record
    cSupportedAlgs: Cardinal;
    palgSupportedAlgs: Pointer;
  end;
  
  PSChannel_Cred = ^TSChannel_Cred;
  TSChannel_Cred = record
    dwVersion: Cardinal;
    cCreds: Cardinal;
    paCred: Pointer; //PCCERT_CONTEXT *
    hRootStore: Cardinal; //HCERTSTORE
    cMappers: Pointer;
    aphMappers: Pointer; // struct _HMAPPER **
    cSupportedAlgs: Cardinal;
    palgSupportedAlgs: Pointer; //
    grbitEnabledProtocols: Cardinal;
    dwMinimumCipherStrength: Cardinal;
    dwMaximumCipherStrength: Cardinal;
    dwSessionLifespan: Cardinal;
    dwFlags: Cardinal;
    reserved: Cardinal;
  end;

  PSecPkgContext_IssuerListInfoEx = ^TSecPkgContext_IssuerListInfoEx;
  TSecPkgContext_IssuerListInfoEx = record
    aIssuers: array[0..0] of CERT_NAME_BLOB;
    cIssuers: Cardinal;
  end;

  PEnumerateSecurityPackages = ^TEnumerateSecurityPackages;
  TEnumerateSecurityPackages = function(
    var pcPackages: Cardinal;       // receives the number of packages
    var ppPackageInfo: PSecPkgInfo  // receives array of information
  ): SECURITY_STATUS; stdcall;

  TQueryCredentialsAttributes = function(
    phCredential: PCredHandle;  // credential to query
    ulAttribute: Cardinal;      // attribute to query
    var pBuffer: Pointer        // buffer that receives attributes
  ): SECURITY_STATUS; stdcall;

  TQuerySecurityPackageInfo = function(
    pszPackageName: PChar;          // name of package
    var ppPackageInfo: PSecPkgInfo  // receives package information
  ): SECURITY_STATUS; stdcall;

  TFreeContextBuffer = function(
    pvContextBuffer: Pointer        // buffer to free
  ): SECURITY_STATUS; stdcall;

  TDeleteSecurityContext = function(
    phContext: PCtxtHandle         // handle of the context to delete
  ): SECURITY_STATUS; stdcall;

  TApplyControlToken = function(
    phContext: PCtxtHandle; // handle of the context to modify
    pInput: PSecBufferDesc  // input token to apply
  ): SECURITY_STATUS; stdcall;

  TQueryContextAttributes = function(
    phContext: PCtxtHandle;        // handle of the context to query
    ulAttribute: Cardinal;         // attribute to query
    pBuffer: Pointer              // buffer for attributes
  ): SECURITY_STATUS; stdcall;

  TImpersonateSecurityContext = function(
    phContext: PCtxtHandle // handle of the context to impersonate
  ): SECURITY_STATUS; stdcall;

  TRevertSecurityContext = function(
    phContext: PCtxtHandle // handle of the context being impersonated
  ): SECURITY_STATUS; stdcall;
  
  TFreeCredentialHandle = function(
    phContext: PCredHandle          // handle of the credential to delete
  ): SECURITY_STATUS; stdcall;

  TAcquireCredentialsHandle = function(
    pszPrincipal: PChar;              // name of principal
    pszPackage: PChar;                // name of package
    fCredentialUse: Cardinal;         // flags indicating use
    pvLogonID: PLUID;                 // pointer to logon identifier
    pAuthData: Pointer;               // package-specific data
    pGetKeyFn: Pointer;               // pointer to GetKey function
    pvGetKeyArgument: Pointer;        // value to pass to GetKey
    phCredential: PCredHandle;    // credential handle
    ptsExpiry: PTimeStamp         // lifetime of the returned credentials
  ): SECURITY_STATUS; stdcall;

  TInitializeSecurityContext = function(
    phCredential: PCredHandle;      // handle to the credentials
    phContext: PCtxtHandle;     // handle of partially formed context
    pszTargetName: PWideChar;           // name of the target of the context
    fContextReq: Cardinal;          // required context attributes
    Reserved1: Cardinal;            // reserved; must be zero
    TargetDataRep: Cardinal;        // data representation on the target
    pInput: PSecBufferDesc;     // pointer to the input buffers
    Reserved2: Cardinal;            // reserved; must be zero
    phNewContext: PCtxtHandle;  // receives the new context handle
    pOutput: PSecBufferDesc;    // pointer to the output buffers
    pfContextAttr: PCardinal;    // receives the context attributes
    ptsExpiry: PTimeStamp       // receives the life span of the security context
  ): SECURITY_STATUS; stdcall;

  TAcceptSecurityContext = function(
    phCredential: PCredHandle;      // handle to the credentials
    phContext: PCtxtHandle;     // handle of partially formed context
    pInput: PSecBufferDesc;     // pointer to the input buffers
    fContextReq: Cardinal;          // required context attributes
    fTargetDataRep: Cardinal;
    phNewContext: PCtxtHandle;  // receives the new context handle
    pOutput: PSecBufferDesc;    // pointer to the output buffers
    pfContextAttr: PCardinal;    // receives the context attributes
    ptsExpiry: PTimeStamp       // receives the life span of the security context
  ): SECURITY_STATUS; stdcall;
  
  TCompleteAuthToken = function(
    phContext: PCtxtHandle;         // handle of the context to complete
    pToken: PSecBufferDesc          // token to complete
  ): SECURITY_STATUS; stdcall;

  TEncryptMessage = function(
    phContext: PCtxtHandle;    // context to use
    fQOP: PCardinal;           // quality of protection
    pMessage: PSecBufferDesc;  // buffer containing the message to encrypt
    MessageSeqNo: Cardinal    // expected sequence number
  ): SECURITY_STATUS; stdcall;

  TDecryptMessage = function(
    phContext: PCtxtHandle;    // context to use
    pMessage: PSecBufferDesc;  // buffer containing the message to decrypt
    MessageSeqNo: Cardinal;    // expected sequence number
    pfQOP: PCardinal           // quality of protection
  ): SECURITY_STATUS; stdcall;

  PSecurityFunctionTable = ^TSecurityFunctionTable;
  TSecurityFunctionTable = record
    dwVersion: Cardinal;
    EnumerateSecurityPackages: TEnumerateSecurityPackages;
    QueryCredentialsAttributes: TQueryCredentialsAttributes;
    AcquireCredentialsHandle: TAcquireCredentialsHandle;
    FreeCredentialHandle: TFreeCredentialHandle;
    SspiLogonUserA: Pointer;
    InitializeSecurityContext: TInitializeSecurityContext;
    AcceptSecurityContext: TAcceptSecurityContext;
    CompleteAuthToken: TCompleteAuthToken;
    DeleteSecurityContext: TDeleteSecurityContext;
    ApplyControlToken: TApplyControlToken;
    QueryContextAttributes: TQueryContextAttributes;
    ImpersonateSecurityContext: TImpersonateSecurityContext;
    RevertSecurityContext: TRevertSecurityContext;
    MakeSignature: Pointer;
    VerifySignature: Pointer;
    FreeContextBuffer: TFreeContextBuffer;
    QuerySecurityPackageInfo: TQuerySecurityPackageInfo;
    SealMessage: TEncryptMessage;
    UnSealMessage: TDecryptMessage;
    ExportSecurityContext: Pointer;
    ImportSecurityContextA: Pointer;
    Reserved7: Pointer;
    Reserved8: Pointer;
    QuerySecurityContextToken: Pointer;
    EncryptMessage: TEncryptMessage;  // alias of SealMessage
    DecryptMessage: TDecryptMessage;  // alias of UnSealMessage
  end;

  PInitSecurityInterface = ^TInitSecurityInterface;
  TInitSecurityInterface = function: PSecurityFunctionTable; stdcall;

  TclSspiReturnCode = (rcOK, rcError,
    rcReAuthNeeded, rcAuthContinueNeeded, rcAuthDataNeeded, rcAuthMoreDataNeeded,
    rcCompleteNeeded, rcContinueNeeded, rcClosingNeeded,
    rcMoreDataNeeded, rcEncodeNeeded, rcContinueAndMoreDataNeeded, rcCredentialNeeded);

{$IFDEF LOGGER}
const
  clSspiReturnCodes: array[TclSspiReturnCode] of string = ('rcOK', 'rcError',
    'rcReAuthNeeded', 'rcAuthContinueNeeded', 'rcAuthDataNeeded', 'rcAuthMoreDataNeeded',
    'rcCompleteNeeded', 'rcContinueNeeded', 'rcClosingNeeded',
    'rcMoreDataNeeded', 'rcEncodeNeeded', 'rcContinueAndMoreDataNeeded', 'rcCredentialNeeded');
{$ENDIF}

type
  TclTlsFlag = (tfUseSSL2, tfUseSSL3, tfUseTLS);
  TclTlsFlags = set of TclTlsFlag;

  TclSspi = class
  private
    FDLLHandle: THandle;
    FFunctionTable: PSecurityFunctionTable;
    procedure InitFunctionTable;
    function GetFunctionTable: PSecurityFunctionTable;
  public
    constructor Create;
    destructor Destroy; override;
    property FunctionTable: PSecurityFunctionTable read GetFunctionTable;
  end;

  TclTlsSspi = class(TclSspi)
  private
    FNewConversation: Boolean;
    FPackageNo: Integer;
    FMaxToken: Cardinal;
    FCredHandle: TCredHandle;
    FCtxtHandle: TCtxtHandle;
    FStreamSizes: TSecPkgContext_StreamSizes;
    FStatusCode: SECURITY_STATUS;
    FPeerCertificate: TclCertificate;
    FCertified: Boolean;
    FCertificateFlags: TclCertificateFlags;
    FTLSFlags: TclTlsFlags;
    function GetStreamSizes: TSecPkgContext_StreamSizes;
    function GetMaxToken: Cardinal;
    function GetPackageName: string;
    function GetPackageNo: Integer;
    procedure InitPackage;
    procedure EnumerateSecurityPackages(var APackagesCount: Cardinal; var APackageInfoArray: PSecPkgInfo);
    procedure DeleteContext;
    procedure DeleteCredentials;
    function GenCredentials(ACertificate: TclCertificate; AllowEmptyCred: Boolean;
      ASecData: TSChannel_Cred; ACredentialUse: Cardinal): Boolean;
    procedure FreePeerCertificate;
  public
    constructor Create;
    destructor Destroy; override;
    function EndSession(ABuffer: TStream): TclSspiReturnCode; virtual; abstract;
    function GenContext(ABuffer: TStream; ACertificate: TclCertificate;
      AllowEmptyCred: Boolean): TclSspiReturnCode; virtual; abstract;
    function Encrypt(ASource, ADestination: TStream; ASourceSize: Integer): TclSspiReturnCode;
    function Decrypt(ASource, ADestination, AExtraBuffer: TStream): TclSspiReturnCode;
    property StreamSizes: TSecPkgContext_StreamSizes read GetStreamSizes;
    property PeerCertificate: TclCertificate read FPeerCertificate;
    property Certified: Boolean read FCertified;
    property StatusCode: SECURITY_STATUS read FStatusCode;
    property CertificateFlags: TclCertificateFlags read FCertificateFlags write FCertificateFlags;
    property TLSFlags: TclTlsFlags read FTLSFlags write FTLSFlags;
  end;

  TclTlsClientSspi = class(TclTlsSspi)
  private
    FTargetName: string;
    function VerifyServerCertificate: Boolean;
    function ContinueConversation(ASecData: TSChannel_Cred; ABuffer: TStream;
      ACertificate: TclCertificate; AllowEmptyCred: Boolean): TclSspiReturnCode;
    function NewConversation(ASecData: TSChannel_Cred; ABuffer: TStream): TclSspiReturnCode;
  public
    constructor Create(const ATargetName: string);
    function EndSession(ABuffer: TStream): TclSspiReturnCode; override;
    function GenContext(ABuffer: TStream; ACertificate: TclCertificate;
      AllowEmptyCred: Boolean): TclSspiReturnCode; override;
    property TargetName: string read FTargetName;
  end;

  TclTlsServerSspi = class(TclTlsSspi)
  private
    FRequireClientCertificate: Boolean;
    procedure GetClientCertificate;
  public
    constructor Create(ARequireClientCertificate: Boolean);
    function EndSession(ABuffer: TStream): TclSspiReturnCode; override;
    function GenContext(ABuffer: TStream; ACertificate: TclCertificate;
      AllowEmptyCred: Boolean): TclSspiReturnCode; override;
    property RequireClientCertificate: Boolean read FRequireClientCertificate;
  end;

const
  HEAP_NO_SERIALIZE        =       $00000001;
  HEAP_GENERATE_EXCEPTIONS =       $00000004;

  SCHANNEL_SHUTDOWN           = 1;
  SCHANNEL_CRED_VERSION       = 4;

  // SChannel credentials

  SCH_CRED_NO_SYSTEM_MAPPER                    = $00000002;
  SCH_CRED_NO_SERVERNAME_CHECK                 = $00000004;
  SCH_CRED_MANUAL_CRED_VALIDATION              = $00000008;
  SCH_CRED_NO_DEFAULT_CREDS                    = $00000010;
  SCH_CRED_AUTO_CRED_VALIDATION                = $00000020;
  SCH_CRED_USE_DEFAULT_CREDS                   = $00000040;

  SCH_CRED_REVOCATION_CHECK_END_CERT           = $00000100;
  SCH_CRED_REVOCATION_CHECK_CHAIN              = $00000200;
  SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = $00000400;
  SCH_CRED_IGNORE_NO_REVOCATION_CHECK          = $00000800;
  SCH_CRED_IGNORE_REVOCATION_OFFLINE           = $00001000;

  // flag/identifiers for protocols
  SP_PROT_PCT1_SERVER             = $00000001;
  SP_PROT_PCT1_CLIENT             = $00000002;
  SP_PROT_PCT1                    = SP_PROT_PCT1_SERVER + SP_PROT_PCT1_CLIENT;

  SP_PROT_SSL2_SERVER             = $00000004;
  SP_PROT_SSL2_CLIENT             = $00000008;
  SP_PROT_SSL2                    = SP_PROT_SSL2_SERVER + SP_PROT_SSL2_CLIENT;

  SP_PROT_SSL3_SERVER             = $00000010;
  SP_PROT_SSL3_CLIENT             = $00000020;
  SP_PROT_SSL3                    = SP_PROT_SSL3_SERVER + SP_PROT_SSL3_CLIENT;

  SP_PROT_TLS1_SERVER             = $00000040;
  SP_PROT_TLS1_CLIENT             = $00000080;
  SP_PROT_TLS1                    = SP_PROT_TLS1_SERVER + SP_PROT_TLS1_CLIENT;

  SP_PROT_SSL3TLS1_CLIENTS        = SP_PROT_TLS1_CLIENT + SP_PROT_SSL3_CLIENT;
  SP_PROT_SSL3TLS1_SERVERS        = SP_PROT_TLS1_SERVER + SP_PROT_SSL3_SERVER;
  SP_PROT_SSL3TLS1                = SP_PROT_SSL3 + SP_PROT_TLS1;

  SP_PROT_UNI_SERVER              = $40000000;
  SP_PROT_UNI_CLIENT              = $80000000;
  SP_PROT_UNI                     = SP_PROT_UNI_SERVER + SP_PROT_UNI_CLIENT;

  SP_PROT_ALL                     = $ffffffff;
  SP_PROT_NONE                    = $0;
  SP_PROT_CLIENTS                 = SP_PROT_PCT1_CLIENT + SP_PROT_SSL2_CLIENT + SP_PROT_SSL3_CLIENT + SP_PROT_UNI_CLIENT + SP_PROT_TLS1_CLIENT;
  SP_PROT_SERVERS                 = SP_PROT_PCT1_SERVER + SP_PROT_SSL2_SERVER + SP_PROT_SSL3_SERVER + SP_PROT_UNI_SERVER + SP_PROT_TLS1_SERVER;

  // internal errors
  SSPI_E_LoadLibrary                = -1;
  SSPI_E_FuncTableInit              = -2;
  SSPI_E_SecPackage                 = -3;
  SSPI_E_AcquireFailed              = -4;
  SSPI_E_PackageNotFound            = -5;
  SSPI_E_QueryPackageInfoFailed     = -6;
  SSPI_E_CertificateNotFound        = -7;
  SSPI_E_QueryRemoteCertificate     = -8;
  SSPI_E_QueryLocalCertificate      = -9;
  SSPI_E_RemoteCertificateNotTrusted = -10;
  SSPI_E_WhileVerify                 = -11;
  SSPI_E_NOT_SUPPORTED               = -12;
  // errors and warnings codes

  SEC_E_OK                    = SECURITY_STATUS($00000000);
  SEC_E_OUTOFMEMORY           = SECURITY_STATUS($00000014);
  SEC_I_RENEGOTIATE           = SECURITY_STATUS($00090321);
  SEC_E_INVALID_HANDLE        = SECURITY_STATUS($80090301);
  SEC_E_UNSUPPORTED_FUNCTION  = SECURITY_STATUS($80090302);
  SEC_E_TARGET_UNKNOWN        = SECURITY_STATUS($80090303);
  SEC_E_INTERNAL_ERROR        = SECURITY_STATUS($80090304);
  SEC_E_SECPKG_NOT_FOUND      = SECURITY_STATUS($80090305);
  SEC_E_NOT_OWNER             = SECURITY_STATUS($80090306);
  SEC_E_CANNOT_INSTALL        = SECURITY_STATUS($80090307);
  SEC_E_INVALID_TOKEN         = SECURITY_STATUS($80090308);
  SEC_E_CANNOT_PACK           = SECURITY_STATUS($80090309);
  SEC_E_QOP_NOT_SUPPORTED     = SECURITY_STATUS($8009030A);
  SEC_E_NO_IMPERSONATION      = SECURITY_STATUS($8009030B);
  SEC_E_LOGON_DENIED          = SECURITY_STATUS($8009030C);
  SEC_E_UNKNOWN_CREDENTIALS   = SECURITY_STATUS($8009030D);
  SEC_E_NO_CREDENTIALS        = SECURITY_STATUS($8009030E);
  SEC_E_MESSAGE_ALTERED       = SECURITY_STATUS($8009030F);
  SEC_E_OUT_OF_SEQUENCE       = SECURITY_STATUS($80090310);
  SEC_E_NO_AUTHENTICATING_AUTHORITY = SECURITY_STATUS($80090311);

  SEC_I_CONTINUE_NEEDED       = SECURITY_STATUS($00090312);
  SEC_I_COMPLETE_NEEDED       = SECURITY_STATUS($00090313);
  SEC_I_COMPLETE_AND_CONTINUE = SECURITY_STATUS($00090314);
  SEC_I_LOCAL_LOGON           = SECURITY_STATUS($00090315);
  SEC_E_BAD_PKGID             = SECURITY_STATUS($80090316);

  SEC_I_END_SESSION           = SECURITY_STATUS($00090317);

  SEC_E_INCOMPLETE_MESSAGE    = SECURITY_STATUS($80090318);
  SEC_I_INCOMPLETE_CREDENTIALS = SECURITY_STATUS($00090320);

  CERT_E_EXPIRED               = SECURITY_STATUS($800B0101);
  CERT_E_VALIDITYPERIODNESTING = SECURITY_STATUS($800B0102);
  CERT_E_ROLE                  = SECURITY_STATUS($800B0103);
  CERT_E_PATHLENCONST          = SECURITY_STATUS($800B0104);
  CERT_E_CRITICAL              = SECURITY_STATUS($800B0105);
  CERT_E_PURPOSE               = SECURITY_STATUS($800B0106);
  CERT_E_ISSUERCHAINING        = SECURITY_STATUS($800B0107);
  CERT_E_MALFORMED             = SECURITY_STATUS($800B0108);
  CERT_E_UNTRUSTEDROOT         = SECURITY_STATUS($800B0109);
  CERT_E_CHAINING              = SECURITY_STATUS($800B010A);
  TRUST_E_FAIL                 = SECURITY_STATUS($800B010B);
  CERT_E_REVOKED               = SECURITY_STATUS($800B010C);
  CERT_E_UNTRUSTEDTESTROOT     = SECURITY_STATUS($800B010D);
  CERT_E_REVOCATION_FAILURE    = SECURITY_STATUS($800B010E);
  CERT_E_CN_NO_MATCH           = SECURITY_STATUS($800B010F);
  CERT_E_WRONG_USAGE           = SECURITY_STATUS($800B0110);

  SECBUFFER_VERSION           = 0;

  SECBUFFER_EMPTY             = 0;   // Undefined, replaced by provider
  SECBUFFER_DATA              = 1;   // Packet data
  SECBUFFER_TOKEN             = 2;   // Security token
  SECBUFFER_PKG_PARAMS        = 3;   // Package specific parameters
  SECBUFFER_MISSING           = 4;   // Missing Data indicator
  SECBUFFER_EXTRA             = 5;   // Extra data
  SECBUFFER_STREAM_TRAILER    = 6;   // Security Trailer
  SECBUFFER_STREAM_HEADER     = 7;   // Security Header
  SECBUFFER_NEGOTIATION_INFO  = 8;   // Hints from the negotiation pkg

  ISC_REQ_DELEGATE                = $00000001;
  ISC_REQ_MUTUAL_AUTH             = $00000002;
  ISC_REQ_REPLAY_DETECT           = $00000004;
  ISC_REQ_SEQUENCE_DETECT         = $00000008;
  ISC_REQ_CONFIDENTIALITY         = $00000010;
  ISC_REQ_USE_SESSION_KEY         = $00000020;
  ISC_REQ_PROMPT_FOR_CREDS        = $00000040;
  ISC_REQ_USE_SUPPLIED_CREDS      = $00000080;
  ISC_REQ_ALLOCATE_MEMORY         = $00000100;
  ISC_REQ_USE_DCE_STYLE           = $00000200;
  ISC_REQ_DATAGRAM                = $00000400;
  ISC_REQ_CONNECTION              = $00000800;
  ISC_REQ_CALL_LEVEL              = $00001000;
  ISC_REQ_EXTENDED_ERROR          = $00004000;
  ISC_REQ_STREAM                  = $00008000;
  ISC_REQ_INTEGRITY               = $00010000;
  ISC_REQ_IDENTIFY                = $00020000;
  ISC_REQ_NULL_SESSION            = $00040000;

  ISC_RET_DELEGATE                = $00000001;
  ISC_RET_MUTUAL_AUTH             = $00000002;
  ISC_RET_REPLAY_DETECT           = $00000004;
  ISC_RET_SEQUENCE_DETECT         = $00000008;
  ISC_RET_CONFIDENTIALITY         = $00000010;
  ISC_RET_USE_SESSION_KEY         = $00000020;
  ISC_RET_USED_COLLECTED_CREDS    = $00000040;
  ISC_RET_USED_SUPPLIED_CREDS     = $00000080;
  ISC_RET_ALLOCATED_MEMORY        = $00000100;
  ISC_RET_USED_DCE_STYLE          = $00000200;
  ISC_RET_DATAGRAM                = $00000400;
  ISC_RET_CONNECTION              = $00000800;
  ISC_RET_INTERMEDIATE_RETURN     = $00001000;
  ISC_RET_CALL_LEVEL              = $00002000;
  ISC_RET_EXTENDED_ERROR          = $00004000;
  ISC_RET_STREAM                  = $00008000;
  ISC_RET_INTEGRITY               = $00010000;
  ISC_RET_IDENTIFY                = $00020000;
  ISC_RET_NULL_SESSION            = $00040000;
  ISC_RET_MANUAL_CRED_VALIDATION  = $00080000;
  ISC_RET_RESERVED1               = $00100000;
  ISC_RET_FRAGMENT_ONLY           = $00200000;

  ASC_REQ_DELEGATE                = $00000001;
  ASC_REQ_MUTUAL_AUTH             = $00000002;
  ASC_REQ_REPLAY_DETECT           = $00000004;
  ASC_REQ_SEQUENCE_DETECT         = $00000008;
  ASC_REQ_CONFIDENTIALITY         = $00000010;
  ASC_REQ_USE_SESSION_KEY         = $00000020;
  ASC_REQ_ALLOCATE_MEMORY         = $00000100;
  ASC_REQ_USE_DCE_STYLE           = $00000200;
  ASC_REQ_DATAGRAM                = $00000400;
  ASC_REQ_CONNECTION              = $00000800;
  ASC_REQ_CALL_LEVEL              = $00001000;
  ASC_REQ_EXTENDED_ERROR          = $00008000;
  ASC_REQ_STREAM                  = $00010000;
  ASC_REQ_INTEGRITY               = $00020000;
  ASC_REQ_LICENSING               = $00040000;
  ASC_REQ_IDENTIFY                = $00080000;
  ASC_REQ_ALLOW_NULL_SESSION      = $00100000;
  ASC_REQ_ALLOW_NON_USER_LOGONS   = $00200000;
  ASC_REQ_ALLOW_CONTEXT_REPLAY    = $00400000;
  ASC_REQ_FRAGMENT_TO_FIT         = $00800000;
  ASC_REQ_FRAGMENT_SUPPLIED       = $00002000;
  ASC_REQ_NO_TOKEN                = $01000000;

  ASC_RET_DELEGATE                = $00000001;
  ASC_RET_MUTUAL_AUTH             = $00000002;
  ASC_RET_REPLAY_DETECT           = $00000004;
  ASC_RET_SEQUENCE_DETECT         = $00000008;
  ASC_RET_CONFIDENTIALITY         = $00000010;
  ASC_RET_USE_SESSION_KEY         = $00000020;
  ASC_RET_ALLOCATED_MEMORY        = $00000100;
  ASC_RET_USED_DCE_STYLE          = $00000200;
  ASC_RET_DATAGRAM                = $00000400;
  ASC_RET_CONNECTION              = $00000800;
  ASC_RET_CALL_LEVEL              = $00002000; // skipped 1000 to be like ISC_
  ASC_RET_THIRD_LEG_FAILED        = $00004000;
  ASC_RET_EXTENDED_ERROR          = $00008000;
  ASC_RET_STREAM                  = $00010000;
  ASC_RET_INTEGRITY               = $00020000;
  ASC_RET_LICENSING               = $00040000;
  ASC_RET_IDENTIFY                = $00080000;
  ASC_RET_NULL_SESSION            = $00100000;
  ASC_RET_ALLOW_NON_USER_LOGONS   = $00200000;
  ASC_RET_ALLOW_CONTEXT_REPLAY    = $00400000;
  ASC_RET_FRAGMENT_ONLY           = $00800000;
  ASC_RET_NO_TOKEN                = $01000000;

  // Data Representation Constant:
  SECURITY_NATIVE_DREP        = $00000010;
  SECURITY_NETWORK_DREP       = $00000000;

  // Credential Use Flags
  SECPKG_CRED_INBOUND         = $00000001;
  SECPKG_CRED_OUTBOUND        = $00000002;
  SECPKG_CRED_BOTH            = $00000003;

 //  Security Context Attributes:

  SECPKG_ATTR_SIZES           = $00000000;
  SECPKG_ATTR_NAMES           = $00000001;
  SECPKG_ATTR_LIFESPAN        = $00000002;
  SECPKG_ATTR_DCE_INFO        = $00000003;
  SECPKG_ATTR_STREAM_SIZES    = $00000004;
  SECPKG_ATTR_KEY_INFO        = $00000005;
  SECPKG_ATTR_AUTHORITY       = $00000006;
  SECPKG_ATTR_PROTO_INFO      = $00000007;
  SECPKG_ATTR_PASSWORD_EXPIRY = $00000008;
  SECPKG_ATTR_SESSION_KEY     = $00000009;
  SECPKG_ATTR_PACKAGE_INFO    = $00000010;

// QueryContextAttributes/QueryCredentialsAttribute extensions

  SECPKG_ATTR_REMOTE_CERT_CONTEXT  = $53;  // returns PCCERT_CONTEXT
  SECPKG_ATTR_LOCAL_CERT_CONTEXT   = $54;  // returns PCCERT_CONTEXT
  SECPKG_ATTR_ROOT_STORE           = $55;  // returns HCERTCONTEXT to the root store
  SECPKG_ATTR_SUPPORTED_ALGS       = $56;  // returns SecPkgCred_SupportedAlgs
  SECPKG_ATTR_CIPHER_STRENGTHS     = $57;  // returns SecPkgCred_CipherStrengths
  SECPKG_ATTR_SUPPORTED_PROTOCOLS  = $58;  // returns SecPkgCred_SupportedProtocols
  SECPKG_ATTR_ISSUER_LIST_EX       = $59;  // returns SecPkgContext_IssuerListInfoEx
  SECPKG_ATTR_CONNECTION_INFO      = $5a;  // returns SecPkgContext_ConnectionInfo

  CERT_CHAIN_FIND_BY_ISSUER       = 1;

  DLL_NAMES: array[0..2] of PChar = ('security.dll', 'schannel.dll', 'secur32.dll');

  SECURITY_ENTRYPOINTA = 'InitSecurityInterfaceA';
  SECURITY_ENTRYPOINTW = 'InitSecurityInterfaceW';
  SECURITY_ENTRYPOINT  = SECURITY_ENTRYPOINTA;

  PACKAGE_NAMES: array[0..3] of PChar = (
    'Microsoft Unified Security Protocol Provider',
    'Microsoft SSL 3.0',
    'NTLM',
    'Negotiate');

function GetSspiErrorMessage(AErrorCode: SECURITY_STATUS): string;
function CheckSspiError(AErrorCode: SECURITY_STATUS): TclSspiReturnCode;
procedure SetSspiErrorIf(ACondition: Boolean; ANewErrorCode: SECURITY_STATUS); overload;
procedure SetSspiErrorIf(AErrorCode, ANewErrorCode: SECURITY_STATUS); overload;

implementation

uses
  clSSPIUtils{$IFDEF LOGGER}, clLogger{$ENDIF};

function GetSspiErrorMessage(AErrorCode: SECURITY_STATUS): string;
begin
  case AErrorCode of
    SSPI_E_NOT_SUPPORTED:              Result := SclSimpleNotSupported;
    SEC_E_INVALID_HANDLE:              Result := SSPIErrorINVALIDHANDLE;
    SEC_E_UNSUPPORTED_FUNCTION:        Result := SSPIErrorUNSUPPORTED_FUNCTION;
    SEC_E_TARGET_UNKNOWN:              Result := SSPIErrorTARGET_UNKNOWN;
    SEC_E_INTERNAL_ERROR:              Result := SSPIErrorINTERNAL_ERROR;
    SEC_E_SECPKG_NOT_FOUND:            Result := SSPIErrorSECPKG_NOT_FOUND;
    SEC_E_NOT_OWNER:                   Result := SSPIErrorNOT_OWNER;
    SEC_E_CANNOT_INSTALL:              Result := SSPIErrorCANNOT_INSTALL;
    SEC_E_INVALID_TOKEN:               Result := SSPIErrorINVALID_TOKEN;
    SEC_E_CANNOT_PACK:                 Result := SSPIErrorCANNOT_PACK;
    SEC_E_QOP_NOT_SUPPORTED:           Result := SSPIErrorQOP_NOT_SUPPORTED;
    SEC_E_NO_IMPERSONATION:            Result := SSPIErrorNO_IMPERSONATION;
    SEC_E_LOGON_DENIED:                Result := SSPIErrorLOGON_DENIED;
    SEC_E_UNKNOWN_CREDENTIALS:         Result := SSPIErrorUNKNOWN_CREDENTIALS;
    SEC_E_NO_CREDENTIALS:              Result := SSPIErrorNO_CREDENTIALS;
    SEC_E_MESSAGE_ALTERED:             Result := SSPIErrorMESSAGE_ALTERED;
    SEC_E_OUT_OF_SEQUENCE:             Result := SSPIErrorOUT_OF_SEQUENCE;
    SEC_E_NO_AUTHENTICATING_AUTHORITY: Result := SSPIErrorNO_AUTHENTICATING_AUTHORITY;
    SEC_E_BAD_PKGID:                   Result := SSPIErrorBAD_PKGID;
    SEC_E_OUTOFMEMORY:                 Result := SSPIErrorOUTOFMEMORY;
    SSPI_E_WhileVerify:                Result := SSPIErrorWhileTrustPerforming;
    SSPI_E_LoadLibrary:                Result := SSPIErrorLoadLibrary;
    SSPI_E_FuncTableInit:              Result := SSPIErrorFuncTableInit;
    SSPI_E_SecPackage:                 Result := SSPIErrorSecPackage;
    SSPI_E_AcquireFailed:              Result := SSPIErrorAcquireFailed;
    SSPI_E_PackageNotFound:            Result := SSPIErrorPackageNotFound;
    SSPI_E_QueryPackageInfoFailed:     Result := SSPIErrorQueryPackageInfoFailed;
    SSPI_E_CertificateNotFound:        Result := SSPIErrorCertificateNotFound;
    SSPI_E_QueryRemoteCertificate:     Result := SSPIErrorQueryRemoteCertificate;
    SSPI_E_QueryLocalCertificate:      Result := SSPIErrorQueryLocalCertificate;
    SSPI_E_RemoteCertificateNotTrusted:Result := SSPIErrorRemoteCertificateNotTrusted;
    CERT_E_EXPIRED:                    Result := SSPIErrorCERTEXPIRED;
    CERT_E_VALIDITYPERIODNESTING:      Result := SSPIErrorCERTVALIDITYPERIODNESTING;
    CERT_E_ROLE:                       Result := SSPIErrorCERTROLE;
    CERT_E_PATHLENCONST:               Result := SSPIErrorCERTPATHLENCONST;
    CERT_E_CRITICAL:                   Result := SSPIErrorCERTCRITICAL;
    CERT_E_PURPOSE:                    Result := SSPIErrorCERTPURPOSE;
    CERT_E_ISSUERCHAINING:             Result := SSPIErrorCERTISSUERCHAINING;
    CERT_E_MALFORMED:                  Result := SSPIErrorCERTMALFORMED;
    CERT_E_UNTRUSTEDROOT:              Result := SSPIErrorCERTUNTRUSTEDROOT;
    CERT_E_CHAINING:                   Result := SSPIErrorCERTCHAINING;
    TRUST_E_FAIL:                      Result := SSPIErrorCERTFAIL;
    CERT_E_REVOKED:                    Result := SSPIErrorCERTREVOKED;
    CERT_E_UNTRUSTEDTESTROOT:          Result := SSPIErrorCERTUNTRUSTEDTESTROOT;
    CERT_E_REVOCATION_FAILURE:         Result := SSPIErrorCERTREVOCATION_FAILURE;
    CERT_E_CN_NO_MATCH:                Result := SSPIErrorCERTCN_NO_MATCH;
    CERT_E_WRONG_USAGE:                Result := SSPIErrorCERTWRONG_USAGE;
  else
    Result := Format(SSPIErrorUnknownError, [AErrorCode]);
  end;
end;

function CheckSspiError(AErrorCode: SECURITY_STATUS): TclSspiReturnCode;
begin
  case AErrorCode of
    SEC_E_INCOMPLETE_MESSAGE: Result := rcMoreDataNeeded;
    SEC_I_CONTINUE_NEEDED:    Result := rcContinueNeeded;
    SEC_I_COMPLETE_NEEDED:    Result := rcCompleteNeeded;
    SEC_I_RENEGOTIATE:        Result := rcReAuthNeeded;
    SEC_I_END_SESSION:        Result := rcClosingNeeded;
    SEC_E_OK:                 Result := rcOK;
  else
    raise EclSSPIError.Create(GetSspiErrorMessage(AErrorCode), AErrorCode);
  end;
end;

procedure SetSspiErrorIf(ACondition: Boolean; ANewErrorCode: SECURITY_STATUS);
begin
  if ACondition then
  begin
    CheckSspiError(ANewErrorCode);
  end;
end;

procedure SetSspiErrorIf(AErrorCode, ANewErrorCode: SECURITY_STATUS);
begin
  SetSspiErrorIf((AErrorCode < SEC_E_OK), ANewErrorCode);
end;

{ TclTlsSspi }

function TclTlsSspi.GetStreamSizes: TSecPkgContext_StreamSizes;
var
  scRet: SECURITY_STATUS;
begin
  if (FStreamSizes.cbHeader = 0) then
  begin
    scRet := FunctionTable.QueryContextAttributes(@FCtxtHandle, SECPKG_ATTR_STREAM_SIZES, @FStreamSizes);
    SetSspiErrorIf(scRet <> SEC_E_OK, SSPI_E_QueryPackageInfoFailed);
  end;
  Result := FStreamSizes;
end;

function TclTlsSspi.GetPackageName: string;
begin
  Result := PACKAGE_NAMES[FPackageNo];
end;

function TclTlsSspi.GetPackageNo: Integer;
var
  I, J: Integer;
  PackagesCount: Cardinal;
  PackageInfoArray: PSecPkgInfo;
begin
  EnumerateSecurityPackages(PackagesCount, PackageInfoArray);
  try
    Result := Length(PACKAGE_NAMES);
    for J := 0 to PackagesCount - 1 do
    begin
      for I := 0 to Length(PACKAGE_NAMES) - 1 do
      begin
        if (StrComp(PSecPkgInfo(Integer(PackageInfoArray) + SizeOf(TSecPkgInfo) * J).Name,
          PACKAGE_NAMES[I]) = 0) then
        begin
          if (I < Result) then Result := I;
          Break;
        end;
      end;
    end;
  finally
    FunctionTable.FreeContextBuffer(PackageInfoArray);
  end;
  SetSspiErrorIf(Result >= Length(PACKAGE_NAMES), SSPI_E_PackageNotFound);
end;

function TclTlsSspi.GetMaxToken: Cardinal;
var
  ss: SECURITY_STATUS;
  PackageInfo: PSecPkgInfo;
begin
  ss := FunctionTable.QuerySecurityPackageInfo(PChar(GetPackageName()), PackageInfo);
  SetSspiErrorIf(ss, SSPI_E_QueryPackageInfoFailed);
  Result := PackageInfo.cbMaxToken;
  FunctionTable.FreeContextBuffer(PackageInfo);
end;

procedure TclTlsSspi.InitPackage;
begin
  FPackageNo := GetPackageNo();
  FMaxToken := GetMaxToken();
end;

function TclTlsSspi.Encrypt(ASource, ADestination: TStream; ASourceSize: Integer): TclSspiReturnCode;
var
  Msg: TSecBufferDesc;
  Buffers: array[0..3] of TSecBuffer;
  pbPacket,
  pbMessInPacket,
  pbMessage: PChar;
  SrcCurPos,
  cbPacketSize,
  cbMessage: Cardinal;
  srcBuf, dstBuf: PChar;
  dstSize: Integer;
begin
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'EncryptMessage', ASource, ASource.Position);
{$ENDIF}

  Result := rcOk;

  srcBuf := nil;
  dstBuf := nil;
  try
    SrcCurPos := 0;
    cbPacketSize := StreamSizes.cbHeader + StreamSizes.cbTrailer;

    dstSize := ASourceSize + (Integer(cbPacketSize))*(ASourceSize div Integer(StreamSizes.cbMaximumMessage) + 1);
    GetMem(srcBuf, ASourceSize);
    GetMem(dstBuf, dstSize);

    ASource.Read(srcBuf^, ASourceSize);
    ASource.Position := ASource.Position - ASourceSize;

    pbPacket := dstBuf;
    pbMessInPacket := PChar(Cardinal(dstBuf) + StreamSizes.cbHeader);
    pbMessage := srcBuf;

    Buffers[0].cbBuffer     := StreamSizes.cbHeader;
    Buffers[0].BufferType   := SECBUFFER_STREAM_HEADER;
    Buffers[1].BufferType   := SECBUFFER_DATA;
    Buffers[2].cbBuffer     := StreamSizes.cbTrailer;
    Buffers[2].BufferType   := SECBUFFER_STREAM_TRAILER;
    Buffers[3].BufferType   := SECBUFFER_EMPTY;

    Msg.ulVersion       := SECBUFFER_VERSION;
    Msg.cBuffers        := 4;
    Msg.pBuffers        := @Buffers;

    while (SrcCurPos < DWORD(ASourceSize)) do
    begin
      cbMessage := DWORD(ASourceSize) - SrcCurPos;
      if (cbMessage > StreamSizes.cbMaximumMessage) then
      begin
        cbMessage := StreamSizes.cbMaximumMessage;
      end;
      CopyMemory(pbMessInPacket, pbMessage, cbMessage);
      Inc(SrcCurPos, cbMessage);

      Buffers[0].pvBuffer     := pbPacket;
      Buffers[1].pvBuffer     := pbMessInPacket;
      Buffers[1].cbBuffer     := cbMessage;
      Buffers[2].pvBuffer     := Pointer(Cardinal(pbMessInPacket) + cbMessage);
      Buffers[3].BufferType   := SECBUFFER_EMPTY;

      if (Win32Platform <> VER_PLATFORM_WIN32_WINDOWS) then
      begin
        FStatusCode := FunctionTable.EncryptMessage(@FCtxtHandle, nil, @Msg, 0);
      end else
      begin
        FStatusCode := FunctionTable.SealMessage(@FCtxtHandle, nil, @Msg, 0);
      end;

{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'EncryptMessage');
{$ENDIF}
      
      Result := CheckSspiError(FStatusCode);

      pbPacket := PChar(Cardinal(pbPacket) + cbMessage + cbPacketSize);
      pbMessInPacket := Pointer(Cardinal(pbPacket) + Buffers[0].cbBuffer);
      pbMessage := PChar(Cardinal(srcBuf) + SrcCurPos);
    end;

    ADestination.Write(dstBuf^, dstSize);
    ADestination.Position := ADestination.Position - dstSize;
  finally
    FreeMem(dstBuf);
    FreeMem(srcBuf);
  end;
end;

function TclTlsSspi.Decrypt(ASource, ADestination, AExtraBuffer: TStream): TclSspiReturnCode;
var
  i, size: Integer;
  pbBuffPtr, pbIoBuffer: PChar;
  cbIoBufferSize: Cardinal;
  Msg: TSecBufferDesc;
  Buffers: array[0..3] of TSecBuffer;
  HasDecodedData,
  InExtraLoop: Boolean;
begin
  InExtraLoop := False;
  HasDecodedData := False;
  Result := rcOk;
  size := ASource.Size - ASource.Position;
  GetMem(pbIoBuffer, size);
  try
    pbBuffPtr := pbIoBuffer;

    ASource.Read(pbIoBuffer^, size);
    ASource.Position := ASource.Position - size;

    cbIoBufferSize := size;
    repeat
      if (cbIoBufferSize < 6) then
      begin
        if HasDecodedData then
        begin
          AExtraBuffer.Size := 0;
          AExtraBuffer.Write(pbBuffPtr^, cbIoBufferSize);
          AExtraBuffer.Position := AExtraBuffer.Position - Integer(cbIoBufferSize);

          Result := rcContinueAndMoreDataNeeded;
        end else
        begin
          Result := rcMoreDataNeeded;
        end;
        break;
      end;
      Buffers[0].pvBuffer     := pbBuffPtr;
      Buffers[0].cbBuffer     := cbIoBufferSize;
      Buffers[0].BufferType   := SECBUFFER_DATA;

      Buffers[1].BufferType   := SECBUFFER_EMPTY;
      Buffers[2].BufferType   := SECBUFFER_EMPTY;
      Buffers[3].BufferType   := SECBUFFER_EMPTY;

      Msg.ulVersion       := SECBUFFER_VERSION;
      Msg.cBuffers        := Length(Buffers);
      Msg.pBuffers        := @Buffers;

      if (Win32Platform <> VER_PLATFORM_WIN32_WINDOWS) then
      begin
        FStatusCode := FunctionTable.DecryptMessage(@FCtxtHandle, @Msg, 0, nil);
      end else
      begin
        FStatusCode := FunctionTable.UnSealMessage(@FCtxtHandle, @Msg, 0, nil);
      end;

{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'DecryptMessage');
{$ENDIF}

      Result := CheckSspiError(FStatusCode);

      for i := Low(Buffers) to High(Buffers) do
      begin
        case Buffers[i].BufferType of
          SECBUFFER_DATA:
            begin
              if (Result = rcMoreDataNeeded) or (Result = rcClosingNeeded) then
              begin
                AExtraBuffer.Size := 0;
                AExtraBuffer.Write(Buffers[i].pvBuffer^, Buffers[i].cbBuffer);
                AExtraBuffer.Position := AExtraBuffer.Position - Integer(Buffers[i].cbBuffer);

                if (Result <> rcClosingNeeded) then
                begin
                  Result := rcContinueAndMoreDataNeeded;
                end;
              end else
              begin
                HasDecodedData := True;
                ADestination.Write(Buffers[i].pvBuffer^, Buffers[i].cbBuffer);
{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'DecryptMessage : ADestination.Write', Buffers[i].pvBuffer, Buffers[i].cbBuffer);
{$ENDIF}
              end;
              InExtraLoop := False;
            end;
          SECBUFFER_EXTRA:
            begin
              cbIoBufferSize := Buffers[i].cbBuffer;
              pbBuffPtr := Buffers[i].pvBuffer;
              InExtraLoop := True;
            end;
          SECBUFFER_MISSING:
            begin
              if HasDecodedData then
              begin
                AExtraBuffer.Size := 0;
                AExtraBuffer.Write(pbBuffPtr^, cbIoBufferSize);
{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'DecryptMessage : AExtraBuffer.Write', pbBuffPtr, cbIoBufferSize);
{$ENDIF}
                AExtraBuffer.Position := AExtraBuffer.Position - Integer(cbIoBufferSize);

                Result := rcContinueAndMoreDataNeeded;
              end else
              begin
                Result := rcMoreDataNeeded;
              end;
              InExtraLoop := False;
              break;
            end;
        end;
      end;
    until not InExtraLoop;
  finally
    FreeMem(pbIoBuffer);
  end;
end;

procedure TclTlsSspi.EnumerateSecurityPackages(var APackagesCount: Cardinal;
  var APackageInfoArray: PSecPkgInfo);
var
  ss: SECURITY_STATUS;
begin
  ss := FunctionTable.EnumerateSecurityPackages(APackagesCount, PSecPkgInfo(APackageInfoArray));
  SetSspiErrorIf(ss, SSPI_E_QueryPackageInfoFailed);
end;

procedure TclTlsSspi.DeleteContext;
begin
  if ((FCtxtHandle.dwLower <> 0) or (FCtxtHandle.dwUpper <> 0)) then
  begin
    FunctionTable.DeleteSecurityContext(@FCtxtHandle);
    FCtxtHandle.dwLower := 0;
    FCtxtHandle.dwUpper := 0;
  end;
end;

procedure TclTlsSspi.DeleteCredentials;
begin
  if ((FCredHandle.dwLower <> 0) or (FCredHandle.dwUpper <> 0)) then
  begin
    FunctionTable.FreeCredentialHandle(@FCredHandle);
    FCredHandle.dwLower := 0;
    FCredHandle.dwUpper := 0;
  end;
end;

constructor TclTlsSspi.Create;
begin
  inherited Create();
  FNewConversation := True;
  InitPackage();
  TLSFlags :=  [tfUseTLS];
end;

function TclTlsSspi.GenCredentials(ACertificate: TclCertificate; AllowEmptyCred: Boolean;
  ASecData: TSChannel_Cred; ACredentialUse: Cardinal): Boolean;
var
  tsExpiry: TTimeStamp;
begin
  DeleteCredentials();

  if AllowEmptyCred then
  begin
    Result := True;
  end else
  begin
    Result := (ACertificate <> nil);
    if not Result then Exit;
  end;

  if (ACertificate <> nil) then
  begin
    ASecData.cCreds := 1;
    ASecData.paCred := @ACertificate.Context;
  end;

  FStatusCode := FunctionTable.AcquireCredentialsHandle(
      nil,                   // use the default principal
      PChar(GetPackageName()),
      ACredentialUse,
      nil,                   // use the default LOGON id
      @ASecData,
      nil,                   // no callback function needed to get a key
      nil,                   // no callback function arguments needed
      @FCredHandle,
      @tsExpiry);

{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'AcquireCredentialsHandle');
{$ENDIF}
      
  SetSspiErrorIf(FStatusCode, SSPI_E_AcquireFailed);
end;

procedure TclTlsSspi.FreePeerCertificate;
begin
  FPeerCertificate.Free();
  FPeerCertificate := nil;
end;

destructor TclTlsSspi.Destroy;
begin
  FreePeerCertificate();
  inherited Destroy();
end;

{ TclSspi }

constructor TclSspi.Create;
begin
  inherited Create();
  FDLLHandle := 0;
  FFunctionTable := nil;
end;

destructor TclSspi.Destroy;
begin
  if (FDLLHandle <> 0) then
  begin
    FreeLibrary(FDLLHandle);
  end;
  inherited Destroy();
end;

function TclSspi.GetFunctionTable: PSecurityFunctionTable;
begin
  if (FFunctionTable = nil) then
  begin
    InitFunctionTable();
  end;
  Result := FFunctionTable;
end;

procedure TclSspi.InitFunctionTable;
var
  ind: Integer;
  InitSecurityInterface: PInitSecurityInterface;
begin
  ind := 0;
  FDLLHandle := LoadLibrary(DLL_NAMES[ind]);
  if (FDLLHandle <= HINSTANCE_ERROR) then
  begin
    Inc(ind);
    FDLLHandle := LoadLibrary(DLL_NAMES[ind]);
    if (FDLLHandle <= HINSTANCE_ERROR) then
    begin
      Inc(ind);
      FDLLHandle := LoadLibrary(DLL_NAMES[ind]);
      SetSspiErrorIf(FDLLHandle <= HINSTANCE_ERROR, SSPI_E_LoadLibrary);
    end;
  end;
  InitSecurityInterface := GetProcAddress(FDLLHandle, SECURITY_ENTRYPOINT);
  SetSspiErrorIf(InitSecurityInterface = nil, SSPI_E_FuncTableInit);

  FFunctionTable := TInitSecurityInterface(InitSecurityInterface);
  SetSspiErrorIf(FFunctionTable = nil, SSPI_E_SecPackage);
end;

{ TclTlsClientSspi }

constructor TclTlsClientSspi.Create(const ATargetName: string);
begin
  inherited Create();
  FTargetName := ATargetName;
  if (FTargetName = '') then
  begin
    FTargetName := FloatToStr(Now);
  end;
  FCertified := False;
end;

function TclTlsClientSspi.EndSession(ABuffer: TStream): TclSspiReturnCode;
var
  OutBuffer: TSecBufferDesc;
  OutBuffers: array[0..1] of TSecBuffer;
  dwSSPIFlags, dwSSPIOutFlags: DWORD;
  tsExpiry: TTimeStamp;
  dwType: Cardinal;
begin
  FNewConversation := True;
  FCertified := False;

  dwType := SCHANNEL_SHUTDOWN;
  dwSSPIFlags := ISC_REQ_SEQUENCE_DETECT + ISC_REQ_REPLAY_DETECT +
      ISC_REQ_CONFIDENTIALITY + ISC_REQ_EXTENDED_ERROR +
      ISC_REQ_ALLOCATE_MEMORY + ISC_REQ_STREAM;

  OutBuffer.ulVersion := 0;
  OutBuffer.cBuffers := 1;
  OutBuffer.pBuffers := @OutBuffers;

  OutBuffers[0].cbBuffer := sizeof(dwType);
  OutBuffers[0].BufferType := SECBUFFER_TOKEN;
  OutBuffers[0].pvBuffer := @dwType;

  FStatusCode := FunctionTable.ApplyControlToken(@FCtxtHandle, @OutBuffer);
  CheckSspiError(FStatusCode);

  OutBuffers[0].pvBuffer   := nil;
  OutBuffers[0].BufferType := SECBUFFER_TOKEN;
  OutBuffers[0].cbBuffer   := 0;

  OutBuffer.cBuffers       := 1;
  OutBuffer.pBuffers       := @OutBuffers;
  OutBuffer.ulVersion      := SECBUFFER_VERSION;

  try
    FStatusCode := FunctionTable.InitializeSecurityContext(
                  @FCredHandle,
                  @FCtxtHandle,
                  nil,
                  dwSSPIFlags,
                  0,
                  0,
                  nil,
                  0,
                  @FCtxtHandle,
                  @OutBuffer,
                  @dwSSPIOutFlags,
                  @tsExpiry);

{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'InitializeSecurityContext');
{$ENDIF}

    Result := CheckSspiError(FStatusCode);

    if ((OutBuffers[0].pvBuffer <> nil) and (OutBuffers[0].cbBuffer <> 0)) then
    begin
      ABuffer.Size := 0;
      ABuffer.Write(OutBuffers[0].pvBuffer^, OutBuffers[0].cbBuffer);
      ABuffer.Position := 0;
      Result := rcCompleteNeeded;
    end;
  finally
    if (OutBuffers[0].pvBuffer <> nil) then
    begin
      FunctionTable.FreeContextBuffer(OutBuffers[0].pvBuffer);
    end;
    DeleteContext();
    DeleteCredentials();
  end;
end;

function TclTlsClientSspi.GenContext(ABuffer: TStream; ACertificate: TclCertificate;
  AllowEmptyCred: Boolean): TclSspiReturnCode;
var
  secData: TSChannel_Cred;
begin
  ZeroMemory(@secData, Sizeof(secData));
  secData.dwVersion := SCHANNEL_CRED_VERSION;
  secData.dwFlags :=  SCH_CRED_MANUAL_CRED_VALIDATION + SCH_CRED_NO_DEFAULT_CREDS;

  secData.grbitEnabledProtocols := 0;
  if (tfUseSSL2 in TLSFlags) then
  begin
    secData.grbitEnabledProtocols := secData.grbitEnabledProtocols or SP_PROT_SSL2_CLIENT;
  end;
  if (tfUseSSL3 in TLSFlags) then
  begin
    secData.grbitEnabledProtocols := secData.grbitEnabledProtocols or SP_PROT_SSL3_CLIENT;
  end;
  if (tfUseTLS in TLSFlags) then
  begin
    secData.grbitEnabledProtocols := secData.grbitEnabledProtocols or SP_PROT_TLS1_CLIENT;
  end;

  if (FStatusCode = SEC_I_INCOMPLETE_CREDENTIALS) then
  begin
    if not GenCredentials(ACertificate, AllowEmptyCred, secData, SECPKG_CRED_OUTBOUND) then
    begin
      Result := rcCredentialNeeded;
      Exit;
    end;
  end;
  
  FStatusCode := SEC_I_CONTINUE_NEEDED;
  
  if FNewConversation then
  begin
    FNewConversation := False;
    Result := NewConversation(secData, ABuffer);
  end else
  begin
    Result := ContinueConversation(secData, ABuffer, ACertificate, AllowEmptyCred);
  end;

  if not FCertified and (Result in [rcOK, rcEncodeNeeded]) then
  begin
    FCertified := VerifyServerCertificate();
  end;
end;

function TclTlsClientSspi.NewConversation(ASecData: TSChannel_Cred; ABuffer: TStream): TclSspiReturnCode;
var
  OutBuffer: TSecBufferDesc;
  OutBuffers: array[0..1] of TSecBuffer;
  dwSSPIFlags, dwSSPIOutFlags: DWORD;
  tsExpiry: TTimeStamp;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'NewConversation');{$ENDIF}

  dwSSPIFlags := ISC_REQ_SEQUENCE_DETECT + ISC_REQ_REPLAY_DETECT +
      ISC_REQ_CONFIDENTIALITY + ISC_REQ_EXTENDED_ERROR +
      ISC_REQ_ALLOCATE_MEMORY + ISC_REQ_STREAM;

  DeleteCredentials();
  FStatusCode := FunctionTable.AcquireCredentialsHandle(
      nil,                   // use the default principal
      PChar(GetPackageName()),
      SECPKG_CRED_OUTBOUND,
      nil,                   // use the default LOGON id
      @ASecData,
      nil,                   // no callback function needed to get a key
      nil,                   // no callback function arguments needed
      @FCredHandle,
      @tsExpiry);

{$IFDEF LOGGER}
   clPutLogMessage(Self, edInside, 'AcquireCredentialsHandle');
{$ENDIF}

  SetSspiErrorIf(FStatusCode, SSPI_E_AcquireFailed);

  OutBuffer.ulVersion := 0;
  OutBuffer.cBuffers := 1;
  OutBuffer.pBuffers := @OutBuffers;

  OutBuffers[0].cbBuffer := 0;
  OutBuffers[0].BufferType := SECBUFFER_TOKEN;
  OutBuffers[0].pvBuffer := nil;

  try
    FStatusCode := FunctionTable.InitializeSecurityContext(
           @FCredHandle,
           nil,
           @FTargetName,
           dwSSPIFlags,
           0,
           0,
           nil,
           0,
           @FCtxtHandle,
           @OutBuffer,
           @dwSSPIOutFlags,
           @tsExpiry
      );

{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'InitializeSecurityContext');
{$ENDIF}

    CheckSspiError(FStatusCode);

    ABuffer.Size := 0;
    ABuffer.Write(OutBuffers[0].pvBuffer^, OutBuffers[0].cbBuffer);
    ABuffer.Position := 0;
{$IFDEF LOGGER}
    clPutLogMessage(Self, edInside, 'NewConversation, OutBuffers[0].pvBuffer', OutBuffers[0].pvBuffer, OutBuffers[0].cbBuffer);
    clPutLogMessage(Self, edInside, 'NewConversation, after InitializeSecurityContext dwSSPIOutFlags = $%x', nil, [dwSSPIOutFlags]);
{$ENDIF}

    Result := rcAuthContinueNeeded;
  finally
    if (OutBuffers[0].pvBuffer <> nil) then
    begin
      FunctionTable.FreeContextBuffer(OutBuffers[0].pvBuffer);
    end;
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'NewConversation'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'NewConversation', E); raise; end; end;{$ENDIF}
end;

function TclTlsClientSspi.ContinueConversation(ASecData: TSChannel_Cred;
  ABuffer: TStream; ACertificate: TclCertificate; AllowEmptyCred: Boolean): TclSspiReturnCode;
var
  InBuffer: TSecBufferDesc;
  InBuffers: array[0..1] of TSecBuffer;
  OutBuffer: TSecBufferDesc;
  OutBuffers: array[0..1] of TSecBuffer;
  dwSSPIFlags, dwSSPIOutFlags: DWORD;
  tsExpiry: TTimeStamp;
  NeedToRead: Boolean;
  buf: PChar;
  size: Integer;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ContinueConversation');{$ENDIF}
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'ContinueConversation, ABuffer.Position = %d, ABuffer.Size = %d', nil, [ABuffer.Position, ABuffer.Size]);
{$ENDIF}

  NeedToRead := False;
  Result := rcError;

  dwSSPIFlags := ISC_REQ_SEQUENCE_DETECT + ISC_REQ_REPLAY_DETECT +
      ISC_REQ_CONFIDENTIALITY + ISC_REQ_EXTENDED_ERROR +
      ISC_REQ_ALLOCATE_MEMORY + ISC_REQ_STREAM;

  buf := nil;
  try
    while ((FStatusCode = SEC_I_CONTINUE_NEEDED)
        or (FStatusCode = SEC_E_INCOMPLETE_MESSAGE)
        or (FStatusCode = SEC_I_INCOMPLETE_CREDENTIALS)) do
    begin
{$IFDEF LOGGER}
      clPutLogMessage(Self, edInside, 'ContinueConversation, under while FStatusCode = $%x', nil, [Integer(FStatusCode)]);
{$ENDIF}

      if (ABuffer.Size = 0) or (FStatusCode = SEC_E_INCOMPLETE_MESSAGE) then
      begin
        if NeedToRead then
        begin
          Result := rcAuthMoreDataNeeded;
          Break;
        end else
        begin
          NeedToRead := True;
        end;
      end;

      OutBuffer.ulVersion := 0;
      OutBuffer.cBuffers := 2;
      OutBuffer.pBuffers := @OutBuffers;

      OutBuffers[0].cbBuffer := 0;
      OutBuffers[0].BufferType := SECBUFFER_TOKEN;
      OutBuffers[0].pvBuffer := nil;

      OutBuffers[1].cbBuffer := 0;
      OutBuffers[1].BufferType := SECBUFFER_EMPTY;
      OutBuffers[1].pvBuffer := nil;

      InBuffer.ulVersion := 0;
      InBuffer.cBuffers := 2;
      InBuffer.pBuffers := @InBuffers;

      FreeMem(buf);
      buf := nil;
      size := ABuffer.Size - ABuffer.Position;
      if (size > 0) then
      begin
        GetMem(buf, size);
        ABuffer.Read(buf^, size);
        ABuffer.Position := ABuffer.Position - size;
      end;

      InBuffers[0].cbBuffer := size;
      InBuffers[0].BufferType := SECBUFFER_TOKEN;
      InBuffers[0].pvBuffer := buf;

{$IFDEF LOGGER}
      clPutLogMessage(Self, edInside, 'ContinueConversation, InBuffers[0].pvBuffer', InBuffers[0].pvBuffer, InBuffers[0].cbBuffer);
{$ENDIF}

      InBuffers[1].cbBuffer := 0;
      InBuffers[1].BufferType := SECBUFFER_EMPTY;
      InBuffers[1].pvBuffer := nil;

      FStatusCode := FunctionTable.InitializeSecurityContext(
           @FCredHandle,
           @FCtxtHandle,
           @FTargetName,
           dwSSPIFlags,
           0,
           0,
           @InBuffer,
           0,
           @FCtxtHandle,
           @OutBuffer,
           @dwSSPIOutFlags,
           @tsExpiry
      );

{$IFDEF LOGGER}
      clPutLogMessage(Self, edInside, 'InitializeSecurityContext');

      clPutLogMessage(Self, edInside, 'ContinueConversation, after InitializeSecurityContext FStatusCode = $%x', nil, [Integer(FStatusCode)]);
      clPutLogMessage(Self, edInside, 'ContinueConversation, OutBuffers[0].pvBuffer', OutBuffers[0].pvBuffer, OutBuffers[0].cbBuffer);

      if (InBuffers[1].BufferType = SECBUFFER_EXTRA) then
      begin
        clPutLogMessage(Self, edInside, 'ContinueConversation, InBuffers[1] = SECBUFFER_EXTRA (' + IntToStr(InBuffers[1].cbBuffer));
      end else
      begin
        clPutLogMessage(Self, edInside, 'ContinueConversation, InBuffers[1] = no extra data');
      end;
      
      clPutLogMessage(Self, edInside, 'ContinueConversation, after InitializeSecurityContext dwSSPIOutFlags = $%x', nil, [dwSSPIOutFlags]);
{$ENDIF}

      if (FStatusCode = SEC_E_OK) or (FStatusCode = SEC_I_CONTINUE_NEEDED)
        or (FAILED(FStatusCode) and ((dwSSPIOutFlags and ISC_RET_EXTENDED_ERROR) <> 0)) then
      begin
        if (OutBuffers[0].cbBuffer <> 0) and (OutBuffers[0].pvBuffer <> nil) then
        begin
          ABuffer.Size := 0;
          ABuffer.Write(OutBuffers[0].pvBuffer^, OutBuffers[0].cbBuffer);
          ABuffer.Position := 0;

          FunctionTable.FreeContextBuffer(OutBuffers[0].pvBuffer);
          OutBuffers[0].pvBuffer := nil;

          Result := rcAuthContinueNeeded;
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'ContinueConversation, inside if (FStatusCode = SEC_E_OK) or..., ABuffer.Position = %d, ABuffer.Size = %d', nil, [ABuffer.Position, ABuffer.Size]);
{$ENDIF}
          Break;
        end;
      end;
      if (FStatusCode = SEC_E_INCOMPLETE_MESSAGE) then
      begin
        Result := rcAuthMoreDataNeeded;
        Break;
      end;
      if (FStatusCode = SEC_E_OK) then
      begin
        Result := rcOk;
        if (InBuffers[1].BufferType = SECBUFFER_EXTRA) then
        begin
          ABuffer.Position := ABuffer.Size - Integer(InBuffers[1].cbBuffer);
          Result := rcEncodeNeeded;
        end;
        Break;
      end;
      if (FStatusCode = SEC_I_INCOMPLETE_CREDENTIALS) then
      begin
        if not GenCredentials(ACertificate, AllowEmptyCred, ASecData, SECPKG_CRED_OUTBOUND) then
        begin
          Result := rcCredentialNeeded;
        end;
        NeedToRead := False;
        FStatusCode := SEC_I_INCOMPLETE_CREDENTIALS;
        if (Result = rcCredentialNeeded) then
        begin
         Break;
        end else
        begin
          continue;
        end;
      end;

      CheckSspiError(FStatusCode);

      if (InBuffers[1].BufferType = SECBUFFER_EXTRA) then
      begin
        ABuffer.Position := ABuffer.Size - Integer(InBuffers[1].cbBuffer);
      end else
      begin
        ABuffer.Size := 0;
      end;
    end;
  finally
    FreeMem(buf);
  end;
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'ContinueConversation, before end, ABuffer.Position = %d, ABuffer.Size = %d', nil, [ABuffer.Position, ABuffer.Size]);
{$ENDIF}
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ContinueConversation'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ContinueConversation', E); raise; end; end;{$ENDIF}
end;

function TclTlsClientSspi.VerifyServerCertificate: Boolean;
const
  SECURITY_FLAG_IGNORE_REVOCATION             = $00000080;
  SECURITY_FLAG_IGNORE_UNKNOWN_CA             = $00000100;
  SECURITY_FLAG_IGNORE_WRONG_USAGE            = $00000200;
  SECURITY_FLAG_IGNORE_CERT_CN_INVALID        = $00001000;
  SECURITY_FLAG_IGNORE_CERT_DATE_INVALID      = $00002000;

var
  polHttps: HTTPSPolicyCallbackData;
  PolicyPara: CERT_CHAIN_POLICY_PARA;
  PolicyStatus: CERT_CHAIN_POLICY_STATUS;
  ChainPara: CERT_CHAIN_PARA;
  pChainContext: PCCERT_CHAIN_CONTEXT;
  remoteCertContext: PCCERT_CONTEXT;
  pwszServerName: PWCHAR;
  cchServerName: DWORD;
begin
  FreePeerCertificate();
  Result := True;
  cchServerName := MultiByteToWideChar(CP_ACP, 0, PChar(FTargetname), -1, nil, 0);
  GetMem(pwszServerName, cchServerName * sizeof(WCHAR));
  try
    SetSspiErrorIf(pwszServerName = nil, SEC_E_OUTOFMEMORY);

    MultiByteToWideChar(CP_ACP, 0, PChar(FTargetname), -1, pwszServerName, cchServerName);

    ZeroMemory(@ChainPara, sizeof(ChainPara));
    ChainPara.cbSize := sizeof(ChainPara);

    FStatusCode := FunctionTable.QueryContextAttributes(@FCtxtHandle,
                                    SECPKG_ATTR_REMOTE_CERT_CONTEXT,
                                    @remoteCertContext);
    CheckSspiError(FStatusCode);

    FPeerCertificate := TclCertificate.Create(remoteCertContext);

    pChainContext := nil;
    try
      SetSspiErrorIf(
        not CertGetCertificateChain(
          0,
          remoteCertContext,
          nil,
          remoteCertContext^.hCertStore,
          @ChainPara,
          0,
          nil,
          @pChainContext),
        SSPI_E_WhileVerify);

      ZeroMemory(@polHttps, sizeof(HTTPSPolicyCallbackData));
      polHttps.cbSize := sizeof(HTTPSPolicyCallbackData);
      polHttps.dwAuthType := AUTHTYPE_SERVER;
      polHttps.fdwChecks := 0;

      if cfIgnoreCommonNameInvalid in CertificateFlags then
        polHttps.fdwChecks := polHttps.fdwChecks or SECURITY_FLAG_IGNORE_CERT_CN_INVALID;
      if cfIgnoreDateInvalid in CertificateFlags then
        polHttps.fdwChecks := polHttps.fdwChecks or SECURITY_FLAG_IGNORE_CERT_DATE_INVALID;
      if cfIgnoreUnknownAuthority in CertificateFlags then
        polHttps.fdwChecks := polHttps.fdwChecks or SECURITY_FLAG_IGNORE_UNKNOWN_CA;
      if cfIgnoreRevocation in CertificateFlags then
        polHttps.fdwChecks := polHttps.fdwChecks or SECURITY_FLAG_IGNORE_REVOCATION;
      if cfIgnoreWrongUsage in CertificateFlags then
        polHttps.fdwChecks := polHttps.fdwChecks or SECURITY_FLAG_IGNORE_WRONG_USAGE;

      polHttps.pwszServerName := pwszServerName;

      ZeroMemory(@PolicyPara, sizeof(PolicyPara));
      PolicyPara.cbSize := sizeof(PolicyPara);
      PolicyPara.pvExtraPolicyPara := @polHttps;

      ZeroMemory(@PolicyStatus, sizeof(PolicyStatus));
      PolicyStatus.cbSize := sizeof(PolicyStatus);

      SetSspiErrorIf(
        not CertVerifyCertificateChainPolicy(
          CERT_CHAIN_POLICY_SSL,
          pChainContext,
          @PolicyPara,
          @PolicyStatus),
        SSPI_E_WhileVerify);

      if (PolicyStatus.dwError <> 0) then
      begin
        FStatusCode := Longint(PolicyStatus.dwError);
        Result := False;
      end;
    finally
      if (pChainContext <> nil) then
      begin
        CertFreeCertificateChain(pChainContext);
      end;
      if (remoteCertContext <> nil) then CertFreeCertificateContext(remoteCertContext);
    end;
  finally
    FreeMem(pwszServerName);
  end;
end;

{ TclTlsServerSspi }

constructor TclTlsServerSspi.Create(ARequireClientCertificate: Boolean);
begin
  inherited Create();
  FRequireClientCertificate := ARequireClientCertificate;
end;

function TclTlsServerSspi.EndSession(ABuffer: TStream): TclSspiReturnCode;
var
  OutBuffer: TSecBufferDesc;
  OutBuffers: array[0..1] of TSecBuffer;
  dwSSPIFlags, dwSSPIOutFlags: DWORD;
  tsExpiry: TTimeStamp;
  dwType: Cardinal;
begin
  FNewConversation := True;
  FCertified := False;

  dwType := SCHANNEL_SHUTDOWN;
  dwSSPIFlags := ASC_REQ_SEQUENCE_DETECT + ASC_REQ_REPLAY_DETECT +
      ASC_REQ_CONFIDENTIALITY + ASC_REQ_EXTENDED_ERROR +
      ASC_REQ_ALLOCATE_MEMORY + ASC_REQ_STREAM;

  OutBuffer.ulVersion := 0;
  OutBuffer.cBuffers := 1;
  OutBuffer.pBuffers := @OutBuffers;

  OutBuffers[0].cbBuffer := sizeof(dwType);
  OutBuffers[0].BufferType := SECBUFFER_TOKEN;
  OutBuffers[0].pvBuffer := @dwType;

  FStatusCode := FunctionTable.ApplyControlToken(@FCtxtHandle, @OutBuffer);
  CheckSspiError(FStatusCode);


  OutBuffers[0].pvBuffer   := nil;
  OutBuffers[0].BufferType := SECBUFFER_TOKEN;
  OutBuffers[0].cbBuffer   := 0;

  OutBuffer.cBuffers       := 1;
  OutBuffer.pBuffers       := @OutBuffers;
  OutBuffer.ulVersion      := SECBUFFER_VERSION;

  try
    FStatusCode := FunctionTable.AcceptSecurityContext(
           @FCredHandle,
           @FCtxtHandle,
           nil,
           dwSSPIFlags,
           0,
           nil,
           @OutBuffer,
           @dwSSPIOutFlags,
           @tsExpiry
      );

    Result := CheckSspiError(FStatusCode);

    if ((OutBuffers[0].pvBuffer <> nil) and (OutBuffers[0].cbBuffer <> 0)) then
    begin
      ABuffer.Size := 0;
      ABuffer.Write(OutBuffers[0].pvBuffer^, OutBuffers[0].cbBuffer);
      ABuffer.Position := 0;
      Result := rcCompleteNeeded;
    end;
  finally
    if (OutBuffers[0].pvBuffer <> nil) then
    begin
      FunctionTable.FreeContextBuffer(OutBuffers[0].pvBuffer);
    end;
    DeleteContext();
    DeleteCredentials();
  end;
end;

function TclTlsServerSspi.GenContext(ABuffer: TStream; ACertificate: TclCertificate;
  AllowEmptyCred: Boolean): TclSspiReturnCode;
var
  InBuffer: TSecBufferDesc;
  InBuffers: array[0..1] of TSecBuffer;
  OutBuffer: TSecBufferDesc;
  OutBuffers: array[0..1] of TSecBuffer;
  dwSSPIFlags, dwSSPIOutFlags: DWORD;
  tsExpiry: TTimeStamp;
  pCtxt: PCtxtHandle;
  secData: TSChannel_Cred;
  buf: PChar;
begin
  ZeroMemory(@secData, Sizeof(secData));
  secData.dwVersion := SCHANNEL_CRED_VERSION;
  secData.dwFlags := 0;

  secData.grbitEnabledProtocols := 0;
  if (tfUseSSL2 in TLSFlags) then
  begin
    secData.grbitEnabledProtocols := secData.grbitEnabledProtocols or SP_PROT_SSL2_SERVER;
  end;
  if (tfUseSSL3 in TLSFlags) then
  begin
    secData.grbitEnabledProtocols := secData.grbitEnabledProtocols or SP_PROT_SSL3_SERVER;
  end;
  if (tfUseTLS in TLSFlags) then
  begin
    secData.grbitEnabledProtocols := secData.grbitEnabledProtocols or SP_PROT_TLS1_SERVER;
  end;

  if FNewConversation then
  begin
    if not GenCredentials(ACertificate, AllowEmptyCred, secData, SECPKG_CRED_INBOUND) then
    begin
      Result := rcCredentialNeeded;
      Exit;
    end;
  end;

  OutBuffer.ulVersion := SECBUFFER_VERSION;
  OutBuffer.cBuffers := 1;
  OutBuffer.pBuffers := @OutBuffers;

  OutBuffers[0].cbBuffer := 0;
  OutBuffers[0].BufferType := SECBUFFER_TOKEN;
  OutBuffers[0].pvBuffer := nil;

  buf := nil;
  try
    FStatusCode := SEC_I_CONTINUE_NEEDED;

    dwSSPIFlags := ASC_REQ_SEQUENCE_DETECT + ASC_REQ_REPLAY_DETECT +
        ASC_REQ_CONFIDENTIALITY + ASC_REQ_EXTENDED_ERROR +
        ASC_REQ_ALLOCATE_MEMORY + ASC_REQ_STREAM;

    if FRequireClientCertificate then
    begin
      dwSSPIFlags := dwSSPIFlags + ASC_REQ_MUTUAL_AUTH;
    end;

    InBuffer.ulVersion := 0;
    InBuffer.cBuffers := 1;
    InBuffer.pBuffers := @InBuffers;

    if (ABuffer.Size > 0) then
    begin
      GetMem(buf, ABuffer.Size);
      ABuffer.Position := 0;
      ABuffer.Read(buf^, ABuffer.Size);
    end;

    InBuffers[0].cbBuffer := ABuffer.Size;
    InBuffers[0].BufferType := SECBUFFER_TOKEN;
    InBuffers[0].pvBuffer := buf;

    pCtxt := nil;
    if not FNewConversation then
    begin
      pCtxt := @FCtxtHandle;
    end;

    FStatusCode := FunctionTable.AcceptSecurityContext(
           @FCredHandle,
           pCtxt,
           @InBuffer,
           dwSSPIFlags,
           0,
           @FCtxtHandle,
           @OutBuffer,
           @dwSSPIOutFlags,
           @tsExpiry
      );

    CheckSspiError(FStatusCode);

    if (FStatusCode = SEC_I_COMPLETE_NEEDED)
        or (FStatusCode = SEC_I_COMPLETE_AND_CONTINUE) then
    begin
      FStatusCode := FunctionTable.CompleteAuthToken(@FCtxtHandle, @OutBuffer);
      CheckSspiError(FStatusCode);
    end;

    ABuffer.Size := 0;
    ABuffer.Write(OutBuffers[0].pvBuffer^, OutBuffers[0].cbBuffer);
    ABuffer.Position := 0;
  finally
    if (OutBuffers[0].pvBuffer <> nil) then
    begin
      FunctionTable.FreeContextBuffer(OutBuffers[0].pvBuffer);
    end;
    FreeMem(buf);
  end;
  FNewConversation := False;

	if (SEC_I_CONTINUE_NEEDED = FStatusCode)
    or (SEC_I_COMPLETE_AND_CONTINUE = FStatusCode) then
  begin
    Result := rcAuthContinueNeeded;
  end else
  begin
    Result := rcOk;
    if FRequireClientCertificate and (not FCertified) then
    begin
      GetClientCertificate();
    end;
    FCertified := True;
  end;
end;

procedure TclTlsServerSspi.GetClientCertificate;
var
  remoteCertContext: PCCERT_CONTEXT;
begin
  FreePeerCertificate();
  remoteCertContext := nil;
  FStatusCode := FunctionTable.QueryContextAttributes(@FCtxtHandle,
                                  SECPKG_ATTR_REMOTE_CERT_CONTEXT,
                                  @remoteCertContext);
  try
    CheckSspiError(FStatusCode);
    FPeerCertificate := TclCertificate.Create(remoteCertContext);
  finally
    if (remoteCertContext <> nil) then CertFreeCertificateContext(remoteCertContext);
  end;
end;

end.
