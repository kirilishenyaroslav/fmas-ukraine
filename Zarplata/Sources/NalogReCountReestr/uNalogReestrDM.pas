unit uNalogReestrDM;

interface

uses  
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxClasses, cxStyles,
  cxGridTableView, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc;

type
  TNalogReestrDM = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ReestrDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    ReestrDataSetID_REESTR: TFIBIntegerField;
    ReestrDataSetDATE_REG: TFIBDateField;
    ReestrDataSetYEAR_SET: TFIBIntegerField;
    ReestrDataSetCOUNT: TFIBIntegerField;
    DataSource: TDataSource;
    PrintDataSet: TpFIBDataSet;
    PrintDataSetID_REESTR: TFIBIntegerField;
    PrintDataSetTN: TFIBIntegerField;
    PrintDataSetNAME_DEP: TFIBStringField;
    PrintDataSetFIO: TFIBStringField;
    PrintDataSetSOV_DOHOD: TFIBBCDField;
    PrintDataSetTOTAL_UDER: TFIBBCDField;
    PrintDataSetSOC_PRIV: TFIBBCDField;
    PrintDataSetUDER: TFIBBCDField;
    PrintDataSetNAL_DOHOD: TFIBBCDField;
    PrintDataSetNAL_NEW: TFIBBCDField;
    PrintDataSetNAL_FACT: TFIBBCDField;
    PrintDataSetVOZVR: TFIBBCDField;
    PrintDataSetDOPL: TFIBBCDField;
    PrintDataSetKOL_MONTH: TFIBIntegerField;
    PrintDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    FillCurrentProc: TpFIBStoredProc;
    DeleteReestrSP: TpFIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NalogReestrDM: TNalogReestrDM;

implementation

{$R *.dfm}

end.
