unit DM_StudImportInfo;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDatabase,
  pFIBDatabase, RxMemDS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSource_EdboStud: TDataSource;
    RxMemoryDataPeople: TRxMemoryData;
    StorProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    RxMem_EdboStud: TRxMemoryData;
    RxMem_EdboStudId_PersonEducation: TIntegerField;
    RxMem_EdboStudId_PersonEducationForm: TIntegerField;
    RxMem_EdboStudPersonEducationFormName: TStringField;
    RxMem_EdboStudPersonEducationDateBegin: TDateField;
    RxMem_EdboStudPersonEducationDateEnd: TDateField;
    RxMem_EdboStudUniversityFacultetKode: TStringField;
    RxMem_EdboStudUniversityFacultetFullName: TStringField;
    RxMem_EdboStudQualificationName: TStringField;
    RxMem_EdboStudPersonCodeU: TStringField;
    RxMem_EdboStudFIO: TStringField;
    RxMem_EdboStudCourseName: TStringField;
    RxMem_EdboStudId_PersonEducationHistoryOrders: TIntegerField;
    RxMem_EdboStudPersonEducationHistoryOrdersNum: TStringField;
    RxMem_EdboStudPersonEducationHistoryOrdDate: TDateField;
    RxMem_EdboStudUniversityGroupFullName: TStringField;
    RxMem_EdboStudSpecSpecialityName: TStringField;
    RxMem_EdboStudId_PersonEducationPaymentType: TIntegerField;
    RxMem_EdboStudId_Course: TIntegerField;
    RxMem_EdboStudId_Qualification: TIntegerField;
    RxMem_EdboStudSpecCode: TStringField;
    RxMem_EdboStudIsSecondHigher: TIntegerField;
    RxMem_EdboStudId_UniversityGroup: TIntegerField;
    RxMem_EdboStudId_PersonEducationHistoryType: TIntegerField;
    RxMem_EdboStudIs_SyncWithDB: TBooleanField;
    RxMem_EdboStudFirstname: TStringField;
    RxMem_EdboStudLastName: TStringField;
    RxMem_EdboStudMiddleName: TStringField;
    RxMem_EdboStudFPasportNumber: TStringField;
    RxMem_EdboStudPasportSeries: TStringField;
    RxMem_EdboStudPasportIssued: TStringField;
    RxMem_EdboStudId_Person: TIntegerField;
    RxMem_EdboStudPasportDate: TDateTimeField;
    RxMem_EdboStudId_PersonSex: TIntegerField;
    RxMem_EdboStudBirthday: TDateTimeField;
    RxMem_EdboStudResident: TIntegerField;
    RxMem_EdboStudInn: TStringField;
    SyncStorProc: TpFIBStoredProc;
    SyncTrans: TpFIBTransaction;
    MemoryDataSeasons: TRxMemoryData;
    MemoryDataSeasonsId_PersonRequestSeasons: TIntegerField;
    MemoryDataSeasonsNameSeasons: TStringField;
    DataSourceSeason: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
