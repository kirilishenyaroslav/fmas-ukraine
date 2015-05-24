{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkOstForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxTextEdit,
  cxDBEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  FIBDataSet, pFIBDataSet, StdCtrls, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxClasses, cxSplitter, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  uPackageManager, cxCheckBox, uResources, uMatasVars, Placemnt,
  cxButtonEdit, uSpMatSchMulti, ibase, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, uMatasUtils, ActnList, Math, uDocMnaKartForm,
  cxLookAndFeelPainters, RxGIF, cxImage, cxButtons, Menus;

type
  TDocWorkOstForm = class(TForm)
    PanelTop: TPanel;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
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
    Label1: TLabel;
    DocOstDataSet: TpFIBDataSet;
    DocOstDataSource: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    cxSplitter1: TcxSplitter;
    OstSpecDataSet: TpFIBDataSet;
    OstSpecDataSource: TDataSource;
    DocOstDataSetID_MO: TFIBBCDField;
    DocOstDataSetFIO: TFIBStringField;
    DocOstDataSetSFIO: TFIBStringField;
    DocOstDataSetNAME_DEPARTMENT: TFIBStringField;
    DocOstDataSetID_NOMN: TFIBBCDField;
    DocOstDataSetNOMN: TFIBStringField;
    DocOstDataSetLINKTO: TFIBBCDField;
    DocOstDataSetNAME: TFIBStringField;
    DocOstDataSetID_UNIT: TFIBBCDField;
    DocOstDataSetUNIT: TFIBStringField;
    DocOstDataSetKOL_MAT: TFIBBCDField;
    DocOstDataSetPRICE: TFIBBCDField;
    DocOstDataSetSUMMA: TFIBBCDField;
    OstSpecDataSetID_OST: TFIBBCDField;
    OstSpecDataSetID_NOMN: TFIBBCDField;
    OstSpecDataSetNOMN: TFIBStringField;
    OstSpecDataSetLINKTO: TFIBBCDField;
    OstSpecDataSetNAME: TFIBStringField;
    OstSpecDataSetID_UNIT: TFIBBCDField;
    OstSpecDataSetUNIT: TFIBStringField;
    OstSpecDataSetKOL_MAT: TFIBBCDField;
    OstSpecDataSetPRICE: TFIBBCDField;
    OstSpecDataSetSUMMA: TFIBBCDField;
    OstSpecDataSetSCH_NUMBER: TFIBStringField;
    OstSpecDataSetSCH_TITLE: TFIBStringField;
    OstSpecDataSetTIPD: TFIBStringField;
    OstSpecDataSetNUM_DOC: TFIBStringField;
    OstSpecDataSetDATE_DOC: TFIBDateField;
    OstSpecDataSetID_SCH: TFIBBCDField;
    DocOstDataSetID_SCH: TFIBBCDField;
    DocOstDataSetSCH_NUMBER: TFIBStringField;
    DocOstDataSetSCH_TITLE: TFIBStringField;
    SchDataSet: TpFIBDataSet;
    SchDataSetID_SCH: TFIBBCDField;
    SchDataSetSCH_NUMBER: TFIBStringField;
    SchDataSource: TDataSource;
    Label2: TLabel;
    OstSpecDataSetID_PRH: TFIBBCDField;
    OstSpecDataSetID_DOC: TFIBBCDField;
    DocOstDataSetKOL_DOC: TFIBBCDField;
    DocOstDataSetSUM_DOC: TFIBBCDField;
    OstSpecDataSetKOL_DOC: TFIBBCDField;
    OstSpecDataSetSUM_DOC: TFIBBCDField;
    cxShowNomn: TcxCheckBox;
    DocOstFormStorage: TFormStorage;
    OstSpecDataSetDATE_OPR: TFIBDateField;
    OstSpecDataSetDATE_EXPL: TFIBDateField;
    PanelData: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1ID_OST: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MO: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1SFIO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1ID_NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1ID_UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PRH: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PanelSpec: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxShowDates: TcxCheckBox;
    cxShowIstfin: TcxCheckBox;
    cxGridSpec: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxGridDBTableView1ID_OST: TcxGridDBColumn;
    cxGridDBTableView1ID_NOMN: TcxGridDBColumn;
    cxGridDBTableView1NOMN: TcxGridDBColumn;
    cxGridDBTableView1LINKTO: TcxGridDBColumn;
    cxGridDBTableView1NAME: TcxGridDBColumn;
    cxGridDBTableView1ID_UNIT: TcxGridDBColumn;
    cxGridDBTableView1UNIT: TcxGridDBColumn;
    cxGridDBTableView1KOL_MAT: TcxGridDBColumn;
    cxGridDBTableView1PRICE: TcxGridDBColumn;
    cxGridDBTableView1SUMMA: TcxGridDBColumn;
    cxGridDBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGridDBTableView1SCH_TITLE: TcxGridDBColumn;
    cxGridDBTableView1TIPD: TcxGridDBColumn;
    cxGridDBTableView1NUM_DOC: TcxGridDBColumn;
    cxGridDBTableView1DATE_DOC: TcxGridDBColumn;
    cxGridDBTableView1ID_SCH: TcxGridDBColumn;
    cxGridDBTableView1ID_PRH: TcxGridDBColumn;
    cxGridDBTableView1ID_DOC: TcxGridDBColumn;
    cxGridDBTableView1KOL_DOC: TcxGridDBColumn;
    cxGridDBTableView1SUM_DOC: TcxGridDBColumn;
    cxGridDBTableView1DATE_OPR: TcxGridDBColumn;
    cxGridDBTableView1DATE_EXPL: TcxGridDBColumn;
    OstIstfinDataSet: TpFIBDataSet;
    OstIstfinDataSource: TDataSource;
    OstIstfinDataSetISTFIN_ID_SM: TFIBBCDField;
    OstIstfinDataSetISTFIN_SM_TITLE: TFIBStringField;
    OstIstfinDataSetISTFIN_SM_KOD: TFIBIntegerField;
    OstIstfinDataSetISTFIN_ID_RZ: TFIBBCDField;
    OstIstfinDataSetISTFIN_RZ_TITLE: TFIBStringField;
    OstIstfinDataSetISTFIN_RZ_KOD: TFIBIntegerField;
    OstIstfinDataSetISTFIN_ID_ST: TFIBBCDField;
    OstIstfinDataSetISTFIN_ST_TITLE: TFIBStringField;
    OstIstfinDataSetISTFIN_ST_KOD: TFIBIntegerField;
    OstIstfinDataSetISTFIN_ID_KEKV: TFIBBCDField;
    OstIstfinDataSetISTFIN_KEKV_TITLE: TFIBStringField;
    OstIstfinDataSetISTFIN_KEKV_KOD: TFIBIntegerField;
    OstIstfinDataSetISTFIN_STR: TFIBStringField;
    cxGrid2DBTableView1ISTFIN_ID_SM: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_SM_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_SM_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_RZ: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_RZ_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_RZ_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_ST: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ST_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ST_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_KEKV: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_KEKV_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_KEKV_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_STR: TcxGridDBColumn;
    cxLookupSch: TcxButtonEdit;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    WorkProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionList1: TActionList;
    acViewInvKart: TAction;
    DocOstDataSetMOL: TStringField;
    DocOstDataSetBAL_ID_SCH: TFIBIntegerField;
    DocOstDataSetBAL_SCH_NUMBER: TFIBStringField;
    DocOstDataSetBAL_SCH_TITLE: TFIBStringField;
    DocOstDataSetKOD_SYSTEM: TFIBIntegerField;
    OstSpecDataSetKOD_SYSTEM: TFIBIntegerField;
    DocOstDataSetIS_ACC_PRICE: TFIBIntegerField;
    OstSpecDataSetIS_ACC_PRICE: TFIBIntegerField;
    ForBSO: TpFIBDataSet;
    dsBSO: TpFIBDataSet;
    actViewBSO: TAction;
    ds_mna: TpFIBDataSet;
    ds_mnaID_MNA_KART: TFIBBCDField;
    ds_mnaTIP_MNA_KART: TFIBIntegerField;
    ds_mnaID_MO: TFIBBCDField;
    ds_mnaFIO: TFIBStringField;
    ds_mnaSFIO: TFIBStringField;
    ds_mnaID_SPODR: TFIBIntegerField;
    ds_mnaNAME_DEPARTMENT: TFIBStringField;
    ds_mnaIS_SKLAD: TFIBSmallIntField;
    ds_mnaBAL_ID_SCH: TFIBBCDField;
    ds_mnaBAL_SCH_NUMBER: TFIBStringField;
    ds_mnaBAL_SCH_TITLE: TFIBStringField;
    ds_mnaID_SCH: TFIBBCDField;
    ds_mnaSCH_NUMBER: TFIBStringField;
    ds_mnaSCH_TITLE: TFIBStringField;
    ds_mnaNNUM: TFIBIntegerField;
    ds_mnaGNUM: TFIBSmallIntField;
    ds_mnaINUM: TFIBIntegerField;
    ds_mnaID_NOMN: TFIBBCDField;
    ds_mnaNOMN: TFIBStringField;
    ds_mnaNAME: TFIBStringField;
    ds_mnaID_UNIT: TFIBBCDField;
    ds_mnaUNIT: TFIBStringField;
    ds_mnaPRICE: TFIBBCDField;
    ds_mnaKOL_MAT: TFIBBCDField;
    ds_mnaSUMMA: TFIBBCDField;
    ds_mnaSUMMA_OST: TFIBBCDField;
    ds_mnaDATE_OST: TFIBDateField;
    ds_mnaSUMMA_AMORT: TFIBBCDField;
    ds_mnaDATE_OPR: TFIBDateField;
    ds_mnaID_OPER_OPR: TFIBBCDField;
    ds_mnaDATE_EXPL: TFIBDateField;
    ds_mnaID_OPER_EXPL: TFIBBCDField;
    ds_mnaDATE_OUT: TFIBDateField;
    ds_mnaID_OPER_OUT: TFIBBCDField;
    ds_mnaYEAR_EXPL: TFIBIntegerField;
    ds_mnaMONTH_EXPL: TFIBIntegerField;
    ds_mnaDATE_CREATE: TFIBDateField;
    ds_mnaMODEL: TFIBStringField;
    ds_mnaMARKA: TFIBStringField;
    ds_mnaZAVNUM: TFIBStringField;
    ds_mnaPASSNUM: TFIBStringField;
    ds_mnaNOTE: TFIBStringField;
    ds_mnaIS_AMORT: TFIBIntegerField;
    ds_mnaAMOR_METHOD: TFIBIntegerField;
    ds_mnaAMORT_PERCENT: TFIBFloatField;
    ds_mnaDB_ID_SCH_AMORT: TFIBBCDField;
    ds_mnaDB_ID_SM_AMORT: TFIBBCDField;
    ds_mnaDB_ID_RZ_AMORT: TFIBBCDField;
    ds_mnaDB_ID_ST_AMORT: TFIBBCDField;
    ds_mnaDB_ID_KEKV_AMORT: TFIBBCDField;
    ds_mnaKR_ID_SCH_AMORT: TFIBBCDField;
    ds_mnaKR_ID_SM_AMORT: TFIBBCDField;
    ds_mnaKR_ID_RZ_AMORT: TFIBBCDField;
    ds_mnaKR_ID_ST_AMORT: TFIBBCDField;
    ds_mnaKR_ID_KEKV_AMORT: TFIBBCDField;
    ds_mnaNNUM_FULL: TFIBStringField;
    ds_mnaNNUM_EXT: TFIBStringField;
    ds: TpFIBDataSet;
    DocOstDataSetDATE_OPR: TFIBDateField;
    DocOstDataSetPRIZNAK: TFIBIntegerField;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    OstSpecDataSetPRIZNAK: TFIBIntegerField;
    cxgrdbclmnGridDBTableView1DBColumn1: TcxGridDBColumn;
    pnl1: TPanel;
    cxImage1: TcxImage;
    Tr_Compare: TpFIBTransaction;
    StPr_Compare: TpFIBStoredProc;
    ds_compare: TpFIBDataSet;
    WorkQuery: TpFIBQuery;
    pm1: TPopupMenu;
    N1: TMenuItem;
    btn1: TSpeedButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxShowNomnPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxShowIstfinPropertiesChange(Sender: TObject);
    procedure cxShowDatesPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplySchFilter;
    procedure SaveDocPosData(aVals: array of Variant);
    procedure ActionCancelExecute(Sender: TObject);
    procedure acViewInvKartExecute(Sender: TObject);
    procedure DocOstDataSetCalcFields(DataSet: TDataSet);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure actViewBSOExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

    procedure CompareOst;
    procedure N1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);



  private
    { Private declarations }
  public
   DBHANDLE : TISC_DB_HANDLE;
   ID_SESSION: integer;
   ID_MO: integer;
   ID_NOMN: integer;
   NAME: string;
   ID_UNIT: integer;
   UNIT_NAME: string;
   KOL_MAT: double;
   PRICE: double;
   ID_OST: integer;
   ID_SCH: integer;
   SCH_NUMBER: string;
   F_SCH: boolean;
   FILTER_ID_SESSION: integer;
   KOL_MODE: integer; // 0 - по одному, 1 - ФИФО, 2 - непрерывно
   MAX_KOL_MAT: double;
   IS_OK: boolean;
   ID_POS: integer;
   TotalSum: Extended;
   INV_KART_MODE: integer;
   MNA_KART_MODE: Integer;
   IS_NEED_KOL_DOC, IS_NEED_WORK_POS: boolean;
   DATE_OPR:TDateTime;
   KOL, add_all:Integer;
  end;

