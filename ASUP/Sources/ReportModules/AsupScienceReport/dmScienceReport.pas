unit dmScienceReport;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TScienceReportDM = class(TDataModule)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReportDataSource: TDataSource;
    ReportDataSet: TpFIBDataSet;
    ConstsQuery: TpFIBDataSet;
    ConstsQueryUSE_END: TFIBDateTimeField;
    ConstsQueryDATE_END: TFIBDateField;
    ConstsQueryFIRM_NAME: TFIBStringField;
    ConstsQueryDATE_BEG: TFIBDateField;
    ConstsQueryFIRM_EDRPOU: TFIBStringField;
    ConstsQueryFIRM_UKUD: TFIBStringField;
    ConstsQueryPASS_AGE: TFIBIntegerField;
    ConstsQueryEDUC_AGE: TFIBIntegerField;
    ConstsQueryCURRENT_DEPARTMENT: TFIBIntegerField;
    ConstsQueryCURRENT_BUHG_DEPARTMENT: TFIBIntegerField;
    ConstsQueryLAST_BEG_LOG_DATE: TFIBDateTimeField;
    ConstsQueryLAST_END_LOG_DATE: TFIBDateTimeField;
    ConstsQueryMAN_PENS_AGE: TFIBIntegerField;
    ConstsQueryWOMAN_PENS_AGE: TFIBIntegerField;
    ConstsQueryDEFAULT_NIGHT_BEG: TFIBTimeField;
    ConstsQueryDEFAULT_NIGHT_END: TFIBTimeField;
    ConstsQuerySHIFT_BEGIN: TFIBDateField;
    ConstsQueryBONUS1: TFIBIntegerField;
    ConstsQueryBONUS2: TFIBIntegerField;
    ConstsQueryBONUS1_ABBR: TFIBStringField;
    ConstsQueryBONUS2_ABBR: TFIBStringField;
    ConstsQueryCITY: TFIBStringField;
    ConstsQueryCONT_STAJ_MONTH: TFIBIntegerField;
    ConstsQueryLOCAL_DEPARTMENT: TFIBIntegerField;
    ConstsQueryORDERS_HEADER: TFIBStringField;
    ConstsQueryDB_VERSION: TFIBIntegerField;
    ConstsQueryDEFAULT_PAY_FORM: TFIBIntegerField;
    ConstsQueryDEFAULT_WORK_COND: TFIBIntegerField;
    ConstsQueryDEFAULT_WORK_MODE: TFIBIntegerField;
    ConstsQueryRAISE_TYPE_FOR_OKLAD: TFIBIntegerField;
    ConstsQueryBONUS_CALC: TFIBIntegerField;
    ConstsQueryNEW_ORDERS: TFIBStringField;
    ConstsQueryUSE_MOVING_SMET: TFIBIntegerField;
    ConstsQueryVIZA_REQUIRED_IN_ORDERS: TFIBStringField;
    ConstsQueryID_VIDOPL: TFIBIntegerField;
    ConstsQueryDEFAULT_SMETA: TFIBIntegerField;
    ConstsQueryAPPRENTICE_MOVING_TYPE: TFIBIntegerField;
    ConstsQueryHIDDEN_ID_POST: TFIBIntegerField;
    ConstsQueryID_DOG_FOR_COMAND: TFIBIntegerField;
    ConstsQueryTABLE_WORK_DAYS_SMENA: TFIBIntegerField;
    ConstsQueryGLOBAL_ROOT: TFIBIntegerField;
    ConstsQueryALLOW_EMPTY_SMETS_IN_ORDERS: TFIBStringField;
    ReportDataSetREGARDS_STEP: TFIBStringField;
    ReportDataSetREGARDS_ZVAN: TFIBStringField;
    ReportDataSetSCIENCE_SPEC: TFIBStringField;
    ReportDataSetFIO: TFIBStringField;
    ReportDataSetDEPARTMENT_NAME: TFIBStringField;
    ReportDataSetDEPARTMENT_NAME_UPPER: TFIBStringField;
    RegardsPropertiesDataSet: TpFIBDataSet;
    RegardsPropertiesDataSetID_PROPERTIE: TFIBIntegerField;
    RegardsPropertiesDataSetPROP_NAME: TFIBStringField;
    PropertiesDataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScienceReportDM: TScienceReportDM;

implementation

{$R *.dfm}

end.