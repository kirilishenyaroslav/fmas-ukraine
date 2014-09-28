unit platFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, cxContainer, cxLabel, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar, cxCurrencyEdit, dxBar,
  dxBarExtItems, StdCtrls, ActnList, IBase, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxMemo, cxFilterControl, cxDBFilterControl, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, LoadDogManedger, ImgList, cxTL, frxClass, frxDBSet,
  cxSplitter, cxGroupBox, SumPropis, Menus, Registry, Halcn6db, Kernel,
  FR_Class, FR_DSet, FR_DBSet, FR_View, DogLoaderUnit, cxLookAndFeelPainters,
  frxDesgn, dxStatusBar, cxButtons, fltPlatUnit, LangUnit, StrUtils,
  frxExportRTF, frxExportXLS, frxExportHTML, frxExportTXT, frxExportPDF,
  Accmgmt, CustomizerUnit, zproc, PackageLoad,ShapkaEditUnit;

type
  TplatForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    platDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    platReadDataSet: TpFIBDataSet;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ViewButton: TdxBarLargeButton;
    FilterButton: TdxBarLargeButton;
    pFIBStoredProc1: TpFIBStoredProc;
    cxGrid1DBTableView1KOD_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1ID_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1ID_KEY: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TIP_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1REGEST_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1N_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1D_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1NOMN_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1NOMD_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1ID_RATE_ACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_RATE_ACCOUNT_NATIVE: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CUSTOMER: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CUSTOMER: TcxGridDBColumn;
    cxGrid1DBTableView1MFO_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1RSCHET_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1NDS_SUM: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1NOTE: TcxGridDBColumn;
    cxGrid1DBTableView1KRIT_DAT: TcxGridDBColumn;
    cxGrid1DBTableView1EXPORT_DAY: TcxGridDBColumn;
    cxGrid1DBTableView1GARANT: TcxGridDBColumn;
    cxGrid1DBTableView1DELETED: TcxGridDBColumn;
    cxGrid1DBTableView1ID_REESTR: TcxGridDBColumn;
    cxGrid1DBTableView1ADD_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1ADD_COMP: TcxGridDBColumn;
    cxGrid1DBTableView1ADD_USER: TcxGridDBColumn;
    cxGrid1DBTableView1DELE_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1DELE_COMP: TcxGridDBColumn;
    cxGrid1DBTableView1DELE_USER: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_FINZ: TcxGridDBColumn;
    cxGrid1DBTableView1N_PP_FINZ: TcxGridDBColumn;
    cxGrid1DBTableView1DELETED_SYSTEM: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    SmallImages: TImageList;
    DisabledSmallImages: TImageList;
    PrintButton: TdxBarLargeButton;
    frxDBDataset1plat: TfrxDBDataset;
    SmetDataSet: TpFIBDataSet;
    SmetDataSource: TDataSource;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBTableView2ID_DOG_DT_PL_SMET: TcxGridDBColumn;
    cxGrid1DBTableView2ID_KEY: TcxGridDBColumn;
    cxGrid1DBTableView2ID_SMETA: TcxGridDBColumn;
    cxGrid1DBTableView2ID_RAZD: TcxGridDBColumn;
    cxGrid1DBTableView2ID_STAT: TcxGridDBColumn;
    cxGrid1DBTableView2SUMMA: TcxGridDBColumn;
    pFIBQuery1: TpFIBQuery;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    dxBarPopupMenu1: TdxBarPopupMenu;
    PrintA4: TdxBarLargeButton;
    EditShapka: TdxBarLargeButton;
    HalcyonDataSet1: THalcyonDataSet;
    WriteTransaction: TpFIBTransaction;
    ViewAction: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    Panel1: TPanel;
    ShowUserButton: TcxButton;
    frxPDFExport1: TfrxPDFExport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    cxButton1: TcxButton;
    agColumnCustomizer1: TagColumnCustomizer;
    PlatInfoA5: TfrxReport;
    cbUseShort: TcxCheckBox;
    dxBarLargeButton4: TdxBarLargeButton;
    frxDBDatasetPeople: TfrxDBDataset;
    dsPeople: TpFIBDataSet;
    dxBarLargeButton5: TdxBarLargeButton;
    pFIBQuery2: TpFIBQuery;
    dxBarEdit1: TdxBarEdit;
    dxBarListItem1: TdxBarListItem;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarMRUListItem1: TdxBarMRUListItem;
    dxBarStatic1: TdxBarStatic;
    pFIBQuery3: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    cxGrid1DBTableView1CheckBox: TcxGridDBColumn;
    DataSetMulty: TpFIBDataSet;
    frxDBDataset1Multy: TfrxDBDataset;
    DataSourceMulty: TDataSource;
    InfoPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxLabel1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    CancelFilterButton: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label4: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1NAME_SMETA: TcxGridDBColumn;
    cxGridDBTableView1ID_DOG_DT_PL_SMET: TcxGridDBColumn;
    cxGridDBTableView1ID_KEY: TcxGridDBColumn;
    cxGridDBTableView1ID_SMETA: TcxGridDBColumn;
    cxGridDBTableView1ID_RAZD: TcxGridDBColumn;
    cxGridDBTableView1ID_STAT: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1SUMMA: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn38: TcxGridDBColumn;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxDBMemo1: TcxDBMemo;
    EditSummSelect: TcxCurrencyEdit;
    PlatInfoA4: TfrxReport;
    cxLabel2: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    dsPeopleTN: TFIBIntegerField;
    dsPeopleFIO: TFIBStringField;
    dsPeopleSUMMA: TFIBBCDField;
    dsPeopleSUMMA_ALL: TFIBBCDField;
    dsPeopleACCT_CARD: TFIBStringField;
    dsPeopleTIN: TFIBStringField;
    dsPeopleEXPORT_DAY: TFIBDateField;
    dsPeopleID_MAN: TFIBBCDField;
    dsPeopleNAME_CUSTOMER_NATIVE: TFIBStringField;
    dsPeopleFAMILIYA: TFIBStringField;
    dsPeopleIMYA: TFIBStringField;
    dsPeopleOTCHESTVO: TFIBStringField;
    dsPeopleBIRTH_DATE: TFIBDateField;
    dsPeopleNUM_DOC: TFIBIntegerField;
    dsPeopleMFO: TFIBStringField;
    dsPeopleRATE_ACCOUNT_NATIVE: TFIBStringField;
    dsPeopleKOD_EDRPOU: TFIBStringField;
    dsPeopleMFO_CUST: TFIBStringField;
    dsPeopleRATE_ACCOUNT_CUST: TFIBStringField;
    dsPeopleKOD_EDRPOU_CUST: TFIBStringField;
    dsPeopleNAME_CUSTOMER: TFIBStringField;
    dsPeopleSHORT_NAME_TYPE_PAYMENT: TFIBStringField;
    dsPeopleOKPO: TFIBStringField;
    dsPeopleOUT_DAY: TFIBStringField;
    dsPeopleOUT_MONTH: TFIBStringField;
    dsPeopleOUT_YEAR: TFIBStringField;
    dsPeopleOUT_MONTH_I: TFIBStringField;
    dsPeopleOUT_MONTH_R: TFIBStringField;
    dsPeoplePRIZNAK: TFIBStringField;
    frxReportPeople: TfrxReport;
    dsPeopleEXPORT_OPERATOR: TFIBStringField;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure platDataSetAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FilterButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure PlatInfoA4GetValue(const VarName: String;
      var Value: Variant);
    procedure PrintA4Click(Sender: TObject);
    procedure printA5Click(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
//    procedure MakeRegButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CancelFilterButtonClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ShowUserButtonClick(Sender: TObject);
    procedure useShortButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure frxReportPeopleGetValue(const VarName: String;
      var Value: Variant);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure EditShapkaClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure cxDBTextEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
  public
    fltForm : TfltPlatForm;
    AllowMultiSelect : boolean;
    _id_reestr : integer;
    KeyField : string;
    SymbolArray:String;
//    ShowInfoPanel : boolean;
    printproc : TNotifyEvent;
//    procedure DelOldpL();
    FastPrint : boolean;
    procedure ResProc(id : int64; Action : TResAction);
    procedure SelectAll;
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
    procedure EditFile(PathStr:String;SumDogStr:Currency;NumDogStr:String;DateDogStr:TDate);
    function BuilDString(InputStr:String;NumSymbols:Integer;NumOfString:Integer):string;
    function FitStr(str : string; sym_count : integer; sym_trans : string) : string;
    function CheckStringEnd(InputStr:String;NumSymbols:Integer):Boolean;
  end;

  function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const _id_reestr : integer = -1; const dog_reg_num : string = '') : variant; stdcall;
  exports GetSpr;

  function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
  function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;

implementation
uses WSUnit, frxCross, fin_obligations, Math;

{$R *.dfm}
type
 TKekvInfo = record
  sm, r, st : integer;
  kekv : string;
 end;
var
 KEKV : array of TKekvInfo;
 prev_width : extended = 0;
 prev_left  : extended = 0;
 fWidth : integer = 0;
 first : boolean;

function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const _id_reestr : integer = -1; const dog_reg_num : string = '') : variant;
var
  plat: TplatForm;