var
  DocWorkOstForm: TDocWorkOstForm;

implementation

uses uDocWorkQuantityEditForm, uDocWorkInvKartForm, uDocWorkPosEditForm,
     uDocWorkOstInvKart, uBSONumbers, uBSOView, uViewMnaKart, uDocWorkMessage;
{$R *.dfm}

procedure TDocWorkOstForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkOstForm.CompareOst;
begin
 pnl1.visible:=False;
 if _COMPARE_OST_OBOROT =1 then
 begin
    if ID_MO<>0 then
    begin
      ds_compare.close;
      ds_compare.selectSql.Clear;
      ds_compare.SelectSQL.Add('select distinct a.id_doc from mat_dt_doc a inner join mat_dt_doc_pos b on a.id_doc=b.id_doc where a.pub_id_doc is null and ((a.id_mo_in=:id_mo) or (a.id_mo_out=:id_mo)) ');
       if F_SCH then
       begin
       ds_compare.SelectSQL.Add('and (b.ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
       ds_compare.SelectSQL.Add('OR (b.ID_SCH IN (select id_sch from pub_sp_main_sch s where s.link_to=(SELECT  ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')))');
       end;
       ds_compare.Prepare;
       ds_compare.ParamByName('ID_MO').Value:=ID_MO;
       ds_compare.CloseOpen(False);
       ds_compare.fetchall;
       ds_compare.first;
       if ds_compare.RecordCount>0 then pnl1.Visible:=True;
    end;
  end;

