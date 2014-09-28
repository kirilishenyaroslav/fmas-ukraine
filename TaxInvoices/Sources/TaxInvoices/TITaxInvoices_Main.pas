unit TITaxInvoices_Main;

interface

uses
  Windows, cxContainer,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, dxBar, cxGridBandedTableView,
  cxGridDBBandedTableView,ibase, ExtCtrls,TiCommonStyles, cxTextEdit,
  dxBarExtItems, Menus,TiCommonProc, cxTL, cxLabel,TICommonDates,
  TITaxInvoices_Filter,TITaxInvoicesDM,TITaxinvoices_AddReestr, cxSplitter,
  cxGroupBox, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  TITaxInvoices_AddVidNakl,
  TITaxInvoices_AddOtrNakl,
  TICommonLoader,
  TITaxInvoices_SignDocHist,
  TITaxInvoices_SetPrint,
  cxCheckBox,
  TiCommonTypes,
  TiMessages,
  ImgList,
  cxCurrencyEdit,
  StdCtrls,
  TITaxInvoices_ExportReestr,
  TITaxInvoices_ImportReestr,
  AccMGMT,LoadDogManedger,
  TITaxInvoices_UpdVidNaklImport,Kernel,
  TITaxInvoices_ExportNakl,
  TI_TaxInvoicesParamEducation,
  UPCPackMan;


type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;

type
  TTaxInvoicesMainForm = class(TForm)
    TaxInvoicesBarManager: TdxBarManager;
    InsertReestrBtn: TdxBarLargeButton;
    UpdateReestrBtn: TdxBarLargeButton;
    DeleteReestrBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    Panel4: TPanel;
    ReestrGrid: TcxGrid;
    ReestrGridDBTableView: TcxGridDBTableView;
    ReestrGridDBTableViewDB_NUM_REESTR: TcxGridDBColumn;
    ReestrGridLevel: TcxGridLevel;
    ReestrGridDBTableViewDB_PERIOD: TcxGridDBColumn;
    IsSignatureReestrButton: TdxBarLargeButton;
    ReestrInsPopupMenu: TdxBarPopupMenu;
    NotSignatureReestrButton: TdxBarLargeButton;
    ReestrSplitter: TcxSplitter;
    SignatureGroupBox: TcxGroupBox;
    NameSignatureLabel: TcxLabel;
    DataSignatureLabel: TcxLabel;
    Panel1: TPanel;
    NaklPageControl: TPageControl;
    VidNaklTabSheet: TTabSheet;
    VidNaklGrid: TcxGrid;
    VidNaklGridDBTableView: TcxGridDBTableView;
    cxGridVidNaklDBTable_num_order: TcxGridDBColumn;
    cxGridVidNaklDBTable_is_korig: TcxGridDBColumn;
    cxGridVidNaklDBTable_data_vipiski: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_Is_Signature: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_Num_Nakl: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_name_type_document: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_name_customer: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_is_expansion: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_ipn_customer: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_summa_all_pdv: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_summa_taxable_20: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_summa_pdv_20: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_summa_taxable_0: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_summa_exempt: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_summa_export: TcxGridDBColumn;
    VidNaklGridLevel: TcxGridLevel;
    OtrNaklTabSheet: TTabSheet;
    Panel2: TPanel;
    OtrNaklGrid: TcxGrid;
    OtrNaklGridDBTableView: TcxGridDBTableView;
    OtrNaklGridDBTableViewDB_num_order: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_is_korig: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_Data_Otr: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_Data_vipiski: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_Num_Nakl: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_name_type_document: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_name_provider: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_is_expansion: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_ipn_provider: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_all_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_20_0_not_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_20_0_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_exempt_not_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_exempt_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_econ_activ_not_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_econ_activ_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_delivery_not_pdv: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_summa_delivery_pdv: TcxGridDBColumn;
    OtrNaklGridLevel: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    InsInReestrButton: TdxBarButton;
    UpdInReestrButton: TdxBarButton;
    DelInReestrButton: TdxBarButton;
    IsNaklSignatureButton: TdxBarButton;
    NotNaklSignatureButton: TdxBarButton;
    NumOrderButton: TdxBarButton;
    SignatureReestrHistButton: TdxBarLargeButton;
    SignatureNaklHistButton: TdxBarButton;
    SignatureNaklGroupBox: TcxGroupBox;
    NameSignatureNaklLabel: TcxLabel;
    DataSignatureNaklLabel: TcxLabel;
    SignatureNaklDBTextEdit: TcxDBTextEdit;
    AddSeriesBarButton: TdxBarButton;
    AddDocumentBarButton: TdxBarButton;
    VidNaklGridDBTableViewDB_is_document: TcxGridDBColumn;
    ReestrUpdPopupMenu: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    TypeReestrGroupBox: TcxGroupBox;
    TypeReestrDBTextEdit: TcxDBTextEdit;
    ImageList: TImageList;
    Styles: TcxStyleRepository;
    cxStyle31: TcxStyle;
    StyleOutPut: TcxStyle;
    StyleHoliday: TcxStyle;
    StyleSimple: TcxStyle;
    StyleSimple1: TcxStyle;
    cxStyleTshAbsHeader: TcxStyle;
    StyleBold: TcxStyle;
    StyleFio: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    cxStyle2: TcxStyle;
    cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet;
    cxStyle1: TcxStyle;
    IsSignLabel: TcxLabel;
    NotSignLabel: TcxLabel;
    Image1: TImage;
    Image2: TImage;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Panel3: TPanel;
    ReestrLabel: TLabel;
    ReestrComboBox: TcxComboBox;
    ExportButton: TdxBarLargeButton;
    ExportBarPopupMenu: TdxBarPopupMenu;
    VidNaklExportBarButton: TdxBarButton;
    OtrNaklExportBarButton: TdxBarButton;
    ReestrGridDBTableViewDB_IS_SIGN: TcxGridDBColumn;
    SignatureReestrDBDateEdit: TcxDBTextEdit;
    SignatureReestrDBTextEdit: TcxDBTextEdit;
    KolvoVidLabel: TLabel;
    KolvoVidValueLabel: TLabel;
    KolvoOtrLabel: TLabel;
    KolvoOtrValeuLabel: TLabel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    UserCreateDBTextEdit: TcxDBTextEdit;
    dateTimeCreateDBTextEdit: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    UserCreateOtrDBTextEdit: TcxDBTextEdit;
    DataCreateOtrDBTextEdit: TcxDBTextEdit;
    SignatureDataDBTextEdit: TcxDBTextEdit;
    PrintBarPopupMenu: TdxBarPopupMenu;
    OldPrintBarButton: TdxBarButton;
    NewPrint1BarButton: TdxBarButton;
    NewPrint2Button: TdxBarButton;
    dxBarButton3: TdxBarButton;
    ImportBarLargeButton: TdxBarLargeButton;
    ImportBarPopupMenu: TdxBarPopupMenu;
    DBFBarButton: TdxBarButton;
    XMLBarButton: TdxBarButton;
    ImportSystemLargeButton: TdxBarLargeButton;
    ImportSystemBarPopupMenu: TdxBarPopupMenu;
    OrendaBarLargeButton: TdxBarLargeButton;
    VidNaklGridDBTableViewDB_Is_Import: TcxGridDBColumn;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    VidNaklGridDBTableViewDB_name_system: TcxGridDBColumn;
    PrintReestrBarButton: TdxBarButton;
    DBFBarPopupMenu: TdxBarPopupMenu;
    VidNaklImportBarButton: TdxBarButton;
    OtrNaklImportBarButton: TdxBarButton;
    BankLargeButton: TdxBarLargeButton;
    FilterBarPopupMenu: TdxBarPopupMenu;
    ContragentFilterButton: TdxBarLargeButton;
    FilterSubdivisionButton: TdxBarLargeButton;
    FilterBudgetButton: TdxBarLargeButton;
    OtrNaklGridDBTableViewDB_is_import: TcxGridDBColumn;
    IsEditButton: TdxBarButton;
    OtrNaklGridDBTableViewDB_is_edit: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_is_edit: TcxGridDBColumn;
    KorigButton: TdxBarButton;
    PrintKorigButton: TdxBarButton;
    PrintReestrOtrButton: TdxBarButton;
    OtrNaklGridDBTableViewDB_name_subdivision: TcxGridDBColumn;
    dxBarButton4: TdxBarButton;
    VidNaklGridDBTableViewDB_NUM_SPECIALNOTES: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_OZNAKA_NAKL: TcxGridDBColumn;
    VidNaklGridDBTableViewDB_SUMMA_DELIVERY: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_oznaka1: TcxGridDBColumn;
    OtrNaklGridDBTableViewDB_oznaka2: TcxGridDBColumn;
    ExportnaklXmlButton5: TdxBarButton;
    PrintKorigTwoEkzButton: TdxBarButton;
    ViewButton: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure InsertReestrBtnClick(Sender: TObject);
    procedure ReestrSplitterAfterClose(Sender: TObject);
    procedure ReestrSplitterAfterOpen(Sender: TObject);
    procedure UpdateReestrBtnClick(Sender: TObject);
    procedure DeleteReestrBtnClick(Sender: TObject);
    procedure ReestrGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure RefreshBtnClick(Sender: TObject);
    procedure InsInReestrButtonClick(Sender: TObject);
    procedure IsSignatureReestrButtonClick(Sender: TObject);
    procedure NotSignatureReestrButtonClick(Sender: TObject);
    procedure SignatureReestrHistButtonClick(Sender: TObject);
    procedure UpdInReestrButtonClick(Sender: TObject);
    procedure DelInReestrButtonClick(Sender: TObject);
    procedure VidNaklGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure IsNaklSignatureButtonClick(Sender: TObject);
    procedure NotNaklSignatureButtonClick(Sender: TObject);
    procedure SignatureNaklHistButtonClick(Sender: TObject);
    procedure NumOrderButtonClick(Sender: TObject);
    procedure AddSeriesBarButtonClick(Sender: TObject);
    procedure AddDocumentBarButtonClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure VidNaklGridDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure VidNaklGridDBTableViewDB_is_documentCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure NaklPageControlChange(Sender: TObject);
    procedure VidNaklExportBarButtonClick(Sender: TObject);
    procedure OtrNaklExportBarButtonClick(Sender: TObject);
    procedure ReestrGridDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure PrintBtnClick(Sender: TObject);
    procedure OldPrintBarButtonClick(Sender: TObject);
    procedure NewPrint1BarButtonClick(Sender: TObject);
    procedure NewPrint2ButtonClick(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure XMLBarButtonClick(Sender: TObject);
    procedure OrendaBarLargeButtonClick(Sender: TObject);
    procedure PrintReestrBarButtonClick(Sender: TObject);
    procedure VidNaklImportBarButtonClick(Sender: TObject);
    procedure OtrNaklImportBarButtonClick(Sender: TObject);
    procedure BankLargeButtonClick(Sender: TObject);
    procedure ContragentFilterButtonClick(Sender: TObject);
    procedure FilterSubdivisionButtonClick(Sender: TObject);
    procedure FilterBudgetButtonClick(Sender: TObject);
    procedure VidNaklGridDBTableViewDblClick(Sender: TObject);
    procedure OtrNaklGridDBTableViewDblClick(Sender: TObject);
    procedure OtrNaklGridDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure IsEditButtonClick(Sender: TObject);
    procedure KorigButtonClick(Sender: TObject);
    procedure PrintKorigButtonClick(Sender: TObject);
    procedure PrintReestrOtrButtonClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure ExportnaklXmlButton5Click(Sender: TObject);
    procedure PrintKorigTwoEkzButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    PRes               : Variant;
    pLanguageIndex     : Byte;
    pStylesDM          : TStyleDM;
    PDb_Handle         : TISC_DB_HANDLE;
    PTaxInvocesFilter  : TaxInvocesFilter;
    TaxInvoicesUser    : TTaxInvocesUser;
    ReestrParam        : TReestrParam;
  public
    is_admin :Integer;// 1 - admin
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TaxInvoicesMainForm: TTaxInvoicesMainForm;

implementation

uses FIBDataSet;

{$R *.dfm}
constructor TTaxInvoicesMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var
  kod_setup:Integer;
begin
  inherited Create(AOwner);
  PDb_Handle                := Db_Handle;
  Kod_Setup                 := CurrentKodSetup(PDb_Handle);
  TaxInvoicesDM             := TTaxInvoicesDM.Create(AOwner,Db_Handle);
  TaxInvoicesDM.UserDSet.Close;
  TaxInvoicesDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  TaxInvoicesDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := TaxInvoicesDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := TaxInvoicesDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := TaxInvoicesDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := TaxInvoicesDM.UserDSet['IP_ADRESS'];
//******************************************************************************
  pLanguageIndex             := LanguageIndex;
  NaklPageControl.ActivePage := VidNaklTabSheet;
  Caption                    := GetConst('TaxInvoices',tcForm);
  pStylesDM                  := TStyleDM.Create(Self);
  ExitBtn.Caption            := GetConst('Exit',tcButton);
  VidNaklTabSheet.Caption    := GetConst('VidNakl',tcTabSheet);
  OtrNaklTabSheet.Caption    := GetConst('OtrNakl',tcTabSheet);
  VidNaklGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;

//******************************************************************************
  PTaxInvocesFilter.is_period := true;
  PTaxInvocesFilter.is_type   := true;
  PTaxInvocesFilter.Kod_Setup := Kod_Setup;
//******************************************************************************
  RefreshBtn.Click;
  VidNaklGridDBTableView.DataController.DataSource := TaxInvoicesDM.VidNaklDSource;
  OtrNaklGridDBTableView.DataController.DataSource := TaxInvoicesDM.OtrNaklDSource;
  ReestrGridDBTableView.DataController.DataSource  := TaxInvoicesDM.ReestrDSource;
//******************************************************************************
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_IS_ADMIN';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('id_user').Value := TaxInvoicesUser.id_user;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  is_admin := TaxInvoicesDM.pFIBStoredProc.ParamByName('out').Value;
//******************************************************************************
  TaxInvoicesDM.DSet.Close;
  TaxInvoicesDM.DSet.SelectSQL.Text := 'select * from TI_SETTING';
  TaxInvoicesDM.DSet.Open;

  if (TaxInvoicesDM.DSet['IS_ONOVITI_NUM_OTR_NAKL'] = 1) then
    NumOrderButton.Visible := ivAlways
  else
    NumOrderButton.Visible := ivNever;
end;




procedure TTaxInvoicesMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    action:=caFree
  else
    TaxInvoicesDM.Free;
end;

procedure TTaxInvoicesMainForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxInvoicesMainForm.FilterBtnClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesFilterForm;
begin
  {ViewForm := TTaxInvoicesFilterForm.Create(Self,TaxInvoicesDM.DB.Handle,PTaxInvocesFilter);
  ViewForm.ShowModal;  }
end;

procedure TTaxInvoicesMainForm.InsertReestrBtnClick(Sender: TObject);
var
  ViewForm   : TTaxInvoicesAddReestrForm;
  id_reestr  : Integer;
  kod_setup  : Integer;
  last_num_reestr : Integer;
begin
  if (is_admin = 0) then
  begin
    If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','Add') <> 0) then
    begin
      TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
      Exit;
    end;
  end;

  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_LAST_NOMER_REESTR_SEARCH';//ищем последний номер реестра
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  last_num_reestr := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NOMER_REESTR').AsInteger;

  ViewForm := TTaxInvoicesAddReestrForm.Create(Self,TaxInvoicesDM.DB.Handle);
  ViewForm.MonthList.Items.Text := GetMonthList;
  ViewForm.Kod_Setup                := CurrentKodSetup(PDb_Handle);
  ViewForm.YearSpinEdit.Value       := YearMonthFromKodSetup(ViewForm.Kod_Setup);
  ViewForm.MonthList.ItemIndex      := YearMonthFromKodSetup(ViewForm.Kod_Setup-1,False);
  ViewForm.NumReestrTextEdit.Text   := IntToStr(last_num_reestr);
  ViewForm.Caption                  := GetConst('ReestrAdd',tcForm);
  ViewForm.ReadReg;
  ViewForm.SaveTextEdit.Text        := '';
  ViewForm.SpecModeTextEdit.Text    := '';
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'Z_CONVERT_KOD_TO_PERIOD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('kod_setup').Value := ViewForm.kod_setup;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  ViewForm.DateBegEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
  ViewForm.DateEndEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_END').AsDate;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_REESTR_INVOICES_INS';
      kod_setup := PeriodToKodSetup(ViewForm.YearSpinEdit.Value,ViewForm.MonthList.ItemIndex+1);
      TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP').Value        := kod_setup;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_REESTR').Value   := ViewForm.id_type_Reestr;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_REESTR').Value := ViewForm.TypeReestrButtonEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_REESTR').Value       := ViewForm.NumReestrTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('DATABEG_REESTR').Value   := ViewForm.DateBegEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('DATAEND_REESTR').Value   := ViewForm.DateEndEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('SAVE').Value             := ViewForm.SaveTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('SPECMODE').Value         := ViewForm.SpecModeTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('is_signature').Value     :=0;
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;
      id_reestr := TaxInvoicesDM.pFIBStoredProc.ParamByName('id_reestr_').AsInteger;
      RefreshBtn.Click;
      TaxInvoicesDM.ReestrDSet.Locate('id_reestr',IntToStr(id_reestr),[]);
    end;
end;

procedure TTaxInvoicesMainForm.ReestrSplitterAfterClose(Sender: TObject);
begin
 Panel4.Visible          := false;
{ InsertReestrBtn.Enabled := False;
 UpdateReestrBtn.Enabled := False;
 DeleteReestrBtn.Enabled := False;  }
end;

procedure TTaxInvoicesMainForm.ReestrSplitterAfterOpen(Sender: TObject);
begin
 Panel4.Visible          := true;
{ InsertReestrBtn.Enabled := true;
 UpdateReestrBtn.Enabled := true;
 DeleteReestrBtn.Enabled := true; }
end;

procedure TTaxInvoicesMainForm.UpdateReestrBtnClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesAddReestrForm;
  id_reestr:Integer;
  id_type_reestr:Integer;
  kod_setup_upd:Integer;