begin
 plat := TplatForm.Create(AOwner);
 plat._id_reestr := _id_reestr;
 if plat._id_reestr = -1 then
 begin
   plat.fltForm.fltDateBegEdit.Date := date;
   plat.fltForm.fltDateEndEdit.Date := date;
   plat.fltForm.fltDatePeriodCheck.Checked := True;
 end;
 plat.InitConnection(DBHandle, RTrans, WTrans);
 plat.FormStyle := FS;
 if dog_reg_num <> '' then
 begin
   plat.fltForm.fltRegNumEdit.Text := dog_reg_num;
   plat.fltForm.fltRegNumCheck.Checked := True;
   plat.fltForm.fltDatePeriodCheck.Checked := false;
 end;
 if FS = fsNormal then begin
  plat.SelectAll;
  plat.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
  Result := plat.ShowModal;
  plat.Free;
  plat := Nil;
 end else begin
  Result := plat.Handle;
  plat.show;
  plat.Repaint;
  plat.SelectAll;
  plat.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
 end;
end;

procedure TplatForm.InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
begin
 WorkDatabase.Handle := DBhandle;
 ReadTransaction.Handle := RTransaction;
 WriteTransaction.Handle := WTransaction;
end;


procedure TplatForm.SelectAll;
var
 f : TForm;
 s : string;
 ch : char;
begin
 f := WaitScreenShow(Self);
 ch := DecimalSeparator;
 DecimalSeparator := '.';
 SmetDataSet.Close;
 platDataSet.Close;
 platDataSet.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
 platDataSet.ParamByName('id_reestr').AsInteger := _id_reestr;
 if cbUseShort.Checked then platDataSet.ParamByName('use_short').AsInteger := 1
                        else platDataSet.ParamByName('use_short').AsInteger := 0;

 if fltForm.fltTipDogCheck.Checked then platDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := fltForm.fltId_tip_dog
                                   else platDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := -1;


 if fltForm.flt_id_session_type <> -1 then
 begin
   platDataSet.ParamByName('ID_SESSION_TYPE').AsInt64 := fltForm.flt_id_session_type;
   platDataSet.ParamByName('FLT_ID_TIP_DOG').AsInteger := -1;
 end else platDataSet.ParamByName('ID_SESSION_TYPE').AsInt64 := -1;


 if fltForm.depCheck.Checked then platDataSet.ParamByName('ID_OTDEL').AsInt64 := fltForm.flt_id_department
                             else platDataSet.ParamByName('ID_OTDEL').AsInt64 := -1;
 s := '';
 if fltForm.chType.Checked then
 begin
   if fltForm.cbType.ItemIndex <> 3 then s := s + '(pl.DELETED_SYSTEM = ' + IntToStr(fltForm.cbType.ItemIndex + 1) + ') AND ';
 end else s := s + '(pl.DELETED_SYSTEM <> 3) and ';