end;

procedure TDocWorkOstForm.SaveDocPosData(aVals: array of Variant);
var
 FLAG_INV_KART, FLAG_MNA_KART, kod_system, sch_prop_inv_acc: integer;
 iform: TDocWorkInvKartForm;
 mform: TDocMnaKartForm;
 w: TForm;
 vals: array of Variant;
 is_bso, id_sch_bso, j:Integer;
 form_bso:TBSONumForm;
begin
  //расходные документы
 w:=ShowWaitWindow(self);
 try
  WorkProc.Close;
  WorkProc.Transaction := WriteTransaction;
  WorkProc.Transaction.StartTransaction;
  WorkProc.StoredProcName:='MAT_DT_DOC_POS_INTF_ADD';
  WorkProc.Prepare;
  WorkProc.ExecProcedure('MAT_DT_DOC_POS_INTF_ADD', aVals);
  ID_POS:=WorkProc.ParamByName('ID_POS').AsInteger;
  FLAG_INV_KART:=WorkProc.ParamByName('FLAG_INV_KART').AsInteger;
  FLAG_MNA_KART:=WorkProc.ParamByName('FLAG_MNA_KART').AsInteger;
  kod_system:=WorkProc.ParamByName('KOD_SYSTEM').AsInteger;
  sch_prop_inv_acc:=WorkProc.ParamByName('sch_prop_inv_acc').AsInteger;
  TotalSum:=TotalSum + aVals[6];
  WorkProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   WorkProc.Transaction.Rollback;
  end;
 end;