begin
  id_type_reestr := TaxInvoicesDM.ReestrDSet['id_type_reestr'];
  id_reestr      := TaxInvoicesDM.ReestrDSet['id_reestr'];
  ViewForm := TTaxInvoicesAddReestrForm.Create(Self,TaxInvoicesDM.DB.Handle);
  //ViewForm.MonthList.Properties.Items.Text := GetMonthList;
  ViewForm.MonthList.Items.Text := GetMonthList;
  ViewForm.Kod_Setup                := TaxInvoicesDM.ReestrDSet['kod_setup'];
  ViewForm.YearSpinEdit.Value       := YearMonthFromKodSetup(ViewForm.Kod_Setup);
  ViewForm.MonthList.ItemIndex      := YearMonthFromKodSetup(ViewForm.Kod_Setup-1,False);
  ViewForm.NumReestrTextEdit.Text   := TaxInvoicesDM.ReestrDSet['num_reestr'];
  ViewForm.Caption                  := GetConst('ReestrUpd',tcForm);
  ViewForm.TypeReestrButtonEdit.Text:= TaxInvoicesDM.ReestrDSet['name_type_reestr'];
  ViewForm.SaveTextEdit.Text        := TaxInvoicesDM.ReestrDSet['save'];
  ViewForm.SpecModeTextEdit.Text    := TaxInvoicesDM.ReestrDSet['specmode'];
  ViewForm.DateBegEdit.Date         := TaxInvoicesDM.ReestrDSet['databeg_reestr'];
  ViewForm.DateEndEdit.Date         := TaxInvoicesDM.ReestrDSet['dataend_reestr'];
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      if (not (ViewForm.id_type_Reestr=null)) then id_type_reestr := ViewForm.id_type_Reestr;
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_REESTR_INVOICES_UPD';
      kod_setup_upd := PeriodToKodSetup(ViewForm.YearSpinEdit.Value,ViewForm.MonthList.ItemIndex+1);
      TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP').AsInteger    := kod_setup_upd;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_REESTR').Value   := id_type_reestr;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_REESTR').Value := ViewForm.TypeReestrButtonEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_REESTR').Value       := ViewForm.NumReestrTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('DATABEG_REESTR').Value   := ViewForm.DateBegEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('DATAEND_REESTR').Value   := ViewForm.DateEndEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('SAVE').Value             := ViewForm.SaveTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('SPECMODE').Value         := ViewForm.SpecModeTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_reestr').Value        := TaxInvoicesDM.ReestrDSet['id_reestr'];
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;
      RefreshBtn.Click;
      //TaxInvoicesDM.ReestrDSet.Close;
      //TaxInvoicesDM.ReestrDSet.Open;
      TaxInvoicesDM.ReestrDSet.Locate('id_reestr',IntToStr(id_reestr),[]);
    end;
end;


procedure TTaxInvoicesMainForm.DeleteReestrBtnClick(Sender: TObject);
begin
  if (TaxInvoicesDM.VidNaklDSet.IsEmpty = True) then
  begin
   if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   begin
    try
     TaxInvoicesDM.WriteTransaction.StartTransaction;
     TaxInvoicesDM.pFIBStoredProc.StoredProcName:='TI_REESTR_INVOICES_DEL_PROVERKA';
     TaxInvoicesDM.pFIBStoredProc.ParamByName('id_reestr').Value:=TaxInvoicesDM.ReestrDSet['id_reestr'];
     TaxInvoicesDM.pFIBStoredProc.ExecProc;

     if (TaxInvoicesDM.pFIBStoredProc.ParamByName('out').Value = 0) then
     begin
       TaxInvoicesDM.pFIBStoredProc.StoredProcName:='TI_REESTR_INVOICES_DEL';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('id_reestr').Value:=TaxInvoicesDM.ReestrDSet['id_reestr'];
       TaxInvoicesDM.pFIBStoredProc.ExecProc;
       TaxInvoicesDM.WriteTransaction.Commit;
       RefreshBtn.Click;
     end
     else
     begin
       MessageDlg('не можна видалити цей запис! У реєстрі є підписані накладні!', mtError, [mbOK], 0);
       TaxInvoicesDM.WriteTransaction.Rollback;
     end;
    except on E:Exception do
     begin
      MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
      TaxInvoicesDM.WriteTransaction.Rollback;
     end;
    end;
   end;
  end
  else
  begin
    TiShowMessage('Увага!','Увага! Спочкатку треба видалити всі накладні з реєстру!',mtError,[mbOK]);
    Exit;
  end;

end;

procedure TTaxInvoicesMainForm.ReestrGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (TaxInvoicesDM.ReestrDSet['is_signature']=1) then
    begin
     UpdateReestrBtn.Enabled           := False;
     DeleteReestrBtn.Enabled           := False;
     InsInReestrButton.Enabled         := False;
     UpdInReestrButton.Enabled         := False;
     DelInReestrButton.Enabled         := False;
     IsNaklSignatureButton.Enabled     := False;
     NotNaklSignatureButton.Enabled    := False;
     NumOrderButton.Enabled            := False;
     IsSignatureReestrButton.Enabled   := False;
     IsSignatureReestrButton.Enabled   := False;
     DataSignatureLabel.Visible        := True;
     SignatureReestrDBDateEdit.Visible := True;
     SignatureReestrDBTextEdit.Visible := True;
     NameSignatureLabel.Caption        := 'ким';
     NotSignatureReestrButton.Enabled  := True;
     ExportButton.Enabled := True;
    end
  else
    begin
     UpdateReestrBtn.Enabled           := True;
     DeleteReestrBtn.Enabled           := True;
     InsInReestrButton.Enabled         := True;
     UpdInReestrButton.Enabled         := True;
     DelInReestrButton.Enabled         := True;
     IsNaklSignatureButton.Enabled     := True;
     NotNaklSignatureButton.Enabled    := True;
     NumOrderButton.Enabled            := True;
     NotSignatureReestrButton.Enabled  := False;
     DataSignatureLabel.Visible        := False;
     SignatureReestrDBDateEdit.Visible := False;
     SignatureReestrDBTextEdit.Visible := False;
     //SignatureReestrDateEdit.Visible := False;
     //SignatureReestrTextEdit.Visible := False;
     NameSignatureLabel.Caption        := 'реєстр не підписано';
     IsSignatureReestrButton.Enabled   := True;
     ExportButton.Enabled := False;
    end;

  if IsSignatureReestrButton.Enabled=True then
  begin
    if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
    begin
      if (TaxInvoicesDM.VidNaklDSet['is_signature']=1) then
       begin
        UpdInReestrButton.Enabled         := False;
        NumOrderButton.Enabled            := False;
        DelInReestrButton.Enabled         := False;
        IsNaklSignatureButton.Enabled     := False;
        NotNaklSignatureButton.Enabled    := True;

        DataSignatureNaklLabel.Visible    := True;
        SignatureNaklDBTextEdit.Visible   := True;
        SignatureDataDBTextEdit.Visible   := True;
        NameSignatureNaklLabel.Caption    := 'ким';
       end
      else
       begin
         UpdInReestrButton.Enabled         := True;
         NumOrderButton.Enabled            := True;
         DelInReestrButton.Enabled         := True;
         IsNaklSignatureButton.Enabled     := True;
         NotNaklSignatureButton.Enabled    := False;

         DataSignatureNaklLabel.Visible    := False;
         SignatureDataDBTextEdit.Visible   := False;
         SignatureNaklDBTextEdit.Visible   := False;
         NameSignatureNaklLabel.Caption    := 'видана накладна не підписана';
       end;
    end;
  end
  else
  begin
    InsInReestrButton.Enabled         := False;
    UpdInReestrButton.Enabled         := False;
    DelInReestrButton.Enabled         := False;
    IsNaklSignatureButton.Enabled     := False;
    NotNaklSignatureButton.Enabled    := False;
    NumOrderButton.Enabled            := False;
  end;
  KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
  KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
end;

procedure TTaxInvoicesMainForm.RefreshBtnClick(Sender: TObject);
begin
  TaxInvoicesDM.ReestrDSet.Close;
  TaxInvoicesDM.SignatureReestrDSet.Close;
  TaxInvoicesDM.VidNaklDSet.Close;
  TaxInvoicesDM.SignatureNaklDSet.Close;
  TaxInvoicesDM.OtrNaklDSet.Close;
  TaxInvoicesDM.ReestrDSet.SelectSQL.Text          := 'select * from ti_reestr_invoices_sel';
  TaxInvoicesDM.SignatureReestrDSet.SelectSQL.Text := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(?ID_REESTR)';
  TaxInvoicesDM.VidNaklDSet.SelectSQL.Text         := 'select * from TI_SP_VID_NAKL_SEL where ID_REESTR=:ID_REESTR ORDER BY num_order';
  TaxInvoicesDM.SignatureNaklDSet.SelectSQL.Text   := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(?ID_VID_NAKL)';
  TaxInvoicesDM.OtrNaklDSet.SelectSQL.Text         := 'select * from TI_SP_OTR_NAKL_SEL where ID_REESTR=:ID_REESTR ORDER BY num_order';
  TaxInvoicesDM.ReestrDSet.Open;
  TaxInvoicesDM.SignatureReestrDSet.Open;
  TaxInvoicesDM.VidNaklDSet.Open;
  TaxInvoicesDM.SignatureNaklDSet.Open;
  TaxInvoicesDM.OtrNaklDSet.Open;
  TaxInvoicesDM.OtrNaklDSet.FetchAll;
  TaxInvoicesDM.VidNaklDSet.FetchAll;

  KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
  KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
end;

procedure TTaxInvoicesMainForm.InsInReestrButtonClick(Sender: TObject);
var
  ViewForm       : TTITaxInvoicesAddVidNaklForm;
  ViewFormOtr    : TTITaxInvoicesAddOtrNaklForm;
  addparametr    : TTITaxInvoicesAddVidNakl;
  addparametrOtr : TTITaxInvoicesAddOtrNakl;
  id_vid_nakl    : Integer;
  id_otr_nakl    : Integer;
     i,j         : Integer;
  KEY_SESSION    : Int64;
  workdate       : TDate;
  STRU           : KERNEL_MODE_STRUCTURE;
  DoResult       : Boolean;
  ErrorList      : TStringList;
  s              : string;
begin
  if (is_admin = 0) then
  begin
    If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','Add') <> 0) then
    begin
      TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
      Exit;
    end;
  end;


 if not (TaxInvoicesDM.ReestrDSet.IsEmpty)then
 begin
  if (NaklPageControl.ActivePage=VidNaklTabSheet)then
  begin
    ViewForm := TTITaxInvoicesAddVidNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,addparametr);
    ViewForm.NaklDateEdit.Date                := Now;
    ViewForm.NumNaklTextEdit.Text             := '';
    ViewForm.CustomerButtonEdit.Text          := '';
    ViewForm.FullNameMemo.Text                := '';
    ViewForm.IPNCustomerTextEdit.Text         := '';
    ViewForm.KodButtonEdit.Text               := '';
    ViewForm.IsKorigCheckBox.Checked          := False;
    ViewForm.IsExpansionCheckBox.Checked      := False;
    ViewForm.IsSignCheckBox.Checked           := False;
    ViewForm.SummaTaxable20CurrencyEdit.EditValue  := 0;
    ViewForm.SummaPDV20CurrencyEdit.EditValue      := 0;
    ViewForm.SummaTaxable0CurrencyEdit.EditValue   := 0;
    ViewForm.SummaExemptCurrencyEdit.EditValue     := 0;
    ViewForm.SummaExportCurrencyEdit.EditValue     := 0;
    ViewForm.SummaDeliveryCurrencyEdit.EditValue   := 0;

    ViewForm.FullNameCheckBox.Checked         := False;
    ViewForm.FullNameMemo.Properties.ReadOnly := True;
    ViewForm.SaveFullNameButton.Visible       := False;

    ViewForm.LgotaButtonEdit.Enabled          := False;
    ViewForm.LgotaCheckBox.Checked            := False;
    ViewForm.LgotaButtonEdit.Text             := '';

    ViewForm.SpecialNotesCheckBox.Checked   := False;
    ViewForm.SpecialNotesButtonEdit.Enabled := False;
    ViewForm.SpecialNotesButtonEdit.Text    := '';
    ViewForm.OznakaCheckBox.Checked         := False;
    ViewForm.OznakaTextEdit.Enabled         := False;
    ViewForm.OznakaTextEdit.Text            := '';

    ViewForm.Caption := GetConst('TaxInvEditAdd',tcForm);
    ViewForm.ReadReg;
    TaxInvoicesDM.WriteTransaction.StartTransaction;
    TaxInvoicesDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := TaxInvoicesDM.ReestrDSet['id_reestr'];
    TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 1; //выданные накладные
    TaxInvoicesDM.pFIBStoredProc.ExecProc;
    TaxInvoicesDM.WriteTransaction.Commit;
    ViewForm.NumOrderTextEdit.Text := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').AsString;
    ViewForm.NumNaklTextEdit.Text  := ViewForm.NumOrderTextEdit.Text;
    ViewForm.Label21.Caption := '';
    ViewForm.Label22.Caption := '';
    ViewForm.Label23.Caption := '';
    ViewForm.Label26.Caption := '';
    ViewForm.LabelNotPDV.Caption := '';
    ViewForm.LabelPDV.Caption    := '';
    for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
    TaxInvoicesDM.RxMemoryData_smet.Delete;
    ViewForm.provodka := True;
    ViewForm.ShowModal;

    if ViewForm.ModalResult=mrOk then
    begin
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := ViewForm.NaklDateEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := ViewForm.NumNaklTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := ViewForm.NumOrderTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ViewForm.Parameter.Id_TypeDocument;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ViewForm.Parameter.Name_TypeDocument;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := ViewForm.Parameter.Id_Customer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := ViewForm.Parameter.Name_Customer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := ViewForm.Parameter.IPNCustomer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 0;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := '';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1; //donnu

      if (ViewForm.LgotaCheckBox.Checked = true) then
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_lgota').Value   := ViewForm.Parameter.id_lgota;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_lgota').Value := ViewForm.Parameter.Name_lgota;
       end
      else
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_lgota').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_lgota').Value  := '';
       end;

      if (ViewForm.SpecialNotesCheckBox.Checked = true) then
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := ViewForm.Parameter.id_specialNotes;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value := ViewForm.Parameter.Num_specialnotes;
       end
      else
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
       end;

      if (ViewForm.OznakaCheckBox.Checked = true) then
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := ViewForm.OznakaTextEdit.Text;
       end
      else
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
       end;

      TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value := ViewForm.SummaDeliveryCurrencyEdit.Value;

      if (ViewForm.SummaPDV20CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value := ViewForm.SummaPDV20CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value := 0;

      if (ViewForm.SummaTaxable20CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value := ViewForm.SummaTaxable20CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value := 0;

      if (ViewForm.SummaTaxable0CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value  := ViewForm.SummaTaxable0CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value  := 0;

      if (ViewForm.SummaExemptCurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value := ViewForm.SummaExemptCurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value := 0;

      if (ViewForm.SummaExportCurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value := ViewForm.SummaExportCurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value := 0;

      if (ViewForm.IsKorigCheckBox.Checked) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 0;

      if (ViewForm.IsExpansionCheckBox.Checked) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 0;

      if (ViewForm.IsSignCheckBox.Checked) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 0;

      if (ViewForm.KodButtonEdit.Text = '') then
      begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
      end
      else
      begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := ViewForm.Parameter.id_Kod;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := ViewForm.Parameter.Name_Kod;
      end;

      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value        := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value := StrToInt('-1');
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      id_vid_nakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').AsInteger;


      // добавление проводок в таблицу TI_BUDGET_NDS
      TaxInvoicesDM.RxMemoryData_smet.First;
      for i:=0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
      begin
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := id_vid_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 0;
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.RxMemoryData_smet.Next;
      end;
      //TaxInvoicesDM.WriteTransaction.Commit;
      //TaxInvoicesDM.WriteTransaction.StartTransaction;
      //если есть НДС - осуществляем проводку в бухгалтерию
      if ViewForm.SummaPDV20CurrencyEdit.EditValue<>0 then
      begin
        //добавление проводок в буфера
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        TaxInvoicesDM.pFIBStoredProc.ExecProc;

        //TaxInvoicesDM.WriteTransaction.Commit;
        //TaxInvoicesDM.WriteTransaction.StartTransaction;
        // добавление проводки
        KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
        STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
        STRU.KERNEL_ACTION := 1;
        STRU.ID_USER       := TaxInvoicesUser.id_user;

        try
          DoResult:=Kernel.KernelDo(@STRU);
        except
         on E:Exception do
         begin
           ShowMessage('Помилка ядра ' + E.Message);
           Exit;
         end;
        end;

       if not DoResult then
       begin
         ErrorList := Kernel.GetDocErrorsListEx(@STRU);

        s := '';
        for j:=0 to ErrorList.Count - 1 do
         begin
           if s <> '' then s := s + #13;
           s := s + ErrorList.Strings[j];
         end;

         ShowMessage(s);
         TaxInvoicesDM.WriteTransaction.Rollback;
         Exit;
       end;
      end;

      TaxInvoicesDM.WriteTransaction.Commit;
      TaxInvoicesDM.VidNaklDSet.Close;
      TaxInvoicesDM.VidNaklDSet.Open;
      TaxInvoicesDM.VidNaklDSet.FetchAll;
      TaxInvoicesDM.VidNaklDSet.Locate('ID_VID_NAKL',IntToStr(id_vid_nakl),[]);
      KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
      KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
    end;
  end;

  if (NaklPageControl.ActivePage=OtrNaklTabSheet)then
  begin
    ViewFormOtr := TTITaxInvoicesAddOtrNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,addparametrOtr);
    ViewFormOtr.DateVipDateEdit.Text        := '';
    ViewFormOtr.DateOtrDateEdit.Text        := '';
    ViewFormOtr.NumNaklTextEdit.Text        := '';
    ViewFormOtr.ProviderButtonEdit.Text     := '';
    ViewFormOtr.IPNProviderTextEdit.Text    := '';
    ViewFormOtr.KodButtonEdit.Text          := '';
    ViewFormOtr.IsKorigCheckBox.Checked     := False;
    ViewFormOtr.IsExpansionCheckBox.Checked := False;
    ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.EditValue       := 0;
    ViewFormOtr.summa_20_0_pdv_CurrencyEdit.EditValue           := 0;
    ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.EditValue     := 0;
    ViewFormOtr.summa_exempt_pdv_CurrencyEdit.EditValue         := 0;
    ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.EditValue := 0;
    ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.EditValue     := 0;
    ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.EditValue   := 0;
    ViewFormOtr.summa_delivery_pdv_CurrencyEdit.EditValue       := 0;

    ViewFormOtr.FullNameMemo.Text            := '';
    ViewFormOtr.FullNameCheckBox.Checked     := False;
    ViewFormOtr.FullNameMemo.Properties.ReadOnly        := True;
    ViewFormOtr.SaveFullNameButton.Visible   := False;

    ViewFormOtr.Oznaka1CheckBox.Checked := False;
    ViewFormOtr.Oznaka1TextEdit.Enabled := False;
    ViewFormOtr.Oznaka1TextEdit.Text    := '';
    ViewFormOtr.Oznaka2CheckBox.Checked := False;
    ViewFormOtr.Oznaka2TextEdit.Enabled := False;
    ViewFormOtr.Oznaka2TextEdit.Text    := '';

    ViewFormOtr.Caption := GetConst('TaxInvEditAdd',tcForm);
    ViewFormOtr.ReadReg;
    TaxInvoicesDM.WriteTransaction.StartTransaction;
    TaxInvoicesDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := TaxInvoicesDM.ReestrDSet['id_reestr'];
    TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 0; //полученные накладные
    TaxInvoicesDM.pFIBStoredProc.ExecProc;
    TaxInvoicesDM.WriteTransaction.Commit;
    ViewFormOtr.NumOrderTextEdit.Text := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').AsString;
    //ViewFormOtr.NumNaklTextEdit.Text  := ViewFormOtr.NumOrderTextEdit.Text;
    ViewFormOtr.Label21.Caption := '';
    ViewFormOtr.Label22.Caption := '';
    ViewFormOtr.Label23.Caption := '';
    ViewFormOtr.Label26.Caption := '';
    ViewFormOtr.LabelNotPDV.Caption := '';
    ViewFormOtr.LabelPDV.Caption    := '';
    for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
    TaxInvoicesDM.RxMemoryData_smet.Delete;
    ViewFormOtr.provodka := True;
    ViewFormOtr.ShowModal;

    if ViewFormOtr.ModalResult=mrOk then
    begin
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_OTR_NAKL_INS';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := ViewFormOtr.NumOrderTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('data_otr').Value            := ViewFormOtr.DateOtrDateEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := ViewFormOtr.DateVipDateEdit.Date;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := ViewFormOtr.NumNaklTextEdit.Text;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ViewFormOtr.Parameter.Id_TypeDocument;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ViewFormOtr.Parameter.Name_TypeDocument;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_provider').Value         := ViewFormOtr.Parameter.Id_Customer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('name_provider').Value       := ViewFormOtr.Parameter.Name_Customer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ipn_provider').Value        := ViewFormOtr.Parameter.IPNCustomer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('is_import').Value           := 0;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;//DONNU

      if (ViewFormOtr.Oznaka1CheckBox.Checked = true) then
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka1').Value   := ViewFormOtr.Oznaka1TextEdit.Text;
       end
      else
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka1').Value   := '';
       end;

      if (ViewFormOtr.Oznaka2CheckBox.Checked = true) then
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka2').Value   := ViewFormOtr.Oznaka2TextEdit.Text;
       end
      else
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka2').Value   := '';
       end;

      if (ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_not_pdv').Value := ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_not_pdv').Value := 0;

      if (ViewFormOtr.summa_20_0_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_pdv').Value := ViewFormOtr.summa_20_0_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_pdv').Value := 0;

      if (ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_not_pdv').Value := ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_not_pdv').Value := 0;

      if (ViewFormOtr.summa_exempt_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_pdv').Value := ViewFormOtr.summa_exempt_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_pdv').Value := 0;

      if (ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_not_pdv').Value := ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_not_pdv').Value := 0;

      if (ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_pdv').Value := ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_pdv').Value := 0;

      if (ViewFormOtr.summa_delivery_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_pdv').Value := ViewFormOtr.summa_delivery_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_pdv').Value := 0;

      if (ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.Enabled) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_not_pdv').Value := ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.Value
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_not_pdv').Value := 0;

      if (ViewFormOtr.IsKorigCheckBox.Checked) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 0;

      if (ViewFormOtr.IsExpansionCheckBox.Checked) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 0;

      if (ViewFormOtr.KodButtonEdit.Text = '') then
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
       end
      else
       begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := ViewForm.Parameter.id_Kod;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := ViewForm.Parameter.Name_Kod;
       end;

      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      id_otr_nakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL_').AsInteger;
      // добавление проводок в таблицу TI_BUDGET_NDS
      TaxInvoicesDM.RxMemoryData_smet.First;
      for i:=0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
      begin
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := id_otr_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('IS_LGOTA').Value;
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.RxMemoryData_smet.Next;
      end;
      //если есть НДС - осуществляем проводку в бухгалтерию
      if ViewFormOtr.summa_20_0_pdv_CurrencyEdit.EditValue<>0 then
      begin
        //добавление проводок в буфера
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_OTR_NAKL';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value        := id_otr_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        TaxInvoicesDM.pFIBStoredProc.ExecProc;

        // добавление проводки
        KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
        STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
        STRU.KERNEL_ACTION := 1;
        STRU.ID_USER       := TaxInvoicesUser.id_user;

        try
          DoResult:=Kernel.KernelDo(@STRU);
        except
         on E:Exception do
         begin
           ShowMessage('Помилка ядра ' + E.Message);
           Exit;
         end;
        end;

       if not DoResult then
       begin
         ErrorList := Kernel.GetDocErrorsListEx(@STRU);

        s := '';
        for j:=0 to ErrorList.Count - 1 do
         begin
           if s <> '' then s := s + #13;
           s := s + ErrorList.Strings[j];
         end;

         ShowMessage(s);
         TaxInvoicesDM.WriteTransaction.Rollback;
         Exit;
       end;
      end;

      TaxInvoicesDM.WriteTransaction.Commit;
      //id_otr_nakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('id_otr_nakl_').AsInteger;
      TaxInvoicesDM.OtrNaklDSet.Close;
      TaxInvoicesDM.OtrNaklDSet.Open;
      TaxInvoicesDM.OtrNaklDSet.FetchAll;
      TaxInvoicesDM.OtrNaklDSet.Locate('id_otr_nakl',IntToStr(id_otr_nakl),[]);
    end;
  end;
 end;
end;

procedure TTaxInvoicesMainForm.IsSignatureReestrButtonClick(
  Sender: TObject);
var
  id_reestr: Integer;
begin
  // нужна проверка на право выполнять эту операцию
  try
    begin
      id_reestr := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_SIGNATURE_DOCUMENT_HIST_INS';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_document').Value   := id_reestr;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_user').Value       := TaxInvoicesUser.id_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('name_user').Value     := TaxInvoicesUser.name_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('name_computer').Value := TaxInvoicesUser.name_computer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ip_computer').Value   := TaxInvoicesUser.ip_computer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_TIME_SIGNATURE').AsDateTime := Now;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_DOCUMENT').Value := 1; //1 - реестр, 0 - накладная
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').Value  := 1; //1 - подписано, 0 - не подписано
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;
      RefreshBtn.Click;
      TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR',IntToStr(id_reestr),[]);
      TiShowMessage('Увага!','Реєстр підписано.',mtWarning,[mbOK]);
    end;
  except
      begin
        TiShowMessage('Виникла помилка!','Реєстр не підписано.',mtError,[mbOK]);
        TaxInvoicesDM.WriteTransaction.Rollback;
      end;
  end;
