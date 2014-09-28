unit dmUpReportCard;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet,   IBase,
  frxDesgn, frxClass, frxDBSet, frxExportHTML, frxExportXLS, frxExportRTF;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    CardDataSet: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    RegardDataSet: TpFIBDataSet;
    MovingsDataSet: TpFIBDataSet;
    StajDataSet: TpFIBDataSet;
    HolydaysDataSet: TpFIBDataSet;
    CardDS: TfrxDBDataset;
    RegardDS: TfrxDBDataset;
    StajDS: TfrxDBDataset;
    MovingsDS: TfrxDBDataset;
    HolydaysDS: TfrxDBDataset;
    RegardDataSetREG_GROUP: TFIBStringField;
    RegardDataSetUCH_STEP: TFIBStringField;
    RegardDataSetN_DIPL: TFIBStringField;
    RegardDataSetDATE_BEG_R: TFIBDateField;
    StajDataSetDATE_CALC: TFIBDateField;
    StajDataSetNAME_STAJ: TFIBStringField;
    StajDataSetCALC_YEARS: TFIBIntegerField;
    StajDataSetCALC_MONTH: TFIBIntegerField;
    StajDataSetCALC_DAYS: TFIBIntegerField;
    MovingsDataSetDEPARTMENT_NAME: TFIBStringField;
    MovingsDataSetPOST: TFIBStringField;
    MovingsDataSetOSN_R: TFIBStringField;
    MovingsDataSetPERIOD: TFIBStringField;
    MovingsDataSetACCEPT_COND: TFIBStringField;
    MovingsDataSetOSNOV_N: TFIBStringField;
    HolydaysDataSetNAME_HOLIDAY: TFIBStringField;
    HolydaysDataSetPERIOD_H: TFIBStringField;
    HolydaysDataSetH_TERM: TFIBIntegerField;
    HolydaysDataSetDATE_BEG_H: TFIBDateField;
    HolydaysDataSetDATE_END_H: TFIBDateField;
    HolydaysDataSetOSNOV_H: TFIBStringField;
    CardDataSetCARD_NUMBER: TFIBIntegerField;
    CardDataSetRUS_FAMILIA: TFIBStringField;
    CardDataSetRUS_IMYA: TFIBStringField;
    CardDataSetRUS_OTCHESTVO: TFIBStringField;
    CardDataSetFAMILIA: TFIBStringField;
    CardDataSetIMYA: TFIBStringField;
    CardDataSetOTCHESTVO: TFIBStringField;
    CardDataSetBIRTH_DATE: TFIBDateField;
    CardDataSetADR_BIRTH: TFIBStringField;
    CardDataSetSEX: TFIBStringField;
    CardDataSetNAME_NATIONALITY: TFIBStringField;
    CardDataSetTIN: TFIBStringField;
    CardDataSetSOC_CARD_NUMBER: TFIBStringField;
    CardDataSetNAME_PENSION: TFIBStringField;
    CardDataSetDATE_BEG: TFIBDateField;
    CardDataSetNOTE: TFIBStringField;
    CardDataSetEDUC_TYPE: TFIBStringField;
    CardDataSetEDUC_VUZ: TFIBStringField;
    CardDataSetDATE_END: TFIBDateField;
    CardDataSetDIPLOM_NUMBER: TFIBStringField;
    CardDataSetDIPLOM_DATE: TFIBDateField;
    CardDataSetEDUC_SPEC: TFIBStringField;
    CardDataSetEDUC_KVAL: TFIBStringField;
    CardDataSetNIR: TFIBStringField;
    CardDataSetEDUCATION: TFIBStringField;
    CardDataSetDISCIPLINE: TFIBStringField;
    CardDataSetCAME_FROM: TFIBStringField;
    CardDataSetDATA_CAME: TFIBDateField;
    CardDataSetNAME_FLANG: TFIBStringField;
    CardDataSetSTATUS: TFIBStringField;
    CardDataSetIGDIV: TFIBIntegerField;
    CardDataSetPASS_SN: TFIBStringField;
    CardDataSetPASS_VIDAN: TFIBStringField;
    CardDataSetPASS_DATE: TFIBDateField;
    CardDataSetADR: TFIBStringField;
    CardDataSetTELEPHONE: TFIBStringField;
    RTFExport: TfrxRTFExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    Designer: TfrxDesigner;
    Report: TfrxReport;
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
