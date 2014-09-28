// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\DonnU\SourcesSVN\FMAS-WIN\Contingent_Student\Sources\WSDL\EDBOGuidesToFMASService.wsdl
// Encoding : UTF-8
// Version  : 1.0
// (12.03.2014 11:31:33 - 1.33.2.5)
// ************************************************************************ //

unit EDBOGuidesToFMASService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"

  ExtensionDataObject  = class;                 { "http://edboservice.ua/" }
  dAcademicYears       = class;                 { "http://edboservice.ua/" }
  dLastError           = class;                 { "http://edboservice.ua/" }
  dUniversities        = class;                 { "http://edboservice.ua/" }
  dLanguages           = class;                 { "http://edboservice.ua/" }
  dUniversityFacultets = class;                 { "http://edboservice.ua/" }
  dUniversityFacultetSpecialities = class;      { "http://edboservice.ua/" }
  dUniversityFacultetSpecialities2 = class;     { "http://edboservice.ua/" }
  dCourses             = class;                 { "http://edboservice.ua/" }
  dSpec                = class;                 { "http://edboservice.ua/" }
  dSpecDirections      = class;                 { "http://edboservice.ua/" }
  dSpecDirections2     = class;                 { "http://edboservice.ua/" }
  dKOATUU              = class;                 { "http://edboservice.ua/" }
  dStreetTypes         = class;                 { "http://edboservice.ua/" }
  dUniversityFacultetsRequests = class;         { "http://edboservice.ua/" }
  dUniversityFacultetsRequests2 = class;        { "http://edboservice.ua/" }



  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  ExtensionDataObject = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dAcademicYears = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_AcademicYear: Integer;
    FAcademicYearName: WideString;
    FAcademicYearDescription: WideString;
    FAcademicYearDateBegin: TXSDateTime;
    FAcademicYearDateEnd: TXSDateTime;
    FAcademicYearDatelLastChange: TXSDateTime;
    FAcademicYearIsActive: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property AcademicYearDescription: WideString read FAcademicYearDescription write FAcademicYearDescription;
    property AcademicYearDateBegin: TXSDateTime read FAcademicYearDateBegin write FAcademicYearDateBegin;
    property AcademicYearDateEnd: TXSDateTime read FAcademicYearDateEnd write FAcademicYearDateEnd;
    property AcademicYearDatelLastChange: TXSDateTime read FAcademicYearDatelLastChange write FAcademicYearDatelLastChange;
    property AcademicYearIsActive: Integer read FAcademicYearIsActive write FAcademicYearIsActive;
  end;

  ArrayOfDAcademicYears = array of dAcademicYears;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dLastError = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FLastErrorCode: Integer;
    FLastErrorDescription: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property LastErrorCode: Integer read FLastErrorCode write FLastErrorCode;
    property LastErrorDescription: WideString read FLastErrorDescription write FLastErrorDescription;
  end;

  ArrayOfDLastError = array of dLastError;      { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dUniversities = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_University: Integer;
    FUniversityKode: WideString;
    FUniversityDateBegin: TXSDateTime;
    FUniversityDateEnd: TXSDateTime;
    FEDRPO: WideString;
    FDateRegistration: TXSDateTime;
    FUniversityPhone: WideString;
    FUniversityEMail: WideString;
    FWebsite: WideString;
    FUniversityBossPhone: WideString;
    FUniversityBossEMail: WideString;
    FId_UniversityName: Integer;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FKOATUUCode: WideString;
    FPostIndex: WideString;
    FKOATUUFullName: WideString;
    FId_StreetType: Integer;
    FStreetTypeFullName: WideString;
    FStreetTypeShortName: WideString;
    FUniversityAdress: WideString;
    FHouceNum: WideString;
    FUniversityBossLastName: WideString;
    FUniversityBossFirstName: WideString;
    FUniversityBossMidleName: WideString;
    FId_EducationType: Integer;
    FId_EducationClass: Integer;
    FEducationOrganizationFullTypeName: WideString;
    FEducationOrganizationShortTypeName: WideString;
    FEducationOrganizationClassName: WideString;
    FId_Language: Integer;
    FId_UniversityAcreditatin: Integer;
    FId_UniversityAcreditatinType: Integer;
    FUniversitiyAcreditatinTypeCode: WideString;
    FIsUniversityVerifed: Integer;
    FExistNeedVerification: Integer;
    FId_UniversityGovernanceType: Integer;
    FUniversityGovernanceTypeName: WideString;
    FId_UniversityRegistration: Integer;
    FId_UniversityRegistrationType: Integer;
    FUniversityRegistrationTypeName: WideString;
    FId_RegulationDocument: Integer;
    FUniversityRegistrationDateBegin: TXSDateTime;
    FUniversityRegistrationDateEnd: TXSDateTime;
    FUniversityRegistrationDateLastChange: TXSDateTime;
    FUniversityRegistrationIsActive: Integer;
    FUniversityRegistrationusersCount: Integer;
    FId_UniversityTypeOfFinansing: Integer;
    FUniversityTypeOfFinansingName: WideString;
    FUniversityKodeParent: WideString;
    FId_UniversityPanent: Integer;
    FUniversityFullNameParent: WideString;
    FKOATUUCodeU: WideString;
    FPostIndexU: WideString;
    FUniversityAdressU: WideString;
    FId_StreetTypeU: Integer;
    FHouceNumU: WideString;
    FId_KOATUUU: Integer;
    FKOATUUFullNameU: WideString;
    FStreetTypeFullNameU: WideString;
    FClosed: Integer;
    FAllowAccessFromParetn: Integer;
    FUniverityFacultetNumberKode: Integer;
    FUniversityFacultetFullName: WideString;
    FId_UniversityJuristicalType: Integer;
    FUniversityJuristicalTypeName: WideString;
    FId_UniversityBossOperatedType: Integer;
    FUniversityBossOperatedTypeName: WideString;
    FBossPost: WideString;
    FWarrantNumber: WideString;
    FWarrantDate: TXSDateTime;
    FId_UniversityCloseStatusTypes: Integer;
    FUniversityCloseStatusTypesName: WideString;
    FGive23Nk: Integer;
    FGiveRaiting: Integer;
    FId_UniversityType: Integer;
    FUniversityTypeName: WideString;
    FPtnzLevel: Integer;
    FIsPerepidgotovka: Integer;
    FParentOrganisationKode: WideString;
    FId_UniversityParentOrganisation: Integer;
    FUniversityFullNameParentOrganisation: WideString;
    FId_UniversityRoleType: Integer;
    FUniversityRoleTypeName: WideString;
    FIsResech: Integer;
    FUniversityFullNameEn: WideString;
    FUniversityShortNameEn: WideString;
    FEnableEducationalCycles: Integer;
    FIsMONGiveBudget: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_University: Integer read FId_University write FId_University;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property UniversityDateBegin: TXSDateTime read FUniversityDateBegin write FUniversityDateBegin;
    property UniversityDateEnd: TXSDateTime read FUniversityDateEnd write FUniversityDateEnd;
    property EDRPO: WideString read FEDRPO write FEDRPO;
    property DateRegistration: TXSDateTime read FDateRegistration write FDateRegistration;
    property UniversityPhone: WideString read FUniversityPhone write FUniversityPhone;
    property UniversityEMail: WideString read FUniversityEMail write FUniversityEMail;
    property Website: WideString read FWebsite write FWebsite;
    property UniversityBossPhone: WideString read FUniversityBossPhone write FUniversityBossPhone;
    property UniversityBossEMail: WideString read FUniversityBossEMail write FUniversityBossEMail;
    property Id_UniversityName: Integer read FId_UniversityName write FId_UniversityName;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property KOATUUCode: WideString read FKOATUUCode write FKOATUUCode;
    property PostIndex: WideString read FPostIndex write FPostIndex;
    property KOATUUFullName: WideString read FKOATUUFullName write FKOATUUFullName;
    property Id_StreetType: Integer read FId_StreetType write FId_StreetType;
    property StreetTypeFullName: WideString read FStreetTypeFullName write FStreetTypeFullName;
    property StreetTypeShortName: WideString read FStreetTypeShortName write FStreetTypeShortName;
    property UniversityAdress: WideString read FUniversityAdress write FUniversityAdress;
    property HouceNum: WideString read FHouceNum write FHouceNum;
    property UniversityBossLastName: WideString read FUniversityBossLastName write FUniversityBossLastName;
    property UniversityBossFirstName: WideString read FUniversityBossFirstName write FUniversityBossFirstName;
    property UniversityBossMidleName: WideString read FUniversityBossMidleName write FUniversityBossMidleName;
    property Id_EducationType: Integer read FId_EducationType write FId_EducationType;
    property Id_EducationClass: Integer read FId_EducationClass write FId_EducationClass;
    property EducationOrganizationFullTypeName: WideString read FEducationOrganizationFullTypeName write FEducationOrganizationFullTypeName;
    property EducationOrganizationShortTypeName: WideString read FEducationOrganizationShortTypeName write FEducationOrganizationShortTypeName;
    property EducationOrganizationClassName: WideString read FEducationOrganizationClassName write FEducationOrganizationClassName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property Id_UniversityAcreditatin: Integer read FId_UniversityAcreditatin write FId_UniversityAcreditatin;
    property Id_UniversityAcreditatinType: Integer read FId_UniversityAcreditatinType write FId_UniversityAcreditatinType;
    property UniversitiyAcreditatinTypeCode: WideString read FUniversitiyAcreditatinTypeCode write FUniversitiyAcreditatinTypeCode;
    property IsUniversityVerifed: Integer read FIsUniversityVerifed write FIsUniversityVerifed;
    property ExistNeedVerification: Integer read FExistNeedVerification write FExistNeedVerification;
    property Id_UniversityGovernanceType: Integer read FId_UniversityGovernanceType write FId_UniversityGovernanceType;
    property UniversityGovernanceTypeName: WideString read FUniversityGovernanceTypeName write FUniversityGovernanceTypeName;
    property Id_UniversityRegistration: Integer read FId_UniversityRegistration write FId_UniversityRegistration;
    property Id_UniversityRegistrationType: Integer read FId_UniversityRegistrationType write FId_UniversityRegistrationType;
    property UniversityRegistrationTypeName: WideString read FUniversityRegistrationTypeName write FUniversityRegistrationTypeName;
    property Id_RegulationDocument: Integer read FId_RegulationDocument write FId_RegulationDocument;
    property UniversityRegistrationDateBegin: TXSDateTime read FUniversityRegistrationDateBegin write FUniversityRegistrationDateBegin;
    property UniversityRegistrationDateEnd: TXSDateTime read FUniversityRegistrationDateEnd write FUniversityRegistrationDateEnd;
    property UniversityRegistrationDateLastChange: TXSDateTime read FUniversityRegistrationDateLastChange write FUniversityRegistrationDateLastChange;
    property UniversityRegistrationIsActive: Integer read FUniversityRegistrationIsActive write FUniversityRegistrationIsActive;
    property UniversityRegistrationusersCount: Integer read FUniversityRegistrationusersCount write FUniversityRegistrationusersCount;
    property Id_UniversityTypeOfFinansing: Integer read FId_UniversityTypeOfFinansing write FId_UniversityTypeOfFinansing;
    property UniversityTypeOfFinansingName: WideString read FUniversityTypeOfFinansingName write FUniversityTypeOfFinansingName;
    property UniversityKodeParent: WideString read FUniversityKodeParent write FUniversityKodeParent;
    property Id_UniversityPanent: Integer read FId_UniversityPanent write FId_UniversityPanent;
    property UniversityFullNameParent: WideString read FUniversityFullNameParent write FUniversityFullNameParent;
    property KOATUUCodeU: WideString read FKOATUUCodeU write FKOATUUCodeU;
    property PostIndexU: WideString read FPostIndexU write FPostIndexU;
    property UniversityAdressU: WideString read FUniversityAdressU write FUniversityAdressU;
    property Id_StreetTypeU: Integer read FId_StreetTypeU write FId_StreetTypeU;
    property HouceNumU: WideString read FHouceNumU write FHouceNumU;
    property Id_KOATUUU: Integer read FId_KOATUUU write FId_KOATUUU;
    property KOATUUFullNameU: WideString read FKOATUUFullNameU write FKOATUUFullNameU;
    property StreetTypeFullNameU: WideString read FStreetTypeFullNameU write FStreetTypeFullNameU;
    property Closed: Integer read FClosed write FClosed;
    property AllowAccessFromParetn: Integer read FAllowAccessFromParetn write FAllowAccessFromParetn;
    property UniverityFacultetNumberKode: Integer read FUniverityFacultetNumberKode write FUniverityFacultetNumberKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property Id_UniversityJuristicalType: Integer read FId_UniversityJuristicalType write FId_UniversityJuristicalType;
    property UniversityJuristicalTypeName: WideString read FUniversityJuristicalTypeName write FUniversityJuristicalTypeName;
    property Id_UniversityBossOperatedType: Integer read FId_UniversityBossOperatedType write FId_UniversityBossOperatedType;
    property UniversityBossOperatedTypeName: WideString read FUniversityBossOperatedTypeName write FUniversityBossOperatedTypeName;
    property BossPost: WideString read FBossPost write FBossPost;
    property WarrantNumber: WideString read FWarrantNumber write FWarrantNumber;
    property WarrantDate: TXSDateTime read FWarrantDate write FWarrantDate;
    property Id_UniversityCloseStatusTypes: Integer read FId_UniversityCloseStatusTypes write FId_UniversityCloseStatusTypes;
    property UniversityCloseStatusTypesName: WideString read FUniversityCloseStatusTypesName write FUniversityCloseStatusTypesName;
    property Give23Nk: Integer read FGive23Nk write FGive23Nk;
    property GiveRaiting: Integer read FGiveRaiting write FGiveRaiting;
    property Id_UniversityType: Integer read FId_UniversityType write FId_UniversityType;
    property UniversityTypeName: WideString read FUniversityTypeName write FUniversityTypeName;
    property PtnzLevel: Integer read FPtnzLevel write FPtnzLevel;
    property IsPerepidgotovka: Integer read FIsPerepidgotovka write FIsPerepidgotovka;
    property ParentOrganisationKode: WideString read FParentOrganisationKode write FParentOrganisationKode;
    property Id_UniversityParentOrganisation: Integer read FId_UniversityParentOrganisation write FId_UniversityParentOrganisation;
    property UniversityFullNameParentOrganisation: WideString read FUniversityFullNameParentOrganisation write FUniversityFullNameParentOrganisation;
    property Id_UniversityRoleType: Integer read FId_UniversityRoleType write FId_UniversityRoleType;
    property UniversityRoleTypeName: WideString read FUniversityRoleTypeName write FUniversityRoleTypeName;
    property IsResech: Integer read FIsResech write FIsResech;
    property UniversityFullNameEn: WideString read FUniversityFullNameEn write FUniversityFullNameEn;
    property UniversityShortNameEn: WideString read FUniversityShortNameEn write FUniversityShortNameEn;
    property EnableEducationalCycles: Integer read FEnableEducationalCycles write FEnableEducationalCycles;
    property IsMONGiveBudget: Integer read FIsMONGiveBudget write FIsMONGiveBudget;
  end;

  ArrayOfDUniversities = array of dUniversities;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dLanguages = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Language: Integer;
    FCode: WideString;
    FNameLanguage: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Language: Integer read FId_Language write FId_Language;
    property Code: WideString read FCode write FCode;
    property NameLanguage: WideString read FNameLanguage write FNameLanguage;
  end;

  ArrayOfDLanguages = array of dLanguages;      { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dUniversityFacultets = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityFacultet: Integer;
    FUniversityKode: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetDateBegin: TXSDateTime;
    FUniversityFacultetDateEnd: TXSDateTime;
    FId_UniversityFacultetName: Integer;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FDescription: WideString;
    FId_Language: Integer;
    FIsAvailableForReceiptOfRequest: Boolean;
    FIsAvailableForBindStudentPersons: Boolean;
    FIsAvailableForBindStaffPersons: Boolean;
    FId_UniversityFacultetType: Integer;
    FUniversityFacultetTypeName: WideString;
    FId_UniversityFacultet_Parent: Integer;
    FHId_UniversityFacultet: WideString;
    FHId_UniversityFacultet_String: WideString;
    FFacultetPostIndex: WideString;
    FKOATUUCode: WideString;
    FKOATUUName: WideString;
    FKOATUUFullName: WideString;
    FFacultetStreetName: WideString;
    FFacultetHouseNumbers: WideString;
    FMovedToAnowerUniversity: Integer;
    FBlock: Integer;
    FBlockDescription: WideString;
    FIsPerepidgotovka: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityFacultet: Integer read FId_UniversityFacultet write FId_UniversityFacultet;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetDateBegin: TXSDateTime read FUniversityFacultetDateBegin write FUniversityFacultetDateBegin;
    property UniversityFacultetDateEnd: TXSDateTime read FUniversityFacultetDateEnd write FUniversityFacultetDateEnd;
    property Id_UniversityFacultetName: Integer read FId_UniversityFacultetName write FId_UniversityFacultetName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property Description: WideString read FDescription write FDescription;
    property Id_Language: Integer read FId_Language write FId_Language;
    property IsAvailableForReceiptOfRequest: Boolean read FIsAvailableForReceiptOfRequest write FIsAvailableForReceiptOfRequest;
    property IsAvailableForBindStudentPersons: Boolean read FIsAvailableForBindStudentPersons write FIsAvailableForBindStudentPersons;
    property IsAvailableForBindStaffPersons: Boolean read FIsAvailableForBindStaffPersons write FIsAvailableForBindStaffPersons;
    property Id_UniversityFacultetType: Integer read FId_UniversityFacultetType write FId_UniversityFacultetType;
    property UniversityFacultetTypeName: WideString read FUniversityFacultetTypeName write FUniversityFacultetTypeName;
    property Id_UniversityFacultet_Parent: Integer read FId_UniversityFacultet_Parent write FId_UniversityFacultet_Parent;
    property HId_UniversityFacultet: WideString read FHId_UniversityFacultet write FHId_UniversityFacultet;
    property HId_UniversityFacultet_String: WideString read FHId_UniversityFacultet_String write FHId_UniversityFacultet_String;
    property FacultetPostIndex: WideString read FFacultetPostIndex write FFacultetPostIndex;
    property KOATUUCode: WideString read FKOATUUCode write FKOATUUCode;
    property KOATUUName: WideString read FKOATUUName write FKOATUUName;
    property KOATUUFullName: WideString read FKOATUUFullName write FKOATUUFullName;
    property FacultetStreetName: WideString read FFacultetStreetName write FFacultetStreetName;
    property FacultetHouseNumbers: WideString read FFacultetHouseNumbers write FFacultetHouseNumbers;
    property MovedToAnowerUniversity: Integer read FMovedToAnowerUniversity write FMovedToAnowerUniversity;
    property Block: Integer read FBlock write FBlock;
    property BlockDescription: WideString read FBlockDescription write FBlockDescription;
    property IsPerepidgotovka: Integer read FIsPerepidgotovka write FIsPerepidgotovka;
  end;

  ArrayOfDUniversityFacultets = array of dUniversityFacultets;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dUniversityFacultetSpecialities = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversitySpecialities: Integer;
    FUniversitySpecialitiesKode: WideString;
    FUniversitySpecialitiesDateBegin: TXSDateTime;
    FUniversitySpecialitiesDateEnd: TXSDateTime;
    FUniversityKode: WideString;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FSpecCode: WideString;
    FSpecClasifierCode: WideString;
    FId_Language: Integer;
    FSpecIndastryCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecSpecializationCode: WideString;
    FSpecSpecializationName: WideString;
    FUniversitySpecialitiesLicenseCount: Integer;
    FUniversitySpecialitiesContractCount: Integer;
    FId_PersonRequestSeasons: Integer;
    FNameRequestSeasons: WideString;
    FId_PersonRequestSeasonDetails: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FDateBeginPersonRequestSeason: TXSDateTime;
    FDateEndPersonRequestSeason: TXSDateTime;
    FId_Qualification: Integer;
    FQualificationName: WideString;
    FSubjects: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FQuotas: WideString;
    FId_Course: Integer;
    FDurationEducation: TXSDecimal;
    FCourseName: WideString;
    FUniversitySpecialitiesLicenseCountOld: Integer;
    FEducationDateBegin: TXSDateTime;
    FEducationDateEnd: TXSDateTime;
    FIsSecondEducation: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversitySpecialities: Integer read FId_UniversitySpecialities write FId_UniversitySpecialities;
    property UniversitySpecialitiesKode: WideString read FUniversitySpecialitiesKode write FUniversitySpecialitiesKode;
    property UniversitySpecialitiesDateBegin: TXSDateTime read FUniversitySpecialitiesDateBegin write FUniversitySpecialitiesDateBegin;
    property UniversitySpecialitiesDateEnd: TXSDateTime read FUniversitySpecialitiesDateEnd write FUniversitySpecialitiesDateEnd;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property Id_Language: Integer read FId_Language write FId_Language;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property UniversitySpecialitiesLicenseCount: Integer read FUniversitySpecialitiesLicenseCount write FUniversitySpecialitiesLicenseCount;
    property UniversitySpecialitiesContractCount: Integer read FUniversitySpecialitiesContractCount write FUniversitySpecialitiesContractCount;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property NameRequestSeasons: WideString read FNameRequestSeasons write FNameRequestSeasons;
    property Id_PersonRequestSeasonDetails: Integer read FId_PersonRequestSeasonDetails write FId_PersonRequestSeasonDetails;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property DateBeginPersonRequestSeason: TXSDateTime read FDateBeginPersonRequestSeason write FDateBeginPersonRequestSeason;
    property DateEndPersonRequestSeason: TXSDateTime read FDateEndPersonRequestSeason write FDateEndPersonRequestSeason;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Subjects: WideString read FSubjects write FSubjects;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property Quotas: WideString read FQuotas write FQuotas;
    property Id_Course: Integer read FId_Course write FId_Course;
    property DurationEducation: TXSDecimal read FDurationEducation write FDurationEducation;
    property CourseName: WideString read FCourseName write FCourseName;
    property UniversitySpecialitiesLicenseCountOld: Integer read FUniversitySpecialitiesLicenseCountOld write FUniversitySpecialitiesLicenseCountOld;
    property EducationDateBegin: TXSDateTime read FEducationDateBegin write FEducationDateBegin;
    property EducationDateEnd: TXSDateTime read FEducationDateEnd write FEducationDateEnd;
    property IsSecondEducation: Integer read FIsSecondEducation write FIsSecondEducation;
  end;

  ArrayOfDUniversityFacultetSpecialities = array of dUniversityFacultetSpecialities;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dUniversityFacultetSpecialities2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversitySpecialities: Integer;
    FUniversitySpecialitiesKode: WideString;
    FUniversitySpecialitiesDateBegin: TXSDateTime;
    FUniversitySpecialitiesDateEnd: TXSDateTime;
    FUniversityKode: WideString;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FSpecCode: WideString;
    FSpecClasifierCode: WideString;
    FId_Language: Integer;
    FSpecIndastryCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecSpecializationCode: WideString;
    FSpecSpecializationName: WideString;
    FUniversitySpecialitiesLicenseCount: Integer;
    FUniversitySpecialitiesContractCount: Integer;
    FId_PersonRequestSeasons: Integer;
    FNameRequestSeasons: WideString;
    FId_PersonRequestSeasonDetails: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FDateBeginPersonRequestSeason: TXSDateTime;
    FDateEndPersonRequestSeason: TXSDateTime;
    FId_Qualification: Integer;
    FQualificationName: WideString;
    FSubjects: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FQuotas: WideString;
    FPublishInEz: Integer;
    Ffdel: Integer;
    FUniversitySpecialitiesOldBudjetCountCount: Integer;
    FId_Course: Integer;
    FDurationEducation: TXSDecimal;
    FCourseName: WideString;
    FUniversitySpecialitiesLicenseCountOld: Integer;
    FEducationDateBegin: TXSDateTime;
    FEducationDateEnd: TXSDateTime;
    FIsSecondEducation: Integer;
    FId_UniversityFacultet: Integer;
    FId_EntranceExamination: Integer;
    FUniversitySpecialitiesName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversitySpecialities: Integer read FId_UniversitySpecialities write FId_UniversitySpecialities;
    property UniversitySpecialitiesKode: WideString read FUniversitySpecialitiesKode write FUniversitySpecialitiesKode;
    property UniversitySpecialitiesDateBegin: TXSDateTime read FUniversitySpecialitiesDateBegin write FUniversitySpecialitiesDateBegin;
    property UniversitySpecialitiesDateEnd: TXSDateTime read FUniversitySpecialitiesDateEnd write FUniversitySpecialitiesDateEnd;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property Id_Language: Integer read FId_Language write FId_Language;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property UniversitySpecialitiesLicenseCount: Integer read FUniversitySpecialitiesLicenseCount write FUniversitySpecialitiesLicenseCount;
    property UniversitySpecialitiesContractCount: Integer read FUniversitySpecialitiesContractCount write FUniversitySpecialitiesContractCount;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property NameRequestSeasons: WideString read FNameRequestSeasons write FNameRequestSeasons;
    property Id_PersonRequestSeasonDetails: Integer read FId_PersonRequestSeasonDetails write FId_PersonRequestSeasonDetails;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property DateBeginPersonRequestSeason: TXSDateTime read FDateBeginPersonRequestSeason write FDateBeginPersonRequestSeason;
    property DateEndPersonRequestSeason: TXSDateTime read FDateEndPersonRequestSeason write FDateEndPersonRequestSeason;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Subjects: WideString read FSubjects write FSubjects;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property Quotas: WideString read FQuotas write FQuotas;
    property PublishInEz: Integer read FPublishInEz write FPublishInEz;
    property fdel: Integer read Ffdel write Ffdel;
    property UniversitySpecialitiesOldBudjetCountCount: Integer read FUniversitySpecialitiesOldBudjetCountCount write FUniversitySpecialitiesOldBudjetCountCount;
    property Id_Course: Integer read FId_Course write FId_Course;
    property DurationEducation: TXSDecimal read FDurationEducation write FDurationEducation;
    property CourseName: WideString read FCourseName write FCourseName;
    property UniversitySpecialitiesLicenseCountOld: Integer read FUniversitySpecialitiesLicenseCountOld write FUniversitySpecialitiesLicenseCountOld;
    property EducationDateBegin: TXSDateTime read FEducationDateBegin write FEducationDateBegin;
    property EducationDateEnd: TXSDateTime read FEducationDateEnd write FEducationDateEnd;
    property IsSecondEducation: Integer read FIsSecondEducation write FIsSecondEducation;
    property Id_UniversityFacultet: Integer read FId_UniversityFacultet write FId_UniversityFacultet;
    property Id_EntranceExamination: Integer read FId_EntranceExamination write FId_EntranceExamination;
    property UniversitySpecialitiesName: WideString read FUniversitySpecialitiesName write FUniversitySpecialitiesName;
  end;

  ArrayOfDUniversityFacultetSpecialities2 = array of dUniversityFacultetSpecialities2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dCourses = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Course: Integer;
    FCourseName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Course: Integer read FId_Course write FId_Course;
    property CourseName: WideString read FCourseName write FCourseName;
  end;

  ArrayOfDCourses = array of dCourses;          { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dSpec = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Spec: Integer;
    FSpecCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDateBegin: TXSDateTime;
    FSpecDateEnd: TXSDateTime;
    FId_SpecRedactions: Integer;
    FSpecRedactionCode: WideString;
    FSpecRedactionName: WideString;
    FId_SpecIndastry: Integer;
    FSpecIndastryCode: WideString;
    FSpecIndastryDateBegin: TXSDateTime;
    FSpecIndastryDateEnd: TXSDateTime;
    FId_SpecIndastryName: Integer;
    FSpecIndastryName: WideString;
    FId_SpecDirections: Integer;
    FSpecDirectionsCode: WideString;
    FSpecDirectionsDateBegin: TXSDateTime;
    FSpecDirectionsDateEnd: TXSDateTime;
    FId_SpecDirectionName: Integer;
    FSpecDirectionName: WideString;
    FId_SpecSpeciality: Integer;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityDateBegin: TXSDateTime;
    FSpecSpecialityDateEnd: TXSDateTime;
    FId_SpecSpecialityName: Integer;
    FSpecSpecialityName: WideString;
    FId_Language: Integer;
    FId_SpecSpecialization: Integer;
    FSpecSpecializationCode: WideString;
    FId_SpecSpecializationName: Integer;
    FSpecSpecializationName: WideString;
    FSpecCodeDateLastChange: TXSDateTime;
    FSpecIndastryClasifierCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Spec: Integer read FId_Spec write FId_Spec;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDateBegin: TXSDateTime read FSpecDateBegin write FSpecDateBegin;
    property SpecDateEnd: TXSDateTime read FSpecDateEnd write FSpecDateEnd;
    property Id_SpecRedactions: Integer read FId_SpecRedactions write FId_SpecRedactions;
    property SpecRedactionCode: WideString read FSpecRedactionCode write FSpecRedactionCode;
    property SpecRedactionName: WideString read FSpecRedactionName write FSpecRedactionName;
    property Id_SpecIndastry: Integer read FId_SpecIndastry write FId_SpecIndastry;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryDateBegin: TXSDateTime read FSpecIndastryDateBegin write FSpecIndastryDateBegin;
    property SpecIndastryDateEnd: TXSDateTime read FSpecIndastryDateEnd write FSpecIndastryDateEnd;
    property Id_SpecIndastryName: Integer read FId_SpecIndastryName write FId_SpecIndastryName;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property Id_SpecDirections: Integer read FId_SpecDirections write FId_SpecDirections;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecDirectionsDateBegin: TXSDateTime read FSpecDirectionsDateBegin write FSpecDirectionsDateBegin;
    property SpecDirectionsDateEnd: TXSDateTime read FSpecDirectionsDateEnd write FSpecDirectionsDateEnd;
    property Id_SpecDirectionName: Integer read FId_SpecDirectionName write FId_SpecDirectionName;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property Id_SpecSpeciality: Integer read FId_SpecSpeciality write FId_SpecSpeciality;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityDateBegin: TXSDateTime read FSpecSpecialityDateBegin write FSpecSpecialityDateBegin;
    property SpecSpecialityDateEnd: TXSDateTime read FSpecSpecialityDateEnd write FSpecSpecialityDateEnd;
    property Id_SpecSpecialityName: Integer read FId_SpecSpecialityName write FId_SpecSpecialityName;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property Id_SpecSpecialization: Integer read FId_SpecSpecialization write FId_SpecSpecialization;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property Id_SpecSpecializationName: Integer read FId_SpecSpecializationName write FId_SpecSpecializationName;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property SpecCodeDateLastChange: TXSDateTime read FSpecCodeDateLastChange write FSpecCodeDateLastChange;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
  end;

  ArrayOfDSpec = array of dSpec;                { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dSpecDirections = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FSpecDirectionsCode: WideString;
    FSpecDirectionName: WideString;
    FSpecClasifierCode: WideString;
    Folddta: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property olddta: Integer read Folddta write Folddta;
  end;

  ArrayOfDSpecDirections = array of dSpecDirections;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dSpecDirections2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FSpecDirectionsCode: WideString;
    FSpecDirectionName: WideString;
    FSpecClasifierCode: WideString;
    Folddta: Integer;
    FSpecDirectionNameEn: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property olddta: Integer read Folddta write Folddta;
    property SpecDirectionNameEn: WideString read FSpecDirectionNameEn write FSpecDirectionNameEn;
  end;

  ArrayOfDSpecDirections2 = array of dSpecDirections2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dKOATUU = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_KOATUU: Integer;
    FKOATUUCode: WideString;
    FType_: WideString;
    FId_KOATUUName: Integer;
    FKOATUUName: WideString;
    FKOATUUFullName: WideString;
    FKOATUUDateBegin: TXSDateTime;
    FKOATUUDateEnd: TXSDateTime;
    FId_Language: Integer;
    FKOATUUCodeL1: WideString;
    FKOATUUCodeL2: WideString;
    FKOATUUCodeL3: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_KOATUU: Integer read FId_KOATUU write FId_KOATUU;
    property KOATUUCode: WideString read FKOATUUCode write FKOATUUCode;
    property Type_: WideString read FType_ write FType_;
    property Id_KOATUUName: Integer read FId_KOATUUName write FId_KOATUUName;
    property KOATUUName: WideString read FKOATUUName write FKOATUUName;
    property KOATUUFullName: WideString read FKOATUUFullName write FKOATUUFullName;
    property KOATUUDateBegin: TXSDateTime read FKOATUUDateBegin write FKOATUUDateBegin;
    property KOATUUDateEnd: TXSDateTime read FKOATUUDateEnd write FKOATUUDateEnd;
    property Id_Language: Integer read FId_Language write FId_Language;
    property KOATUUCodeL1: WideString read FKOATUUCodeL1 write FKOATUUCodeL1;
    property KOATUUCodeL2: WideString read FKOATUUCodeL2 write FKOATUUCodeL2;
    property KOATUUCodeL3: WideString read FKOATUUCodeL3 write FKOATUUCodeL3;
  end;

  ArrayOfDKOATUU = array of dKOATUU;            { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dStreetTypes = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_StreetType: Integer;
    FId_StreetTypeName: Integer;
    FStreetTypeFullName: WideString;
    FStreetTypeShortName: WideString;
    FId_Language: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_StreetType: Integer read FId_StreetType write FId_StreetType;
    property Id_StreetTypeName: Integer read FId_StreetTypeName write FId_StreetTypeName;
    property StreetTypeFullName: WideString read FStreetTypeFullName write FStreetTypeFullName;
    property StreetTypeShortName: WideString read FStreetTypeShortName write FStreetTypeShortName;
    property Id_Language: Integer read FId_Language write FId_Language;
  end;

  ArrayOfDStreetTypes = array of dStreetTypes;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dUniversityFacultetsRequests = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonRequest: Integer;
    FId_PersonRequestSeasons: Integer;
    FPersonCodeU: WideString;
    FFIO: WideString;
    FUniversitySpecialitiesKode: WideString;
    FNameRequestSeason: WideString;
    FRequestPerPerson: Integer;
    FId_UniversitySpecialities: Integer;
    FUniversitySpecialitiesDateBegin: TXSDateTime;
    FUniversitySpecialitiesDateEnd: TXSDateTime;
    FUniversityKode: WideString;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FSpecCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityName: WideString;
    FId_Language: Integer;
    FSpecScecializationCode: WideString;
    FSpecScecializationName: WideString;
    FOriginalDocumentsAdd: Integer;
    FId_PersonRequestStatus: Integer;
    FId_PersonRequestStatusType: Integer;
    FPersonRequestStatusCode: WideString;
    FId_PersonRequestStatusTypeName: Integer;
    FPersonRequestStatusTypeName: WideString;
    FDescryption: WideString;
    FDateLastChange: TXSDateTime;
    FIsNeedHostel: Integer;
    FCodeOfBusiness: WideString;
    FId_PersonEnteranceTypes: Integer;
    FPersonEnteranceTypeName: WideString;
    FId_PersonRequestExaminationCause: Integer;
    FPersonRequestExaminationCauseName: WideString;
    FIsContract: Integer;
    FIsBudget: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FKonkursValue: TXSDecimal;
    FKonkursValueSource: WideString;
    FPriorityRequest: Integer;
    FKonkursValueCorrectValue: TXSDecimal;
    FKonkursValueCorrectValueDescription: WideString;
    FDateCreate: TXSDateTime;
    FId_PersonRequestSeasonDetails: Integer;
    FId_Qualification: Integer;
    FQualificationName: WideString;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FId_PersonDocument: Integer;
    FEntrantDocumentSeries: WideString;
    FEntrantDocumentNumbers: WideString;
    FEntrantDocumentDateGet: TXSDateTime;
    FEntrantDocumentIssued: WideString;
    FEntrantDocumentValue: TXSDecimal;
    FIsCheckForPaperCopy: Integer;
    FIsNotCheckAttestat: Integer;
    FIsForeinghEntrantDocumet: Integer;
    FRequestEnteranseCodes: WideString;
    FId_UniversityEntrantWave: Integer;
    FRequestStatusIsBudejt: Integer;
    FRequestStatusIsContract: Integer;
    FUniversityEntrantWaveName: WideString;
    FIsHigherEducation: Integer;
    FSkipDocumentValue: Integer;
    FId_EntrantDocumentAwardType: Integer;
    FEntrantDocumentAwardTypeName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property FIO: WideString read FFIO write FFIO;
    property UniversitySpecialitiesKode: WideString read FUniversitySpecialitiesKode write FUniversitySpecialitiesKode;
    property NameRequestSeason: WideString read FNameRequestSeason write FNameRequestSeason;
    property RequestPerPerson: Integer read FRequestPerPerson write FRequestPerPerson;
    property Id_UniversitySpecialities: Integer read FId_UniversitySpecialities write FId_UniversitySpecialities;
    property UniversitySpecialitiesDateBegin: TXSDateTime read FUniversitySpecialitiesDateBegin write FUniversitySpecialitiesDateBegin;
    property UniversitySpecialitiesDateEnd: TXSDateTime read FUniversitySpecialitiesDateEnd write FUniversitySpecialitiesDateEnd;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property SpecScecializationCode: WideString read FSpecScecializationCode write FSpecScecializationCode;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property OriginalDocumentsAdd: Integer read FOriginalDocumentsAdd write FOriginalDocumentsAdd;
    property Id_PersonRequestStatus: Integer read FId_PersonRequestStatus write FId_PersonRequestStatus;
    property Id_PersonRequestStatusType: Integer read FId_PersonRequestStatusType write FId_PersonRequestStatusType;
    property PersonRequestStatusCode: WideString read FPersonRequestStatusCode write FPersonRequestStatusCode;
    property Id_PersonRequestStatusTypeName: Integer read FId_PersonRequestStatusTypeName write FId_PersonRequestStatusTypeName;
    property PersonRequestStatusTypeName: WideString read FPersonRequestStatusTypeName write FPersonRequestStatusTypeName;
    property Descryption: WideString read FDescryption write FDescryption;
    property DateLastChange: TXSDateTime read FDateLastChange write FDateLastChange;
    property IsNeedHostel: Integer read FIsNeedHostel write FIsNeedHostel;
    property CodeOfBusiness: WideString read FCodeOfBusiness write FCodeOfBusiness;
    property Id_PersonEnteranceTypes: Integer read FId_PersonEnteranceTypes write FId_PersonEnteranceTypes;
    property PersonEnteranceTypeName: WideString read FPersonEnteranceTypeName write FPersonEnteranceTypeName;
    property Id_PersonRequestExaminationCause: Integer read FId_PersonRequestExaminationCause write FId_PersonRequestExaminationCause;
    property PersonRequestExaminationCauseName: WideString read FPersonRequestExaminationCauseName write FPersonRequestExaminationCauseName;
    property IsContract: Integer read FIsContract write FIsContract;
    property IsBudget: Integer read FIsBudget write FIsBudget;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property KonkursValue: TXSDecimal read FKonkursValue write FKonkursValue;
    property KonkursValueSource: WideString read FKonkursValueSource write FKonkursValueSource;
    property PriorityRequest: Integer read FPriorityRequest write FPriorityRequest;
    property KonkursValueCorrectValue: TXSDecimal read FKonkursValueCorrectValue write FKonkursValueCorrectValue;
    property KonkursValueCorrectValueDescription: WideString read FKonkursValueCorrectValueDescription write FKonkursValueCorrectValueDescription;
    property DateCreate: TXSDateTime read FDateCreate write FDateCreate;
    property Id_PersonRequestSeasonDetails: Integer read FId_PersonRequestSeasonDetails write FId_PersonRequestSeasonDetails;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property EntrantDocumentSeries: WideString read FEntrantDocumentSeries write FEntrantDocumentSeries;
    property EntrantDocumentNumbers: WideString read FEntrantDocumentNumbers write FEntrantDocumentNumbers;
    property EntrantDocumentDateGet: TXSDateTime read FEntrantDocumentDateGet write FEntrantDocumentDateGet;
    property EntrantDocumentIssued: WideString read FEntrantDocumentIssued write FEntrantDocumentIssued;
    property EntrantDocumentValue: TXSDecimal read FEntrantDocumentValue write FEntrantDocumentValue;
    property IsCheckForPaperCopy: Integer read FIsCheckForPaperCopy write FIsCheckForPaperCopy;
    property IsNotCheckAttestat: Integer read FIsNotCheckAttestat write FIsNotCheckAttestat;
    property IsForeinghEntrantDocumet: Integer read FIsForeinghEntrantDocumet write FIsForeinghEntrantDocumet;
    property RequestEnteranseCodes: WideString read FRequestEnteranseCodes write FRequestEnteranseCodes;
    property Id_UniversityEntrantWave: Integer read FId_UniversityEntrantWave write FId_UniversityEntrantWave;
    property RequestStatusIsBudejt: Integer read FRequestStatusIsBudejt write FRequestStatusIsBudejt;
    property RequestStatusIsContract: Integer read FRequestStatusIsContract write FRequestStatusIsContract;
    property UniversityEntrantWaveName: WideString read FUniversityEntrantWaveName write FUniversityEntrantWaveName;
    property IsHigherEducation: Integer read FIsHigherEducation write FIsHigherEducation;
    property SkipDocumentValue: Integer read FSkipDocumentValue write FSkipDocumentValue;
    property Id_EntrantDocumentAwardType: Integer read FId_EntrantDocumentAwardType write FId_EntrantDocumentAwardType;
    property EntrantDocumentAwardTypeName: WideString read FEntrantDocumentAwardTypeName write FEntrantDocumentAwardTypeName;
  end;

  ArrayOfDUniversityFacultetsRequests = array of dUniversityFacultetsRequests;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dUniversityFacultetsRequests2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonRequest: Integer;
    FId_PersonRequestSeasons: Integer;
    FPersonCodeU: WideString;
    FFIO: WideString;
    FUniversitySpecialitiesKode: WideString;
    FNameRequestSeason: WideString;
    FRequestPerPerson: Integer;
    FId_UniversitySpecialities: Integer;
    FUniversitySpecialitiesDateBegin: TXSDateTime;
    FUniversitySpecialitiesDateEnd: TXSDateTime;
    FUniversityKode: WideString;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FSpecCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityName: WideString;
    FId_Language: Integer;
    FSpecScecializationCode: WideString;
    FSpecScecializationName: WideString;
    FOriginalDocumentsAdd: Integer;
    FId_PersonRequestStatus: Integer;
    FId_PersonRequestStatusType: Integer;
    FPersonRequestStatusCode: WideString;
    FId_PersonRequestStatusTypeName: Integer;
    FPersonRequestStatusTypeName: WideString;
    FDescryption: WideString;
    FDateLastChange: TXSDateTime;
    FIsNeedHostel: Integer;
    FCodeOfBusiness: WideString;
    FId_PersonEnteranceTypes: Integer;
    FPersonEnteranceTypeName: WideString;
    FId_PersonRequestExaminationCause: Integer;
    FPersonRequestExaminationCauseName: WideString;
    FIsContract: Integer;
    FIsBudget: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FKonkursValue: TXSDecimal;
    FKonkursValueSource: WideString;
    FPriorityRequest: Integer;
    FKonkursValueCorrectValue: TXSDecimal;
    FKonkursValueCorrectValueDescription: WideString;
    FDateCreate: TXSDateTime;
    FId_PersonRequestSeasonDetails: Integer;
    FId_Qualification: Integer;
    FQualificationName: WideString;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FId_PersonDocument: Integer;
    FEntrantDocumentSeries: WideString;
    FEntrantDocumentNumbers: WideString;
    FEntrantDocumentDateGet: TXSDateTime;
    FEntrantDocumentIssued: WideString;
    FEntrantDocumentValue: TXSDecimal;
    FIsCheckForPaperCopy: Integer;
    FIsNotCheckAttestat: Integer;
    FIsForeinghEntrantDocumet: Integer;
    FRequestEnteranseCodes: WideString;
    FId_UniversityEntrantWave: Integer;
    FRequestStatusIsBudejt: Integer;
    FRequestStatusIsContract: Integer;
    FUniversityEntrantWaveName: WideString;
    FIsHigherEducation: Integer;
    FSkipDocumentValue: Integer;
    FId_EntrantDocumentAwardType: Integer;
    FEntrantDocumentAwardTypeName: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FExistBenefitsPershocherg: Integer;
    FExistBenefitsPozacherg: Integer;
    FZNOSubjects: WideString;
    FId_LanguageEx: Integer;
    FLanguageExName: WideString;
    FIsEz: Integer;
    FIsForeignWay: Integer;
    FId_ForeignType: Integer;
    FForeignTypeName: WideString;
    FId_Course: Integer;
    FExistQuotasCiloviy: Integer;
    FId_PersonSex: Integer;
    FResident: Integer;
    FKoatuType: WideString;
    FCountryName: WideString;
    FBirthday: TXSDateTime;
    FContactPhone: WideString;
    FContactMobile: WideString;
    FEntranceCodes: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property FIO: WideString read FFIO write FFIO;
    property UniversitySpecialitiesKode: WideString read FUniversitySpecialitiesKode write FUniversitySpecialitiesKode;
    property NameRequestSeason: WideString read FNameRequestSeason write FNameRequestSeason;
    property RequestPerPerson: Integer read FRequestPerPerson write FRequestPerPerson;
    property Id_UniversitySpecialities: Integer read FId_UniversitySpecialities write FId_UniversitySpecialities;
    property UniversitySpecialitiesDateBegin: TXSDateTime read FUniversitySpecialitiesDateBegin write FUniversitySpecialitiesDateBegin;
    property UniversitySpecialitiesDateEnd: TXSDateTime read FUniversitySpecialitiesDateEnd write FUniversitySpecialitiesDateEnd;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property SpecScecializationCode: WideString read FSpecScecializationCode write FSpecScecializationCode;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property OriginalDocumentsAdd: Integer read FOriginalDocumentsAdd write FOriginalDocumentsAdd;
    property Id_PersonRequestStatus: Integer read FId_PersonRequestStatus write FId_PersonRequestStatus;
    property Id_PersonRequestStatusType: Integer read FId_PersonRequestStatusType write FId_PersonRequestStatusType;
    property PersonRequestStatusCode: WideString read FPersonRequestStatusCode write FPersonRequestStatusCode;
    property Id_PersonRequestStatusTypeName: Integer read FId_PersonRequestStatusTypeName write FId_PersonRequestStatusTypeName;
    property PersonRequestStatusTypeName: WideString read FPersonRequestStatusTypeName write FPersonRequestStatusTypeName;
    property Descryption: WideString read FDescryption write FDescryption;
    property DateLastChange: TXSDateTime read FDateLastChange write FDateLastChange;
    property IsNeedHostel: Integer read FIsNeedHostel write FIsNeedHostel;
    property CodeOfBusiness: WideString read FCodeOfBusiness write FCodeOfBusiness;
    property Id_PersonEnteranceTypes: Integer read FId_PersonEnteranceTypes write FId_PersonEnteranceTypes;
    property PersonEnteranceTypeName: WideString read FPersonEnteranceTypeName write FPersonEnteranceTypeName;
    property Id_PersonRequestExaminationCause: Integer read FId_PersonRequestExaminationCause write FId_PersonRequestExaminationCause;
    property PersonRequestExaminationCauseName: WideString read FPersonRequestExaminationCauseName write FPersonRequestExaminationCauseName;
    property IsContract: Integer read FIsContract write FIsContract;
    property IsBudget: Integer read FIsBudget write FIsBudget;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property KonkursValue: TXSDecimal read FKonkursValue write FKonkursValue;
    property KonkursValueSource: WideString read FKonkursValueSource write FKonkursValueSource;
    property PriorityRequest: Integer read FPriorityRequest write FPriorityRequest;
    property KonkursValueCorrectValue: TXSDecimal read FKonkursValueCorrectValue write FKonkursValueCorrectValue;
    property KonkursValueCorrectValueDescription: WideString read FKonkursValueCorrectValueDescription write FKonkursValueCorrectValueDescription;
    property DateCreate: TXSDateTime read FDateCreate write FDateCreate;
    property Id_PersonRequestSeasonDetails: Integer read FId_PersonRequestSeasonDetails write FId_PersonRequestSeasonDetails;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property EntrantDocumentSeries: WideString read FEntrantDocumentSeries write FEntrantDocumentSeries;
    property EntrantDocumentNumbers: WideString read FEntrantDocumentNumbers write FEntrantDocumentNumbers;
    property EntrantDocumentDateGet: TXSDateTime read FEntrantDocumentDateGet write FEntrantDocumentDateGet;
    property EntrantDocumentIssued: WideString read FEntrantDocumentIssued write FEntrantDocumentIssued;
    property EntrantDocumentValue: TXSDecimal read FEntrantDocumentValue write FEntrantDocumentValue;
    property IsCheckForPaperCopy: Integer read FIsCheckForPaperCopy write FIsCheckForPaperCopy;
    property IsNotCheckAttestat: Integer read FIsNotCheckAttestat write FIsNotCheckAttestat;
    property IsForeinghEntrantDocumet: Integer read FIsForeinghEntrantDocumet write FIsForeinghEntrantDocumet;
    property RequestEnteranseCodes: WideString read FRequestEnteranseCodes write FRequestEnteranseCodes;
    property Id_UniversityEntrantWave: Integer read FId_UniversityEntrantWave write FId_UniversityEntrantWave;
    property RequestStatusIsBudejt: Integer read FRequestStatusIsBudejt write FRequestStatusIsBudejt;
    property RequestStatusIsContract: Integer read FRequestStatusIsContract write FRequestStatusIsContract;
    property UniversityEntrantWaveName: WideString read FUniversityEntrantWaveName write FUniversityEntrantWaveName;
    property IsHigherEducation: Integer read FIsHigherEducation write FIsHigherEducation;
    property SkipDocumentValue: Integer read FSkipDocumentValue write FSkipDocumentValue;
    property Id_EntrantDocumentAwardType: Integer read FId_EntrantDocumentAwardType write FId_EntrantDocumentAwardType;
    property EntrantDocumentAwardTypeName: WideString read FEntrantDocumentAwardTypeName write FEntrantDocumentAwardTypeName;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property ExistBenefitsPershocherg: Integer read FExistBenefitsPershocherg write FExistBenefitsPershocherg;
    property ExistBenefitsPozacherg: Integer read FExistBenefitsPozacherg write FExistBenefitsPozacherg;
    property ZNOSubjects: WideString read FZNOSubjects write FZNOSubjects;
    property Id_LanguageEx: Integer read FId_LanguageEx write FId_LanguageEx;
    property LanguageExName: WideString read FLanguageExName write FLanguageExName;
    property IsEz: Integer read FIsEz write FIsEz;
    property IsForeignWay: Integer read FIsForeignWay write FIsForeignWay;
    property Id_ForeignType: Integer read FId_ForeignType write FId_ForeignType;
    property ForeignTypeName: WideString read FForeignTypeName write FForeignTypeName;
    property Id_Course: Integer read FId_Course write FId_Course;
    property ExistQuotasCiloviy: Integer read FExistQuotasCiloviy write FExistQuotasCiloviy;
    property Id_PersonSex: Integer read FId_PersonSex write FId_PersonSex;
    property Resident: Integer read FResident write FResident;
    property KoatuType: WideString read FKoatuType write FKoatuType;
    property CountryName: WideString read FCountryName write FCountryName;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property ContactPhone: WideString read FContactPhone write FContactPhone;
    property ContactMobile: WideString read FContactMobile write FContactMobile;
    property EntranceCodes: WideString read FEntranceCodes write FEntranceCodes;
  end;

  ArrayOfDUniversityFacultetsRequests2 = array of dUniversityFacultetsRequests2;   { "http://edboservice.ua/" }

  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // soapAction: http://edboservice.ua/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : EDBOGuidesSoap
  // service   : EDBOGuides
  // port      : EDBOGuidesSoap
  // URL       : http://ias.donnu.edu.ua/EDBOdata/EDBOGuidesToFMASService.asmx
  // ************************************************************************ //
  EDBOGuidesSoap = interface(IInvokable)
  ['{3388FE85-720C-04EE-2F43-F032C77ACE1C}']
    function  AcademicYearsGet(const SessionGUID: WideString; const Id_Language: Integer): ArrayOfDAcademicYears; stdcall;
    function  Login(const User: WideString; const Password: WideString; const ClearPreviewSession: Integer; const ApplicationKey: WideString): WideString; stdcall;
    function  GetLastError(const GUIDSession: WideString): ArrayOfDLastError; stdcall;
    function  CheckUser(const SessionGUID: WideString): Integer; stdcall;
    function  UniversitiesGet(const SessionGUID: WideString; const UniversityKode: WideString; const Id_Language: Integer; const ActualDate: WideString; const UniversityName: WideString): ArrayOfDUniversities; stdcall;
    function  UniversitiesGet2(const SessionGUID: WideString; const UniversityKode: WideString; const Id_Language: Integer; const ActualDate: WideString; const UniversityName: WideString; const KOATUUL1: WideString; const KOATUUL2: WideString; const SpecDirectionsCode: WideString; const Id_UniversityType: Integer): ArrayOfDUniversities; stdcall;
    function  LanguagesGet(const SessionGUID: WideString): ArrayOfDLanguages; stdcall;
    function  UniversityFacultetsGet(const SessionGUID: WideString; const UniversityKode: WideString; const UniversityFacultetKode: WideString; const Id_Language: Integer; const ActualDate: WideString; const FacultetGetMode: Integer; const Id_UniversityFacultetTypes: WideString; const IsAvailableForReceiptOfRequest: Integer; const IsAvailableForBindStudentPersons: Integer; const Id_UniversityFacultet: Integer; 
                                     const IsAvailableForBindStaffPersons: Integer): ArrayOfDUniversityFacultets; stdcall;
    function  UniversityFacultetSpecialitiesGet(const SessionGUID: WideString; const UniversityKode: WideString; const UniversityFacultetKode: WideString; const SpecCode: WideString; const Id_Language: Integer; const ActualDate: WideString; const Id_PersonRequestSeasons: Integer; const Id_PersonEducationForm: Integer; const UniversitySpecialitiesKode: WideString; const SpecDirectionsCode: WideString; 
                                                const SpecSpecialityCode: WideString; const Filters: WideString): ArrayOfDUniversityFacultetSpecialities; stdcall;
    function  UniversityFacultetSpecialitiesGet2(const SessionGUID: WideString; const UniversityKode: WideString; const UniversityFacultetKode: WideString; const SpecCode: WideString; const Id_Language: Integer; const ActualDate: WideString; const Id_PersonRequestSeasons: Integer; const Id_PersonEducationForm: Integer; const UniversitySpecialitiesKode: WideString; const SpecDirectionsCode: WideString; 
                                                 const SpecSpecialityCode: WideString; const Filters: WideString): ArrayOfDUniversityFacultetSpecialities2; stdcall;
    function  CoursesGet(const SessionGUID: WideString; const Id_Language: Integer): ArrayOfDCourses; stdcall;
    function  SpecGet(const SessionGUID: WideString; const SpecRedactionCode: WideString; const SpecIndastryCode: WideString; const SpecDirectionsCode: WideString; const SpecSpecialityCode: WideString; const SpecCode: WideString; const Id_Language: Integer; const ActualDate: WideString; const SpecClasifierCode: WideString): ArrayOfDSpec; stdcall;
    function  SpecDirectionsGet(const SessionGUID: WideString; const Id_Language: Integer; const ActualDate: WideString; const SpecIndastryClasifierCode: WideString; const SpecClasifierCode: WideString; const CodeMask: WideString; const DictType: Integer): ArrayOfDSpecDirections; stdcall;
    function  SpecDirectionsGet2(const SessionGUID: WideString; const Id_Language: Integer; const ActualDate: WideString; const SpecIndastryClasifierCode: WideString; const SpecClasifierCode: WideString; const CodeMask: WideString; const DictType: Integer): ArrayOfDSpecDirections2; stdcall;
    function  KOATUUGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const KOATUUCode: WideString; const Hundred: Integer; const NameMask: WideString; const FullNameMask: WideString; const WitchRegions: Integer): ArrayOfDKOATUU; stdcall;
    function  KOATUUGetL1(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer): ArrayOfDKOATUU; stdcall;
    function  KOATUUGetL2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const KOATUUCodeL1: WideString): ArrayOfDKOATUU; stdcall;
    function  KOATUUGetL3(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const KOATUUCodeL2: WideString; const NameMask: WideString): ArrayOfDKOATUU; stdcall;
    function  StreetTypesGet(const SessionGUID: WideString; const Id_Language: Integer): ArrayOfDStreetTypes; stdcall;
    function  UniversityFacultetsGetRequests(const SessionGUID: WideString; const Id_PersonRequestSeasons: Integer; const UniversityFacultetKode: WideString; const UniversitySpecialitiesKode: WideString; const Id_Language: Integer; const ActualDate: WideString; const PersonCodeU: WideString; const Hundred: Integer; const MinDate: WideString; const Id_PersonRequestStatusType1: Integer; 
                                             const Id_PersonRequestStatusType2: Integer; const Id_PersonRequestStatusType3: Integer; const Id_PersonEducationForm: Integer; const UniversityKode: WideString; const Id_Qualification: Integer; const Filters: WideString): ArrayOfDUniversityFacultetsRequests; stdcall;
    function  UniversityFacultetsGetRequests2(const SessionGUID: WideString; const Id_PersonRequestSeasons: Integer; const UniversityFacultetKode: WideString; const UniversitySpecialitiesKode: WideString; const Id_Language: Integer; const ActualDate: WideString; const PersonCodeU: WideString; const Hundred: Integer; const MinDate: WideString; const Id_PersonRequestStatusType1: Integer; 
                                              const Id_PersonRequestStatusType2: Integer; const Id_PersonRequestStatusType3: Integer; const Id_PersonEducationForm: Integer; const UniversityKode: WideString; const Id_Qualification: Integer; const Filters: WideString): ArrayOfDUniversityFacultetsRequests2; stdcall;
  end;

function GetEDBOGuidesSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): EDBOGuidesSoap;


implementation

function GetEDBOGuidesSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): EDBOGuidesSoap;
const
  defWSDL = 'D:\DonnU\SourcesSVN\FMAS-WIN\Contingent_Student\Sources\WSDL\EDBOGuidesToFMASService.wsdl';
  defURL  = 'http://ias.donnu.edu.ua/EDBOdata/EDBOGuidesToFMASService.asmx';
  defSvc  = 'EDBOGuides';
  defPrt  = 'EDBOGuidesSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as EDBOGuidesSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor dAcademicYears.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FAcademicYearDateBegin) then
    FAcademicYearDateBegin.Free;
  if Assigned(FAcademicYearDateEnd) then
    FAcademicYearDateEnd.Free;
  if Assigned(FAcademicYearDatelLastChange) then
    FAcademicYearDatelLastChange.Free;
  inherited Destroy;
end;

destructor dLastError.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dUniversities.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversityDateBegin) then
    FUniversityDateBegin.Free;
  if Assigned(FUniversityDateEnd) then
    FUniversityDateEnd.Free;
  if Assigned(FDateRegistration) then
    FDateRegistration.Free;
  if Assigned(FUniversityRegistrationDateBegin) then
    FUniversityRegistrationDateBegin.Free;
  if Assigned(FUniversityRegistrationDateEnd) then
    FUniversityRegistrationDateEnd.Free;
  if Assigned(FUniversityRegistrationDateLastChange) then
    FUniversityRegistrationDateLastChange.Free;
  if Assigned(FWarrantDate) then
    FWarrantDate.Free;
  inherited Destroy;