end;

procedure TTaxInvoicesMainForm.NotSignatureReestrButtonClick(
  Sender: TObject);
var
  id_reestr: Integer;
begin
  // нужна проверка на право выполнять эту операцию
  try
    begin
      id_reestr := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_SIGNATURE_DOCUMENT_HIST_INS';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_document').Value   := id_reestr;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('id_user').Value       := TaxInvoicesUser.id_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('name_user').Value     := TaxInvoicesUser.name_user;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('name_computer').Value := TaxInvoicesUser.name_computer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ip_computer').Value   := TaxInvoicesUser.ip_computer;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_TIME_SIGNATURE').AsDateTime := Now;
      TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_DOCUMENT').Value := 1; //1 - реестр, 0 - накладная
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').Value  := 0; //1 - подписано, 0 - не подписано
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;
      RefreshBtn.Click;
      TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR',IntToStr(id_reestr),[]);
      TiShowMessage('Увага!','Підпис з реєстру знята.',mtWarning,[mbOK]);
    end;
  except
      begin
        TiShowMessage('Виникла помилка!','Підпис з реєстру не знята.',mtError,[mbOK]);
        TaxInvoicesDM.WriteTransaction.Rollback;
      end;
  end;
end;

procedure TTaxInvoicesMainForm.SignatureReestrHistButtonClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesSignReestrHistForm;
begin
  ViewForm := TTaxInvoicesSignReestrHistForm.Create(Self,TaxInvoicesDM.DB.Handle);
  ViewForm.Caption := '';
  ViewForm.NumReestrLabel.Caption := '№ реєстру';
  ViewForm.NumReestrValueLabel.Caption := TaxInvoicesDM.ReestrDSet['NUM_REESTR'];
  ViewForm.NumNaklLabel.Visible :=False;
  ViewForm.NumNaklValueLabel.Visible :=False;
  ViewForm.NZPLabel.Visible :=False;
  ViewForm.NZPDBLabel.Visible :=False;
  ViewForm.DataNaklLabel.Visible :=False;
  ViewForm.DataNaklValueLabel.Visible :=False;
  TaxInvoicesDM.SignatureHistDSet.Close;
  TaxInvoicesDM.SignatureHistDSet.SelectSQL.Text := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(:id_doc)';
  TaxInvoicesDM.SignatureHistDSet.ParamByName('id_doc').Value := TaxInvoicesDM.ReestrDSet['id_reestr'];
  TaxInvoicesDM.SignatureHistDSet.Open;
  ViewForm.ShowModal;
end;

procedure TTaxInvoicesMainForm.UpdInReestrButtonClick(Sender: TObject);
var
  ViewForm       : TTITaxInvoicesAddVidNaklForm;
  ViewFormImport : TTITaxInvoicesUpdVidNaklImportForm;
  ViewFormOtr    : TTITaxInvoicesAddOtrNaklForm;
  AddParametr    : TTITaxInvoicesAddVidNakl;
  AddParametrImport : TTITaxInvoicesUpdImportVidNakl;
  AddParametrOtr : TTITaxInvoicesAddOtrNakl;
  id_vid_nakl    : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  id_otr_Nakl,i  : Integer;
  KEY_SESSION    : Int64;
  STRU           : KERNEL_MODE_STRUCTURE;
  DoResult       : Boolean;
  ErrorList      : TStringList;
  s              : string;
  j              : integer;
  workdate       : TDate;
  pk_id          : int64;
  pk_id_old      : Int64;
  sum_All_Nds    : Double;
  sum_All_Not_NDS : Double;
