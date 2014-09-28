// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\DonnU\SourcesSVN\FMAS-WIN\Contingent_Student\Sources\WSDL\EDBOPersonToFMASService.wsdl
// Encoding : UTF-8
// Version  : 1.0
// (12.03.2014 11:34:08 - 1.33.2.5)
// ************************************************************************ //

unit EDBOPersonToFMASService;

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
  // !:float           - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"

  ExtensionDataObject  = class;                 { "http://edboservice.ua/" }
  dLastError           = class;                 { "http://edboservice.ua/" }
  dQualification       = class;                 { "http://edboservice.ua/" }
  dPersonRequestSeasons = class;                { "http://edboservice.ua/" }
  dPersonEducationFormsGet = class;             { "http://edboservice.ua/" }
  dPersonAddRet        = class;                 { "http://edboservice.ua/" }
  dPersonsIds          = class;                 { "http://edboservice.ua/" }
  dPersonContacts      = class;                 { "http://edboservice.ua/" }
  dPersonsFind         = class;                 { "http://edboservice.ua/" }
  dPersonsFind2        = class;                 { "http://edboservice.ua/" }
  dCountries           = class;                 { "http://edboservice.ua/" }
  dLanguages           = class;                 { "http://edboservice.ua/" }
  dPersonsStudentsGrups = class;                { "http://edboservice.ua/" }
  dPersonsStudentsGrups2 = class;               { "http://edboservice.ua/" }
  dPersonSOAPPhoto     = class;                 { "http://edboservice.ua/" }
  dPersonEducationHistoryTypes = class;         { "http://edboservice.ua/" }
  dPersonEducationHistoryOrdersStatuses = class;   { "http://edboservice.ua/" }
  dPersonEducationHistoryOrders = class;        { "http://edboservice.ua/" }
  dPersonEducationHistoryOrders2 = class;       { "http://edboservice.ua/" }
  dPersonDocumentTypes = class;                 { "http://edboservice.ua/" }
  dPersonDocuments     = class;                 { "http://edboservice.ua/" }
  dPersonDocuments2    = class;                 { "http://edboservice.ua/" }
  dPersonEducations    = class;                 { "http://edboservice.ua/" }
  dPersonEducations2   = class;                 { "http://edboservice.ua/" }
  dPersonEducationHistoryOrdersData = class;    { "http://edboservice.ua/" }
  dPersonEducationHistoryOrdersData2 = class;   { "http://edboservice.ua/" }
  dPersonEducationHistoryOrdersChangeFIOData = class;   { "http://edboservice.ua/" }
  dPersonEducationHistory = class;              { "http://edboservice.ua/" }
  dPersonEducationHistory2 = class;             { "http://edboservice.ua/" }
  dPersonAddresses     = class;                 { "http://edboservice.ua/" }
  dPersonAddresses2    = class;                 { "http://edboservice.ua/" }
  dPersonTypeDictGet   = class;                 { "http://edboservice.ua/" }
  dPersonRequests      = class;                 { "http://edboservice.ua/" }
  dPersonRequests2     = class;                 { "http://edboservice.ua/" }
  dPersonEducationPaymentTypes = class;         { "http://edboservice.ua/" }
  dPersonsStudentsGrupsPersonsFind = class;     { "http://edboservice.ua/" }
  dPersonsStudentsGrupsPersonsFind2 = class;    { "http://edboservice.ua/" }
  dPersonsStudentsGrupsPersons = class;         { "http://edboservice.ua/" }
  dPersonsStudentsGrupsPersons2 = class;        { "http://edboservice.ua/" }
  dPersonEducationsFull = class;                { "http://edboservice.ua/" }
  dPersonCountry       = class;                 { "http://edboservice.ua/" }



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
  dQualification = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Qualification: Integer;
    FQualificationName: WideString;
    FQualificationDateLastChange: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property QualificationDateLastChange: TXSDateTime read FQualificationDateLastChange write FQualificationDateLastChange;
  end;

  ArrayOfDQualification = array of dQualification;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonRequestSeasons = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonRequestSeasons: Integer;
    FName: WideString;
    FRequestPerPerson: Integer;
    FClosed: Integer;
    FId_PersonRequestSeasonDetails: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FDateBeginPersonRequestSeason: TXSDateTime;
    FDateEndPersonRequestSeason: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property Name: WideString read FName write FName;
    property RequestPerPerson: Integer read FRequestPerPerson write FRequestPerPerson;
    property Closed: Integer read FClosed write FClosed;
    property Id_PersonRequestSeasonDetails: Integer read FId_PersonRequestSeasonDetails write FId_PersonRequestSeasonDetails;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property DateBeginPersonRequestSeason: TXSDateTime read FDateBeginPersonRequestSeason write FDateBeginPersonRequestSeason;
    property DateEndPersonRequestSeason: TXSDateTime read FDateEndPersonRequestSeason write FDateEndPersonRequestSeason;
  end;

  ArrayOfDPersonRequestSeasons = array of dPersonRequestSeasons;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationFormsGet = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationForm: Integer;
    FId_PersonEducationFormName: Integer;
    FPersonEducationFormName: WideString;
    FId_Language: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_PersonEducationFormName: Integer read FId_PersonEducationFormName write FId_PersonEducationFormName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property Id_Language: Integer read FId_Language write FId_Language;
  end;

  ArrayOfDPersonEducationFormsGet = array of dPersonEducationFormsGet;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonAddRet = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Person: Integer;
    FPersonCodeU: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Person: Integer read FId_Person write FId_Person;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
  end;

  ArrayOfDPersonAddRet = array of dPersonAddRet;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsIds = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Person: Integer;
    FPersonCodeU: WideString;
    FDateLastChange: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Person: Integer read FId_Person write FId_Person;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property DateLastChange: TXSDateTime read FDateLastChange write FDateLastChange;
  end;

  ArrayOfDPersonsIds = array of dPersonsIds;    { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonContacts = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonContact: Integer;
    FId_Person: Integer;
    FId_PersonContactType: Integer;
    FPersonContactTypeName: WideString;
    FValue: WideString;
    FDefaull: Integer;
    FId_Language: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonContact: Integer read FId_PersonContact write FId_PersonContact;
    property Id_Person: Integer read FId_Person write FId_Person;
    property Id_PersonContactType: Integer read FId_PersonContactType write FId_PersonContactType;
    property PersonContactTypeName: WideString read FPersonContactTypeName write FPersonContactTypeName;
    property Value: WideString read FValue write FValue;
    property Defaull: Integer read FDefaull write FDefaull;
    property Id_Language: Integer read FId_Language write FId_Language;
  end;

  ArrayOfDPersonContacts = array of dPersonContacts;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsFind = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Person: Integer;
    FResident: Integer;
    FPersonCodeU: WideString;
    FBirthday: TXSDateTime;
    FId_PersonName: Integer;
    FLastName: WideString;
    FFirstName: WideString;
    FMiddleName: WideString;
    FPersonNameDateBegin: TXSDateTime;
    FPersonNameDateEnd: TXSDateTime;
    FFIO: WideString;
    FPasportSeries: WideString;
    FPasportNumber: WideString;
    FPasportDate: TXSDateTime;
    FPasportIssued: WideString;
    FAtestatSeries: WideString;
    FAtestatNumber: WideString;
    FAtestatDate: TXSDateTime;
    FId_PersonSex: Integer;
    FPersonSexName: WideString;
    FId_Language: Integer;
    FId_PersonDocumentPasp: Integer;
    FId_PersonDocumentAtestat: Integer;
    FId_PersonTypeDict: Integer;
    FPersonTypeName: WideString;
    FFather: WideString;
    FMother: WideString;
    FFatherPhones: WideString;
    FMotherPhones: WideString;
    FBirthplace: WideString;
    FLanguagesAreStudied: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Person: Integer read FId_Person write FId_Person;
    property Resident: Integer read FResident write FResident;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property Id_PersonName: Integer read FId_PersonName write FId_PersonName;
    property LastName: WideString read FLastName write FLastName;
    property FirstName: WideString read FFirstName write FFirstName;
    property MiddleName: WideString read FMiddleName write FMiddleName;
    property PersonNameDateBegin: TXSDateTime read FPersonNameDateBegin write FPersonNameDateBegin;
    property PersonNameDateEnd: TXSDateTime read FPersonNameDateEnd write FPersonNameDateEnd;
    property FIO: WideString read FFIO write FFIO;
    property PasportSeries: WideString read FPasportSeries write FPasportSeries;
    property PasportNumber: WideString read FPasportNumber write FPasportNumber;
    property PasportDate: TXSDateTime read FPasportDate write FPasportDate;
    property PasportIssued: WideString read FPasportIssued write FPasportIssued;
    property AtestatSeries: WideString read FAtestatSeries write FAtestatSeries;
    property AtestatNumber: WideString read FAtestatNumber write FAtestatNumber;
    property AtestatDate: TXSDateTime read FAtestatDate write FAtestatDate;
    property Id_PersonSex: Integer read FId_PersonSex write FId_PersonSex;
    property PersonSexName: WideString read FPersonSexName write FPersonSexName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property Id_PersonDocumentPasp: Integer read FId_PersonDocumentPasp write FId_PersonDocumentPasp;
    property Id_PersonDocumentAtestat: Integer read FId_PersonDocumentAtestat write FId_PersonDocumentAtestat;
    property Id_PersonTypeDict: Integer read FId_PersonTypeDict write FId_PersonTypeDict;
    property PersonTypeName: WideString read FPersonTypeName write FPersonTypeName;
    property Father: WideString read FFather write FFather;
    property Mother: WideString read FMother write FMother;
    property FatherPhones: WideString read FFatherPhones write FFatherPhones;
    property MotherPhones: WideString read FMotherPhones write FMotherPhones;
    property Birthplace: WideString read FBirthplace write FBirthplace;
    property LanguagesAreStudied: WideString read FLanguagesAreStudied write FLanguagesAreStudied;
  end;

  ArrayOfDPersonsFind = array of dPersonsFind;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsFind2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Person: Integer;
    FResident: Integer;
    FPersonCodeU: WideString;
    FBirthday: TXSDateTime;
    FId_PersonName: Integer;
    FLastName: WideString;
    FFirstName: WideString;
    FMiddleName: WideString;
    FPersonNameDateBegin: TXSDateTime;
    FPersonNameDateEnd: TXSDateTime;
    FFIO: WideString;
    FPasportSeries: WideString;
    FPasportNumber: WideString;
    FPasportDate: TXSDateTime;
    FPasportIssued: WideString;
    FAtestatSeries: WideString;
    FAtestatNumber: WideString;
    FAtestatDate: TXSDateTime;
    FId_PersonSex: Integer;
    FPersonSexName: WideString;
    FId_Language: Integer;
    FId_PersonDocumentPasp: Integer;
    FId_PersonDocumentAtestat: Integer;
    FId_PersonTypeDict: Integer;
    FPersonTypeName: WideString;
    FFather: WideString;
    FMother: WideString;
    FFatherPhones: WideString;
    FMotherPhones: WideString;
    FBirthplace: WideString;
    FLanguagesAreStudied: WideString;
    FLastNameEn: WideString;
    FFirstNameEn: WideString;
    FMiddleNameEn: WideString;
    FFIOEn: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Person: Integer read FId_Person write FId_Person;
    property Resident: Integer read FResident write FResident;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property Id_PersonName: Integer read FId_PersonName write FId_PersonName;
    property LastName: WideString read FLastName write FLastName;
    property FirstName: WideString read FFirstName write FFirstName;
    property MiddleName: WideString read FMiddleName write FMiddleName;
    property PersonNameDateBegin: TXSDateTime read FPersonNameDateBegin write FPersonNameDateBegin;
    property PersonNameDateEnd: TXSDateTime read FPersonNameDateEnd write FPersonNameDateEnd;
    property FIO: WideString read FFIO write FFIO;
    property PasportSeries: WideString read FPasportSeries write FPasportSeries;
    property PasportNumber: WideString read FPasportNumber write FPasportNumber;
    property PasportDate: TXSDateTime read FPasportDate write FPasportDate;
    property PasportIssued: WideString read FPasportIssued write FPasportIssued;
    property AtestatSeries: WideString read FAtestatSeries write FAtestatSeries;
    property AtestatNumber: WideString read FAtestatNumber write FAtestatNumber;
    property AtestatDate: TXSDateTime read FAtestatDate write FAtestatDate;
    property Id_PersonSex: Integer read FId_PersonSex write FId_PersonSex;
    property PersonSexName: WideString read FPersonSexName write FPersonSexName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property Id_PersonDocumentPasp: Integer read FId_PersonDocumentPasp write FId_PersonDocumentPasp;
    property Id_PersonDocumentAtestat: Integer read FId_PersonDocumentAtestat write FId_PersonDocumentAtestat;
    property Id_PersonTypeDict: Integer read FId_PersonTypeDict write FId_PersonTypeDict;
    property PersonTypeName: WideString read FPersonTypeName write FPersonTypeName;
    property Father: WideString read FFather write FFather;
    property Mother: WideString read FMother write FMother;
    property FatherPhones: WideString read FFatherPhones write FFatherPhones;
    property MotherPhones: WideString read FMotherPhones write FMotherPhones;
    property Birthplace: WideString read FBirthplace write FBirthplace;
    property LanguagesAreStudied: WideString read FLanguagesAreStudied write FLanguagesAreStudied;
    property LastNameEn: WideString read FLastNameEn write FLastNameEn;
    property FirstNameEn: WideString read FFirstNameEn write FFirstNameEn;
    property MiddleNameEn: WideString read FMiddleNameEn write FMiddleNameEn;
    property FIOEn: WideString read FFIOEn write FFIOEn;
  end;

  ArrayOfDPersonsFind2 = array of dPersonsFind2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dCountries = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Country: Integer;
    FCountryName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Country: Integer read FId_Country write FId_Country;
    property CountryName: WideString read FCountryName write FCountryName;
  end;

  ArrayOfDCountries = array of dCountries;      { "http://edboservice.ua/" }


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
  dPersonsStudentsGrups = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    Fid_pk: Integer;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FStudentsCount: Integer;
    FUniversityFacultetFullName: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FAcademicYearName: WideString;
    FCourseName: WideString;
    FQualificationName: WideString;
    FPersonEducationFormName: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property id_pk: Integer read Fid_pk write Fid_pk;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property StudentsCount: Integer read FStudentsCount write FStudentsCount;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property CourseName: WideString read FCourseName write FCourseName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
  end;

  ArrayOfDPersonsStudentsGrups = array of dPersonsStudentsGrups;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsStudentsGrups2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    Fid_pk: Integer;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FStudentsCount: Integer;
    FUniversityFacultetFullName: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FAcademicYearName: WideString;
    FCourseName: WideString;
    FQualificationName: WideString;
    FPersonEducationFormName: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FSpecProfessionClassifierCode1: WideString;
    FSpecProfessionName1: WideString;
    FSpecProfessionClassifierCode2: WideString;
    FSpecProfessionName2: WideString;
    FSpecProfessionClassifierCode3: WideString;
    FSpecProfessionName3: WideString;
    FSpecProfessionClassifierCode4: WideString;
    FSpecProfessionName4: WideString;
    FSpecProfessionClassifierCode5: WideString;
    FSpecProfessionName5: WideString;
    FSpecProfessionCode1: WideString;
    FSpecProfessionCode2: WideString;
    FSpecProfessionCode3: WideString;
    FSpecProfessionCode4: WideString;
    FSpecProfessionCode5: WideString;
    FSpecComplexName: WideString;
    FSpecProfession1_MaxRang: WideString;
    FSpecProfession2_MaxRang: WideString;
    FSpecProfession3_MaxRang: WideString;
    FSpecProfession4_MaxRang: WideString;
    FSpecProfession5_MaxRang: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property id_pk: Integer read Fid_pk write Fid_pk;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property StudentsCount: Integer read FStudentsCount write FStudentsCount;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property CourseName: WideString read FCourseName write FCourseName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property SpecProfessionClassifierCode1: WideString read FSpecProfessionClassifierCode1 write FSpecProfessionClassifierCode1;
    property SpecProfessionName1: WideString read FSpecProfessionName1 write FSpecProfessionName1;
    property SpecProfessionClassifierCode2: WideString read FSpecProfessionClassifierCode2 write FSpecProfessionClassifierCode2;
    property SpecProfessionName2: WideString read FSpecProfessionName2 write FSpecProfessionName2;
    property SpecProfessionClassifierCode3: WideString read FSpecProfessionClassifierCode3 write FSpecProfessionClassifierCode3;
    property SpecProfessionName3: WideString read FSpecProfessionName3 write FSpecProfessionName3;
    property SpecProfessionClassifierCode4: WideString read FSpecProfessionClassifierCode4 write FSpecProfessionClassifierCode4;
    property SpecProfessionName4: WideString read FSpecProfessionName4 write FSpecProfessionName4;
    property SpecProfessionClassifierCode5: WideString read FSpecProfessionClassifierCode5 write FSpecProfessionClassifierCode5;
    property SpecProfessionName5: WideString read FSpecProfessionName5 write FSpecProfessionName5;
    property SpecProfessionCode1: WideString read FSpecProfessionCode1 write FSpecProfessionCode1;
    property SpecProfessionCode2: WideString read FSpecProfessionCode2 write FSpecProfessionCode2;
    property SpecProfessionCode3: WideString read FSpecProfessionCode3 write FSpecProfessionCode3;
    property SpecProfessionCode4: WideString read FSpecProfessionCode4 write FSpecProfessionCode4;
    property SpecProfessionCode5: WideString read FSpecProfessionCode5 write FSpecProfessionCode5;
    property SpecComplexName: WideString read FSpecComplexName write FSpecComplexName;
    property SpecProfession1_MaxRang: WideString read FSpecProfession1_MaxRang write FSpecProfession1_MaxRang;
    property SpecProfession2_MaxRang: WideString read FSpecProfession2_MaxRang write FSpecProfession2_MaxRang;
    property SpecProfession3_MaxRang: WideString read FSpecProfession3_MaxRang write FSpecProfession3_MaxRang;
    property SpecProfession4_MaxRang: WideString read FSpecProfession4_MaxRang write FSpecProfession4_MaxRang;
    property SpecProfession5_MaxRang: WideString read FSpecProfession5_MaxRang write FSpecProfession5_MaxRang;
  end;

  ArrayOfDPersonsStudentsGrups2 = array of dPersonsStudentsGrups2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonSOAPPhoto = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonPhoto: Integer;
    FPersonPhotoDateLastChange: TXSDateTime;
    FPersonPhotoIsActive: Integer;
    FPersonCodeU: WideString;
    FPersonPhotoBase64String: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonPhoto: Integer read FId_PersonPhoto write FId_PersonPhoto;
    property PersonPhotoDateLastChange: TXSDateTime read FPersonPhotoDateLastChange write FPersonPhotoDateLastChange;
    property PersonPhotoIsActive: Integer read FPersonPhotoIsActive write FPersonPhotoIsActive;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property PersonPhotoBase64String: WideString read FPersonPhotoBase64String write FPersonPhotoBase64String;
  end;

  ArrayOfDPersonSOAPPhoto = array of dPersonSOAPPhoto;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryTypes = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryTypeName: WideString;
    FPersonEducationHistoryTypeDescription: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property PersonEducationHistoryTypeDescription: WideString read FPersonEducationHistoryTypeDescription write FPersonEducationHistoryTypeDescription;
  end;

  ArrayOfDPersonEducationHistoryTypes = array of dPersonEducationHistoryTypes;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryOrdersStatuses = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistoryOrderStatus: Integer;
    FPersonEducationHistoryOrderStatusName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistoryOrderStatus: Integer read FId_PersonEducationHistoryOrderStatus write FId_PersonEducationHistoryOrderStatus;
    property PersonEducationHistoryOrderStatusName: WideString read FPersonEducationHistoryOrderStatusName write FPersonEducationHistoryOrderStatusName;
  end;

  ArrayOfDPersonEducationHistoryOrdersStatuses = array of dPersonEducationHistoryOrdersStatuses;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryOrders = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FPersonEducationHistoryOrdersDateLastChange: TXSDateTime;
    FUniversityKode: WideString;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryTypeName: WideString;
    FPersonEducationHistoryTypeDescription: WideString;
    FId_PersonEducationHistoryOrderStatus: Integer;
    FPersonEducationHistoryOrderStatusName: WideString;
    FId_RegulationDocument: Integer;
    FIsVerified: Integer;
    FId_RegulationDocumentVerificationHistoryType: Integer;
    FRegulationDocumentVerificationHistoryTypeName: WideString;
    FIsExistFile: Integer;
    FStudCount: Integer;
    FAcademicYearName: WideString;
    FFacultetsNames: WideString;
    FOperatorFIO: WideString;
    FId_AcademicYear: Integer;
    FId_User: Integer;
    FRegulationDocumentVerificationHistoryDateLastChange: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property PersonEducationHistoryOrdersDateLastChange: TXSDateTime read FPersonEducationHistoryOrdersDateLastChange write FPersonEducationHistoryOrdersDateLastChange;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property PersonEducationHistoryTypeDescription: WideString read FPersonEducationHistoryTypeDescription write FPersonEducationHistoryTypeDescription;
    property Id_PersonEducationHistoryOrderStatus: Integer read FId_PersonEducationHistoryOrderStatus write FId_PersonEducationHistoryOrderStatus;
    property PersonEducationHistoryOrderStatusName: WideString read FPersonEducationHistoryOrderStatusName write FPersonEducationHistoryOrderStatusName;
    property Id_RegulationDocument: Integer read FId_RegulationDocument write FId_RegulationDocument;
    property IsVerified: Integer read FIsVerified write FIsVerified;
    property Id_RegulationDocumentVerificationHistoryType: Integer read FId_RegulationDocumentVerificationHistoryType write FId_RegulationDocumentVerificationHistoryType;
    property RegulationDocumentVerificationHistoryTypeName: WideString read FRegulationDocumentVerificationHistoryTypeName write FRegulationDocumentVerificationHistoryTypeName;
    property IsExistFile: Integer read FIsExistFile write FIsExistFile;
    property StudCount: Integer read FStudCount write FStudCount;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property FacultetsNames: WideString read FFacultetsNames write FFacultetsNames;
    property OperatorFIO: WideString read FOperatorFIO write FOperatorFIO;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_User: Integer read FId_User write FId_User;
    property RegulationDocumentVerificationHistoryDateLastChange: TXSDateTime read FRegulationDocumentVerificationHistoryDateLastChange write FRegulationDocumentVerificationHistoryDateLastChange;
  end;

  ArrayOfDPersonEducationHistoryOrders = array of dPersonEducationHistoryOrders;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryOrders2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FPersonEducationHistoryOrdersDateLastChange: TXSDateTime;
    FUniversityKode: WideString;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryTypeName: WideString;
    FPersonEducationHistoryTypeDescription: WideString;
    FId_PersonEducationHistoryOrderStatus: Integer;
    FPersonEducationHistoryOrderStatusName: WideString;
    FId_RegulationDocument: Integer;
    FIsVerified: Integer;
    FId_RegulationDocumentVerificationHistoryType: Integer;
    FRegulationDocumentVerificationHistoryTypeName: WideString;
    FIsExistFile: Integer;
    FStudCount: Integer;
    FAcademicYearName: WideString;
    FFacultetsNames: WideString;
    FOperatorFIO: WideString;
    FId_AcademicYear: Integer;
    FId_User: Integer;
    FRegulationDocumentVerificationHistoryDateLastChange: TXSDateTime;
    FPersonFIOType: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property PersonEducationHistoryOrdersDateLastChange: TXSDateTime read FPersonEducationHistoryOrdersDateLastChange write FPersonEducationHistoryOrdersDateLastChange;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property PersonEducationHistoryTypeDescription: WideString read FPersonEducationHistoryTypeDescription write FPersonEducationHistoryTypeDescription;
    property Id_PersonEducationHistoryOrderStatus: Integer read FId_PersonEducationHistoryOrderStatus write FId_PersonEducationHistoryOrderStatus;
    property PersonEducationHistoryOrderStatusName: WideString read FPersonEducationHistoryOrderStatusName write FPersonEducationHistoryOrderStatusName;
    property Id_RegulationDocument: Integer read FId_RegulationDocument write FId_RegulationDocument;
    property IsVerified: Integer read FIsVerified write FIsVerified;
    property Id_RegulationDocumentVerificationHistoryType: Integer read FId_RegulationDocumentVerificationHistoryType write FId_RegulationDocumentVerificationHistoryType;
    property RegulationDocumentVerificationHistoryTypeName: WideString read FRegulationDocumentVerificationHistoryTypeName write FRegulationDocumentVerificationHistoryTypeName;
    property IsExistFile: Integer read FIsExistFile write FIsExistFile;
    property StudCount: Integer read FStudCount write FStudCount;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property FacultetsNames: WideString read FFacultetsNames write FFacultetsNames;
    property OperatorFIO: WideString read FOperatorFIO write FOperatorFIO;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_User: Integer read FId_User write FId_User;
    property RegulationDocumentVerificationHistoryDateLastChange: TXSDateTime read FRegulationDocumentVerificationHistoryDateLastChange write FRegulationDocumentVerificationHistoryDateLastChange;
    property PersonFIOType: Integer read FPersonFIOType write FPersonFIOType;
  end;

  ArrayOfDPersonEducationHistoryOrders2 = array of dPersonEducationHistoryOrders2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonDocumentTypes = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonDocumentType: Integer;
    FId_PersonDocumentTypeNames: Integer;
    FPersonDocumentTypeName: WideString;
    FId_Language: Integer;
    FIsEntrantDocument: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property Id_PersonDocumentTypeNames: Integer read FId_PersonDocumentTypeNames write FId_PersonDocumentTypeNames;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property IsEntrantDocument: Integer read FIsEntrantDocument write FIsEntrantDocument;
  end;

  ArrayOfDPersonDocumentTypes = array of dPersonDocumentTypes;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonDocuments = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonDocument: Integer;
    FId_Person: Integer;
    FId_PersonDocumentType: Integer;
    FId_PersonEducation: Integer;
    FInstitutionCode: WideString;
    FInstitutionName: WideString;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FId_PersonEducationForm: Integer;
    FId_PersonEducationFormName: Integer;
    FPersonEducationFormName: WideString;
    FId_PersonEducationType: Integer;
    FId_PersonEducationTypeName: Integer;
    FPersonEducationTypeName: WideString;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FDocumentExpiredDate: TXSDateTime;
    FDocumentIssued: WideString;
    FDescription: WideString;
    FPersonDocumentBegin: TXSDateTime;
    FPersonDocumentEnd: TXSDateTime;
    FZNOBall: Single;
    FPersonDocumentTypeName: WideString;
    FId_Language: Integer;
    FAtestatValue: TXSDecimal;
    FZNOPin: Integer;
    FPersonCodeU: WideString;
    FIsCheckForPaperCopy: Integer;
    FIsForeinghEntrantDocumet: Integer;
    FIsNotCheckAttestat: Integer;
    FIsEntrantDocument: Integer;
    FId_PersonDocumentsAwardType: Integer;
    FPersonDocumentsAwardTypeName: WideString;
    FCancellad: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property Id_Person: Integer read FId_Person write FId_Person;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property InstitutionCode: WideString read FInstitutionCode write FInstitutionCode;
    property InstitutionName: WideString read FInstitutionName write FInstitutionName;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_PersonEducationFormName: Integer read FId_PersonEducationFormName write FId_PersonEducationFormName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property Id_PersonEducationType: Integer read FId_PersonEducationType write FId_PersonEducationType;
    property Id_PersonEducationTypeName: Integer read FId_PersonEducationTypeName write FId_PersonEducationTypeName;
    property PersonEducationTypeName: WideString read FPersonEducationTypeName write FPersonEducationTypeName;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property DocumentExpiredDate: TXSDateTime read FDocumentExpiredDate write FDocumentExpiredDate;
    property DocumentIssued: WideString read FDocumentIssued write FDocumentIssued;
    property Description: WideString read FDescription write FDescription;
    property PersonDocumentBegin: TXSDateTime read FPersonDocumentBegin write FPersonDocumentBegin;
    property PersonDocumentEnd: TXSDateTime read FPersonDocumentEnd write FPersonDocumentEnd;
    property ZNOBall: Single read FZNOBall write FZNOBall;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property AtestatValue: TXSDecimal read FAtestatValue write FAtestatValue;
    property ZNOPin: Integer read FZNOPin write FZNOPin;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property IsCheckForPaperCopy: Integer read FIsCheckForPaperCopy write FIsCheckForPaperCopy;
    property IsForeinghEntrantDocumet: Integer read FIsForeinghEntrantDocumet write FIsForeinghEntrantDocumet;
    property IsNotCheckAttestat: Integer read FIsNotCheckAttestat write FIsNotCheckAttestat;
    property IsEntrantDocument: Integer read FIsEntrantDocument write FIsEntrantDocument;
    property Id_PersonDocumentsAwardType: Integer read FId_PersonDocumentsAwardType write FId_PersonDocumentsAwardType;
    property PersonDocumentsAwardTypeName: WideString read FPersonDocumentsAwardTypeName write FPersonDocumentsAwardTypeName;
    property Cancellad: Integer read FCancellad write FCancellad;
  end;

  ArrayOfDPersonDocuments = array of dPersonDocuments;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonDocuments2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonDocument: Integer;
    FId_Person: Integer;
    FId_PersonDocumentType: Integer;
    FId_PersonEducation: Integer;
    FInstitutionCode: WideString;
    FInstitutionName: WideString;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FId_PersonEducationForm: Integer;
    FId_PersonEducationFormName: Integer;
    FPersonEducationFormName: WideString;
    FId_PersonEducationType: Integer;
    FId_PersonEducationTypeName: Integer;
    FPersonEducationTypeName: WideString;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FDocumentExpiredDate: TXSDateTime;
    FDocumentIssued: WideString;
    FDescription: WideString;
    FPersonDocumentBegin: TXSDateTime;
    FPersonDocumentEnd: TXSDateTime;
    FZNOBall: Single;
    FPersonDocumentTypeName: WideString;
    FId_Language: Integer;
    FAtestatValue: TXSDecimal;
    FZNOPin: Integer;
    FPersonCodeU: WideString;
    FIsCheckForPaperCopy: Integer;
    FIsForeinghEntrantDocumet: Integer;
    FIsNotCheckAttestat: Integer;
    FIsEntrantDocument: Integer;
    FId_PersonDocumentsAwardType: Integer;
    FPersonDocumentsAwardTypeName: WideString;
    FCancellad: Integer;
    FSpecNameFull: WideString;
    FSpecDirectionsCode: WideString;
    FSpecSpecialityCode: WideString;
    FSpecScecializationCode: WideString;
    FId_Qualification: Integer;
    FId_QualificationGroup: Integer;
    FId_University: Integer;
    FUniversityFullName: WideString;
    FCanselInfo: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property Id_Person: Integer read FId_Person write FId_Person;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property InstitutionCode: WideString read FInstitutionCode write FInstitutionCode;
    property InstitutionName: WideString read FInstitutionName write FInstitutionName;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_PersonEducationFormName: Integer read FId_PersonEducationFormName write FId_PersonEducationFormName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property Id_PersonEducationType: Integer read FId_PersonEducationType write FId_PersonEducationType;
    property Id_PersonEducationTypeName: Integer read FId_PersonEducationTypeName write FId_PersonEducationTypeName;
    property PersonEducationTypeName: WideString read FPersonEducationTypeName write FPersonEducationTypeName;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property DocumentExpiredDate: TXSDateTime read FDocumentExpiredDate write FDocumentExpiredDate;
    property DocumentIssued: WideString read FDocumentIssued write FDocumentIssued;
    property Description: WideString read FDescription write FDescription;
    property PersonDocumentBegin: TXSDateTime read FPersonDocumentBegin write FPersonDocumentBegin;
    property PersonDocumentEnd: TXSDateTime read FPersonDocumentEnd write FPersonDocumentEnd;
    property ZNOBall: Single read FZNOBall write FZNOBall;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_Language: Integer read FId_Language write FId_Language;
    property AtestatValue: TXSDecimal read FAtestatValue write FAtestatValue;
    property ZNOPin: Integer read FZNOPin write FZNOPin;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property IsCheckForPaperCopy: Integer read FIsCheckForPaperCopy write FIsCheckForPaperCopy;
    property IsForeinghEntrantDocumet: Integer read FIsForeinghEntrantDocumet write FIsForeinghEntrantDocumet;
    property IsNotCheckAttestat: Integer read FIsNotCheckAttestat write FIsNotCheckAttestat;
    property IsEntrantDocument: Integer read FIsEntrantDocument write FIsEntrantDocument;
    property Id_PersonDocumentsAwardType: Integer read FId_PersonDocumentsAwardType write FId_PersonDocumentsAwardType;
    property PersonDocumentsAwardTypeName: WideString read FPersonDocumentsAwardTypeName write FPersonDocumentsAwardTypeName;
    property Cancellad: Integer read FCancellad write FCancellad;
    property SpecNameFull: WideString read FSpecNameFull write FSpecNameFull;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecScecializationCode: WideString read FSpecScecializationCode write FSpecScecializationCode;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property Id_University: Integer read FId_University write FId_University;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property CanselInfo: WideString read FCanselInfo write FCanselInfo;
  end;

  ArrayOfDPersonDocuments2 = array of dPersonDocuments2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducations = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducation: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FId_PersonEducationType: Integer;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FInstitutionCode: WideString;
    FId_University: Integer;
    FUniversityFullName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FQualificationName: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FSpecClasifierCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FPersonCodeU: WideString;
    FCourseName: WideString;
    FAcademicYearName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FUniversityGroupFullName: WideString;
    FPersonEducationPaymentTypeName: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FIsRefill: Integer;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FId_PersonEducationPaymentType: Integer;
    FId_PersonEducationHistoryType: Integer;
    FId_AcademicYear: Integer;
    FId_Course: Integer;
    FId_Qualification: Integer;
    FId_QualificationGroup: Integer;
    FId_UniversityGroup: Integer;
    FSpecCode: WideString;
    FIsSecondHigher: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property Id_PersonEducationType: Integer read FId_PersonEducationType write FId_PersonEducationType;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property InstitutionCode: WideString read FInstitutionCode write FInstitutionCode;
    property Id_University: Integer read FId_University write FId_University;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property CourseName: WideString read FCourseName write FCourseName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property IsSecondHigher: Integer read FIsSecondHigher write FIsSecondHigher;
  end;

  ArrayOfDPersonEducations = array of dPersonEducations;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducations2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducation: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FId_PersonEducationType: Integer;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FInstitutionCode: WideString;
    FId_University: Integer;
    FUniversityFullName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FQualificationName: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FSpecClasifierCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FPersonCodeU: WideString;
    FCourseName: WideString;
    FAcademicYearName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FUniversityGroupFullName: WideString;
    FPersonEducationPaymentTypeName: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FIsRefill: Integer;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FId_PersonEducationPaymentType: Integer;
    FId_PersonEducationHistoryType: Integer;
    FId_AcademicYear: Integer;
    FId_Course: Integer;
    FId_Qualification: Integer;
    FId_QualificationGroup: Integer;
    FId_UniversityGroup: Integer;
    FSpecCode: WideString;
    FIsSecondHigher: Integer;
    FSpecProfessionClassifierCode1: WideString;
    FSpecProfessionName1: WideString;
    FSpecProfessionClassifierCode2: WideString;
    FSpecProfessionName2: WideString;
    FSpecProfessionClassifierCode3: WideString;
    FSpecProfessionName3: WideString;
    FSpecProfessionClassifierCode4: WideString;
    FSpecProfessionName4: WideString;
    FSpecProfessionClassifierCode5: WideString;
    FSpecProfessionName5: WideString;
    FSpecProfession1_MaxRang: WideString;
    FSpecProfession2_MaxRang: WideString;
    FSpecProfession3_MaxRang: WideString;
    FSpecProfession4_MaxRang: WideString;
    FSpecProfession5_MaxRang: WideString;
    FSpecProfession1_CurRang: WideString;
    FSpecProfession2_CurRang: WideString;
    FSpecProfession3_CurRang: WideString;
    FSpecProfession4_CurRang: WideString;
    FSpecProfession5_CurRang: WideString;
    FId_SpecProfessions1RangType: Integer;
    FId_SpecProfessions2RangType: Integer;
    FId_SpecProfessions3RangType: Integer;
    FId_SpecProfessions4RangType: Integer;
    FId_SpecProfessions5RangType: Integer;
    FSpecProfessionsRangTypeName1: WideString;
    FSpecProfessionsRangTypeName2: WideString;
    FSpecProfessionsRangTypeName3: WideString;
    FSpecProfessionsRangTypeName4: WideString;
    FSpecProfessionsRangTypeName5: WideString;
    FIsAfterDiplomEducation: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property Id_PersonEducationType: Integer read FId_PersonEducationType write FId_PersonEducationType;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property InstitutionCode: WideString read FInstitutionCode write FInstitutionCode;
    property Id_University: Integer read FId_University write FId_University;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property CourseName: WideString read FCourseName write FCourseName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property IsSecondHigher: Integer read FIsSecondHigher write FIsSecondHigher;
    property SpecProfessionClassifierCode1: WideString read FSpecProfessionClassifierCode1 write FSpecProfessionClassifierCode1;
    property SpecProfessionName1: WideString read FSpecProfessionName1 write FSpecProfessionName1;
    property SpecProfessionClassifierCode2: WideString read FSpecProfessionClassifierCode2 write FSpecProfessionClassifierCode2;
    property SpecProfessionName2: WideString read FSpecProfessionName2 write FSpecProfessionName2;
    property SpecProfessionClassifierCode3: WideString read FSpecProfessionClassifierCode3 write FSpecProfessionClassifierCode3;
    property SpecProfessionName3: WideString read FSpecProfessionName3 write FSpecProfessionName3;
    property SpecProfessionClassifierCode4: WideString read FSpecProfessionClassifierCode4 write FSpecProfessionClassifierCode4;
    property SpecProfessionName4: WideString read FSpecProfessionName4 write FSpecProfessionName4;
    property SpecProfessionClassifierCode5: WideString read FSpecProfessionClassifierCode5 write FSpecProfessionClassifierCode5;
    property SpecProfessionName5: WideString read FSpecProfessionName5 write FSpecProfessionName5;
    property SpecProfession1_MaxRang: WideString read FSpecProfession1_MaxRang write FSpecProfession1_MaxRang;
    property SpecProfession2_MaxRang: WideString read FSpecProfession2_MaxRang write FSpecProfession2_MaxRang;
    property SpecProfession3_MaxRang: WideString read FSpecProfession3_MaxRang write FSpecProfession3_MaxRang;
    property SpecProfession4_MaxRang: WideString read FSpecProfession4_MaxRang write FSpecProfession4_MaxRang;
    property SpecProfession5_MaxRang: WideString read FSpecProfession5_MaxRang write FSpecProfession5_MaxRang;
    property SpecProfession1_CurRang: WideString read FSpecProfession1_CurRang write FSpecProfession1_CurRang;
    property SpecProfession2_CurRang: WideString read FSpecProfession2_CurRang write FSpecProfession2_CurRang;
    property SpecProfession3_CurRang: WideString read FSpecProfession3_CurRang write FSpecProfession3_CurRang;
    property SpecProfession4_CurRang: WideString read FSpecProfession4_CurRang write FSpecProfession4_CurRang;
    property SpecProfession5_CurRang: WideString read FSpecProfession5_CurRang write FSpecProfession5_CurRang;
    property Id_SpecProfessions1RangType: Integer read FId_SpecProfessions1RangType write FId_SpecProfessions1RangType;
    property Id_SpecProfessions2RangType: Integer read FId_SpecProfessions2RangType write FId_SpecProfessions2RangType;
    property Id_SpecProfessions3RangType: Integer read FId_SpecProfessions3RangType write FId_SpecProfessions3RangType;
    property Id_SpecProfessions4RangType: Integer read FId_SpecProfessions4RangType write FId_SpecProfessions4RangType;
    property Id_SpecProfessions5RangType: Integer read FId_SpecProfessions5RangType write FId_SpecProfessions5RangType;
    property SpecProfessionsRangTypeName1: WideString read FSpecProfessionsRangTypeName1 write FSpecProfessionsRangTypeName1;
    property SpecProfessionsRangTypeName2: WideString read FSpecProfessionsRangTypeName2 write FSpecProfessionsRangTypeName2;
    property SpecProfessionsRangTypeName3: WideString read FSpecProfessionsRangTypeName3 write FSpecProfessionsRangTypeName3;
    property SpecProfessionsRangTypeName4: WideString read FSpecProfessionsRangTypeName4 write FSpecProfessionsRangTypeName4;
    property SpecProfessionsRangTypeName5: WideString read FSpecProfessionsRangTypeName5 write FSpecProfessionsRangTypeName5;
    property IsAfterDiplomEducation: Integer read FIsAfterDiplomEducation write FIsAfterDiplomEducation;
  end;

  ArrayOfDPersonEducations2 = array of dPersonEducations2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryOrdersData = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FId_Person: Integer;
    FFIO: WideString;
    FBirthday: TXSDateTime;
    FPersonCodeU: WideString;
    FId_PersonEducation: Integer;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FResident: Integer;
    FIsRefill: Integer;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryDesciption: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FUniversityGroupCode: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FPersonEducationFormName: WideString;
    FAcademicYearName: WideString;
    FQualificationName: WideString;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FCourseName: WideString;
    FSpecIndastryCode: WideString;
    FSpecIndastryClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecSpecializationCode: WideString;
    FSpecSpecializationName: WideString;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FId_AcademicLeaveType: Integer;
    FAcademicLeaveTypeName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Person: Integer read FId_Person write FId_Person;
    property FIO: WideString read FFIO write FFIO;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property Resident: Integer read FResident write FResident;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryDesciption: WideString read FPersonEducationHistoryDesciption write FPersonEducationHistoryDesciption;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property UniversityGroupCode: WideString read FUniversityGroupCode write FUniversityGroupCode;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property CourseName: WideString read FCourseName write FCourseName;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property Id_AcademicLeaveType: Integer read FId_AcademicLeaveType write FId_AcademicLeaveType;
    property AcademicLeaveTypeName: WideString read FAcademicLeaveTypeName write FAcademicLeaveTypeName;
  end;

  ArrayOfDPersonEducationHistoryOrdersData = array of dPersonEducationHistoryOrdersData;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryOrdersData2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FId_Person: Integer;
    FFIO: WideString;
    FBirthday: TXSDateTime;
    FPersonCodeU: WideString;
    FId_PersonEducation: Integer;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FResident: Integer;
    FIsRefill: Integer;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryDesciption: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FUniversityGroupCode: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FPersonEducationFormName: WideString;
    FAcademicYearName: WideString;
    FQualificationName: WideString;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FCourseName: WideString;
    FSpecIndastryCode: WideString;
    FSpecIndastryClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecSpecializationCode: WideString;
    FSpecSpecializationName: WideString;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FId_AcademicLeaveType: Integer;
    FAcademicLeaveTypeName: WideString;
    FPersonEducationDateBegin: TXSDateTime;
    FSpecProfessionClassifierCode1: WideString;
    FSpecProfessionName1: WideString;
    FSpecProfessionClassifierCode2: WideString;
    FSpecProfessionName2: WideString;
    FSpecProfessionClassifierCode3: WideString;
    FSpecProfessionName3: WideString;
    FSpecProfessionClassifierCode4: WideString;
    FSpecProfessionName4: WideString;
    FSpecProfessionClassifierCode5: WideString;
    FSpecProfessionName5: WideString;
    FSpecProfessionCode1: WideString;
    FSpecProfessionCode2: WideString;
    FSpecProfessionCode3: WideString;
    FSpecProfessionCode4: WideString;
    FSpecProfessionCode5: WideString;
    FSpecComplexName: WideString;
    FSpecProfession1_MaxRang: WideString;
    FSpecProfession2_MaxRang: WideString;
    FSpecProfession3_MaxRang: WideString;
    FSpecProfession4_MaxRang: WideString;
    FSpecProfession5_MaxRang: WideString;
    FSpecProfession1_CurRang: WideString;
    FSpecProfession2_CurRang: WideString;
    FSpecProfession3_CurRang: WideString;
    FSpecProfession4_CurRang: WideString;
    FSpecProfession5_CurRang: WideString;
    FId_SpecProfessions1RangType: Integer;
    FId_SpecProfessions2RangType: Integer;
    FId_SpecProfessions3RangType: Integer;
    FId_SpecProfessions4RangType: Integer;
    FId_SpecProfessions5RangType: Integer;
    FSpecProfessionsRangTypeName1: WideString;
    FSpecProfessionsRangTypeName2: WideString;
    FSpecProfessionsRangTypeName3: WideString;
    FSpecProfessionsRangTypeName4: WideString;
    FSpecProfessionsRangTypeName5: WideString;
    FId_PersonEducationFrom: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Person: Integer read FId_Person write FId_Person;
    property FIO: WideString read FFIO write FFIO;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property Resident: Integer read FResident write FResident;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryDesciption: WideString read FPersonEducationHistoryDesciption write FPersonEducationHistoryDesciption;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property UniversityGroupCode: WideString read FUniversityGroupCode write FUniversityGroupCode;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property CourseName: WideString read FCourseName write FCourseName;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property Id_AcademicLeaveType: Integer read FId_AcademicLeaveType write FId_AcademicLeaveType;
    property AcademicLeaveTypeName: WideString read FAcademicLeaveTypeName write FAcademicLeaveTypeName;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property SpecProfessionClassifierCode1: WideString read FSpecProfessionClassifierCode1 write FSpecProfessionClassifierCode1;
    property SpecProfessionName1: WideString read FSpecProfessionName1 write FSpecProfessionName1;
    property SpecProfessionClassifierCode2: WideString read FSpecProfessionClassifierCode2 write FSpecProfessionClassifierCode2;
    property SpecProfessionName2: WideString read FSpecProfessionName2 write FSpecProfessionName2;
    property SpecProfessionClassifierCode3: WideString read FSpecProfessionClassifierCode3 write FSpecProfessionClassifierCode3;
    property SpecProfessionName3: WideString read FSpecProfessionName3 write FSpecProfessionName3;
    property SpecProfessionClassifierCode4: WideString read FSpecProfessionClassifierCode4 write FSpecProfessionClassifierCode4;
    property SpecProfessionName4: WideString read FSpecProfessionName4 write FSpecProfessionName4;
    property SpecProfessionClassifierCode5: WideString read FSpecProfessionClassifierCode5 write FSpecProfessionClassifierCode5;
    property SpecProfessionName5: WideString read FSpecProfessionName5 write FSpecProfessionName5;
    property SpecProfessionCode1: WideString read FSpecProfessionCode1 write FSpecProfessionCode1;
    property SpecProfessionCode2: WideString read FSpecProfessionCode2 write FSpecProfessionCode2;
    property SpecProfessionCode3: WideString read FSpecProfessionCode3 write FSpecProfessionCode3;
    property SpecProfessionCode4: WideString read FSpecProfessionCode4 write FSpecProfessionCode4;
    property SpecProfessionCode5: WideString read FSpecProfessionCode5 write FSpecProfessionCode5;
    property SpecComplexName: WideString read FSpecComplexName write FSpecComplexName;
    property SpecProfession1_MaxRang: WideString read FSpecProfession1_MaxRang write FSpecProfession1_MaxRang;
    property SpecProfession2_MaxRang: WideString read FSpecProfession2_MaxRang write FSpecProfession2_MaxRang;
    property SpecProfession3_MaxRang: WideString read FSpecProfession3_MaxRang write FSpecProfession3_MaxRang;
    property SpecProfession4_MaxRang: WideString read FSpecProfession4_MaxRang write FSpecProfession4_MaxRang;
    property SpecProfession5_MaxRang: WideString read FSpecProfession5_MaxRang write FSpecProfession5_MaxRang;
    property SpecProfession1_CurRang: WideString read FSpecProfession1_CurRang write FSpecProfession1_CurRang;
    property SpecProfession2_CurRang: WideString read FSpecProfession2_CurRang write FSpecProfession2_CurRang;
    property SpecProfession3_CurRang: WideString read FSpecProfession3_CurRang write FSpecProfession3_CurRang;
    property SpecProfession4_CurRang: WideString read FSpecProfession4_CurRang write FSpecProfession4_CurRang;
    property SpecProfession5_CurRang: WideString read FSpecProfession5_CurRang write FSpecProfession5_CurRang;
    property Id_SpecProfessions1RangType: Integer read FId_SpecProfessions1RangType write FId_SpecProfessions1RangType;
    property Id_SpecProfessions2RangType: Integer read FId_SpecProfessions2RangType write FId_SpecProfessions2RangType;
    property Id_SpecProfessions3RangType: Integer read FId_SpecProfessions3RangType write FId_SpecProfessions3RangType;
    property Id_SpecProfessions4RangType: Integer read FId_SpecProfessions4RangType write FId_SpecProfessions4RangType;
    property Id_SpecProfessions5RangType: Integer read FId_SpecProfessions5RangType write FId_SpecProfessions5RangType;
    property SpecProfessionsRangTypeName1: WideString read FSpecProfessionsRangTypeName1 write FSpecProfessionsRangTypeName1;
    property SpecProfessionsRangTypeName2: WideString read FSpecProfessionsRangTypeName2 write FSpecProfessionsRangTypeName2;
    property SpecProfessionsRangTypeName3: WideString read FSpecProfessionsRangTypeName3 write FSpecProfessionsRangTypeName3;
    property SpecProfessionsRangTypeName4: WideString read FSpecProfessionsRangTypeName4 write FSpecProfessionsRangTypeName4;
    property SpecProfessionsRangTypeName5: WideString read FSpecProfessionsRangTypeName5 write FSpecProfessionsRangTypeName5;
    property Id_PersonEducationFrom: Integer read FId_PersonEducationFrom write FId_PersonEducationFrom;
  end;

  ArrayOfDPersonEducationHistoryOrdersData2 = array of dPersonEducationHistoryOrdersData2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistoryOrdersChangeFIOData = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistoryOrdersAdditionalData: Integer;
    FId_PersonEducationHistoryOrders: Integer;
    FFirstName: WideString;
    FMiddleName: WideString;
    FLastName: WideString;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FDocumentIssued: WideString;
    FDocumentDescription: WideString;
    FFIODateChange: TXSDateTime;
    FPersonCodeU: WideString;
    FCurrentFIO: WideString;
    FExistInEDBO: Integer;
    FId_PersonDocumentType: Integer;
    FPersonFIOType: Integer;
    FFIOSkeepCreateDocuments: Integer;
    FLastNameEn: WideString;
    FFirstNameEn: WideString;
    FMiddleNameEn: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistoryOrdersAdditionalData: Integer read FId_PersonEducationHistoryOrdersAdditionalData write FId_PersonEducationHistoryOrdersAdditionalData;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property FirstName: WideString read FFirstName write FFirstName;
    property MiddleName: WideString read FMiddleName write FMiddleName;
    property LastName: WideString read FLastName write FLastName;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property DocumentIssued: WideString read FDocumentIssued write FDocumentIssued;
    property DocumentDescription: WideString read FDocumentDescription write FDocumentDescription;
    property FIODateChange: TXSDateTime read FFIODateChange write FFIODateChange;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property CurrentFIO: WideString read FCurrentFIO write FCurrentFIO;
    property ExistInEDBO: Integer read FExistInEDBO write FExistInEDBO;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonFIOType: Integer read FPersonFIOType write FPersonFIOType;
    property FIOSkeepCreateDocuments: Integer read FFIOSkeepCreateDocuments write FFIOSkeepCreateDocuments;
    property LastNameEn: WideString read FLastNameEn write FLastNameEn;
    property FirstNameEn: WideString read FFirstNameEn write FFirstNameEn;
    property MiddleNameEn: WideString read FMiddleNameEn write FMiddleNameEn;
  end;

  ArrayOfDPersonEducationHistoryOrdersChangeFIOData = array of dPersonEducationHistoryOrdersChangeFIOData;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistory = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationHistoryType: Integer;
    FId_PersonEducation: Integer;
    FId_PersonEducationPaymentType: Integer;
    FId_UniversityGroup: Integer;
    FDateLastChange: TXSDateTime;
    FIsActive: Integer;
    FPersonEducationHistoryDesciption: WideString;
    FUniversityGroupCode: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FUniversityGroupDescription: WideString;
    FId_AcademicYear: Integer;
    FId_Course: Integer;
    FId_PersonEducationForm: Integer;
    FUniversityFacultetKode: WideString;
    FSpecCode: WideString;
    FUniversityKode: WideString;
    FId_Qualification: Integer;
    FAcademicYearName: WideString;
    FCourseName: WideString;
    FPersonEducationFormName: WideString;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FQualificationName: WideString;
    FPersonEducationPaymentTypeName: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FPersonCodeU: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FPersonEducationHistoryDateEnd: TXSDateTime;
    FId_OrderOfEnrollment: Integer;
    FId_PersonEducationHistoryOrders: Integer;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FIsConfirmed: Integer;
    FId_AcademicLeaveType: Integer;
    FAcademicLeaveTypeName: WideString;
    FUniversityKodeFrom: WideString;
    FId_UniversityFrom: Integer;
    FUniversityFullNameFrom: WideString;
    FUserFIO: WideString;
    FId_PersonEducationHistoryCorrected: Integer;
    FIsCorrected: Integer;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FId_PersonName: Integer;
    FFIO: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property DateLastChange: TXSDateTime read FDateLastChange write FDateLastChange;
    property IsActive: Integer read FIsActive write FIsActive;
    property PersonEducationHistoryDesciption: WideString read FPersonEducationHistoryDesciption write FPersonEducationHistoryDesciption;
    property UniversityGroupCode: WideString read FUniversityGroupCode write FUniversityGroupCode;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property UniversityGroupDescription: WideString read FUniversityGroupDescription write FUniversityGroupDescription;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property CourseName: WideString read FCourseName write FCourseName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property PersonEducationHistoryDateEnd: TXSDateTime read FPersonEducationHistoryDateEnd write FPersonEducationHistoryDateEnd;
    property Id_OrderOfEnrollment: Integer read FId_OrderOfEnrollment write FId_OrderOfEnrollment;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property IsConfirmed: Integer read FIsConfirmed write FIsConfirmed;
    property Id_AcademicLeaveType: Integer read FId_AcademicLeaveType write FId_AcademicLeaveType;
    property AcademicLeaveTypeName: WideString read FAcademicLeaveTypeName write FAcademicLeaveTypeName;
    property UniversityKodeFrom: WideString read FUniversityKodeFrom write FUniversityKodeFrom;
    property Id_UniversityFrom: Integer read FId_UniversityFrom write FId_UniversityFrom;
    property UniversityFullNameFrom: WideString read FUniversityFullNameFrom write FUniversityFullNameFrom;
    property UserFIO: WideString read FUserFIO write FUserFIO;
    property Id_PersonEducationHistoryCorrected: Integer read FId_PersonEducationHistoryCorrected write FId_PersonEducationHistoryCorrected;
    property IsCorrected: Integer read FIsCorrected write FIsCorrected;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property Id_PersonName: Integer read FId_PersonName write FId_PersonName;
    property FIO: WideString read FFIO write FFIO;
  end;

  ArrayOfDPersonEducationHistory = array of dPersonEducationHistory;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationHistory2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationHistoryType: Integer;
    FId_PersonEducation: Integer;
    FId_PersonEducationPaymentType: Integer;
    FId_UniversityGroup: Integer;
    FDateLastChange: TXSDateTime;
    FIsActive: Integer;
    FPersonEducationHistoryDesciption: WideString;
    FUniversityGroupCode: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FUniversityGroupDescription: WideString;
    FId_AcademicYear: Integer;
    FId_Course: Integer;
    FId_PersonEducationForm: Integer;
    FUniversityFacultetKode: WideString;
    FSpecCode: WideString;
    FUniversityKode: WideString;
    FId_Qualification: Integer;
    FAcademicYearName: WideString;
    FCourseName: WideString;
    FPersonEducationFormName: WideString;
    FUniversityFullName: WideString;
    FUniversityShortName: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FQualificationName: WideString;
    FPersonEducationPaymentTypeName: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FPersonCodeU: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FPersonEducationHistoryDateEnd: TXSDateTime;
    FId_OrderOfEnrollment: Integer;
    FId_PersonEducationHistoryOrders: Integer;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FIsConfirmed: Integer;
    FId_AcademicLeaveType: Integer;
    FAcademicLeaveTypeName: WideString;
    FUniversityKodeFrom: WideString;
    FId_UniversityFrom: Integer;
    FUniversityFullNameFrom: WideString;
    FUserFIO: WideString;
    FId_PersonEducationHistoryCorrected: Integer;
    FIsCorrected: Integer;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FId_PersonName: Integer;
    FFIO: WideString;
    FSpecProfessionClassifierCode1: WideString;
    FSpecProfessionName1: WideString;
    FSpecProfessionClassifierCode2: WideString;
    FSpecProfessionName2: WideString;
    FSpecProfessionClassifierCode3: WideString;
    FSpecProfessionName3: WideString;
    FSpecProfessionClassifierCode4: WideString;
    FSpecProfessionName4: WideString;
    FSpecProfessionClassifierCode5: WideString;
    FSpecProfessionName5: WideString;
    FSpecProfession1_MaxRang: WideString;
    FSpecProfession2_MaxRang: WideString;
    FSpecProfession3_MaxRang: WideString;
    FSpecProfession4_MaxRang: WideString;
    FSpecProfession5_MaxRang: WideString;
    FSpecProfession1_CurRang: WideString;
    FSpecProfession2_CurRang: WideString;
    FSpecProfession3_CurRang: WideString;
    FSpecProfession4_CurRang: WideString;
    FSpecProfession5_CurRang: WideString;
    FId_SpecProfessions1RangType: Integer;
    FId_SpecProfessions2RangType: Integer;
    FId_SpecProfessions3RangType: Integer;
    FId_SpecProfessions4RangType: Integer;
    FId_SpecProfessions5RangType: Integer;
    FSpecProfessionsRangTypeName1: WideString;
    FSpecProfessionsRangTypeName2: WideString;
    FSpecProfessionsRangTypeName3: WideString;
    FSpecProfessionsRangTypeName4: WideString;
    FSpecProfessionsRangTypeName5: WideString;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FPersonEducationHistoryTypeNameOrder: WideString;
    FId_PersonEducationHistoryTypeOrder: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property DateLastChange: TXSDateTime read FDateLastChange write FDateLastChange;
    property IsActive: Integer read FIsActive write FIsActive;
    property PersonEducationHistoryDesciption: WideString read FPersonEducationHistoryDesciption write FPersonEducationHistoryDesciption;
    property UniversityGroupCode: WideString read FUniversityGroupCode write FUniversityGroupCode;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property UniversityGroupDescription: WideString read FUniversityGroupDescription write FUniversityGroupDescription;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property UniversityKode: WideString read FUniversityKode write FUniversityKode;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property CourseName: WideString read FCourseName write FCourseName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityShortName: WideString read FUniversityShortName write FUniversityShortName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property PersonEducationHistoryDateEnd: TXSDateTime read FPersonEducationHistoryDateEnd write FPersonEducationHistoryDateEnd;
    property Id_OrderOfEnrollment: Integer read FId_OrderOfEnrollment write FId_OrderOfEnrollment;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property IsConfirmed: Integer read FIsConfirmed write FIsConfirmed;
    property Id_AcademicLeaveType: Integer read FId_AcademicLeaveType write FId_AcademicLeaveType;
    property AcademicLeaveTypeName: WideString read FAcademicLeaveTypeName write FAcademicLeaveTypeName;
    property UniversityKodeFrom: WideString read FUniversityKodeFrom write FUniversityKodeFrom;
    property Id_UniversityFrom: Integer read FId_UniversityFrom write FId_UniversityFrom;
    property UniversityFullNameFrom: WideString read FUniversityFullNameFrom write FUniversityFullNameFrom;
    property UserFIO: WideString read FUserFIO write FUserFIO;
    property Id_PersonEducationHistoryCorrected: Integer read FId_PersonEducationHistoryCorrected write FId_PersonEducationHistoryCorrected;
    property IsCorrected: Integer read FIsCorrected write FIsCorrected;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property Id_PersonName: Integer read FId_PersonName write FId_PersonName;
    property FIO: WideString read FFIO write FFIO;
    property SpecProfessionClassifierCode1: WideString read FSpecProfessionClassifierCode1 write FSpecProfessionClassifierCode1;
    property SpecProfessionName1: WideString read FSpecProfessionName1 write FSpecProfessionName1;
    property SpecProfessionClassifierCode2: WideString read FSpecProfessionClassifierCode2 write FSpecProfessionClassifierCode2;
    property SpecProfessionName2: WideString read FSpecProfessionName2 write FSpecProfessionName2;
    property SpecProfessionClassifierCode3: WideString read FSpecProfessionClassifierCode3 write FSpecProfessionClassifierCode3;
    property SpecProfessionName3: WideString read FSpecProfessionName3 write FSpecProfessionName3;
    property SpecProfessionClassifierCode4: WideString read FSpecProfessionClassifierCode4 write FSpecProfessionClassifierCode4;
    property SpecProfessionName4: WideString read FSpecProfessionName4 write FSpecProfessionName4;
    property SpecProfessionClassifierCode5: WideString read FSpecProfessionClassifierCode5 write FSpecProfessionClassifierCode5;
    property SpecProfessionName5: WideString read FSpecProfessionName5 write FSpecProfessionName5;
    property SpecProfession1_MaxRang: WideString read FSpecProfession1_MaxRang write FSpecProfession1_MaxRang;
    property SpecProfession2_MaxRang: WideString read FSpecProfession2_MaxRang write FSpecProfession2_MaxRang;
    property SpecProfession3_MaxRang: WideString read FSpecProfession3_MaxRang write FSpecProfession3_MaxRang;
    property SpecProfession4_MaxRang: WideString read FSpecProfession4_MaxRang write FSpecProfession4_MaxRang;
    property SpecProfession5_MaxRang: WideString read FSpecProfession5_MaxRang write FSpecProfession5_MaxRang;
    property SpecProfession1_CurRang: WideString read FSpecProfession1_CurRang write FSpecProfession1_CurRang;
    property SpecProfession2_CurRang: WideString read FSpecProfession2_CurRang write FSpecProfession2_CurRang;
    property SpecProfession3_CurRang: WideString read FSpecProfession3_CurRang write FSpecProfession3_CurRang;
    property SpecProfession4_CurRang: WideString read FSpecProfession4_CurRang write FSpecProfession4_CurRang;
    property SpecProfession5_CurRang: WideString read FSpecProfession5_CurRang write FSpecProfession5_CurRang;
    property Id_SpecProfessions1RangType: Integer read FId_SpecProfessions1RangType write FId_SpecProfessions1RangType;
    property Id_SpecProfessions2RangType: Integer read FId_SpecProfessions2RangType write FId_SpecProfessions2RangType;
    property Id_SpecProfessions3RangType: Integer read FId_SpecProfessions3RangType write FId_SpecProfessions3RangType;
    property Id_SpecProfessions4RangType: Integer read FId_SpecProfessions4RangType write FId_SpecProfessions4RangType;
    property Id_SpecProfessions5RangType: Integer read FId_SpecProfessions5RangType write FId_SpecProfessions5RangType;
    property SpecProfessionsRangTypeName1: WideString read FSpecProfessionsRangTypeName1 write FSpecProfessionsRangTypeName1;
    property SpecProfessionsRangTypeName2: WideString read FSpecProfessionsRangTypeName2 write FSpecProfessionsRangTypeName2;
    property SpecProfessionsRangTypeName3: WideString read FSpecProfessionsRangTypeName3 write FSpecProfessionsRangTypeName3;
    property SpecProfessionsRangTypeName4: WideString read FSpecProfessionsRangTypeName4 write FSpecProfessionsRangTypeName4;
    property SpecProfessionsRangTypeName5: WideString read FSpecProfessionsRangTypeName5 write FSpecProfessionsRangTypeName5;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property PersonEducationHistoryTypeNameOrder: WideString read FPersonEducationHistoryTypeNameOrder write FPersonEducationHistoryTypeNameOrder;
    property Id_PersonEducationHistoryTypeOrder: Integer read FId_PersonEducationHistoryTypeOrder write FId_PersonEducationHistoryTypeOrder;
  end;

  ArrayOfDPersonEducationHistory2 = array of dPersonEducationHistory2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonAddresses = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonAddress: Integer;
    FId_Person: Integer;
    FKOATUUCode: WideString;
    FKOATUUFullName: WideString;
    FId_StreetType: Integer;
    FStreetTypeFullName: WideString;
    FStreetTypeShortName: WideString;
    FAdress: WideString;
    FHomeNumber: WideString;
    FPersonHomeAddressDetaeBegin: TXSDateTime;
    FPersonHomeAddressDetaeEnd: TXSDateTime;
    FNoResidentAdress: WideString;
    FId_Language: Integer;
    FPostIndex: WideString;
    FType_: WideString;
    FId_Country: Integer;
    FCountryName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonAddress: Integer read FId_PersonAddress write FId_PersonAddress;
    property Id_Person: Integer read FId_Person write FId_Person;
    property KOATUUCode: WideString read FKOATUUCode write FKOATUUCode;
    property KOATUUFullName: WideString read FKOATUUFullName write FKOATUUFullName;
    property Id_StreetType: Integer read FId_StreetType write FId_StreetType;
    property StreetTypeFullName: WideString read FStreetTypeFullName write FStreetTypeFullName;
    property StreetTypeShortName: WideString read FStreetTypeShortName write FStreetTypeShortName;
    property Adress: WideString read FAdress write FAdress;
    property HomeNumber: WideString read FHomeNumber write FHomeNumber;
    property PersonHomeAddressDetaeBegin: TXSDateTime read FPersonHomeAddressDetaeBegin write FPersonHomeAddressDetaeBegin;
    property PersonHomeAddressDetaeEnd: TXSDateTime read FPersonHomeAddressDetaeEnd write FPersonHomeAddressDetaeEnd;
    property NoResidentAdress: WideString read FNoResidentAdress write FNoResidentAdress;
    property Id_Language: Integer read FId_Language write FId_Language;
    property PostIndex: WideString read FPostIndex write FPostIndex;
    property Type_: WideString read FType_ write FType_;
    property Id_Country: Integer read FId_Country write FId_Country;
    property CountryName: WideString read FCountryName write FCountryName;
  end;

  ArrayOfDPersonAddresses = array of dPersonAddresses;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonAddresses2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonAddress: Integer;
    FId_Person: Integer;
    FKOATUUCode: WideString;
    FKOATUUFullName: WideString;
    FId_StreetType: Integer;
    FStreetTypeFullName: WideString;
    FStreetTypeShortName: WideString;
    FAdress: WideString;
    FHomeNumber: WideString;
    FPersonHomeAddressDetaeBegin: TXSDateTime;
    FPersonHomeAddressDetaeEnd: TXSDateTime;
    FNoResidentAdress: WideString;
    FId_Language: Integer;
    FPostIndex: WideString;
    FType_: WideString;
    FId_Country: Integer;
    FCountryName: WideString;
    FApartment: WideString;
    FHousing: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonAddress: Integer read FId_PersonAddress write FId_PersonAddress;
    property Id_Person: Integer read FId_Person write FId_Person;
    property KOATUUCode: WideString read FKOATUUCode write FKOATUUCode;
    property KOATUUFullName: WideString read FKOATUUFullName write FKOATUUFullName;
    property Id_StreetType: Integer read FId_StreetType write FId_StreetType;
    property StreetTypeFullName: WideString read FStreetTypeFullName write FStreetTypeFullName;
    property StreetTypeShortName: WideString read FStreetTypeShortName write FStreetTypeShortName;
    property Adress: WideString read FAdress write FAdress;
    property HomeNumber: WideString read FHomeNumber write FHomeNumber;
    property PersonHomeAddressDetaeBegin: TXSDateTime read FPersonHomeAddressDetaeBegin write FPersonHomeAddressDetaeBegin;
    property PersonHomeAddressDetaeEnd: TXSDateTime read FPersonHomeAddressDetaeEnd write FPersonHomeAddressDetaeEnd;
    property NoResidentAdress: WideString read FNoResidentAdress write FNoResidentAdress;
    property Id_Language: Integer read FId_Language write FId_Language;
    property PostIndex: WideString read FPostIndex write FPostIndex;
    property Type_: WideString read FType_ write FType_;
    property Id_Country: Integer read FId_Country write FId_Country;
    property CountryName: WideString read FCountryName write FCountryName;
    property Apartment: WideString read FApartment write FApartment;
    property Housing: WideString read FHousing write FHousing;
  end;

  ArrayOfDPersonAddresses2 = array of dPersonAddresses2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonTypeDictGet = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonTypeDict: Integer;
    FPersonTypeName: WideString;
    FDateLastChange: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonTypeDict: Integer read FId_PersonTypeDict write FId_PersonTypeDict;
    property PersonTypeName: WideString read FPersonTypeName write FPersonTypeName;
    property DateLastChange: TXSDateTime read FDateLastChange write FDateLastChange;
  end;

  ArrayOfDPersonTypeDictGet = array of dPersonTypeDictGet;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonRequests = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonRequest: Integer;
    FId_PersonRequestSeasons: Integer;
    FPersonCodeU: WideString;
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
    FId_PersonDocumentsAwardType: Integer;
    FPersonDocumentsAwardTypeName: WideString;
    FId_OrderOfEnrollment: Integer;
    FSpecSpecialityClasifierCode: WideString;
    FId_PersonName: Integer;
    FFIO: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
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
    property Id_PersonDocumentsAwardType: Integer read FId_PersonDocumentsAwardType write FId_PersonDocumentsAwardType;
    property PersonDocumentsAwardTypeName: WideString read FPersonDocumentsAwardTypeName write FPersonDocumentsAwardTypeName;
    property Id_OrderOfEnrollment: Integer read FId_OrderOfEnrollment write FId_OrderOfEnrollment;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property Id_PersonName: Integer read FId_PersonName write FId_PersonName;
    property FIO: WideString read FFIO write FFIO;
  end;

  ArrayOfDPersonRequests = array of dPersonRequests;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonRequests2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonRequest: Integer;
    FId_PersonRequestSeasons: Integer;
    FPersonCodeU: WideString;
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
    FId_PersonDocumentsAwardType: Integer;
    FPersonDocumentsAwardTypeName: WideString;
    FId_OrderOfEnrollment: Integer;
    FSpecSpecialityClasifierCode: WideString;
    FId_PersonName: Integer;
    FFIO: WideString;
    FUniversityPhone: WideString;
    FDateCreate: TXSDateTime;
    FStatusDateSet: TXSDateTime;
    FBossName: WideString;
    FAdress: WideString;
    FEmail: WideString;
    FPhone: WideString;
    FWebSite: WideString;
    FBossNameW: WideString;
    FAdressW: WideString;
    FEmailW: WideString;
    FPhoneW: WideString;
    FWebSiteW: WideString;
    FIsEz: Integer;
    FDateRegistration: TXSDateTime;
    FAdressDocumentGetW: WideString;
    FPersonRequestStatusTypeNameEz: WideString;
    FId_LanguageEx: Integer;
    FLanguageExName: WideString;
    FIsForeignWay: Integer;
    FId_ForeignType: Integer;
    FForeignTypeName: WideString;
    FEntranceCodes: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonRequestSeasons: Integer read FId_PersonRequestSeasons write FId_PersonRequestSeasons;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
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
    property Id_PersonDocumentsAwardType: Integer read FId_PersonDocumentsAwardType write FId_PersonDocumentsAwardType;
    property PersonDocumentsAwardTypeName: WideString read FPersonDocumentsAwardTypeName write FPersonDocumentsAwardTypeName;
    property Id_OrderOfEnrollment: Integer read FId_OrderOfEnrollment write FId_OrderOfEnrollment;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property Id_PersonName: Integer read FId_PersonName write FId_PersonName;
    property FIO: WideString read FFIO write FFIO;
    property UniversityPhone: WideString read FUniversityPhone write FUniversityPhone;
    property DateCreate: TXSDateTime read FDateCreate write FDateCreate;
    property StatusDateSet: TXSDateTime read FStatusDateSet write FStatusDateSet;
    property BossName: WideString read FBossName write FBossName;
    property Adress: WideString read FAdress write FAdress;
    property Email: WideString read FEmail write FEmail;
    property Phone: WideString read FPhone write FPhone;
    property WebSite: WideString read FWebSite write FWebSite;
    property BossNameW: WideString read FBossNameW write FBossNameW;
    property AdressW: WideString read FAdressW write FAdressW;
    property EmailW: WideString read FEmailW write FEmailW;
    property PhoneW: WideString read FPhoneW write FPhoneW;
    property WebSiteW: WideString read FWebSiteW write FWebSiteW;
    property IsEz: Integer read FIsEz write FIsEz;
    property DateRegistration: TXSDateTime read FDateRegistration write FDateRegistration;
    property AdressDocumentGetW: WideString read FAdressDocumentGetW write FAdressDocumentGetW;
    property PersonRequestStatusTypeNameEz: WideString read FPersonRequestStatusTypeNameEz write FPersonRequestStatusTypeNameEz;
    property Id_LanguageEx: Integer read FId_LanguageEx write FId_LanguageEx;
    property LanguageExName: WideString read FLanguageExName write FLanguageExName;
    property IsForeignWay: Integer read FIsForeignWay write FIsForeignWay;
    property Id_ForeignType: Integer read FId_ForeignType write FId_ForeignType;
    property ForeignTypeName: WideString read FForeignTypeName write FForeignTypeName;
    property EntranceCodes: WideString read FEntranceCodes write FEntranceCodes;
  end;

  ArrayOfDPersonRequests2 = array of dPersonRequests2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationPaymentTypes = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
  end;

  ArrayOfDPersonEducationPaymentTypes = array of dPersonEducationPaymentTypes;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsStudentsGrupsPersonsFind = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FId_Person: Integer;
    FFIO: WideString;
    FBirthday: TXSDateTime;
    FPersonCodeU: WideString;
    FId_PersonEducation: Integer;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FAcademicYearName: WideString;
    FCourseName: WideString;
    FPersonEducationFormName: WideString;
    FUniversityFacultetFullName: WideString;
    FQualificationName: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FUniversityGroupFullName: WideString;
    FIsRefill: Integer;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FSpecIndastryCode: WideString;
    FSpecIndastryClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationCode: WideString;
    FSpecScecializationName: WideString;
    FResident: Integer;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Person: Integer read FId_Person write FId_Person;
    property FIO: WideString read FFIO write FFIO;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property CourseName: WideString read FCourseName write FCourseName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationCode: WideString read FSpecScecializationCode write FSpecScecializationCode;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property Resident: Integer read FResident write FResident;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
  end;

  ArrayOfDPersonsStudentsGrupsPersonsFind = array of dPersonsStudentsGrupsPersonsFind;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsStudentsGrupsPersonsFind2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FId_Person: Integer;
    FFIO: WideString;
    FBirthday: TXSDateTime;
    FPersonCodeU: WideString;
    FId_PersonEducation: Integer;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FAcademicYearName: WideString;
    FCourseName: WideString;
    FPersonEducationFormName: WideString;
    FUniversityFacultetFullName: WideString;
    FQualificationName: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FUniversityGroupFullName: WideString;
    FIsRefill: Integer;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FSpecIndastryCode: WideString;
    FSpecIndastryClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationCode: WideString;
    FSpecScecializationName: WideString;
    FResident: Integer;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FCountryName: WideString;
    FSpecProfessionClassifierCode1: WideString;
    FSpecProfessionName1: WideString;
    FSpecProfessionClassifierCode2: WideString;
    FSpecProfessionName2: WideString;
    FSpecProfessionClassifierCode3: WideString;
    FSpecProfessionName3: WideString;
    FSpecProfessionClassifierCode4: WideString;
    FSpecProfessionName4: WideString;
    FSpecProfessionClassifierCode5: WideString;
    FSpecProfessionName5: WideString;
    FSpecProfessionCode1: WideString;
    FSpecProfessionCode2: WideString;
    FSpecProfessionCode3: WideString;
    FSpecProfessionCode4: WideString;
    FSpecProfessionCode5: WideString;
    FSpecComplexName: WideString;
    FSpecProfession1_MaxRang: WideString;
    FSpecProfession2_MaxRang: WideString;
    FSpecProfession3_MaxRang: WideString;
    FSpecProfession4_MaxRang: WideString;
    FSpecProfession5_MaxRang: WideString;
    FSpecProfession1_CurRang: WideString;
    FSpecProfession2_CurRang: WideString;
    FSpecProfession3_CurRang: WideString;
    FSpecProfession4_CurRang: WideString;
    FSpecProfession5_CurRang: WideString;
    FId_SpecProfessions1RangType: Integer;
    FId_SpecProfessions2RangType: Integer;
    FId_SpecProfessions3RangType: Integer;
    FId_SpecProfessions4RangType: Integer;
    FId_SpecProfessions5RangType: Integer;
    FSpecProfessionsRangTypeName1: WideString;
    FSpecProfessionsRangTypeName2: WideString;
    FSpecProfessionsRangTypeName3: WideString;
    FSpecProfessionsRangTypeName4: WideString;
    FSpecProfessionsRangTypeName5: WideString;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FIsAfterDiplomEducation: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Person: Integer read FId_Person write FId_Person;
    property FIO: WideString read FFIO write FFIO;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property CourseName: WideString read FCourseName write FCourseName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationCode: WideString read FSpecScecializationCode write FSpecScecializationCode;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property Resident: Integer read FResident write FResident;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property CountryName: WideString read FCountryName write FCountryName;
    property SpecProfessionClassifierCode1: WideString read FSpecProfessionClassifierCode1 write FSpecProfessionClassifierCode1;
    property SpecProfessionName1: WideString read FSpecProfessionName1 write FSpecProfessionName1;
    property SpecProfessionClassifierCode2: WideString read FSpecProfessionClassifierCode2 write FSpecProfessionClassifierCode2;
    property SpecProfessionName2: WideString read FSpecProfessionName2 write FSpecProfessionName2;
    property SpecProfessionClassifierCode3: WideString read FSpecProfessionClassifierCode3 write FSpecProfessionClassifierCode3;
    property SpecProfessionName3: WideString read FSpecProfessionName3 write FSpecProfessionName3;
    property SpecProfessionClassifierCode4: WideString read FSpecProfessionClassifierCode4 write FSpecProfessionClassifierCode4;
    property SpecProfessionName4: WideString read FSpecProfessionName4 write FSpecProfessionName4;
    property SpecProfessionClassifierCode5: WideString read FSpecProfessionClassifierCode5 write FSpecProfessionClassifierCode5;
    property SpecProfessionName5: WideString read FSpecProfessionName5 write FSpecProfessionName5;
    property SpecProfessionCode1: WideString read FSpecProfessionCode1 write FSpecProfessionCode1;
    property SpecProfessionCode2: WideString read FSpecProfessionCode2 write FSpecProfessionCode2;
    property SpecProfessionCode3: WideString read FSpecProfessionCode3 write FSpecProfessionCode3;
    property SpecProfessionCode4: WideString read FSpecProfessionCode4 write FSpecProfessionCode4;
    property SpecProfessionCode5: WideString read FSpecProfessionCode5 write FSpecProfessionCode5;
    property SpecComplexName: WideString read FSpecComplexName write FSpecComplexName;
    property SpecProfession1_MaxRang: WideString read FSpecProfession1_MaxRang write FSpecProfession1_MaxRang;
    property SpecProfession2_MaxRang: WideString read FSpecProfession2_MaxRang write FSpecProfession2_MaxRang;
    property SpecProfession3_MaxRang: WideString read FSpecProfession3_MaxRang write FSpecProfession3_MaxRang;
    property SpecProfession4_MaxRang: WideString read FSpecProfession4_MaxRang write FSpecProfession4_MaxRang;
    property SpecProfession5_MaxRang: WideString read FSpecProfession5_MaxRang write FSpecProfession5_MaxRang;
    property SpecProfession1_CurRang: WideString read FSpecProfession1_CurRang write FSpecProfession1_CurRang;
    property SpecProfession2_CurRang: WideString read FSpecProfession2_CurRang write FSpecProfession2_CurRang;
    property SpecProfession3_CurRang: WideString read FSpecProfession3_CurRang write FSpecProfession3_CurRang;
    property SpecProfession4_CurRang: WideString read FSpecProfession4_CurRang write FSpecProfession4_CurRang;
    property SpecProfession5_CurRang: WideString read FSpecProfession5_CurRang write FSpecProfession5_CurRang;
    property Id_SpecProfessions1RangType: Integer read FId_SpecProfessions1RangType write FId_SpecProfessions1RangType;
    property Id_SpecProfessions2RangType: Integer read FId_SpecProfessions2RangType write FId_SpecProfessions2RangType;
    property Id_SpecProfessions3RangType: Integer read FId_SpecProfessions3RangType write FId_SpecProfessions3RangType;
    property Id_SpecProfessions4RangType: Integer read FId_SpecProfessions4RangType write FId_SpecProfessions4RangType;
    property Id_SpecProfessions5RangType: Integer read FId_SpecProfessions5RangType write FId_SpecProfessions5RangType;
    property SpecProfessionsRangTypeName1: WideString read FSpecProfessionsRangTypeName1 write FSpecProfessionsRangTypeName1;
    property SpecProfessionsRangTypeName2: WideString read FSpecProfessionsRangTypeName2 write FSpecProfessionsRangTypeName2;
    property SpecProfessionsRangTypeName3: WideString read FSpecProfessionsRangTypeName3 write FSpecProfessionsRangTypeName3;
    property SpecProfessionsRangTypeName4: WideString read FSpecProfessionsRangTypeName4 write FSpecProfessionsRangTypeName4;
    property SpecProfessionsRangTypeName5: WideString read FSpecProfessionsRangTypeName5 write FSpecProfessionsRangTypeName5;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property IsAfterDiplomEducation: Integer read FIsAfterDiplomEducation write FIsAfterDiplomEducation;
  end;

  ArrayOfDPersonsStudentsGrupsPersonsFind2 = array of dPersonsStudentsGrupsPersonsFind2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsStudentsGrupsPersons = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FId_Person: Integer;
    FFIO: WideString;
    FBirthday: TXSDateTime;
    FPersonCodeU: WideString;
    FId_PersonEducation: Integer;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FResident: Integer;
    FIsRefill: Integer;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryDesciption: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FUniversityGroupCode: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FPersonEducationFormName: WideString;
    FAcademicYearName: WideString;
    FQualificationName: WideString;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FCourseName: WideString;
    FSpecIndastryCode: WideString;
    FSpecIndastryClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecSpecializationCode: WideString;
    FSpecSpecializationName: WideString;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Person: Integer read FId_Person write FId_Person;
    property FIO: WideString read FFIO write FFIO;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property Resident: Integer read FResident write FResident;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryDesciption: WideString read FPersonEducationHistoryDesciption write FPersonEducationHistoryDesciption;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property UniversityGroupCode: WideString read FUniversityGroupCode write FUniversityGroupCode;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property CourseName: WideString read FCourseName write FCourseName;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
  end;

  ArrayOfDPersonsStudentsGrupsPersons = array of dPersonsStudentsGrupsPersons;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonsStudentsGrupsPersons2 = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_UniversityGroup: Integer;
    FUniversityFacultetKode: WideString;
    FId_PersonEducationForm: Integer;
    FId_Qualification: Integer;
    FSpecCode: WideString;
    FId_Course: Integer;
    FId_AcademicYear: Integer;
    FId_Person: Integer;
    FFIO: WideString;
    FBirthday: TXSDateTime;
    FPersonCodeU: WideString;
    FId_PersonEducation: Integer;
    FId_PersonEducationHistory: Integer;
    FId_PersonEducationPaymentType: Integer;
    FPersonEducationPaymentTypeName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FResident: Integer;
    FIsRefill: Integer;
    FId_PersonEducationHistoryType: Integer;
    FPersonEducationHistoryDesciption: WideString;
    FPersonEducationHistoryDateBegin: TXSDateTime;
    FUniversityGroupCode: WideString;
    FUniversityGroupFullName: WideString;
    FUniversityGroupShortName: WideString;
    FUniversityFacultetFullName: WideString;
    FUniversityFacultetShortName: WideString;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FPersonEducationFormName: WideString;
    FAcademicYearName: WideString;
    FQualificationName: WideString;
    FId_QualificationGroup: Integer;
    FQualificationGroupName: WideString;
    FCourseName: WideString;
    FSpecIndastryCode: WideString;
    FSpecIndastryClasifierCode: WideString;
    FSpecIndastryName: WideString;
    FSpecDirectionsCode: WideString;
    FSpecClasifierCode: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FSpecSpecialityName: WideString;
    FSpecSpecializationCode: WideString;
    FSpecSpecializationName: WideString;
    FId_PersonEducationsCancelEducationType: Integer;
    FPersonEducationsCancelEducationTypeName: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FSpecProfessionClassifierCode1: WideString;
    FSpecProfessionName1: WideString;
    FSpecProfessionClassifierCode2: WideString;
    FSpecProfessionName2: WideString;
    FSpecProfessionClassifierCode3: WideString;
    FSpecProfessionName3: WideString;
    FSpecProfessionClassifierCode4: WideString;
    FSpecProfessionName4: WideString;
    FSpecProfessionClassifierCode5: WideString;
    FSpecProfessionName5: WideString;
    FSpecProfession1_MaxRang: WideString;
    FSpecProfession2_MaxRang: WideString;
    FSpecProfession3_MaxRang: WideString;
    FSpecProfession4_MaxRang: WideString;
    FSpecProfession5_MaxRang: WideString;
    FSpecProfession1_CurRang: WideString;
    FSpecProfession2_CurRang: WideString;
    FSpecProfession3_CurRang: WideString;
    FSpecProfession4_CurRang: WideString;
    FSpecProfession5_CurRang: WideString;
    FId_SpecProfessions1RangType: Integer;
    FId_SpecProfessions2RangType: Integer;
    FId_SpecProfessions3RangType: Integer;
    FId_SpecProfessions4RangType: Integer;
    FId_SpecProfessions5RangType: Integer;
    FSpecProfessionsRangTypeName1: WideString;
    FSpecProfessionsRangTypeName2: WideString;
    FSpecProfessionsRangTypeName3: WideString;
    FSpecProfessionsRangTypeName4: WideString;
    FSpecProfessionsRangTypeName5: WideString;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FIsAfterDiplomEducation: Integer;
    FSpecProfessionCode1: WideString;
    FSpecProfessionCode2: WideString;
    FSpecProfessionCode3: WideString;
    FSpecProfessionCode4: WideString;
    FSpecProfessionCode5: WideString;
    FSpecComplexName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Person: Integer read FId_Person write FId_Person;
    property FIO: WideString read FFIO write FFIO;
    property Birthday: TXSDateTime read FBirthday write FBirthday;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationHistory: Integer read FId_PersonEducationHistory write FId_PersonEducationHistory;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property Resident: Integer read FResident write FResident;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property PersonEducationHistoryDesciption: WideString read FPersonEducationHistoryDesciption write FPersonEducationHistoryDesciption;
    property PersonEducationHistoryDateBegin: TXSDateTime read FPersonEducationHistoryDateBegin write FPersonEducationHistoryDateBegin;
    property UniversityGroupCode: WideString read FUniversityGroupCode write FUniversityGroupCode;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property UniversityGroupShortName: WideString read FUniversityGroupShortName write FUniversityGroupShortName;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property UniversityFacultetShortName: WideString read FUniversityFacultetShortName write FUniversityFacultetShortName;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property QualificationGroupName: WideString read FQualificationGroupName write FQualificationGroupName;
    property CourseName: WideString read FCourseName write FCourseName;
    property SpecIndastryCode: WideString read FSpecIndastryCode write FSpecIndastryCode;
    property SpecIndastryClasifierCode: WideString read FSpecIndastryClasifierCode write FSpecIndastryClasifierCode;
    property SpecIndastryName: WideString read FSpecIndastryName write FSpecIndastryName;
    property SpecDirectionsCode: WideString read FSpecDirectionsCode write FSpecDirectionsCode;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityCode: WideString read FSpecSpecialityCode write FSpecSpecialityCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecSpecializationCode: WideString read FSpecSpecializationCode write FSpecSpecializationCode;
    property SpecSpecializationName: WideString read FSpecSpecializationName write FSpecSpecializationName;
    property Id_PersonEducationsCancelEducationType: Integer read FId_PersonEducationsCancelEducationType write FId_PersonEducationsCancelEducationType;
    property PersonEducationsCancelEducationTypeName: WideString read FPersonEducationsCancelEducationTypeName write FPersonEducationsCancelEducationTypeName;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property SpecProfessionClassifierCode1: WideString read FSpecProfessionClassifierCode1 write FSpecProfessionClassifierCode1;
    property SpecProfessionName1: WideString read FSpecProfessionName1 write FSpecProfessionName1;
    property SpecProfessionClassifierCode2: WideString read FSpecProfessionClassifierCode2 write FSpecProfessionClassifierCode2;
    property SpecProfessionName2: WideString read FSpecProfessionName2 write FSpecProfessionName2;
    property SpecProfessionClassifierCode3: WideString read FSpecProfessionClassifierCode3 write FSpecProfessionClassifierCode3;
    property SpecProfessionName3: WideString read FSpecProfessionName3 write FSpecProfessionName3;
    property SpecProfessionClassifierCode4: WideString read FSpecProfessionClassifierCode4 write FSpecProfessionClassifierCode4;
    property SpecProfessionName4: WideString read FSpecProfessionName4 write FSpecProfessionName4;
    property SpecProfessionClassifierCode5: WideString read FSpecProfessionClassifierCode5 write FSpecProfessionClassifierCode5;
    property SpecProfessionName5: WideString read FSpecProfessionName5 write FSpecProfessionName5;
    property SpecProfession1_MaxRang: WideString read FSpecProfession1_MaxRang write FSpecProfession1_MaxRang;
    property SpecProfession2_MaxRang: WideString read FSpecProfession2_MaxRang write FSpecProfession2_MaxRang;
    property SpecProfession3_MaxRang: WideString read FSpecProfession3_MaxRang write FSpecProfession3_MaxRang;
    property SpecProfession4_MaxRang: WideString read FSpecProfession4_MaxRang write FSpecProfession4_MaxRang;
    property SpecProfession5_MaxRang: WideString read FSpecProfession5_MaxRang write FSpecProfession5_MaxRang;
    property SpecProfession1_CurRang: WideString read FSpecProfession1_CurRang write FSpecProfession1_CurRang;
    property SpecProfession2_CurRang: WideString read FSpecProfession2_CurRang write FSpecProfession2_CurRang;
    property SpecProfession3_CurRang: WideString read FSpecProfession3_CurRang write FSpecProfession3_CurRang;
    property SpecProfession4_CurRang: WideString read FSpecProfession4_CurRang write FSpecProfession4_CurRang;
    property SpecProfession5_CurRang: WideString read FSpecProfession5_CurRang write FSpecProfession5_CurRang;
    property Id_SpecProfessions1RangType: Integer read FId_SpecProfessions1RangType write FId_SpecProfessions1RangType;
    property Id_SpecProfessions2RangType: Integer read FId_SpecProfessions2RangType write FId_SpecProfessions2RangType;
    property Id_SpecProfessions3RangType: Integer read FId_SpecProfessions3RangType write FId_SpecProfessions3RangType;
    property Id_SpecProfessions4RangType: Integer read FId_SpecProfessions4RangType write FId_SpecProfessions4RangType;
    property Id_SpecProfessions5RangType: Integer read FId_SpecProfessions5RangType write FId_SpecProfessions5RangType;
    property SpecProfessionsRangTypeName1: WideString read FSpecProfessionsRangTypeName1 write FSpecProfessionsRangTypeName1;
    property SpecProfessionsRangTypeName2: WideString read FSpecProfessionsRangTypeName2 write FSpecProfessionsRangTypeName2;
    property SpecProfessionsRangTypeName3: WideString read FSpecProfessionsRangTypeName3 write FSpecProfessionsRangTypeName3;
    property SpecProfessionsRangTypeName4: WideString read FSpecProfessionsRangTypeName4 write FSpecProfessionsRangTypeName4;
    property SpecProfessionsRangTypeName5: WideString read FSpecProfessionsRangTypeName5 write FSpecProfessionsRangTypeName5;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property IsAfterDiplomEducation: Integer read FIsAfterDiplomEducation write FIsAfterDiplomEducation;
    property SpecProfessionCode1: WideString read FSpecProfessionCode1 write FSpecProfessionCode1;
    property SpecProfessionCode2: WideString read FSpecProfessionCode2 write FSpecProfessionCode2;
    property SpecProfessionCode3: WideString read FSpecProfessionCode3 write FSpecProfessionCode3;
    property SpecProfessionCode4: WideString read FSpecProfessionCode4 write FSpecProfessionCode4;
    property SpecProfessionCode5: WideString read FSpecProfessionCode5 write FSpecProfessionCode5;
    property SpecComplexName: WideString read FSpecComplexName write FSpecComplexName;
  end;

  ArrayOfDPersonsStudentsGrupsPersons2 = array of dPersonsStudentsGrupsPersons2;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonEducationsFull = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_PersonEducation: Integer;
    FId_PersonEducationForm: Integer;
    FPersonEducationFormName: WideString;
    FId_PersonEducationType: Integer;
    FPersonEducationDateBegin: TXSDateTime;
    FPersonEducationDateEnd: TXSDateTime;
    FInstitutionCode: WideString;
    FId_University: Integer;
    FUniversityFullName: WideString;
    FUniversityFacultetKode: WideString;
    FUniversityFacultetFullName: WideString;
    FQualificationName: WideString;
    FSpecDirectionName: WideString;
    FSpecSpecialityName: WideString;
    FSpecScecializationName: WideString;
    FSpecClasifierCode: WideString;
    FSpecSpecialityClasifierCode: WideString;
    FPersonCodeU: WideString;
    FCourseName: WideString;
    FAcademicYearName: WideString;
    FId_PersonEducationHistoryOrders: Integer;
    FPersonEducationHistoryOrdersNumber: WideString;
    FPersonEducationHistoryOrdersDate: TXSDateTime;
    FUniversityGroupFullName: WideString;
    FPersonEducationPaymentTypeName: WideString;
    FPersonEducationHistoryTypeName: WideString;
    FIsRefill: Integer;
    FId_PersonRequest: Integer;
    FId_PersonDocument: Integer;
    FDocumentSeries: WideString;
    FDocumentNumbers: WideString;
    FDocumentDateGet: TXSDateTime;
    FId_PersonDocumentType: Integer;
    FPersonDocumentTypeName: WideString;
    FId_PersonEducationPaymentType: Integer;
    FId_PersonEducationHistoryType: Integer;
    FId_AcademicYear: Integer;
    FId_Course: Integer;
    FId_Qualification: Integer;
    FId_QualificationGroup: Integer;
    FId_UniversityGroup: Integer;
    FSpecCode: WideString;
    FIsSecondHigher: Integer;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_PersonEducation: Integer read FId_PersonEducation write FId_PersonEducation;
    property Id_PersonEducationForm: Integer read FId_PersonEducationForm write FId_PersonEducationForm;
    property PersonEducationFormName: WideString read FPersonEducationFormName write FPersonEducationFormName;
    property Id_PersonEducationType: Integer read FId_PersonEducationType write FId_PersonEducationType;
    property PersonEducationDateBegin: TXSDateTime read FPersonEducationDateBegin write FPersonEducationDateBegin;
    property PersonEducationDateEnd: TXSDateTime read FPersonEducationDateEnd write FPersonEducationDateEnd;
    property InstitutionCode: WideString read FInstitutionCode write FInstitutionCode;
    property Id_University: Integer read FId_University write FId_University;
    property UniversityFullName: WideString read FUniversityFullName write FUniversityFullName;
    property UniversityFacultetKode: WideString read FUniversityFacultetKode write FUniversityFacultetKode;
    property UniversityFacultetFullName: WideString read FUniversityFacultetFullName write FUniversityFacultetFullName;
    property QualificationName: WideString read FQualificationName write FQualificationName;
    property SpecDirectionName: WideString read FSpecDirectionName write FSpecDirectionName;
    property SpecSpecialityName: WideString read FSpecSpecialityName write FSpecSpecialityName;
    property SpecScecializationName: WideString read FSpecScecializationName write FSpecScecializationName;
    property SpecClasifierCode: WideString read FSpecClasifierCode write FSpecClasifierCode;
    property SpecSpecialityClasifierCode: WideString read FSpecSpecialityClasifierCode write FSpecSpecialityClasifierCode;
    property PersonCodeU: WideString read FPersonCodeU write FPersonCodeU;
    property CourseName: WideString read FCourseName write FCourseName;
    property AcademicYearName: WideString read FAcademicYearName write FAcademicYearName;
    property Id_PersonEducationHistoryOrders: Integer read FId_PersonEducationHistoryOrders write FId_PersonEducationHistoryOrders;
    property PersonEducationHistoryOrdersNumber: WideString read FPersonEducationHistoryOrdersNumber write FPersonEducationHistoryOrdersNumber;
    property PersonEducationHistoryOrdersDate: TXSDateTime read FPersonEducationHistoryOrdersDate write FPersonEducationHistoryOrdersDate;
    property UniversityGroupFullName: WideString read FUniversityGroupFullName write FUniversityGroupFullName;
    property PersonEducationPaymentTypeName: WideString read FPersonEducationPaymentTypeName write FPersonEducationPaymentTypeName;
    property PersonEducationHistoryTypeName: WideString read FPersonEducationHistoryTypeName write FPersonEducationHistoryTypeName;
    property IsRefill: Integer read FIsRefill write FIsRefill;
    property Id_PersonRequest: Integer read FId_PersonRequest write FId_PersonRequest;
    property Id_PersonDocument: Integer read FId_PersonDocument write FId_PersonDocument;
    property DocumentSeries: WideString read FDocumentSeries write FDocumentSeries;
    property DocumentNumbers: WideString read FDocumentNumbers write FDocumentNumbers;
    property DocumentDateGet: TXSDateTime read FDocumentDateGet write FDocumentDateGet;
    property Id_PersonDocumentType: Integer read FId_PersonDocumentType write FId_PersonDocumentType;
    property PersonDocumentTypeName: WideString read FPersonDocumentTypeName write FPersonDocumentTypeName;
    property Id_PersonEducationPaymentType: Integer read FId_PersonEducationPaymentType write FId_PersonEducationPaymentType;
    property Id_PersonEducationHistoryType: Integer read FId_PersonEducationHistoryType write FId_PersonEducationHistoryType;
    property Id_AcademicYear: Integer read FId_AcademicYear write FId_AcademicYear;
    property Id_Course: Integer read FId_Course write FId_Course;
    property Id_Qualification: Integer read FId_Qualification write FId_Qualification;
    property Id_QualificationGroup: Integer read FId_QualificationGroup write FId_QualificationGroup;
    property Id_UniversityGroup: Integer read FId_UniversityGroup write FId_UniversityGroup;
    property SpecCode: WideString read FSpecCode write FSpecCode;
    property IsSecondHigher: Integer read FIsSecondHigher write FIsSecondHigher;
  end;

  ArrayOfDPersonEducationsFull = array of dPersonEducationsFull;   { "http://edboservice.ua/" }


  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // ************************************************************************ //
  dPersonCountry = class(TRemotable)
  private
    FExtensionData: ExtensionDataObject;
    FId_Country: Integer;
    FCountryName: WideString;
  public
    destructor Destroy; override;
  published
    property ExtensionData: ExtensionDataObject read FExtensionData write FExtensionData;
    property Id_Country: Integer read FId_Country write FId_Country;
    property CountryName: WideString read FCountryName write FCountryName;
  end;

  ArrayOfDPersonCountry = array of dPersonCountry;   { "http://edboservice.ua/" }

  // ************************************************************************ //
  // Namespace : http://edboservice.ua/
  // soapAction: http://edboservice.ua/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : EDBOPersonSoap
  // service   : EDBOPerson
  // port      : EDBOPersonSoap
  // URL       : http://ias.donnu.edu.ua/EDBOdata/EDBOPersonToFMASService.asmx
  // ************************************************************************ //
  EDBOPersonSoap = interface(IInvokable)
  ['{D85BDD64-A6B6-26EE-9FC8-7EC3E291D844}']
    function  Login(const User: WideString; const Password: WideString; const ClearPreviewSession: Integer; const ApplicationKey: WideString): WideString; stdcall;
    function  GetLastError(const GUIDSession: WideString): ArrayOfDLastError; stdcall;
    function  QualificationsGet(const SessionGUID: WideString; const Id_Language: Integer; const ActualDate: WideString): ArrayOfDQualification; stdcall;
    function  PersonRequestSeasonsGet(const SessionGUID: WideString; const Id_Language: Integer; const ActualDate: WideString; const Id_PersonRequestSeasons: Integer; const Id_PersonEducationForm: Integer; const OnlyActive: Integer): ArrayOfDPersonRequestSeasons; stdcall;
    function  PersonEducationFormsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer): ArrayOfDPersonEducationFormsGet; stdcall;
    function  PersonGetId(const SessionGUID: WideString; const Id_Person: Integer; const PersonCodeU: WideString): ArrayOfDPersonAddRet; stdcall;
    function  PersonsIdsGet(const SessionGUID: WideString; const Id_Language: Integer; const Id_PersonRequestSeasons: Integer; const UniversityKode: WideString): ArrayOfDPersonsIds; stdcall;
    function  PersonContactsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonContact: Integer): ArrayOfDPersonContacts; stdcall;
    function  PersonsFind(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const FIOMask: WideString; const DocumentSeries: WideString; const DocumentNumber: WideString; const Ids_DocumentTypes: WideString; const Hundred: Integer; const PersonCodeU: WideString; const Filters: WideString
                          ): ArrayOfDPersonsFind; stdcall;
    function  PersonsFind2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const FIOMask: WideString; const DocumentSeries: WideString; const DocumentNumber: WideString; const Ids_DocumentTypes: WideString; const Hundred: Integer; const PersonCodeU: WideString; const Filters: WideString
                           ): ArrayOfDPersonsFind2; stdcall;
    function  CountriesGet(const SessionGUID: WideString; const Id_Language: Integer; const ActualDate: WideString): ArrayOfDCountries; stdcall;
    function  LanguagesGet(const SessionGUID: WideString): ArrayOfDLanguages; stdcall;
    function  PersonsStudentsGrupsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const Type_: Integer; const UniversityKode: WideString; const Id_AcademicYear: Integer; const Filters: WideString): ArrayOfDPersonsStudentsGrups; stdcall;
    function  PersonsStudentsGrupsGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const Type_: Integer; const UniversityKode: WideString; const Id_AcademicYear: Integer; const Filters: WideString): ArrayOfDPersonsStudentsGrups2; stdcall;
    function  PersonSOAPPhotoGet(const SessionGUID: WideString; const UniversityKode: WideString; const PersonCodeU: WideString): ArrayOfDPersonSOAPPhoto; stdcall;
    function  PersonEducationHistoryTypesGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer): ArrayOfDPersonEducationHistoryTypes; stdcall;
    function  PersonEducationHistoryOrdersStatusesGet(const SessionGUID: WideString): ArrayOfDPersonEducationHistoryOrdersStatuses; stdcall;
    function  PersonEducationHistoryOrdersGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Id_PersonEducationHistoryType: Integer; const Id_PersonEducationHistoryOrderStatus: Integer; const Filters: WideString): ArrayOfDPersonEducationHistoryOrders; stdcall;
    function  PersonEducationHistoryOrdersGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Id_PersonEducationHistoryType: Integer; const Id_PersonEducationHistoryOrderStatus: Integer; const Filters: WideString): ArrayOfDPersonEducationHistoryOrders2; stdcall;
    function  PersonDocumentTypesGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer): ArrayOfDPersonDocumentTypes; stdcall;
    function  PersonDocumentsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonDocumentType: Integer; const Id_PersonDocument: Integer; const UniversityKode: WideString; const IsEntrantDocument: Integer): ArrayOfDPersonDocuments; stdcall;
    function  PersonDocumentsGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonDocumentType: Integer; const Id_PersonDocument: Integer; const UniversityKode: WideString; const IsEntrantDocument: Integer): ArrayOfDPersonDocuments2; stdcall;
    function  PersonEducationsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonEducation: Integer; const Id_PersonEducationType: Integer; const Filters: WideString): ArrayOfDPersonEducations; stdcall;
    function  PersonEducationsGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonEducation: Integer; const Id_PersonEducationType: Integer; const Filters: WideString): ArrayOfDPersonEducations2; stdcall;
    function  PersonEducationHistoryOrdersDataGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const Id_PersonEducationHistoryOrders: Integer; const Filters: WideString): ArrayOfDPersonEducationHistoryOrdersData; stdcall;
    function  PersonEducationHistoryOrdersDataGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const Id_PersonEducationHistoryOrders: Integer; const Filters: WideString): ArrayOfDPersonEducationHistoryOrdersData2; stdcall;
    function  PersonEducationHistoryOrdersChangeFIODataGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const Id_PersonEducationHistoryOrders: Integer; const Filters: WideString): ArrayOfDPersonEducationHistoryOrdersChangeFIOData; stdcall;
    function  PersonEducationHistoryGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonEducation: Integer; const IsActiveOnly: Integer): ArrayOfDPersonEducationHistory; stdcall;
    function  PersonEducationHistoryGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonEducation: Integer; const IsActiveOnly: Integer): ArrayOfDPersonEducationHistory2; stdcall;
    function  PersonAddressesGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonAddress: Integer): ArrayOfDPersonAddresses; stdcall;
    function  PersonAddressesGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonAddress: Integer): ArrayOfDPersonAddresses2; stdcall;
    function  PersonTypeDictGet(const SessionGUID: WideString; const Id_Language: Integer): ArrayOfDPersonTypeDictGet; stdcall;
    function  PersonRequestsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonRequestSeasons: Integer; const Id_PersonRequest: Integer; const UniversityFacultetKode: WideString; const Id_PersonEducationForm: Integer; const Id_Qualification: Integer; const Filters: WideString
                                ): ArrayOfDPersonRequests; stdcall;
    function  PersonRequestsGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const PersonCodeU: WideString; const Id_PersonRequestSeasons: Integer; const Id_PersonRequest: Integer; const UniversityFacultetKode: WideString; const Id_PersonEducationForm: Integer; const Id_Qualification: Integer; const Filters: WideString
                                 ): ArrayOfDPersonRequests2; stdcall;
    function  PersonEducationPaymentTypesGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer): ArrayOfDPersonEducationPaymentTypes; stdcall;
    function  PersonsStudentsGrupsPersonsFind(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Filters: WideString): ArrayOfDPersonsStudentsGrupsPersonsFind; stdcall;
    function  PersonsStudentsGrupsPersonsFind2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Filters: WideString): ArrayOfDPersonsStudentsGrupsPersonsFind2; stdcall;
    function  PersonsStudentsGrupsPersonsGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Id_AcademicYear: Integer; const Id_UniversityGroup: Integer; const UniversityFacultetKode: WideString; const Id_PersonEducationForm: Integer; const Id_Qualification: Integer; const SpecCode: WideString; 
                                             const Id_Course: Integer; const Filters: WideString; const IgnoreSpec: Integer): ArrayOfDPersonsStudentsGrupsPersons; stdcall;
    function  PersonsStudentsGrupsPersonsGet2(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Id_AcademicYear: Integer; const Id_UniversityGroup: Integer; const UniversityFacultetKode: WideString; const Id_PersonEducationForm: Integer; const Id_Qualification: Integer; const SpecCode: WideString; 
                                              const Id_Course: Integer; const Filters: WideString; const IgnoreSpec: Integer; const SpecProfessionCode1: WideString; const SpecProfessionCode2: WideString; const SpecProfessionCode3: WideString; const SpecProfessionCode4: WideString; const SpecProfessionCode5: WideString; const SpecProfession1_MaxRang: WideString; 
                                              const SpecProfession2_MaxRang: WideString; const SpecProfession3_MaxRang: WideString; const SpecProfession4_MaxRang: WideString; const SpecProfession5_MaxRang: WideString): ArrayOfDPersonsStudentsGrupsPersons2; stdcall;
    function  PersonEducationsFullGet(const SessionGUID: WideString; const ActualDate: WideString; const Id_Language: Integer; const UniversityKode: WideString; const Id_PersonRequestSeasons: Integer): ArrayOfDPersonEducationsFull; stdcall;
    function  PersonCountryGet(const SessionGUID: WideString; const PersonCodeU: WideString): ArrayOfDPersonCountry; stdcall;
  end;

function GetEDBOPersonSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): EDBOPersonSoap;


implementation

function GetEDBOPersonSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): EDBOPersonSoap;
const
  defWSDL = 'D:\DonnU\SourcesSVN\FMAS-WIN\Contingent_Student\Sources\WSDL\EDBOPersonToFMASService.wsdl';
  defURL  = 'http://ias.donnu.edu.ua/EDBOdata/EDBOPersonToFMASService.asmx';
  defSvc  = 'EDBOPerson';
  defPrt  = 'EDBOPersonSoap';
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
    Result := (RIO as EDBOPersonSoap);
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


destructor dLastError.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dQualification.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FQualificationDateLastChange) then
    FQualificationDateLastChange.Free;
  inherited Destroy;
end;

destructor dPersonRequestSeasons.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FDateBeginPersonRequestSeason) then
    FDateBeginPersonRequestSeason.Free;
  if Assigned(FDateEndPersonRequestSeason) then
    FDateEndPersonRequestSeason.Free;
  inherited Destroy;
end;

destructor dPersonEducationFormsGet.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonAddRet.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonsIds.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FDateLastChange) then
    FDateLastChange.Free;
  inherited Destroy;
end;

destructor dPersonContacts.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonsFind.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonNameDateBegin) then
    FPersonNameDateBegin.Free;
  if Assigned(FPersonNameDateEnd) then
    FPersonNameDateEnd.Free;
  if Assigned(FPasportDate) then
    FPasportDate.Free;
  if Assigned(FAtestatDate) then
    FAtestatDate.Free;
  inherited Destroy;