// ShowMessage(IntToStr(INV_KART_MODE)+' '+Inttostr(FLAG_INV_KART)+ ' '+Inttostr(_GET_INV_NOM_MODE));
 if FLAG_INV_KART=1 then begin
  if ((INV_KART_MODE=3) or (INV_KART_MODE=4)  or (INV_KART_MODE=6)
   or ((INV_KART_MODE=2) and (_GET_INV_NOM_MODE=2))) then
  begin
   iform:=TDocWorkInvKartForm.Create(self);
   iform.ID_POS:=0; //ID_POS;
   iform.ID_OST:=aVals[8];
   iform.KOL_KART:=aVals[3];
   if iform.KOL_KART=0 then
    iform.KOL_KART:=1;
   iform.WorkDatabase.Handle:=DBHANDLE;
   iform.PrepareInvKart;
   if add_all=1 then iform.is_add_all:=1 else iform.is_add_all:=0;
   if iform.ShowModal = mrOk then
   begin
    iform.RxMemoryData1.First;
    SetLength(Vals, 5);
    while not iform.RxMemoryData1.Eof do
    begin
     if iform.RxMemoryData1CHECKED.Value then
     begin
      vals[0]:=ID_SESSION;
      vals[1]:=ID_POS;
      vals[2]:=iform.RxMemoryData1FID_INV_KART.AsInteger;
      vals[3]:=null;
      vals[4]:=null;
      try
       WorkProc.Close;
       WorkProc.Transaction := WriteTransaction;
       WorkProc.Transaction.StartTransaction;
       WorkProc.StoredProcName:='MAT_DT_DOC_POS_KART_INTF_I';
       WorkProc.Prepare;
       WorkProc.ExecProcedure('MAT_DT_DOC_POS_KART_INTF_I', Vals);
       WorkProc.Transaction.Commit;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        WorkProc.Transaction.Rollback;
       end;
      end;
     end;
     iform.RxMemoryData1.Next;
    end;
   end;
  end
 end;
 //// MnaKart here!!!
// showmessage(inttostr(kod_system)+' '+inttostr(sch_prop_inv_acc)+' '+inttostr(_MNA_INV_ACC)+' '+inttostr(_MBP_INV_ACC));
  if FLAG_MNA_KART = 1 then
  begin
   if (MNA_KART_MODE=2) or (MNA_KART_MODE=4) or (MNA_KART_MODE=6)or (MNA_KART_MODE=3)then
   if ((kod_system = 134) and (sch_prop_inv_acc = 1) and (_MNA_INV_ACC = 1)) or
      ((kod_system = 132) and (sch_prop_inv_acc = 1) and (_MBP_INV_ACC = 1)) then
   begin
   mform:=TDocMnaKartForm.Create(self);
   mform.ID_POS:=0; //ID_POS;
   mform.ID_OST:=aVals[8];
   mform.KOL_KART:=aVals[3];
   mform.MnaDB.Handle:=DBHANDLE;
   mform.PrepareInvKart;
   if add_all=1 then iform.is_add_all:=1 else mform.is_add_all:=0;
   if mform.ShowModal = mrOk then
   begin
    mform.RxMemoryData1.First;
    SetLength(Vals, 5);
    while not mform.RxMemoryData1.Eof do
    begin
     if mform.RxMemoryData1CHECKED.Value = 1 then
     begin
      vals[0]:=ID_SESSION;
      vals[1]:=ID_POS;
      vals[2]:=null;
      vals[3]:=mform.RxMemoryData1ID_MNA_KART.AsInteger;
      vals[4]:=null;
      //  ShowMessage(vartostr(vals[2]));
      try
       WorkProc.Close;
       WorkProc.Transaction := WriteTransaction;
       WorkProc.Transaction.StartTransaction;
       WorkProc.StoredProcName:='MAT_DT_DOC_POS_KART_INTF_I';
       WorkProc.Prepare;
       WorkProc.ExecProcedure('MAT_DT_DOC_POS_KART_INTF_I', Vals);
       WorkProc.Transaction.Commit;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        WorkProc.Transaction.Rollback;
       end;
      end;
     end;
     mform.RxMemoryData1.Next;
    end;
   end;
  end
 end;
