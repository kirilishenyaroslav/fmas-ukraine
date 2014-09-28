{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSspiUtils;

interface

resourcestring
  SclSimpleNotSupported = 'Not supported.';
  SSPIErrorLoadLibrary = 'Could not load the dll (schannel.dll, security.dll or secur32.dll)';
  SSPIErrorFuncTableInit = 'Could not get security initialization routine';
  SSPIErrorSecPackage = 'Could not initialize the security package';
  SSPIErrorAcquireFailed = 'AcquireCredentials failed';
  SSPIErrorPackageNotFound = 'None of needed security package was found';
  SSPIErrorQueryPackageInfoFailed = 'Could not query package information';
  SSPIErrorCertificateNotFound = 'Error finding certificate chain';
  SSPIErrorQueryRemoteCertificate = 'Error querying remote server certificate';
  SSPIErrorQueryLocalCertificate = 'Error querying local certificate';
  SSPIErrorRemoteCertificateNotTrusted = 'Error authenticating server credentials';
  SSPIErrorWhileTrustPerforming = 'Error occured when authenticating server credentials';
  SSPIErrorINVALIDHANDLE         = 'The handle specified is invalid';
  SSPIErrorUNSUPPORTED_FUNCTION  = 'The function requested is not supported';
  SSPIErrorTARGET_UNKNOWN        = 'The specified target is unknown or unreachable';
  SSPIErrorINTERNAL_ERROR        = 'The Local Security Authority cannot be contacted';
  SSPIErrorSECPKG_NOT_FOUND      = 'The requested security package does not exist';
  SSPIErrorNOT_OWNER             = 'The caller is not the owner of the desired credentials';
  SSPIErrorCANNOT_INSTALL        = 'The security package failed to initialize, and cannot be installed';
  SSPIErrorINVALID_TOKEN         = 'The token supplied to the function is invalid';
  SSPIErrorCANNOT_PACK           = 'The security package is not able to marshall the logon buffer, so the logon attempt has failed';
  SSPIErrorQOP_NOT_SUPPORTED     = 'The per-message Quality of Protection is not supported by the security package';
  SSPIErrorNO_IMPERSONATION      = 'The security context does not allow impersonation of the client';
  SSPIErrorLOGON_DENIED          = 'The logon attempt failed';
  SSPIErrorUNKNOWN_CREDENTIALS   = 'The credentials supplied to the package were not recognized';
  SSPIErrorNO_CREDENTIALS        = 'No credentials are available in the security package';
  SSPIErrorMESSAGE_ALTERED       = 'The message supplied for verification has been altered';
  SSPIErrorOUT_OF_SEQUENCE       = 'The message supplied for verification is out of sequence';
  SSPIErrorNO_AUTHENTICATING_AUTHORITY
                                 = 'No authority could be contacted for authentication';
  SSPIErrorBAD_PKGID             = 'The requested security package does not exist';
  SSPIErrorOUTOFMEMORY           = 'Out of memory';
  SSPIErrorUnknownError          = 'The unknown error was occured: %x';
  SSPIErrorCERTEXPIRED           ='A required certificate is not within its validity ' +
    'period when verifying against the current system clock or the timestamp in the signed file';
  SSPIErrorCERTVALIDITYPERIODNESTING ='The validity periods of the certification chain do not ' +
    'nest correctly';
  SSPIErrorCERTROLE              ='A certificate that can only be used as an end-entity '+
    'is being used as a CA or visa versa';
  SSPIErrorCERTPATHLENCONST      ='A path length constraint in the certification chain has been violated';
  SSPIErrorCERTCRITICAL          ='A certificate contains an unknown extension that is marked ''critical''';
  SSPIErrorCERTPURPOSE           ='A certificate being used for a purpose other than the ones specified by its CA';
  SSPIErrorCERTISSUERCHAINING    ='A parent of a given certificate in fact did not issue that child certificate';
  SSPIErrorCERTMALFORMED         ='A certificate is missing or has an empty value for an important field, such as a subject or issuer name';
  SSPIErrorCERTUNTRUSTEDROOT     ='A certificate chain processed correctly, but terminated in a root certificate which is not trusted by the trust provider';
  SSPIErrorCERTCHAINING          ='An internal certificate chaining error has occurred';
  SSPIErrorCERTFAIL              ='Generic trust failure';
  SSPIErrorCERTREVOKED           ='A certificate was explicitly revoked by its issuer';
  SSPIErrorCERTUNTRUSTEDTESTROOT ='The certification path terminates with the test root which is not trusted with the current policy settings';
  SSPIErrorCERTREVOCATION_FAILURE='The revocation process could not continue - the certificate(s) could not be checked';
  SSPIErrorCERTCN_NO_MATCH       ='The certificate''s CN name does not match the passed value';
  SSPIErrorCERTWRONG_USAGE       ='The certificate is not valid for the requested usage';

implementation

end.