end;

destructor dPersonsFind2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonNameDateBegin) then
    FPersonNameDateBegin.Free;
  if Assigned(FPersonNameDateEnd) then
    FPersonNameDateEnd.Free;
  if Assigned(FPasportDate) then
    FPasportDate.Free;
  if Assigned(FAtestatDate) then
    FAtestatDate.Free;
  inherited Destroy;
end;

destructor dCountries.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dLanguages.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonsStudentsGrups.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonsStudentsGrups2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonSOAPPhoto.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonPhotoDateLastChange) then
    FPersonPhotoDateLastChange.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryTypes.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryOrdersStatuses.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryOrders.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FPersonEducationHistoryOrdersDateLastChange) then
    FPersonEducationHistoryOrdersDateLastChange.Free;
  if Assigned(FRegulationDocumentVerificationHistoryDateLastChange) then
    FRegulationDocumentVerificationHistoryDateLastChange.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryOrders2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FPersonEducationHistoryOrdersDateLastChange) then
    FPersonEducationHistoryOrdersDateLastChange.Free;
  if Assigned(FRegulationDocumentVerificationHistoryDateLastChange) then
    FRegulationDocumentVerificationHistoryDateLastChange.Free;
  inherited Destroy;
end;

destructor dPersonDocumentTypes.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonDocuments.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  if Assigned(FDocumentExpiredDate) then
    FDocumentExpiredDate.Free;
  if Assigned(FPersonDocumentBegin) then
    FPersonDocumentBegin.Free;
  if Assigned(FPersonDocumentEnd) then
    FPersonDocumentEnd.Free;
  if Assigned(FAtestatValue) then
    FAtestatValue.Free;
  inherited Destroy;