begin
  if (NaklPageControl.ActivePage=VidNaklTabSheet)then
  begin
   if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
    begin
      if (is_admin = 0) then
      begin
        If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','Edit') <> 0) then
        begin
          TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
          Exit;
        end
        else
        begin
          if (TaxInvoicesUser.id_user <> TaxInvoicesDM.VidNaklDSet['id_user_create'])then
          begin
            TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
            Exit;
          end;
        end;
      end;

      if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then    //изменение строки (список выданных накладных)
      begin
        if ((TaxInvoicesDM.VidNaklDSet['IS_IMPORT'] = 0) or ((TaxInvoicesDM.VidNaklDSet['IS_IMPORT'] = 1) and (TaxInvoicesDM.VidNaklDSet['NAME_SYSTEM'] <> 'оренда'))) then
        begin
          if (TaxInvoicesDM.VidNaklDSet['id_taxliabilities'] = null) then
          begin
           AddParametr.id_Kod   := 0;
           AddParametr.Name_Kod := '';
          end
          else
          begin
           AddParametr.id_Kod   := TaxInvoicesDM.VidNaklDSet['id_taxliabilities'];
           AddParametr.Name_Kod := TaxInvoicesDM.VidNaklDSet['name_taxliabilities'];
          end;

          if (TaxInvoicesDM.VidNaklDSet['id_type_document'] = null) then
          begin
           AddParametr.Id_TypeDocument   := 0;
           AddParametr.Name_TypeDocument := '';
          end
          else
          begin
           AddParametr.Id_TypeDocument   := TaxInvoicesDM.VidNaklDSet['id_type_document'];
           AddParametr.Name_TypeDocument := TaxInvoicesDM.VidNaklDSet['name_type_document'];
          end;

          AddParametr.Id_Customer       := TaxInvoicesDM.VidNaklDSet['id_customer'];
          AddParametr.Name_Customer     := TaxInvoicesDM.VidNaklDSet['name_customer'];
          AddParametr.IPNCustomer       := TaxInvoicesDM.VidNaklDSet['ipn_customer'];
          AddParametr.IsKorig           := TaxInvoicesDM.VidNaklDSet['is_korig'];
          AddParametr.IsExpansion       := TaxInvoicesDM.VidNaklDSet['is_expansion'];
          AddParametr.IsSign            := TaxInvoicesDM.VidNaklDSet['is_sign'];

          if ((TaxInvoicesDM.VidNaklDSet['id_lgota'] = null) or (TaxInvoicesDM.VidNaklDSet['id_lgota'] = 0) ) then
           begin
             AddParametr.id_lgota   := 0;
             AddParametr.Name_lgota := '';
           end
          else
           begin
             AddParametr.id_lgota   := TaxInvoicesDM.VidNaklDSet['id_lgota'];
             AddParametr.Name_lgota := TaxInvoicesDM.VidNaklDSet['name_lgota'];
           end;


          if ((TaxInvoicesDM.VidNaklDSet['ID_SPECIALNOTES'] = null) or (TaxInvoicesDM.VidNaklDSet['ID_SPECIALNOTES'] = 0) ) then
           begin
             AddParametr.id_specialNotes   := 0;
             AddParametr.NUM_SPECIALNOTES := '';
           end
          else
           begin
             AddParametr.id_specialNotes   := TaxInvoicesDM.VidNaklDSet['ID_SPECIALNOTES'];
             AddParametr.NUM_SPECIALNOTES := TaxInvoicesDM.VidNaklDSet['NUM_SPECIALNOTES'];
           end;

          if ((TaxInvoicesDM.VidNaklDSet['OZNAKA_NAKL'] = null) or (TaxInvoicesDM.VidNaklDSet['OZNAKA_NAKL'] = '') ) then
           begin
             AddParametr.oznaka_nakl := '';
           end
          else
           begin
             AddParametr.oznaka_nakl := TaxInvoicesDM.VidNaklDSet['oznaka_nakl'];
           end;


          ViewForm := TTITaxInvoicesAddVidNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,AddParametr);
          ViewForm.NaklDateEdit.Date                := TaxInvoicesDM.VidNaklDSet['data_vipiski'];
          ViewForm.NumOrderTextEdit.Text            := TaxInvoicesDM.VidNaklDSet['num_order'];
          ViewForm.NumNaklTextEdit.Text             := TaxInvoicesDM.VidNaklDSet['num_nakl'];
          ViewForm.KodButtonEdit.Text               := AddParametr.Name_Kod;
          ViewForm.CustomerButtonEdit.Text          := AddParametr.Name_Customer;
          ViewForm.FullNameMemo.Text                := AddParametr.Name_Customer;
          ViewForm.IPNCustomerTextEdit.Text         := AddParametr.IPNCustomer;
          ViewForm.Caption := GetConst('TaxInvEditUpd',tcForm);

          if not (AddParametr.id_Kod = 0) then
            ViewForm.SummaEnabled(AddParametr.id_Kod); //єнейблим суммы

          if (TaxInvoicesDM.VidNaklDSet['is_korig']=1) then
           ViewForm.IsKorigCheckBox.Checked := True
          else
           ViewForm.IsKorigCheckBox.Checked := False;

          if (TaxInvoicesDM.VidNaklDSet['is_expansion']=1) then
           ViewForm.IsExpansionCheckBox.Checked := True
          else
           ViewForm.IsExpansionCheckBox.Checked := False;

          if (TaxInvoicesDM.VidNaklDSet['is_sign']=1) then
            ViewForm.IsSignCheckBox.Checked := True
          else
            ViewForm.IsSignCheckBox.Checked := False;

          ViewForm.SummaTaxable20CurrencyEdit.Text  := TaxInvoicesDM.VidNaklDSet['summa_taxable_20'];
          ViewForm.SummaPDV20CurrencyEdit.Text      := TaxInvoicesDM.VidNaklDSet['summa_pdv_20'];
          ViewForm.SummaTaxable0CurrencyEdit.Text   := TaxInvoicesDM.VidNaklDSet['summa_taxable_0'];
          ViewForm.SummaExemptCurrencyEdit.Text     := TaxInvoicesDM.VidNaklDSet['summa_exempt'];
          ViewForm.SummaExportCurrencyEdit.Text     := TaxInvoicesDM.VidNaklDSet['summa_export'];
          ViewForm.TypeDocumentButtonEdit.Text      := AddParametr.Name_TypeDocument;
          ViewForm.LabelNotPDV.Caption := '';
          ViewForm.LabelPDV.Caption := '';

          ViewForm.FullNameCheckBox.Checked         := False;
          ViewForm.FullNameMemo.Properties.ReadOnly := True;
          ViewForm.SaveFullNameButton.Visible       := False;
          // отображение проводок
          for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
          TaxInvoicesDM.RxMemoryData_smet.Delete;

          TaxInvoicesDM.Smeta_Vid_N_DSet.Close;
          TaxInvoicesDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 1';
          TaxInvoicesDM.Smeta_Vid_N_DSet.ParamByName('id').Value := TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
          TaxInvoicesDM.Smeta_Vid_N_DSet.Open;
          TaxInvoicesDM.Smeta_Vid_N_DSet.FetchAll;
          TaxInvoicesDM.Smeta_Vid_N_DSet.First;
          sum_All_Nds     := 0;
          sum_All_Not_NDS := 0;
          for i := 0 to TaxInvoicesDM.Smeta_Vid_N_DSet.RecordCount-1 do
          begin
            TaxInvoicesDM.RxMemoryData_smet.Open;
            TaxInvoicesDM.RxMemoryData_smet.Insert;
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_smet'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_razd'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_stat'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['sum_smet'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_smet'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_razd'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_stat'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_smety'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_razd'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_stat'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_kekv'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_kekv'];
            TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_kekv'];
            TaxInvoicesDM.RxMemoryData_smet.Post;
            TaxInvoicesDM.Smeta_Vid_N_DSet.Next;

            if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
              sum_All_Nds     := sum_All_Nds + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value
            else
              sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
          end;
          if TaxInvoicesDM.Smeta_Vid_N_DSet.IsEmpty = True then
          begin
            ViewForm.Label21.Caption := '';
            ViewForm.Label22.Caption := '';
            ViewForm.Label23.Caption := '';
            ViewForm.Label26.Caption := '';
            ViewForm.LabelNotPDV.Caption := '';
            ViewForm.LabelPDV.Caption := '';
          end
          else
          begin
            ViewForm.LabelNotPDV.Caption := Floattostr(sum_All_Not_NDS);
            ViewForm.LabelPDV.Caption := Floattostr(sum_All_Nds);
          end;

          if (TaxInvoicesDM.VidNaklDSet['pk_id']= null)
           then pk_id := 0
           else pk_id := TFIBBCDField(TaxInvoicesDM.VidNaklDSet.FieldByName('pk_id')).AsInt64;

          if (pk_id = -1)
           then
            ViewForm.provodka := False
           else
            ViewForm.provodka := True;



          if (AddParametr.Name_lgota = '') then
           begin
             ViewForm.LgotaCheckBox.Checked := False;
             ViewForm.LgotaButtonEdit.Text := '';
           end
          else
          begin
            ViewForm.LgotaCheckBox.Checked := True;
            ViewForm.LgotaButtonEdit.Text := AddParametr.Name_lgota;
          end;

          if (AddParametr.Num_specialnotes = '') then
           begin
             ViewForm.SpecialNotesCheckBox.Checked := False;
             ViewForm.SpecialNotesButtonEdit.Text := '';
           end
          else
           begin
             ViewForm.SpecialNotesCheckBox.Checked := True;
             ViewForm.SpecialNotesButtonEdit.Text := AddParametr.Num_specialnotes;
           end;

          if (AddParametr.oznaka_nakl = '') then
           begin
             ViewForm.OznakaCheckBox.Checked := False;
             ViewForm.OznakaTextEdit.Text := '';
           end
          else
           begin
             ViewForm.OznakaCheckBox.Checked := True;
             ViewForm.OznakaTextEdit.Text := AddParametr.oznaka_nakl;
           end;

          ViewForm.ShowModal;

          if ViewForm.ModalResult = mrOk then
          begin
            id_vid_nakl := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];


            TaxInvoicesDM.WriteTransaction.StartTransaction;
            TaxInvoicesDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_UPD';
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value         := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := ViewForm.NaklDateEdit.Date;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := ViewForm.NumNaklTextEdit.Text;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('num_order').Value           := ViewForm.NumOrderTextEdit.Text;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ViewForm.Parameter.Id_TypeDocument;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ViewForm.Parameter.Name_TypeDocument;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := ViewForm.Parameter.id_Kod;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := ViewForm.Parameter.Name_Kod;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := ViewForm.Parameter.Id_Customer;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := ViewForm.Parameter.Name_Customer;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := ViewForm.Parameter.IPNCustomer;

            if (ViewForm.LgotaCheckBox.Checked = true) then
             begin
               TaxInvoicesDM.pFIBStoredProc.ParamByName('id_lgota').Value   := ViewForm.Parameter.id_lgota;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('name_lgota').Value := ViewForm.Parameter.Name_lgota;
             end
            else
            begin
             TaxInvoicesDM.pFIBStoredProc.ParamByName('id_lgota').Value   := 0;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('name_lgota').Value  := '';
            end;

            if (ViewForm.SpecialNotesCheckBox.Checked = true) then
             begin
              TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := ViewForm.Parameter.id_specialNotes;
              TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := ViewForm.Parameter.Num_specialnotes;
             end
            else
             begin
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
             end;

            if (ViewForm.OznakaCheckBox.Checked = true) then
             begin
              TaxInvoicesDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := ViewForm.OznakaTextEdit.Text;
             end
            else
             begin
              TaxInvoicesDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
             end;

            TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value := ViewForm.SummaDeliveryCurrencyEdit.Value;

            if (ViewForm.SummaPDV20CurrencyEdit.Enabled) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value := ViewForm.SummaPDV20CurrencyEdit.Value
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value := 0;

            if (ViewForm.SummaTaxable20CurrencyEdit.Enabled) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value := ViewForm.SummaTaxable20CurrencyEdit.Value
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value := 0;

            if (ViewForm.SummaTaxable0CurrencyEdit.Enabled) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value  := ViewForm.SummaTaxable0CurrencyEdit.Value
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value  := 0;

            if (ViewForm.SummaExemptCurrencyEdit.Enabled) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value := ViewForm.SummaExemptCurrencyEdit.Value
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value := 0;

            if (ViewForm.SummaExportCurrencyEdit.Enabled) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value := ViewForm.SummaExportCurrencyEdit.Value
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value := 0;

            if (ViewForm.IsKorigCheckBox.Checked) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 1
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 0;

            if (ViewForm.IsExpansionCheckBox.Checked) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 1
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 0;

            if (ViewForm.IsSignCheckBox.Checked) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 1
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 0;

            if (ViewForm.IsKorigCheckBox.Checked) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 1
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 0;

            if (ViewForm.IsExpansionCheckBox.Checked) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 1
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 0;

            if (ViewForm.IsSignCheckBox.Checked) then
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 1
            else
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 0;

            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value        := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_CHANGE').Value        := 0; // изменение записи в справочнике выданных накладных (изменение всех полей в справочнике)
            TaxInvoicesDM.pFIBStoredProc.ExecProc;


            if pk_id <> -1 then
            Begin
              //изменение проводок
              TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
              TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
              TaxInvoicesDM.pFIBStoredProc.ParamByName('is_vid').Value  := 1;
              TaxInvoicesDM.pFIBStoredProc.ExecProc;

              TaxInvoicesDM.RxMemoryData_smet.First;
             for i:=0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do   //записываем новые
              begin
               TaxInvoicesDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 0;
               TaxInvoicesDM.pFIBStoredProc.ExecProc;
               TaxInvoicesDM.RxMemoryData_smet.Next;
              end;


             if (pk_id > 0) then
             begin

              ShowMessage(Inttostr(pk_id));
              // удаляем старую проводку
              KEY_SESSION := TaxInvoicesDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
              STRU.KEY_SESSION := KEY_SESSION;
              STRU.WORKDATE := TaxInvoicesDM.VidNaklDSet['date_prov'];
              STRU.DBHANDLE := TaxInvoicesDM.DB.Handle;
              STRU.TRHANDLE := TaxInvoicesDM.WriteTransaction.Handle;
              STRU.KERNEL_ACTION := 2;
              STRU.PK_ID := pk_id;
              STRU.ID_USER := TaxInvoicesUser.id_user;

              try
                DoResult:=Kernel.KernelDo(@STRU);
              //  TaxInvoicesDM.WriteTransaction.Commit;
              except
               on E:Exception do
               begin
                 ShowMessage('Помилка ядра ' + E.Message);
                 TaxInvoicesDM.WriteTransaction.Rollback;
                 Exit;
               end;
              end;

              if not DoResult then
              begin
                ErrorList := Kernel.GetDocErrorsListEx(@STRU);

                s := '';
                for j:=0 to ErrorList.Count - 1 do
                begin
                  if s <> '' then s := s + #13;
                  s := s + ErrorList.Strings[j];
                end;
                ShowMessage(s);
                TaxInvoicesDM.WriteTransaction.Rollback;
                Exit;
              end;

              //обнуляем пк_ид
              TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_UPDATE_PK_ID';
              TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value  := 1;
              TaxInvoicesDM.pFIBStoredProc.ParamByName('PK_ID').Value   := 0;
              TaxInvoicesDM.pFIBStoredProc.ExecProc;
             End;

             //если есть НДС - осуществляем проводку в бухгалтерию
             if ViewForm.SummaPDV20CurrencyEdit.EditValue<>0 then
             begin
              //добавление проводок в буфера

              TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
              TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
              TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
              TaxInvoicesDM.pFIBStoredProc.ExecProc;
              // добавление проводки
              KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
              workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

              STRU.KEY_SESSION   := KEY_SESSION;
              STRU.WORKDATE      := WORKDATE;
              STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
              STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
              STRU.KERNEL_ACTION := 1;
              STRU.ID_USER       := TaxInvoicesUser.id_user;

              try
                DoResult:=Kernel.KernelDo(@STRU);
              except
                on E:Exception do
                begin
                 ShowMessage('Помилка ядра ' + E.Message);
                 TaxInvoicesDM.WriteTransaction.Rollback;
                 Exit;
                end;
              end;
              if not DoResult then
              begin
                ErrorList := Kernel.GetDocErrorsListEx(@STRU);

                s := '';
                for j:=0 to ErrorList.Count - 1 do
                begin
                 if s <> '' then s := s + #13;
                 s := s + ErrorList.Strings[j];
                end;

                ShowMessage(s);
                TaxInvoicesDM.WriteTransaction.Rollback;
                Exit;
              end;
             end;
              TaxInvoicesDM.WriteTransaction.Commit;
              TaxInvoicesDM.VidNaklDSet.Close;
              TaxInvoicesDM.VidNaklDSet.Open;
              TaxInvoicesDM.VidNaklDSet.FetchAll;
              TaxInvoicesDM.VidNaklDSet.Locate('ID_VID_NAKL',IntToStr(id_vid_nakl),[]);
              KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
              KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
            end;
          end;
        end;
      end;


      if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 1) then  //изменение документа (выданные накладные)
      begin
        if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
        begin

          if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then
          begin
            TiShowMessage('Увага!','Редагування неможливо. Це не документ',mtWarning,[mbOK]);
            Exit;
          end;

          //аренда
          if ((TaxInvoicesDM.VidNaklDSet['IS_IMPORT'] = 1) and (TaxInvoicesDM.VidNaklDSet['NAME_SYSTEM'] = 'оренда')) then
          begin

           if (TaxInvoicesDM.VidNaklDSet['id_type_document'] = null) then
           begin
            AddParametrImport.Id_TypeDocument   := 0;
            AddParametrImport.Name_TypeDocument := '';
           end
           else
           begin
            AddParametrImport.Id_TypeDocument   := TaxInvoicesDM.VidNaklDSet['id_type_document'];
            AddParametrImport.Name_TypeDocument := TaxInvoicesDM.VidNaklDSet['name_type_document'];
           end;

           if (TaxInvoicesDM.VidNaklDSet['pk_id']= null)
           then pk_id := 0
           else pk_id := TFIBBCDField(TaxInvoicesDM.VidNaklDSet.FieldByName('pk_id')).AsInt64;

           AddParametrImport.id_termsdelivery   := TaxInvoicesDM.VidNaklDSet['id_termsdelivery'];
           AddParametrImport.name_termsdelivery := TaxInvoicesDM.VidNaklDSet['name_termsdelivery'];
           AddParametrImport.id_FormCalculations   := TaxInvoicesDM.VidNaklDSet['id_FormCalculations'];
           AddParametrImport.name_FormCalculations := TaxInvoicesDM.VidNaklDSet['name_FormCalculations'];
           AddParametrImport.Id_Customer        := TaxInvoicesDM.VidNaklDSet['id_customer'];
           AddParametrImport.adress_customer    := TaxInvoicesDM.VidNaklDSet['place_customer'];
           AddParametrImport.phone_customer     := TaxInvoicesDM.VidNaklDSet['phone_customer'];
           if ((TaxInvoicesDM.VidNaklDSet['ID_SPECIALNOTES'] = null) or (TaxInvoicesDM.VidNaklDSet['ID_SPECIALNOTES'] = 0) ) then
            begin
             AddParametrImport.id_specialNotes   := 0;
             AddParametrImport.NUM_SPECIALNOTES := '';
            end
           else
           begin
             AddParametrImport.id_specialNotes   := TaxInvoicesDM.VidNaklDSet['ID_SPECIALNOTES'];
             AddParametrImport.NUM_SPECIALNOTES := TaxInvoicesDM.VidNaklDSet['NUM_SPECIALNOTES'];
           end;

           {if ((TaxInvoicesDM.VidNaklDSet['OZNAKA_NAKL'] = null) or (TaxInvoicesDM.VidNaklDSet['OZNAKA_NAKL'] = '') ) then
            begin
             AddParametrImport.oznaka_nakl := '';
            end
           else
            begin
             AddParametrImport.oznaka_nakl := TaxInvoicesDM.VidNaklDSet['oznaka_nakl'];
            end; }

           ViewFormImport := TTITaxInvoicesUpdVidNaklImportForm.Create(Self,TaxInvoicesDM.DB.Handle, AddParametrImport);
           ViewFormImport.NaklDateEdit.Date           := TaxInvoicesDM.VidNaklDSet['data_vipiski'];
           ViewFormImport.NumOrderTextEdit.Text       := TaxInvoicesDM.VidNaklDSet['num_order'];
           ViewFormImport.NumNaklTextEdit.Text        := TaxInvoicesDM.VidNaklDSet['num_nakl'];
           ViewFormImport.TypeDocumentButtonEdit.Text := AddParametrImport.Name_TypeDocument;
           ViewFormImport.VidDogButtonEdit.Text       := AddParametrImport.name_termsdelivery;
           ViewFormImport.RozraxunokButtonEdit.Text   := AddParametrImport.name_FormCalculations;
           ViewFormImport.PlacePokupMemo.Text         := AddParametrImport.adress_customer;
           ViewFormImport.TelPokupTextEdit.Text       := AddParametrImport.phone_customer;
           ViewFormImport.IPNProviderTextEdit.Text    := TaxInvoicesDM.VidNaklDSet['ipn_customer'];
           ViewFormImport.FullNameMemo.Text           := TaxInvoicesDM.VidNaklDSet['name_customer'];
           ViewFormImport.PhonePocupTextEdit.Text     := TaxInvoicesDM.VidNaklDSet['PHONE_SELLER'];
           ViewFormImport.Caption                     := GetConst('TaxInvImportUpd',tcForm);

           if (AddParametrImport.Num_specialnotes = '') then
            begin
             ViewFormImport.SpecialNotesCheckBox.Checked := False;
             ViewFormImport.SpecialNotesButtonEdit.Text := '';
             ViewFormImport.SpecialNotesButtonEdit.Enabled := False;
            end
           else
            begin
             ViewFormImport.SpecialNotesCheckBox.Checked := True;
             ViewFormImport.SpecialNotesButtonEdit.Text := AddParametrImport.Num_specialnotes;
             ViewFormImport.SpecialNotesButtonEdit.Enabled := True;
            end;

           if (TaxInvoicesDM.VidNaklDSet['oznaka_nakl']= '') then
            begin
             ViewFormImport.OznakaCheckBox.Checked := False;
             ViewFormImport.OznakaTextEdit.Text := '';
             ViewFormImport.OznakaTextEdit.Enabled := False;
            end
           else
           begin
             ViewFormImport.OznakaCheckBox.Checked := True;
             ViewFormImport.OznakaTextEdit.Text    := TaxInvoicesDM.VidNaklDSet['oznaka_nakl'];
             ViewFormImport.OznakaTextEdit.Enabled := True;
           end;

           //отображение кнопок бюджетов
           TaxInvoicesDM.TISettingDSet.Close;
           TaxInvoicesDM.TISettingDSet.SelectSQL.Text := 'select * from ti_setting';
           TaxInvoicesDM.TISettingDSet.Open;
           if (TaxInvoicesDM.TISettingDSet['IS_EDIT_BUDGET_ORENDA'] = 1) then
           begin
             ViewFormImport.ToolButton_add.Enabled  := True;
             ViewFormImport.ToolButton_del.Enabled  := True;
             ViewFormImport.SpeedButton_red.Enabled := True;
           end
           else
           begin
             ViewFormImport.ToolButton_add.Enabled  := False;
             ViewFormImport.ToolButton_del.Enabled  := False;
             ViewFormImport.SpeedButton_red.Enabled := False;
           end;
           // отображение проводок
            for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
            TaxInvoicesDM.RxMemoryData_smet.Delete;

            TaxInvoicesDM.Smeta_Vid_N_DSet.Close;
            TaxInvoicesDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 1';
            TaxInvoicesDM.Smeta_Vid_N_DSet.ParamByName('id').Value := TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
            TaxInvoicesDM.Smeta_Vid_N_DSet.Open;
            TaxInvoicesDM.Smeta_Vid_N_DSet.FetchAll;
            TaxInvoicesDM.Smeta_Vid_N_DSet.First;
            sum_All_Nds     := 0;
            sum_All_Not_NDS := 0;
            for i := 0 to TaxInvoicesDM.Smeta_Vid_N_DSet.RecordCount-1 do
            begin
              TaxInvoicesDM.RxMemoryData_smet.Open;
              TaxInvoicesDM.RxMemoryData_smet.Insert;
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_smet'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_razd'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_stat'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['sum_smet'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_smet'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_razd'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_stat'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_smety'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_razd'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_stat'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_kekv'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_kekv'];
              TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_kekv'];
              TaxInvoicesDM.RxMemoryData_smet.Post;
              TaxInvoicesDM.Smeta_Vid_N_DSet.Next;

              if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
                sum_All_Nds     := sum_All_Nds + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value
              else
                sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
            end;
            if TaxInvoicesDM.Smeta_Vid_N_DSet.IsEmpty = True then
             begin
              ViewFormImport.Label21.Caption := '';
              ViewFormImport.Label22.Caption := '';
              ViewFormImport.Label23.Caption := '';
              ViewFormImport.Label26.Caption := '';
              ViewFormImport.LabelNotPDV.Caption := '';
              ViewFormImport.LabelPDV.Caption := '';
             end
            else
            begin
              ViewFormImport.LabelNotPDV.Caption := Floattostr(sum_All_Not_NDS);
              ViewFormImport.LabelPDV.Caption := Floattostr(sum_All_Nds);
            end;

            ViewFormImport.ShowModal;

           if ViewFormImport.ModalResult=mrOk then
           begin

             id_vid_nakl := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
             TaxInvoicesDM.WriteTransaction.StartTransaction;
             TaxInvoicesDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_UPD';
             TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value         := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
             TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := ViewFormImport.NaklDateEdit.Date;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := ViewFormImport.NumNaklTextEdit.Text;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('num_order').Value           := ViewFormImport.NumOrderTextEdit.Text;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ViewFormImport.Parameter.Id_TypeDocument;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ViewFormImport.Parameter.Name_TypeDocument;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
             TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_CHANGE').Value           := 2;// изменение импортированной записи
             TaxInvoicesDM.pFIBStoredProc.ParamByName('id_formcalculations').Value := ViewFormImport.Parameter.id_FormCalculations;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('name_formcalculations').Value := ViewFormImport.Parameter.name_FormCalculations;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value    := ViewFormImport.Parameter.id_termsdelivery;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value  := ViewFormImport.Parameter.name_termsdelivery;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := ViewFormImport.FullNameMemo.Text;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value      := ViewFormImport.PlacePokupMemo.Text;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value      := ViewFormImport.TelPokupTextEdit.Text;
             TaxInvoicesDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value        := ViewFormImport.PhonePocupTextEdit.Text;
             if (ViewFormImport.SpecialNotesCheckBox.Checked = true) then
             begin
              TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := ViewFormImport.Parameter.id_specialNotes;
              TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := ViewFormImport.Parameter.Num_specialnotes;
             end
             else
             begin
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
             end;

             if (ViewFormImport.OznakaCheckBox.Checked = true) then
             begin
              TaxInvoicesDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := ViewFormImport.OznakaTextEdit.Text;
             end
             else
             begin
              TaxInvoicesDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
             end;
             TaxInvoicesDM.pFIBStoredProc.ExecProc;

            if pk_id <> -1 then
            Begin

              //изменение проводок
              TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
              TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
              TaxInvoicesDM.pFIBStoredProc.ParamByName('is_vid').Value  := 1;
              TaxInvoicesDM.pFIBStoredProc.ExecProc;

              TaxInvoicesDM.RxMemoryData_smet.First;
             for i:=0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do   //записываем новые
              begin
               TaxInvoicesDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 0;
               TaxInvoicesDM.pFIBStoredProc.ExecProc;
               TaxInvoicesDM.RxMemoryData_smet.Next;
              end;

              if (pk_id > 0) then
              begin

               // удаляем старую проводку
               KEY_SESSION := TaxInvoicesDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
               STRU.KEY_SESSION := KEY_SESSION;
               STRU.WORKDATE := TaxInvoicesDM.VidNaklDSet['date_prov'];
               STRU.DBHANDLE := TaxInvoicesDM.DB.Handle;
               STRU.TRHANDLE := TaxInvoicesDM.WriteTransaction.Handle;
               STRU.KERNEL_ACTION := 2;
               STRU.PK_ID := pk_id;
               STRU.ID_USER := TaxInvoicesUser.id_user;

               try
                DoResult:=Kernel.KernelDo(@STRU);
                //  TaxInvoicesDM.WriteTransaction.Commit;
               except
                on E:Exception do
                begin
                  ShowMessage('Помилка ядра ' + E.Message);
                  TaxInvoicesDM.WriteTransaction.Rollback;
                  Exit;
                end;
               end;

               if not DoResult then
               begin
                 ErrorList := Kernel.GetDocErrorsListEx(@STRU);

                 s := '';
                 for j:=0 to ErrorList.Count - 1 do
                 begin
                   if s <> '' then s := s + #13;
                   s := s + ErrorList.Strings[j];
                 end;
                 ShowMessage(s);
                 TaxInvoicesDM.WriteTransaction.Rollback;
                 Exit;
               end;

               //обнуляем пк_ид
               TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_UPDATE_PK_ID';
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
               TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value  := 1;
               TaxInvoicesDM.pFIBStoredProc.ParamByName('PK_ID').Value   := 0;
               TaxInvoicesDM.pFIBStoredProc.ExecProc;
              End;

              //если есть НДС - осуществляем проводку в бухгалтерию
              if (StrToFloat(ViewFormImport.LabelPDV.Caption) <> 0) then
              begin
               //добавление проводок в буфера

               TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
               TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
               TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
               TaxInvoicesDM.pFIBStoredProc.ExecProc;
               // добавление проводки
               KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
               workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

               STRU.KEY_SESSION   := KEY_SESSION;
               STRU.WORKDATE      := WORKDATE;
               STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
               STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
               STRU.KERNEL_ACTION := 1;
               STRU.ID_USER       := TaxInvoicesUser.id_user;

               try
                 DoResult:=Kernel.KernelDo(@STRU);
               except
                 on E:Exception do
                 begin
                  ShowMessage('Помилка ядра ' + E.Message);
                  TaxInvoicesDM.WriteTransaction.Rollback;
                  Exit;
                 end;
               end;
               if not DoResult then
               begin
                 ErrorList := Kernel.GetDocErrorsListEx(@STRU);

                 s := '';
                 for j:=0 to ErrorList.Count - 1 do
                 begin
                  if s <> '' then s := s + #13;
                  s := s + ErrorList.Strings[j];
                 end;

                 ShowMessage(s);
                 TaxInvoicesDM.WriteTransaction.Rollback;
                 Exit;
               end;
              end;

             TaxInvoicesDM.WriteTransaction.Commit;
             TaxInvoicesDM.VidNaklDSet.Close;
             TaxInvoicesDM.VidNaklDSet.Open;
             TaxInvoicesDM.VidNaklDSet.FetchAll;
             TaxInvoicesDM.VidNaklDSet.Locate('ID_VID_NAKL',IntToStr(id_vid_nakl),[]);
             KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
             KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
            end;
           end;
          end;

          if (((TaxInvoicesDM.VidNaklDSet['IS_IMPORT'] = 0) and (TaxInvoicesDM.VidNaklDSet['IS_KORIG'] <> 1)) or ((TaxInvoicesDM.VidNaklDSet['IS_IMPORT'] = 1) and (TaxInvoicesDM.VidNaklDSet['NAME_SYSTEM'] <> 'оренда')) )then
          begin
            id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
            id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
            id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
            TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr,0);
            TaxInvoicesDM.VidNaklDSet.Close;
            TaxInvoicesDM.SignatureNaklDSet.Close;
            TaxInvoicesDM.VidNaklDSet.Open;
            TaxInvoicesDM.VidNaklDSet.FetchAll;
            TaxInvoicesDM.SignatureNaklDSet.Open;
            TaxInvoicesDM.VidNaklDSet.Locate('ID_NAKL_DOCUMENT',IntToStr(id_VidNakl_Doc),[]);
            KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
            KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
          end;

          //корректировка
          if ((TaxInvoicesDM.VidNaklDSet['IS_IMPORT'] = 0) and (TaxInvoicesDM.VidNaklDSet['IS_KORIG'] = 1))then
          begin
            id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
            id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
            id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
            TaxInvEdit := LoadTaxInvoicesKorigPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesKorig.bpl','View_TaxInvoicesKorig',id_VidNakl,id_VidNakl_Doc,id_reestr,0);
            id_VidNakl_Doc := TaxInvEdit.id_vid_nakl_doc;
            TaxInvoicesDM.ReestrDSet.Close;
            TaxInvoicesDM.VidNaklDSet.Close;
            TaxInvoicesDM.SignatureNaklDSet.Close;
            TaxInvoicesDM.ReestrDSet.Open;
            TaxInvoicesDM.VidNaklDSet.Open;
            TaxInvoicesDM.VidNaklDSet.FetchAll;
            TaxInvoicesDM.SignatureNaklDSet.Open;
            TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR', id_reestr,[]);
            TaxInvoicesDM.VidNaklDSet.Locate('id_vid_nakl', IntToStr(id_VidNakl),[]);
            KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
            KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
          end;
        end;
      end;
    end;
  end;

  if (NaklPageControl.ActivePage = OtrNaklTabSheet) then   //исправляем полученные накладные
  begin
    if not (TaxInvoicesDM.OtrNaklDSet.IsEmpty) then
    begin

      if (is_admin = 0) then
      begin
        If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','Edit') <> 0) then
        begin
          TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
          Exit;
        end
        else
        begin
          if (TaxInvoicesUser.id_user <> TaxInvoicesDM.OtrNaklDSet['id_user_create'])then
          begin
            TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
            Exit;
          end;
        end;
      end;

      if (TaxInvoicesDM.OtrNaklDSet['id_taxliabilities'] = null) then
       begin
        AddParametrOtr.id_Kod   := 0;
        AddParametrOtr.Name_Kod := '';
       end
      else
       begin
        AddParametrOtr.id_Kod   := TaxInvoicesDM.OtrNaklDSet['id_taxliabilities'];
        AddParametrOtr.Name_Kod := TaxInvoicesDM.OtrNaklDSet['name_taxliabilities'];
       end;

      if (TaxInvoicesDM.OtrNaklDSet['id_type_document'] = null) then
       begin
        AddParametrOtr.Id_TypeDocument   := 0;
        AddParametrOtr.Name_TypeDocument := '';
       end
      else
       begin
        AddParametrOtr.Id_TypeDocument   := TaxInvoicesDM.OtrNaklDSet['id_type_document'];
        AddParametrOtr.Name_TypeDocument := TaxInvoicesDM.OtrNaklDSet['name_type_document'];
       end;

      AddParametrOtr.Id_Customer       := TaxInvoicesDM.OtrNaklDSet['id_provider'];
      AddParametrOtr.Name_Customer     := TaxInvoicesDM.OtrNaklDSet['name_provider'];
      AddParametrOtr.IPNCustomer       := TaxInvoicesDM.OtrNaklDSet['ipn_provider'];
      AddParametrOtr.IsKorig           := TaxInvoicesDM.OtrNaklDSet['is_korig'];
      AddParametrOtr.IsExpansion       := TaxInvoicesDM.OtrNaklDSet['is_expansion'];

      ViewFormOtr := TTITaxInvoicesAddOtrNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,AddParametrOtr);
      ViewFormOtr.DateVipDateEdit.Date             := TaxInvoicesDM.OtrNaklDSet['data_vipiski'];
      ViewFormOtr.DateOtrDateEdit.Date             := TaxInvoicesDM.OtrNaklDSet['data_otr'];
      ViewFormOtr.NumOrderTextEdit.Text            := TaxInvoicesDM.OtrNaklDSet['num_order'];
      ViewFormOtr.NumNaklTextEdit.Text             := TaxInvoicesDM.OtrNaklDSet['num_nakl'];
      ViewFormOtr.KodButtonEdit.Text               := AddParametrOtr.Name_Kod;
      ViewFormOtr.ProviderButtonEdit.Text          := AddParametrOtr.Name_Customer;
      ViewFormOtr.IPNProviderTextEdit.Text         := AddParametrOtr.IPNCustomer;
      ViewFormOtr.FullNameMemo.Text                := AddParametrOtr.Name_Customer;
      ViewFormOtr.TypeDocumentButtonEdit.Text      := AddParametrOtr.Name_TypeDocument;
      ViewFormOtr.Caption := GetConst('TaxInvEditUpd',tcForm);

      if not (AddParametrOtr.id_Kod = 0) then
            ViewFormOtr.SummaEnabled(AddParametrOtr.id_Kod); //єнейблим суммы

      if (TaxInvoicesDM.OtrNaklDSet['is_korig']=1) then
        ViewFormOtr.IsKorigCheckBox.Checked := True
      else
        ViewFormOtr.IsKorigCheckBox.Checked := False;

      if (TaxInvoicesDM.OtrNaklDSet['is_expansion']=1) then
        ViewFormOtr.IsExpansionCheckBox.Checked := True
      else
        ViewFormOtr.IsExpansionCheckBox.Checked := False;

      if ((TaxInvoicesDM.OtrNaklDSet['OZNAKA1'] = null) or (TaxInvoicesDM.OtrNaklDSet['OZNAKA1'] = '') ) then
        begin
          ViewFormOtr.Oznaka1TextEdit.Enabled := false;
          ViewFormOtr.Oznaka1CheckBox.Checked := false;
          ViewFormOtr.Oznaka1TextEdit.Text := '';
        end
      else
        begin
          ViewFormOtr.Oznaka1TextEdit.Enabled := True;
          ViewFormOtr.Oznaka1CheckBox.Checked := True;
          ViewFormOtr.Oznaka1TextEdit.Text    := TaxInvoicesDM.OtrNaklDSet['OZNAKA1']
        end;

      if ((TaxInvoicesDM.OtrNaklDSet['OZNAKA2'] = null) or (TaxInvoicesDM.OtrNaklDSet['OZNAKA2'] = '') ) then
        begin
          ViewFormOtr.Oznaka2TextEdit.Enabled := false;
          ViewFormOtr.Oznaka2CheckBox.Checked := false;
          ViewFormOtr.Oznaka2TextEdit.Text := '';
        end
      else
        begin
          ViewFormOtr.Oznaka2TextEdit.Enabled := True;
          ViewFormOtr.Oznaka2CheckBox.Checked := True;
          ViewFormOtr.Oznaka2TextEdit.Text := TaxInvoicesDM.OtrNaklDSet['OZNAKA2'];
        end;

      ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.Text       := TaxInvoicesDM.OtrNaklDSet['summa_20_0_not_pdv'];
      ViewFormOtr.summa_20_0_pdv_CurrencyEdit.Text           := TaxInvoicesDM.OtrNaklDSet['summa_20_0_pdv'];
      ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.Text     := TaxInvoicesDM.OtrNaklDSet['summa_exempt_not_pdv'];
      ViewFormOtr.summa_exempt_pdv_CurrencyEdit.Text         := TaxInvoicesDM.OtrNaklDSet['summa_exempt_pdv'];
      ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.Text := TaxInvoicesDM.OtrNaklDSet['summa_econ_activ_not_pdv'];
      ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.Text     := TaxInvoicesDM.OtrNaklDSet['summa_econ_activ_pdv'];
      ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.Text   := TaxInvoicesDM.OtrNaklDSet['summa_delivery_not_pdv'];
      ViewFormOtr.summa_delivery_pdv_CurrencyEdit.Text       := TaxInvoicesDM.OtrNaklDSet['summa_delivery_pdv'];
      // отображение проводок
      for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
      TaxInvoicesDM.RxMemoryData_smet.Delete;

      TaxInvoicesDM.Smeta_Vid_N_DSet.Close;
      TaxInvoicesDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 0';
      TaxInvoicesDM.Smeta_Vid_N_DSet.ParamByName('id').Value := TaxInvoicesDM.OtrNaklDSet['id_otr_nakl'];
      TaxInvoicesDM.Smeta_Vid_N_DSet.Open;
      TaxInvoicesDM.Smeta_Vid_N_DSet.FetchAll;
      TaxInvoicesDM.Smeta_Vid_N_DSet.First;
      sum_All_Nds     := 0;
      sum_All_Not_NDS := 0;
      for i := 0 to TaxInvoicesDM.Smeta_Vid_N_DSet.RecordCount-1 do
      begin
        TaxInvoicesDM.RxMemoryData_smet.Open;
        TaxInvoicesDM.RxMemoryData_smet.Insert;
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_smet'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_razd'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_stat'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['sum_smet'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_smet'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_razd'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_stat'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_smety'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_razd'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_stat'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_kekv'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_kekv'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_kekv'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('is_lgota').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['is_lgota'];
        TaxInvoicesDM.RxMemoryData_smet.Post;
        TaxInvoicesDM.Smeta_Vid_N_DSet.Next;

        if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
          sum_All_Nds     := sum_All_Nds + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value
        else
          sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
      end;
      if TaxInvoicesDM.Smeta_Vid_N_DSet.IsEmpty = True then
        begin
          ViewFormOtr.Label21.Caption := '';
          ViewFormOtr.Label22.Caption := '';
          ViewFormOtr.Label23.Caption := '';
          ViewFormOtr.Label26.Caption := '';
          ViewFormOtr.LabelNotPDV.Caption := '';
          ViewFormOtr.LabelPDV.Caption := '';
        end
      else
        begin
          ViewFormOtr.LabelNotPDV.Caption := Floattostr(sum_All_Not_NDS);
          ViewFormOtr.LabelPDV.Caption := Floattostr(sum_All_Nds);
        end;

      if TaxInvoicesDM.OtrNaklDSet['pk_id']= null
      then pk_id := 0
      else pk_id := TFIBBCDField( TaxInvoicesDM.OtrNaklDSet.FieldByName('pk_id')).AsInt64;

      if (pk_id = -1)
      then
        ViewFormOtr.provodka := False
      else
        ViewFormOtr.provodka := True;

      ViewFormOtr.YesButton.Visible := True;

      ViewFormOtr.ShowModal;

      if ViewFormOtr.ModalResult=mrOk then
      begin
        id_otr_Nakl := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_OTR_NAKL_UPD';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value         := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('data_otr').Value            := ViewFormOtr.DateOtrDateEdit.Date;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := ViewFormOtr.DateVipDateEdit.Date;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := ViewFormOtr.NumNaklTextEdit.Text;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('num_order').Value           := ViewFormOtr.NumOrderTextEdit.Text;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ViewFormOtr.Parameter.Id_TypeDocument;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ViewFormOtr.Parameter.Name_TypeDocument;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := ViewFormOtr.Parameter.id_Kod;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := ViewFormOtr.Parameter.Name_Kod;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_provider').Value         := ViewFormOtr.Parameter.Id_Customer;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_provider').Value       := ViewFormOtr.Parameter.Name_Customer;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ipn_provider').Value        := ViewFormOtr.Parameter.IPNCustomer;

        if (ViewFormOtr.Oznaka1CheckBox.Checked = true) then
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka1').Value   := ViewFormOtr.Oznaka1TextEdit.Text;
         end
        else
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka1').Value   := '';
         end;

        if (ViewFormOtr.Oznaka2CheckBox.Checked = true) then
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka2').Value   := ViewFormOtr.Oznaka2TextEdit.Text;
         end
        else
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('oznaka2').Value   := '';
         end;

        if (ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_not_pdv').Value := ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_not_pdv').Value := 0;

        if (ViewFormOtr.summa_20_0_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_pdv').Value := ViewFormOtr.summa_20_0_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_20_0_pdv').Value := 0;

        if (ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_not_pdv').Value := ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_not_pdv').Value := 0;

        if (ViewFormOtr.summa_exempt_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_pdv').Value := ViewFormOtr.summa_exempt_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_exempt_pdv').Value := 0;

        if (ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_not_pdv').Value := ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_not_pdv').Value := 0;

        if (ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_pdv').Value := ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_econ_activ_pdv').Value := 0;

        if (ViewFormOtr.summa_delivery_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_pdv').Value := ViewFormOtr.summa_delivery_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_pdv').Value := 0;

        if (ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.Enabled) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_not_pdv').Value := ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.Value
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_delivery_not_pdv').Value := 0;

        if (ViewFormOtr.IsKorigCheckBox.Checked) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 1
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 0;

        if (ViewFormOtr.IsExpansionCheckBox.Checked) then
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 1
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 0;

        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
        TaxInvoicesDM.pFIBStoredProc.ExecProc;

        if pk_id <> -1 then
        Begin
          //изменение проводок
          TaxInvoicesDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
          TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('is_vid').Value := 0;
          TaxInvoicesDM.pFIBStoredProc.ExecProc;

          TaxInvoicesDM.RxMemoryData_smet.First;
          for i:=0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do   //записываем новые
          begin
            TaxInvoicesDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 0;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := TaxInvoicesDM.RxMemoryData_smet.FieldByName('IS_LGOTA').Value;
            TaxInvoicesDM.pFIBStoredProc.ExecProc;
            TaxInvoicesDM.RxMemoryData_smet.Next;
          end;

          if (pk_id > 0) then
          begin
            KEY_SESSION := TaxInvoicesDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
            STRU.KEY_SESSION := KEY_SESSION;
            STRU.WORKDATE := TaxInvoicesDM.OtrNaklDSet['date_prov'];
            STRU.DBHANDLE := TaxInvoicesDM.DB.Handle;
            STRU.TRHANDLE := TaxInvoicesDM.WriteTransaction.Handle;
            STRU.KERNEL_ACTION := 2;
            STRU.PK_ID := pk_id;
            STRU.ID_USER := TaxInvoicesUser.id_user;

            try
              DoResult:=Kernel.KernelDo(@STRU);
            //TaxInvoicesDM.WriteTransaction.Commit;
            except
              on E:Exception do
              begin
                ShowMessage('Помилка ядра ' + E.Message);
                TaxInvoicesDM.WriteTransaction.Rollback;
                Exit;
              end;
            end;

            if not DoResult then
            begin
              ErrorList := Kernel.GetDocErrorsListEx(@STRU);

              s := '';
              for j:=0 to ErrorList.Count - 1 do
              begin
                if s <> '' then s := s + #13;
                s := s + ErrorList.Strings[j];
              end;
              ShowMessage(s);
              TaxInvoicesDM.WriteTransaction.Rollback;
              Exit;
            end;
            //обнуляем пк_ид
            TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_UPDATE_PK_ID';
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value  := 0;
            TaxInvoicesDM.pFIBStoredProc.ParamByName('PK_ID').Value   := 0;
            TaxInvoicesDM.pFIBStoredProc.ExecProc;
          End;

         if (ViewFormOtr.summa_20_0_pdv_CurrencyEdit.EditValue<>0 )then
         begin
          //добавление проводок в буфера
          TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_OTR_NAKL';
          TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value        := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
          TaxInvoicesDM.pFIBStoredProc.ExecProc;
          // добавление проводки
          KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
          workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

          STRU.KEY_SESSION   := KEY_SESSION;
          STRU.WORKDATE      := WORKDATE;
          STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
          STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
          STRU.KERNEL_ACTION := 1;
          STRU.ID_USER       := TaxInvoicesUser.id_user;

          try
            DoResult:=Kernel.KernelDo(@STRU);
          except
            on E:Exception do
            begin
              ShowMessage('Помилка ядра ' + E.Message);
              TaxInvoicesDM.WriteTransaction.Rollback;
              Exit;
            end;
          end;

          if not DoResult then
          begin
            ErrorList := Kernel.GetDocErrorsListEx(@STRU);

            s := '';
            for j:=0 to ErrorList.Count - 1 do
            begin
              if s <> '' then s := s + #13;
              s := s + ErrorList.Strings[j];
            end;

            ShowMessage(s);
            TaxInvoicesDM.WriteTransaction.Rollback;
            Exit;
          end;
         end;
        end;

        TaxInvoicesDM.WriteTransaction.Commit;

        TaxInvoicesDM.OtrNaklDSet.Close;
        TaxInvoicesDM.OtrNaklDSet.Open;
        TaxInvoicesDM.OtrNaklDSet.FetchAll;
        TaxInvoicesDM.OtrNaklDSet.Locate('ID_OTR_NAKL',IntToStr(id_otr_Nakl),[]);
      end;
    end;
  end;  
