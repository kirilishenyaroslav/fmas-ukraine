unit gr_Stud_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, gr_uCommonConsts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, gr_Stud_DM,
  dxStatusBar, ZcxLocateBar, gr_uMessage, cxGridBandedTableView,
  cxGridDBBandedTableView, cxCurrencyEdit, gr_uCommonLoader, gr_uCommonProc,
  gr_dmCommonStyles, cxRadioGroup, cxCheckBox, Registry, gr_AccDepart,
  Menus, dxsbar, gr_Grant_Ctrl_MainForm, gr_PeoplePrint,
  RxMemDs, DateUtils, ZWait,gr_uWaitForm,gr_Stud_Filter,gr_uCommonTypes,
  gr_Filter_DateSTFOND, gr_FilterDate, AccMgmt, BaseTypes,  XLSReadWriteII2,XLSFonts2,
  CellFormats2,BIFFRecsII2,XLSNames2,XLSUtils2,CellAreas2,
  FormulaHandler2, XLSStream2;




type
  TFStud = class(TForm)
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    cxSplitter1: TcxSplitter;
    dxStatusBar1: TdxStatusBar;
    PanelPeople: TPanel;
    ActionList: TActionList;
    SystemAction: TAction;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
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
    dxStatusBar2: TdxStatusBar;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    LineViewBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    BarDockControlFilter: TdxBarDockControl;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    YesUseBtn: TdxBarButton;
    FilterBtn: TdxBarButton;
    dxBarStatic4: TdxBarStatic;
    LabelFilter: TdxBarStatic;
    dxBarStatic6: TdxBarStatic;
    UseCotractsStatic: TdxBarStatic;
    NoUseBtn: TdxBarButton;
    CtrlInsertBtn: TdxBarLargeButton;
    dxBarStatic7: TdxBarStatic;
    CtrlUpdateBtn: TdxBarLargeButton;
    CtrlDeleteBtn: TdxBarLargeButton;
    CtrlDetailBtn: TdxBarLargeButton;
    AcctCardBtn: TdxBarLargeButton;
    dxBarStatic8: TdxBarStatic;
    BroadFilterBtn: TdxBarButton;
    ShifrBtn: TdxBarLargeButton;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClShifr: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClTypePayment: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    SideBarPopupMenu: TdxSideBarPopupMenu;
    AddGrantBtn: TMenuItem;
    AddTermsBtn: TMenuItem;
    PrintBtn: TdxBarLargeButton;
    BarPopupMenu: TdxBarPopupMenu;
    BarBtnGrantPrint: TdxBarButton;
    BarBtnPrintCat: TdxBarButton;
    BarBtnPrintKurs: TdxBarButton;
    UpdateDepAll: TMenuItem;
    cxStyle31: TcxStyle;
    dxBarButton1: TdxBarButton;
    ButtonFilter: TdxBarLargeButton;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarFontNameCombo1: TdxBarFontNameCombo;
    dxBarStatic9: TdxBarStatic;
    dxBarButton2: TdxBarButton;
    dxBarStatic5: TdxBarStatic;
    ButtonDepFilt: TdxBarButton;
    Panel1: TPanel;
    PageControlChild: TPageControl;
    TabSheetGrantData: TTabSheet;
    PanelChild: TPanel;
    Grid2: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2ClDateBeg: TcxGridDBColumn;
    Grid2ClDateEnd: TcxGridDBColumn;
    Grid2ClContract: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    PanelPageControl: TPanel;
    PageControl: TPageControl;
    TabSheetTerms: TTabSheet;
    Grid31: TcxGrid;
    Grid31DBTableView1: TcxGridDBTableView;
    GridClKodDepartment: TcxGridDBColumn;
    GridClDepartment: TcxGridDBColumn;
    GridClCatStud: TcxGridDBColumn;
    GridClKurs: TcxGridDBColumn;
    GridClDateBeg: TcxGridDBColumn;
    GridClDateEnd: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel31: TPanel;
    cxLabel1: TcxLabel;
    DBEditFac: TcxDBTextEdit;
    TabSheetGrants: TTabSheet;
    Grid32: TcxGrid;
    Grid32DBTableView1: TcxGridDBTableView;
    Grid32ClKodVo: TcxGridDBColumn;
    Grid32ClNameVO: TcxGridDBColumn;
    Grid32ClDateBeg: TcxGridDBColumn;
    Grid32ClDateEnd: TcxGridDBColumn;
    Grid32ClSumma: TcxGridDBColumn;
    Grid32ClSmeta: TcxGridDBColumn;
    Grid32ClBal: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel32: TPanel;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelSmeta: TcxLabel;
    TabSheetCurrent: TTabSheet;
    Grid33: TcxGrid;
    Grid33DBTableView1: TcxGridDBTableView;
    Grid33ClKodSetupTemp: TcxGridDBColumn;
    Grid33ClKodSetup: TcxGridDBColumn;
    Grid33ClKodVidopl: TcxGridDBColumn;
    Grid33ClNameVidopl: TcxGridDBColumn;
    Grid33ClSumma: TcxGridDBColumn;
    Grid33ClKodSmeta: TcxGridDBColumn;
    Grid33ClKodDepartment: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Splitter33: TcxSplitter;
    Panel33: TPanel;
    EditDepartment: TcxDBMaskEdit;
    EditPrikaz: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    Label33Smeta: TcxLabel;
    LabelDepartment: TcxLabel;
    LabelPrikaz: TcxLabel;
    TabSheetVacation: TTabSheet;
    cxGrid34: TcxGrid;
    Grid34DBTableView1: TcxGridDBTableView;
    Grid34ClDateBeg: TcxGridDBColumn;
    Grid34ClDateEnd: TcxGridDBColumn;
    Grid34ClPrikaz: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter2: TcxSplitter;
    TabSheetAlimony: TTabSheet;
    Grid22: TcxGrid;
    Grid22DBTableView1: TcxGridDBTableView;
    Grid22ClDolg: TcxGridDBColumn;
    Grid22ClDateBeg: TcxGridDBColumn;
    Grid22ClDateEnd: TcxGridDBColumn;
    Grid22ClPercent: TcxGridDBColumn;
    Grid22ClMaxPercent: TcxGridDBColumn;
    Grid22ClPochtaPercent: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    Splitter3: TcxSplitter;
    Panel3: TPanel;
    EditDocument: TcxDBMaskEdit;
    LabelDocument: TcxLabel;
    SendPeopleLabel: TcxLabel;
    SendPeopleEdit: TcxDBMaskEdit;
    SendAdressEdit: TcxDBMaskEdit;
    SendAdressLabel: TcxLabel;
    TabSheetProp: TTabSheet;
    GridPeopleProp: TcxGrid;
    GridPeoplePropDBTableView1: TcxGridDBTableView;
    GridPeoplePropClPropName: TcxGridDBColumn;
    GridPeoplePropClDateBeg: TcxGridDBColumn;
    GridPeoplePropClDateEnd: TcxGridDBColumn;
    GridPeoplePropLevel1: TcxGridLevel;
    TabSheetIndex: TTabSheet;
    Gridindex: TcxGrid;
    GridindexDBTableView1: TcxGridDBTableView;
    GridindexDBTableView1DBColumnKodSetup: TcxGridDBColumn;
    GridindexDBTableView1DBColumnBaseKodSetup: TcxGridDBColumn;
    GridindexDBTableView1DBColumnIndex: TcxGridDBColumn;
    GridindexDBTableView1DBColumnLifeMin: TcxGridDBColumn;
    GridindexDBTableView1DBColumnSumma: TcxGridDBColumn;
    GridindexDBTableView1DBColumnhandEdit: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    GridindexDBTableView1DBColumn1: TcxGridDBColumn;
    GridindexDBTableView1DBColumn2: TcxGridDBColumn;
    GridindexDBTableView1DBColumn3: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    ExportStud: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure ExitBtnClick(Sender: TObject);
    procedure AddManBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SystemActionExecute(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CtrlInsertBtnClick(Sender: TObject);
    procedure dxStatusBar1Resize(Sender: TObject);
    procedure dxStatusBar2Resize(Sender: TObject);
    procedure CtrlUpdateBtnClick(Sender: TObject);
    procedure CtrlDeleteBtnClick(Sender: TObject);
    procedure CtrlDetailBtnClick(Sender: TObject);
    procedure Panel32Resize(Sender: TObject);
    procedure PageControlChildChange(Sender: TObject);
    procedure Grid2ClContractGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Panel33Resize(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure Grid33ClKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid31DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure AcctCardBtnClick(Sender: TObject);
    procedure ClearCurrentBuffer(Sender:TObject);
    procedure BroadFilterBtnClick(Sender: TObject);
    procedure Grid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure Panel31Resize(Sender: TObject);
    procedure ShifrBtnClick(Sender: TObject);
    procedure AddGrantBtnClick(Sender: TObject);
    procedure AddTermsBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BarBtnGrantPrintClick(Sender: TObject);
    procedure BarBtnPrintCatClick(Sender: TObject);
    procedure BarBtnPrintKursClick(Sender: TObject);
    procedure UpdateDepAllClick(Sender: TObject);
    procedure Grid31DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure Grid32DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure Grid2DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure Grid33DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ButtonFilterClick(Sender: TObject);
    procedure ButtonDepFilterClick(Sender: TObject);
    procedure GridindexDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormShow(Sender: TObject);
    procedure GridindexDBTableView1DBColumn3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure ExportStudClick(Sender: TObject);
  private
    DM:TDM;
    StylesDM:TStylesDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PParamFilter:TParamFilter;
    PWidth33:word;
    PWidth32:word;
    PWidth22:word;
    PWidth31:word;
    ViewForm:TfGrAccDepart;
    Filter:variant;
  public
    xls:TXLSReadWriteII2;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ParamFilter:TParamFilter);reintroduce;
    procedure InitializeLabelFilter;
    procedure makeBorders(col:integer; row:integer);

  end;



implementation

uses Math, FIBQuery;

{$R *.dfm}
const NameReport               = 'PeoplePrint.fr3';

constructor TFStud.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ParamFilter:TParamFilter);
var i:byte;
wf:TForm;
text:string;
begin
 inherited Create(AOwner);
 PLanguageIndex                := IndexLanguage;
 PWidth33                      := Panel33.Width-EditPrikaz.Width;
 PWidth32                      := Panel32.Width - DBMaskEditSmeta.Width;
 PWidth22                      := Panel3.Width - EditDocument.Width;
 PWidth31                      := Panel31.Width-DBEditFac.Width;