end;

destructor dPersonDocuments2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  if Assigned(FDocumentExpiredDate) then
    FDocumentExpiredDate.Free;
  if Assigned(FPersonDocumentBegin) then
    FPersonDocumentBegin.Free;
  if Assigned(FPersonDocumentEnd) then
    FPersonDocumentEnd.Free;
  if Assigned(FAtestatValue) then
    FAtestatValue.Free;
  inherited Destroy;
end;

destructor dPersonEducations.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  inherited Destroy;
end;

destructor dPersonEducations2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryOrdersData.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryOrdersData2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistoryOrdersChangeFIOData.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  if Assigned(FFIODateChange) then
    FFIODateChange.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistory.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FDateLastChange) then
    FDateLastChange.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FPersonEducationHistoryDateEnd) then
    FPersonEducationHistoryDateEnd.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  inherited Destroy;
end;

destructor dPersonEducationHistory2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FDateLastChange) then
    FDateLastChange.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FPersonEducationHistoryDateEnd) then
    FPersonEducationHistoryDateEnd.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  inherited Destroy;
end;

destructor dPersonAddresses.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonHomeAddressDetaeBegin) then
    FPersonHomeAddressDetaeBegin.Free;
  if Assigned(FPersonHomeAddressDetaeEnd) then
    FPersonHomeAddressDetaeEnd.Free;
  inherited Destroy;