end;

procedure TTaxInvoicesMainForm.DelInReestrButtonClick(Sender: TObject);
var
  i,j            : Integer;
  KEY_SESSION    : Int64;
  workdate       : TDate;
  STRU           : KERNEL_MODE_STRUCTURE;
  DoResult       : Boolean;
  ErrorList      : TStringList;
  s              : string;
begin
  if (NaklPageControl.ActivePage=VidNaklTabSheet) then
  begin
    if not (TaxInvoicesDM.VidNaklDSet.IsEmpty)then
    begin
     if (is_admin = 0) then
      begin
        If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','Del') <> 0) then
        begin
          TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
          Exit;
        end
        else
        begin
          if (TaxInvoicesUser.id_user <> TaxInvoicesDM.VidNaklDSet['id_user_create'])then
          begin
            TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
            Exit;
          end;
        end;
      end;

      if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити видану накладну?',mtWarning,[mbYes, mbNo])=mrYes then
      begin
        try
          TaxInvoicesDM.WriteTransaction.StartTransaction;
          if(TaxInvoicesDM.VidNaklDSet['pk_id']<>0) and (TaxInvoicesDM.VidNaklDSet['pk_id']<>-1)then
          begin
            // удаление смет из своей таблицы
            TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('is_vid').Value  := 1;
            TaxInvoicesDM.pFIBStoredProc.ExecProc;
            //удаление проводки
            KEY_SESSION := TaxInvoicesDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
            STRU.KEY_SESSION := KEY_SESSION;
            STRU.WORKDATE := TaxInvoicesDM.VidNaklDSet['date_prov'];
            STRU.DBHANDLE := TaxInvoicesDM.DB.Handle;
            STRU.TRHANDLE := TaxInvoicesDM.WriteTransaction.Handle;
            STRU.KERNEL_ACTION := 2;
            STRU.PK_ID := StrToInt64(TaxInvoicesDM.VidNaklDSet.FieldByName('pk_id').AsString);
            STRU.ID_USER := TaxInvoicesUser.id_user;

            try
              DoResult:=Kernel.KernelDo(@STRU);
            except
             on E:Exception do
             begin
               ShowMessage('Помилка ядра ' + E.Message);
               TaxInvoicesDM.WriteTransaction.Rollback;
               Exit;
             end;
            end;

           if not DoResult then
           begin
            ErrorList := Kernel.GetDocErrorsListEx(@STRU);

            s := '';
            for j:=0 to ErrorList.Count - 1 do
            begin
              if s <> '' then s := s + #13;
              s := s + ErrorList.Strings[j];
            end;
            ShowMessage(s);
            TaxInvoicesDM.WriteTransaction.Rollback;
            Exit;
           end;
          end;

          //удаление налоговой
          TaxInvoicesDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_DEL';
          TaxInvoicesDM.pFIBStoredProc.ParamByName('id_vid_nakl').Value:=TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value:=TaxInvoicesDM.VidNaklDSet['id_nakl_document'];
          TaxInvoicesDM.pFIBStoredProc.ExecProc;

          TaxInvoicesDM.WriteTransaction.Commit;
          TaxInvoicesDM.VidNaklDSet.Close;
          TaxInvoicesDM.VidNaklDSet.Open;
          TaxInvoicesDM.VidNaklDSet.FetchAll;

        except on E:Exception do
          begin
            MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
            TaxInvoicesDM.WriteTransaction.Rollback;
          end;

        end;
      end;
    end;


  end;

 if (NaklPageControl.ActivePage=OtrNaklTabSheet) then
 begin
  if not (TaxInvoicesDM.OtrNaklDSet.IsEmpty) then
  begin
    if (is_admin = 0) then
    begin
      If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','Del') <> 0) then
      begin
        TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
        Exit;
      end
      else
      begin
        if (TaxInvoicesUser.id_user <> TaxInvoicesDM.OtrNaklDSet['id_user_create'])then
        begin
          TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
          Exit;
        end;
      end;
    end;

    if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити отриману накладну?',mtWarning,[mbYes, mbNo])=mrYes then
     begin
       try
         TaxInvoicesDM.WriteTransaction.StartTransaction;
         if(TaxInvoicesDM.OtrNaklDSet['pk_id']<>0) and (TaxInvoicesDM.OtrNaklDSet['pk_id']<>-1)then
          begin
            // удаление смет из своей таблицы
            TaxInvoicesDM.pFIBStoredProc.StoredProcName               := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
            TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := TaxInvoicesDM.OtrNaklDSet['ID_OTR_NAKL'];
            TaxInvoicesDM.pFIBStoredProc.ParamByName('is_vid').Value  := 0;
            TaxInvoicesDM.pFIBStoredProc.ExecProc;
            //удаление проводки
            KEY_SESSION := TaxInvoicesDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
            STRU.KEY_SESSION := KEY_SESSION;
            STRU.WORKDATE := TaxInvoicesDM.OtrNaklDSet['date_prov'];
            STRU.DBHANDLE := TaxInvoicesDM.DB.Handle;
            STRU.TRHANDLE := TaxInvoicesDM.WriteTransaction.Handle;
            STRU.KERNEL_ACTION := 2;
            STRU.PK_ID := StrToInt64(TaxInvoicesDM.OtrNaklDSet.FieldByName('pk_id').AsString);
            STRU.ID_USER := TaxInvoicesUser.id_user;

            try
              DoResult:=Kernel.KernelDo(@STRU);
            except
             on E:Exception do
             begin
               ShowMessage('Помилка ядра ' + E.Message);
               TaxInvoicesDM.WriteTransaction.Rollback;
               Exit;
             end;
            end;

           if not DoResult then
           begin
            ErrorList := Kernel.GetDocErrorsListEx(@STRU);

            s := '';
            for j:=0 to ErrorList.Count - 1 do
            begin
              if s <> '' then s := s + #13;
              s := s + ErrorList.Strings[j];
            end;
            ShowMessage(s);
            TaxInvoicesDM.WriteTransaction.Rollback;
            Exit;
           end;
          end;

         TaxInvoicesDM.pFIBStoredProc.StoredProcName:='TI_SP_OTR_NAKL_DEL';
         TaxInvoicesDM.pFIBStoredProc.ParamByName('id_otr_nakl').Value:=TaxInvoicesDM.OtrNaklDSet['id_otr_nakl'];
         TaxInvoicesDM.pFIBStoredProc.ExecProc;
         TaxInvoicesDM.WriteTransaction.Commit;
         TaxInvoicesDM.OtrNaklDSet.Close;
         TaxInvoicesDM.OtrNaklDSet.Open;
         TaxInvoicesDM.OtrNaklDSet.FetchAll;
       except on E:Exception do
         begin
           MessageDlg('не можна видалити отриману накладну', mtError, [mbOK], 0);
           TaxInvoicesDM.WriteTransaction.Rollback;
         end;
       end;
     end;
  end;
 end;