// BSO KART :)
// opredelit svoystvo scheta na BSO
      is_bso:=0;
      ForBSO.Close;
      ForBSO.SelectSQL.Clear;
      ForBSO.SelectSQL.Add(' SELECT C.ID_SCH FROM PUB_SP_MAIN_SCH C INNER JOIN PUB_DT_OBJ_PROP PR ON C.ID_SCH = PR.ID_OBJ ');
      ForBSO.SelectSQL.Add(' INNER JOIN PUB_SP_PROPERTIES P ON PR.ID_PROP = P.ID_PROP WHERE P.PROP_N_PP = 2030 AND C.ID_SCH = :ID_SCH AND ');
      ForBSO.SelectSQL.Add(' :DATE_BEG BETWEEN C.DATE_BEG AND C.DATE_END ');
      ForBSO.SelectSQL.Add(' AND :DATE_BEG BETWEEN PR.DATE_BEG AND PR.DATE_END ');
      //DonNU
     // if ((_ORG_KOD_OKPO='02070803')and(Copy(SCH_NUMBER,1,2)='23')) then
     //  ForBSO.SelectSQL.Add(' and exists(select * from mat_sp_nom_base where id_nomn=:id_nomn and linkto=14876099)');
      ForBSO.Prepare;
      ForBSO.ParamByName('DATE_BEG').AsDate:=_MATAS_PERIOD;
      ForBSO.ParamByName('ID_SCH').AsInteger:=ID_SCH;
      //DonNU
      //if ((_ORG_KOD_OKPO='02070803')and(Copy(SCH_NUMBER,1,2)='23')) then
     // ForBSO.ParamByName('ID_NOMN').AsInteger:=ID_NOMN;
      ForBSO.CloseOpen(False);
      if ForBSO.FieldValues['ID_SCH']<> null then is_bso:=1
      else is_bso:=0;
      ForBSO.Close;

      //
      if is_bso = 1 then
      begin
         form_bso:=TBSONumForm.Create(Self, DBHANDLE, ID_OST, KOL);
         if add_all=1 then iform.is_add_all:=1 else form_bso.is_add_all:=0;
         form_bso.ShowModal;
         if form_bso.ModalResult=mrOk then
         begin

         form_bso.RxBSO.Open;
         form_bso.RxBSO.first;
         while not form_bso.RxBSO.Eof do
         begin
           if form_bso.RxBSOCHECKED.AsInteger=1 then
           try
            WorkProc.Close;
            WorkProc.Transaction := WriteTransaction;
            WorkProc.Transaction.StartTransaction;
            WorkProc.StoredProcName:='MAT_DT_BSO_KART_INTF_INS';
            WorkProc.Prepare;
            WorkProc.ParamByName('ID_POS').AsInteger:=ID_POS;//form_bso.RxBSOID_BSO_K.AsInteger;
            WorkProc.ParamByName('ID_OST').AsInteger:=ID_OST;
            WorkProc.ParamByName('SERIYA').AsString:=form_bso.RxBSOSER.AsString;
            WorkProc.ParamByName('NUMBER').AsString:=form_bso.RxBSONUM.AsString;
            WorkProc.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
            WorkProc.ParamByName('ID_BSO_KART').AsInteger:=form_bso.RxBSOID_BSO_K.AsInteger;;
            WorkProc.ExecProc;
            WorkProc.Transaction.Commit;
             except on E : Exception
             do begin
               ShowMessage(E.Message);
               WorkProc.Transaction.Rollback;
             end;
             end;
         form_bso.RxBSO.Next;
         end;
         end;  
      end;
 CloseWaitWindow(w);
end;



procedure TDocWorkOstForm.OkButtonClick(Sender: TObject);
var
 i: integer;
 rIdNomn, rIdUnit, rIdSch, rLinkto: integer;
 rName, rNomn, rUnit, rNameSch, rSchNumber: string;
 rTip, rNType: integer;
 rPrice, rKolMat, rSumma: extended;
 QForm: TDocWorkQuantityForm;
 PForm: TDocWorkPosEditForm;
 QKolMat: double;
 vals : array of Variant;
 OST_KOL_MAT, CUR_KOL_MAT, qsumma: Extended;
 KodSystem: Integer;
 PROC_KOL_MODE: Integer;
 IS_ACC_PRICE: integer;
begin
 PROC_KOL_MODE:=KOL_MODE;
//     ShowMessage(DateToStr(OstSpecDataSetDATE_OPR.AsDateTime));
 if (PROC_KOL_MODE=-1) then
 begin
  ID_NOMN:=DocOstDataSet.FieldByName('ID_NOMN').AsInteger;
  NAME:=DocOstDataSet.FieldByName('NAME').AsString;
  ID_UNIT:=DocOstDataSet.FieldByName('ID_UNIT').AsInteger;
  UNIT_NAME:=DocOstDataSet.FieldByName('UNIT').AsString;
  PRICE:=OstSpecDataSet.FieldByName('PRICE').AsFloat;
  ID_OST:=OstSpecDataSet.FieldByName('ID_OST').AsInteger;
  if OstSpecDataSet.FieldByName('ID_SCH').IsNull then
   ID_SCH:=0
  else
   ID_SCH:=OstSpecDataSet.FieldByName('ID_SCH').AsInteger;
  if ID_SCH=0 then
   SCH_NUMBER:=''
  else
   SCH_NUMBER:=OstSpecDataSet.FieldByName('SCH_NUMBER').AsString;
  MAX_KOL_MAT:=DocOstDataSet.FieldByName('KOL_MAT').AsFloat;
  KOL_MAT:=MAX_KOL_MAT;
  IS_OK:=true;
  Close;
 end;

 KodSystem:=DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger;
 IS_ACC_PRICE:=DocOstDataSet.FieldByName('IS_ACC_PRICE').AsInteger;


 if (KodSystem<>_KOD_SYSTEM_MAT) then
  if (_USE_FIFO_ON_MAT_SCH=1) then PROC_KOL_MODE:=2;

 if (KodSystem=_KOD_SYSTEM_MAT) then
  if IS_ACC_PRICE=1 then PROC_KOL_MODE:=2;