end;

destructor dPersonAddresses2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonHomeAddressDetaeBegin) then
    FPersonHomeAddressDetaeBegin.Free;
  if Assigned(FPersonHomeAddressDetaeEnd) then
    FPersonHomeAddressDetaeEnd.Free;
  inherited Destroy;
end;

destructor dPersonTypeDictGet.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FDateLastChange) then
    FDateLastChange.Free;
  inherited Destroy;
end;

destructor dPersonRequests.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversitySpecialitiesDateBegin) then
    FUniversitySpecialitiesDateBegin.Free;
  if Assigned(FUniversitySpecialitiesDateEnd) then
    FUniversitySpecialitiesDateEnd.Free;
  if Assigned(FKonkursValue) then
    FKonkursValue.Free;
  if Assigned(FKonkursValueCorrectValue) then
    FKonkursValueCorrectValue.Free;
  if Assigned(FEntrantDocumentDateGet) then
    FEntrantDocumentDateGet.Free;
  if Assigned(FEntrantDocumentValue) then
    FEntrantDocumentValue.Free;
  inherited Destroy;
end;

destructor dPersonRequests2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FUniversitySpecialitiesDateBegin) then
    FUniversitySpecialitiesDateBegin.Free;
  if Assigned(FUniversitySpecialitiesDateEnd) then
    FUniversitySpecialitiesDateEnd.Free;
  if Assigned(FKonkursValue) then
    FKonkursValue.Free;
  if Assigned(FKonkursValueCorrectValue) then
    FKonkursValueCorrectValue.Free;
  if Assigned(FEntrantDocumentDateGet) then
    FEntrantDocumentDateGet.Free;
  if Assigned(FEntrantDocumentValue) then
    FEntrantDocumentValue.Free;
  if Assigned(FDateCreate) then
    FDateCreate.Free;
  if Assigned(FStatusDateSet) then
    FStatusDateSet.Free;
  if Assigned(FDateRegistration) then
    FDateRegistration.Free;
  inherited Destroy;