end;

procedure TTaxInvoicesMainForm.VidNaklGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (NaklPageControl.ActivePage=VidNaklTabSheet) then
 begin
  if IsSignatureReestrButton.Enabled=True then
  begin
    if (TaxInvoicesDM.VidNaklDSet['is_signature']=1) then
    begin
     UpdInReestrButton.Enabled         := False;
     NumOrderButton.Enabled            := False;
     DelInReestrButton.Enabled         := False;
     IsNaklSignatureButton.Enabled     := False;
     NotNaklSignatureButton.Enabled    := True;

     DataSignatureNaklLabel.Visible    := True;
     SignatureDataDBTextEdit.Visible   := True;
     SignatureNaklDBTextEdit.Visible   := True;
     NameSignatureNaklLabel.Caption    := 'ким';
    end
    else
    begin
     UpdInReestrButton.Enabled         := True;
     NumOrderButton.Enabled            := True;
     DelInReestrButton.Enabled         := True;
     IsNaklSignatureButton.Enabled     := True;
     NotNaklSignatureButton.Enabled    := False;

     DataSignatureNaklLabel.Visible    := False;
     SignatureDataDBTextEdit.Visible   := False;
     SignatureNaklDBTextEdit.Visible   := False;
     NameSignatureNaklLabel.Caption    := 'видана накладна не підписана';
    end;
  end
  else
  begin
    InsInReestrButton.Enabled         := False;
    UpdInReestrButton.Enabled         := False;
    DelInReestrButton.Enabled         := False;
    IsNaklSignatureButton.Enabled     := False;
    NotNaklSignatureButton.Enabled    := False;
    NumOrderButton.Enabled            := False;
  end;
 end;
end;

procedure TTaxInvoicesMainForm.IsNaklSignatureButtonClick(Sender: TObject);
var
  id_vid_nakl: Integer;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty)then
  begin
    try
      begin
        if (is_admin = 0) then
        begin
          If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','SIGN') <> 0) then
          begin
            TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
            Exit;
          end
          else
          begin
            if (TaxInvoicesUser.id_user <> TaxInvoicesDM.VidNaklDSet['id_user_create'])then
            begin
              TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
              Exit;
            end;
          end;
        end;
        id_vid_nakl := TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_SIGNATURE_DOCUMENT_HIST_INS';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_document').Value   := id_vid_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_user').Value       := TaxInvoicesUser.id_user;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_user').Value     := TaxInvoicesUser.name_user;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_computer').Value := TaxInvoicesUser.name_computer;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ip_computer').Value   := TaxInvoicesUser.ip_computer;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_TIME_SIGNATURE').AsDateTime := Now;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_DOCUMENT').Value := 0; //1 - реестр, 0 - накладная
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').Value  := 1; //1 - подписано, 0 - не подписано
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.WriteTransaction.Commit;
        TaxInvoicesDM.VidNaklDSet.Close;
        TaxInvoicesDM.SignatureNaklDSet.Close;
        TaxInvoicesDM.SignatureNaklDSet.SelectSQL.Text   := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(?ID_VID_NAKL)';
        TaxInvoicesDM.VidNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.FetchAll;
        TaxInvoicesDM.SignatureNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.Locate('id_vid_nakl',IntToStr(id_vid_nakl),[]);
        KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
        KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
        TiShowMessage('Увага!','Накладну підписано.',mtWarning,[mbOK]);
      end;
    except
        begin
          TiShowMessage('Виникла помилка!','Накладну не підписано.',mtError,[mbOK]);
          TaxInvoicesDM.WriteTransaction.Rollback;
        end;
    end;
  end;

end;

procedure TTaxInvoicesMainForm.NotNaklSignatureButtonClick(
  Sender: TObject);
var
  id_vid_nakl: Integer;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty)then
  begin
    try
      begin
        if (is_admin = 0) then
        begin
          If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','UNSIGN') <> 0) then
          begin
            TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
            Exit;
          end
          else
          begin
            if (TaxInvoicesUser.id_user <> TaxInvoicesDM.VidNaklDSet['id_user_create'])then
            begin
              TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
              Exit;
            end;
          end;
        end;
        
        id_vid_nakl := TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_SIGNATURE_DOCUMENT_HIST_INS';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_document').Value   := id_vid_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('id_user').Value       := TaxInvoicesUser.id_user;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_user').Value     := TaxInvoicesUser.name_user;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('name_computer').Value := TaxInvoicesUser.name_computer;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ip_computer').Value   := TaxInvoicesUser.ip_computer;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_TIME_SIGNATURE').AsDateTime := Now;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_DOCUMENT').Value := 0; //1 - реестр, 0 - накладная
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').Value  := 0; //1 - подписано, 0 - не подписано
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.WriteTransaction.Commit;
        TaxInvoicesDM.VidNaklDSet.Close;
        TaxInvoicesDM.SignatureNaklDSet.Close;
        TaxInvoicesDM.SignatureNaklDSet.SelectSQL.Text   := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(?ID_VID_NAKL)';
        TaxInvoicesDM.VidNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.FetchAll;
        TaxInvoicesDM.SignatureNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.Locate('id_vid_nakl',IntToStr(id_vid_nakl),[]);
        KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
        KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
        TiShowMessage('Увага!','Підпис з накладної знята.',mtWarning,[mbOK]);
      end;
    except
        begin
          TiShowMessage('Виникла помилка!','Підпис з накладної не знята.',mtError,[mbOK]);
          TaxInvoicesDM.WriteTransaction.Rollback;
        end;
    end;
  end; 
end;

procedure TTaxInvoicesMainForm.SignatureNaklHistButtonClick(
  Sender: TObject);
var
  ViewForm : TTaxInvoicesSignReestrHistForm;
begin
  if not(TaxInvoicesDM.VidNaklDSet.IsEmpty)then
  begin
    ViewForm := TTaxInvoicesSignReestrHistForm.Create(Self,TaxInvoicesDM.DB.Handle);
    ViewForm.Caption := '';
    ViewForm.NumReestrLabel.Caption      := '№ реєстру';
    ViewForm.NumReestrValueLabel.Caption := TaxInvoicesDM.ReestrDSet['NUM_REESTR'];
    ViewForm.NumNaklLabel.Visible        := True;
    ViewForm.NumNaklValueLabel.Visible   := True;
    ViewForm.NumNaklValueLabel.Caption   := TaxInvoicesDM.VidNaklDSet['NUM_NAKL'];
    ViewForm.NZPLabel.Visible            := True;
    ViewForm.NZPDBLabel.Visible          := True;
    ViewForm.DataNaklLabel.Visible       := True;
    ViewForm.DataNaklValueLabel.Visible  := True;
    ViewForm.DataNaklValueLabel.Caption  := DateToStr(TaxInvoicesDM.VidNaklDSet['data_vipiski']);
    TaxInvoicesDM.SignatureHistDSet.Close;
    TaxInvoicesDM.SignatureHistDSet.SelectSQL.Text := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(:id_doc)';
    TaxInvoicesDM.SignatureHistDSet.ParamByName('id_doc').Value := TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
    TaxInvoicesDM.SignatureHistDSet.Open;
    ViewForm.ShowModal;
  end;
end;

procedure TTaxInvoicesMainForm.NumOrderButtonClick(Sender: TObject);
var
  id_reestr: Integer;
begin
  {if (NaklPageControl.ActivePage=VidNaklTabSheet) then
  begin
    try
      if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
      begin
        id_reestr := TaxInvoicesDM.ReestrDSet['id_reestr'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_NUM_ORDER_NAKL';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value     := id_reestr;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_DOCUMENT').Value := 1; // 1 - выданные накладные, 0 - полученные
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.WriteTransaction.Commit;
        TaxInvoicesDM.VidNaklDSet.Close;
        TaxInvoicesDM.VidNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.FetchAll;
        TiShowMessage('Увага!','Нумерація оновлена.',mtWarning,[mbOK]);
      end;
    except
      begin
        TiShowMessage('Виникла помилка!','Нумерація не оновлена.',mtError,[mbOK]);
        TaxInvoicesDM.WriteTransaction.Rollback;
      end;
    end;
  end; }

  if (NaklPageControl.ActivePage=OtrNaklTabSheet) then
  begin

    try
      if not (TaxInvoicesDM.OtrNaklDSet.IsEmpty) then
      begin
        id_reestr := TaxInvoicesDM.ReestrDSet['id_reestr'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_NUM_ORDER_NAKL';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value     := id_reestr;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_DOCUMENT').Value := 0; // 1 - выданные накладные, 0 - полученные
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.WriteTransaction.Commit;
        TaxInvoicesDM.OtrNaklDSet.Close;
        TaxInvoicesDM.OtrNaklDSet.Open;
        TaxInvoicesDM.OtrNaklDSet.FetchAll;
        TiShowMessage('Увага!','Нумерація оновлена.',mtWarning,[mbOK]);
      end;  
    except
      begin
        TiShowMessage('Виникла помилка!','Нумерація не оновлена.',mtError,[mbOK]);
        TaxInvoicesDM.WriteTransaction.Rollback;
      end;
    end;
  end; 
end;

procedure TTaxInvoicesMainForm.AddSeriesBarButtonClick(Sender: TObject);
begin
  InsInReestrButton.Click;
end;

procedure TTaxInvoicesMainForm.AddDocumentBarButtonClick(Sender: TObject);
var
  TaxInvEdit     : TTITaxInvoicesInfo;
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
begin
  id_VidNakl := -1;
  id_VidNakl_Doc := -1;
  id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
  TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr,0);
  id_VidNakl_Doc := TaxInvEdit.id_vid_nakl_doc;
  TaxInvoicesDM.ReestrDSet.Close;
  TaxInvoicesDM.VidNaklDSet.Close;
  TaxInvoicesDM.SignatureNaklDSet.Close;
  TaxInvoicesDM.ReestrDSet.Open;
  TaxInvoicesDM.VidNaklDSet.Open;
  TaxInvoicesDM.VidNaklDSet.FetchAll;
  TaxInvoicesDM.SignatureNaklDSet.Open;
  TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR', id_reestr,[]);
  TaxInvoicesDM.VidNaklDSet.Locate('id_vid_nakl', IntToStr(id_VidNakl_Doc),[]);
  KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
  KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
end;

procedure TTaxInvoicesMainForm.dxBarButton1Click(Sender: TObject);
var
  ViewForm       : TTITaxInvoicesAddVidNaklForm;
  AddParametr    : TTITaxInvoicesAddVidNakl;
  id_vid_nakl    : Integer;