// ShowMessage(IntToStr(PROC_KOL_MODE));

 if (PROC_KOL_MODE=0) or (PROC_KOL_MODE=1) or (PROC_KOL_MODE=2) then
 begin
  ID_NOMN:=DocOstDataSet.FieldByName('ID_NOMN').AsInteger;
  NAME:=DocOstDataSet.FieldByName('NAME').AsString;
  ID_UNIT:=DocOstDataSet.FieldByName('ID_UNIT').AsInteger;
  UNIT_NAME:=DocOstDataSet.FieldByName('UNIT').AsString;
  PRICE:=OstSpecDataSet.FieldByName('PRICE').AsFloat;
  ID_OST:=OstSpecDataSet.FieldByName('ID_OST').AsInteger;
  if OstSpecDataSet.FieldByName('ID_SCH').IsNull then
   ID_SCH:=0
  else
   ID_SCH:=OstSpecDataSet.FieldByName('ID_SCH').AsInteger;
  if ID_SCH=0 then
   SCH_NUMBER:=''
  else
   SCH_NUMBER:=OstSpecDataSet.FieldByName('SCH_NUMBER').AsString;
  PForm:=TDocWorkPosEditForm.Create(self);
  if PROC_KOL_MODE<>2 then
   MAX_KOL_MAT:=DocOstDataSet.FieldByName('KOL_MAT').AsFloat
  else
   MAX_KOL_MAT:=OstSpecDataSet.FieldByName('KOL_MAT').AsFloat;
  KOL_MAT:=MAX_KOL_MAT;
  PForm.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
  PForm.DBHANDLE:=DBHANDLE;
  PForm.ID_MO_OUT:=ID_MO;
  PForm.ID_MO_IN:=0;
  PForm.cxKolDoc.Enabled:=IS_NEED_KOL_DOC;
  PForm.cxCheckWorkPos.Visible:=IS_NEED_WORK_POS;
  PForm.cxPosNote.Text:=' ';
  PForm.ID_SESSION:=ID_SESSION;
  PForm.POS_MODE:=0;
  PForm.cxName.Enabled:=false;
  PForm.ID_NOMN:=ID_NOMN;
  PForm.cxName.Text:=NAME;
  PForm.ID_UNIT:=ID_UNIT;
  PForm.cxUNIT.Text:=UNIT_NAME;
  PForm.cxPRICE.EditValue:=PRICE;
  if ((Copy(SCH_NUMBER,1,2)='23')and (_ORG_KOD_OKPO='02070803') ) then //для ДонНУ
  begin
   PForm.cxPRICE.Enabled:=False;
   PForm.not_change_price:=1;
  end
  else PForm.not_change_price:=0;
  PForm.cxKolMat.EditValue:=KOL_MAT;
  PForm.cxKolDoc.EditValue:=KOL_MAT;
  if PROC_KOL_MODE<>2 then
   PForm.cxSumma.EditValue:=DocOstDataSet.FieldByName('SUMMA').AsFloat
  else
   PForm.cxSumma.EditValue:=OstSpecDataSet.FieldByName('SUMMA').AsFloat;
//  PForm.cxSumma.EditValue:=PForm.cxPRICE.EditValue*PForm.cxKolMat.EditValue;
  PForm.ID_OST:=ID_OST;
  PForm.ID_SCH:=ID_SCH;
  PForm.CHECK_KOL_MAT:=true;
  PForm.MAX_KOL_MAT:=MAX_KOL_MAT;
  if ID_SCH=0 then
   PForm.cxNameSch.Text:=''
   else
   PForm.cxNameSch.Text:=OstSpecDataSet.FieldByName('SCH_NUMBER').AsString;
  PForm.TypeMat:=2;
  if OstSpecDataSet.FieldValues['DATE_OPR']<>null then
    PForm.dateopr:=OstSpecDataSet.FieldValues['DATE_OPR'];
     if add_all=1 then  PForm.is_add_all:=1 else PForm.is_add_all:=0;
  if PForm.ShowModal=mrOk then
  begin
   SetLength(Vals, 13);
   if PROC_KOL_MODE=1 then
   begin
    OST_KOL_MAT:=PForm.cxKolMat.Value;
    if OST_KOL_MAT=0 then
    begin
     Vals[0]  := ID_SESSION;
     Vals[1]  := Pform.ID_NOMN;
     Vals[2]  := Pform.ID_UNIT;
     Vals[3]  := Pform.cxKolMat.EditValue;
     if IS_NEED_KOL_DOC then
      Vals[4]  := Pform.cxKolDoc.EditValue
     else
      Vals[4]  := Pform.cxKolMat.EditValue;
      KOL:= Pform.cxKolMat.EditValue;
     Vals[5]  := Pform.cxPrice.EditValue;
     Vals[6]  := Pform.cxSumma.EditValue;
     Vals[7]  := Pform.ID_SCH;
     Vals[8]  := Pform.ID_OST;
     Vals[9]  := Pform.ID_MARK;
     Vals[10] := BoolToInt(Pform.cxCheckWorkPos.Checked);
     Vals[11] := Pform.cxPosNote.Text;
     Vals[12] := OstSpecDataSetDATE_OPR.Value;


     SaveDocPosData(Vals);
    end
    else begin
     OstSpecDataSet.First;
     while OST_KOL_MAT>0 do
     begin
      CUR_KOL_MAT:=OstSpecDataSet.FieldByName('KOL_MAT').AsFloat;
      if CUR_KOL_MAT>OST_KOL_MAT then
      begin
       CUR_KOL_MAT:=OST_KOL_MAT;
//       qsumma:=PForm.cxSumma.EditValue;
       qsumma:=RoundTo(OstSpecDataSet.FieldByName('PRICE').AsFloat*CUR_KOL_MAT, -2)
      end
      else
       qsumma:=OstSpecDataSet.FieldByName('SUMMA').AsFloat;