end;

destructor dPersonEducationPaymentTypes.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

destructor dPersonsStudentsGrupsPersonsFind.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  inherited Destroy;
end;

destructor dPersonsStudentsGrupsPersonsFind2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  inherited Destroy;
end;

destructor dPersonsStudentsGrupsPersons.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  inherited Destroy;
end;

destructor dPersonsStudentsGrupsPersons2.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FBirthday) then
    FBirthday.Free;
  if Assigned(FPersonEducationHistoryDateBegin) then
    FPersonEducationHistoryDateBegin.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  inherited Destroy;
end;

destructor dPersonEducationsFull.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  if Assigned(FPersonEducationDateBegin) then
    FPersonEducationDateBegin.Free;
  if Assigned(FPersonEducationDateEnd) then
    FPersonEducationDateEnd.Free;
  if Assigned(FPersonEducationHistoryOrdersDate) then
    FPersonEducationHistoryOrdersDate.Free;
  if Assigned(FDocumentDateGet) then
    FDocumentDateGet.Free;
  inherited Destroy;
end;

destructor dPersonCountry.Destroy;
begin
  if Assigned(FExtensionData) then
    FExtensionData.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(EDBOPersonSoap), 'http://edboservice.ua/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(EDBOPersonSoap), 'http://edboservice.ua/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(EDBOPersonSoap), ioDocument);
  InvRegistry.RegisterExternalParamName(TypeInfo(EDBOPersonSoap), 'PersonsStudentsGrupsGet', 'Type_', 'Type');
  InvRegistry.RegisterExternalParamName(TypeInfo(EDBOPersonSoap), 'PersonsStudentsGrupsGet2', 'Type_', 'Type');
  RemClassRegistry.RegisterXSClass(ExtensionDataObject, 'http://edboservice.ua/', 'ExtensionDataObject');
  RemClassRegistry.RegisterXSClass(dLastError, 'http://edboservice.ua/', 'dLastError');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDLastError), 'http://edboservice.ua/', 'ArrayOfDLastError');
  RemClassRegistry.RegisterXSClass(dQualification, 'http://edboservice.ua/', 'dQualification');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDQualification), 'http://edboservice.ua/', 'ArrayOfDQualification');
  RemClassRegistry.RegisterXSClass(dPersonRequestSeasons, 'http://edboservice.ua/', 'dPersonRequestSeasons');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonRequestSeasons), 'http://edboservice.ua/', 'ArrayOfDPersonRequestSeasons');
  RemClassRegistry.RegisterXSClass(dPersonEducationFormsGet, 'http://edboservice.ua/', 'dPersonEducationFormsGet');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationFormsGet), 'http://edboservice.ua/', 'ArrayOfDPersonEducationFormsGet');
  RemClassRegistry.RegisterXSClass(dPersonAddRet, 'http://edboservice.ua/', 'dPersonAddRet');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonAddRet), 'http://edboservice.ua/', 'ArrayOfDPersonAddRet');
  RemClassRegistry.RegisterXSClass(dPersonsIds, 'http://edboservice.ua/', 'dPersonsIds');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsIds), 'http://edboservice.ua/', 'ArrayOfDPersonsIds');
  RemClassRegistry.RegisterXSClass(dPersonContacts, 'http://edboservice.ua/', 'dPersonContacts');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonContacts), 'http://edboservice.ua/', 'ArrayOfDPersonContacts');
  RemClassRegistry.RegisterXSClass(dPersonsFind, 'http://edboservice.ua/', 'dPersonsFind');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsFind), 'http://edboservice.ua/', 'ArrayOfDPersonsFind');
  RemClassRegistry.RegisterXSClass(dPersonsFind2, 'http://edboservice.ua/', 'dPersonsFind2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsFind2), 'http://edboservice.ua/', 'ArrayOfDPersonsFind2');
  RemClassRegistry.RegisterXSClass(dCountries, 'http://edboservice.ua/', 'dCountries');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDCountries), 'http://edboservice.ua/', 'ArrayOfDCountries');
  RemClassRegistry.RegisterXSClass(dLanguages, 'http://edboservice.ua/', 'dLanguages');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDLanguages), 'http://edboservice.ua/', 'ArrayOfDLanguages');
  RemClassRegistry.RegisterXSClass(dPersonsStudentsGrups, 'http://edboservice.ua/', 'dPersonsStudentsGrups');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsStudentsGrups), 'http://edboservice.ua/', 'ArrayOfDPersonsStudentsGrups');
  RemClassRegistry.RegisterXSClass(dPersonsStudentsGrups2, 'http://edboservice.ua/', 'dPersonsStudentsGrups2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsStudentsGrups2), 'http://edboservice.ua/', 'ArrayOfDPersonsStudentsGrups2');
  RemClassRegistry.RegisterXSClass(dPersonSOAPPhoto, 'http://edboservice.ua/', 'dPersonSOAPPhoto');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonSOAPPhoto), 'http://edboservice.ua/', 'ArrayOfDPersonSOAPPhoto');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryTypes, 'http://edboservice.ua/', 'dPersonEducationHistoryTypes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryTypes), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryTypes');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryOrdersStatuses, 'http://edboservice.ua/', 'dPersonEducationHistoryOrdersStatuses');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryOrdersStatuses), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryOrdersStatuses');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryOrders, 'http://edboservice.ua/', 'dPersonEducationHistoryOrders');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryOrders), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryOrders');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryOrders2, 'http://edboservice.ua/', 'dPersonEducationHistoryOrders2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryOrders2), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryOrders2');
  RemClassRegistry.RegisterXSClass(dPersonDocumentTypes, 'http://edboservice.ua/', 'dPersonDocumentTypes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonDocumentTypes), 'http://edboservice.ua/', 'ArrayOfDPersonDocumentTypes');
  RemClassRegistry.RegisterXSClass(dPersonDocuments, 'http://edboservice.ua/', 'dPersonDocuments');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonDocuments), 'http://edboservice.ua/', 'ArrayOfDPersonDocuments');
  RemClassRegistry.RegisterXSClass(dPersonDocuments2, 'http://edboservice.ua/', 'dPersonDocuments2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonDocuments2), 'http://edboservice.ua/', 'ArrayOfDPersonDocuments2');
  RemClassRegistry.RegisterXSClass(dPersonEducations, 'http://edboservice.ua/', 'dPersonEducations');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducations), 'http://edboservice.ua/', 'ArrayOfDPersonEducations');
  RemClassRegistry.RegisterXSClass(dPersonEducations2, 'http://edboservice.ua/', 'dPersonEducations2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducations2), 'http://edboservice.ua/', 'ArrayOfDPersonEducations2');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryOrdersData, 'http://edboservice.ua/', 'dPersonEducationHistoryOrdersData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryOrdersData), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryOrdersData');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryOrdersData2, 'http://edboservice.ua/', 'dPersonEducationHistoryOrdersData2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryOrdersData2), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryOrdersData2');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistoryOrdersChangeFIOData, 'http://edboservice.ua/', 'dPersonEducationHistoryOrdersChangeFIOData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistoryOrdersChangeFIOData), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistoryOrdersChangeFIOData');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistory, 'http://edboservice.ua/', 'dPersonEducationHistory');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistory), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistory');
  RemClassRegistry.RegisterXSClass(dPersonEducationHistory2, 'http://edboservice.ua/', 'dPersonEducationHistory2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationHistory2), 'http://edboservice.ua/', 'ArrayOfDPersonEducationHistory2');
  RemClassRegistry.RegisterXSClass(dPersonAddresses, 'http://edboservice.ua/', 'dPersonAddresses');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(dPersonAddresses), 'Type_', 'Type');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonAddresses), 'http://edboservice.ua/', 'ArrayOfDPersonAddresses');
  RemClassRegistry.RegisterXSClass(dPersonAddresses2, 'http://edboservice.ua/', 'dPersonAddresses2');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(dPersonAddresses2), 'Type_', 'Type');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonAddresses2), 'http://edboservice.ua/', 'ArrayOfDPersonAddresses2');
  RemClassRegistry.RegisterXSClass(dPersonTypeDictGet, 'http://edboservice.ua/', 'dPersonTypeDictGet');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonTypeDictGet), 'http://edboservice.ua/', 'ArrayOfDPersonTypeDictGet');
  RemClassRegistry.RegisterXSClass(dPersonRequests, 'http://edboservice.ua/', 'dPersonRequests');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonRequests), 'http://edboservice.ua/', 'ArrayOfDPersonRequests');
  RemClassRegistry.RegisterXSClass(dPersonRequests2, 'http://edboservice.ua/', 'dPersonRequests2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonRequests2), 'http://edboservice.ua/', 'ArrayOfDPersonRequests2');
  RemClassRegistry.RegisterXSClass(dPersonEducationPaymentTypes, 'http://edboservice.ua/', 'dPersonEducationPaymentTypes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationPaymentTypes), 'http://edboservice.ua/', 'ArrayOfDPersonEducationPaymentTypes');
  RemClassRegistry.RegisterXSClass(dPersonsStudentsGrupsPersonsFind, 'http://edboservice.ua/', 'dPersonsStudentsGrupsPersonsFind');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsStudentsGrupsPersonsFind), 'http://edboservice.ua/', 'ArrayOfDPersonsStudentsGrupsPersonsFind');
  RemClassRegistry.RegisterXSClass(dPersonsStudentsGrupsPersonsFind2, 'http://edboservice.ua/', 'dPersonsStudentsGrupsPersonsFind2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsStudentsGrupsPersonsFind2), 'http://edboservice.ua/', 'ArrayOfDPersonsStudentsGrupsPersonsFind2');
  RemClassRegistry.RegisterXSClass(dPersonsStudentsGrupsPersons, 'http://edboservice.ua/', 'dPersonsStudentsGrupsPersons');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsStudentsGrupsPersons), 'http://edboservice.ua/', 'ArrayOfDPersonsStudentsGrupsPersons');
  RemClassRegistry.RegisterXSClass(dPersonsStudentsGrupsPersons2, 'http://edboservice.ua/', 'dPersonsStudentsGrupsPersons2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonsStudentsGrupsPersons2), 'http://edboservice.ua/', 'ArrayOfDPersonsStudentsGrupsPersons2');
  RemClassRegistry.RegisterXSClass(dPersonEducationsFull, 'http://edboservice.ua/', 'dPersonEducationsFull');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonEducationsFull), 'http://edboservice.ua/', 'ArrayOfDPersonEducationsFull');
  RemClassRegistry.RegisterXSClass(dPersonCountry, 'http://edboservice.ua/', 'dPersonCountry');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDPersonCountry), 'http://edboservice.ua/', 'ArrayOfDPersonCountry');

end.