end;

destructor dLanguages.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dUniversityFacultets.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversityFacultetDateBegin) then
    FUniversityFacultetDateBegin.Free;
  if Assigned(FUniversityFacultetDateEnd) then
    FUniversityFacultetDateEnd.Free;
  inherited Destroy;
end;

destructor dUniversityFacultetSpecialities.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversitySpecialitiesDateBegin) then
    FUniversitySpecialitiesDateBegin.Free;
  if Assigned(FUniversitySpecialitiesDateEnd) then
    FUniversitySpecialitiesDateEnd.Free;
  if Assigned(FDateBeginPersonRequestSeason) then
    FDateBeginPersonRequestSeason.Free;
  if Assigned(FDateEndPersonRequestSeason) then
    FDateEndPersonRequestSeason.Free;
  if Assigned(FDurationEducation) then
    FDurationEducation.Free;
  if Assigned(FEducationDateBegin) then
    FEducationDateBegin.Free;
  if Assigned(FEducationDateEnd) then
    FEducationDateEnd.Free;
  inherited Destroy;
end;

destructor dUniversityFacultetSpecialities2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversitySpecialitiesDateBegin) then
    FUniversitySpecialitiesDateBegin.Free;
  if Assigned(FUniversitySpecialitiesDateEnd) then
    FUniversitySpecialitiesDateEnd.Free;
  if Assigned(FDateBeginPersonRequestSeason) then
    FDateBeginPersonRequestSeason.Free;
  if Assigned(FDateEndPersonRequestSeason) then
    FDateEndPersonRequestSeason.Free;
  if Assigned(FDurationEducation) then
    FDurationEducation.Free;
  if Assigned(FEducationDateBegin) then
    FEducationDateBegin.Free;
  if Assigned(FEducationDateEnd) then
    FEducationDateEnd.Free;
  inherited Destroy;