{      begin
       if CUR_KOL_MAT<>0 then
        qsumma:=RoundTo(OstSpecDataSet.FieldByName('PRICE').AsFloat*CUR_KOL_MAT, -2)
       else
        qsumma:=OstSpecDataSet.FieldByName('SUMMA').AsFloat;
      end;
}
      OST_KOL_MAT:=OST_KOL_MAT-CUR_KOL_MAT;
      Vals[0]  := ID_SESSION;
      Vals[1]  := Pform.ID_NOMN;
      Vals[2]  := OstSpecDataSet.FieldByName('ID_UNIT').AsInteger;
      Vals[3]  := CUR_KOL_MAT;
      Vals[4]  := CUR_KOL_MAT;
      Vals[5]  := OstSpecDataSet.FieldByName('PRICE').AsFloat;
      Vals[6]  := qsumma;
      Vals[7]  := Pform.ID_SCH;
      Vals[8]  := OstSpecDataSet.FieldByName('ID_OST').AsInteger;
      Vals[9]  := Pform.ID_MARK;
      Vals[10] := BoolToInt(Pform.cxCheckWorkPos.Checked);
      Vals[11] := Pform.cxPosNote.Text;
      Vals[12] := OstSpecDataSetDATE_OPR.Value;

      SaveDocPosData(Vals);
      OstSpecDataSet.Next;
     end;
    end
   end;
   if (PROC_KOL_MODE=0) or (PROC_KOL_MODE=2) then
   begin
    Vals[0]  := ID_SESSION;
    Vals[1]  := Pform.ID_NOMN;
    Vals[2]  := Pform.ID_UNIT;
    Vals[3]  := Pform.cxKolMat.EditValue;
    if IS_NEED_KOL_DOC then
     Vals[4]  := Pform.cxKolDoc.EditValue
    else
     Vals[4]  := Pform.cxKolMat.EditValue;
     KOL:= Pform.cxKolMat.EditValue;
    Vals[5]  := Pform.cxPrice.EditValue;
    Vals[6]  := Pform.cxSumma.EditValue;
    Vals[7]  := Pform.ID_SCH;
    Vals[8]  := Pform.ID_OST;
    Vals[9]  := Pform.ID_MARK;
    Vals[10] := BoolToInt(Pform.cxCheckWorkPos.Checked);
    Vals[11] := Pform.cxPosNote.Text;
    Vals[12] := OstSpecDataSetDATE_OPR.Value;

    SaveDocPosData(Vals);
   end;
  end;
  PForm.Free;
  if PROC_KOL_MODE=0 then
   Close;
  DocOstDataSet.CloseOpen(false);
  DocOstDataSet.Locate('ID_NOMN',ID_NOMN,[])
 end;
end;

procedure TDocWorkOstForm.FormCreate(Sender: TObject);
begin
 IS_OK:=false;
 cxShowNomn.Properties.Caption:='Код ТМЦ';

 OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 CancelButton.Caption:=MAT_BUTTON_EXIT_CONST;
 cxGrid1DBTableView1NAME.Caption:=MAT_STR_COL_NAME_TMC;
 cxGrid1DBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBTableView1NOMN.Caption:=MAT_STR_COL_NOMN;
 cxGrid1DBTableView1UNIT.Caption:=MAT_STR_COL_NAME_UNIT;
 cxGrid1DBTableView1KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGrid1DBTableView1KOL_DOC.Caption:=MAT_STR_COL_KOL_DOC;
 cxGrid1DBTableView1PRICE.Caption:=MAT_STR_COL_PRICE;
 cxGrid1DBTableView1SUMMA.Caption:=MAT_STR_COL_SUMMA;

 cxGridDBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGridDBTableView1TIPD.Caption:=MAT_STR_COL_TIPD;
 cxGridDBTableView1NUM_DOC.Caption:=MAT_STR_COL_NUM_DOC;
 cxGridDBTableView1DATE_DOC.Caption:=MAT_STR_COL_DATE_DOC;
 cxGridDBTableView1KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGridDBTableView1KOL_DOC.Caption:=MAT_STR_COL_KOL_DOC;
 cxGridDBTableView1PRICE.Caption:=MAT_STR_COL_PRICE;
 cxGridDBTableView1SUMMA.Caption:=MAT_STR_COL_SUMMA;
 cxGridDBTableView1DATE_OPR.Caption:='Дата опр.';
 cxGridDBTableView1DATE_EXPL.Caption:='Дата експл';
 KOL_MODE:=0;
 //cxSplitter2.OpenSplitter;
   cxSplitter2.CloseSplitter;
 TotalSum:=0;
 INV_KART_MODE:=0;
 MNA_KART_MODE:=0;
 IS_NEED_KOL_DOC:=false;
 IS_NEED_WORK_POS:=false;
 add_all:=0;
 DocOstFormStorage.RestoreFormPlacement;
end;

procedure TDocWorkOstForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 OkButton.Click;
end;

procedure TDocWorkOstForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButton.Click;
// if (Key=VK_SPACE) or (Key=VK_F3) then
//  ViewDoc(self, DocEditForm.WorkDatabase.Handle, OstSpecDataSet.FieldByName('ID_PRH').AsInteger);
end;

procedure TDocWorkOstForm.cxShowNomnPropertiesChange(Sender: TObject);
begin
 cxGrid1DBTableView1NOMN.Visible:=cxShowNomn.Checked;
end;

procedure TDocWorkOstForm.FormActivate(Sender: TObject);
begin
// DocOstFormStorage.RestoreFormPlacement;
 cxShowNomnPropertiesChange(self);
 cxShowDatesPropertiesChange(self);
 cxShowIstfinPropertiesChange(self);
end;

procedure TDocWorkOstForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DocOstFormStorage.SaveFormPlacement;
 WorkTransaction.StartTransaction;
 WriteTransaction.StartTransaction;
end;

procedure TDocWorkOstForm.cxShowIstfinPropertiesChange(Sender: TObject);
begin
 if cxShowIstfin.Checked then
  cxSplitter2.OpenSplitter
 else
  cxSplitter2.CloseSplitter;
