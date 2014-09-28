unit dmMain;

interface

uses
  SysUtils, Classes, DB, DBTables,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc;

type
  TdmMatas = class(TDataModule)
    fdbMatas: TpFIBDatabase;
    ftrReadTransaction: TpFIBTransaction;
    ftrWriteTransaction: TpFIBTransaction;
    IniDataSet: TpFIBDataSet;
    IniDataSetDATE_REC: TFIBDateField;
    MatasStoredProc: TpFIBStoredProc;
    SetDataSet: TpFIBDataSet;
    SetDataSetSYSTEM_LANG: TFIBIntegerField;
    SetDataSetSAVE_USER_PARAMS: TFIBBooleanField;
    SetDataSetSAVE_HISTORY: TFIBIntegerField;
    SetDataSetSAVE_OWNER: TFIBIntegerField;
    SetDataSetPRINT_LANG: TFIBIntegerField;
    SetDataSetPRINT_ON_PRINTER: TFIBBooleanField;
    SetDataSetEDIT_TEMPLATE: TFIBBooleanField;
    SetDataSetPOS_MODAL_WINDOW: TFIBBooleanField;
    SetDataSetCLOSE_WINDOW_ESC: TFIBBooleanField;
    SetDataSetSAVE_GROUP: TFIBBooleanField;
    SetDataSetUPPER_KOD: TFIBBooleanField;
    SetDataSetUPPER_SHORT_NAME: TFIBBooleanField;
    SetDataSetUPPER_NAME: TFIBBooleanField;
    SetDataSetUPPER_DOC_NUMBER: TFIBBooleanField;
    SetDataSetALLOW_EDIT_OWNER: TFIBBooleanField;
    SetDataSetSET_DATE_DOC: TFIBIntegerField;
    SetDataSetALLOW_DUP_NUMBER: TFIBBooleanField;
    SetDataSetAUTO_DOC_NUMBER: TFIBBooleanField;
    SetDataSetID: TFIBIntegerField;
    IniDataSetID_MAT_DEP_PROP: TFIBIntegerField;
    IniDataSetID_SKL_DEP_PROP: TFIBIntegerField;
    IniDataSetSHOW_EXCEPTIONS: TFIBBooleanField;
    IniDataSetDATE_OST_REC: TFIBDateField;
    IniDataSetMAX_DEP_DATE: TFIBDateField;
    IniDataSetMAT_ID_SYSTEM: TFIBIntegerField;
    IniDataSetUSE_DEFAULT_ISTFIN: TFIBBooleanField;
    IniDataSetTYPE_ACCOUNT: TFIBSmallIntField;
    IniDataSetID_DEP_ROOT: TFIBBCDField;
    IniDataSetID_SCH_ROOT: TFIBBCDField;
    IniDataSetBEG_DATE_REC: TFIBDateField;
    IniDataSetTYPE_SUB_SCH: TFIBSmallIntField;
    IniDataSetSCH_IN_DOC: TFIBBooleanField;
    IniDataSetSCH_PROP_IZNOS: TFIBBCDField;
    IniDataSetSCH_PROP_MOL: TFIBBCDField;
    IniDataSetSCH_PROP_SKLAD: TFIBBCDField;
    IniDataSetSCH_PROP_OS: TFIBBCDField;
    IniDataSetSCH_PROP_MNA: TFIBBCDField;
    IniDataSetSCH_PROP_MAT: TFIBBCDField;
    IniDataSetGROUP_DOG_SELECT: TFIBBCDField;
    IniDataSetGROUP_DOG_ADD: TFIBBCDField;
    IniDataSetMNA_INV_ACC: TFIBIntegerField;
    IniDataSetMBP_INV_ACC: TFIBIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMatas: TdmMatas;

implementation


{$R *.dfm}

end.