end;

destructor dCourses.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dSpec.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FSpecDateBegin) then
    FSpecDateBegin.Free;
  if Assigned(FSpecDateEnd) then
    FSpecDateEnd.Free;
  if Assigned(FSpecIndastryDateBegin) then
    FSpecIndastryDateBegin.Free;
  if Assigned(FSpecIndastryDateEnd) then
    FSpecIndastryDateEnd.Free;
  if Assigned(FSpecDirectionsDateBegin) then
    FSpecDirectionsDateBegin.Free;
  if Assigned(FSpecDirectionsDateEnd) then
    FSpecDirectionsDateEnd.Free;
  if Assigned(FSpecSpecialityDateBegin) then
    FSpecSpecialityDateBegin.Free;
  if Assigned(FSpecSpecialityDateEnd) then
    FSpecSpecialityDateEnd.Free;
  if Assigned(FSpecCodeDateLastChange) then
    FSpecCodeDateLastChange.Free;
  inherited Destroy;
end;

destructor dSpecDirections.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dSpecDirections2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dKOATUU.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FKOATUUDateBegin) then
    FKOATUUDateBegin.Free;
  if Assigned(FKOATUUDateEnd) then
    FKOATUUDateEnd.Free;
  inherited Destroy;
end;

destructor dStreetTypes.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dUniversityFacultetsRequests.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversitySpecialitiesDateBegin) then
    FUniversitySpecialitiesDateBegin.Free;
  if Assigned(FUniversitySpecialitiesDateEnd) then
    FUniversitySpecialitiesDateEnd.Free;
  if Assigned(FDateLastChange) then
    FDateLastChange.Free;
  if Assigned(FKonkursValue) then
    FKonkursValue.Free;
  if Assigned(FKonkursValueCorrectValue) then
    FKonkursValueCorrectValue.Free;
  if Assigned(FDateCreate) then
    FDateCreate.Free;
  if Assigned(FEntrantDocumentDateGet) then
    FEntrantDocumentDateGet.Free;
  if Assigned(FEntrantDocumentValue) then
    FEntrantDocumentValue.Free;
  inherited Destroy;