//******************************************************************************
 Caption                       := DataStud_Caption[PLanguageIndex];
 AddManBtn.Caption             := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption            := RefreshBtn_Caption[PLanguageIndex];
 InsertBtn.Caption             := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption             := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption             := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption             := DetailBtn_Caption[PLanguageIndex];
 CtrlInsertBtn.Caption         := InsertBtn_Caption[PLanguageIndex];
 CtrlUpdateBtn.Caption         := UpdateBtn_Caption[PLanguageIndex];
 CtrlDeleteBtn.Caption         := DeleteBtn_Caption[PLanguageIndex];
 CtrlDetailBtn.Caption         := DetailBtn_Caption[PLanguageIndex];
 ButtonFilter.Caption          := Filter_Text[PLanguageIndex];
 ExitBtn.Caption               := ExitBtn_Caption[PLanguageIndex];
 AcctCardBtn.Caption           := LabelAcctCard_Caption[PLanguageIndex];
 UseCotractsStatic.Caption     := LabelShowContracts_Caption[PLanguageIndex]+':';
 ButtonDepFilt.Caption       := LabelDepartment_Caption[PLanguageIndex];
//******************************************************************************
 Grid1ClFIO.Caption            := GridClFIO_Caption[PLanguageIndex];
 Grid1ClShifr.Caption          := GridClShifr_Caption[PLanguageIndex];
 Grid1ClTypePayment.Caption     := GridClTypePayment_Caption[PLanguageIndex];
//******************************************************************************
 Grid2ClDateBeg.Caption        := GridClDateBeg_Caption[PLanguageIndex];
 Grid2ClDateEnd.Caption        := GridClDateEnd_Caption[PLanguageIndex];
 Grid2ClContract.Caption       := Foundation_Text[PLanguageIndex];
//******************************************************************************
 Grid22ClDolg.Caption          := GridClDolg_Caption[PLanguageIndex];
 Grid22ClPercent.Caption       := GridClPercent_Caption[PLanguageIndex];
 Grid22ClMaxPercent.Caption    := GridClMaxPercent_Caption[PLanguageIndex];
 Grid22ClPochtaPercent.Caption := GridClPochtaPercent_Caption[PLanguageIndex];
 Grid22ClDateBeg.Caption       := GridClDateBeg_Caption[PLanguageIndex];
 Grid22ClDateEnd.Caption       := GridClDateEnd_Caption[PLanguageIndex];
 LabelDocument.Caption         := LabelDocument_Caption[PLanguageIndex];
 SendPeopleLabel.Caption       := LabelSendPeople_Caption[PLanguageIndex];
 SendAdressLabel.Caption       := LabelSendAdress_Caption[PLanguageIndex];
//******************************************************************************
 GridClKodDepartment.Caption   := LabelKod_Caption[PLanguageIndex];
 GridClDepartment.Caption      := LabelnameDepartment_Caption[PLanguageIndex];
 GridClDateBeg.Caption         := GridClDateBeg_Caption[PLanguageIndex];
 GridClDateEnd.Caption         := GridClDateEnd_Caption[PLanguageIndex];
 GridClKurs.Caption            := LabelKurs_Caption[PLanguageIndex];
 GridClCatStud.Caption         := GridClCategory_Caption[PLanguageIndex];
//******************************************************************************
 Grid32ClKodVo.Caption         := GridClKodVo_Caption[PLanguageIndex];
 Grid32ClNameVO.Caption        := GridClNameVo_Caption[PLanguageIndex];
 Grid32ClDateBeg.Caption       := GridClDateBeg_Caption[PLanguageIndex];
 Grid32ClDateEnd.Caption       := GridClDateEnd_Caption[PLanguageIndex];
 Grid32ClSumma.Caption         := LabelSumma_Caption[PLanguageIndex];
 Grid32ClBal.Caption           := LabelBal_Caption[PLanguageIndex];
 Grid32ClSmeta.Caption         := GridClKodSmeta_Caption[PLanguageIndex];
 LabelSmeta.Caption            := LabelSmeta_Caption[PLanguageIndex];
//******************************************************************************
 Grid33ClKodVidopl.Caption     := GridClKodVo_Caption[PLanguageIndex];
 Grid33ClNameVidopl.Caption    := GridClNameVo_Caption[PLanguageIndex];
 Grid33ClSumma.Caption         := LabelSumma_Caption[PLanguageIndex];
 Grid33ClKodSmeta.Caption      := GridClKodSmeta_Caption[PLanguageIndex];
 Grid33ClKodDepartment.Caption := GridClKodDepartment_Caption[PLanguageIndex];
 Grid33ClKodSetup.Caption      := LabelPeriod_Caption[PLanguageIndex];
 LabelPrikaz.Caption           := LabelPrikaz_Caption[PLanguageIndex];
 Label33Smeta.Caption          := LabelSmeta_Caption[PLanguageIndex];
 LabelDepartment.Caption       := LabelDepartment_Caption[PLanguageIndex];
 //****************************************************************************** //Art
 Grid34ClDateBeg.Caption       := GridClDateBegVac_Caption[PLanguageIndex];
 Grid34ClDateEnd.Caption       := GridClDateEndVac_Caption[PLanguageIndex];
 Grid34ClPrikaz.Caption        := GridClPrikazVac_Caption[PLanguageIndex];
 //******************************************************************************
 GridindexDBTableView1DBColumnKodSetup.Caption        :=GridPeriodCalc_Caption[PLanguageIndex];
 GridindexDBTableView1DBColumnBaseKodSetup.Caption    :=BasePeriod_Caption[PLanguageIndex];
 GridindexDBTableView1DBColumnIndex.Caption           :=GridIndexInfl_Caption[PLanguageIndex];
 GridindexDBTableView1DBColumnLifeMin.Caption         :=GridLiveMin_Caption[PLanguageIndex];
 GridindexDBTableView1DBColumnSumma.Caption           :=GridClSumma_Stud_Caption[PLanguageIndex];
 GridindexDBTableView1DBColumnhandEdit.Caption        :=GridHandEdit_Caption[PLanguageIndex];
 //******************************************************************************
 TabSheetGrantData.Caption     := GrantData_Text[PLanguageIndex];
 TabSheetAlimony.Caption       := AlimonyData_Text[PLanguageIndex];
 TabSheetProp.Caption          := ZPeopleProp_Caption[PLanguageIndex];
 TabSheetGrants.Caption        := Grant_Text[PLanguageIndex];
 TabSheetCurrent.Caption       := Current_Text[PLanguageIndex];
 TabSheetTerms.Caption         := Terms_Text[PLanguageIndex];
 TabSheetVacation.Caption      := Vacation_Text[PLanguageIndex];
 TabSheetIndex.Caption         := GrantIndexation_Text[PLanguageIndex];
//******************************************************************************
//PeopleProp
//******************************************************************************
 GridPeoplePropClPropName.Caption    := GridClPropertyName_Caption[PLanguageIndex];
 GridPeoplePropClDateBeg.Caption     := GridClBegPeriod_Caption[PLanguageIndex];
 GridPeoplePropClDateEnd.Caption     := GridClEndPeriod_Caption[PLanguageIndex];
//******************************************************************************
 GridPeoplePropClPropName.DataBinding.FieldName   := 'NAME_PEOPLE_PROP';
 GridPeoplePropClDateBeg.DataBinding.FieldName    := 'DATE_BEG';
 GridPeoplePropClDateEnd.DataBinding.FieldName    := 'DATE_END';
 PParamFilter:=ParamFilter;

 InitializeLabelFilter;
 wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
