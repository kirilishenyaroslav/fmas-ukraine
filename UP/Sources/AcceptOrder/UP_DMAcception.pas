unit UP_DMAcception;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TUPAcceptDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Smets: TpFIBDataSet;
    KeySessionGenerate: TpFIBDataSet;
    GetFreeFunds: TpFIBDataSet;
    GetFreeFundsID_SR: TFIBIntegerField;
    GetFreeFundsKOEFF_PPS: TFIBFloatField;
    GetFreeFundsOKLAD: TFIBFloatField;
    GetFreeFundsOKLAD_PPS: TFIBFloatField;
    GetFreeFundsID_SMETA: TFIBIntegerField;
    GetFreeFundsID_SMETA_PPS: TFIBIntegerField;
    GetFreeFundsSMETA_TITLE: TFIBStringField;
    GetFreeFundsSMETA_PPS_TITLE: TFIBStringField;
    GetFreeFundsSMETA_KOD: TFIBIntegerField;
    GetFreeFundsSMETA_PPS_KOD: TFIBIntegerField;
    GetFreeFundsSR_NAME: TFIBStringField;
    GetFreeFundsID_WORK_COND: TFIBIntegerField;
    GetFreeFundsNAME_WORK_COND: TFIBStringField;
    GetFreeFundsID_WORK_MODE: TFIBIntegerField;
    GetFreeFundsNAME_WORK_MODE: TFIBStringField;
    GetMinLevel: TpFIBDataSet;
    GetFreeFundsSMETA_FULL_TITLE: TFIBStringField;
    GetFreeFundsSMETA_PPS_FULL_TITLE: TFIBStringField;
    FreeFundsSource: TDataSource;
    PostSalarySelect: TpFIBDataSet;
    PostSalarySelectID_POST_SALARY: TFIBBCDField;
    PostSalarySelectPOST_NAME: TFIBStringField;
    PostSalarySelectSALARY_MIN: TFIBFloatField;
    PostSalarySelectSALARY_MAX: TFIBFloatField;
    PostSalarySelectDISPLAY_NAME: TFIBStringField;
    PostSalarySelectADD_NAME: TFIBStringField;
    PostSalarySelectNUM_DIGIT: TFIBIntegerField;
    SelectTypePost: TpFIBDataSet;
    SelectTypePostID_TYPE_POST: TFIBIntegerField;
    SelectTypePostNAME_TYPE_POST: TFIBStringField;
    PostSalarySelectNAME_TYPE_POST: TFIBStringField;
    CopyIntoBuffer: TpFIBDataSet;
    KernelErrors: TpFIBDataSet;
    KernelErrorsID_ERROR: TFIBBCDField;
    KernelErrorsERROR_CODE: TFIBIntegerField;
    KernelErrorsERROR_TEXT: TFIBStringField;
    GetItems: TpFIBDataSet;
    SmetsID_SMET: TFIBBCDField;
    SmetsID_SMET_PPS: TFIBBCDField;
    SmetsOKLAD_PPS: TFIBFloatField;
    SmetsKOEFF_PPS: TFIBFloatField;
    SmetsID_ORDER_ITEM: TFIBBCDField;
    SmetsID_REC: TFIBBCDField;
    SmetsSMETA_NAME: TFIBStringField;
    SmetsDATE_BEG: TFIBDateField;
    SmetsDATE_END: TFIBDateField;
    SmetsSMETA_PPS_NAME: TFIBStringField;
    SmetsOKLAD_BASE2: TFIBFloatField;
    SmetsDATES_STR: TFIBStringField;
    GetSalary: TpFIBDataSet;
    ManSmetReform: TpFIBQuery;
    CheckValidOklad: TpFIBDataSet;
    AcceptBonusSelect: TpFIBDataSet;
    AcceptBonusSource: TDataSource;
    AcceptBonusSelectDATE_BEG: TFIBDateField;
    AcceptBonusSelectDATE_END: TFIBDateField;
    AcceptBonusSelectPERCENT: TFIBFloatField;
    AcceptBonusSelectSUMMA: TFIBBCDField;
    AcceptBonusSelectRAISE_NAME: TFIBStringField;
    AcceptBonusSelectBONUS_SUMMA: TFIBFloatField;
    AcceptBonusSelectBONUS_SUMMA_PPS: TFIBFloatField;
    AcceptBonusSelectSMETA_TITLE: TFIBStringField;
    AcceptBonusSelectSMETA_PPS_TITLE: TFIBStringField;
    AcceptBonusSelectDATES_STR: TFIBStringField;
    RaiseDefaults: TpFIBDataSet;
    AcceptBonusSelectID_RAISE: TFIBIntegerField;
    WorkReasonSelect: TpFIBDataSet;
    ClearBuffQuery: TpFIBQuery;
    UPConsts: TpFIBDataSet;
    IniAwayType: TpFIBDataSet;
    AwayInfo: TpFIBDataSet;
    FreeFundsTransaction: TpFIBTransaction;
    DeleteManSmet: TpFIBQuery;
    PostSalarySelectSMETA_FULL_TITLE: TFIBStringField;
    AcceptSet: TpFIBDataSet;
    WMByPeriodSet: TpFIBDataSet;
    GetWorkMode: TpFIBDataSet;
    DSetShowInfo: TpFIBDataSet;
    PostSalarySelectId_Work_Mode: TIntegerField;
    PostSalarySelectCount_Day: TIntegerField;
    GetFreeFundsNum_Digit: TIntegerField;
    PostSalarySelectSalary_Max_Str: TStringField;
    GetFreeFundsOklad_Str: TStringField;
    DSetTemp: TpFIBDataSet;
    PostSalarySelectid_pay_form: TIntegerField;
    PostSalarySelectid_work_cond: TIntegerField;
    DsetIdShr: TpFIBDataSet;
    ShrTrans: TpFIBTransaction;
    ShrProc: TpFIBStoredProc;
    IdShRSelect: TpFIBDataSet;
    SmetShR: TpFIBDataSet;
    AcceptBonusSelectID_REC: TFIBBCDField;
    BonusStoredProc: TpFIBStoredProc;
    SelectTypePostIS_PED_WORK: TFIBSmallIntField;
    SmetsRATE_COUNT: TFIBBCDField;
    SmetsHOURS_COUNT: TFIBFloatField;
    GetFreeFundsKOL_STAVOK: TFIBBCDField;
    GetFreeFundsKOL_VACANT_STAVOK: TFIBFloatField;
  private
    { Private declarations }
  public
    BonusChanged: Boolean;
  end;

implementation

{$R *.dfm}

end.