end;

destructor dUniversityFacultetsRequests2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversitySpecialitiesDateBegin) then
    FUniversitySpecialitiesDateBegin.Free;
  if Assigned(FUniversitySpecialitiesDateEnd) then
    FUniversitySpecialitiesDateEnd.Free;
  if Assigned(FDateLastChange) then
    FDateLastChange.Free;
  if Assigned(FKonkursValue) then
    FKonkursValue.Free;
  if Assigned(FKonkursValueCorrectValue) then
    FKonkursValueCorrectValue.Free;
  if Assigned(FDateCreate) then
    FDateCreate.Free;
  if Assigned(FEntrantDocumentDateGet) then
    FEntrantDocumentDateGet.Free;
  if Assigned(FEntrantDocumentValue) then
    FEntrantDocumentValue.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(EDBOGuidesSoap), 'http://edboservice.ua/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(EDBOGuidesSoap), 'http://edboservice.ua/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(EDBOGuidesSoap), ioDocument);
  RemClassRegistry.RegisterXSClass(ExtensionDataObject, 'http://edboservice.ua/', 'ExtensionDataObject');
  RemClassRegistry.RegisterXSClass(dAcademicYears, 'http://edboservice.ua/', 'dAcademicYears');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDAcademicYears), 'http://edboservice.ua/', 'ArrayOfDAcademicYears');
  RemClassRegistry.RegisterXSClass(dLastError, 'http://edboservice.ua/', 'dLastError');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDLastError), 'http://edboservice.ua/', 'ArrayOfDLastError');
  RemClassRegistry.RegisterXSClass(dUniversities, 'http://edboservice.ua/', 'dUniversities');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDUniversities), 'http://edboservice.ua/', 'ArrayOfDUniversities');
  RemClassRegistry.RegisterXSClass(dLanguages, 'http://edboservice.ua/', 'dLanguages');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDLanguages), 'http://edboservice.ua/', 'ArrayOfDLanguages');
  RemClassRegistry.RegisterXSClass(dUniversityFacultets, 'http://edboservice.ua/', 'dUniversityFacultets');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDUniversityFacultets), 'http://edboservice.ua/', 'ArrayOfDUniversityFacultets');
  RemClassRegistry.RegisterXSClass(dUniversityFacultetSpecialities, 'http://edboservice.ua/', 'dUniversityFacultetSpecialities');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDUniversityFacultetSpecialities), 'http://edboservice.ua/', 'ArrayOfDUniversityFacultetSpecialities');
  RemClassRegistry.RegisterXSClass(dUniversityFacultetSpecialities2, 'http://edboservice.ua/', 'dUniversityFacultetSpecialities2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDUniversityFacultetSpecialities2), 'http://edboservice.ua/', 'ArrayOfDUniversityFacultetSpecialities2');
  RemClassRegistry.RegisterXSClass(dCourses, 'http://edboservice.ua/', 'dCourses');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDCourses), 'http://edboservice.ua/', 'ArrayOfDCourses');
  RemClassRegistry.RegisterXSClass(dSpec, 'http://edboservice.ua/', 'dSpec');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDSpec), 'http://edboservice.ua/', 'ArrayOfDSpec');
  RemClassRegistry.RegisterXSClass(dSpecDirections, 'http://edboservice.ua/', 'dSpecDirections');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDSpecDirections), 'http://edboservice.ua/', 'ArrayOfDSpecDirections');
  RemClassRegistry.RegisterXSClass(dSpecDirections2, 'http://edboservice.ua/', 'dSpecDirections2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDSpecDirections2), 'http://edboservice.ua/', 'ArrayOfDSpecDirections2');
  RemClassRegistry.RegisterXSClass(dKOATUU, 'http://edboservice.ua/', 'dKOATUU');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(dKOATUU), 'Type_', 'Type');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDKOATUU), 'http://edboservice.ua/', 'ArrayOfDKOATUU');
  RemClassRegistry.RegisterXSClass(dStreetTypes, 'http://edboservice.ua/', 'dStreetTypes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDStreetTypes), 'http://edboservice.ua/', 'ArrayOfDStreetTypes');
  RemClassRegistry.RegisterXSClass(dUniversityFacultetsRequests, 'http://edboservice.ua/', 'dUniversityFacultetsRequests');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDUniversityFacultetsRequests), 'http://edboservice.ua/', 'ArrayOfDUniversityFacultetsRequests');
  RemClassRegistry.RegisterXSClass(dUniversityFacultetsRequests2, 'http://edboservice.ua/', 'dUniversityFacultetsRequests2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDUniversityFacultetsRequests2), 'http://edboservice.ua/', 'ArrayOfDUniversityFacultetsRequests2');

end.