//******************************************************************************
 DM := TDM.Create(self,Db_Handle,PParamFilter);
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DM.DSet1;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('FIO',Grid1ClFIO.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('TIN',Grid1ClTin.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TIN';
 PBarLocate.FieldSelectVisible := False;
 PBarLocate.DockControl := BarDockLocate;
                                                  
//******************************************************************************
 dxStatusBar1.Panels[0].Text:= 'Ctrl+Ins-'+AddManBtn.Caption;
 dxStatusBar1.Panels[1].Text:= 'Ins-'+InsertBtn.Caption;
 dxStatusBar1.Panels[2].Text:= 'F2-'+UpdateBtn.Caption;
 dxStatusBar1.Panels[3].Text:= 'Del-'+DeleteBtn.Caption;
 dxStatusBar1.Panels[4].Text:= 'Space-'+DetailBtn.Caption;
 dxStatusBar1.Panels[5].Text:= 'F5-'+RefreshBtn.Caption;
 dxStatusBar1.Panels[6].Text:= 'F8-'+FilterBtn.Caption;

 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

 dxStatusBar2.Panels[0].Text:= 'F7-'+PBarLocate.LocateBtn.Caption;
 dxStatusBar2.Panels[1].Text:= 'Ctrl+F7-'+PBarLocate.LocateNextBtn.Caption;
 dxStatusBar2.Panels[2].Text:= 'Shift+Ins-'+CtrlInsertBtn.Caption;
 dxStatusBar2.Panels[3].Text:= 'Shift+F2-'+CtrlUpdateBtn.Caption;
 dxStatusBar2.Panels[4].Text:= 'Shift+Del-'+CtrlDeleteBtn.Caption;
 dxStatusBar2.Panels[5].Text:= 'Shift+Space-'+CtrlDetailBtn.Caption;
 dxStatusBar2.Panels[6].Text:= 'Esc-'+ExitBtn.Caption;

 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
//******************************************************************************
 Grid1ClFio.DataBinding.FieldName        := 'FIO';
 Grid2ClDateBeg.DataBinding.FieldName    := 'DATE_BEG';
 Grid2ClDateEnd.DataBinding.FieldName    := 'DATE_END';

//******************************************************************************
// PKodSetup:=CurrentKodSetup(DM.DB.Handle);
 DBEditFac.DataBinding.DataField         := 'NAME_ORG_FULL';
//******************************************************************************
 Grid1DBTableView1.DataController.DataSource := DM.DSource1;

 Grid2DBTableView1.DataController.DataSource := DM.DSource21;
 Grid22DBTableView1.DataController.DataSource := DM.DSource22;

 Grid31DBTableView1.DataController.DataSource := DM.DSource31;
 Grid32DBTableView1.DataController.DataSource := DM.DSource32;
 Grid33DBTableView1.DataController.DataSource := DM.DSource33;
 Grid34DBTableView1.DataController.DataSource := DM.DSource34;                   //Art

 EditDocument.DataBinding.DataSource := DM.DSource22;
 SendPeopleEdit.DataBinding.DataSource := DM.DSource22;
 SendAdressEdit.DataBinding.DataSource := DM.DSource22;

 EditPrikaz.DataBinding.DataSource     := DM.DSource33;
 EditSmeta.DataBinding.DataSource      := DM.DSource33;
 EditDepartment.DataBinding.DataSource := DM.DSource33;
 DBEditFac.DataBinding.DataSource      := DM.DSource31;

 GridPeoplePropDBTableView1.DataController.DataSource :=DM.DSource4;
 GridindexDBTableView1.DataController.DataSource      :=DM.DSource5;
//******************************************************************************
 SetOptionsBarManager(BarManager);
 SetOptionsGridView(Grid1DBTableView1);
 Grid1DBTableView1.OptionsView.Footer := True;
 SetOptionsGridView(Grid2DBTableView1);
 SetOptionsGridView(Grid22DBTableView1);
 SetOptionsGridView(Grid31DBTableView1);
 SetOptionsGridView(Grid32DBTableView1);
 SetOptionsGridView(Grid33DBTableView1);
 SetOptionsStatusBar(dxStatusBar1);
 SetOptionsStatusBar(dxStatusBar2);
 Grid1DBTableView1.OptionsCustomize.ColumnFiltering := true;
 Grid1ClFIO.Options.Filtering:=false;
 Grid1ClTin.Options.Filtering:=false;
 Grid1ClShifr.Options.Filtering:=false;
 Grid1ClTypePayment.Options.Filtering:=true;
 BarDockControlFilter.SunkenBorder:=True;
 Panel3.Color := Grid22DBTableView1.Styles.Background.Color;
 Splitter3.Color := Grid22DBTableView1.Styles.Header.Color;
 Panel33.Color := Grid33DBTableView1.Styles.Background.Color;
 Splitter33.Color := Grid33DBTableView1.Styles.Header.Color;
 Panel32.Color := Grid32DBTableView1.Styles.Background.Color;
 Panel31.Color := Grid31DBTableView1.Styles.Background.Color;
//******************************************************************************
 StylesDM := TStylesDM.Create(self);
 Grid1DBTableView1.Styles.StyleSheet    := StylesDM.GridTableViewStyleSheetDevExpress;
 Grid2DBTableView1.Styles.StyleSheet    := StylesDM.GridTableViewStyleSheetDevExpress;
 Grid22DBTableView1.Styles.StyleSheet   := StylesDM.GridTableViewStyleSheetDevExpress;
 Grid31DBTableView1.Styles.StyleSheet   := StylesDM.GridTableViewStyleSheetDevExpress;
 Grid32DBTableView1.Styles.StyleSheet   := StylesDM.GridTableViewStyleSheetDevExpress;
 Grid33DBTableView1.Styles.StyleSheet   := StylesDM.GridTableViewStyleSheetDevExpress;
 Grid34DBTableView1.Styles.StyleSheet   := StylesDM.GridTableViewStyleSheetDevExpress; //Art

//******************************************************************************
 DBMaskEditSmeta.DataBinding.DataSource := DM.DSource32;
//******************************************************************************
 WindowState := wsMaximized;
 Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
//******************************************************************************
 BroadFilterBtn.Caption := AccDepart_Text[PlanguageIndex];
 CloseWaitForm(wf);
//******************************************************************************
 if grValueFieldFromZSetup(Db_Handle,'GR_KOD_INDEX_START')= 0 then
 begin
  TabSheetIndex.free;
 end;

end;

procedure TFStud.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFStud.AddManBtnClick(Sender: TObject);
var Man:variant;
    DSet1,DSet2:TpFIBDataSet;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   if DM.DSet33.Active then
    begin
     DSet2:=DM.DSet33;
     DM.DSet33.Close;
    end;
   if DM.DSet32.Active then
    begin
     DSet2:=DM.DSet32;
     DM.DSet32.Close;
    end;
   if DM.DSet31.Active then
    begin
     DSet2:=DM.DSet31;
     DM.DSet31.Close;
    end;
   if DM.DSet22.Active then
    begin
     DSet1:=DM.DSet22;
     DM.DSet22.Close;
    end;
   if DM.DSet21.Active then
    begin
     DSet1:=DM.DSet21;
     DM.DSet21.Close;
    end;
   DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_MAN_BY_ID('+VarToStr(Man[0])+')';
   DM.DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSet1.Insert;
   DM.DSet1.Post;
   DSet1.Open;
   DSet2.Open;
   DSet2:=nil;
   DSet1:=nil;
   Filter:='NotFilter';
  end;
end;

procedure TFStud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ClearCurrentBuffer(Sender);
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFStud.SystemActionExecute(Sender: TObject);
begin
if PageControlChild.ActivePage=TabSheetAlimony then
  grShowMessage('System Information',
               'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'')+#13+
               'ID_ALIMONY = '+IfThen(DM.DSet22.Active,FloatToStrF(DM.DSet22['ID_ALIMONY'],ffFixed,16,0),''),
                mtInformation,[mbOK]);
if PageControlChild.ActivePage=TabSheetGrantData then
 begin
  if PageControl.ActivePage = TabSheetTerms then
  grShowMessage('System Information',
               'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'')+#13+
               'ID_STUD = '+IfThen(DM.DSet21.Active,FloatToStrF(DM.DSet21['ID_STUD'],ffFixed,16,0),'')+#13+
               'ID_STUD_INF = '+IfThen(DM.DSet31.Active,VarToStr(DM.DSet31['ID_STUD_INF']),''),
                mtInformation,[mbOK]);
  if PageControl.ActivePage = TabSheetGrants then
  grShowMessage('System Information',
               'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'')+#13+
               'ID_STUD = '+IfThen(DM.DSet21.Active,FloatToStrF(DM.DSet21['ID_STUD'],ffFixed,16,0),'')+#13+
               'ID_GRANT = '+IfThen(DM.DSet32.Active,VarToStr(DM.DSet32['ID_GRANT']),''),
                mtInformation,[mbOK]);
  if PageControl.ActivePage = TabSheetCurrent then
  grShowMessage('System Information',
               'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'')+#13+
               'ID_STUD = '+IfThen(DM.DSet21.Active,FloatToStrF(DM.DSet21['ID_STUD'],ffFixed,16,0),'')+#13+
               'ID_CURRENT = '+IfThen(DM.DSet32.Active,VarToStr(DM.DSet33['ID_CURRENT']),''),
                mtInformation,[mbOK]);
 end;
end;

procedure TFStud.RefreshBtnClick(Sender: TObject);
var wf: TForm;
begin
wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
 with DM do
  begin
   if DSet31.Active then DSet31.Close;
   If DSet32.Active then DSet32.Close;
   if DSet33.Active then DSet33.Close;
   if DSet34.Active then DSet34.Close;                                           //Art
   if DSet21.Active then DSet21.Close;
   If DSet22.Active then DSet22.Close;
   If DSet5.Active  then DSet5.Close;
   DSet1.CloseOpen(True);
   if PageControlChild.ActivePage=TabSheetGrantData then
      begin
        DSet21.Open;
        if PageControl.ActivePage = TabSheetTerms then DSet31.Open;
        if PageControl.ActivePage = TabSheetGrants then DSet32.Open;
        if PageControl.ActivePage = TabSheetCurrent then DSet33.Open;
        if PageControl.ActivePage = TabSheetCurrent then DSet34.Open;            //Art
      end;
   if PageControlChild.ActivePage=TabSheetAlimony then DSet22.Open;
   if PageControlChild.ActivePage=TabSheetIndex then DSet5.Open;
  end;
  CloseWaitForm(wf);
end;

procedure TFStud.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFStud.FilterBtnClick(Sender: TObject);
var KodSetup:integer;
    IsContract:boolean;
    wf:TForm;
begin

end;

procedure TFStud.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin

InsertBtn.Enabled     := True;
if (DM.DSet21.Active) and (VarToStrDef(DM.DSet21['IS_CONTRACT'],'Null')='F')  then
 begin
  UpdateBtn.Enabled     := True;
  DeleteBtn.Enabled     := True;
  CtrlInsertBtn.Enabled := True;
  CtrlUpdateBtn.Enabled := True;
  CtrlDeleteBtn.Enabled := True;
 end
else
 begin
  UpdateBtn.Enabled     := False;
  DeleteBtn.Enabled     := False;
  CtrlInsertBtn.Enabled := False;
  CtrlUpdateBtn.Enabled := False;
  CtrlDeleteBtn.Enabled := False;
 end;

if PageControlChild.ActivePage=TabSheetGrantData then
 begin
   if PageControl.ActivePage = TabSheetTerms then
     begin
      if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
        Grid31DBTableView1.DataController.DataSource := nil
      else Grid31DBTableView1.DataController.DataSource := DM.DSource31;
      Grid31DBTableView1FocusedRecordChanged(Grid31DBTableView1,nil,Grid31DBTableView1.Controller.FocusedRecord,True);
     end;
   if PageControl.ActivePage = TabSheetGrants then
    begin
      if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
       begin
        Grid32DBTableView1.DataController.DataSource := nil;
        DBMaskEditSmeta.DataBinding.DataSource := nil;
       end
      else
       begin
        Grid32DBTableView1.DataController.DataSource := DM.DSource32;
        DBMaskEditSmeta.DataBinding.DataSource := DM.DSource32;
       end;
      Grid31DBTableView1FocusedRecordChanged(Grid32DBTableView1,nil,Grid32DBTableView1.Controller.FocusedRecord,True);
    end;
   if PageControl.ActivePage = TabSheetCurrent then
    begin
      if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
       begin
        Grid33DBTableView1.DataController.DataSource := nil;
        EditPrikaz.DataBinding.DataSource := nil;
        EditDepartment.DataBinding.DataSource := nil;
        EditSmeta.DataBinding.DataSource := nil;
       end
      else
       begin
        Grid33DBTableView1.DataController.DataSource := DM.DSource33;
        EditPrikaz.DataBinding.DataSource := DM.DSource33;
        EditDepartment.DataBinding.DataSource := DM.DSource33;
        EditSmeta.DataBinding.DataSource := DM.DSource33;
       end;
      Grid31DBTableView1FocusedRecordChanged(Grid33DBTableView1,nil,Grid33DBTableView1.Controller.FocusedRecord,True);
     end;
   if PageControl.ActivePage = TabSheetVacation then
     begin
      if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
        Grid34DBTableView1.DataController.DataSource := nil
      else Grid34DBTableView1.DataController.DataSource := DM.DSource34;
      Grid31DBTableView1FocusedRecordChanged(Grid34DBTableView1,nil,Grid34DBTableView1.Controller.FocusedRecord,True);
     end;
   CtrlInsertBtn.Enabled := not (AFocusedRecord=nil);
 end
else
 begin
  CtrlInsertBtn.Enabled := False;
  CtrlUpdateBtn.Enabled := False;
  CtrlDeleteBtn.Enabled := False;
  CtrlDetailBtn.Enabled := False;
 end;

if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin

  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
 end
else
if (DM.DSet21.Active) and (VarToStrDef(DM.DSet21['IS_CONTRACT'],'NULL')='F') then
 begin

  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;
if PageControlChild.ActivePage = TabSheetAlimony then
 if  (AFocusedRecord<>nil) then
 begin

  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;

if PageControlChild.ActivePage = TabSheetIndex then
 if  (AFocusedRecord<>nil) then
 begin
  DM.pFIBDataSet6.Transaction.StartTransaction;
  DM.pFIBDataSet6.Open;
  DM.pFIBDataSet6.Transaction.Commit;
  DM.DSEt5.CloseOpen(true);
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;

end;

procedure TFStud.Grid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;
end;

procedure TFStud.InsertBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
    Parameter:TZAlimonyParameters;
    ParameterPeopleProp:TZPeoplePropParameters;
    ResLoad:variant;
    ParamIndex:TgrStudIndexParam;
begin
if PageControlChild.ActivePage=TabSheetGrantData then
 begin
  param := TgrCtrlSimpleParam.Create;
  Param.Owner := self;
  Param.DB_Handle := DM.DB.Handle;
  Param.Id := DM.DSet1['ID_MAN'];
  Param.fs := zcfsInsert;
  Param.CtrlType:=1;
  Key:=DoFunctionFromPackage(Param,Stud_terms_Ctrl_Pack);//создается форма
  if not VarIsNULL(Key) then
   begin
    DM.DSet21.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_S_BY_KEY('+VarToStr(Key)+')';
    DM.DSet21.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet21.Insert;
    DM.DSet21.Post
   end;
  Param.Destroy;
 end;
if PageControlChild.ActivePage=TabSheetAlimony then
 begin
  if not InsertBtn.Enabled then Exit;
  Parameter.ID := DM.DSet1['ID_MAN'];
  Parameter.ControlFormStyle := zcfsInsert;
  ResLoad:=LoadAlimonyControl(self,DM.DB.Handle,Parameter);
  if ResLoad[0]=mrYes then
   begin
    DM.DSet22.CloseOpen(True);
    Grid22DBTableView1.DataController.LocateByKey(ResLoad[1]);
   end;
 end;
if PageControlChild.ActivePage=TabSheetProp then
  begin
    ParameterPeopleProp.ID := DM.DSet1['ID_MAN'];
    ParameterPeopleProp.TypeId := zppptIdMan;
    ParameterPeopleProp.ControlFormStyle := zcfsInsert;
   // ParameterPeopleProp.KodSetup:=PParamFilter.KodSetup;
    ResLoad:=LoadPeoplePropControl(self,DM.DB.Handle,ParameterPeopleProp,tsGrant);
    if ResLoad[0]=mrYes then
    begin
      DM.DSet4.CloseOpen(True);
      Grid22DBTableView1.DataController.LocateByKey(ResLoad[1]);
     end;
  end;
if PageControlChild.ActivePage=TabSheetIndex then
  begin
    ParamIndex := TgrStudIndexParam.Create;
    ParamIndex.Owner := self;
    ParamIndex.fs := zcfsInsert;
    ParamIndex.KodSetup     := PParamFilter.KodSetup;
    ParamIndex.BaseKodSetup := PParamFilter.KodSetup;
    ParamIndex.DB_Handle    := Dm.DB.Handle;
    if DoFunctionFromPackage(ParamIndex, View_Stud_IndexEdit_Pack)=1 then
    begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='GR_INDEX_ACTS_INS';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('KOD_SETUP').AsDate          :=StrToDate( KodSetupToPeriod(ParamIndex.KodSetup,6));
      if  ParamIndex.IS_HAND_EDIT then
        DM.StProc.ParamByName('BASE_KOD_SETUP').AsDate   :=StrToDate( KodSetupToPeriod(ParamIndex.BaseKodSetup,6));
      if  ParamIndex.SUMMA_IND_FIX_BOOL then
        DM.StProc.ParamByName('SUMMA_IND_FIX').AsCurrency  :=StrTofloat(ParamIndex.SUMMA_IND_FIX);
      if  ParamIndex.SUMMA_IND_FACT_BOOL then
        DM.StProc.ParamByName('SUMMA_IND_FACT').AsCurrency :=StrTofloat(ParamIndex.SUMMA_IND_FACT);
      DM.StProc.ParamByName('ID_MAN').AsInt64            :=DM.DSet1['ID_MAN'];
      DM.StProc.ExecProc;
      Key:=DM.StProc.ParamByName('ID_RECORD').AsInt64;
      DM.StProc.Transaction.commit;
      DM.DSet5.CloseOpen(True);
      DM.DSet5.Locate('ID_RECORD',Key,[]);

    end;
  end;

end;


procedure TFStud.UpdateBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
    Parameter:TZAlimonyParameters;
    ParameterPeopleProp:TZPeoplePropParameters;
    ResLoad:variant;
    ParamIndex:TgrStudIndexParam;
begin
if PageControlChild.ActivePage=TabSheetGrantData then
 begin
  param := TgrCtrlSimpleParam.Create;
  Param.Owner := self;
  Param.DB_Handle := DM.DB.Handle;
  Param.Id := DM.DSet21['ID_STUD'];
  Param.fs := zcfsUpdate;
  Key:=DoFunctionFromPackage(Param,Stud_terms_Edu_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet21.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_S_BY_KEY('+VarToStr(Key)+')';
    DM.DSet21.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet21.Edit;
    DM.DSet21.Post
   end;
  Param.Destroy;
 end;
if PageControlChild.ActivePage=TabSheetAlimony then
 begin
  if not UpdateBtn.Enabled then Exit;
  Parameter.ID := DM.DSet22['ID_ALIMONY'];
  Parameter.ControlFormStyle := zcfsUpdate;
  ResLoad:=LoadAlimonyControl(self,DM.DB.Handle,Parameter);
  if ResLoad[0]=mrYes then
   begin
    DataSetCloseOpen(DM.DSet22, 'ID_ALIMONY');
    Grid22DBTableView1.DataController.LocateByKey(Parameter.ID);
   end;
 end;

  if PageControlChild.ActivePage=TabSheetProp then
  begin
    ParameterPeopleProp.ID := DM.DSet4['ID'];
    ParameterPeopleProp.TypeId := zppptIdPeopleProp;
    ParameterPeopleProp.ControlFormStyle := zcfsUpdate;
    ResLoad:=LoadPeoplePropControl(self,DM.DB.Handle,ParameterPeopleProp,tsGrant);
    if ResLoad[0]=mrYes then
    begin
      //DataSetCloseOpen(DM.DSet5, 'ID_RECORD');
      DataSetCloseOpen(DM.DSet4, 'ID');
      Grid22DBTableView1.DataController.LocateByKey(ParameterPeopleProp.ID);
    end;
  end;
if PageControlChild.ActivePage=TabSheetIndex then
  begin
    ParamIndex              := TgrStudIndexParam.Create;
    ParamIndex.Owner        := self;
    ParamIndex.fs           := zcfsUpdate;
    ParamIndex.KodSetup     := DM.DSet5['KOD_SETUP'];

    ParamIndex.IS_HAND_EDIT       :=True;
    ParamIndex.SUMMA_IND_FIX_BOOL :=True;
    ParamIndex.SUMMA_IND_FACT_BOOL:=True;

    if DM.DSet5['IS_HAND_EDIT']=0 then
      ParamIndex.IS_HAND_EDIT:=False
    else
      ParamIndex.BaseKodSetup := DM.DSet5['BASE_KOD_SETUP'];
    if DM.DSet5['IS_HAND_EDIT_FIX']=0 then
      ParamIndex.SUMMA_IND_FIX_BOOL:=False
    else
      ParamIndex.SUMMA_IND_FIX := DM.DSet5['SUMMA_IND_FIX'];
    if DM.DSet5['SUMMA_IND_FACT']=null then
      ParamIndex.SUMMA_IND_FACT_BOOL:=False
    else
      ParamIndex.SUMMA_IND_FACT := DM.DSet5['SUMMA_IND_FACT'];



    if DoFunctionFromPackage(ParamIndex, View_Stud_IndexEdit_Pack)=1 then
    begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='GR_INDEX_ACTS_UPD';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('KOD_SETUP_DATE').AsDate          :=StrToDate( KodSetupToPeriod(ParamIndex.KodSetup,6));
      if  ParamIndex.IS_HAND_EDIT then
        DM.StProc.ParamByName('BASE_KOD_SETUP_DATE').AsDate   :=StrToDate( KodSetupToPeriod(ParamIndex.BaseKodSetup,6))
      else  DM.StProc.ParamByName('BASE_KOD_SETUP_DATE').AsVariant   :=null;
      if  ParamIndex.SUMMA_IND_FIX_BOOL then
        DM.StProc.ParamByName('SUMMA_IND_FIX').AsCurrency  :=StrTofloat(ParamIndex.SUMMA_IND_FIX)
      else  DM.StProc.ParamByName('SUMMA_IND_FIX').AsVariant   :=null;
      if  ParamIndex.SUMMA_IND_FACT_BOOL then
        DM.StProc.ParamByName('SUMMA_IND_FACT').AsCurrency :=StrTofloat(ParamIndex.SUMMA_IND_FACT)
      else  DM.StProc.ParamByName('SUMMA_IND_FACT').AsVariant   :=null;

      DM.StProc.ParamByName('ID_MAN').AsInt64            :=DM.DSet1['ID_MAN'];
      DM.StProc.ParamByName('ID_RECORD').AsInt64      :=DM.DSet5['ID_RECORD'];
      DM.StProc.ExecProc;


      Key:=DM.StProc.ParamByName('ID_RECORD_OUT').AsInt64;
      DM.StProc.Transaction.commit;
      DM.DSet5.CloseOpen(True);
      DM.DSet5.Locate('ID_RECORD',Key,[]);

    end;
  end;

end;

procedure TFStud.DeleteBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
    Parameter:TZAlimonyParameters;
    ParameterPeopleProp:TZPeoplePropParameters;
    ResLoad:variant;
    ParamIndex:TgrStudIndexParam;
begin
if PageControlChild.ActivePage=TabSheetGrantData then
 begin
  param := TgrCtrlSimpleParam.Create;
  Param.Owner := self;
  Param.DB_Handle := DM.DB.Handle;
  Param.Id := DM.DSet21['ID_STUD'];
  Param.fs := zcfsDelete;
  Key:=DoFunctionFromPackage(Param,Stud_terms_Edu_Ctrl_Pack);
  if Key=True then
   begin
    DM.DSet21.SQLs.DeleteSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet21.Delete;
   end;
  Param.Destroy;
 end;
if PageControlChild.ActivePage=TabSheetAlimony then
 begin
  if not DeleteBtn.Enabled then Exit;
  Parameter.ID := DM.DSet22['ID_ALIMONY'];
  Parameter.ControlFormStyle := zcfsDelete;
  ResLoad:=LoadAlimonyControl(self,DM.DB.Handle,Parameter);
  if ResLoad[0]=mrYes then
   begin
    DataSetCloseOpen(DM.DSet22);
    Grid22DBTableView1.DataController.LocateByKey(DM.DSet22['ID_ALIMONY']);
   end;
 end;

  if PageControlChild.ActivePage=TabSheetProp then
  begin
    ParameterPeopleProp.ID := DM.DSet4['ID'];
    ParameterPeopleProp.TypeId := zppptIdPeopleProp;
    ParameterPeopleProp.ControlFormStyle := zcfsDelete;
    ResLoad:=LoadPeoplePropControl(self,DM.DB.Handle,ParameterPeopleProp,tsGrant);
    if ResLoad[0]=mrYes then
    begin
      DataSetCloseOpen(DM.DSet4);
      Grid22DBTableView1.DataController.LocateByKey(DM.DSet4['ID']);
    end;
  end;

  if PageControlChild.ActivePage=TabSheetIndex then
  begin
    ParamIndex := TgrStudIndexParam.Create;
    ParamIndex.Owner := self;
    ParamIndex.fs := zcfsDelete;
    ParamIndex.DB_Handle    := Dm.DB.Handle;
    if DoFunctionFromPackage(ParamIndex, View_Stud_IndexEdit_Pack)=True then
    begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='GR_INDEX_ACTS_DEL';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID_RECORD').AsInt64:=DM.DSet5['ID_RECORD'];
      DM.StProc.ExecProc;
      DM.StProc.Transaction.commit;
      DM.DSet5.CloseOpen(True);
    end;
  end;

end;

procedure TFStud.DetailBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Parameter:TZAlimonyParameters;
    ParameterPeopleProp:TZPeoplePropParameters;
    ResLoad:variant;
    ParamIndex:TgrStudIndexParam;
begin
if PageControlChild.ActivePage=TabSheetGrantData then
 begin
ParamIndex              := TgrStudIndexParam.Create;
    ParamIndex.Owner        := self;
    ParamIndex.fs           := zcfsShowDetails;
    ParamIndex.KodSetup     := DM.DSet5['KOD_SETUP'];

    ParamIndex.IS_HAND_EDIT       :=True;
    ParamIndex.SUMMA_IND_FIX_BOOL :=True;
    ParamIndex.SUMMA_IND_FACT_BOOL:=True;

    if DM.DSet5['IS_HAND_EDIT']=0 then
      ParamIndex.IS_HAND_EDIT:=False
    else
      ParamIndex.BaseKodSetup := DM.DSet5['BASE_KOD_SETUP'];
    if DM.DSet5['IS_HAND_EDIT_FIX']=0 then
      ParamIndex.SUMMA_IND_FIX_BOOL:=False
    else
      ParamIndex.SUMMA_IND_FIX := DM.DSet5['SUMMA_IND_FIX'];
    if DM.DSet5['SUMMA_IND_FACT']=null then
      ParamIndex.SUMMA_IND_FACT_BOOL:=False
    else
      ParamIndex.SUMMA_IND_FACT := DM.DSet5['SUMMA_IND_FACT'];

  DoFunctionFromPackage(ParamIndex,Stud_terms_Edu_Ctrl_Pack);
  Param.Destroy;
 end;
if PageControlChild.ActivePage=TabSheetAlimony then
 begin
  if not DetailBtn.Enabled then Exit;
  Parameter.ID := DM.DSet22['ID_ALIMONY'];
  Parameter.ControlFormStyle := zcfsShowDetails;
  LoadAlimonyControl(self,DM.DB.Handle,Parameter);
 end;

if PageControlChild.ActivePage=TabSheetProp then
begin
  ParameterPeopleProp.ID := DM.DSet4['ID'];
  ParameterPeopleProp.TypeId := zppptIdPeopleProp;
  ParameterPeopleProp.ControlFormStyle := zcfsShowDetails;
  ResLoad:=LoadPeoplePropControl(self,DM.DB.Handle,ParameterPeopleProp,tsGrant);
end;

if PageControlChild.ActivePage=TabSheetIndex then
  begin
    ParamIndex              := TgrStudIndexParam.Create;
    ParamIndex.Owner        := self;
    ParamIndex.fs           := zcfsShowDetails;
    ParamIndex.KodSetup     := DM.DSet5['KOD_SETUP'];
    ParamIndex.BaseKodSetup := DM.DSet5['BASE_KOD_SETUP'];

    ParamIndex.SUMMA_IND_FACT:=VarToStrDef(DM.DSet5['SUMMA_IND_FACT'],'');
    ParamIndex.SUMMA_IND_FIX :=VarToStrDef(DM.DSet5['SUMMA_IND_FIX'],'');

    ParamIndex.SUMMA_IND_FIX_BOOL:= True;
    ParamIndex.SUMMA_IND_FACT_BOOL:=True;
    ParamIndex.IS_HAND_EDIT:= True;

    if DM.DSet5['SUMMA_IND_FIX']=null  then
      ParamIndex.SUMMA_IND_FIX_BOOL:=False;
    if DM.DSet5['SUMMA_IND_FACT']=null  then
      ParamIndex.SUMMA_IND_FACT_BOOL:=False;
    if DM.DSet5['IS_HAND_EDIT_FIX']=0  then
      ParamIndex.IS_HAND_EDIT:=False;
      
    ParamIndex.DB_Handle    := Dm.DB.Handle;
    DoFunctionFromPackage(ParamIndex, View_Stud_IndexEdit_Pack)
  end;
end;

procedure TFStud.FormDestroy(Sender: TObject);
begin
ClearCurrentBuffer(Sender);
StylesDM.Destroy;
if DM<>nil then DM.Destroy;
end;

procedure TFStud.PageControlChange(Sender: TObject);
begin
if PageControl.ActivePage=TabSheetTerms then
 begin
  if not DM.DSet31.Active then DM.DSet31.Open;
  if Dm.DSet32.Active then DM.DSet32.Close;
  if Dm.DSet33.Active then DM.DSet33.Close;
  if Dm.DSet34.Active then DM.DSet34.Close;
 end;
if PageControl.ActivePage=TabSheetGrants then
 begin
  if not DM.DSet32.Active then DM.DSet32.Open;
  if Dm.DSet31.Active then DM.DSet31.Close;
  if Dm.DSet33.Active then DM.DSet33.Close;
  if Dm.DSet34.Active then DM.DSet34.Close;
 end;
if PageControl.ActivePage=TabSheetCurrent then
 begin
  if not DM.DSet33.Active then DM.DSet33.Open;
  if Dm.DSet31.Active then DM.DSet31.Close;
  if Dm.DSet32.Active then DM.DSet32.Close;
  if Dm.DSet34.Active then DM.DSet34.Close;
 end;
if PageControl.ActivePage=TabSheetVacation then
 begin
  if not DM.DSet34.Active then DM.DSet34.Open;
  if Dm.DSet31.Active then DM.DSet31.Close;
  if Dm.DSet32.Active then DM.DSet32.Close;
  if Dm.DSet33.Active then DM.DSet33.Close;
 end;
Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFStud.CtrlInsertBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.Id := DM.DSet21['ID_STUD'];
Param.fs := zcfsInsert;
if PageControl.ActivePage=TabSheetTerms then
 begin
  Key:=DoFunctionFromPackage(Param,Stud_terms_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet31.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_KEY('+IntToStr(Key)+')';
    DM.DSet31.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet31.Insert;
    DM.DSet31.Post;
    DM.DSet21.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_S_BY_KEY('+IntToStr(Round(DM.DSet21['ID_STUD']))+')';
    DM.DSet21.Refresh;
   end;
 end;
if PageControl.ActivePage=TabSheetGrants then
 begin
  Key:=DoFunctionFromPackage(Param,Stud_Grants_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet32.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_DT_GRANTS_S_BY_KEY('+IntToStr(Key)+')';
    DM.DSet32.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet32.Insert;
    DM.DSet32.Post
   end;
 end;
if PageControl.ActivePage=TabSheetCurrent then
 begin

  Key:=DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet33.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CURRENT_S_BY_KEY('+IntToStr(Key)+')';
    DM.DSet33.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet33.Insert;
    DM.DSet33.Post
   end;
 end;                                                                            //Art

if PageControl.ActivePage=TabSheetVacation then
 begin
  Key:=DoFunctionFromPackage(Param,Stud_Vacation_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet34.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_DT_STUD_VAC_S_BY_KEY('+IntToStr(Key)+')';
    DM.DSet34.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet34.Insert;
    DM.DSet34.Post
   end;
 end;
Param.Destroy;
end;

procedure TFStud.dxStatusBar1Resize(Sender: TObject);
begin
ResizeStatusBar(dxStatusBar1);
end;

procedure TFStud.dxStatusBar2Resize(Sender: TObject);
begin
ResizeStatusBar(dxStatusBar1);
end;

procedure TFStud.CtrlUpdateBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:variant;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsUpdate;
if PageControl.ActivePage = TabSheetTerms then
 begin
  Param.Id := DM.DSet31['ID_STUD_INF'];
  Key:=DoFunctionFromPackage(Param,Stud_terms_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet31.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_KEY('+IntToStr(Param.Id)+')';
    DM.DSet31.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet31.Edit;
    DM.DSet31.Post;
    DM.DSet21.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_S_BY_KEY('+IntToStr(Round(DM.DSet21['ID_STUD']))+')';
    DM.DSet21.Refresh;
   end;
 end;
if PageControl.ActivePage=TabSheetGrants then
 begin
  Param.Id := DM.DSet32['ID_GRANT'];
  Key:=DoFunctionFromPackage(Param,Stud_Grants_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet32.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_DT_GRANTS_S_BY_KEY('+IntToStr(Param.Id)+')';
    DM.DSet32.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet32.Edit;
    DM.DSet32.Post
   end;
 end;
if PageControl.ActivePage=TabSheetCurrent then
 begin
  Param.Id := DM.DSet33['ID_CURRENT'];
  Key:=DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DM.DSet33.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CURRENT_S_BY_KEY('+IntToStr(Param.Id)+')';
    DM.DSet33.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet33.Edit;
    DM.DSet33.Post
   end;
 end;
if PageControl.ActivePage=TabSheetVacation then
 begin
  Param.Id := DM.DSet34['ID_VACATION'];

  Key:=DoFunctionFromPackage(Param,Stud_Vacation_Ctrl_Pack);

  if not VarIsNULL(Key) then
   begin
    DM.DSet34.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_DT_STUD_VAC_S_BY_KEY('+IntToStr(Param.Id)+')';
    DM.DSet34.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DM.DSet34.Edit;
    DM.DSet34.Post
   end;
 end;
Param.Destroy;
end;

procedure TFStud.CtrlDeleteBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsDelete;
if PageControl.ActivePage = TabSheetTerms then
 begin
  Param.Id := DM.DSet31['ID_STUD_INF'];
  if DoFunctionFromPackage(Param,Stud_terms_Ctrl_Pack)=True then
   begin
    DM.DSet31.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DM.DSet31.Delete;
    DM.DSet21.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_S_BY_KEY('+IntToStr(Round(DM.DSet21['ID_STUD']))+')';
    DM.DSet21.Refresh;
   end;
 end;
if PageControl.ActivePage = TabSheetGrants then
 begin
  Param.Id := DM.DSet32['ID_GRANT'];
  if DoFunctionFromPackage(Param,Stud_Grants_Ctrl_Pack)=True then
   begin
    DM.DSet32.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DM.DSet32.Delete;
   end;
 end;
if PageControl.ActivePage = TabSheetCurrent then
 begin
  Param.Id := DM.DSet33['ID_CURRENT'];
  if DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack)=True then
   begin
    DM.DSet33.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DM.DSet33.Delete;
   end;
 end;
if PageControl.ActivePage = TabSheetVacation then
 begin
  Param.Id := DM.DSet34['ID_VACATION'];
  if DoFunctionFromPackage(Param,Stud_VACATION_Ctrl_Pack)=True then
   begin
    DM.DSet34.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DM.DSet34.Delete;
   end;
 end;
Param.Destroy;
end;

procedure TFStud.CtrlDetailBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsShowDetails;
if PageControl.ActivePage = TabSheetTerms then
 begin
  Param.Id := DM.DSet31['ID_STUD_INF'];
  DoFunctionFromPackage(Param,Stud_terms_Ctrl_Pack);
 end;
if PageControl.ActivePage = TabSheetGrants then
 begin
  Param.Id := DM.DSet32['ID_GRANT'];
  DoFunctionFromPackage(Param,Stud_Grants_Ctrl_Pack);
 end;
if PageControl.ActivePage = TabSheetCurrent then
 begin
  Param.Id := DM.DSet33['ID_CURRENT'];
  DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);
 end;
if PageControl.ActivePage = TabSheetVacation then
 begin
  Param.Id := DM.DSet34['ID_VACATION'];
  DoFunctionFromPackage(Param,Stud_Vacation_Ctrl_Pack);
 end;
Param.Destroy;
end;

procedure TFStud.Panel32Resize(Sender: TObject);
begin
DBMaskEditSmeta.Width := max(Panel32.Width - PWidth32,10);
end;

procedure TFStud.PageControlChildChange(Sender: TObject);
begin
Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
if PageControlChild.ActivePage=TabSheetGrantData then
 begin
  if not DM.DSet21.Active then DM.DSet21.Open;
  if Dm.DSet22.Active then DM.DSet22.Close;
  PageControlChange(sender);
 end;

if PageControlChild.ActivePage=TabSheetAlimony then
 begin
  if not DM.DSet22.Active then DM.DSet22.Open;
  if Dm.DSet21.Active then
   begin
    if DM.DSet31.Active then DM.DSet31.Close;
    if DM.DSet32.Active then DM.DSet32.Close;
    if DM.DSet33.Active then DM.DSet33.Close;
    DM.DSet21.Close;
   end;
 end;

if PageControlChild.ActivePage=TabSheetProp then
  if not DM.DSet4.Active then DM.DSet4.Open;

if PageControlChild.ActivePage=TabSheetIndex then
  begin
    if not DM.DSet5.Active then DM.DSet5.Open;
    if (DM.DSet5['ID_RECORD']=-1) and (DM.DSet5.Active) then DeleteBtn.enabled:=false
    else  DeleteBtn.enabled:=true;
  end;

end;

procedure TFStud.Grid2ClContractGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='T' then AText:=Contract_text[PLanguageIndex];
if AText='F' then AText:=Budget_text[PLanguageIndex];
end;

procedure TFStud.Panel33Resize(Sender: TObject);
begin
EditDepartment.Width := max(Panel33.Width - PWidth33,10);
EditPrikaz.Width     := max(Panel33.Width - PWidth33,10);
EditSmeta.Width      := max(Panel33.Width - PWidth33,10);
end;

procedure TFStud.Panel3Resize(Sender: TObject);
begin
EditDocument.Width   := max(Panel3.Width - PWidth22,10);
SendPeopleEdit.Width := max(Panel3.Width - PWidth22,10);
SendAdressEdit.Width := max(Panel3.Width - PWidth22,10);
end;

procedure TFStud.Grid33ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if Atext<>'' then
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFStud.Grid31DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  CtrlUpdateBtn.Enabled := False;
  CtrlDeleteBtn.Enabled := False;
  CtrlDetailBtn.Enabled := False;
 end
else
 begin
  CtrlUpdateBtn.Enabled := True;
  CtrlDeleteBtn.Enabled := True;
  CtrlDetailBtn.Enabled := True;
 end;
//if PageControlChild.ActivePage=TabSheetGrantData then                          //Art
 // DeleteBtn.Enabled := not(AFocusedRecord = nil);                              // Art
end;

procedure TFStud.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if PageControlChild.ActivePage=TabSheetGrantData then
   Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
if PageControlChild.ActivePage=TabSheetAlimony then
   Grid2DBTableView1FocusedRecordChanged(Grid22DBTableView1,nil,Grid22DBTableView1.Controller.FocusedRecord,True);
if PageControlChild.ActivePage=TabSheetProp then
   Grid3DBTableView1FocusedRecordChanged(GridPeoplePropDBTableView1,nil,GridPeoplePropDBTableView1.Controller.FocusedRecord,True);
if PageControlChild.ActivePage=TabSheetIndex then
   Grid2DBTableView1FocusedRecordChanged(GridindexDBTableView1,nil,GridindexDBTableView1.Controller.FocusedRecord,True);

if AFocusedRecord=nil then
 begin
  AcctCardBtn.Enabled := False;
  InsertBtn.Enabled := False;
 end
else
 begin
  AcctCardBtn.Enabled := True;
  InsertBtn.Enabled := True;
 end;
//Grid2DBTableView1.ViewData.Expand(True);
end;

procedure TFStud.AcctCardBtnClick(Sender: TObject);
begin
    PackageLoad.LoadSpAllPeopleEditForm(Self,DM.DB.Handle,DM.DSet1['ID_MAN'],True);
end;

procedure TFStud.ClearCurrentBuffer(Sender:TObject);
var reg: TRegistry;
    Key:string;
begin
                                              
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\CurrentCtrl\Stud',True);
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\GrantCtrl',True);
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\CtrlEduStudTerms',True);          
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\CtrlStudTerms',True);          
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\TnAccessControl',True);
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\CtrlStudVacation',True);
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;





 
 
end;

procedure TFStud.BroadFilterBtnClick(Sender: TObject);
var Select:Variant;
begin

end;

procedure TFStud.Grid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid1DBTableView1.OptionsBehavior.IncSearchItem <> Grid1ClShifr)then
    begin
     Grid1DBTableView1.Controller.IncSearchingText   := '';
     Grid1DBTableView1.OptionsBehavior.IncSearchItem := Grid1ClShifr;
    end
  end
 else
  if (Grid1DBTableView1.OptionsBehavior.IncSearchItem <> Grid1ClFIO)then
   begin
    Grid1DBTableView1.Controller.IncSearchingText   := '';
    Grid1DBTableView1.OptionsBehavior.IncSearchItem := Grid1ClFIO;
   end;
end;

procedure TFStud.Panel31Resize(Sender: TObject);
begin
DBEditFac.Width := max(Panel31.Width - PWidth31,10);
end;

procedure TFStud.ShifrBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
begin
Param := TgrCtrlSimpleParam.Create;
Param.Owner := Self;
Param.DB_Handle := DM.DB.Handle;
Param.Id := DM.DSet1['ID_MAN'];
Param.fs := zcfsUpdate;
DoFunctionFromPackage(Param,Stud_AcctCard_Ctrl_Pack);
if Filter='Filter' then  Filter:=PParamFilter.KodSetup
else  Filter:=Null;
DM.DSet1.SQLs.RefreshSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +VarToStrDef(Filter,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(Param.Id,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_B<>'',PParamFilter.Bal_B,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_E<>'',PParamFilter.Bal_E,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_vidopl,'Null')
                                                                  +') order by FIO';




DM.DSet1.Refresh;
Param.Destroy;
end;

procedure TFStud.AddGrantBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.Id := DM.DSet1['ID_MAN'];
Param.fs := zcfsInsert;
Param:=ViewGrantCtrl(Param);
DM.DSet1.First;
if(Param<>nil)then
while (DM.DSet1.Eof=false)do
begin
  with DM do
  try
    StProcTransaction.StartTransaction;

    StProc.StoredProcName:='GR_DT_GRANTS_I2';
    StProc.Prepare;
    StProc.ParamByName('ID_MAN').AsInt64    := DM.DSet1['ID_MAN'];;
    StProc.ParamByName('DATE_BEG').AsDate   := Param.DateBeg;
    StProc.ParamByName('DATE_END').AsDate   := Param.DateEnd;
    StProc.ParamByName('ID_SMETA').AsInt64  := Param.IdSmeta;
    StProc.ParamByName('ID_VIDOPL').AsInt64 := Param.IdVidopl;
    StProc.ParamByName('SUMMA').AsCurrency  := Param.Summa;
    StProc.ParamByName('BAL').AsCurrency    := Param.Bal;
    StProc.ParamByName('PRIKAZ').AsString   := Param.Prikaz;
    StProc.ExecProc;
    Key:=StProc.ParamByName('ID_GRANT').AsInteger;
    StProc.Transaction.Commit;
    except
    on e:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
      StProc.transaction.RollBack;
    end;
    end;
    DM.DSet1.Next;
  end;
  DM.DSet21.CloseOpen(true);
  DM.DSet31.CloseOpen(true);
  DM.DSet32.CloseOpen(true);
end;

procedure TFStud.AddTermsBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
    IdStud:Int64;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsUpdate;
Param:=ViewGrantCtrl(Param);
DM.DSet1.First;
if(Param<>nil)then
while (DM.DSet1.Eof=false)do
begin
  with DM do
  try
    StProcTransaction.StartTransaction;
    StProc.StoredProcName:='GR_CN_DT_STUD_I';
    StProc.Prepare;
    StProc.ParamByName('ID_MAN').AsInteger:=DM.DSet1['ID_MAN'];
    StProc.ParamByName('DATE_BEG').AsDate:=Param.DateBeg;
    StProc.ParamByName('DATE_END').AsDate:=Param.DateEnd;
    StProc.ParamByName('PRIKAZ').AsString:=Param.Prikaz;
    StProc.ExecProc;
    IdStud:=StProc.ParamByName('ID_STUD').AsInt64;
    StProc.Transaction.Commit;

    StProcTransaction.StartTransaction;
    StProc.StoredProcName:='GR_CN_DT_STUD_INF_I2';
    StProc.Prepare;
    StProc.ParamByName('ID_STUD').AsInt64:=IdStud;
    StProc.ParamByName('ID_CAT_STUD').AsInt64:=Param.IdVidopl;
    StProc.ParamByName('ID_DEPARTMENT').AsInteger:=Param.IdSmeta;
    StProc.ParamByName('DATE_BEG').AsDate:=Param.DateBeg;
    StProc.ParamByName('DATE_END').AsDate:=Param.DateEnd;
    StProc.ParamByName('KURS').AsCurrency:=Param.Bal;
    StProc.ExecProc;
    StProc.Transaction.Commit;
    except
    on e:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
      StProc.transaction.RollBack;
    end;
    end;
    DM.DSet1.Next;
  end;
  DM.DSet21.CloseOpen(true);
  DM.DSet31.CloseOpen(true);
end;

procedure TFStud.PrintBtnClick(Sender: TObject);
var //form:TFPeoplePrint;
    MemoryData:TrxMemoryData;
    CRecord :integer;
begin
  MemoryData:=TRxMemoryData.Create(self);
//  form:=TFPeoplePrint.Create(self);
  CRecord:=DM.DSet1.RecordCount;
  MemoryData.CopyStructure(DM.DSet1);
  DM.DSet1.First;
  MemoryData.LoadFromDataSet(DM.DSet1,CRecord,lmCopy);
  MemoryData.Open;
{  if(form.ShowModal=mrOk)then
  begin
    if form.FioRadioBtn.Checked=true then
      MemoryData.SortOnFields('FIO')
    else
    begin
      if form.TinRadioBtn.Checked=true then
        MemoryData.SortOnFields('TIN')
      else
        MemoryData.SortOnFields('TYPE_PAYMENT');
    end;}
    MemoryData.SortOnFields('NAME_DEPARTMENT');
//  end;
  DM.DSourcePrint.DataSet:=MemoryData;
  DM.Print(0);
end;

procedure TFStud.N1Click(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
    IdStud:Int64;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsUpdate;
Param:=ViewGrantCtrl(Param);
if(Param<>nil)then
begin
  with DM do
  try
    StProcTransaction.StartTransaction;
    StProc.StoredProcName:='GR_CN_DT_STUD_I';
    StProc.Prepare;
    StProc.ParamByName('ID_MAN').AsInteger:=DM.DSet1['ID_MAN'];
    StProc.ParamByName('DATE_BEG').AsDate:=Param.DateBeg;
    StProc.ParamByName('DATE_END').AsDate:=Param.DateEnd;
    StProc.ParamByName('PRIKAZ').AsString:=Param.Prikaz;
    StProc.ExecProc;
    IdStud:=StProc.ParamByName('ID_STUD').AsInt64;
    StProc.Transaction.Commit;

    StProcTransaction.StartTransaction;
    StProc.StoredProcName:='GR_CN_DT_STUD_INF_I2';
    StProc.Prepare;
    StProc.ParamByName('ID_STUD').AsInt64:=IdStud;
    StProc.ParamByName('ID_CAT_STUD').AsInt64:=Param.IdVidopl;
    StProc.ParamByName('ID_DEPARTMENT').AsInteger:=Param.IdSmeta;
    StProc.ParamByName('DATE_BEG').AsDate:=Param.DateBeg;
    StProc.ParamByName('DATE_END').AsDate:=Param.DateEnd;
    StProc.ParamByName('KURS').AsCurrency:=Param.Bal;
    StProc.ExecProc;
    StProc.Transaction.Commit;
    except
    on e:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
      StProc.transaction.RollBack;
    end;
    end;
  end;
  DM.DSet21.CloseOpen(true);
  DM.DSet31.CloseOpen(true);
end;

procedure TFStud.BarBtnGrantPrintClick(Sender: TObject);
var FFilterStFond:TFFilterStFond;
begin
  FFilterStFond:=TFFilterStFond.Create(self);
  if FFilterStFond.ShowModal=mrcancel then exit;
  DM.CDATE:=VarToStrDef(FFilterStFond.EditDateBeg.Editvalue,'01.01.2000');
  DM.DSetPrint.SQLs.SelectSQL.Text:='SELECT VIDOPL_NAME, SUM(GRANT_COUNT) AS GRANT_COUNT, GRANT_SIZE, SUM(SUMMA) AS SUMMA FROM GR_DT_GRANTS_PRINT_GRANT('''+DateToStr(FFilterStFond.EditDateBeg.Editvalue)+''') where id_department<>-1 GROUP BY VIDOPL_NAME, GRANT_SIZE ORDER BY VIDOPL_NAME, GRANT_SIZE';
  DM.DSetPrint.Open;
  DM.DSourcePrint.DataSet:=DM.DSetPrint;
  DM.Print(1);
  DM.DSetPrint.Close;
end;

procedure TFStud.BarBtnPrintCatClick(Sender: TObject);
begin
  with dm do
  begin
    if form=nil then
      form:=TFFilterDate.create(self,DM.db.handle);
    while(form.ShowModal=mrOk) do
    begin
      DSetPrint.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_GRANTS_PRINT_CAT('''+DateToStr(form.EditDateBeg.Date)+''','''+DateToStr(form.EditDateEnd.Date)+''')';
      //form.Free;
      DSetPrint.Open;
      DSourcePrint.DataSet:=DM.DSetPrint;
      Print(2);
      DSetPrint.Close;
    end;
  end;
end;

procedure TFStud.BarBtnPrintKursClick(Sender: TObject);
var Parameter:TgrSimpleParam;
    KodSetup: Variant;
    wf: tform;
begin
  Parameter := TgrSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  KodSetup:=DoFunctionFromPackage(Parameter,Stud_FilterKodSetup);
  DM.CDate:=KodSetupToPeriod(KodSetup,6);
  Parameter.Destroy;
  DM.DSetPrint.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_GRANTS_PRINT_GRANT('''+DM.CDate+''')ORDER BY ID_DEPARTMENT ,VIDOPL_NAME, GRANT_SIZE';
  wf:=ZWait.ShowWaitForm(TForm(Self.Owner));
  DM.DSetPrint.Open;
  DM.DSourcePrint.DataSet:=DM.DSetPrint;
  CloseWaitForm(wf);
  DM.Print(3);
  DM.DSetPrint.Close;
end;

procedure TFStud.UpdateDepAllClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsDelete;
Param:=ViewGrantCtrl(Param);
DM.DSet1.First;
if(Param<>nil)then
while (DM.DSet1.Eof=false)do
  begin
  with DM do
  try
    StProcTransaction.StartTransaction;
    StProc.StoredProcName:='GR_CN_DT_STUD_INF_U_DEP';
    StProc.Prepare;
    StProc.ParamByName('ID_MAN').AsInt64:=DM.DSet1['ID_MAN'];
    StProc.ParamByName('ID_DEP').AsInteger:=Param.IdSmeta;
    StProc.ParamByName('KOD_SETUP').AsInteger:=PeriodToKodSetup(PParamFilter.Year,PParamFilter.Month);
    StProc.ExecProc;
    StProc.Transaction.Commit;
    except
    on e:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
      StProc.transaction.RollBack;
    end;
  end;
    DM.DSet1.Next;
    DM.DSet21.CloseOpen(true);
  end;
  DM.DSet21.CloseOpen(true);
  DM.DSet31.CloseOpen(true);
end;

procedure TFStud.Grid31DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var KodSetup:integer;
    DateBeg:TDate;
    DateEnd:TDate;
    a,b:Tdate;
begin
 if PParamFilter.KodSetup=null then exit;
if( ARecord.DisplayTexts[4]<>'') and( ARecord.DisplayTexts[5]<>'') then
begin
 DateBeg:=StrToDate(ARecord.DisplayTexts[4]);
 DateEnd:=StrToDate(ARecord.DisplayTexts[5]);
 a:= EncodeDate(PParamFilter.Year,PParamFilter.Month,1);
 if PParamFilter.Month=12 then
   b:= EncodeDate(PParamFilter.year,12,31)
 else
   b:= EncodeDate(PParamFilter.year,PParamFilter.Month+1,1)-1;
 if ( (DateBeg<a) and (DateEnd>a) ) or ((DateBeg<b) and (DateEnd>b) )then
  AStyle:=cxStyle31
 else  AStyle:=cxStyle2;
end;
end;

procedure TFStud.Grid32DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  var KodSetup:integer;
    DateBeg:TDate;
    DateEnd:TDate;
    a,b:Tdate;
begin
if PParamFilter.KodSetup=null then exit;
if( ARecord.DisplayTexts[4]<>'') and( ARecord.DisplayTexts[5]<>'') then
begin
 DateBeg:=StrToDate(ARecord.DisplayTexts[2]);
 DateEnd:=StrToDate(ARecord.DisplayTexts[3]);
 a:= EncodeDate(PParamFilter.Year,PParamFilter.Month,1);
 if PParamFilter.Month=12 then
   b:= EncodeDate(PParamFilter.year,12,31)
 else
   b:= EncodeDate(PParamFilter.year,PParamFilter.Month+1,1)-1;;
 if ( (DateBeg<a) and (DateEnd>a) ) or ((DateBeg<b) and (DateEnd>b) )then
  AStyle:=cxStyle31
 else  AStyle:=cxStyle2;

end;
end;

procedure TFStud.Grid2DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  var KodSetup:integer;
    DateBeg:TDate;
    DateEnd:TDate;
    a,b:Tdate;
begin
if PParamFilter.KodSetup=null then exit;
if( ARecord.DisplayTexts[0]<>'') and( ARecord.DisplayTexts[1]<>'') then
begin
 DateBeg:=StrToDate(ARecord.DisplayTexts[0]);
 DateEnd:=StrToDate(ARecord.DisplayTexts[1]);
 a:= EncodeDate(PParamFilter.year,PParamFilter.Month,1);
 if PParamFilter.Month=12 then
   b:= EncodeDate(PParamFilter.year,12,31)
 else
   b:= EncodeDate(PParamFilter.year,PParamFilter.Month+1,1)-1;
 if ( (DateBeg<a) and (DateEnd>a) ) or ((DateBeg<b) and (DateEnd>b) )then
  AStyle:=cxStyle31
 else  AStyle:=cxStyle2;
end;

end;

procedure TFStud.Grid33DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  var KodSetup:integer;
    DateBeg:TDate;
    DateEnd:TDate;
    a,b:Tdate;
begin
if PParamFilter.KodSetup=null then exit;
if  ARecord.DisplayTexts[0]<>'' then
begin
KodSetup:=PeriodToKodSetup(PParamFilter.year,PParamFilter.Month);
if KodSetup=strtoint(ARecord.DisplayTexts[0]) then

  AStyle:=cxStyle31
 else  AStyle:=cxStyle2;
end;
 end;

procedure TFStud.ButtonFilterClick(Sender: TObject);

begin


if View_FormFilter(PParamFilter) then
begin
  with DM do
  begin
   DSet31.Close;
   DSet32.Close;
   DSet33.Close;                                                                  //Art?
   DSet34.Close;                                                                 //Art?
   DSet21.Close;
   DSet1.Close;


   DSet1.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_B<>'', StringReplace(PParamFilter.Bal_B, ',' , '.' , [rfIgnoreCase]) , 'Null')+','
                                                                  +IfThen(PParamFilter.Bal_E<>'',StringReplace(PParamFilter.Bal_E, ',' , '.' , [rfIgnoreCase]),'Null')+','
                                                                  +varToStrDef(PParamFilter.id_vidopl,'Null')
                                                                  +') order by FIO';

   DSet21.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S(?ID_MAN,'''+PParamFilter.Contract+''')order by date_beg desc';
   try
    DSet1.Open;
    DSet21.Open;
    if PageControl.ActivePage=TabSheetTerms then
      DSet31.Open;
     if PageControl.ActivePage=TabSheetGrants then
      DSet32.Open;
     if PageControl.ActivePage=TabSheetCurrent then                                 //Art?
      DSet33.Open;
     if PageControl.ActivePage=TabSheetVacation then
      DSet34.Open;
     if PageControl.ActivePage=TabSheetVacation then
      DSet34.Open;
   except
    on e:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
    end;
  end;
  end;
InitializeLabelFilter;
Filter:='Filter';
end;
end;
procedure TFStud.InitializeLabelFilter;
var text:string;
begin
text:='';
 if PParamFilter.KodSetup<>null then
   text:=GridClKodSetup_Caption[PLanguageIndex]+': '+dates.KodSetupToPeriod(PParamFilter.KodSetup,2);
 text:=text+  '        ' + VidTraining_Caption[PLanguageIndex] +': ';
 if PParamFilter.Contract='T' then
   text:=text+ LabelContracts_Caption[PLanguageIndex];
 if PParamFilter.Butget='T' then
 begin
   if PParamFilter.Contract='T' then text:=text+',  ';
   text:=text+ LabelButgets_Caption[PLanguageIndex];
 end;
 if  PParamFilter.id_dep <> null then
   text:=text+'        '+LabelDepartment_Caption[PLanguageIndex]+': '+PParamFilter.Depcaption;
 if  PParamFilter.id_prop <> null then
   text:=text+'        '+GridClPropertyName_Caption[PLanguageIndex]+': '+PParamFilter.PropCaption;
 if  PParamFilter.id_cat <> null then
   text:=text+'        '+LabelCategory_Caption[PLanguageIndex]+': '+PParamFilter.CatCaption;
 if  PParamFilter.id_man <> null then
   text:=text+'        '+Man_Caption[PLanguageIndex]+': '+PParamFilter.ManCaption;
  LabelFilter.Caption:=text;

end;

procedure TFStud.ButtonDepFilterClick(Sender: TObject);
var select :variant;
begin
 if ViewForm=nil then ViewForm:=TfGrAccDepart.Create(self,Dm.DB.Handle);

  ViewForm.NKodSetup:=PeriodToKodSetup(PParamFilter.Year,PParamFilter.Month);

 if ViewForm.ShowModal=mrYes then Select:=ViewForm.Result
                             else Select:=NULL;
 if select<>Null then
   begin
     PParamFilter.id_dep         :=Select[0]  ;
     PParamFilter.DepCaption     :=ViewForm.ResultNameDep;
     with DM do
     begin
      DSet31.Close;
      DSet32.Close;
      DSet33.Close;
      DSet34.Close;
      DSet21.Close;
      DSet1.Close;
      DSet1.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_B<>'', StringReplace(PParamFilter.Bal_B, ',' , '.' , [rfIgnoreCase]) , 'Null')+','
                                                                  +IfThen(PParamFilter.Bal_E<>'',StringReplace(PParamFilter.Bal_E, ',' , '.' , [rfIgnoreCase]),'Null')+','
                                                                  +varToStrDef(PParamFilter.id_vidopl,'Null')
                                                                  +') order by FIO';
      DSet21.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S(?ID_MAN,'''+PParamFilter.Contract+''')order by date_beg desc';
      try
        DSet1.Open;
        DSet21.Open;
        if PageControl.ActivePage=TabSheetTerms then
          DSet31.Open;
        if PageControl.ActivePage=TabSheetGrants then
          DSet32.Open;
        if PageControl.ActivePage=TabSheetCurrent then
          DSet33.Open;
        if PageControl.ActivePage=TabSheetVacation then
          DSet34.Open;
      except
        on e:Exception do
      begin
        grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
      end;
    end;
  end;
  InitializeLabelFilter;
 end;
end;

procedure TFStud.GridindexDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;
  if (PageControlChild.ActivePage=TabSheetIndex) and (DM.DSet5.active) then
  if DM.DSet5['ID_RECORD']=-1 then DeleteBtn.enabled:=false
  else  DeleteBtn.enabled:=true;
end;

procedure TFStud.FormShow(Sender: TObject);
begin
PageControl.ActivePage:=TabSheetTerms;
end;

procedure TFStud.GridindexDBTableView1DBColumn3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if AText='' then AText:='AUTO';
end;

procedure TFStud.dxBarLargeButton1Click(Sender: TObject);
var Parameter:TgrIndexacParam;
begin
if (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data/Gr_Menu_Indexing','Belong')=0 )
or (fibCheckPermission('/ROOT/Grant/Gr_Menu/Gr_Menu_Data','Belong')=0 )
     then
     begin //yes
        if DM.DSet1.IsEmpty then Exit;
        Parameter := TgrIndexacParam.Create;
        Parameter.DB_Handle := DM.DB.Handle;
        Parameter.Owner := self;
        Parameter.id_man:=DM.DSet1['id_man'];
        DoFunctionFromPackage(Parameter,Stud_IndexCount);
        Parameter.Destroy;

        if PageControlChild.ActivePage=TabSheetGrantData then
        begin
          if PageControl.ActivePage = TabSheetCurrent then
          begin
          if (Grid2DBTableView1.Controller.FocusedRecord=nil) or (Grid2DBTableView1.Controller.FocusedRecord.Expandable) then
          begin
            Grid33DBTableView1.DataController.DataSource := nil;
            EditPrikaz.DataBinding.DataSource := nil;
            EditDepartment.DataBinding.DataSource := nil;
            EditSmeta.DataBinding.DataSource := nil;
          end
          else
          begin
            DM.DSet33.CloseOpen(True);
            Grid33DBTableView1.DataController.DataSource := DM.DSource33;
            EditPrikaz.DataBinding.DataSource := DM.DSource33;
            EditDepartment.DataBinding.DataSource := DM.DSource33;
            EditSmeta.DataBinding.DataSource := DM.DSource33;
          end;
          Grid31DBTableView1FocusedRecordChanged(Grid33DBTableView1,nil,Grid33DBTableView1.Controller.FocusedRecord,True);
          end;


        end;
     end
     else
     begin
                BaseTypes.agMessageDlg('Увага!','Ви не маєте прав доступу до цієї інформації?',mtWarning,[mbOk]);
     end;



end;

procedure TFStud.ExportStudClick(Sender: TObject);
var
st,PathRes,PathTem :string ;
k,inc:integer;
wf:TForm;
begin
   xls:= TXLSReadWriteII2.Create(Application);

   SaveDialog1.FileName := 'StudReestr.xls';
   if (SaveDialog1.Execute) then
   begin
      // wf:=ShowWaitForm(self, zwfDoFunction);
      PathTem:= ExtractFilePath(Application.ExeName)+'Reports/Grant/StudReestr.xls';
      PathRes:=  SaveDialog1.FileName;
      if FileExists(PathRes) then DeleteFile(PathRes);
      CopyFile(pansichar(PathTem), pansichar(PathRes),true);
      xls.Filename := SaveDialog1.FileName;
      xls.Read;
      xls.ClearCells;
      //XLS.Sheets[0].Columns.SetColWidth(0,0,100);

      xls.Sheet[0].Name := 'Реєстр студентів за фільтром';
      xls.Sheet[0].AsString[0,0]:= 'Номер';
      xls.Sheet[0].AsString[1,0]:= 'Тип оплати';
      xls.Sheet[0].AsString[2,0]:= 'Шифр';
      xls.Sheet[0].AsString[3,0]:= 'Інн';
      xls.Sheet[0].AsString[4,0]:= 'ПІБ';
      xls.Sheet[0].AsString[5,0]:= 'Номер рахунку';
      xls.Sheet[0].AsString[6,0]:= 'Група';
      DM.Dset1.first;
      k:=1;


   while (not DM.Dset1.Eof) do
   begin
        xls.Sheet[0].AsInteger[0,k]:= k;
        if(DM.Dset1['TYPE_PAYMENT']<>null) then
            xls.Sheet[0].AsString[1,k]:= DM.Dset1['TYPE_PAYMENT']
        else
            xls.Sheet[0].AsString[1,k]:='';
        if(DM.Dset1['SHIFR']<>null) then
            xls.Sheet[0].AsInteger[2,k]:= DM.Dset1['SHIFR']
        else
            xls.Sheet[0].AsString[2,k]:='';
        if(DM.Dset1['TIN']<>null) then
            xls.Sheet[0].AsString[3,k]:= DM.Dset1['TIN']
        else xls.Sheet[0].AsString[3,k]:='';
        if(DM.Dset1['FIO']<>null) then
            xls.Sheet[0].AsString[4,k]:= DM.Dset1['FIO']
        else
            xls.Sheet[0].AsString[4,k]:='';
        if(DM.Dset1['ACCT_CARD']<>null) then
            xls.Sheet[0].AsString[5,k]:= DM.Dset1['ACCT_CARD']
        else
            xls.Sheet[0].AsString[5,k]:='';
        if(DM.Dset1['NAME_DEPARTMENT']<>null) then
            xls.Sheet[0].AsString[6,k]:= DM.Dset1['NAME_DEPARTMENT']
        else
            xls.Sheet[0].AsString[6,k]:='';
        makeBorders(0,k);
        makeBorders(1,k);
        makeBorders(2,k);
        makeBorders(3,k);
        makeBorders(4,k);
        makeBorders(5,k);
        makeBorders(6,k);
     k:=k+1;
    DM.Dset1.Next;
   end;
   //XLS.Sheets[0].Rows.SetRowHeight(0,k,300);
   XLS.Sheets[0].Columns.SetColWidth(0,1,1000);
   XLS.Sheets[0].Columns.SetColWidth(1,2,3000);
   XLS.Sheets[0].Columns.SetColWidth(2,3,1800);
   XLS.Sheets[0].Columns.SetColWidth(3,4,2700);
   XLS.Sheets[0].Columns.SetColWidth(4,5,8500);
   XLS.Sheets[0].Columns.SetColWidth(5,6,3500);
   XLS.Sheets[0].Columns.SetColWidth(6,7,2000);
   makeBorders(0,0);
   makeBorders(1,0);
   makeBorders(2,0);
   makeBorders(3,0);
   makeBorders(4,0);
   makeBorders(5,0);
   makeBorders(6,0);
   xls.Sheet[0].AsString[0,k]:= '';
   xls.Sheet[0].Cell[0,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[1,k]:= '';
   xls.Sheet[0].Cell[1,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[2,k]:= '';
   xls.Sheet[0].Cell[2,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[3,k]:= '';
   xls.Sheet[0].Cell[3,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[4,k]:= '';
   xls.Sheet[0].Cell[4,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[5,k]:= '';
   xls.Sheet[0].Cell[5,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[6,k]:= '';
   xls.Sheet[0].Cell[6,k].BorderTopStyle:=cbsMedium;
   xls.Write;
  // CloseWaitForm(wf);
   end ;
end;

procedure TFStud.makeBorders(col:integer; row:integer);
begin
   xls.Sheet[0].Cell[col,row].FontSize := 8;;
   xls.Sheet[0].Cell[col,row].BorderTopStyle:=cbsThin;
   xls.Sheet[0].Cell[col,row].BorderLeftStyle:=cbsThin;
   xls.Sheet[0].Cell[col,row].BorderBottomStyle:=cbsThin;
   xls.Sheet[0].Cell[col,row].BorderRightStyle:=cbsThin;
end;

end.