end;

procedure TDocWorkOstForm.cxShowDatesPropertiesChange(Sender: TObject);
begin
 cxGridDBTableView1DATE_OPR.Visible:=cxShowDates.Checked;
 cxGridDBTableView1DATE_EXPL.Visible:=cxShowDates.Checked;
end;

procedure TDocWorkOstForm.FormShow(Sender: TObject);
begin
 cxGrid1.SetFocus;
end;

procedure TDocWorkOstForm.cxLookupSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
 end;
 ApplySchFilter;
end;

procedure TDocWorkOstForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
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
  FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);

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
 ApplySchFilter;
end;

procedure TDocWorkOstForm.ApplySchFilter;
begin
 DocOstDataSet.Close;
 DocOstDataSet.SelectSQL.Clear;
 with DocOstDataSet.SelectSQL do
 begin
  Add('SELECT * FROM MAT_SEL_MO_OST_CUR_NOMN(:ID_MO, :ID_SESSION)');
  if F_SCH then
  begin
   Add('WHERE ( ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
  end;
//  if cxSchFilter.EditText<>'' then
//   Add('WHERE ID_SCH='+IntToStr(cxSchFilter.EditValue));
  Add('ORDER BY SCH_NUMBER, NAME');
 end;
 DocOstDataSet.Prepare;
 DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO;
 DocOstDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
 DocOstDataSet.CloseOpen(false);
 OstSpecDataSet.CloseOpen(false);
 OstIstfinDataSet.CloseOpen(false);
 CompareOst;
end;

procedure TDocWorkOstForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkOstForm.acViewInvKartExecute(Sender: TObject);
var
 T: TDocWorkOstInvKartForm;
 f:TMNAViewForm;
 id: integer;
begin
 id:=OstSpecDataSet.FieldByName('ID_OST').AsInteger;
 ds.close;
 ds.selectSql.Text:='select id_inv_kart from mat_dt_inv_kart where id_ost='+IntTostr(id);
 ds.closeopen(False);
 if ds.fieldvalues['id_inv_kart']<>null then
 begin
 T:=TDocWorkOstInvKartForm.Create(self);
 T.WorkDatabase.Handle:=DBHANDLE;
 T.KartDataSet.ParamByName('ID_POS').Value:=0;
 T.KartDataSet.ParamByName('ID_OST').Value:=id;
 T.KartDataSet.CloseOpen(false);
 T.ShowModal;
 T.Free;
 end
 else
 begin
   f:=TMNAViewForm.Create(Self);
   ds_mna.close;
   ds_mna.selectSql.Text:='SELECT *  FROM MAT_DT_MNA_KART_SEL_OST('+IntToStr(id)+');';
   ds_mna.CloseOpen(false);
   ds_mna.first;
   f.ShowModal;
   f.free;
 end;
end;

procedure TDocWorkOstForm.DocOstDataSetCalcFields(DataSet: TDataSet);
begin
 DocOstDataSetMOL.Value:=DocOstDataSetSFIO.AsString+' \ '+DocOstDataSetNAME_DEPARTMENT.AsString;
end;

procedure TDocWorkOstForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 OstSpecDataSet.Close;
 OstSpecDataSet.SQLs.SelectSQL.Clear;
 OstSpecDataSet.SQLs.SelectSQL.Add('SELECT * FROM MAT_SEL_MO_OST_CUR_SPEC(:PID_MO, :PID_SESSION, :ID_NOMN) ORDER BY DATE_DOC');
 OstSpecDataSet.Prepare;
 OstSpecDataSet.ParamByName('PID_MO').Value:=ID_MO;
 OstSpecDataSet.ParamByName('PID_SESSION').Value:=ID_SESSION;
 OstSpecDataSet.ParamByName('ID_NOMN').Value:=DocOstDataSetID_NOMN.Value;
 OstSpecDataSet.CloseOpen(false);
end;

procedure TDocWorkOstForm.actViewBSOExecute(Sender: TObject);
var f:TViewBSOForm;
begin
  f:=TViewBSOForm.Create(Self);
 dsBSO.Prepare;
 dsBSO.ParamByName('ID_OST').AsInteger:=OstSpecDataSetID_OST.AsInteger;
 dsBSO.CloseOpen(False);
 f.ShowModal;
 f.Free;
end;

procedure TDocWorkOstForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var
 ARect: TRect;
begin
 Arect:=AViewInfo.Bounds;
 
  if (AViewInfo.GridRecord.Values[16] = 1 )  then
  begin

      ACanvas.Canvas.Font.Color := $00E80074;
      ACanvas.Canvas.FillRect(Arect);
  end;
 end;

procedure TDocWorkOstForm.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var ARect: TRect;
begin
 Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[22] = 1 )  then
  begin
      ACanvas.Canvas.Font.Color := $00E80074;
      ACanvas.Canvas.FillRect(Arect);
  end;


end;

procedure TDocWorkOstForm.N1Click(Sender: TObject);
begin
pnl1.visible:=False;
end;

procedure TDocWorkOstForm.btn1Click(Sender: TObject);
var mes:TMessageForm;
begin
  mes:=TMessageForm.Create(self);
  mes.ShowModal;
  if mes.ModalResult = mrOk then
  begin
  add_all:=1;
  DocOstDataSet.First;
  while not DocOstDataSet.Eof do
  begin
  if  DocOstDataSetKOL_MAT.AsFloat>0 then
  OkButtonClick(Self);
  if  DocOstDataSetKOL_MAT.AsFloat<=0 then
  DocOstDataSet.Next;
  end;
  end;
  mes.free;

end;

end.
