{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepOborotForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, DateUtils,
  cxGridDBTableView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, Buttons, cxDBEdit, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, FIBDataSet, pFIBDataSet, uResources, uSpMatOtv, uMatasUtils,
  cxDropDownEdit, cxCalendar, cxGridBandedTableView, ibase,
  cxGridDBBandedTableView, FR_DSet, FR_DBSet, FR_Class, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, DBTables, MemTable,
  cxSplitter, FR_Cross, FIBDatabase, pFIBDatabase, Menus, ImgList,
  FIBQuery, pFIBQuery, pFIBStoredProc, Grids, uMatasVars, uPackageManager,
  uSpMatSchMulti, Placemnt, ActnList, cxCheckBox, frxClass, frxDBSet,
  frxDesgn, frxExportRTF, frxExportXLS;

type
  TOborotForm = class(TForm)
    Panel1: TPanel;
    StyleRepository: TcxStyleRepository;
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
    WorkDataSet: TpFIBDataSet;
    LabelMol: TLabel;
    cxMatOtv: TcxButtonEdit;
    LabelBeg: TLabel;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    LabelSch: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    WorkDataSetID_SCH: TFIBBCDField;
    WorkDataSetSCH_NUMBER: TFIBStringField;
    WorkDataSetSCH_TITLE: TFIBStringField;
    WorkDataSetID_MO: TFIBBCDField;
    WorkDataSetFIO: TFIBStringField;
    WorkDataSetSFIO: TFIBStringField;
    WorkDataSetNAME_DEPARTMENT: TFIBStringField;
    WorkDataSetID_NOMN: TFIBIntegerField;
    WorkDataSetNOMN: TFIBStringField;
    WorkDataSetNAME: TFIBStringField;
    WorkDataSetID_UNIT: TFIBIntegerField;
    WorkDataSetUNIT: TFIBStringField;
    WorkDataSetUNIT_NAME: TFIBStringField;
    WorkDataSetKOL_BEG: TFIBBCDField;
    WorkDataSetKOL_PRH: TFIBBCDField;
    WorkDataSetKOL_RSH: TFIBBCDField;
    WorkDataSetKOL_OST: TFIBBCDField;
    WorkDataSetSUMM_BEG: TFIBBCDField;
    WorkDataSetSUMM_PRH: TFIBBCDField;
    WorkDataSetSUMM_RSH: TFIBBCDField;
    WorkDataSetSUMM_OST: TFIBBCDField;
    WorkDataSource: TDataSource;
    SchDataSet: TpFIBDataSet;
    SchDataSource: TDataSource;
    SchDataSetID_SCH: TFIBIntegerField;
    SchDataSetSCH_TITLE: TFIBStringField;
    SchDataSetSCH_NUMBER: TFIBStringField;
    SchDataSetSCH_TYPE: TFIBIntegerField;
    SchDataSetLINK_TO: TFIBIntegerField;
    SchDataSetDATE_BEG: TFIBDateTimeField;
    SchDataSetDATE_END: TFIBDateTimeField;
    SchDataSetTYPE_OBJECT: TFIBIntegerField;
    SchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField;
    SchDataSetSCH_TYPE_TITLE: TFIBStringField;
    SchDataSetID_SYSTEM: TFIBIntegerField;
    WorkDataSetID_MARK: TFIBBCDField;
    WorkDataSetMARK: TFIBStringField;
    cxLookupSch: TcxButtonEdit;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1ID_SCH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCH_NUMBER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCH_TITLE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_MO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SFIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NAME_DEPARTMENT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_NOMN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NOMN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_UNIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1UNIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1UNIT_NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_OST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_OST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1MOL: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    PrhDocDataSet: TpFIBDataSet;
    RshDocDataSet: TpFIBDataSet;
    PrhDocDataSource: TDataSource;
    RshDocDataSource: TDataSource;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid2ID_DOC: TcxGridDBColumn;
    cxGrid2ID_TIPD: TcxGridDBColumn;
    cxGrid2TIPD: TcxGridDBColumn;
    cxGrid2NAME_TIPD: TcxGridDBColumn;
    cxGrid2NUM_DOC: TcxGridDBColumn;
    cxGrid2DATE_DOC: TcxGridDBColumn;
    cxGrid2ID_MO_OUT: TcxGridDBColumn;
    cxGrid2ID_CUST: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid3ID_DOC: TcxGridDBColumn;
    cxGrid3ID_TIPD: TcxGridDBColumn;
    cxGrid3TIPD: TcxGridDBColumn;
    cxGrid3NAME_TIPD: TcxGridDBColumn;
    cxGrid3NUM_DOC: TcxGridDBColumn;
    cxGrid3DATE_DOC: TcxGridDBColumn;
    cxGrid3ID_MO_IN: TcxGridDBColumn;
    cxGrid3ID_CUST: TcxGridDBColumn;
    RepPrhDocDataSet: TpFIBDataSet;
    RepRshDocDataSet: TpFIBDataSet;
    RepPrhDocDataSetID_DOC: TFIBBCDField;
    RepPrhDocDataSetID_TIPD: TFIBBCDField;
    RepPrhDocDataSetTIPD: TFIBStringField;
    RepPrhDocDataSetNAME_TIPD: TFIBStringField;
    RepPrhDocDataSetNUM_DOC: TFIBStringField;
    RepPrhDocDataSetDATE_DOC: TFIBDateField;
    RepPrhDocDataSetID_MO_OUT: TFIBBCDField;
    RepPrhDocDataSetFIO_MO_OUT: TFIBStringField;
    RepPrhDocDataSetNAME_DEP_OUT: TFIBStringField;
    RepPrhDocDataSetID_CUST: TFIBBCDField;
    RepPrhDocDataSetNAME_CUSTOMER: TFIBStringField;
    RepRshDocDataSetID_DOC: TFIBBCDField;
    RepRshDocDataSetID_TIPD: TFIBBCDField;
    RepRshDocDataSetTIPD: TFIBStringField;
    RepRshDocDataSetNAME_TIPD: TFIBStringField;
    RepRshDocDataSetNUM_DOC: TFIBStringField;
    RepRshDocDataSetDATE_DOC: TFIBDateField;
    RepRshDocDataSetID_MO_IN: TFIBBCDField;
    RepRshDocDataSetFIO_MO_IN: TFIBStringField;
    RepRshDocDataSetNAME_DEP_IN: TFIBStringField;
    RepRshDocDataSetID_CUST: TFIBBCDField;
    RepRshDocDataSetNAME_CUSTOMER: TFIBStringField;
    OborotDataBase: TpFIBDatabase;
    OborotTransaction: TpFIBTransaction;
    WorkDataSetPRICE: TFIBBCDField;
    cxGrid1DBBandedTableView1PRICE: TcxGridDBBandedColumn;
    WorkDataSetID_OST: TFIBBCDField;
    pmOborot: TPopupMenu;
    NPrint: TMenuItem;
    NMoveOst: TMenuItem;
    N4: TMenuItem;
    NRefresh: TMenuItem;
    imgOborot: TImageList;
    WorkStoredProc: TpFIBStoredProc;
    cxGrid2KOL_MAT: TcxGridDBColumn;
    cxGrid2SUMMA: TcxGridDBColumn;
    cxGrid3KOL_MAT: TcxGridDBColumn;
    cxGrid3SUMMA: TcxGridDBColumn;
    CrossDataSet: TpFIBDataSet;
    CrossDataSetID_SCH: TFIBBCDField;
    CrossDataSetSCH_NUMBER: TFIBStringField;
    CrossDataSetSCH_TITLE: TFIBStringField;
    CrossDataSetID_MO: TFIBBCDField;
    CrossDataSetFIO: TFIBStringField;
    CrossDataSetSFIO: TFIBStringField;
    CrossDataSetNAME_DEPARTMENT: TFIBStringField;
    CrossDataSetID_OST: TFIBBCDField;
    CrossDataSetID_NOMN: TFIBIntegerField;
    CrossDataSetNOMN: TFIBStringField;
    CrossDataSetNAME: TFIBStringField;
    CrossDataSetID_UNIT: TFIBIntegerField;
    CrossDataSetUNIT: TFIBStringField;
    CrossDataSetUNIT_NAME: TFIBStringField;
    CrossDataSetTIP_COLUMN: TFIBIntegerField;
    CrossDataSetPRICE: TFIBBCDField;
    CrossDataSetKOL_MAT: TFIBBCDField;
    CrossDataSetSUMMA: TFIBBCDField;
    CrossDataSetID_MARK: TFIBBCDField;
    CrossDataSetMARK: TFIBStringField;
    WorkTransaction: TpFIBTransaction;
    StringGrid1: TStringGrid;
    RepRshMOLDataSet: TpFIBDataSet;
    RepRshMOLDataSetID_MO_IN: TFIBBCDField;
    RepRshMOLDataSetFIO_MO_IN: TFIBStringField;
    RepRshMOLDataSetSFIO: TFIBStringField;
    RepRshMOLDataSetNAME_DEP_IN: TFIBStringField;
    RepRshMOLDataSetID_CUST: TFIBBCDField;
    RepRshMOLDataSetNAME_CUSTOMER: TFIBStringField;
    OborRepDataSet: TpFIBDataSet;
    LabelEnd: TLabel;
    OborotFormStorage: TFormStorage;
    WorkDataSetBAL_ID_SCH: TFIBIntegerField;
    WorkDataSetBAL_SCH_NUMBER: TFIBStringField;
    WorkDataSetBAL_SCH_TITLE: TFIBStringField;
    WorkDataSetINV_NUM_LIST: TFIBStringField;
    WorkDataSetMNA_NUM_LIST: TFIBStringField;
    WorkDataSetDOC_ID_TIPD: TFIBIntegerField;
    WorkDataSetDOC_TIPD: TFIBStringField;
    WorkDataSetDOC_NAME_TIPD: TFIBStringField;
    WorkDataSetDOC_NUM_DOC: TFIBStringField;
    WorkDataSetDOC_DATE_DOC: TFIBDateField;
    WorkDataSetDATE_OPR: TFIBDateField;
    MainActionList: TActionList;
    acShow: TAction;
    acPrint: TAction;
    acExit: TAction;
    acFields: TAction;
    acExport: TAction;
    N1: TMenuItem;
    acExport1: TMenuItem;
    PrhDocDataSetID_DOC: TFIBBCDField;
    PrhDocDataSetID_TIPD: TFIBBCDField;
    PrhDocDataSetTIPD: TFIBStringField;
    PrhDocDataSetNAME_TIPD: TFIBStringField;
    PrhDocDataSetNUM_DOC: TFIBStringField;
    PrhDocDataSetDATE_DOC: TFIBDateField;
    PrhDocDataSetID_MO_OUT: TFIBBCDField;
    PrhDocDataSetID_CUST: TFIBBCDField;
    PrhDocDataSetKOL_MAT: TFIBBCDField;
    PrhDocDataSetSUMMA: TFIBBCDField;
    PrhDocDataSetNAME_OUT: TFIBStringField;
    RshDocDataSetID_DOC: TFIBBCDField;
    RshDocDataSetID_TIPD: TFIBBCDField;
    RshDocDataSetTIPD: TFIBStringField;
    RshDocDataSetNAME_TIPD: TFIBStringField;
    RshDocDataSetNUM_DOC: TFIBStringField;
    RshDocDataSetDATE_DOC: TFIBDateField;
    RshDocDataSetID_MO_IN: TFIBBCDField;
    RshDocDataSetID_CUST: TFIBBCDField;
    RshDocDataSetKOL_MAT: TFIBBCDField;
    RshDocDataSetSUMMA: TFIBBCDField;
    RshDocDataSetNAME_IN: TFIBStringField;
    cxGrid2NAME: TcxGridDBColumn;
    cxGrid3NAME: TcxGridDBColumn;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxDS_Docs: TfrxDBDataset;
    ds_docs: TpFIBDataSet;
    ds_invnum: TpFIBDataSet;
    procedure cxExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SetSelectSQL;
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMonthBegPropertiesChange(Sender: TObject);
    procedure cxYearBegPropertiesChange(Sender: TObject);
    procedure cxMonthEndPropertiesChange(Sender: TObject);
    procedure cxYearEndPropertiesChange(Sender: TObject);
    procedure NMoveOstClick(Sender: TObject);
    procedure frReportCross1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReportCross1PrintColumn(ColNo: Integer;
      var Width: Integer);
    procedure frReportCross1BeforePrint(Memo: TStringList; View: TfrView);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid3DBTableView1DblClick(Sender: TObject);
    procedure MakeCrossTabReportByMO;
    procedure MakeCrossTabReportByDoc;
    procedure FormResize(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acFieldsExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   FWidth:integer;
   ID_MO: integer;
   ID_SCH: integer;
   FioMO, SpodrMO: string;
   DATE_BEG, DATE_END, PERIOD: TDateTime;
   F_SCH: boolean;
   FILTER_ID_SESSION: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

procedure ShowRepOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepOborot;

var
  OborotForm: TOborotForm;

implementation

uses uRepWorkSplash, uSpMatSch, uRepOborotFormPrint;

{$R *.dfm}

procedure ShowRepOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TOborotForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TOborotForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.OborotDataBase.Close;
   Self.OborotDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=PERIOD;
 end;
end;

procedure TOborotForm.SetSelectSQL;
var
 f: boolean;
 prefix: string;
begin
 prefix:='WHERE ';
 WorkDataSet.SelectSQL.Clear;
 WorkDataSet.SelectSQL.Add('SELECT * ');
 WorkDataSet.SelectSQL.Add('FROM MAT_MAKE_OBOROT_BY_PERIOD(:PID_MO, :DATE_BEG, :DATE_END)');
 f:=false;
 if F_SCH then
 begin
  WorkDataSet.SelectSQL.Add(prefix+' ( ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
  WorkDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
 end;
 WorkDataSet.SelectSQL.Add('ORDER BY FIO, NAME_DEPARTMENT, SCH_NUMBER, NAME');
end;

procedure TOborotForm.cxExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOborotForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOborotForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  IsMoOk:boolean;
begin
 IsMoOk:=false;
 Res:=uSpMatOtv.GetMatOtv(self, DBHANDLE, 0, ID_MO);
 if  VarType(Res) <> varEmpty then
 begin
  ID_MO:=Res[0];
  FioMO := Res[1];
  SpodrMO := Res[2];
  IsMoOk:=true;
 end;
  if IsMoOk then
  begin
   cxMatOtv.Text:=FioMO+' / '+SpodrMO;
   acShowExecute(self);
  end;
end;

procedure TOborotForm.FormCreate(Sender: TObject);
var
 dd, dm, dy: Word;
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OBV;
 with OborotFormStorage do
 begin
  RestoreFormPlacement;
  Width:=StoredValue['FormWidth'];
  Height:=StoredValue['FormHeight'];
 end;
 if Width<750 then Width:=750;
 if Height<550 then Height:=550;
 ID_SCH:=0;
 ID_MO:=0;
 FioMO:='';
 SpodrMO:='';
 LoadMonthTocxComboBox(cxMonthBeg);
 LoadMonthTocxComboBox(cxMonthEnd);
 LabelMol.Caption:=MAT_STR_COL_MOL;
 LabelBeg.Caption:=MAT_STR_COL_BEG;
 LabelEnd.Caption:=MAT_STR_COL_END;
 LabelSch.Caption:=MAT_STR_COL_SCH;
 ApplyButton.Caption:=MAT_BUTTON_SHOW_CONST;
 PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 ExitButton.Caption:=MAT_ACTION_CLOSE_CONST;
 cxGrid1DBBandedTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBBandedTableView1NAME.Caption:=MAT_STR_COL_NAME_TMC;
 cxGrid1DBBandedTableView1UNIT.Caption:=MAT_STR_COL_NAME_UNIT;
 cxGrid1DBBandedTableView1PRICE.Caption:=MAT_STR_COL_NAME_UNIT;
 cxGrid1DBBandedTableView1KOL_BEG.Caption:=MAT_STR_COL_KOL_BEG;
 cxGrid1DBBandedTableView1KOL_PRH.Caption:=MAT_STR_COL_PRH_KOL;
 cxGrid1DBBandedTableView1KOL_OST.Caption:=MAT_STR_COL_KOL_END;
 cxGrid1DBBandedTableView1KOL_RSH.Caption:=MAT_STR_COL_RSH_KOL;
 cxGrid1DBBandedTableView1SUMM_BEG.Caption:=MAT_STR_COL_SUM_BEG;
 cxGrid1DBBandedTableView1SUMM_OST.Caption:=MAT_STR_COL_SUM_END;
 cxGrid1DBBandedTableView1SUMM_PRH.Caption:=MAT_STR_COL_PRH_SUM;
 cxGrid1DBBandedTableView1SUMM_RSH.Caption:=MAT_STR_COL_RSH_SUM;
 cxGrid2TIPD.Caption:=MAT_STR_COL_TIPD;
 cxGrid2NUM_DOC.Caption:=MAT_STR_COL_NUM_DOC;
 cxGrid2DATE_DOC.Caption:=MAT_STR_COL_DATE_DOC;
// cxGrid2FIO_MO_OUT.Caption:=MAT_STR_COL_OUT;
 cxGrid2KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGrid2SUMMA.Caption:=MAT_STR_COL_SUMMA;
 cxGrid3TIPD.Caption:=MAT_STR_COL_TIPD;
 cxGrid3NUM_DOC.Caption:=MAT_STR_COL_NUM_DOC;
 cxGrid3DATE_DOC.Caption:=MAT_STR_COL_DATE_DOC;
// cxGrid3FIO_MO_IN.Caption:=MAT_STR_COL_IN;
 cxGrid3KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGrid3SUMMA.Caption:=MAT_STR_COL_SUMMA;
 NRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 NPrint.Caption:=MAT_ACTION_PRINT_CONST;
 NMoveOst.Caption:=MAT_STR_MOVE_OST;
 acExport.Caption:=MAT_ACTION_EXPORT_CONST;
 DecodeDate(PERIOD, dy, dm,  dd);
 cxMonthEnd.ItemIndex:=dm-1;
 cxYearEnd.Value:=dy;
 cxMonthBeg.ItemIndex:=dm-1;
 cxYearBeg.Value:=dy;
 Date_Beg:=StartOfTheMonth(PERIOD);
 Date_End:=EndOfTheMonth(PERIOD);
 SchDataSet.Close;
 SchDataSet.ParamByName('PERIOD').Value:=DATE_END;
 SchDataSet.CloseOpen(true);
 cxSplitter1.CloseSplitter;
 F_SCH:=false;
end;

procedure TOborotForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
 end
end;

procedure TOborotForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 if FILTER_ID_SESSION=0 then
  FILTER_ID_SESSION:=OborotDataBase.Gen_Id('MAT_ID_SESSION',1, OborotTransaction);
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  cxLookupSch.Text:='';
 end;
end;

procedure TOborotForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
 end
end;

procedure TOborotForm.cxMonthBegPropertiesChange(Sender: TObject);
var
 DEND, DBEG: TDate;
begin
 DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
 DBEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
 if DBEG>DEND then
 begin
  cxYearEnd.Value:=cxYearBeg.Value;
  cxMonthEnd.ItemIndex:=cxMonthBeg.ItemIndex;
 end;
end;

procedure TOborotForm.cxYearBegPropertiesChange(Sender: TObject);
var
 DEND, DBEG: TDate;
begin
 DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
 DBEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
 if DBEG>DEND then
 begin
  cxYearEnd.Value:=cxYearBeg.Value;
  cxMonthEnd.ItemIndex:=cxMonthBeg.ItemIndex;
 end;
end;

procedure TOborotForm.cxMonthEndPropertiesChange(Sender: TObject);
var
 DEND, DBEG: TDate;
begin
 DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
 DBEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
 if DBEG>DEND then
 begin
  cxYearBeg.Value:=cxYearEnd.Value;
  cxMonthBeg.ItemIndex:=cxMonthEnd.ItemIndex;
 end;
end;

procedure TOborotForm.cxYearEndPropertiesChange(Sender: TObject);
var
 DEND, DBEG: TDate;
begin
 DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
 DBEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
 if DBEG>DEND then
 begin
  cxYearBeg.Value:=cxYearEnd.Value;
  cxMonthBeg.ItemIndex:=cxMonthEnd.ItemIndex;
 end;
end;

procedure TOborotForm.NMoveOstClick(Sender: TObject);
var
 NewDateRec: TDateTime;
 dy, dm, dd: Word;
 MsgStr1, MsgStr2: string;
 sp: TSplashForm;
begin
 if ID_MO<=0 then
  exit;
 DecodeDate(DATE_END, dy, dm,  dd);
 IncAMonth(dy, dm, dd, 1);
 MsgStr1:=PChar('Ви дійсно бажаєте перенести залишки по '+FioMO);
 MsgStr2:=PChar(' на '+GetMonthName(dm)+' '+IntToStr(dy)+'?');
 if agMessageDlg(PChar('Увага!'), MsgStr1+MsgStr2, mtConfirmation, mbOKCancel)=mrOk then
 begin
  Refresh;
  sp:=TSplashForm.Create(self);
  sp.Show;
  sp.MsgLabel.Caption:='Перенос залишків на '+GetMonthName(dm)+' '+IntToStr(dy);
  sp.ProgressBar.Position:=80;
  sp.Update;
  NewDateRec:=StartOfAMonth(dy, dm);
  try
   WorkStoredProc.Transaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_MOVE_NEW_PERIOD_FOR_MO';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('PID_MO').Value:=ID_MO;
   WorkStoredProc.ParamByName('NEW_DATE_REC').Value:=NewDateRec;
   WorkStoredProc.ParamByName('DATE_BEG').Value:=DATE_BEG;
   WorkStoredProc.ParamByName('DATE_END').Value:=DATE_END;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
   sp.ProgressBar.Position:=100;
   sp.Update;
   acShowExecute(self);
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  sp.Free;
 end;
end;

procedure TOborotForm.frReportCross1GetValue(const ParName: String;
  var ParValue: Variant);
var
 s: string;
 v: double;
begin
  //  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
{  if AnsiCompareText(ParName, 'Cell') = 0 then
  begin
    if (ColDataSet.RecNo=0) and (RowDataset.RecNo=0) then
     ParValue:='***'
    else if ColDataset.RecNo=0 then
     ParValue := IntToStr(RowDataSet.RecNo-1)
//StringGrid1.Cells[ColDataset.RecNo, RowDataset.RecNo-1]
    else if RowDataset.RecNo=0 then
     ParValue := IntToStr(ColDataSet.RecNo)
    else if ColDataset.RecNo<3 then
     ParValue := StringGrid1.Cells[ColDataset.RecNo, RowDataset.RecNo-1]
    else
    begin
     if TryStrToFloat(StringGrid1.Cells[ColDataset.RecNo, RowDataset.RecNo-1], v) then
     begin
      if (ColDataset.RecNo mod 2 =1) then
       s:=FormatFloat('0.0000',v)
      else
       s:=FormatFloat('0.00',v);
      ParValue:=s;
     end
     else
      ParValue := StringGrid1.Cells[ColDataset.RecNo, RowDataset.RecNo-1]
    end;
   if RowDataset.Recno=0 then
   begin
    if ColDataSet.RecNo=0 then ParValue:='№ п/п';
    if ColDataSet.RecNo=1 then ParValue:='Название';
    if ColDataSet.RecNo=2 then ParValue:='Ед. изм.';
    if ColDataSet.RecNo=3 then ParValue:='Цена';
    if (ColDataSet.RecNo>4) and (ColDataSet.RecNo mod 2 = 1) then
     ParValue := StringGrid1.Cells[ColDataset.RecNo, RowDataset.RecNo]+' '+StringGrid1.Cells[ColDataset.RecNo+1, RowDataset.RecNo];
    if ColDataSet.RecNo=StringGrid1.ColCount-2 then ParValue:='Остаток на '+DateToStr(DATE_END);
    if ColDataSet.RecNo=5 then ParValue:='Остаток на '+DateToStr(DATE_BEG);
    if ColDataSet.RecNo=7 then ParValue:='Приход';
   end;
   if (RowDataset.Recno=1) and (ColDataset.Recno>4) then
   begin
    if (ColDataSet.RecNo mod 2 = 1) then ParValue:='Количество';
    if (ColDataSet.RecNo mod 2 = 0) then ParValue:='Сумма';
   end;
   if (RowDataSet.RecNo=StringGrid1.RowCount) and (ColDataSet.Recno<4) then
    ParValue:='';
  end;}
end;

procedure TOborotForm.frReportCross1PrintColumn(ColNo: Integer;
  var Width: Integer);
begin
  if ColNo=1 then
    Width := 40
  else if ColNo=2 then
    Width := 300
  else if ColNo=3 then
    Width := 40
  else if ColNo=5 then
    Width := 0
  else Width:=80;
  FWidth:=Width;
end;

procedure TOborotForm.frReportCross1BeforePrint(Memo: TStringList;
  View: TfrView);
begin
  //  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
{ if View.Name='Memo1' then
 begin
  View.Prop['Alignment']:=frtaRight;
  if ColDataset.RecNo=1 then
   View.Prop['Alignment']:=frtaLeft;
  if ColDataset.RecNo=2 then
   View.Prop['Alignment']:=frtaCenter;
  if (RowDataset.Recno=0) or (RowDataset.Recno=1) then
   View.Prop['Alignment']:=frtaCenter;
  View.dy:=18;
  View.Visible:=true;
  if (RowDataSet.RecNo=0) then
  begin
   if ColDataset.RecNo<5 then
    View.dy:=36;
   if (ColDataset.Recno>4) then
   begin
    if  (ColDataset.RecNo mod 2 =0) then
     View.Visible:=false
    else
     FWidth:=160;
   end
  end
  else if (RowDataSet.RecNo=1) and (ColDataset.Recno<5) then
   View.Visible:=false
  else
   View.Visible:=true;
  View.dx := FWidth;
 end;  }
end;

procedure TOborotForm.cxGridDBTableView1DblClick(Sender: TObject);
begin
 uPackageManager.ViewDoc(self, DBHANDLE, PrhDocDataSet.FieldByName('ID_DOC').AsInteger);
end;

procedure TOborotForm.cxGrid3DBTableView1DblClick(Sender: TObject);
begin
 uPackageManager.ViewDoc(self, DBHANDLE, RshDocDataSet.FieldByName('ID_DOC').AsInteger);
end;

procedure TOborotForm.FormResize(Sender: TObject);
begin
 cxGrid2.Width:= (Width div 2) - 4; 
end;

procedure TOborotForm.MakeCrossTabReportByMO;
var
 cur_sch: string;
 i, j:integer;
 ekol, esum: double;
 ItgKol: array of double;
 ItgSch: array of double;
 prefix: integer;
begin
//  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
  { CrossDataSet.Close;
   CrossDataSet.SelectSQL.Clear;
   CrossDataSet.SelectSQL.Add('SELECT * FROM MAT_MAKE_OBOROT_BY_PERIOD_CROSS(:PID_MO,:PDATE_BEG, :PDATE_END)');
   CrossDataSet.Prepare;
   CrossDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
   CrossDataSet.ParamByName('PDATE_END').Value:=DATE_END;
   CrossDataSet.ParamByName('PID_MO').Value:=ID_MO;
   CrossDataSet.CloseOpen(false);
   StringGrid1.Align:=alClient;
   StringGrid1.ColCount:=9+RepRshDocDataSet.RecordCount*2+2;
   StringGrid1.RowCount:=2+WorkDataSet.RecordCount;
   SetLength(ItgKol, 9+RepRshDocDataSet.RecordCount*2+2);
   SetLength(ItgSch, 9+RepRshDocDataSet.RecordCount*2+2);
   for i:=0 to 9+RepRshDocDataSet.RecordCount*2+1 do
   begin
    ItgKol[i]:=0;
    ItgSch[i]:=0;
   end;
   StringGrid1.Cells[0,0]:='SCH';
   StringGrid1.Cells[1,0]:='NAME';
   StringGrid1.Cells[2,0]:='UNIT';
   StringGrid1.Cells[3,0]:='PRICE';
   StringGrid1.Cells[4,0]:='ID_OST';
   StringGrid1.Cells[5,0]:='BEG_KOL';
   StringGrid1.Cells[6,0]:='BEG_SUM';
   StringGrid1.Cells[7,0]:='PRH_KOL';
   StringGrid1.Cells[8,0]:='PRH_SUM';
   RepRshDocDataSet.First;
   while not RepRshDocDataSet.Eof do
   begin
    StringGrid1.Cells[8+RepRshDocDataSet.RecNo*2-1,0]:=RepRshDocDataSetTIPD.AsString;
    StringGrid1.Cells[8+RepRshDocDataSet.RecNo*2,  0]:=RepRshDocDataSetNUM_DOC.AsString;
    RepRshDocDataSet.Next;
   end;
   StringGrid1.Cells[9+RepRshDocDataSet.RecNo*2,0]:='END_KOL';
   StringGrid1.Cells[10+RepRshDocDataSet.RecNo*2,  0]:='END_SUM';
   CrossDataSet.First;
   ekol:=0;
   esum:=0;
   cur_sch:=CrossDataSetSCH_NUMBER.AsString;
   prefix:=0;
   while not CrossDataSet.Eof do
   begin
    if WorkDataSet.Locate('ID_OST;ID_SCH',VarArrayOf([CrossDataSetID_OST.AsInteger,CrossDataSetID_SCH.AsInteger]),[]) then
    begin
      StringGrid1.Cells[0,WorkDataSet.RecNo+prefix]:=CrossDataSetSCH_NUMBER.AsString;
      StringGrid1.Cells[1,WorkDataSet.RecNo+prefix]:=CrossDataSetNAME.AsString;
      StringGrid1.Cells[2,WorkDataSet.RecNo+prefix]:=CrossDataSetUNIT.AsString;
      StringGrid1.Cells[3,WorkDataSet.RecNo+prefix]:=CrossDataSetPRICE.AsString;
      StringGrid1.Cells[4,WorkDataSet.RecNo+prefix]:=CrossDataSetID_OST.AsString;
      if CrossDataSetTIP_COLUMN.AsInteger=1 then
      begin
       ekol:=CrossDataSetKOL_MAT.AsFloat;
       esum:=CrossDataSetSUMMA.AsFloat;
       StringGrid1.Cells[5,WorkDataSet.RecNo+prefix]:=CrossDataSetKOL_MAT.AsString;
       StringGrid1.Cells[6,WorkDataSet.RecNo+prefix]:=CrossDataSetSUMMA.AsString;
       ItgKol[5]:=ItgKol[5]+CrossDataSetKOL_MAT.AsFloat;
       ItgKol[6]:=ItgKol[6]+CrossDataSetSUMMA.AsFloat;
       ItgSch[5]:=ItgSch[5]+CrossDataSetKOL_MAT.AsFloat;
       ItgSch[6]:=ItgSch[6]+CrossDataSetSUMMA.AsFloat;
      end;
      if CrossDataSetTIP_COLUMN.AsInteger=2 then
      begin
       ekol:=ekol+CrossDataSetKOL_MAT.AsFloat;
       esum:=esum+CrossDataSetSUMMA.AsFloat;
       StringGrid1.Cells[7,WorkDataSet.RecNo+prefix]:=CrossDataSetKOL_MAT.AsString;
       StringGrid1.Cells[8,WorkDataSet.RecNo+prefix]:=CrossDataSetSUMMA.AsString;
       ItgKol[7]:=ItgKol[7]+CrossDataSetKOL_MAT.AsFloat;
       ItgKol[8]:=ItgKol[8]+CrossDataSetSUMMA.AsFloat;
       ItgSch[7]:=ItgSch[7]+CrossDataSetKOL_MAT.AsFloat;
       ItgSch[8]:=ItgSch[8]+CrossDataSetSUMMA.AsFloat;
      end;
      if CrossDataSetTIP_COLUMN.AsInteger=3 then
      begin
       ekol:=ekol-CrossDataSetKOL_MAT.AsFloat;
       esum:=esum-CrossDataSetSUMMA.AsFloat;
       if RepRshDocDataSet.Locate('ID_DOC',CrossDataSetID_MARK.AsInteger,[]) then
       begin
        StringGrid1.Cells[8+RepRshDocDataSet.RecNo*2-1,WorkDataSet.RecNo+prefix]:=CrossDataSetKOL_MAT.AsString;
        StringGrid1.Cells[8+RepRshDocDataSet.RecNo*2,WorkDataSet.RecNo+prefix]:=CrossDataSetSUMMA.AsString;
        ItgKol[8+RepRshDocDataSet.RecNo*2-1]:=ItgKol[8+RepRshDocDataSet.RecNo*2-1]+CrossDataSetKOL_MAT.AsFloat;
        ItgKol[8+RepRshDocDataSet.RecNo*2]:=ItgKol[8+RepRshDocDataSet.RecNo*2]+CrossDataSetSUMMA.AsFloat;
        ItgSch[8+RepRshDocDataSet.RecNo*2-1]:=ItgSch[8+RepRshDocDataSet.RecNo*2-1]+CrossDataSetKOL_MAT.AsFloat;
        ItgSch[8+RepRshDocDataSet.RecNo*2]:=ItgSch[8+RepRshDocDataSet.RecNo*2]+CrossDataSetSUMMA.AsFloat;
       end
      end;
    end;
    StringGrid1.Cells[9+RepRshDocDataSet.RecordCount*2, WorkDataSet.RecNo+prefix]:=FloatToStr(ekol);
    StringGrid1.Cells[10+RepRshDocDataSet.RecordCount*2,WorkDataSet.RecNo+prefix]:=FloatToStr(esum);
    ItgKol[9+RepRshDocDataSet.RecNo*2]:=ItgKol[9+RepRshDocDataSet.RecNo*2]+ekol;
    ItgKol[9+RepRshDocDataSet.RecNo*2+1]:=ItgKol[9+RepRshDocDataSet.RecNo*2+1]+esum;
    ItgSch[9+RepRshDocDataSet.RecNo*2]:=ItgSch[9+RepRshDocDataSet.RecNo*2]+ekol;
    ItgSch[9+RepRshDocDataSet.RecNo*2+1]:=ItgSch[9+RepRshDocDataSet.RecNo*2+1]+esum;
    CrossDataSet.Next;
    if (cur_sch<>CrossDataSetSCH_NUMBER.AsString) then
    begin
     if WorkDataSet.Locate('ID_OST;ID_SCH',VarArrayOf([CrossDataSetID_OST.AsInteger,CrossDataSetID_SCH.AsInteger]),[]) then
     begin
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
      prefix:=prefix+1;
      for i:=5 to 9+RepRshDocDataSet.RecordCount*2 do
       StringGrid1.Cells[i,WorkDataSet.RecNo+prefix-1]:=FloatToStr(ItgSch[i]);
      StringGrid1.Cells[1,WorkDataSet.RecNo+prefix-1]:='   Итого по счету '+cur_sch+':';
      StringGrid1.Cells[4,WorkDataSet.RecNo+prefix-1]:='*';
      for i:=0 to 9+RepRshDocDataSet.RecordCount*2 do
       ItgSch[i]:=0;
     end;
     cur_sch:=CrossDataSetSCH_NUMBER.AsString;
    end;
   end;
   for i:=5 to 9+RepRshDocDataSet.RecordCount*2 do
    StringGrid1.Cells[i,WorkDataSet.RecordCount+prefix-1]:=FloatToStr(ItgSch[i]);
   StringGrid1.Cells[1,WorkDataSet.RecordCount+prefix-1]:='   Итого по счету '+cur_sch+':';
   for i:=0 to StringGrid1.ColCount do
    StringGrid1.Cells[i,1+WorkDataSet.RecordCount+prefix]:=FloatToStr(ItgKol[i]);
   StringGrid1.Cells[1,WorkDataSet.RecordCount+prefix]:='ИТОГО';
   ColDataset.RangeEnd := reCount;
   ColDataset.RangeEndCount := StringGrid1.ColCount;
   RowDataset.RangeEnd := reCount;
   RowDataset.RangeEndCount := StringGrid1.RowCount+1;  }
end;


procedure TOborotForm.MakeCrossTabReportByDoc;
var
 i, j:integer;
 ekol, esum: double;
 ItgKol: array of double;
 ItgSch: array of double;
 cur_sch: string;
 prefix: integer;
begin
  //  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
  { CrossDataSet.Close;
   CrossDataSet.SelectSQL.Clear;
   CrossDataSet.SelectSQL.Add('SELECT * FROM MAT_MAKE_OBOROT_BY_PERIOD_CR_MO(:PID_MO,:PDATE_BEG, :PDATE_END)');
   CrossDataSet.Prepare;
   CrossDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
   CrossDataSet.ParamByName('PDATE_END').Value:=DATE_END;
   CrossDataSet.ParamByName('PID_MO').Value:=ID_MO;
   CrossDataSet.CloseOpen(false);
   StringGrid1.Align:=alClient;
   StringGrid1.ColCount:=9+RepRshMOLDataSet.RecordCount*2+2;
   StringGrid1.RowCount:=2+WorkDataSet.RecordCount;
   SetLength(ItgKol, 9+RepRshDocDataSet.RecordCount*2+2);
   for i:=0 to 9+RepRshDocDataSet.RecordCount*2+1 do
    ItgKol[i]:=0;
   StringGrid1.Cells[0,0]:='SCH';
   StringGrid1.Cells[1,0]:='NAME';
   StringGrid1.Cells[2,0]:='UNIT';
   StringGrid1.Cells[3,0]:='PRICE';
   StringGrid1.Cells[4,0]:='ID_OST';
   StringGrid1.Cells[5,0]:='BEG_KOL';
   StringGrid1.Cells[6,0]:='BEG_SUM';
   StringGrid1.Cells[7,0]:='PRH_KOL';
   StringGrid1.Cells[8,0]:='PRH_SUM';
   RepRshMOLDataSet.First;
   while not RepRshMOLDataSet.Eof do
   begin
    StringGrid1.Cells[8+RepRshMOLDataSet.RecNo*2-1,0]:='';
    StringGrid1.Cells[8+RepRshMOLDataSet.RecNo*2,  0]:=RepRshMOLDataSetSFIO.AsString;
    RepRshMOLDataSet.Next;
   end;
   StringGrid1.Cells[9+RepRshMOLDataSet.RecNo*2,0]:='END_KOL';
   StringGrid1.Cells[10+RepRshMOLDataSet.RecNo*2,  0]:='END_SUM';
   CrossDataSet.First;
   ekol:=0;
   esum:=0;
   while not CrossDataSet.Eof do
   begin
    if WorkDataSet.Locate('ID_OST;ID_SCH',VarArrayOf([CrossDataSetID_OST.AsInteger,CrossDataSetID_SCH.AsInteger]),[]) then
    begin
      StringGrid1.Cells[0,WorkDataSet.RecNo]:=CrossDataSetSCH_NUMBER.AsString;
      StringGrid1.Cells[1,WorkDataSet.RecNo]:=CrossDataSetNAME.AsString;
      StringGrid1.Cells[2,WorkDataSet.RecNo]:=CrossDataSetUNIT.AsString;
      StringGrid1.Cells[3,WorkDataSet.RecNo]:=CrossDataSetPRICE.AsString;
      StringGrid1.Cells[4,WorkDataSet.RecNo]:=CrossDataSetID_OST.AsString;
      if CrossDataSetTIP_COLUMN.AsInteger=1 then
      begin
       ekol:=CrossDataSetKOL_MAT.AsFloat;
       esum:=CrossDataSetSUMMA.AsFloat;
       StringGrid1.Cells[5,WorkDataSet.RecNo]:=CrossDataSetKOL_MAT.AsString;
       StringGrid1.Cells[6,WorkDataSet.RecNo]:=CrossDataSetSUMMA.AsString;
       ItgKol[5]:=ItgKol[5]+CrossDataSetKOL_MAT.AsFloat;
       ItgKol[6]:=ItgKol[6]+CrossDataSetSUMMA.AsFloat;
      end;
      if CrossDataSetTIP_COLUMN.AsInteger=2 then
      begin
       ekol:=ekol+CrossDataSetKOL_MAT.AsFloat;
       esum:=esum+CrossDataSetSUMMA.AsFloat;
       StringGrid1.Cells[7,WorkDataSet.RecNo]:=CrossDataSetKOL_MAT.AsString;
       StringGrid1.Cells[8,WorkDataSet.RecNo]:=CrossDataSetSUMMA.AsString;
       ItgKol[7]:=ItgKol[7]+CrossDataSetKOL_MAT.AsFloat;
       ItgKol[8]:=ItgKol[8]+CrossDataSetSUMMA.AsFloat;
      end;
      if CrossDataSetTIP_COLUMN.AsInteger=3 then
      begin
       ekol:=ekol-CrossDataSetKOL_MAT.AsFloat;
       esum:=esum-CrossDataSetSUMMA.AsFloat;
       if RepRshMOLDataSet.Locate('ID_MO_IN',CrossDataSetID_MARK.AsInteger,[]) then
       begin
        StringGrid1.Cells[8+RepRshMOLDataSet.RecNo*2-1,WorkDataSet.RecNo]:=CrossDataSetKOL_MAT.AsString;
        StringGrid1.Cells[8+RepRshMOLDataSet.RecNo*2,WorkDataSet.RecNo]:=CrossDataSetSUMMA.AsString;
        ItgKol[8+RepRshDocDataSet.RecNo*2-1]:=ItgKol[8+RepRshDocDataSet.RecNo*2-1]+CrossDataSetKOL_MAT.AsFloat;
        ItgKol[8+RepRshDocDataSet.RecNo*2]:=ItgKol[8+RepRshDocDataSet.RecNo*2]+CrossDataSetSUMMA.AsFloat;
       end
      end;
    end;
    StringGrid1.Cells[9+RepRshDocDataSet.RecordCount*2, WorkDataSet.RecNo]:=FloatToStr(ekol);
    StringGrid1.Cells[10+RepRshDocDataSet.RecordCount*2,WorkDataSet.RecNo]:=FloatToStr(esum);
    ItgKol[9+RepRshDocDataSet.RecNo*2]:=ItgKol[9+RepRshDocDataSet.RecNo*2]+ekol;
    ItgKol[9+RepRshDocDataSet.RecNo*2+1]:=ItgKol[9+RepRshDocDataSet.RecNo*2+1]+esum;
    CrossDataSet.Next;
   end;
   for i:=0 to StringGrid1.ColCount do
    StringGrid1.Cells[i,2+WorkDataSet.RecordCount]:=FloatToStr(ItgKol[i]);
   ColDataset.RangeEnd := reCount;
   ColDataset.RangeEndCount := StringGrid1.ColCount;
   RowDataset.RangeEnd := reCount;
   RowDataset.RangeEndCount := StringGrid1.RowCount+1; }
end;

procedure TOborotForm.acShowExecute(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
begin
 if ID_MO<=0 then
  exit;
 Refresh;
 w:=ShowWaitWindow(self);
 DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
 DBEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
 DATE_BEG:=DBEG;
 DATE_END:=DEND;
 WorkDataSet.Close;

 SetSelectSQL;

 WorkDataSet.Prepare;
 WorkDataSet.ParamByName('DATE_BEG').Value:=DBEG;
 WorkDataSet.ParamByName('DATE_END').Value:=DEND;
 WorkDataSet.ParamByName('PID_MO').Value:=ID_MO;
 PrhDocDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
 PrhDocDataSet.ParamByName('PDATE_END').Value:=DEND;
 RshDocDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
 RshDocDataSet.ParamByName('PDATE_END').Value:=DEND;
 WorkDataSet.CloseOpen(false);
 WorkDataSet.First;
 PrhDocDataSet.CloseOpen(false);
 RshDocDataSet.CloseOpen(false);
// cxGrid1DBBandedTableView1.ViewData.Expand(true);
 CloseWaitWindow(w);
end;

procedure TOborotForm.acPrintExecute(Sender: TObject);
var
 fp: TOborotPrintForm;
 sp: TSplashForm;
 prh_doc_list, rsh_doc_list: string;
begin
 if WorkDataSet.IsEmpty then exit;
 fp:=TOborotPrintform.Create(self);
 if fp.ShowModal=mrOk then
 begin
  sp:=TSplashForm.Create(self);
  sp.MsgLabel.Caption:='Подготовка данных к печати';
  sp.Update;
  sp.Show;
  WorkDataSource.Enabled:=false;
  DATE_END:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  DATE_BEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
  RepPrhDocDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  RepPrhDocDataSet.ParamByName('PDATE_END').Value:=DATE_END;
  RepRshDocDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  RepRshDocDataSet.ParamByName('PDATE_END').Value:=DATE_END;
  RepPrhDocDataSet.ParamByName('PID_SCH').Value:=ID_SCH;
  RepRshDocDataSet.ParamByName('PID_SCH').Value:=ID_SCH;
  RepPrhDocDataSet.ParamByName('PID_MO').Value:=ID_MO;
  RepRshDocDataSet.ParamByName('PID_MO').Value:=ID_MO;
  RepRshMOLDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  RepRshMOLDataSet.ParamByName('PDATE_END').Value:=DATE_END;
  RepRshMOLDataSet.ParamByName('PID_SCH').Value:=ID_SCH;
  RepRshMOLDataSet.ParamByName('PID_MO').Value:=ID_MO;
  RepRshMOLDataset.CloseOpen(true);
  RepPrhDocDataSet.CloseOpen(true);
  RepPrhDocDataSet.First;
  prh_doc_list:='';
  while not RepPrhDocDataSet.Eof do
  begin
   prh_doc_list:=prh_doc_list+RepPrhDocDataSet.FieldByName('TIPD').Value+' '+RepPrhDocDataSet.FieldByName('NUM_DOC').Value+', ';
   RepPrhDocDataSet.Next;
  end;
  //  RepPrhDocDataSet.Close;
  sp.ProgressBar.Position:=30;
  sp.Update;
  RepRshDocDataSet.CloseOpen(true);
  RepRshDocDataSet.First;
  rsh_doc_list:='';
  while not RepRshDocDataSet.Eof do
  begin
   rsh_doc_list:=rsh_doc_list+RepRshDocDataSet.FieldByName('TIPD').Value+' '+RepRshDocDataSet.FieldByName('NUM_DOC').Value+', ';
   RepRshDocDataSet.Next;
  end;
  //  RepRshDocDataSet.Close;
  sp.ProgressBar.Position:=60;
  sp.Update;

//  ShowMessage(inttostr(fp.TIP_REPORT));
  {if fp.TIP_REPORT=5 then
  begin
    //  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
  { MakeCrossTabReportByMO;
   sp.ProgressBar.Position:=100;
   sp.Update;
   sp.Free;
   if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
    frVariables['PERIOD']:='за '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)
   else
    frVariables['PERIOD']:='c '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)+' по '+cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
   frVariables['DATE_BEG']:=DateToStr(DATE_BEG);
   frVariables['DATE_END']:=DateToStr(DATE_END);
   frVariables['PRH_DOC_LIST']:=prh_doc_list;
   frVariables['RSH_DOC_LIST']:=rsh_doc_list;
   frReportCross1.ShowReport;  }
  {end
  else} if fp.TIP_REPORT=6 then
  begin
    //  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
   {MakeCrossTabReportByDoc;
   sp.ProgressBar.Position:=100;
   sp.Update;
   sp.Free;
   if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
    frVariables['PERIOD']:='за '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)
   else
    frVariables['PERIOD']:='c '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)+' по '+cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
   frVariables['DATE_BEG']:=DateToStr(DATE_BEG);
   frVariables['DATE_END']:=DateToStr(DATE_END);
   frVariables['PRH_DOC_LIST']:=prh_doc_list;
   frVariables['RSH_DOC_LIST']:=rsh_doc_list;
   frReportCross1.ShowReport;  }
  end
  else
  begin
    //if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
   // frxReport1.Variables['PERIOD']:='за '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)
   //else
   // frxReport1.Variables['PERIOD']:='c '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)+' по '+cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
   if fp.TIP_REPORT=5 then
   begin

      ds_docs.Close;
     ds_docs.SelectSQL.Clear;
     ds_docs.SelectSQL.Add('select * from MAT_MAKE_OBOROT_DOCS(:PDATE_BEG,:PDATE_END,:ID_MO,:ID_OST)');
     DATE_END:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
     DATE_BEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
     ds_docs.Prepare;
     ds_docs.ParamByName('PDATE_BEG').Value:=DATE_BEG;
     ds_docs.ParamByName('PDATE_END').Value:=DATE_END;
     ds_docs.ParamByName('ID_MO').Value:=ID_MO;
     ds_docs.ParamByName('ID_OST').Value:=WorkDataSetID_OST.AsInteger;
     ds_docs.CloseOpen(False);
   end;

   sp.ProgressBar.Position:=100;
   sp.Update;
   sp.Free;

   frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\'+fp.NAME_REPORT);
   //frxReport1.Variables['PERIOD']:='c '+''''+cxMonthBeg.Text+''''+' '+''''+IntToStr(cxYearBeg.Value)+'''' по +''''+cxMonthEnd.Text+''''+' '+''''+IntToStr(cxYearEnd.Value)+'''';
   frxReport1.Variables['DATE_BEG']:=''''+DateToStr(DATE_BEG)+'''';
   frxReport1.Variables['DATE_END']:=''''+DateToStr(DATE_END)+'''';
   frxReport1.Variables['PRH_DOC_LIST']:=''''+prh_doc_list+'''';
   frxReport1.Variables['RSH_DOC_LIST']:=''''+rsh_doc_list+'''';
   frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
   frxReport1.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
   frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
   if fp.TIP_REPORT=5 then
   begin
    frxReport1.Variables['MOL']:=''''+WorkDataSetSFIO.AsString+'''';
    frxReport1.Variables['DEP']:=''''+WorkDataSetNAME_DEPARTMENT.AsString+'''';
    frxReport1.Variables['OST_KOL']:=''''+FloatToStr(WorkDataSetKOL_OST.AsFloat)+'''';
    frxReport1.Variables['OST_SUMMA']:=''''+FloatToStr(WorkDataSetSUMM_OST.AsFloat)+'''';
    frxReport1.Variables['NAME']:=''''+WorkDataSetNAME.AsString+'''';
    ds_invnum.close;
    ds_invnum.SelectSQL.Text:='select nnum, nnum_ext from mat_dt_mna_kart where id_ost=:id_ost';
    ds_invnum.Prepare;
    ds_invnum.ParamByName('ID_OST').AsInteger:=WorkDataSetID_OST.AsInteger;
    ds_invnum.CloseOpen(False);
    frxReport1.Variables['NNUM']:=''''+ds_invnum.fieldbyname('NNUM').AsString+ds_invnum.fieldbyname('NNUM_EXT').AsString+'''';
   end;
   if fp.cxCopies.Value>1 then
    frxReport1.PrintOptions.Copies:=fp.cxCopies.Value;
   if fp.cxCheckOnPrinter.Checked then
   begin
    if fp.cxSelectPrinter.Checked then
     frxReport1.PrintOptions.ShowDialog:=True
    else
     frxReport1.Print;
   end
   else
   if fp.cxCheckEdit.Checked then
    frxReport1.DesignReport
    else frxReport1.ShowReport;
    //  закоментировано всвязи с переходом на fr3 -Mardar 26.03.2012-
  { if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
    frVariables['PERIOD']:='за '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)
   else
    frVariables['PERIOD']:='c '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)+' по '+cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
   frVariables['DATE_BEG']:=DateToStr(DATE_BEG);
   frVariables['DATE_END']:=DateToStr(DATE_END);
   frVariables['PRH_DOC_LIST']:=prh_doc_list;
   frVariables['RSH_DOC_LIST']:=rsh_doc_list;
   frVariables['ORG_NAME']:=_ORG_FULL_NAME;
   frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
   frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;

   sp.ProgressBar.Position:=100;
   sp.Update;
   sp.Free;

   frReportOborot.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\'+fp.NAME_REPORT);
   if fp.cxCopies.Value>1 then
    frReportOborot.DefaultCopies:=fp.cxCopies.Value;
   if fp.cxCheckOnPrinter.Checked then
   begin
    if fp.cxSelectPrinter.Checked then
     frReportOborot.PrintPreparedReportDlg
    else
     frReportOborot.PrintPreparedReport('', fp.cxCopies.Value, false, frAll);
   end
   else
    frReportOborot.ShowReport;
   if fp.cxCheckEdit.Checked then
    frReportOborot.DesignReport;}

  end;
  WorkDataSource.Enabled:=true;
  WorkDataSet.First;
  PrhDocDataSet.CloseOpen(false);
  RshDocDataSet.CloseOpen(false);
 end;
 fp.Free;
end;

procedure TOborotForm.acExitExecute(Sender: TObject);
begin
 with OborotFormStorage do
 begin
  StoredValue['FormWidth']:=Width;
  StoredValue['FormHeight']:=Height;
  SaveFormPlacement;
 end;
 Close;
end;

procedure TOborotForm.acFieldsExecute(Sender: TObject);
begin
 ShowDataSetFields(self, WorkDataSet);
end;

procedure TOborotForm.acExportExecute(Sender: TObject);
begin
 ExportDataSet(self, WorkDataSet);
end;

end.