begin
  if (TaxInvoicesDM.VidNaklDSet['id_taxliabilities'] = null) then
  begin
    AddParametr.id_Kod   := 0;
    AddParametr.Name_Kod := '';
  end
  else
  begin
    AddParametr.id_Kod   := TaxInvoicesDM.VidNaklDSet['id_taxliabilities'];
    AddParametr.Name_Kod := TaxInvoicesDM.VidNaklDSet['name_taxliabilities'];
  end;

  if (TaxInvoicesDM.VidNaklDSet['id_type_document'] = null) then
  begin
    AddParametr.Id_TypeDocument   := 0;
    AddParametr.Name_TypeDocument := '';
  end
  else
  begin
    AddParametr.Id_TypeDocument   := TaxInvoicesDM.VidNaklDSet['id_type_document'];
    AddParametr.Name_TypeDocument := TaxInvoicesDM.VidNaklDSet['name_type_document'];
  end;

  AddParametr.Id_Customer       := TaxInvoicesDM.VidNaklDSet['id_customer'];
  AddParametr.Name_Customer     := TaxInvoicesDM.VidNaklDSet['name_customer'];
  AddParametr.IPNCustomer       := TaxInvoicesDM.VidNaklDSet['ipn_customer'];
  AddParametr.IsKorig           := TaxInvoicesDM.VidNaklDSet['is_korig'];
  AddParametr.IsExpansion       := TaxInvoicesDM.VidNaklDSet['is_expansion'];
  AddParametr.IsSign            := TaxInvoicesDM.VidNaklDSet['is_sign'];

  ViewForm := TTITaxInvoicesAddVidNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,AddParametr);
  ViewForm.NaklDateEdit.Date                := TaxInvoicesDM.VidNaklDSet['data_vipiski'];;
  ViewForm.NumNaklTextEdit.Text             := TaxInvoicesDM.VidNaklDSet['num_nakl'];;
  ViewForm.KodButtonEdit.Text               := AddParametr.Name_Kod;
  ViewForm.CustomerButtonEdit.Text          := AddParametr.Name_Customer;
  ViewForm.IPNCustomerTextEdit.Text         := AddParametr.IPNCustomer;
  ViewForm.Caption := GetConst('TaxInvEditUpd',tcForm);

  if (TaxInvoicesDM.VidNaklDSet['is_korig']=1) then
    ViewForm.IsKorigCheckBox.Checked := True
  else
    ViewForm.IsKorigCheckBox.Checked := False;

  if (TaxInvoicesDM.VidNaklDSet['is_expansion']=1) then
    ViewForm.IsExpansionCheckBox.Checked := True
  else
    ViewForm.IsExpansionCheckBox.Checked := False;

  if (TaxInvoicesDM.VidNaklDSet['is_sign']=1) then
    ViewForm.IsSignCheckBox.Checked := True
  else
    ViewForm.IsSignCheckBox.Checked := False;

  ViewForm.SummaTaxable20CurrencyEdit.Text  := TaxInvoicesDM.VidNaklDSet['summa_taxable_20'];
  ViewForm.SummaPDV20CurrencyEdit.Text      := TaxInvoicesDM.VidNaklDSet['summa_pdv_20'];
  ViewForm.SummaTaxable0CurrencyEdit.Text   := TaxInvoicesDM.VidNaklDSet['summa_taxable_0'];
  ViewForm.SummaExemptCurrencyEdit.Text     := TaxInvoicesDM.VidNaklDSet['summa_exempt'];
  ViewForm.SummaExportCurrencyEdit.Text     := TaxInvoicesDM.VidNaklDSet['summa_export'];
  ViewForm.TypeDocumentButtonEdit.Text      := AddParametr.Name_TypeDocument;
  if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 1) then
  begin
    ViewForm.NaklDateEdit.Enabled               := False;
    ViewForm.NumNaklTextEdit.Enabled            := False;
    ViewForm.KodButtonEdit.Enabled              := False;
    ViewForm.CustomerButtonEdit.Enabled         := False;
    ViewForm.IPNCustomerTextEdit.Enabled        := False;
    ViewForm.SummaTaxable20CurrencyEdit.Enabled := False;
    ViewForm.SummaPDV20CurrencyEdit.Enabled     := False;
    ViewForm.SummaTaxable0CurrencyEdit.Enabled  := False;
    ViewForm.SummaExemptCurrencyEdit.Enabled    := False;
    ViewForm.SummaExportCurrencyEdit.Enabled    := False;
  end
  else
  begin
    ViewForm.NaklDateEdit.Enabled               := True;
    ViewForm.NumNaklTextEdit.Enabled            := True;
    ViewForm.KodButtonEdit.Enabled              := True;
    ViewForm.CustomerButtonEdit.Enabled         := True;
    ViewForm.IPNCustomerTextEdit.Enabled        := True;
    ViewForm.SummaTaxable20CurrencyEdit.Enabled := True;
    ViewForm.SummaPDV20CurrencyEdit.Enabled     := True;
    ViewForm.SummaTaxable0CurrencyEdit.Enabled  := True;
    ViewForm.SummaExemptCurrencyEdit.Enabled    := True;
    ViewForm.SummaExportCurrencyEdit.Enabled    := True;
  end;
  ViewForm.ShowModal;

  if ViewForm.ModalResult=mrOk then
  begin
    id_vid_nakl := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
    TaxInvoicesDM.WriteTransaction.StartTransaction;
    TaxInvoicesDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_UPD';
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value         := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
    TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := ViewForm.NaklDateEdit.Date;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := ViewForm.NumNaklTextEdit.Text;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ViewForm.Parameter.Id_TypeDocument;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ViewForm.Parameter.Name_TypeDocument;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := ViewForm.Parameter.id_Kod;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := ViewForm.Parameter.Name_Kod;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := ViewForm.Parameter.Id_Customer;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := ViewForm.Parameter.Name_Customer;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := ViewForm.Parameter.IPNCustomer;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := ViewForm.SummaPDV20CurrencyEdit.Value;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := ViewForm.SummaTaxable20CurrencyEdit.Value;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := ViewForm.SummaTaxable0CurrencyEdit.Value;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := ViewForm.SummaExemptCurrencyEdit.Value;
    TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := ViewForm.SummaExportCurrencyEdit.Value;

    if (ViewForm.IsKorigCheckBox.Checked) then
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 1
    else
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value := 0;

    if (ViewForm.IsExpansionCheckBox.Checked) then
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 1
    else
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value := 0;

    if (ViewForm.IsSignCheckBox.Checked) then
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 1
    else
      TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value := 0;

    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value        := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
    TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
    TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_CHANGE').Value        := 0; // изменение записи в справочнике выданных накладных (изменение всех полей в справочнике)
    TaxInvoicesDM.pFIBStoredProc.ExecProc;
    TaxInvoicesDM.WriteTransaction.Commit;

    TaxInvoicesDM.VidNaklDSet.Close;
    TaxInvoicesDM.VidNaklDSet.Open;
    TaxInvoicesDM.VidNaklDSet.FetchAll;
    TaxInvoicesDM.VidNaklDSet.Locate('ID_VID_NAKL',IntToStr(id_vid_nakl),[]);
    KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
    KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
  end;

end;


procedure TTaxInvoicesMainForm.dxBarButton2Click(Sender: TObject);
{var
  TaxInvEdit:TTITaxInvoicesInfo;
  id_VidNakl : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr : Integer; }
begin
 { if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
  begin
    if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then
    begin
      TiShowMessage('Увага!','Редагування неможливо. Це не документ',mtWarning,[mbOK]);
      Exit;
    end;
    id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
    id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
    id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
    TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr);
    TaxInvoicesDM.VidNaklDSet.Close;
    TaxInvoicesDM.SignatureNaklDSet.Close;
    TaxInvoicesDM.VidNaklDSet.Open;
    TaxInvoicesDM.SignatureNaklDSet.Open;
  end;}
end;

procedure TTaxInvoicesMainForm.VidNaklGridDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
  if VidNaklGridDBTableView.DataController.RecordCount = 0 then exit;

  if ((AViewInfo.GridRecord.Values[0]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00CECECE;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[0]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00B7B7B7;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[1]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00D3FFA8;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[1]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00ABAB58;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[21]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$007575FF;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[21] = 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=clRed;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TTaxInvoicesMainForm.VidNaklGridDBTableViewDB_is_documentCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left+1, AViewInfo.Bounds.Top, 1-AViewInfo.GridRecord.Values[VidNaklGridDBTableViewDB_is_document.Index]);
  ADone := True;
end;

procedure TTaxInvoicesMainForm.NaklPageControlChange(Sender: TObject);
begin
 if NaklPageControl.ActivePage = VidNaklTabSheet then
  begin
    IsNaklSignatureButton.Enabled   := True;
    NotNaklSignatureButton.Enabled  := True;
    AddDocumentBarButton.Enabled    := True;
    SignatureNaklHistButton.Enabled := True;
    VidNaklGrid.SetFocus;
  end
 else
  begin
    IsNaklSignatureButton.Enabled   := False;
    NotNaklSignatureButton.Enabled  := False;
    AddDocumentBarButton.Enabled    := False;
    SignatureNaklHistButton.Enabled := False;
    UpdInReestrButton.Enabled       := True;
    DelInReestrButton.Enabled       := True;
  end;
end;

procedure TTaxInvoicesMainForm.VidNaklExportBarButtonClick(
  Sender: TObject);
var
  ViewForm : TExportReestrForm;
begin
  if TaxInvoicesDM.VidNaklDSet.IsEmpty then
  begin
    TiShowMessage('Увага!','Немає даних для експортування!',mtWarning,[mbOK]);
  end
  else
  begin
    ViewForm := TExportReestrForm.Create(Self,TaxInvoicesDM.DB.Handle,1);
    ViewForm.SaveDialog.FileName:='Reestr_vid_Nakl.dbf';
    ViewForm.NaklLabel.Caption := 'Експорт виданих накладних';
    ViewForm.eFileNameEdit.text := '';
    ViewForm.ShowModal;
  end;
end;

procedure TTaxInvoicesMainForm.OtrNaklExportBarButtonClick(
  Sender: TObject);
var
  ViewForm : TExportReestrForm;
begin
  if TaxInvoicesDM.OtrNaklDSet.IsEmpty then
  begin
    TiShowMessage('Увага!','Немає даних для експортування!',mtWarning,[mbOK]);
  end
  else
  begin
    ViewForm := TExportReestrForm.Create(Self,TaxInvoicesDM.DB.Handle,0);
    ViewForm.SaveDialog.FileName:='Reestr_otr_Nakl.dbf';
    ViewForm.NaklLabel.Caption := 'Експорт отриманих накладних';
    ViewForm.eFileNameEdit.text := '';
    ViewForm.ShowModal;
  end;
end;

procedure TTaxInvoicesMainForm.ReestrGridDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
  if ReestrGridDBTableView.DataController.RecordCount = 0 then exit;

  if ((AViewInfo.GridRecord.Values[0]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00CECECE;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[0]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00B7B7B7;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TTaxInvoicesMainForm.PrintBtnClick(Sender: TObject);
var
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
    begin
      if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then
        begin
          TiShowMessage('Увага!','Друкувати неможливо. Це не документ',mtWarning,[mbOK]);
          Exit;
        end;

      if ((TaxInvoicesDM.VidNaklDSet['is_document'] = 1) and (TaxInvoicesDM.VidNaklDSet['is_korig'] = 0)) then
       begin
         id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
         id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
         id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
         TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr,2);
       end;


      if ((TaxInvoicesDM.VidNaklDSet['is_document'] = 1) and (TaxInvoicesDM.VidNaklDSet['is_korig'] = 1)) then
      begin
        id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
        id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
        id_reestr      := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
        TaxInvEdit     := LoadTaxInvoicesKorigPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesKorig.bpl','View_TaxInvoicesKorig',id_VidNakl,id_VidNakl_Doc,id_reestr,4);
      end;

      {TaxInvoicesDM.ReestrDSet.Close;
      TaxInvoicesDM.VidNaklDSet.Close;
      TaxInvoicesDM.ReestrDSet.Open;
      TaxInvoicesDM.VidNaklDSet.Open;
      TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR',IntToStr(id_reestr),[]);
      TaxInvoicesDM.VidNaklDSet.Locate('ID_VID_NAKL',IntToStr(id_VidNakl),[]);  }
    end;
end;

procedure TTaxInvoicesMainForm.OldPrintBarButtonClick(Sender: TObject);
var
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
    begin
      if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then
        begin
          TiShowMessage('Увага!','Друкувати неможливо. Це не документ',mtWarning,[mbOK]);
          Exit;
        end;
      id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
      id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
      id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr,1);
    end;
end;

procedure TTaxInvoicesMainForm.NewPrint1BarButtonClick(Sender: TObject);
var
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
    begin
      if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then
        begin
          TiShowMessage('Увага!','Друкувати неможливо. Це не документ',mtWarning,[mbOK]);
          Exit;
        end;
      id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
      id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
      id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr,2);
    end;
end;

procedure TTaxInvoicesMainForm.NewPrint2ButtonClick(Sender: TObject);
var
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
    begin
      if (TaxInvoicesDM.VidNaklDSet['IS_DOCUMENT'] = 0) then
        begin
          TiShowMessage('Увага!','Друкувати неможливо. Це не документ',mtWarning,[mbOK]);
          Exit;
        end;
      id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
      id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
      id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvEdit := LoadTaxInvoicesEditPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit',id_VidNakl,id_VidNakl_Doc,id_reestr,3);
    end;
end;

procedure TTaxInvoicesMainForm.dxBarButton3Click(Sender: TObject);
var
  ViewForm : TTITaxInvoicesSetPrintForm;
  id_vid_nakl_doc : integer;
  id_vid_nakl :Integer;
begin
  if ((not(TaxInvoicesDM.VidNaklDSet.IsEmpty)) and (TaxInvoicesDM.VidNaklDSet['is_document'] = 1))then
  begin
    id_vid_nakl_doc := TaxInvoicesDM.VidNaklDSet['id_nakl_document'];
    ViewForm := TTITaxInvoicesSetPrintForm.Create(Self,TaxInvoicesDM.DB.Handle,id_vid_nakl_doc);
    ViewForm.ShowModal;
    if ViewForm.ModalResult = mrok then
    begin
      id_vid_nakl := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName                         := 'TI_SP_VID_NAKL_DOC_UPD_PRINT';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value   := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];

      if (ViewForm.IS_ISSUED_BUYER_CheckBox.Checked = true) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ISSUED_BUYER').Value   := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ISSUED_BUYER').Value   := 0;

      if (ViewForm.IS_ERPN_CheckBox.Checked = true) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ERPN').Value   := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ERPN').Value   := 0;

      if (ViewForm.IS_REMAINS_SELLER_CheckBox.Checked = true) then
      begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 1;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := ViewForm.Parameter.id_SpecialNotes;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value := ViewForm.Parameter.Name_SpecialNotes;
      end
      else
      begin
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value := '';
      end;


      if (ViewForm.IS_COPY_CheckBox.Checked = true) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_COPY').Value   := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_COPY').Value   := 0;

      if (ViewForm.IS_ISSUED_BUYER_TWO_EKZ_CheckBox.Checked = true) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ISSUED_BUYER_TWO_EKZ').Value   := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ISSUED_BUYER_TWO_EKZ').Value   := 0;
      
      if (ViewForm.IS_ERPN_TWO_EKZ_CheckBox.Checked = true) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ERPN_TWO_EKZ').Value   := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_ERPN_TWO_EKZ').Value   := 0;

      if (ViewForm.IS_REMAINS_SELLER_TWO_EKZ_CheckBox.Checked = true) then
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER_TWO_EKZ').Value   := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES_TWO_EKZ').Value   := ViewForm.Parameter.id_SpecialNotes_two_ekz;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES_TWO_EKZ').Value := ViewForm.Parameter.Name_SpecialNotes_two_ekz;
        end
      else
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES_TWO_EKZ').Value   := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES_TWO_EKZ').Value := '';
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER_TWO_EKZ').Value := 0;
        end;


      if (ViewForm.IS_COPY_TWO_EKZ_CheckBox.Checked = true) then
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_COPY_TWO_EKZ').Value   := 1
      else
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_COPY_TWO_EKZ').Value   := 0;

      //TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ViewForm.Parameter.id_SpecialNotes;
      //TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ViewForm.Parameter.Name_SpecialNotes;
      //TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES_TWO_EKZ').Value   := ViewForm.Parameter.id_SpecialNotes_two_ekz;
      //TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES_TWO_EKZ').Value := ViewForm.Parameter.Name_SpecialNotes_two_ekz;
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;

      TaxInvoicesDM.VidNaklDSet.Close;
      TaxInvoicesDM.VidNaklDSet.Open;
      TaxInvoicesDM.VidNaklDSet.FetchAll;
      TaxInvoicesDM.VidNaklDSet.Locate('ID_VID_NAKL',IntToStr(id_vid_nakl),[]);
      KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
      KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
    end;
  end
  else
  begin
    TiShowMessage('Увага!','Це не документ.',mtError,[mbOK]);
  end;

end;

procedure TTaxInvoicesMainForm.XMLBarButtonClick(
  Sender: TObject);
var
  ImportXML:Variant;
begin
  ReestrParam.Id_reestr        := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
  ReestrParam.Num_Reestr       := TaxInvoicesDM.ReestrDSet['NUM_REESTR'];
  ReestrParam.Kod_setup_Reestr := TaxInvoicesDM.ReestrDSet['KOD_SETUP_OUT'];
  ReestrParam.DATABEG_REESTR   := TaxInvoicesDM.ReestrDSet['DATABEG_REESTR'];
  ReestrParam.DATAEND_REESTR   := TaxInvoicesDM.ReestrDSet['DATAEND_REESTR'];

  ImportXML := LoadImportXMLPackage(Self,TaxInvoicesDM.DB.Handle,'TaxInvoices\ImportXML.bpl','View_ImportXML',ReestrParam);
  RefreshBtn.Click;

  TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR', IntToStr(ReestrParam.Id_reestr),[]);
 { If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];
  end; }
end;

procedure TTaxInvoicesMainForm.OrendaBarLargeButtonClick(Sender: TObject);
begin
LoadDogManedger.ShowArndSch(Self,
TaxInvoicesDM.DB.Handle,
TaxInvoicesDM.ReadTransaction.Handle,
TaxInvoicesDM.WriteTransaction.Handle,
3,
1299,
-1);
RefreshBtn.Click;
end;

procedure TTaxInvoicesMainForm.PrintReestrBarButtonClick(Sender: TObject);
const NameReport = '\Reports\TaxInvoices\ReestrPrint.fr3';
begin
 TaxInvoicesDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
 //TaxInvoicesDM.Report.DesignReport;
 //Close;
 TaxInvoicesDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesMainForm.VidNaklImportBarButtonClick(Sender: TObject);
var
  ViewForm : TImportReestrForm;
begin
    ViewForm := TImportReestrForm.Create(Self,TaxInvoicesDM.DB.Handle,1);
    //ViewForm.SaveDialog.FileName:='Reestr_vid_Nakl.dbf';
    ViewForm.NaklLabel.Caption := 'Імпорт виданих накладних';
    ViewForm.eFileNameEdit.text := '';
    ViewForm.SubdivisionButtonEdit.text := '';
    ViewForm.ShowModal;
    RefreshBtn.Click;
end;

procedure TTaxInvoicesMainForm.OtrNaklImportBarButtonClick(Sender: TObject);
var
  ViewForm : TImportReestrForm;
begin
    ViewForm := TImportReestrForm.Create(Self,TaxInvoicesDM.DB.Handle,0);
    //ViewForm.SaveDialog.FileName:='Reestr_vid_Nakl.dbf';
    ViewForm.NaklLabel.Caption := 'Імпорт отриманих накладних накладних';
    ViewForm.eFileNameEdit.text := '';
    ViewForm.SubdivisionButtonEdit.text := '';
    ViewForm.ShowModal;
    RefreshBtn.Click;
end;

procedure TTaxInvoicesMainForm.BankLargeButtonClick(Sender: TObject);
var
  ImportBank:Variant;
begin
  ReestrParam.Id_reestr        := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
  ReestrParam.Num_Reestr       := TaxInvoicesDM.ReestrDSet['NUM_REESTR'];
  ReestrParam.Kod_setup_Reestr := TaxInvoicesDM.ReestrDSet['KOD_SETUP_OUT'];

  ImportBank := LoadImportBankPackage(Self,TaxInvoicesDM.DB.Handle,'TaxInvoices\ImportBank.bpl','View_ImportBank',ReestrParam);
  RefreshBtn.Click;

  TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR', IntToStr(ReestrParam.Id_reestr),[]);
 { If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];
  end; }
end;

procedure TTaxInvoicesMainForm.ContragentFilterButtonClick(
  Sender: TObject);
var
  FilterCustomer:Variant;
begin
  FilterCustomer := LoadTaxInvoicesFilterPackage(Self,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesFilter.bpl','View_TaxInvoicesFilter',1);
 { If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];
  end; }
end;

procedure TTaxInvoicesMainForm.FilterSubdivisionButtonClick(Sender: TObject);
var
  FilterSubdivision:Variant;
begin
  FilterSubdivision := LoadTaxInvoicesFilterPackage(Self,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesFilter.bpl','View_TaxInvoicesFilter',2);
 { If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];
  end; }
end;

procedure TTaxInvoicesMainForm.FilterBudgetButtonClick(Sender: TObject);
var
  FilterBudget:Variant;
begin
  FilterBudget := LoadTaxInvoicesFilterPackage(Self,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesFilter.bpl','View_TaxInvoicesFilter',3);
 { If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];
  end; }
end;

procedure TTaxInvoicesMainForm.VidNaklGridDBTableViewDblClick(
  Sender: TObject);
begin

  UpdInReestrButton.Click;
end;

procedure TTaxInvoicesMainForm.OtrNaklGridDBTableViewDblClick(
  Sender: TObject);
begin
  UpdInReestrButton.Click;
end;

