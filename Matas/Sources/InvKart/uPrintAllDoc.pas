{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uPrintAllDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMatasVars, uMatasUtils, cxLookAndFeelPainters, StdCtrls,
  cxSpinEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons,
  cxControls, cxContainer, cxEdit, cxCheckBox,
  ActnList, ImgList, DB, FIBDataSet, pFIBDataSet, FR_DSet,
  FR_DBSet, FR_Class, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  RxMemDS, ibase, FIBDatabase, pFIBDatabase, ClassInvKart, frxClass,
  frxDBSet, frxCross, MainInvKartForm, uResources, cxCalendar,DateUtils,
  frxExportRTF, frxExportXLS, frxDesgn;

type
  TfmPrintDoc = class(TForm)
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    CheckBoxDoc: TcxCheckBox;
    cxButtonChect: TcxButton;
    cxButtonClose: TcxButton;
    cxLabelChecked_Shablon: TcxLabel;
    cxCopies: TcxSpinEdit;
    LabelKol_copys: TLabel;
    ActionList1: TActionList;
    ImageListButton: TImageList;
    ActionClose: TAction;
    ActionPrint: TAction;
    DataSet_Sel_Template_Set: TpFIBDataSet;
    RxMemoryDataVirtual: TRxMemoryData;
    RxMemoryDataVirtualid_items: TIntegerField;
    RxMemoryDataVirtualId_shablona: TIntegerField;
    RxMemoryDataVirtualName_shablon: TStringField;
    DataSourceSel_Shab: TDataSource;
    RxMemoryDataVirtualtemplate: TStringField;
    pFIBDataSet_All_Selection_For_print: TpFIBDataSet;
    DataSet_inv_book: TpFIBDataSet;
    pFIBDataSetFor_Printing: TpFIBDataSet;
    DataSetOsn: TpFIBDataSet;
    DataSetDrag: TpFIBDataSet;
    DataSet_inv_sp_os: TpFIBDataSet;
    DataSet_Akt_na_spisanie: TpFIBDataSet;
    DataSetPrinting_peredachu: TpFIBDataSet;
    DataSetSellect_info_about_drag: TpFIBDataSet;
    DataSet_Sel_Template_SetTEMPLATE: TFIBStringField;
    DataSet_Sel_Template_SetNAME_SHABLON: TFIBStringField;
    DataSet_Sel_Template_SetDEF_TEMPLATE: TFIBIntegerField;
    DataSet_Sel_Template_SetID_SHAB: TFIBBCDField;
    DataSetOsnR_ID_KART: TFIBBCDField;
    DataSetOsnTIP_KRT: TFIBStringField;
    DataSetOsnGRP_NUM: TFIBStringField;
    DataSetOsnINV_NUM: TFIBStringField;
    DataSetOsnKART_NUM: TFIBIntegerField;
    DataSetOsnBEG_PRICE: TFIBBCDField;
    DataSetOsnBEG_IZNOS: TFIBBCDField;
    DataSetOsnOST_PRICE: TFIBBCDField;
    DataSetOsnOST_IZNOS: TFIBBCDField;
    DataSetOsnDATE_OST: TFIBDateField;
    DataSetOsnDATE_OPR: TFIBDateField;
    DataSetOsnID_OPER_OPR: TFIBBCDField;
    DataSetOsnDATE_EXPL: TFIBDateField;
    DataSetOsnID_OPER_EXPL: TFIBBCDField;
    DataSetOsnDATE_UPDATE: TFIBDateField;
    DataSetOsnID_OPER_UPDATE: TFIBBCDField;
    DataSetOsnDATE_OUT: TFIBDateField;
    DataSetOsnID_OPER_OUT: TFIBBCDField;
    DataSetOsnZAV_NUM: TFIBStringField;
    DataSetOsnPASS_NUM: TFIBStringField;
    DataSetOsnMODEL: TFIBStringField;
    DataSetOsnMARK: TFIBStringField;
    DataSetOsnDATE_CREATE: TFIBDateField;
    DataSetOsnID_CUST: TFIBBCDField;
    DataSetOsnDOC_REG: TFIBStringField;
    DataSetOsnDATE_REG: TFIBDateField;
    DataSetOsnNOTE: TFIBStringField;
    DataSetOsnNAME_NORM: TFIBStringField;
    DataSetOsnAMORT_PERC: TFIBFloatField;
    DataSetOsnMIN_PRICE: TFIBBCDField;
    DataSetOsnMETHOD_NAME: TFIBStringField;
    DataSetOsnNORM_TIP: TFIBSmallIntField;
    DataSetOsnNORM_FORMULA: TFIBStringField;
    DataSetOsnBUH_DB_SCH: TFIBStringField;
    DataSetOsnBUH_KR_SCH: TFIBStringField;
    DataSetOsnNORM_YEAR: TFIBSmallIntField;
    DataSetOsnNORM_MONTH: TFIBSmallIntField;
    DataSetOsnNORM_ID: TFIBBCDField;
    DataSetOsnNORM_PER_PERIOD: TFIBSmallIntField;
    DataSetOsnIS_NALOG_ACC: TFIBSmallIntField;
    DataSetOsnNAL_NAME_NORM: TFIBStringField;
    DataSetOsnNAL_AMORT_PERC: TFIBFloatField;
    DataSetOsnNAL_MIN_PRICE: TFIBBCDField;
    DataSetOsnNAL_METHOD_NAME: TFIBStringField;
    DataSetOsnNAL_NORM_TIP: TFIBSmallIntField;
    DataSetOsnNAL_NORM_FORMULA: TFIBStringField;
    DataSetOsnNAL_DB_SCH: TFIBStringField;
    DataSetOsnNAL_KR_SCH: TFIBStringField;
    DataSetOsnNAL_NORM_YEAR: TFIBSmallIntField;
    DataSetOsnNAL_NORM_MONTH: TFIBSmallIntField;
    DataSetOsnNAL_NORM_ID: TFIBBCDField;
    DataSetOsnNAL_NORM_PER_PERIOD: TFIBSmallIntField;
    DataSetOsnKOL_OBJ: TFIBBCDField;
    DataSetOsnNAME_MATER: TFIBStringField;
    DataSetOsnSIZE_OBJ: TFIBStringField;
    DataSetOsnCOEFF_OBJ: TFIBBCDField;
    DataSetOsnSUMM_OBJ: TFIBBCDField;
    DataSetOsnNOTE_OBJ: TFIBStringField;
    DataSetOsnID_BUH_DB: TFIBBCDField;
    DataSetOsnID_BUH_KR: TFIBBCDField;
    DataSetOsnID_NAL_DB: TFIBBCDField;
    DataSetOsnID_NAL_KR: TFIBBCDField;
    DataSetOsnID_METHD: TFIBBCDField;
    DataSetOsnID_METHD_NAL: TFIBBCDField;
    DataSetOsnOBJ_NAME_NOMN: TFIBStringField;
    DataSetOsnOBJ_ID: TFIBBCDField;
    DataSetOsnOBJ_ID_NOMN: TFIBBCDField;
    DataSetOsnID_NOM_MAIN: TFIBBCDField;
    DataSetOsnPERIOD: TFIBDateField;
    DataSetDragR_ID_METALL: TFIBBCDField;
    DataSetDragDRAG_KOL: TFIBBCDField;
    DataSetDragDRAG_NAME: TFIBStringField;
    DataSetDragDRAG_SHORT: TFIBStringField;
    DataSetDragID_FOR_DEL: TFIBBCDField;
    DataSetSellect_info_about_dragID_INV_KART: TFIBBCDField;
    DataSetSellect_info_about_dragID_MET: TFIBBCDField;
    DataSetSellect_info_about_dragKOL_MET: TFIBBCDField;
    DataSetSellect_info_about_dragNAME: TFIBStringField;
    DataSetSellect_info_about_dragINV_NUM_FULL: TFIBStringField;
    DataSetSellect_info_about_dragSFIO: TFIBStringField;
    DataSetSellect_info_about_dragNAMENOMN: TFIBStringField;
    DataSetSellect_info_about_dragID_MO: TFIBBCDField;
    pFIBDataSetFor_PrintingR_ID_KART: TFIBBCDField;
    pFIBDataSetFor_PrintingTIP_KRT: TFIBStringField;
    pFIBDataSetFor_PrintingGRP_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingINV_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingKART_NUM: TFIBIntegerField;
    pFIBDataSetFor_PrintingBEG_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingBEG_IZNOS: TFIBBCDField;
    pFIBDataSetFor_PrintingOST_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingOST_IZNOS: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_OST: TFIBDateField;
    pFIBDataSetFor_PrintingDATE_OPR: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_OPR: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_EXPL: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_EXPL: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_UPDATE: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_UPDATE: TFIBBCDField;
    pFIBDataSetFor_PrintingDATE_OUT: TFIBDateField;
    pFIBDataSetFor_PrintingID_OPER_OUT: TFIBBCDField;
    pFIBDataSetFor_PrintingZAV_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingPASS_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingMODEL: TFIBStringField;
    pFIBDataSetFor_PrintingMARK: TFIBStringField;
    pFIBDataSetFor_PrintingDATE_CREATE: TFIBDateField;
    pFIBDataSetFor_PrintingID_CUST: TFIBBCDField;
    pFIBDataSetFor_PrintingDOC_REG: TFIBStringField;
    pFIBDataSetFor_PrintingDATE_REG: TFIBDateField;
    pFIBDataSetFor_PrintingNOTE: TFIBStringField;
    pFIBDataSetFor_PrintingNAME_NORM: TFIBStringField;
    pFIBDataSetFor_PrintingAMORT_PERC: TFIBFloatField;
    pFIBDataSetFor_PrintingMIN_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingMETHOD_NAME: TFIBStringField;
    pFIBDataSetFor_PrintingNORM_TIP: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNORM_FORMULA: TFIBStringField;
    pFIBDataSetFor_PrintingBUH_DB_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingBUH_KR_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingNORM_YEAR: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNORM_MONTH: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNORM_ID: TFIBBCDField;
    pFIBDataSetFor_PrintingNORM_PER_PERIOD: TFIBSmallIntField;
    pFIBDataSetFor_PrintingIS_NALOG_ACC: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NAME_NORM: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_AMORT_PERC: TFIBFloatField;
    pFIBDataSetFor_PrintingNAL_MIN_PRICE: TFIBBCDField;
    pFIBDataSetFor_PrintingNAL_METHOD_NAME: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_NORM_TIP: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NORM_FORMULA: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_DB_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_KR_SCH: TFIBStringField;
    pFIBDataSetFor_PrintingNAL_NORM_YEAR: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NORM_MONTH: TFIBSmallIntField;
    pFIBDataSetFor_PrintingNAL_NORM_ID: TFIBBCDField;
    pFIBDataSetFor_PrintingNAL_NORM_PER_PERIOD: TFIBSmallIntField;
    pFIBDataSetFor_PrintingID_BUH_DB: TFIBBCDField;
    pFIBDataSetFor_PrintingID_BUH_KR: TFIBBCDField;
    pFIBDataSetFor_PrintingID_NAL_DB: TFIBBCDField;
    pFIBDataSetFor_PrintingID_NAL_KR: TFIBBCDField;
    pFIBDataSetFor_PrintingID_METHD: TFIBBCDField;
    pFIBDataSetFor_PrintingID_METHD_NAL: TFIBBCDField;
    pFIBDataSetFor_PrintingMAIN_SCH_NUM: TFIBStringField;
    pFIBDataSetFor_PrintingFIO_MOL: TFIBStringField;
    pFIBDataSetFor_PrintingMAIN_NOMN: TFIBStringField;
    pFIBDataSetFor_PrintingDEPARTMENT: TFIBStringField;
    DataSet_inv_sp_osKART_NUM: TFIBIntegerField;
    DataSet_inv_sp_osDATE_REG: TFIBDateField;
    DataSet_inv_sp_osID_INV_KART: TFIBBCDField;
    DataSet_inv_sp_osNOM_NAME: TFIBStringField;
    DataSet_inv_sp_osBEG_PR: TFIBBCDField;
    DataSet_inv_sp_osINV_FULL: TFIBStringField;
    DataSet_Akt_na_spisanieNUM_DOC: TFIBStringField;
    DataSet_Akt_na_spisanieDATE_DOC: TFIBDateField;
    DataSet_Akt_na_spisanieID_MOL: TFIBBCDField;
    DataSet_Akt_na_spisanieFIO: TFIBStringField;
    DataSet_Akt_na_spisanieSFIO: TFIBStringField;
    DataSet_Akt_na_spisanieNAME_DEPARTMENT: TFIBStringField;
    DataSet_Akt_na_spisanieID_OPER: TFIBBCDField;
    DataSet_Akt_na_spisanieNOMN_NAME: TFIBStringField;
    DataSet_Akt_na_spisanieNAME_SCH: TFIBStringField;
    DataSet_Akt_na_spisanieBEG_PR: TFIBBCDField;
    DataSet_Akt_na_spisaniePASS_NUM: TFIBStringField;
    DataSet_Akt_na_spisanieDATE_EXPL: TFIBDateField;
    DataSet_Akt_na_spisanieDATE_CREATE: TFIBDateField;
    DataSet_Akt_na_spisanieDATE_OPR: TFIBDateField;
    DataSet_Akt_na_spisanieIZNOS: TFIBBCDField;
    DataSet_Akt_na_spisanieDATE_PERIODA: TFIBDateField;
    DataSet_Akt_na_spisanieZAV_NUM: TFIBStringField;
    DataSet_Akt_na_spisanieINV_NUM: TFIBStringField;
    DataSetPrinting_peredachuNUM_DOC: TFIBStringField;
    DataSetPrinting_peredachuDATE_DOC: TFIBDateField;
    DataSetPrinting_peredachuID_MOL: TFIBBCDField;
    DataSetPrinting_peredachuID_OPER: TFIBBCDField;
    DataSetPrinting_peredachuNOMN_NAME: TFIBStringField;
    DataSetPrinting_peredachuNAME_SCH: TFIBStringField;
    DataSetPrinting_peredachuBEG_PR: TFIBBCDField;
    DataSetPrinting_peredachuPASS_NUM: TFIBStringField;
    DataSetPrinting_peredachuDATE_EXPL: TFIBDateField;
    DataSetPrinting_peredachuDATE_CREATE: TFIBDateField;
    DataSetPrinting_peredachuIZNOS: TFIBBCDField;
    DataSetPrinting_peredachuDATE_PERIODA: TFIBDateField;
    DataSetPrinting_peredachuZAV_NUM: TFIBStringField;
    pFIBDataSet_To_oz6: TpFIBDataSet;
    frDBDataSet_cool: TfrDBDataSet;
    pFIBDataSet_OZ_AM: TpFIBDataSet;
    pFIBDataSetPerem_e: TpFIBDataSet;
    pFIBDataSetPerem_ePEOPLES: TFIBStringField;
    pFIBDataSetPerem_eNUM_DOC_OPER: TFIBStringField;
    pFIBDataSetPerem_eDATE_PEREM: TFIBDateField;
    pFIBDatabaseTranSend: TpFIBDatabase;
    cxComboBoxSpisok: TcxComboBox;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWr: TpFIBTransaction;
    pFIBDataSetSprOstPrOS: TpFIBDataSet;
    pFIBDataSetVedOne: TpFIBDataSet;
    pFIBDataSetVedOneDATE_RECORD: TFIBDateField;
    pFIBDataSetVedOneNUM_SCH: TFIBStringField;
    pFIBDataSetVedOneNAME_SCH: TFIBStringField;
    pFIBDataSetVedOnePERVISNA_VART: TFIBBCDField;
    pFIBDataSetVedOneIZNOS: TFIBBCDField;
    pFIBDataSetVedOneOST_PRICE: TFIBBCDField;
    pFIBDataSetForAll: TpFIBDataSet;
    pFIBDataSetVedOneBAL_SCH_NUM: TFIBStringField;
    pFIBDataSetVedOneBAL_ID_SCH: TFIBBCDField;
    pFIBDataSetVedOneBAL_SCH_TITLE: TFIBStringField;
    cxCheckBoxPrintPoGRP: TcxCheckBox;
    DataSet_inv_bookNAME_NOM: TFIBStringField;
    DataSet_inv_bookSCH_NUM: TFIBStringField;
    DataSet_inv_bookDATE_EXPL: TFIBDateField;
    DataSet_inv_bookAKT_EXPL_NUM: TFIBStringField;
    DataSet_inv_bookNACH_STOIM: TFIBBCDField;
    DataSet_inv_bookNACH_IZN: TFIBBCDField;
    DataSet_inv_bookOST_STOIM: TFIBBCDField;
    DataSet_inv_bookSUM_IZN: TFIBBCDField;
    DataSet_inv_bookDATE_OUT: TFIBDateField;
    DataSet_inv_bookAKT_OUT_NUM: TFIBStringField;
    DataSet_inv_bookMOL_NAME: TFIBStringField;
    DataSet_inv_bookTIP_UCHETA: TFIBSmallIntField;
    DataSet_inv_bookID_SCH: TFIBBCDField;
    DataSet_inv_bookID_MOL: TFIBBCDField;
    DataSet_inv_bookINV_NUM_FULL: TFIBStringField;
    DataSet_inv_sp_osID_SCH: TFIBBCDField;
    DataSet_inv_sp_osID_MOL: TFIBBCDField;
    DataSet_inv_sp_osCHECKER: TFIBSmallIntField;
    frxDBDataset_main: TfrxDBDataset;
    frxReportPrint: TfrxReport;
    pFIBDataSet_OZ_AMSUMMA_AMORT: TFIBBCDField;
    pFIBDataSet_OZ_AMDATE_AMORT: TFIBDateField;
    pFIBDataSet_OZ_AMNUM_OPER: TFIBStringField;
    DSdop_info_oz_6: TpFIBDataSet;
    DSdop_info_oz_6DATE_OPER: TFIBDateField;
    DSdop_info_oz_6NUM_DOC_OPER: TFIBStringField;
    DSdop_info_oz_6SUMMA_PO_OPER: TFIBBCDField;
    DSdop_info_oz_6TIP_OP: TFIBStringField;
    DataSet_inv_bookBAL_PRICE: TFIBBCDField;
    pFIBDataSet_To_oz6KART_NUM: TFIBStringField;
    pFIBDataSet_To_oz6NAME_NOMN: TFIBStringField;
    pFIBDataSet_To_oz6NAME_DEP: TFIBStringField;
    pFIBDataSet_To_oz6SFIO: TFIBStringField;
    pFIBDataSet_To_oz6INV_FULL: TFIBStringField;
    pFIBDataSet_To_oz6SCH_NUM: TFIBStringField;
    pFIBDataSet_To_oz6OST_PRICE: TFIBBCDField;
    pFIBDataSet_To_oz6OST_IZNOS: TFIBBCDField;
    pFIBDataSet_To_oz6ZAV_NUM: TFIBStringField;
    pFIBDataSet_To_oz6ALL_INFO: TFIBStringField;
    pFIBDataSet_To_oz6DATE_OST: TFIBStringField;
    pFIBDataSet_To_oz6DATE_OPER_EXPL: TFIBDateField;
    pFIBDataSet_To_oz6NUM_DOC_EXPL: TFIBStringField;
    pFIBDataSet_To_oz6DAT_VID_EXPL: TFIBDateField;
    pFIBDataSet_To_oz6DATE_OPER_OPR: TFIBDateField;
    pFIBDataSet_To_oz6NUM_DOC_OPR: TFIBStringField;
    pFIBDataSet_To_oz6NUM_DOC_OUT: TFIBStringField;
    pFIBDataSet_To_oz6DATE_OPER_OUT: TFIBDateField;
    pFIBDataSet_To_oz6DATE_CREATE: TFIBDateField;
    frxCrossObject1: TfrxCrossObject;
    pFIBDataSetVedOneID_SCH: TFIBBCDField;
    DataSet_NaTe_object: TpFIBDataSet;
    DS_TEH: TpFIBDataSet;
    lbl1: TLabel;
    cxDateBeg: TcxDateEdit;
    lbl2: TLabel;
    cxDateEnd: TcxDateEdit;
    cxIsNalog: TcxCheckBox;
    DataSet_inv_bookNOTE: TFIBStringField;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxDBDatasetShab: TfrxDBDataset;
    frxDBDatasetToBed: TfrxDBDataset;
    frxDBDataset_cool: TfrxDBDataset;
    frxDBDataset_per: TfrxDBDataset;
    frxDBDataset_dop: TfrxDBDataset;
    frxDBDataset_obj: TfrxDBDataset;
    frxDBDataset_oz6: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    pFIBDataSet_To_oz6NOTE: TFIBStringField;
    frxDBDataset_indeks: TfrxDBDataset;
    ds_indeks: TpFIBDataSet;
    pFIBDataSet_To_oz6SUM_PO_MODERN: TFIBBCDField;
    pFIBDataSet_To_oz6SUM_PO_INDEX: TFIBBCDField;
    pFIBDataSet_To_oz6SUM_PERVONACH: TFIBBCDField;
    pFIBDataSet_To_oz6BEG_PRICE: TFIBBCDField;
    pFIBDataSet_To_oz6PERCENT: TFIBFloatField;
    frReportShab_Amort: TfrReport;
    frDBDataSetShab: TfrDBDataSet;
    DataSet_inv_sp_osSCH_NUMBER: TFIBStringField;
    DataSet_inv_sp_osNAME_SCH: TFIBStringField;
    DataSet_inv_sp_osSFIO: TFIBStringField;
    DataSet_inv_sp_osNAME_DEPARTMENT: TFIBStringField;
    ds_kap_rem: TpFIBDataSet;
    frxDBDataset_kap_rem: TfrxDBDataset;
    DataSet_inv_sp_osDATE_OUT: TFIBDateField;
    DataSet_inv_sp_osDOC: TFIBStringField;
    DataSet_inv_sp_osREASON: TFIBStringField;
    ds_modern: TpFIBDataSet;
    ds_modernNAME_NOMN: TFIBStringField;
    ds_modernNAME_DEP: TFIBStringField;
    ds_modernSFIO: TFIBStringField;
    ds_modernINV_FULL: TFIBStringField;
    ds_modernSCH_NUM: TFIBStringField;
    ds_modernSUM_PO_OPER: TFIBBCDField;
    ds_modernDATE_DOC: TFIBDateField;
    ds_modernNUM_DOC: TFIBStringField;
    Ds_Moderniz: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxComboBoxSpisokPropertiesChange(Sender: TObject);
    procedure cxCheckBoxPrintPoGRPPropertiesChange(Sender: TObject);
    procedure cxIsNalogPropertiesChange(Sender: TObject);
  private
    Tip_print, id_kartki, GRP_ID : Int64;
    inv_full_num : string;
    FormFinde : TfmMainIvKartForm;

    idishnik_object:           string;
    aMassReports:              Variant;
    path_to_shablon, id_shaba: string;
    int, FlagGrp :             integer;
    id_schsis, id_manis :      Int64;
    Checkers_flg:              Variant;
  public
    { Public declarations }
    _ON_PRINTER, _SEL_PRINTER, _EDIT_TEMPLATE: boolean;
    _NUM_COPIES: integer;
    is_nal:Integer;
    //constructor Create(am_forma : TfmAmSelect; id_amort_ved : Int64); reintroduce; overload;
    ResultArray : Variant;
  end;
     function Setings_Print(Baskript: TISC_DB_HANDLE; tip_printing_doc, id_printing_kartochki, GRP_ID_M : Int64; inv_fulln : string; id_sch, id_man : int64; is_nalog:integer) : boolean;
var
  fmPrintDoc: TfmPrintDoc;

implementation

{$R *.dfm}

function Setings_Print(Baskript: TISC_DB_HANDLE; tip_printing_doc, id_printing_kartochki, GRP_ID_M : Int64; inv_fulln : string; id_sch, id_man : int64; is_nalog:integer) : boolean;
var
    fm : TfmPrintDoc;
    f  :TfmMainIvKartForm;
    date_end:TDate;
begin
    fm := TfmPrintDoc.Create(nil);
    fm.Tip_print                      := tip_printing_doc;
    fm.id_kartki                      := id_printing_kartochki;
    fm.inv_full_num                   := inv_fulln;
    fm.GRP_ID                         := GRP_ID_M;
    fm.id_schsis                      := id_sch;
    fm.id_manis                       := id_man;

    fm.pFIBDatabaseTranSend.Handle:=Baskript;
    fm.pFIBDatabaseTranSend.Connected := true;

    if fm.cxCheckBoxPrintPoGRP.Checked = true then
    begin
        fm.FlagGrp := 1;
    end else
    begin
        fm.FlagGrp := 0;
    end;

    if fm.Tip_print = 1 then
    begin
        fm.idishnik_object := 'Inv271';
        fm.DataSetDrag.Close;
        fm.DataSetDrag.SQLs.SelectSQL.Text :='select * from MAT_INV_SEL_DRAG_MET ('+IntToStr(fm.id_kartki)+')';
        fm.DataSetDrag.Open;

        fm.DataSetOsn.Close;
        fm.DataSetOsn.SQLs.SelectSQL.Text :='select * from MAT_INV_SEL_TO_GRID_2 ('+IntToStr(fm.id_kartki)+')';
        fm.DataSetOsn.Open;

        fm.cxCheckBoxPrintPoGRP.Visible := false;
    end;
    if fm.Tip_print = 2 then
    begin
        fm.idishnik_object := 'Inv272';
        fm.cxCheckBoxPrintPoGRP.Visible := false;
    end;
    if fm.Tip_print = 3 then fm.idishnik_object := 'Inv273';
    if fm.Tip_print = 4 then
    begin
        fm.idishnik_object := 'Inv274';
        fm.cxCheckBoxPrintPoGRP.Visible := false;
    end;    
    if fm.Tip_print = 5 then fm.idishnik_object := 'Inv275';
    if fm.Tip_print = 6 then fm.idishnik_object := 'Inv276';
    if fm.Tip_print = 11 then fm.idishnik_object := 'Inv281';
    if fm.Tip_print = 12 then fm.idishnik_object := 'Inv282';
    if fm.Tip_print = 13 then fm.idishnik_object := 'Inv283';
    if fm.Tip_print = 14 then fm.idishnik_object := 'Inv284';
    if fm.Tip_print = 15 then fm.idishnik_object := 'Inv285';
    if fm.Tip_print = 16 then fm.idishnik_object := 'Inv286';
    if fm.Tip_print = 17 then fm.idishnik_object := 'Inv287';
    if fm.Tip_print = 18 then fm.idishnik_object := 'Inv288';
    if fm.Tip_print = 19 then fm.idishnik_object := 'Inv289';
    if fm.Tip_print = 20 then fm.idishnik_object := 'Inv290';
    if fm.Tip_print = 21 then fm.idishnik_object := 'Inv300';
    if fm.Tip_print = 22 then fm.idishnik_object := 'Inv310';
    if fm.Tip_print = 25 then fm.idishnik_object := 'Inv320';
    if fm.Tip_print = 26 then fm.idishnik_object := 'Inv330';

    LoadReportsTocxComboBoxMy(fm.idishnik_object,fm.cxComboBoxSpisok,fm.aMassReports);

    fm.cxComboBoxSpisok.ItemIndex:=0;

    fm.Checkers_flg := Sel_checkers;
    if fm.checkers_flg <> '' then fm.checkers_flg := 1 else fm.checkers_flg := 0;
    
    fm.cxDateBeg.EditValue:=_Matas_Period;
   // date_end:= EndOfAMOnth(YearOF(_Matas_Period),MonthOf(_Matas_Period));
    fm.cxDateEnd.editvalue:= date();

    if ((fm.Tip_print=20) or (fm.Tip_print=22)or (fm.Tip_print=21)) then begin fm.cxDateBeg.enabled:=True; fm.cxDateEnd.enabled:=True; fm.lbl1.enabled:=True; fm.lbl2.enabled:=True; end
    else begin fm.cxDateBeg.enabled:=False; fm.cxDateEnd.enabled:=False; fm.lbl1.enabled:=False; fm.lbl2.enabled:=False; end;
    fm.is_nal:=is_nalog;
    if fm.is_nal=1 then fm.cxIsNalog.Checked:=True else fm.cxIsNalog.Checked:=False;
    fm.ShowModal;
  //  Setings_Print := fm.ResultArray;
   // fm.Free;

end;

procedure TfmPrintDoc.FormCreate(Sender: TObject);
begin
    Caption                             := MAT_INV_system_name + MAT_INV_print_caption;
    cxLabelChecked_Shablon.Caption      := MAT_INV_print_sel_Shablon;
    LabelKol_copys.Caption              := MAT_INV_print_kol;
    cxCheckOnPrinter.Properties.Caption := MAT_INV_print_on_printer;
    cxSelectPrinter.Properties.Caption  := MAT_INV_print_sel_printer;
    cxButtonClose.Caption               := MAT_INV_Cansel;
    cxButtonChect.Caption               := MAT_INV_Print;
    cxCheckBoxPrintPoGRP.Properties.Caption        := MAT_INV_grp_checked;

    cxCopies.Value                      := 1;
    cxCheckOnPrinter.Checked            := IntToBool(_SET_PRINT_ON_PRINTER);
    CheckBoxDoc.Visible                 := IntToBool(_ALLOW_EDIT_TEMPLATE);
    _ON_PRINTER                         := IntToBool(_SET_PRINT_ON_PRINTER);
    _SEL_PRINTER                        := false;
    _EDIT_TEMPLATE                      := IntToBool(_ALLOW_EDIT_TEMPLATE);
    _NUM_COPIES                         := 1;
end;

procedure TfmPrintDoc.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmPrintDoc.ActionPrintExecute(Sender: TObject);
var
    tak : String;
    god_amort, mesyac_amort : string;
    grp_flagi, intersting_flg : integer;

begin
if Tip_print = 1 then
begin
  // в связи с переходом на новй тип отчетов // Мардарь О.В. 18.06.12
   // frxDBDatasetShab.DataSet:=  pFIBDataSet_To_oz6;
   // frDBDataSetShab.Dataset := pFIBDataSetFor_Printing;
 if cxComboBoxSpisok.Text='Iнвентарна картка' then
 begin
    pFIBDataSetFor_Printing.Close;
    pFIBDataSetFor_Printing.SQLs.SelectSQL.Clear;
    pFIBDataSetFor_Printing.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_TO_PRINT('+IntToStr(id_kartki)+', '+IntToStr(is_nal)+')';
    pFIBDataSetFor_Printing.CloseOpen(False);

    DSdop_info_oz_6.Close;
    DSdop_info_oz_6.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_DOP_DATA('+IntToStr(id_kartki)+')';
    DSdop_info_oz_6.CloseOpen(False);
 end
 else
 begin
    pFIBDataSet_To_oz6.Close;
    pFIBDataSet_To_oz6.SQLs.SelectSQL.Clear;
    pFIBDataSet_To_oz6.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_TO_PRINT_OZ6('+IntToStr(id_kartki)+', '+IntToStr(is_nal)+')';
    pFIBDataSet_To_oz6.CloseOpen(False);

    DSdop_info_oz_6.Close;
    DSdop_info_oz_6.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_DOP_DATA('+IntToStr(id_kartki)+') where TIPOK_OPER in(5,21,22,23,24)';
    DSdop_info_oz_6.CloseOpen(False);
 end;

   // frDBDataSetShab.close;
   // frxDBDatasetShab.Close;

   // frDBDataSet_for_bed.Dataset := DataSetDrag;
   // frxDBDatasetToBed.Dataset := DataSetDrag;
    ds_indeks.Close;
    ds_indeks.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_DOP_DATA('+IntToStr(id_kartki)+') where TIPOK_OPER=7';
    ds_indeks.CloseOpen(False);

    DataSetDrag.Close;
    DataSetDrag.SQLs.SelectSQL.Clear;
    DataSetDrag.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_DRAG_MET ('+IntToStr(id_kartki)+')';
    DataSetDrag.CloseOpen(False);

    //frDBDataSet_for_bed.close;
    //frxDBDatasetToBed.Close;

    //frDBDataSet_cool.Dataset := pFIBDataSet_OZ_AM;
   // frxDBDataset_cool.Dataset := pFIBDataSet_OZ_AM;

    pFIBDataSet_OZ_AM.Close;
    pFIBDataSet_OZ_AM.SQLs.SelectSQL.Clear;
    pFIBDataSet_OZ_AM.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_TO_PRINT_OZ6_AM('+IntToStr(id_kartki)+')';
    pFIBDataSet_OZ_AM.CloseOpen(False);

   // frDBDataSetper.Dataset := pFIBDataSetPerem_e;
  // frxDBDataset_per.Dataset := pFIBDataSetPerem_e;

    pFIBDataSetPerem_e.Close;
    pFIBDataSetPerem_e.SQLs.SelectSQL.Clear;
    pFIBDataSetPerem_e.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_TO_PRINT_OZ6_PEREM('+IntToStr(id_kartki)+')';
    pFIBDataSetPerem_e.CloseOpen(False);


    //fr_DSdop.Dataset       := DSdop_info_oz_6;
   // frxDBDataset_dop.Dataset       := DSdop_info_oz_6;

   // DSdop_info_oz_6.Close;
    //DSdop_info_oz_6.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_DOP_DATA('+IntToStr(id_kartki)+')';
  //  DSdop_info_oz_6.CloseOpen(False);

   // fr_DB_obj.Dataset       := DataSet_NaTe_object;
  // frxDBDataset_obj.Dataset       := DataSet_NaTe_object;

    DataSet_NaTe_object.Close;
    DataSet_NaTe_object.SQLs.SelectSQL.Text :='select * from MAT_INV_SEL_FOR_OBJECT('+IntToStr(id_kartki)+')';
    DataSet_NaTe_object.CloseOpen(False);

    ds_kap_rem.Close;
    ds_kap_rem.SQLs.SelectSQL.Text :='select * from MAT_INV_KAP_REM_SEL('+IntToStr(id_kartki)+')';
    ds_kap_rem.CloseOpen(False);
  //  frVariables['ustanova']        := _ORG_FULL_NAME;
  //  frVariables['OKPO']            := _ORG_KOD_OKPO;
   frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
   frxReportPrint.PrepareReport;
   frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
   frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

   _ON_PRINTER    := cxCheckOnPrinter.Checked;
   _SEL_PRINTER   := cxSelectPrinter.Checked;
   _EDIT_TEMPLATE := CheckBoxDoc.Checked;
   _NUM_COPIES    := cxCopies.EditValue;


  { if CheckBoxDoc.Checked then
    frxReportPrint.DesignReport
   else frxReportPrint.ShowReport;}
    //frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
end;

if Tip_print = 2 then
begin
    frxDBDataset_main.Dataset := DataSetPrinting_peredachu;

    DataSetPrinting_peredachu.Close;
    DataSetPrinting_peredachu.SelectSQL.Clear;
    DataSetPrinting_peredachu.SQLs.SelectSQL.Text:='select * from MAT_INV_SEL_TO_PRINT_PP('+IntToStr(id_kartki)+', '+IntToStr(is_nal)+')';
    DataSetPrinting_peredachu.Open;

    tak := DataSetPrinting_peredachu.FieldByName('DATE_CREATE').AsString;
    if DataSetPrinting_peredachu.FieldByName('NUM_DOC').AsString = '' then
    begin
        ShowMessage(MAT_INV_peremesh);
        Exit;
    end;
   frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    if tak <> '' then
    begin
        frxReportPrint.Variables['date_cr']      := ''''+tak[7]+tak[8]+tak[9]+tak[10]+'''';
    end else
    begin
        frxReportPrint.Variables['date_cr']      := ''''+'''';
    end;

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
    frxReportPrint.Variables['inv']             := ''''+inv_full_num+'''';

   //frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
end;

if (tip_print=20) then
begin

  frxDBDataset_main.Dataset := DS_TEH;
//    Showmessage('GRP_ID='+IntToStr(GRP_ID)+', FlagGrp='+IntToStr(FlagGrp));

    DS_TEH.Close;
    DS_TEH.SQLs.SelectSQL.Clear;
    DS_TEH.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_INV_TEH_CHART_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+', :date_cur, '+IntToStr(is_nal)+')';

    if id_manis <> 0 then
        begin
            DS_TEH.SelectSQL.Add(' where ' + 'ID_MOL= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' and ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if checkers_flg <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' AND CHECKER = 1');
            end;
        end else
        begin
            if id_schsis <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if (checkers_flg <> 0) and (id_schsis <> 0) then
            begin
                DS_TEH.SelectSQL.Add(' AND CHECKER = 1');
            end;
            if (checkers_flg <> 0) and (id_schsis = 0) then
            begin
                DS_TEH.SelectSQL.Add(' WHERE CHECKER = 1');
            end;
        end;

    DS_TEH.SelectSQL.Add(' ORDER BY SFIO, NOM_NAME ');
    ds_teh.prepare;
    ds_teh.Parambyname('DATE_CUR').AsDate:=cxdateBeg.EditValue;
    DS_TEH.Open;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
    frxReportPrint.Variables['DATE_CUR']            :=''''+ DateToStr(cxdatebeg.editvalue)+'''';
    {
    frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKPO']            := _ORG_KOD_OKPO;
    frVariables['DATE_CUR']         := cxdatebeg.editvalue;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    }
end;

if (tip_print=21) then
begin

  frxDBDataset_main.Dataset := DS_TEH;
//    Showmessage('GRP_ID='+IntToStr(GRP_ID)+', FlagGrp='+IntToStr(FlagGrp));

    DS_TEH.Close;
    DS_TEH.SQLs.SelectSQL.Clear;
    DS_TEH.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_INV_OPIS_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+' ,:date_beg, :date_end)';

    if id_manis <> 0 then
        begin
            DS_TEH.SelectSQL.Add(' where ' + 'ID_MOL= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' and ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if checkers_flg <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' AND CHECKER = 1');
            end;
        end else
        begin
            if id_schsis <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if (checkers_flg <> 0) and (id_schsis <> 0) then
            begin
                DS_TEH.SelectSQL.Add(' AND CHECKER = 1');
            end;
            if (checkers_flg <> 0) and (id_schsis = 0) then
            begin
                DS_TEH.SelectSQL.Add(' WHERE CHECKER = 1');
            end;
        end;

    DS_TEH.SelectSQL.Add(' ORDER BY NAME_DEP, SCH_NUMBER, NOM_NAME ');
    ds_teh.prepare;
    ds_teh.parambyname('date_beg').asdate:=cxDateBeg.EditValue;
    ds_teh.parambyname('date_end').asdate:=cxDateEnd.EditValue;
    DS_TEH.Open;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
    frxReportPrint.Variables['d_b']            :=''''+ DateToStr(cxdatebeg.editvalue)+'''';
    frxReportPrint.Variables['d_e']            :=''''+ DateToStr(cxdateend.editvalue)+'''';

     {
    frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKPO']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    }
end;

if (tip_print=22) then
begin

  frxDBDataset_main.Dataset := DS_TEH;
//    Showmessage('GRP_ID='+IntToStr(GRP_ID)+', FlagGrp='+IntToStr(FlagGrp));

    DS_TEH.Close;
    DS_TEH.SQLs.SelectSQL.Clear;
    DS_TEH.SQLs.SelectSQL.Text := 'select * from MAT_INV_OBOROT_BY_MO_SEL(:date_beg, :date_end, '+IntToStr(is_nal)+')';

    if id_manis <> 0 then
        begin
            DS_TEH.SelectSQL.Add(' where ' + 'ID_MOL= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' and ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if checkers_flg <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' AND CHECKER = 1');
            end;
        end else
        begin
            if id_schsis <> 0 then
            begin
                DS_TEH.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if (checkers_flg <> 0) and (id_schsis <> 0) then
            begin
                DS_TEH.SelectSQL.Add(' AND CHECKER = 1');
            end;
            if (checkers_flg <> 0) and (id_schsis = 0) then
            begin
                DS_TEH.SelectSQL.Add(' WHERE CHECKER = 1');
            end;
        end;

    DS_TEH.SelectSQL.Add(' ORDER BY FIO_DEP ');
    ds_teh.prepare;
    ds_teh.parambyname('date_beg').asdate:=cxDatebeg.EditValue;
    ds_teh.parambyname('date_end').asdate:=cxDateend.EditValue;
    DS_TEH.Open;

     frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
    frxReportPrint.Variables['d_b']            :=''''+ DateToStr(cxdatebeg.editvalue)+'''';
    frxReportPrint.Variables['d_e']            :=''''+ DateToStr(cxdateend.editvalue)+'''';
    {frVariables['d_b']        := DateToStr(cxdatebeg.editvalue);
    frVariables['d_e']        := DatetoStr(cxdateend.editvalue);
    frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKPO']            := _ORG_KOD_OKPO;
    
    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    }
end;

if (Tip_print = 3) then
begin
    frxDBDataset_main.Dataset := DataSet_inv_sp_os;
//    Showmessage('GRP_ID='+IntToStr(GRP_ID)+', FlagGrp='+IntToStr(FlagGrp));

    DataSet_inv_sp_os.Close;
    DataSet_inv_sp_os.SQLs.SelectSQL.Clear;
    DataSet_inv_sp_os.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_INV_SP_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
    if id_manis <> 0 then
        begin
            DataSet_inv_sp_os.SelectSQL.Add(' where ' + 'ID_MOL= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
                DataSet_inv_sp_os.SelectSQL.Add(' and ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if checkers_flg <> 0 then
            begin
                DataSet_inv_sp_os.SelectSQL.Add(' AND CHECKER = 1');
            end;
        end
        else
        begin
            if id_schsis <> 0 then
            begin
                DataSet_inv_sp_os.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
            if (checkers_flg <> 0) and (id_schsis <> 0) then
            begin
                DataSet_inv_sp_os.SelectSQL.Add(' AND CHECKER = 1');
            end;
            if (checkers_flg <> 0) and (id_schsis = 0) then
            begin
                DataSet_inv_sp_os.SelectSQL.Add(' WHERE CHECKER = 1');
            end;
        end;
        DataSet_inv_sp_os.SelectSQL.Add(' ORDER BY NAME_DEPARTMENT, SCH_NUMBER, NOM_NAME ');
    DataSet_inv_sp_os.CloseOpen(false);
    DataSet_inv_sp_os.FetchAll;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';

    ///frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
end;

if Tip_print = 4 then
begin
    frxDBDataset_main.Dataset := DataSet_Akt_na_spisanie;

    DataSet_Akt_na_spisanie.Close;
    DataSet_Akt_na_spisanie.SQLs.SelectSQL.Text:='select * from MAT_INV_SEL_TO_PRINT_spisanie('+IntToStr(id_kartki)+','+IntToStr(is_nal)+')';
    DataSet_Akt_na_spisanie.CloseOpen(False);
    DataSet_Akt_na_spisanie.FetchAll;

    tak := DataSet_Akt_na_spisanie.FieldByName('DATE_CREATE').AsString;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    if tak <> '' then
    begin
        frxReportPrint.Variables['date_cr']      := ''''+tak[7]+tak[8]+tak[9]+tak[10]+'''';
    end else
    begin
        frxReportPrint.Variables['date_cr']      := ''''+'''';
    end;

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';
    frxReportPrint.Variables['inv']             := ''''+inv_full_num+'''';

       { if tak <> '' then
        begin
            frVariables['date_cr']      := tak[7]+tak[8]+tak[9]+tak[10];
        end else
        begin
            frVariables['date_cr']      := '';
            ShowMessage(MAT_INV_spisan);
            Exit;
        end;

   { frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKPO']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
}
end;

if Tip_print = 5 then
begin
    frxDBDataset_main.Dataset := DataSet_inv_book;

    DataSet_inv_book.Close;
    DataSet_inv_book.SQLs.SelectSQL.Clear;
    DataSet_inv_book.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_TO_PR_INV_KNIGA('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+') order by SCH_NUM,  MOL_NAME, INV_NUM_FULL, NAME_NOM';
    DataSet_inv_book.CloseOpen(False);
    DataSet_inv_book.fetchAll;
    
    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';

    //frVariables['ustanova']        := _ORG_FULL_NAME;
    //frVariables['OKPO']            := _ORG_KOD_OKPO;

    //frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
end;

if Tip_print = 25 then
begin
    frxDBDataset_main.Dataset := DataSet_inv_book;

    DataSet_inv_book.Close;
    DataSet_inv_book.SQLs.SelectSQL.Clear;
    DataSet_inv_book.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_TO_PR_INV_KNIGA('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+') order by MOL_NAME, SCH_NUM, INV_NUM_FULL, NAME_NOM';
    DataSet_inv_book.Open;
    
    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';

    //frVariables['ustanova']        := _ORG_FULL_NAME;
    //frVariables['OKPO']            := _ORG_KOD_OKPO;

   // frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
end;
if (tip_print=26) then
begin
    //Ds_Moderniz.Dataset := ds_modern;
    ds_modern.Close;
    ds_modern.SQLs.SelectSQL.Clear;
    ds_modern.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_AKT_MODERNIZ('+IntToStr(id_kartki)+','+IntToStr(GRP_ID)+')';
    ds_modern.Open;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';

end;

if Tip_print = 6 then
begin
    frxDBDataset_main.Dataset := DataSetSellect_info_about_drag;

    DataSetSellect_info_about_drag.Close;
    DataSetSellect_info_about_drag.SQLs.SelectSQL.Clear;
    DataSetSellect_info_about_drag.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_DRAG_FOR_PRINT('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+')';
    DataSetSellect_info_about_drag.CloseOpen(False);
    DataSetSellect_info_about_drag.fetchAll;
    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';

    //frVariables['ustanova']        := _ORG_FULL_NAME;
    //frVariables['OKPO']            := _ORG_KOD_OKPO;

    //frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
end;

if Tip_print = 11 then
begin
    frxDBDataset_main.Dataset := pFIBDataSetSprOstPrOS;

    Work_with_sch_and_grp(FlagGrp, GRP_ID);

    pFIBDataSetSprOstPrOS.Close;
    pFIBDataSetSprOstPrOS.SQLs.SelectSQL.Clear;
    pFIBDataSetSprOstPrOS.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_SPR_OST_PRICE('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
    pFIBDataSetSprOstPrOS.Open;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKPO']            :=''''+ _ORG_KOD_OKPO+'''';

    {frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKUD']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    }Delete_from_tmp_print;
end;

if Tip_print = 12 then
begin
    frxDBDataset_main.Dataset := pFIBDataSetVedOne;

    Work_with_sch_and_grp_one(FlagGrp, GRP_ID);

    pFIBDataSetVedOne.Close;
    pFIBDataSetVedOne.SQLs.SelectSQL.Clear;
    pFIBDataSetVedOne.SQLs.SelectSQL.Text:= 'select * from MAT_INV_PRINT_SPR_NALICH_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')  order by BAL_SCH_NUM, NUM_SCH';
    pFIBDataSetVedOne.CloseOpen(False);
    pFIBDataSetVedOne.FetchAll;


    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    frxReportPrint.Variables['ustanova']        :=''''+ _ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKUD']            :=''''+ _ORG_KOD_OKPO+'''';

    //frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    Delete_from_tmp_print;
end;

if Tip_print = 13 then
begin
    frxDBDataset_main.Dataset := pFIBDataSetForAll;

    Work_with_sch_and_grp_one(FlagGrp, GRP_ID);

    pFIBDataSetForAll.Close;
    pFIBDataSetForAll.SQLs.SelectSQL.Clear;
    pFIBDataSetForAll.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_VED_COME_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
    pFIBDataSetForAll.CloseOpen(false);
    pFIBDataSetForAll.FetchAll;

    mesyac_amort := pFIBDataSetForAll.FieldByName('MESYAC').AsString;
    god_amort    := pFIBDataSetForAll.FieldByName('GOD').AsString;

     if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
     if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
     if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
     if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
     if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
     if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
     if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
     if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
     if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
     if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
     if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
     if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

     frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
     frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
     frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
     frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

    {frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
    frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKUD']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
}end;

if Tip_print = 14 then
begin
    frxDBDataset_main.Dataset := pFIBDataSetForAll;

    Work_with_sch_and_grp_one(FlagGrp, GRP_ID);

    pFIBDataSetForAll.Close;
    pFIBDataSetForAll.SQLs.SelectSQL.Clear;
    pFIBDataSetForAll.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_VED_OUT_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
    pFIBDataSetForAll.CloseOpen(false);
    pFIBDataSetForAll.FetchAll;

    mesyac_amort := pFIBDataSetForAll.FieldByName('MESYAC').AsString;
    god_amort    := pFIBDataSetForAll.FieldByName('GOD').AsString;

     if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
     if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
     if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
     if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
     if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
     if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
     if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
     if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
     if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
     if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
     if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
     if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

     frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
     frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
     frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
     frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

   { frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
    frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKUD']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
}end;

if Tip_print = 18 then
begin
    frxDBDataset_main.Dataset:= pFIBDataSetForAll;

    Work_with_sch_and_grp_one(FlagGrp, GRP_ID);

    pFIBDataSetForAll.Close;
    pFIBDataSetForAll.SQLs.SelectSQL.Clear;
    pFIBDataSetForAll.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_PEREM('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
    pFIBDataSetForAll.Open;

    mesyac_amort := pFIBDataSetForAll.FieldByName('MESYAC').AsString;
    god_amort    := pFIBDataSetForAll.FieldByName('GOD').AsString;

     if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
     if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
     if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
     if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
     if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
     if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
     if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
     if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
     if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
     if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
     if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
     if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

     frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
     frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
     frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
     frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

   { frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
    frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKUD']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
}end;

if Tip_print = 15 then
begin
    frxDBDataset_main.Dataset := pFIBDataSetForAll;

    pFIBDataSetForAll.Close;
    pFIBDataSetForAll.SQLs.SelectSQL.Clear;
    pFIBDataSetForAll.SQLs.SelectSQL.Text := 'select * from MAT_INV_PRINT_OPIS_OS('+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
    pFIBDataSetForAll.Open;

    frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
    frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

   { frVariables['ustanova']        := _ORG_FULL_NAME;
    frVariables['OKUD']            := _ORG_KOD_OKPO;

    frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
}end;

if Tip_print = 16 then
    begin
        frxDBDataset_main.Dataset:= pFIBDataSetForAll;

        grp_flagi := 0;
        pFIBDataSetForAll.Close;
        pFIBDataSetForAll.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_SVOD_PO_GRP_OF('+IntToStr(grp_flagi)+','+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
        pFIBDataSetForAll.Open;

        god_amort    := pFIBDataSetForAll.FieldByName('DATE_RECORD').AsString;

        frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
        frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
        frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
        frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

        {frVariables['godok']           := 'на ' + god_amort + ' года';
        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKUD']            := _ORG_KOD_OKPO;

        frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    }end;

    if Tip_print = 17 then
    begin
        frxDBDataset_main.Dataset := pFIBDataSetForAll;

        grp_flagi := 1;
        pFIBDataSetForAll.Close;
        pFIBDataSetForAll.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_SVOD_PO_GRP_OF('+IntToStr(grp_flagi)+','+IntToStr(GRP_ID)+','+IntToStr(FlagGrp)+','+IntToStr(is_nal)+')';
        pFIBDataSetForAll.Open;

        god_amort    := pFIBDataSetForAll.FieldByName('DATE_RECORD').AsString;

        frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
        frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
        frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
        frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

        {frVariables['godok']           := 'на ' + god_amort + ' года';
        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKUD']            := _ORG_KOD_OKPO;

        frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
    }end;

    if Tip_print = 19 then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetForAll;

        pFIBDataSetForAll.Close;
        pFIBDataSetForAll.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_GRP_AMORT_SCH('+IntToStr(is_nal)+')';
        pFIBDataSetForAll.Open;

        mesyac_amort := pFIBDataSetForAll.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetForAll.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

         frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);
         frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
         frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
         frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

    end;
 frxReportPrint.PrepareReport;

  if CheckBoxDoc.Checked then
 begin
 frxReportPrint.DesignReport;
 end
 else
 frxReportPrint.ShowReport;
 //fm.visible:=False;
 close;
//free;
 {  if ((Tip_print <> 19) and (Tip_print <> 1) and (Tip_print <> 2) and (Tip_print <> 3)and (Tip_print <> 4) and (Tip_print <> 5) and (Tip_print <> 6) and (Tip_print <> 11)and (Tip_print <> 12)and (Tip_print <> 13)and (Tip_print <> 14)and (Tip_print <> 18)and (Tip_print <> 15)and (Tip_print <> 16)and (Tip_print <> 17)and (Tip_print <> 20)and (Tip_print <> 21)and (Tip_print <> 22)and (Tip_print <> 25)) then
    begin
    //   frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

        _ON_PRINTER    := cxCheckOnPrinter.Checked;
        _SEL_PRINTER   := cxSelectPrinter.Checked;
        _EDIT_TEMPLATE := CheckBoxDoc.Checked;
        _NUM_COPIES    := cxCopies.EditValue;

        frReportShab_Amort.PrepareReport;
        if cxCopies.Value>1 then
           frReportShab_Amort.DefaultCopies:=cxCopies.Value;
        if cxCheckOnPrinter.Checked then
        begin
            if cxSelectPrinter.Checked then
            begin
               frReportShab_Amort.PrintPreparedReportDlg
            end else
            begin
               frReportShab_Amort.PrintPreparedReport('', cxCopies.Value, false, frAll);
            end;
        end else
        begin
           frReportShab_Amort.ShowReport;
        end;
        if CheckBoxDoc.Checked then
        begin
           frReportShab_Amort.DesignReport;
        end;
        close;
    end else
    begin}
       // frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

        {frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
        frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
        frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';
           }
       { _ON_PRINTER    := cxCheckOnPrinter.Checked;
        _SEL_PRINTER   := cxSelectPrinter.Checked;
        _EDIT_TEMPLATE := CheckBoxDoc.Checked;
        _NUM_COPIES    := cxCopies.EditValue;
        }
      //  frxReportPrint.PrepareReport;

        //Пока что --if cxCopies.Value>1 then frxReportPrint.DefaultCopies:=cxCopies.Value;

     //  if cxCheckOnPrinter.Checked then
      //  begin
            {if cxSelectPrinter.Checked then
            begin
               frxReportPrint.PrintPreparedReportDlg
            end else
            begin
               frxReportPrint.PrintPreparedReport('', cxCopies.Value, false, frAll);
            end;}
       { end else
        begin
           frxReportPrint.ShowReport;
        end;
        if CheckBoxDoc.Checked then
        begin
           frxReportPrint.DesignReport;
        end;
        close;   }
   // end;
    {
    _ON_PRINTER    := cxCheckOnPrinter.Checked;
    _SEL_PRINTER   := cxSelectPrinter.Checked;
    _EDIT_TEMPLATE := CheckBoxDoc.Checked;
    _NUM_COPIES    := cxCopies.EditValue;

    frReportShab_Amort.PrepareReport;
    if cxCopies.Value>1 then
       frReportShab_Amort.DefaultCopies:=cxCopies.Value;
    if cxCheckOnPrinter.Checked then
    begin
        if cxSelectPrinter.Checked then
        begin
           frReportShab_Amort.PrintPreparedReportDlg
        end else
        begin
           frReportShab_Amort.PrintPreparedReport('', cxCopies.Value, false, frAll);
        end;
    end else
    begin
       frReportShab_Amort.ShowReport;
    end;
    if CheckBoxDoc.Checked then
    begin
       frReportShab_Amort.DesignReport;
    end;
    close;
    }
end;

procedure TfmPrintDoc.ActionCloseExecute(Sender: TObject);
begin
free;    close;
end;

procedure TfmPrintDoc.cxComboBoxSpisokPropertiesChange(Sender: TObject);
begin
    int := cxComboBoxSpisok.ItemIndex;
    id_shaba        := aMassReports[int][0];
    path_to_shablon := aMassReports[int][3];
end;

procedure TfmPrintDoc.cxCheckBoxPrintPoGRPPropertiesChange(
  Sender: TObject);
begin
    if cxCheckBoxPrintPoGRP.Checked = true then
    begin
        FlagGrp := 1;
    end else
    begin
        FlagGrp := 0;
    end;
end;

procedure TfmPrintDoc.cxIsNalogPropertiesChange(Sender: TObject);
begin
if cxIsNalog.Checked=True then is_nal:=1 else is_nal:=0;
end;

end.