// if fltForm.depCheck.Checked then s := s + '(pl.id_department = ' + IntToStr(fltForm.flt_id_department) + ') and ';
 if fltForm.chNumPlat.Checked then s := s + '(pl.NUM_DOC = ' + fltForm.NumPlatEdit.Text + ') and ';
 if fltForm.chAcc.Checked then s := s + '(pl.ID_RATE_ACCOUNT_NATIVE = ' + IntToStr(fltForm.id_rate_acc_native) + ') and ';
 if fltForm.fltDatePeriodCheck.Checked then s := s + '(pl.EXPORT_DAY >= ''' + DateToStr(fltForm.fltDateBegEdit.Date) + ''') and (pl.EXPORT_DAY <= ''' + DateToStr(fltForm.fltDateEndEdit.Date) + ''') and ';
 if fltForm.fltSumCheck.Checked then s := s + '(pl.SUMMA >= ' + FormatFloat('0.00', fltForm.fltSumFromEdit.Value) + ') and (pl.SUMMA <= ' + FormatFloat('0.00', fltForm.fltSumToEdit.Value) + ') and ';
 if fltForm.fltRegNumCheck.Checked then  s := s + '(pl.REGEST_NUM = ''' + fltform.fltRegNumEdit.Text + ''') and ';
 if fltForm.fltCustCheck.Checked then begin
  if fltForm.fltCustEdited then begin
   s := s + '(cust.NAME_CUSTOMER_UPPER like ''%' + AnsiUpperCase(fltform.fltCustEdit.Text) + '%'') and ';
  end else s := s + '(cust.ID_CUSTOMER = ' + IntToStr(fltForm.flt_id_Customer) + ') and ';
 end;
 s := 'and ' + s;
 if s <> 'and ' then s := Copy(s, 1, Length(s) - 4) else s := '';
 platDataSet.ParamByName('WHERE_COND').AsString := s;

 platDataSet.Open;
 SmetDataSet.Open;
 DecimalSeparator := ch;
 WaitScreenClose(f);
end;

procedure TplatForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TplatForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 reg : TRegistry;
begin
 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 if cbUseShort.Checked then reg.WriteString('UseShortName', '1') else reg.WriteString('UseShortName', '0');
 reg.CloseKey;
 reg.Free;

 SavePositionToRegistry(Self);
 Action := caFree;
end;

procedure TplatForm.RefreshButtonClick(Sender: TObject);
var
 selected : Int64;
begin
 selected := -1;
 if platDataSet.RecordCount <> 0 then selected := platDataSet['ID_DOG'];
 SelectAll;
 platDataSet.Locate('ID_DOG', selected, []);
end;

procedure TplatForm.FormShow(Sender: TObject);
begin
 LoadPositionFromRegistry(Self);
 cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
 if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
// SelectAll;
end;

procedure TplatForm.FormCreate(Sender: TObject);
var
 reg : TRegistry;
 s   : string;
begin
 LangPackApply(Self);
 agColumnCustomizer1.LoadFromRegistry;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Add') <> 0 then AddButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Del') <> 0 then DeleteButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Edit') <> 0 then EditButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','View') <> 0 then ViewButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Print') <> 0 then PrintButton.Visible := ivNever;

 fltForm := TfltPlatForm.Create(Self);
 fltForm.pFIBDatabase1 := WorkDatabase;
 fltForm.flt_id_department := dogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
 fltForm.depEdit.Text := dogLoaderUnit.SYS_DEF_NAME_DEPARTMENT;
 fltForm.depCheck.Checked := true;


  cxGrid1DBTableView1.Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
// fltForm.ownerDateCheck := fltDateCheck;
// fltForm.ownerShowClosedCheck := ShowClosedCheck;
// fltDateCheck.Properties.Caption := fltDateCheck.Properties.Caption + DateToStr(fltForm.fltDateBeg);
// fltForm.pFIBDatabase1 := WorkDatabase;
 printproc := printA4Click;
 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey('\Software\FMAS\Dogovor\', true);
 s := reg.ReadString('PlatPrintFormat');
 if s <> '' then begin
  if UpperCase(s) = 'A4' then begin
   printproc := printA4Click;
   PrintButton.LargeImageIndex := 14;
  end;
  if UpperCase(s) = 'A5' then begin
   printproc := printA5Click;
   PrintButton.LargeImageIndex := 15;
  end;
 end else reg.WriteString('PlatPrintFormat', 'A4');

 s := '';
 try
   s := reg.ReadString('UseShortName');
 except
 end;
 if s <> '' then
 begin
   if s = '1' then cbUseShort.Checked := true;
   if s = '0' then cbUseShort.Checked := false;
 end else reg.WriteString('UseShortName', '1');
 
 reg.CloseKey;
 reg.Free;

 KeyField := 'ID_DOCUMENT';
 cxGroupBox1.Caption := ' Реквізити ' + SYS_NAME_CUSTOMER_NATIVE + ' ';
end;

procedure TplatForm.platDataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
  PrintButton.Enabled := false;
//  PrintButton2.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
  PrintButton.Enabled := true;
//  PrintButton2.Enabled := true;
 end;
end;

procedure TplatForm.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  { AHandled := false;
   if not AllowMultiSelect then exit;
   if ACellViewInfo.Item.Index <> 0 then exit;
   if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] = 1 then
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 0
   else
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 1;
   AHandled := true;}


   AHandled := false;
   if ACellViewInfo.Item.Index <> 4 then exit;
   if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 4] = 1 then
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 4] := 0
   else
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 4] := 1;
   AHandled := true;


end;

procedure TplatForm.FilterButtonClick(Sender: TObject);
begin
// cxGrid1DBTableView1.Filtering.RunCustomizeDialog;
 if fltForm.ShowModal <> mrCancel then SelectAll;
// ShowFilterForm(Self, 'Фільтр для договорів', cxGrid1DBTableView1, ['NAME_CUSTOMER', 'NAME_TIP_DOG', 'REGEST_NUM', 'N_DOG', 'D_DOG', 'SUMMA', 'DOG_NOTE', 'COMMENT'], WorkDatabase.Handle, ReadTransaction.Handle, WriteTransaction.Handle);
end;

procedure TplatForm.AddButtonClick(Sender: TObject);
begin
 LoadDogManedger.WorkTypeDogSPR(Self, WorkDatabase.Handle, fsNormal, 'get', Nil, 1, Nil);
// SelectAll;
end;

procedure TplatForm.EditButtonClick(Sender: TObject);
begin
  if platDataSet['DELETED_SYSTEM'] = 3 then
  begin
    ShowMessage('Платiжне доручення видалено. Неможливо змiнити!');
    Exit;
  end;

  LoadDogManedger.PlatProsm(Self, WorkDatabase.Handle, fsMDIChild, platDataSet['ID_KEY'], 'red', ResProc);
end;

procedure TplatForm.ViewButtonClick(Sender: TObject);
begin
 LoadDogManedger.PlatProsm(Self, WorkDatabase.Handle, fsMDIChild, platDataSet['ID_KEY'], 'prosmotr', Nil);
end;

procedure DeletePlat(var plat : string; num_plat, date_plat, cum_plat : string);
const
 block_size = 1280;
 num_pos = 426;
var
 i, plat_count : integer;
 plat_idx : integer;
 s : string;
begin
 plat_count := Length(plat) div block_size;
 if plat_count = 0 then exit;
 plat_idx := -1;
 for i := 0 to plat_count - 1 do
 begin
   s := Trim(Copy(plat, i * block_size + num_pos, 10));
   if s = num_plat then
   begin
     plat_idx := i;
     break;
   end;
 end;
 if plat_idx <> -1 then
 begin
//   ShowMessage(plat);
   Delete(plat, plat_idx * block_size + 1, block_size);
//   ShowMessage(plat);
 end;
end;

{
 Процедура удаления платёжного поручения из клиент - банка.
 Добавлено: Удаление платёжки из буфера укрсиб банка
 Герасименко Роман 
}
procedure TplatForm.DeleteButtonClick(Sender: TObject);
var
 selected : Int64;
 Str:String;
 q : TpFIBQuery;
 path : string;
 id_pb_key : integer;
 deleted : boolean;
 tr : TpFIBTransaction;
 transaction_pl, transaction_lock: TpFIBTransaction; //блокирует таблицу DOG_PL_LOCK
 dataset_pl, dataset_ini_lock: TpFIBDataSet;
 RecInfo: RECORD_INFO_STRUCTURE;
 ResultInfo: RESULT_STRUCTURE;
 id_del_pl : Variant;
 s : String;
 StoredProc_pl, StoredProc_pl_ins: TpFIBStoredProc;
 Prog_del    : String;
 num_doc     : Integer;
 export_day  : TDate;
 summa       : Currency;
 sl          : TStringList;
 ss, ss1, ss2: String;
 kol_vo      : Integer;
 i, j, n     : Integer;


 id_key_shapka  : Integer;
 tmp_id_format : string;
 id_key_lgh  : Integer;
 nomer_pl    :Integer;
 name_format : string;
 path_txt    : string;
 num_doc_pl  : string;

begin
  if platDataSet['DELETED_SYSTEM'] = 3 then
  begin
    ShowMessage('Платiжне доручення вже видалено.');
    Exit;
  end;

  if platDataSet['DELETED_SYSTEM'] = 1 then
  begin
    ShowMessage('Платiжне доручення вже оброблено у банку.');
    Exit;
  end;


  if MessageDlg('Увага', 'Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;

// проверить если файл для выгрузки данных

  q := TpFIBQuery.Create(Self);
  q.Transaction := ReadTransaction;
  q.SQL.Clear;
  q.SQL.Text := 'select distinct PATH_BUFF as path,'+' '+
                       'DOG_DT_BANKBUFF.prog_dele'+' '+
                'from   DOG_DT_BANKBUFF, pub_expand_rate_acc_native,'+' '+
                       'dog_dt_pl_doc'+' '+
                'where  dog_dt_pl_doc.id_rate_account_native=pub_expand_rate_acc_native.id_rate_account'+' '+
                'and    pub_expand_rate_acc_native.id_bank_buff=DOG_DT_BANKBUFF.id_bank_buff'+' '+
                'and    dog_dt_pl_doc.id_key = ' + IntToStr(platDataSet.FieldByName('ID_KEY').AsInteger);

  q.ExecQuery;
  path_txt:=q['path'].AsString;
  q.Close;

  q.SQL.Clear;
  q.Transaction := ReadTransaction;
  q.SQL.Text := 'select distinct PATH_BUFF || ''\'' || ALIAS_BUFF as path,'+' '+
                       'DOG_DT_BANKBUFF.prog_dele'+' '+
                'from   DOG_DT_BANKBUFF, pub_expand_rate_acc_native,'+' '+
                       'dog_dt_pl_doc'+' '+
                'where  dog_dt_pl_doc.id_rate_account_native=pub_expand_rate_acc_native.id_rate_account'+' '+
                'and    pub_expand_rate_acc_native.id_bank_buff=DOG_DT_BANKBUFF.id_bank_buff'+' '+
                'and    dog_dt_pl_doc.id_key = ' + IntToStr(platDataSet.FieldByName('ID_KEY').AsInteger);
  q.ExecQuery;
  path := q['path'].AsString;
  prog_del := q['prog_dele'].AsString;
  q.Close;

//  showmessage('path= ' + path);
//  showmessage('path_txt= ' + path_txt);

  if path <> '' then
  begin
    if not FileExists(path) then
    begin
     if MessageDlg('Увага', 'Платіжне доручення вже передано у клієнт-банк. Видалити?', mtConfirmation, [mbYes, mbNo]) = mrNo then exit;
    end;
  end;

//эта транзакция блокирует таблицу   DOG_PL_LOCK
  transaction_pl := TpFIBTransaction.Create(Self);
  transaction_pl.DefaultDatabase := WorkDatabase;

  dataset_pl := TpFIBDataSet.Create(Self);
  dataset_pl.Database := WorkDatabase;
  dataset_pl.Transaction := transaction_pl;
  s := 'select * from DOG_PL_LOCK';

  dataset_pl.SelectSQL.Add(s);
  dataset_pl.Active := true;

  transaction_pl.StartTransaction;

  RecInfo.TRHANDLE       :=transaction_pl.Handle;
  RecInfo.DBHANDLE       :=WorkDatabase.Handle;
  RecInfo.ID_RECORD      :=VarArrayOf([1]);
  RecInfo.PK_FIELD_NAME  :=VarArrayOf(['PL_LOCK']);
  RecInfo.TABLE_NAME     :='DOG_PL_LOCK';
  RecInfo.RAISE_FLAG     :=True;
  LockRecord(@RecInfo);
//******************************************************************//

  transaction_lock := TpFIBTransaction.Create(Self);//транзакция пишет в DOG_INI_PL id платежки, которую мы удаляем
  transaction_lock.DefaultDatabase := WorkDatabase;
  transaction_lock.StartTransaction;

  dataset_ini_lock := TpFIBDataSet.Create(Self);
  dataset_ini_lock.Database := WorkDatabase;
  dataset_ini_lock.Transaction := transaction_lock;

  StoredProc_pl_ins := TpFIBStoredProc.Create(Self);
  StoredProc_pl_ins.Transaction := transaction_lock;

  StoredProc_pl_ins.StoredProcName := 'DOG_INI_PL_UPDATE';
  StoredProc_pl_ins.Prepare;
  StoredProc_pl_ins.ParamByName('ID_DEL_PL').Value := platDataSet.FieldByName('ID_KEY').AsVariant;
   try
     StoredProc_pl_ins.ExecProc;
   Except
     transaction_lock.Rollback;
     transaction_lock.Free;
     Exit;
   end;
     transaction_lock.Commit;
     transaction_lock.Free;


//*********************************************************************//


  tr := TpFIBTransaction.Create(Self);
  tr.DefaultDatabase := WorkDatabase;
  WriteProc.Transaction := tr;
  tr.StartTransaction;

  selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;

  WriteProc.StoredProcName := 'DOG_DT_PL_DELETE';
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KEY_SHAPKA').Value := platDataSet.FieldByName('ID_KEY').AsVariant;
  WriteProc.ParamByName('ID_USER').Value := SYS_ID_USER;
  WriteProc.ExecProc;

 //  WriteProc.ExecProcedure('DOG_DT_PL_DELET', [DataSet.FieldByName('ID_KEY').AsVariant]);


 //УДАЛЕНИЕ из DBF
 if (prog_del = 'DelImport') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_DT_PL_DOC where ID_KEY = ' + IntToStr(platDataSet.FieldByName('ID_KEY').AsInteger);
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelEximbank') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_EXIMBANK where ID_KEY = ' + IntToStr(platDataSet.FieldByName('ID_KEY').AsInteger);
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelFUIB') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_FUIB where ID_KEY = ' + IntToStr(platDataSet.FieldByName('ID_KEY').AsInteger);
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelChermet') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_CHERMET where ID_KEY = ' + IntToStr(platDataSet.FieldByName('ID_KEY').AsInteger);
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelUSB') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_USB where NUM_DOG = ' + platDataSet.FieldByName('NUM_DOC').AsString;
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelFIK') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_FIK where DOC_NO = ' + platDataSet.FieldByName('NUM_DOC').AsString;
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelPrivat_I') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_PRIVAT where N_DOC = ' + platDataSet.FieldByName('NUM_DOC').AsString;
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   q.Close;
 end;

 if (prog_del = 'DelPrivat_III') then
 begin
   q.SQL.Text := 'select ID_PBKEY from BUFF_DOG_PRIVAT_NEW where N_D= ' + platDataSet.FieldByName('NUM_DOC').AsString;
   q.ExecQuery;
   id_pb_key := q['ID_PBKEY'].AsInteger;
   num_doc_pl := platDataSet.FieldByName('NUM_DOC').AsString;
   q.Close;

   q.Free;
   HalcyonDataSet1.Close;
   HalcyonDataSet1.DatabaseName := ExtractFilePath(path);
   HalcyonDataSet1.TableName := ExtractFileName(path);

   try
    HalcyonDataSet1.Open;
   except on e:Exception do
    begin
     ShowMessage(e.Message);
     tr.Rollback;
     tr.Free;
     transaction_pl.Rollback;
     transaction_pl.Free;
     Exit;
    end;
    end;
   deleted := false;
   while not HalcyonDataSet1.Eof do begin
    if not VarIsNull(HalcyonDataSet1['n_d']) then if HalcyonDataSet1['n_d'] = num_doc_pl then begin
     HalcyonDataSet1.Delete;
     deleted := true;
     break;
    end;
    HalcyonDataSet1.Next;
    end;
    if not deleted then ShowMessage('Платежка не найдена в буфере!');
 end;



 if (prog_del = 'DelFromTxt') and (FileExists(path)) then
 begin

   num_doc    := platDataSet.FBN('num_doc').AsInteger;
   export_day := platDataSet.FBN('export_day').AsDateTime;
   summa      := platDataSet.FBN('summa').AsCurrency;

   sl := TStringList.Create;
   sl.LoadFromFile(path);
   ss := sl.Text;

   DeletePlat(ss, IntToStr(num_doc), '', '');
   sl.Text := ss;
   sl.SaveToFile(path);

   prog_del := '';
 end;


    if (prog_del = 'DelUSB') and (FileExists(path)) then
   begin

    sl := TStringList.Create;
    sl.LoadFromFile(path);

      Str:=UpperCase('Num_DOG='+platDataSet.FieldByName('NUM_DOC').AsString);
      n:=(sl.Count-2)div 15 ;
   { ShowMessage('#'+#10#13+
          '0== '+sl[0]+#10#13+
          '1== '+sl[1]+#10#13+
          '2== '+sl[2]+#10#13+
          '3== '+sl[3]+#10#13+
          '4== '+sl[4]+#10#13+
          '5== '+sl[5]+#10#13+
          '6== '+sl[6]+#10#13+
          '7== '+sl[7]+#10#13+
          '8== '+sl[8]+#10#13+
          '9== '+sl[9]+#10#13+
          '10= '+sl[10]+#10#13+
          '11= '+sl[11]+#10#13+
          '12= '+sl[12]+#10#13+
          '13= '+sl[13]+#10#13+
          '14= '+sl[14]+#10#13+
          '15= '+sl[15]+#10#13+
          '16= '+sl[16]+#10#13+
          '17= '+sl[17]+#10#13+
          '18= '+sl[18]+#10#13+
          '19= '+sl[19]+#10#13+
          '20= '+sl[20]+#10#13+
          '21= '+sl[21]+#10#13
                );
                }
    for i:=0 to n  do
    begin
      if  UpperCase(sl[i*14+3]) = UpperCase(Str) then
      begin
         for j:=0 to 13 do
         begin
            sl.Delete(i*14+2);
         end;
         break;
      end;
    end;
    sl.SaveToFile(path);
    prog_del := '';
   end;


 if (prog_del <> '') and (prog_del <>'DelFromTxt') and (prog_del <> 'DelUkrSibTxt') and (prog_del <> 'DelPrivat_III') then
 begin
    q.Free;
    HalcyonDataSet1.Close;
    HalcyonDataSet1.DatabaseName := ExtractFilePath(path);
    HalcyonDataSet1.TableName := ExtractFileName(path);
    try
     HalcyonDataSet1.Open;
    except on e:Exception do
     begin
      ShowMessage(e.Message);
      tr.Rollback;
      tr.Free;
      transaction_pl.Rollback;
      transaction_pl.Free;
      Exit;
     end;
    end;
    deleted := false;
    while not HalcyonDataSet1.Eof do begin
     if not VarIsNull(HalcyonDataSet1['ID_PBKEY']) then if HalcyonDataSet1['ID_PBKEY'] = id_pb_key then begin
      HalcyonDataSet1.Delete;
      deleted := true;
      break;
     end;
     HalcyonDataSet1.Next;
    end;
    if not deleted then ShowMessage('Платежка не найдена в буфере!');
  end;

 {
  Предварительное вычисление наименования файла.
  Герасименко Р.В
 }

 id_key_shapka:=platDataSet.FieldByName('ID_KEY').AsInteger;

 tmp_id_format:=IntToStr(id_key_shapka);
 id_key_lgh:=Length(tmp_id_format)-2;
 delete(tmp_id_format,id_key_lgh,2);
 nomer_pl:=platDataSet.FieldByName('NUM_DOC').AsInteger;

 name_format:=Format('%.5d', [nomer_pl])+tmp_id_format;

 path:=path_txt+'\'+name_format+'.txt';


 if (prog_del = 'DelUkrSibTxt') and (FileExists(path)) then
 begin
   if DeleteFile(path) then
   ShowMessage('Платёжное поручение успешно удалено');
 end;




 tr.Commit;
 tr.Free;
 WriteProc.Transaction := WriteTransaction;
 //end;
//********************************************************************//
//Обнуляется значение первичного ключа

  StoredProc_pl := TpFIBStoredProc.Create(Self);
  StoredProc_pl.Transaction := transaction_pl;

  StoredProc_pl.StoredProcName := 'DOG_INI_PL_UPDATE';
  StoredProc_pl.Prepare;
  StoredProc_pl.ParamByName('ID_DEL_PL').Value := 0;
  try
    StoredProc_pl.ExecProc;
  except
    transaction_pl.Rollback;
    transaction_pl.Free;
    Exit;
  end;

//********************************************************************//
//Обновляется оплаченная сумма у родителя
  StoredProc_pl.StoredProcName := 'DOG_DT_UPD_PARENT_DEL';
  StoredProc_pl.Prepare;
  StoredProc_pl.ParamByName('ID_DOG').Value := platDataSet.FieldByName('ID_DOG').AsVariant;
  try
    StoredProc_pl.ExecProc;
  except
    transaction_pl.Rollback;
    transaction_pl.Free;
    Exit;
  end;

  StoredProc_pl.Free;

  //закрывается транзакция и разблокируется таблица  DOG_PL_LOCK
   transaction_pl.Commit;
   transaction_pl.Free;
//********************************************************************//
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;

end;

procedure TplatForm.PlatInfoA4GetValue(const VarName: String;
  var Value: Variant);
var
 str : string;
begin
 IF VarName = 'SUM_PROPIS' then
 begin
   str := zproc.SumToString(platReadDataSet['SUMMA']);
   str[1] := AnsiUpperCase(str[1])[1];
   Value := str;
 end;
end;

function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
  i : integer;

begin
  Result := false;
  if DataSet.RecordCount = 0 then exit;
  TableView.DataController.FocusedRecordIndex := 0;
  i := 0;
  while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 4] <> 1) do inc(i);
  DataSet.MoveBy(i);
  if i <> TableView.DataController.RecordCount then Result := true;
end;

function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
  i : integer;
begin
  Result := false;
  if DataSet.RecordCount = 0 then exit;
  i := TableView.DataController.FocusedRecordIndex + 1;
  while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 4] <> 1) do inc(i);
  DataSet.MoveBy(i - TableView.DataController.FocusedRecordIndex);
  if i <> TableView.DataController.RecordCount then Result := true;
end;


// Печать платёжного поручения в формате А4
procedure TplatForm.PrintA4Click(Sender: TObject);
var
 reg : TRegistry;
 repFile : string;
 useShort : integer;
 note : string;
  selected,i : integer;
   id_reestr : array of integer;
   s :String;
begin
  if cxGrid1DBTableView1.Controller.SelectedRowCount<=1 then
 begin
  selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, platDataSet) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := platDataSet['ID_KEY'];
    //cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
  until not GoToNextSelected(cxGrid1DBTableView1, platDataSet);
  if Length(id_reestr) = 0 then begin
    cxGrid1DBTableView1.DataController.RecNo := selected;
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := platDataSet['ID_KEY'];
    //ShowMessage('Виберіть хоча б один запис.');
    //exit;
  end;
  end
  else
   for i:=0 to  cxGrid1DBTableView1.Controller.SelectedRowCount-1 do
   begin
     SetLength(id_reestr, Length(id_reestr) + 1);
     id_reestr[Length(id_reestr) - 1] := cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[2];
   end;



  if cbUseShort.Checked then useShort := 1 else useShort := 0;
  repFile := 'platA4.fr3';
    pFIBQuery1.Close;
    pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 1';
    pFIBQuery1.ExecQuery;
    if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
    pFIBQuery1.Close;

  if Length(id_reestr) > 1 then
   begin
     Delete(repFile, Length(repFile)-3,4);
     repFile:=repFile+'_multi.fr3';
   end;

  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then PlatInfoA4.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);

  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then if not FastPrint then
  begin
   PlatInfoA4.DesignReport;
   Exit;
  end;

  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey('\Software\FMAS\Dogovor\', true);
  reg.WriteString('PlatPrintFormat', 'A4');
  reg.CloseKey;
  reg.Free;
  PrintButton.LargeImageIndex := 14;

  printproc := printA4Click;
  platReadDataSet.Close;

  s:='';
  for i:=0 to Length(id_reestr)-1 do
  begin
    s:=s+inttostr(id_reestr[i]);
    if i<>Length(id_reestr)-1 then s:=s+',';
  end;
// ShowMessage(s);
  //frxDBDataset1plat.DataSet := platReadDataSet;
  //////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////
     //////////////////////////////////////////////////////////////////////////////////////////////
   platReadDataSet.SelectSQL.Text := 'select * from PROC_REP_PLATS_INFO(''' +s + ''', ' + IntToStr(useshort) + ')';
  s := platReadDataSet.SelectSQL.Text;
  platReadDataSet.Open;
  PlatInfoA4.PrintOptions.ShowDialog := true;

  // platReadDataSet.CacheModify([platReadDataSet.fbn('NOTE').Index], [FitStr(platReadDataSet.fbn('NOTE').asstring,62,' .,!";? :-')],0);

  if FastPrint then
  begin
  PlatInfoA4.PrintOptions.ShowDialog := False;
  PlatInfoA4.PrepareReport();
  PlatInfoA4.Print;
  end else   if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  PlatInfoA4.DesignReport else PlatInfoA4.ShowReport;
  // PlatInfoA4.DesignReport;

  platReadDataSet.Close;
  //RefreshButtonClick(Sender);
end;

// Печать платёжного поручения в формате А5
procedure TplatForm.printA5Click(Sender: TObject);
var
 reg : TRegistry;
 repFile : string;
 useShort : integer;
 note : string;
   selected,i : integer;
   id_reestr : array of integer;
     s :String;
begin
 if cxGrid1DBTableView1.Controller.SelectedRowCount<=1 then
 begin
    selected := cxGrid1DBTableView1.DataController.RecNo;
    if GoToFirstSelected(cxGrid1DBTableView1, platDataSet) then repeat
      SetLength(id_reestr, Length(id_reestr) + 1);
      id_reestr[Length(id_reestr) - 1] := platDataSet['ID_KEY'];
    //cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
    until not GoToNextSelected(cxGrid1DBTableView1, platDataSet);
    if Length(id_reestr) = 0 then begin
      cxGrid1DBTableView1.DataController.RecNo := selected;
      SetLength(id_reestr, Length(id_reestr) + 1);
      id_reestr[Length(id_reestr) - 1] := platDataSet['ID_KEY'];
      //ShowMessage('Виберіть хоча б один запис.');
      //exit;
    end;
 end else
   for i:=0 to  cxGrid1DBTableView1.Controller.SelectedRowCount-1 do
   begin
     SetLength(id_reestr, Length(id_reestr) + 1);
     id_reestr[Length(id_reestr) - 1] := cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[2];
   end;


   if cbUseShort.Checked then useShort := 1 else useShort := 0;
   repFile := 'platA5.fr3';
   pFIBQuery1.Close;
   pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 2';
   pFIBQuery1.ExecQuery;
   if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
   pFIBQuery1.Close;



   if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then PlatInfoA5.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repfile);

   if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then if not FastPrint then
   begin
     PlatInfoA5.DesignReport;
     Exit;
   end;
   reg := TRegistry.Create;
   reg.RootKey := HKEY_CURRENT_USER;
   reg.OpenKey('\Software\FMAS\Dogovor\', true);
   reg.WriteString('PlatPrintFormat', 'A5');
   reg.CloseKey;
   reg.Free;
   PrintButton.LargeImageIndex := 15;

   printproc := printA5Click;
   platReadDataSet.Close;
  // frxDBDataset1plat.DataSet := platReadDataSet;
   s:='';
  for i:=0 to Length(id_reestr)-1 do
  begin
    s:=s+inttostr(id_reestr[i]);
    if i<>Length(id_reestr)-1 then s:=s+',';
  end;
// ShowMessage(s);
  //frxDBDataset1plat.DataSet := platReadDataSet;
  //////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////
     //////////////////////////////////////////////////////////////////////////////////////////////
   platReadDataSet.SelectSQL.Text := 'select * from PROC_REP_PLATS_INFO(''' +s + ''', ' + IntToStr(useshort) + ')';
 platReadDataSet.Open;
   PlatInfoA5.PrintOptions.ShowDialog := true;


  // platReadDataSet.CacheModify([platReadDataSet.fbn('NOTE').Index], [FitStr(platReadDataSet.fbn('NOTE').asstring,62,' .,!";? :-')],0);

   if FastPrint then
   begin
    PlatInfoA5.PrintOptions.ShowDialog := False;
    PlatInfoA5.PrepareReport();
    PlatInfoA5.Print;
   end else PlatInfoA5.ShowReport;
  // PlatInfoA5.DesignReport;
   platReadDataSet.Close;
   //RefreshButtonClick(Sender);
end;

procedure TplatForm.PrintButtonClick(Sender: TObject);
begin
  printproc(Self);
  FastPrint := False;
end;

{
procedure TplatForm.MakeRegButtonClick(Sender: TObject);
var
 f : TForm;
 selected : integer;
 isNeeded : boolean;
 rate_acc : array of integer;
 sums     : array of currency;
 id_key   : array of array of integer;

 r, k, j : integer;
 rate_account, mfo : string;
 id_bank, reg_num, id_reestr : integer;

 function isRateAccExists(const id_rate_acc_native : integer) : integer;
 var
  i : integer;
 begin
  Result := -1;
  if Length(rate_acc) = 0 then exit;
  for i := 0 to Length(rate_acc) - 1 do if rate_acc[i] = id_rate_acc_native then begin
   Result := i;
   exit;
  end;
 end;

begin
 WriteProc.Transaction := WriteTransaction;
 selected := DataSet['ID_KEY'];
 f := WaitScreenShowWithProgress(Self, DataSet.RecordCount, 'Збір даних...');
 isNeeded := false;
 DataSet.First;
 while not DataSet.Eof do begin
  if VarIsNull(DataSet['ID_REESTR']) then begin
   k := isRateAccExists(DataSet['ID_RATE_ACCOUNT_NATIVE']);
   if k = -1 then begin
    pFIBQuery1.Close;
    pFIBQuery1.ExecProcedure('PROC_IS_NEEDED_REESTR', [DataSet['ID_RATE_ACCOUNT_NATIVE']]);
    if pFIBQuery1['IS_NEEDED'].AsInteger = 1 then begin
     isNeeded := true;
     SetLength(sums, Length(sums) + 1);
     SetLength(rate_acc, Length(rate_acc) + 1);
     rate_acc[Length(rate_acc) - 1] := DataSet['ID_RATE_ACCOUNT_NATIVE'];
     sums[Length(sums) - 1] := DataSet['SUMMA'];
     SetLength(id_key, Length(id_key) + 1);
     SetLength(id_key[Length(id_key) - 1], 1);
     id_key[Length(id_key) - 1][0] := DataSet['ID_KEY'];
    end;
    pFIBQuery1.Close;
   end else begin
    SetLength(id_key[k], Length(id_key[k]) + 1);
    id_key[k][Length(id_key[k]) - 1] := DataSet['ID_KEY'];
    Sums[k] := Sums[k] + DataSet['SUMMA'];
   end;
  end;
  DataSet.Next;
  WaitScreenStep(f);
 end;
 WaitScreenClose(f);
 if not isNeeded then begin
  ShowMessage('Неможливо сформувати реєстр. Всі записи уже сформовані.');
  exit;
 end;
 f := WaitScreenShowWithProgress(Self, Length(rate_acc), 'Формування реєстру...');
 WriteProc.Transaction.StartTransaction;
 for r := 0 to Length(rate_acc) - 1 do begin
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select RATE_ACCOUNT, ID_BANK from PUB_SP_CUST_RATE_ACC where ID_RATE_ACCOUNT = ' + IntToStr(rate_acc[r]);
  pFIBQuery1.ExecQuery;
  if pFIBQuery1.RecordCount = 0 then begin
   pFIBQuery1.Close;
   continue;
  end;
  id_bank := pFIBQuery1['ID_BANK'].AsInteger;
  rate_account := pFIBQuery1['RATE_ACCOUNT'].AsString;
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select MFO from PUB_SP_BANK where ID_BANK = ' + IntToStr(id_bank);
  pFIBQuery1.ExecQuery;
  if pFIBQuery1.RecordCount = 0 then mfo := '' else mfo := pFIBQuery1['MFO'].AsString;
  pFIBQuery1.Close;

  WriteProc.StoredProcName := 'PROC_GET_REESTR_REG_NUM';
  WriteProc.Prepare;
  WriteProc.ExecProc;
  reg_num := WriteProc['REG_NUM'].AsInteger;

//  for j := 0 to Length(id_key[r]) - 1 do begin
//   DataSet.Locate('ID_KEY', id_key[r][j], [loPartialKey]);
   WriteProc.StoredProcName := 'PROC_DOG_DT_PL_REE_ADD';
   WriteProc.Prepare;
   WriteProc.ParamByName('NUM_REESTR').AsInteger := reg_num;
   WriteProc.ParamByName('DATE_REESTR').AsDate := date;
   WriteProc.ParamByName('MFO_DONNU').AsString := mfo;
   WriteProc.ParamByName('RATE_ACC_DONNU').AsString := rate_account;
   WriteProc.ParamByName('SUMMA').AsCurrency := Sums[r];
   WriteProc.ParamByName('SUM_ZAYAVKA').AsCurrency := 0;
   WriteProc.ParamByName('CREATION_TIME').AsDateTime := now;
   WriteProc.ParamByName('PRINT_TIME').AsDateTime := now;
   WriteProc.ParamByName('OUT_TIME').AsVariant := null;
   WriteProc.ExecProc;
   id_reestr := WriteProc['ID_REESTR'].AsInteger;

   for j := 0 to Length(id_key[r]) - 1 do begin
    DataSet.Locate('ID_KEY', id_key[r][j], [loPartialKey]);
    WriteProc.StoredProcName := 'PROC_DOG_DT_PL_DOC_SET_REE';
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_KEY').AsInteger := id_key[r][j];
    WriteProc.ParamByName('ID_REESTR').AsInteger := id_reestr;
    WriteProc.ParamByName('NUM_REESTR').AsInteger := reg_num;
    WriteProc.ExecProc;
  end;
 end;
 WriteProc.Transaction.Commit;
 DataSet.Locate('ID_KEY', selected, [loPartialKey]);
 WaitScreenClose(f);
 RefreshButtonClick(Self);
 ShowRee(Self, WorkDatabase.Handle, ReadTransaction.Handle, WriteTransaction.Handle, fsMDIChild);
end;
 }
procedure TplatForm.cxGridDBTableView1DblClick(Sender: TObject);
begin
 if SmetDataSet.RecordCount = 0 then exit;
 ShowMessage('Смета(' + IntToStr(SmetDataSet['SMETA_KOD']) + '): ' + SmetDataSet['NAME_SMETA'] + #13 +
            'Раздел(' + IntToStr(SmetDataSet['RAZD_NUM']) + '): ' + SmetDataSet['RAZD_NAME'] + #13 +
            'Статья(' + IntToStr(SmetDataSet['STAT_NUM']) + '): ' + SmetDataSet['STAT_NAME'] + #13 +
            'КЭКВ(' + IntToStr(SmetDataSet['KEKV_CODE']) + '): ' + SmetDataSet['NAME_KEKV']);
end;

procedure TplatForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 ViewButtonClick(Self);
// dxBarLargeButton1Click( Self);
end;


{procedure DelOldpL();
//var
// DataSet_OldPl : TpFIBDataSet;
// s: String;
begin
  DataSet_OldPl := TpFIBDataSet.Create(Self);
  DataSet_OldPl.Database := WorkDatabase;
  DataSet_OldPl.TransactionEnding := writ;
  if
end;}


procedure TplatForm.dxBarLargeButton1Click(Sender: TObject);
var
  frm : TfrmFin_obl;
  DataSet_fin_obl: TpFIBDataSet;
begin
  if platDataSet['DELETED_SYSTEM'] = 3 then
  begin
    ShowMessage('Платiжне доручення вже видалено.');
    Exit;
  end;

  frm := TfrmFin_obl.Create(Self);
  DataSet_fin_obl := TpFIBDataSet.Create(Self);
  DataSet_fin_obl.Database := WorkDatabase;
  DataSet_fin_obl.Transaction := ReadTransaction;
  DataSet_fin_obl.SQLs.SelectSQL.Text := 'SELECT * FROM PROC_PLAT_DETAILS_SEL ('+IntToStr(platDataSet.FieldByName('id_key').AsInteger)+')';
  DataSet_fin_obl.Active := true;

  if not VarIsNull(DataSet_fin_obl.FieldByName('DATE_URZB').Value) then frm.cxDateEdit_uz_obl.Date := DataSet_fin_obl.FieldByName('DATE_URZB').AsDateTime;
  if not VarIsNull(DataSet_fin_obl.FieldByName('N_PP_URZB').Value) then frm.cxTextEdit_number_uz.Text := DataSet_fin_obl.FieldByName('N_PP_URZB').AsString;
  if not VarIsNull(DataSet_fin_obl.FieldByName('UZ_NUM_DOC').Value) then frm.eNum_doc_uz.Text := DataSet_fin_obl.FieldByName('UZ_NUM_DOC').AsString;
  if not VarIsNull(DataSet_fin_obl.FieldByName('UZ_DATE_DOC').Value) then frm.eDate_doc_uz.Date := DataSet_fin_obl.FieldByName('UZ_DATE_DOC').AsDateTime;
  if not VarIsNull(DataSet_fin_obl.FieldByName('U_NUMBER').Value) then frm.cxU_number.Text := DataSet_fin_obl.FieldByName('U_NUMBER').AsString;

  if not VarIsNull(DataSet_fin_obl.FieldByName('DATE_FINZ').Value) then frm.cxDateEdit_fin_obl.Date := DataSet_fin_obl.FieldByName('DATE_FINZ').AsDateTime;
  if not VarIsNull(DataSet_fin_obl.FieldByName('N_PP_FINZ').Value) then frm.cxTextEdit_number.Text := DataSet_fin_obl.FieldByName('N_PP_FINZ').AsString;
  if not VarIsNull(DataSet_fin_obl.FieldByName('FZ_NUM_DOC').Value) then frm.eNum_doc.Text := DataSet_fin_obl.FieldByName('FZ_NUM_DOC').AsString;
  if not VarIsNull(DataSet_fin_obl.FieldByName('FZ_DATEDOC').Value) then frm.eDatedoc.Date := DataSet_fin_obl.FieldByName('FZ_DATEDOC').AsDateTime;
  if not VarIsNull(DataSet_fin_obl.FieldByName('F_NUMBER').Value) then frm.cxF_number.Text := DataSet_fin_obl.FieldByName('F_NUMBER').AsString;

  DataSet_fin_obl.Active := false;
  DataSet_fin_obl.Free;

  if frm.ShowModal = mrOk then
  begin
   pFIBStoredProc1.Transaction := WriteTransaction;
   WriteTransaction.StartTransaction;
   pFIBStoredProc1.StoredProcName := 'DOG_DT_PL_FIN_OBL_UPDATE';
   pFIBStoredProc1.Prepare;

   if Trim(frm.cxTextEdit_number.Text)='' then
    pFIBStoredProc1.ParamByName('N_PP_FINZ').Value := Null else
      pFIBStoredProc1.ParamByName('N_PP_FINZ').Value := Trim(frm.cxTextEdit_number.Text);

   if Trim(frm.cxDateEdit_fin_obl.Text)='' then
    pFIBStoredProc1.ParamByName('DATE_FINZ').Value := Null else
      pFIBStoredProc1.ParamByName('DATE_FINZ').Value := frm.cxDateEdit_fin_obl.Date;

   if Trim(frm.eDatedoc.Text)='' then
    pFIBStoredProc1.ParamByName('FZ_DATEDOC').Value := Null else
      pFIBStoredProc1.ParamByName('FZ_DATEDOC').Value := frm.eDatedoc.Date;

   if Trim(frm.eNum_doc.Text)='' then
    pFIBStoredProc1.ParamByName('FZ_NUM_DOC').Value := Null else
      pFIBStoredProc1.ParamByName('FZ_NUM_DOC').Value := Trim(frm.eNum_doc.Text);


   if Trim(frm.cxTextEdit_number_uz.Text)='' then
    pFIBStoredProc1.ParamByName('N_PP_URZB').Value := Null else
      pFIBStoredProc1.ParamByName('N_PP_URZB').Value := Trim(frm.cxTextEdit_number_uz.Text);

   if Trim(frm.cxDateEdit_uz_obl.Text)='' then
    pFIBStoredProc1.ParamByName('DATE_URZB').Value := Null else
      pFIBStoredProc1.ParamByName('DATE_URZB').Value := frm.cxDateEdit_uz_obl.Date;

   if Trim(frm.eDate_doc_uz.Text)='' then
    pFIBStoredProc1.ParamByName('UZ_DATE_DOC').Value := Null else
      pFIBStoredProc1.ParamByName('UZ_DATE_DOC').Value := frm.eDate_doc_uz.Date;

   if Trim(frm.eNum_doc_uz.Text)='' then
    pFIBStoredProc1.ParamByName('UZ_NUM_DOC').Value := Null else
      pFIBStoredProc1.ParamByName('UZ_NUM_DOC').Value := Trim(frm.eNum_doc_uz.Text);

   if Trim(frm.cxU_number.Text)='' then
    pFIBStoredProc1.ParamByName('NUM_REE_URZB').Value := Null else
      pFIBStoredProc1.ParamByName('NUM_REE_URZB').Value := Trim(frm.cxU_number.Text);

   if Trim(frm.cxF_number.Text)='' then
    pFIBStoredProc1.ParamByName('NUM_REE_FNZB').Value := Null else
      pFIBStoredProc1.ParamByName('NUM_REE_FNZB').Value := Trim(frm.cxF_number.Text);

   pFIBStoredProc1.ParamByName('ID_KEY').Value := platDataSet.FieldByName('id_key').AsInteger;
   try
     pFIBStoredProc1.ExecProc;
   except
     begin
       WriteTransaction.Rollback;
       Exit;
     end;
   end;
     WriteTransaction.Commit;
  end;
  frm.Free;
end;

procedure TplatForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_DELETE then if DeleteButton.Visible = ivAlways then DeleteButtonClick(Self);
// if Key = VK_INSERT then if AddButton.Visible = ivAlways then AddButtonClick(Self);
 if Key = VK_F2 then if EditButton.Visible = ivAlways then EditButtonClick(Self);
 if Key = VK_F5 then RefreshButtonClick(Self);
 if (Key = VK_F3) or (Key = VK_SPACE) then if ViewButton.Visible = ivAlways then ViewButtonClick(Self);
 if Key = VK_ESCAPE then ExitButtonClick(Self);
 if (Key = Ord('P')) and (ssShift in Shift) and (PrintButton.Visible = ivAlways) then
 begin
   FastPrint := True;
   PrintButtonClick(Self);
   FastPrint := False;
 end;
 if (Key = Ord('P')) and (ssCtrl in Shift) and (PrintButton.Visible = ivAlways) then
 begin
   if ssShift in shift then FastPrint := True;
   PrintButtonClick(Self);
   FastPrint := False;
 end;
 if Key = VK_F8 then if ssShift in Shift then CancelFilterButtonClick(Self) else FilterButtonClick(Self);
 if Key = VK_F9 then dxBarLargeButton1Click(Self);
end;

procedure TplatForm.CancelFilterButtonClick(Sender: TObject);
begin
 fltForm.cxButton2Click(fltForm);
 SelectAll;
end;

procedure TplatForm.ResProc(id: int64; Action: TResAction);
begin
 if (Action <> raView) and (Action <> raClose) then begin
  SelectAll;
  platDataSet.Locate('ID_KEY', id, []);
 end;
end;

procedure TplatForm.dxBarLargeButton2Click(Sender: TObject);
begin
  if platDataSet['DELETED_SYSTEM'] = 3 then
  begin
    ShowMessage('Платiжне доручення вже видалено. Неможливо видалити з реєстру!');
    Exit;
  end;
 if platDataSet.RecordCount = 0 then Exit;
 if VarIsNull(platDataSet['ID_REESTR']) then Exit;
 if MessageDlg('Увага', 'Ви дійсно бажаєте видалити платiжне доручення з реєстру?', mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;
 pFIBStoredProc1.Transaction.StartTransaction;
 pFIBStoredProc1.ExecProcedure('PROC_DOG_DT_PL_DOC_DEL_FROM_REE', [platDataSet['ID_KEY']]);
 pFIBStoredProc1.Transaction.Commit;
 RefreshButtonClick(Self);
end;

procedure TplatForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 ADone := false;
 if AViewInfo.GridRecord.Values[cxGrid1DBTableView1DELETED_SYSTEM.Index] = 3 then begin
  ACanvas.Font.Color := clGray;
  ACanvas.Font.Style := [fsUnderline];
 end;
end;

procedure TplatForm.ShowUserButtonClick(Sender: TObject);
var
 s : string;
 user_name : string;
begin
 if platDataSet.RecordCount = 0 then Exit;
 platReadDataSet.Close;
 platReadDataSet.SelectSQL.Text := 'select full_name from users where id_user = ' + IntToStr(platDataSet['ADD_USER']);
 platReadDataSet.Open;
 user_name := platReadDataSet['FULL_NAME'];
 platReadDataSet.Close;
 s := 'Користувач: ' + user_name + #13 + 'Комп''ютер: ' + ifNull(platDataSet['ADD_COMP'], '') + #13 + 'Додано: ';
 if not VarIsNull(platDataSet.fieldbyName('ADD_TIME').AsVariant) then s := s + DateTimeToStr(platDataSet.fieldbyName('ADD_TIME').AsDateTime);
 agShowMessage(s);
end;

procedure TplatForm.useShortButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TplatForm.EditFile(PathStr:String;SumDogStr:Currency;NumDogStr:String;DateDogStr:TDate);
var
  i,n:integer;
  OutPutStr:String;
  MainStr:String;
  F:TextFile;
  SumDogStrL:String;
  DateDogStrL:String;
  Temp:String;
  New:String;
begin

    SumDogStrL:=FloatToStr(SumDogStr);
    n:=Length(SumDogStrL);
    New :='';
    for i:=1 to n do
    begin
        Temp:=SumDogStrL[i];
        if Temp <> ',' then
        begin
           New:=New+Temp;
        end;
    end;
      SumDogStrL:=New;

    if (14-n > 0 )then
    begin
       for i:=0 to 14-n do
       begin
        SumDogStrL:=SumDogStrL+' ';
       end
    end;

     n:=Length(NumDogStr);
    if (10-n > 0 )then
    begin
       for i:=1 to 10-n do
       begin
        NumDogStr:=NumDogStr+' ';
       end
    end;


    DateDogStrL:=DateToStr(DateDogStr);

    n:=Length(DateDogStrL);
    New :='';
    for i:=1 to n do
    begin
        Temp:=DateDogStrL[i];
        if Temp <> '.' then
        begin
           New:=New+Temp;
        end;
    end;
      DateDogStrL:=New;

    OutPutStr:='';
    AssignFile(F, PathStr);
    Reset(F);
    n:=0;
    while not Eof(F) do
    begin
       Readln(F, MainStr);
      if (Copy(MainStr,412,14)=SumDogStrL) then
      begin
         if (Copy(MainStr,426,10)=NumDogStr) then
         begin
              if not (Copy(MainStr,451,8)=DateDogStrL) then
              begin
                OutPutStr:=OutPutStr+MainStr;
                inc(n);
              end;
         end
         else
         begin
          OutPutStr:=OutPutStr+MainStr;
          inc(n);
         end;
      end
      else
      begin
       OutPutStr:=OutPutStr+MainStr;
       inc(n);
      end;
    end;
    CloseFile(F);

    AssignFile(F ,PathStr);
    Rewrite(F);
    for i:=1 to n do
    begin
    WriteLn(F,Copy(OutPutStr,(i-1)*1278 +1 ,1278));
//      Write(F,OutputStr);
   end;

    CloseFile(F);
end;

procedure TplatForm.cxButton1Click(Sender: TObject);
begin
 agColumnCustomizer1.Customize;
end;

//------------------- Добавлено Татариновым ------------------------------------
function TplatForm.BuilDString(
  InputStr: String;   // Строка которую надо разбить1
  NumSymbols: Integer;// Максимальное количество символов в строках, на которые разбиваем.
  NumOfString:Integer // Количество строк, на сколь разбиваем
  ): string;
  var
    i:Integer;
    Temp:String;
    Temp_1:String;
begin
  if InputStr = '' then exit;
  if not CheckStringEnd(InputStr,NumSymbols) then
  begin
     for i:=NumSymbols-1 downto 1 do
     begin
       if CheckStringEnd(InputStr,i) then
       begin
          if NumOfString >6 then exit ;

          Temp:=copy(InputStr,1 , i);
          if NumOfString<6 then Temp:=Temp+#13#10;
          Temp_1:=copy(InputStr,i+1, Length(InputStr)-1);
          BuilDString:=Temp+BuilDString(Temp_1,NumSymbols,NumOfString+1);
       end;
     end;
  end;
   if NumOfString >6 then exit ;

  Temp:=copy(InputStr,1 , NumSymbols);
   if NumOfString<6 then Temp:=Temp+#13#10;
  Temp_1:=copy(InputStr,NumSymbols+1, Length(InputStr)-1);
  BuilDString:=Temp+BuilDString(Temp_1,NumSymbols,NumOfString+1);
end;



function TplatForm.CheckStringEnd(InputStr: String;
  NumSymbols: Integer): Boolean;
  var
    i:Integer;
begin
   CheckStringEnd:= false;
   for i:= 1 to Length(SymbolArray)-1 do
   begin
     if NumSymbols<= Length(InputStr) then
     begin
      if InputStr[NumSymbols]=SymbolArray[i]then
      begin
        CheckStringEnd:=true;
        exit;
      end

     end;
   end;
end;

function TplatForm.FitStr(str: string; sym_count: integer; sym_trans: string): string;
var
 s : string;
 i, j : integer;
 finded : boolean;
begin
 Result := '';
 str := StringReplace(str, #13, '', [rfReplaceAll]);
 str := StringReplace(str, #10, '', [rfReplaceAll]);
 while str <> '' do
 begin
   s := Copy(str, 1, sym_count);
   if Copy(str, sym_count, Length(str) - sym_count) = '' then
   begin
     Result := Result + s;
     exit;
   end;
   finded := false;
   for i := Length(s) downto 1 do
   begin
     for j := 1 to Length(sym_trans) do
     begin
       if s[i] = sym_trans[j] then
       begin
         Result := Result + Copy(s, 1, i) + #13 + #10;
         str := Copy(str, i + 1, Length(str) - i);
         finded := true;
         break;
       end;
     end;
     if finded then break;
   end;
   if not finded then
   begin
     Result := Result + s + #13 + #10;
     str := Copy(str, sym_count, Length(str) - sym_count);
   end;
 end;
end;

// Печать ведомости
procedure TplatForm.dxBarLargeButton4Click(Sender: TObject);
var
 useShort : integer;
 str:string;
 str2:string;
 i:Integer;
 cnt:Integer;
 reg_var:string;
begin
 if platDataSet.RecordCount = 0 then exit;
 dsPeople.Close;
 //dsPeople.ClearFields();
 //dsPeople.Prepare;
 dsPeople.ParamByName('ID_KEY').AsInt64 := TFIBBCDField(platDataSet.FieldByName('ID_KEY')).AsInt64;
 dsPeople.SelectSQL.Text := 'SELECT * FROM DOG_DT_PL_DOC_REP_PEOPLE(:ID_KEY)';
 dsPeople.Open;
 //ShowMessage(CurrToStr(dsPeople['OUT_MONTH']));


 platReadDataSet.Close;
 platReadDataSet.SelectSQL.Text := 'select PL_SHAPKA, PL_VISA_SCHABLON from DOG_PL_SHAPKA_SEL';
 platReadDataSet.Open;

 str:= platReadDataSet.FieldValues['PL_SHAPKA'];
 str2:=platReadDataSet.FieldValues['PL_VISA_SCHABLON'];

 platReadDataSet.Close;
 platReadDataSet.SelectSQL.Text := 'select * from PROC_REP_PLAT_INFO(' + IntToStr(TFIBBCDField(platDataSet.FieldByName('ID_KEY')).AsInt64) + ', ' + IfThen(cbUseShort.Checked, '1', '0') + ')';
 platReadDataSet.Open;
 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка номера ведомости в заголовок
 reg_var := '%%PRINT_NUM_DOC%%';
 for i := 0 to Length(str) do
 begin
  while Pos(reg_var, str) > 0 do
  begin
    cnt := Pos(reg_var, str);
    Delete(str, cnt, Length(reg_var));
    Insert(platReadDataSet.FieldValues['NUM_DOC'], str, cnt);
  end;
 end;
 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка даты ведомости в заголовок
 reg_var := '%%PRINT_DATE_DOC%%';
 for i := 0 to Length(str) do
 begin
  while Pos(reg_var, str) > 0 do
  begin
    cnt := Pos(reg_var, str);
    Delete(str, cnt, Length(reg_var));
    Insert(platReadDataSet.FieldValues['EXPORT_DAY'], str, cnt);
  end;
 end;
 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка месяца и года ведомости в заголовок
 reg_var := '%%PRINT_MONTH_DOC%%';
 for i := 0 to Length(str) do
 begin
  while Pos(reg_var, str) > 0 do
  begin
    cnt := Pos(reg_var, str);
    Delete(str, cnt, Length(reg_var));
    Insert(platReadDataSet.FieldValues['MONTH_STR'], str, cnt);
  end;
 end;
 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка бюджета, с которого производится оплата
 reg_var := '%%PRINT_BGT%%';
 for i := 0 to Length(str) do
 begin
  while Pos(reg_var, str) > 0 do
  begin
    cnt := Pos(reg_var, str);
    Delete(str, cnt, Length(reg_var));
    Insert('тутбудетбюджет', str, cnt);
  end;
 end;
 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка наименования организации
 reg_var := '%%PRINT_ORGANIZTION%%';
 for i := 0 to Length(str) do
 begin
  while Pos(reg_var, str) > 0 do
  begin
    cnt := Pos(reg_var, str);
    Delete(str, cnt, Length(reg_var));
    Insert(platReadDataSet.FieldValues['CUST1'], str, cnt);
  end;
 end;

 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка Керивника организации
 reg_var := '%%KER_ORGANIZTION%%';
 for i := 0 to Length(str2) do
 begin
  while Pos(reg_var, str2) > 0 do
  begin
    cnt := Pos(reg_var, str2);
    Delete(str2, cnt, Length(reg_var));
    Insert(platReadDataSet.FieldValues['KER'], str2, cnt);
  end;
 end;

 // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 // Вставка главного бухгалтера организации
 reg_var := '%%GL_BUHG_ORGANIZTION%%';
 for i := 0 to Length(str2) do
 begin
  while Pos(reg_var, str2) > 0 do
  begin
    cnt := Pos(reg_var, str2);
    Delete(str2, cnt, Length(reg_var));
    Insert(platReadDataSet.FieldValues['GL_BUHG'], str2, cnt);
  end;
 end;


 TfrxMemoView(frxReportPeople.FindObject('Memo14')).Text:= str;
 TfrxMemoView(frxReportPeople.FindObject('Memo16')).Text:= str2;

 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  frxReportPeople.DesignReport()
 else frxReportPeople.ShowReport();
 //frxReportPeople.ShowReport();
// frxReportPeople.DesignReport();
 dsPeople.Close;
end;

procedure TplatForm.frxReportPeopleGetValue(const VarName: String;
  var Value: Variant);
var
 str : string;
begin
 if VarName = 'SUM_PROPIS' then
 begin
   str := zproc.SumToString(platDataSet['SUMMA']);
   str[1] := AnsiUpperCase(str[1])[1];
   Value := str;
 end;
end;

procedure TplatForm.dxBarLargeButton5Click(Sender: TObject);
var
 id_bank : int64;
begin
 if platDataSet.RecordCount = 0 then exit;


{ pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select b.id_bank ' +
                        'from dog_dt_pl_doc p ' +
                        'left join pub_sp_cust_rate_acc a on (p.id_rate_account_native = a.id_rate_account) ' +
                        'left join pub_sp_bank b on (a.id_bank = b.id_bank) ' +
                        'where p.id_key = :id_key ';
 pFIBQuery1.Prepare;
 pFIBQuery1.ParamByName('ID_KEY').AsInt64 := TFIBBCDField(platDataSet.FieldByName('ID_KEY')).AsInt64;
 pFIBQuery1.ExecQuery;
 id_bank := pFIBQuery1.FldByName['ID_BANK'].AsInt64;
 pFIBQuery1.Close;    }


 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select b.id_bank ' +
                        'from dog_dt_pl_doc p ' +
                        'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_rate_account) ' +
                        'left join pub_sp_bank b on (a.id_bank = b.id_bank) ' +
                        'where p.id_key = :id_key ';
 pFIBQuery1.Prepare;
 pFIBQuery1.ParamByName('ID_KEY').AsInt64 := TFIBBCDField(platDataSet.FieldByName('ID_KEY')).AsInt64;
 pFIBQuery1.ExecQuery;
 id_bank := pFIBQuery1.FldByName['ID_BANK'].AsInt64;
 pFIBQuery1.Close;


 dsPeople.Close;
 dsPeople.Prepare;
 dsPeople.ParamByName('ID_KEY').AsInt64 := TFIBBCDField(platDataSet.FieldByName('ID_KEY')).AsInt64;
 dsPeople.Tag:=1;
 dsPeople.Open;
 ExportBankDataSet(Self, dsPeople, id_bank);
 dsPeople.Close;
end;

// Вызов процедуры редактирования шаблона шапки
procedure TplatForm.EditShapkaClick(Sender: TObject);
var
  EditForm:TShapkaEditForm;
begin
 // Вызываю основную форму редактирования
 EditForm:=TShapkaEditForm.Create(self);
 pFIBQuery3.Transaction.StartTransaction;
 pFIBQuery3.SQL.Clear;
 pFIBQuery3.SQL.Add('select PL_SHAPKA from DOG_PL_SHAPKA_SEL');
 pFIBQuery3.ExecQuery;
 EditForm.cxMemo1.Text:=pFIBQuery3.FldByName['PL_SHAPKA'].AsString;
 pFIBQuery3.Transaction.Commit;
 if (EditForm.ShowModal <> mrOk) then exit;
 // Подтверждаю изменения
 pFIBQuery3.Transaction.StartTransaction;
 pFIBQuery3.SQL.Clear;
 pFIBQuery3.SQL.Add('update DOG_SYS_OPTIONS set PL_SHAPKA='''+EditForm.cxMemo1.Text+'''');
 pFIBQuery3.ExecQuery;
 pFIBQuery3.Transaction.Commit;

end;
// Вызов процедуры редактирования подписи шапки
procedure TplatForm.dxBarButton2Click(Sender: TObject);
var
  EditForm:TShapkaEditForm;
begin
 // Вызываю основную форму редактирования
 EditForm:=TShapkaEditForm.Create(self);
 pFIBQuery3.Transaction.StartTransaction;
 pFIBQuery3.SQL.Clear;
 pFIBQuery3.SQL.Add('select PL_VISA_SCHABLON from DOG_PL_SHAPKA_SEL');
 pFIBQuery3.ExecQuery;
 EditForm.cxMemo1.Text:=pFIBQuery3.FldByName['PL_VISA_SCHABLON'].AsString;
 pFIBQuery3.Transaction.Commit;
 if (EditForm.ShowModal <> mrOk) then exit;
 // Подтверждаю изменения
 pFIBQuery3.Transaction.StartTransaction;
 pFIBQuery3.SQL.Clear;
 pFIBQuery3.SQL.Add('update DOG_SYS_OPTIONS set PL_VISA_SCHABLON='''+EditForm.cxMemo1.Text+'''');
 pFIBQuery3.ExecQuery;
 pFIBQuery3.Transaction.Commit;
end;

procedure TplatForm.cxDBTextEdit9KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
end;

procedure TplatForm.cxGrid1DBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
 var i:Integer;
    summ:Extended;
begin
   // подсчет суммы выделенных записей
   summ :=0;
   if cxGrid1DBTableView1.Controller.SelectedRowCount>0 then
   for i:=0 to  cxGrid1DBTableView1.Controller.SelectedRowCount-1 do
   begin
     summ :=summ + Sender.Controller.SelectedRecords[i].Values[19];
   end;
   EditSummSelect.Value:=summ;
end;

end.