procedure TTaxInvoicesMainForm.OtrNaklGridDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
  if OtrNaklGridDBTableView.DataController.RecordCount = 0 then exit;

  if ((AViewInfo.GridRecord.Values[3]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00D3FFA8;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[3]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00ABAB58;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[21]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$007575FF;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[21] = 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=clRed;
      ACanvas.Canvas.FillRect(Arect);
   end;

   {if ((AViewInfo.GridRecord.Values[1]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00D3FFA8;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[1]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00ABAB58;
      ACanvas.Canvas.FillRect(Arect);  }
end;


procedure TTaxInvoicesMainForm.IsEditButtonClick(Sender: TObject);
var
  id_vid_nakl : Integer;
  id_otr_nakl : Integer;
begin
  // выданные налоговые накладные
 if (NaklPageControl.ActivePage=VidNaklTabSheet) then
 begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty)then
  begin
    try
      begin
        if (is_admin = 0) then
        begin
          If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','SIGN') <> 0) then
          begin
            TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
            Exit;
          end
          else
          begin
            if (TaxInvoicesUser.id_user <> TaxInvoicesDM.VidNaklDSet['id_user_create'])then
            begin
              TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
              Exit;
            end;
          end;
        end;
        id_vid_nakl := TaxInvoicesDM.VidNaklDSet['id_vid_nakl'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_IS_EDIT_NAKL';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value  := id_vid_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value       := 1;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EDIT').Value      := TaxInvoicesDM.VidNaklDSet['is_edit'];
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.WriteTransaction.Commit;

        TaxInvoicesDM.VidNaklDSet.Close;
        TaxInvoicesDM.SignatureNaklDSet.Close;
        TaxInvoicesDM.SignatureNaklDSet.SelectSQL.Text   := 'select * from TI_SIGNATURE_DOCUMENT_HIST_SEL(?ID_VID_NAKL)';
        TaxInvoicesDM.VidNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.FetchAll;
        TaxInvoicesDM.SignatureNaklDSet.Open;
        TaxInvoicesDM.VidNaklDSet.Locate('id_vid_nakl',IntToStr(id_vid_nakl),[]);
        KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
        KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
        TiShowMessage('Увага!','Помітка зроблена.',mtWarning,[mbOK]);
      end;
    except
        begin
          TiShowMessage('Виникла помилка!','Накладну не підписано.',mtError,[mbOK]);
          TaxInvoicesDM.WriteTransaction.Rollback;
        end;
    end;
  end;
 end;
//полученные налоговые накладные
  if (NaklPageControl.ActivePage=OtrNaklTabSheet) then
 begin
  if not (TaxInvoicesDM.OtrNaklDSet.IsEmpty)then
  begin
    try
      begin
        if (is_admin = 0) then
        begin
          If (fibCheckPermission('/ROOT/TaxInvoices/Reestr_TaxInvoices','SIGN') <> 0) then
          begin
            TiShowMessage('Увага!','Вам недостатньо прав зробити цю дію!',mtError,[mbOK]);
            Exit;
          end
          else
          begin
            if (TaxInvoicesUser.id_user <> TaxInvoicesDM.OtrNaklDSet['id_user_create'])then
            begin
              TiShowMessage('Увага!','Ви не створювали цю накладну! Зверніться до адміністратора.',mtError,[mbOK]);
              Exit;
            end;
          end;
        end;
        id_otr_nakl := TaxInvoicesDM.OtrNaklDSet['id_otr_nakl'];
        TaxInvoicesDM.WriteTransaction.StartTransaction;
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                := 'TI_IS_EDIT_NAKL';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value  := id_otr_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EDIT').Value  := TaxInvoicesDM.OtrNaklDSet['is_edit'];
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        TaxInvoicesDM.WriteTransaction.Commit;

        TaxInvoicesDM.OtrNaklDSet.Close;
        TaxInvoicesDM.OtrNaklDSet.Open;
        TaxInvoicesDM.OtrNaklDSet.FetchAll;

        TaxInvoicesDM.OtrNaklDSet.Locate('id_otr_nakl',IntToStr(id_otr_nakl),[]);
        KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
        TiShowMessage('Увага!','Помітка зроблена.',mtWarning,[mbOK]);
      end;
    except
        begin
          TiShowMessage('Виникла помилка!','Накладну не підписано.',mtError,[mbOK]);
          TaxInvoicesDM.WriteTransaction.Rollback;
        end;
    end;
  end;
 end;

end;

procedure TTaxInvoicesMainForm.KorigButtonClick(Sender: TObject);
var
  TaxInvEdit     : TTITaxInvoicesInfo;
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
begin
  id_VidNakl := -1;
  id_VidNakl_Doc := -1;
  id_reestr  := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
  TaxInvEdit := LoadTaxInvoicesKorigPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesKorig.bpl','View_TaxInvoicesKorig',id_VidNakl,id_VidNakl_Doc,id_reestr,0);
  id_VidNakl_Doc := TaxInvEdit.id_vid_nakl_doc;
  TaxInvoicesDM.ReestrDSet.Close;
  TaxInvoicesDM.VidNaklDSet.Close;
  TaxInvoicesDM.SignatureNaklDSet.Close;
  TaxInvoicesDM.ReestrDSet.Open;
  TaxInvoicesDM.VidNaklDSet.Open;
  TaxInvoicesDM.VidNaklDSet.FetchAll;
  TaxInvoicesDM.SignatureNaklDSet.Open;
  TaxInvoicesDM.ReestrDSet.Locate('ID_REESTR', id_reestr,[]);
  TaxInvoicesDM.VidNaklDSet.Locate('id_vid_nakl', id_VidNakl_Doc,[]);
  KolvoVidValueLabel.Caption := inttostr(TaxInvoicesDM.VidNaklDSet.RecordCount);
  KolvoOtrValeuLabel.Caption := inttostr(TaxInvoicesDM.OtrNaklDSet.RecordCount);
end;

procedure TTaxInvoicesMainForm.PrintKorigButtonClick(Sender: TObject);
var
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
  begin
    if ((TaxInvoicesDM.VidNaklDSet['is_document'] = 1) and (TaxInvoicesDM.VidNaklDSet['is_korig'] = 1)) then
    begin
      id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
      id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
      id_reestr      := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvEdit     := LoadTaxInvoicesKorigPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesKorig.bpl','View_TaxInvoicesKorig',id_VidNakl,id_VidNakl_Doc,id_reestr,4);
    end;
  end;
end;



procedure TTaxInvoicesMainForm.PrintReestrOtrButtonClick(Sender: TObject);
const NameReport = '\Reports\TaxInvoices\ReestrPrintOtr.fr3';
begin
 TaxInvoicesDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
 //TaxInvoicesDM.Report.DesignReport;
 //Close;
 TaxInvoicesDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesMainForm.dxBarButton4Click(Sender: TObject);
var
  FilterCustomer:Variant;
begin
  FilterCustomer := LoadTaxInvoicesFilterPackage(Self,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesFilter.bpl','View_TaxInvoicesFilter',4);
 { If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];
  end; }
end;

procedure TTaxInvoicesMainForm.ExportnaklXmlButton5Click(Sender: TObject);
var
  ViewForm : TExportNaklForm;
begin
  if TaxInvoicesDM.VidNaklDSet.IsEmpty then
  begin
    TiShowMessage('Увага!','Немає даних для експортування!',mtWarning,[mbOK]);
  end
  else
  begin
    ViewForm := TExportNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,1);
    ViewForm.SaveDialog.FileName:='vid_Nakl.xml';
    ViewForm.eFileNameEdit.text := '';
    ViewForm.ShowModal;
  end;
end;

procedure TTaxInvoicesMainForm.PrintKorigTwoEkzButtonClick(
  Sender: TObject);
var
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
begin
  if not (TaxInvoicesDM.VidNaklDSet.IsEmpty) then
  begin
    if ((TaxInvoicesDM.VidNaklDSet['is_document'] = 1) and (TaxInvoicesDM.VidNaklDSet['is_korig'] = 1)) then
    begin
      id_VidNakl     := TaxInvoicesDM.VidNaklDSet['ID_VID_NAKL'];
      id_VidNakl_Doc := TaxInvoicesDM.VidNaklDSet['ID_NAKL_DOCUMENT'];
      id_reestr      := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvEdit     := LoadTaxInvoicesKorigPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxInvoicesKorig.bpl','View_TaxInvoicesKorig',id_VidNakl,id_VidNakl_Doc,id_reestr,5);
    end;
  end;
end;

procedure TTaxInvoicesMainForm.ViewButtonClick(Sender: TObject);
var
  ViewForm       : TTITaxInvoicesAddVidNaklForm;
  ViewFormImport : TTITaxInvoicesUpdVidNaklImportForm;
  ViewFormOtr    : TTITaxInvoicesAddOtrNaklForm;
  AddParametr    : TTITaxInvoicesAddVidNakl;
  AddParametrImport : TTITaxInvoicesUpdImportVidNakl;
  AddParametrOtr : TTITaxInvoicesAddOtrNakl;
  id_vid_nakl    : Integer;
  TaxInvEdit     : TTITaxInvoicesInfo;
  id_VidNakl     : Integer;
  id_VidNakl_Doc : Integer;
  id_reestr      : Integer;
  id_otr_Nakl,i  : Integer;
  KEY_SESSION    : Int64;
  STRU           : KERNEL_MODE_STRUCTURE;
  DoResult       : Boolean;
  ErrorList      : TStringList;
  s              : string;
  j              : integer;
  workdate       : TDate;
  pk_id          : int64;
  pk_id_old      : Int64;
  sum_All_Nds    : Double;
  sum_All_Not_NDS : Double;
begin
  if (NaklPageControl.ActivePage=OtrNaklTabSheet)then
  begin
      if (TaxInvoicesDM.OtrNaklDSet['id_taxliabilities'] = null) then
       begin
        AddParametrOtr.id_Kod   := 0;
        AddParametrOtr.Name_Kod := '';
       end
      else
       begin
        AddParametrOtr.id_Kod   := TaxInvoicesDM.OtrNaklDSet['id_taxliabilities'];
        AddParametrOtr.Name_Kod := TaxInvoicesDM.OtrNaklDSet['name_taxliabilities'];
       end;

      if (TaxInvoicesDM.OtrNaklDSet['id_type_document'] = null) then
       begin
        AddParametrOtr.Id_TypeDocument   := 0;
        AddParametrOtr.Name_TypeDocument := '';
       end
      else
       begin
        AddParametrOtr.Id_TypeDocument   := TaxInvoicesDM.OtrNaklDSet['id_type_document'];
        AddParametrOtr.Name_TypeDocument := TaxInvoicesDM.OtrNaklDSet['name_type_document'];
       end;

      AddParametrOtr.Id_Customer       := TaxInvoicesDM.OtrNaklDSet['id_provider'];
      AddParametrOtr.Name_Customer     := TaxInvoicesDM.OtrNaklDSet['name_provider'];
      AddParametrOtr.IPNCustomer       := TaxInvoicesDM.OtrNaklDSet['ipn_provider'];
      AddParametrOtr.IsKorig           := TaxInvoicesDM.OtrNaklDSet['is_korig'];
      AddParametrOtr.IsExpansion       := TaxInvoicesDM.OtrNaklDSet['is_expansion'];

      ViewFormOtr := TTITaxInvoicesAddOtrNaklForm.Create(Self,TaxInvoicesDM.DB.Handle,AddParametrOtr);
      ViewFormOtr.DateVipDateEdit.Date             := TaxInvoicesDM.OtrNaklDSet['data_vipiski'];
      ViewFormOtr.DateOtrDateEdit.Date             := TaxInvoicesDM.OtrNaklDSet['data_otr'];
      ViewFormOtr.NumOrderTextEdit.Text            := TaxInvoicesDM.OtrNaklDSet['num_order'];
      ViewFormOtr.NumNaklTextEdit.Text             := TaxInvoicesDM.OtrNaklDSet['num_nakl'];
      ViewFormOtr.KodButtonEdit.Text               := AddParametrOtr.Name_Kod;
      ViewFormOtr.ProviderButtonEdit.Text          := AddParametrOtr.Name_Customer;
      ViewFormOtr.IPNProviderTextEdit.Text         := AddParametrOtr.IPNCustomer;
      ViewFormOtr.FullNameMemo.Text                := AddParametrOtr.Name_Customer;
      ViewFormOtr.TypeDocumentButtonEdit.Text      := AddParametrOtr.Name_TypeDocument;
      ViewFormOtr.Caption := GetConst('TaxInvEditUpd',tcForm);

      if not (AddParametrOtr.id_Kod = 0) then
            ViewFormOtr.SummaEnabled(AddParametrOtr.id_Kod); //єнейблим суммы

      if (TaxInvoicesDM.OtrNaklDSet['is_korig']=1) then
        ViewFormOtr.IsKorigCheckBox.Checked := True
      else
        ViewFormOtr.IsKorigCheckBox.Checked := False;

      if (TaxInvoicesDM.OtrNaklDSet['is_expansion']=1) then
        ViewFormOtr.IsExpansionCheckBox.Checked := True
      else
        ViewFormOtr.IsExpansionCheckBox.Checked := False;

      if ((TaxInvoicesDM.OtrNaklDSet['OZNAKA1'] = null) or (TaxInvoicesDM.OtrNaklDSet['OZNAKA1'] = '') ) then
        begin
          ViewFormOtr.Oznaka1TextEdit.Enabled := false;
          ViewFormOtr.Oznaka1CheckBox.Checked := false;
          ViewFormOtr.Oznaka1TextEdit.Text := '';
        end
      else
        begin
          ViewFormOtr.Oznaka1TextEdit.Enabled := True;
          ViewFormOtr.Oznaka1CheckBox.Checked := True;
          ViewFormOtr.Oznaka1TextEdit.Text    := TaxInvoicesDM.OtrNaklDSet['OZNAKA1']
        end;

      if ((TaxInvoicesDM.OtrNaklDSet['OZNAKA2'] = null) or (TaxInvoicesDM.OtrNaklDSet['OZNAKA2'] = '') ) then
        begin
          ViewFormOtr.Oznaka2TextEdit.Enabled := false;
          ViewFormOtr.Oznaka2CheckBox.Checked := false;
          ViewFormOtr.Oznaka2TextEdit.Text := '';
        end
      else
        begin
          ViewFormOtr.Oznaka2TextEdit.Enabled := True;
          ViewFormOtr.Oznaka2CheckBox.Checked := True;
          ViewFormOtr.Oznaka2TextEdit.Text := TaxInvoicesDM.OtrNaklDSet['OZNAKA2'];
        end;

      ViewFormOtr.summa_20_0_not_pdv_CurrencyEdit.Text       := TaxInvoicesDM.OtrNaklDSet['summa_20_0_not_pdv'];
      ViewFormOtr.summa_20_0_pdv_CurrencyEdit.Text           := TaxInvoicesDM.OtrNaklDSet['summa_20_0_pdv'];
      ViewFormOtr.summa_exempt_not_pdv_CurrencyEdit.Text     := TaxInvoicesDM.OtrNaklDSet['summa_exempt_not_pdv'];
      ViewFormOtr.summa_exempt_pdv_CurrencyEdit.Text         := TaxInvoicesDM.OtrNaklDSet['summa_exempt_pdv'];
      ViewFormOtr.summa_econ_activ_not_pdv_CurrencyEdit.Text := TaxInvoicesDM.OtrNaklDSet['summa_econ_activ_not_pdv'];
      ViewFormOtr.summa_econ_activ_pdv_CurrencyEdit.Text     := TaxInvoicesDM.OtrNaklDSet['summa_econ_activ_pdv'];
      ViewFormOtr.summa_delivery_not_pdv_CurrencyEdit.Text   := TaxInvoicesDM.OtrNaklDSet['summa_delivery_not_pdv'];
      ViewFormOtr.summa_delivery_pdv_CurrencyEdit.Text       := TaxInvoicesDM.OtrNaklDSet['summa_delivery_pdv'];
      // отображение проводок
      for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
      TaxInvoicesDM.RxMemoryData_smet.Delete;

      TaxInvoicesDM.Smeta_Vid_N_DSet.Close;
      TaxInvoicesDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 0';
      TaxInvoicesDM.Smeta_Vid_N_DSet.ParamByName('id').Value := TaxInvoicesDM.OtrNaklDSet['id_otr_nakl'];
      TaxInvoicesDM.Smeta_Vid_N_DSet.Open;
      TaxInvoicesDM.Smeta_Vid_N_DSet.FetchAll;
      TaxInvoicesDM.Smeta_Vid_N_DSet.First;
      sum_All_Nds     := 0;
      sum_All_Not_NDS := 0;
      for i := 0 to TaxInvoicesDM.Smeta_Vid_N_DSet.RecordCount-1 do
      begin
        TaxInvoicesDM.RxMemoryData_smet.Open;
        TaxInvoicesDM.RxMemoryData_smet.Insert;
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_smet'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_razd'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_stat'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['sum_smet'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_smet'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_razd'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_stat'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_smety'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_razd'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesDM.Smeta_Vid_N_DSet['n_stat'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesDM.Smeta_Vid_N_DSet['id_kekv'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['kod_kekv'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesDM.Smeta_Vid_N_DSet['name_kekv'];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('is_lgota').Value  := TaxInvoicesDM.Smeta_Vid_N_DSet['is_lgota'];
        TaxInvoicesDM.RxMemoryData_smet.Post;
        TaxInvoicesDM.Smeta_Vid_N_DSet.Next;

        if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
          sum_All_Nds     := sum_All_Nds + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value
        else
          sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
      end;
      if TaxInvoicesDM.Smeta_Vid_N_DSet.IsEmpty = True then
        begin
          ViewFormOtr.Label21.Caption := '';
          ViewFormOtr.Label22.Caption := '';
          ViewFormOtr.Label23.Caption := '';
          ViewFormOtr.Label26.Caption := '';
          ViewFormOtr.LabelNotPDV.Caption := '';
          ViewFormOtr.LabelPDV.Caption := '';
        end
      else
        begin
          ViewFormOtr.LabelNotPDV.Caption := Floattostr(sum_All_Not_NDS);
          ViewFormOtr.LabelPDV.Caption := Floattostr(sum_All_Nds);
        end;

      if TaxInvoicesDM.OtrNaklDSet['pk_id']= null
      then pk_id := 0
      else pk_id := TFIBBCDField( TaxInvoicesDM.OtrNaklDSet.FieldByName('pk_id')).AsInt64;

      if (pk_id = -1)
      then
        ViewFormOtr.provodka := False
      else
        ViewFormOtr.provodka := True;

      ViewFormOtr.YesButton.Visible := False;

      ViewFormOtr.ShowModal;
  end;
end;

procedure TTaxInvoicesMainForm.dxBarLargeButton1Click(Sender: TObject);
var
  ViewForm : TFormParamEducation;
  id_reg : Integer;
begin
  ViewForm := TFormParamEducation.Create(Self);
  ViewForm.cxDateEditWorkDate.Date := Now;
  ViewForm.RadioButtonEducation.Checked := True;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok)then
  begin   
    if (ViewForm.RadioButtonEducation.Checked = true) then
      id_reg := TaxInvoicesDM.DSet['ID_REG_UCH_EDUCATION']
    else
      id_reg := TaxInvoicesDM.DSet['ID_REG_UCH_ST_CITY'];

      UPCPackMan.ShowNaklForm(Self, TaxInvoicesDM.db.Handle, ViewForm.cxDateEditWorkDate.Date, id_reg, TaxInvoicesUser.id_user);
  end;  
end;

end.
