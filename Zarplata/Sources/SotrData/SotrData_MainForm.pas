unit SotrData_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxSplitter, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, IBase, SotrData_FilterForm, cxContainer,
  cxLabel, cxDBLabel, cxTextEdit, cxDBEdit, dxBar,  Unit_zGlobal_Consts,
  z_dmCommonStyles, cxCalendar, cxGridBandedTableView,
  cxGridDBBandedTableView, cxMaskEdit, ComCtrls, dxBarExtItems,
  dxDockControl, dxDockPanel, cxMemo, PackageLoad, cxCheckBox, FIBQuery,
  pFIBQuery, pFIBStoredProc, zMessages, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxDropDownEdit, UpKernelUnit, cxButtonEdit, Menus, ZProc,
  IbDatabase, IBExternals, IB_Externals, Emails, cxHyperLinkEdit,
  accmgmt, cxPropertiesStore, Placemnt, AllPeopleUnit;


type
  TfmSotrData = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    DSourceMain: TDataSource;
    BarManager: TdxBarManager;
    DSetDetail: TpFIBDataSet;
    DSourceDetail: TDataSource;
    DSetBanded: TpFIBDataSet;
    DSourceBanded: TDataSource;
    DSet2: TpFIBDataSet;
    DSource2: TDataSource;
    InsertBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    ShowAvgBtn: TdxBarLargeButton;
    ShowAllDataBtn: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    FilterBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AcctCardBtn: TdxBarLargeButton;
    AvansBtn: TdxBarLargeButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    SmetaDataSet: TpFIBDataSet;
    SmetaDataSource: TDataSource;
    BonusSmetaDataSet: TpFIBDataSet;
    BonusSmetaDataSource: TDataSource;
    PeopleGrid: TcxGrid;
    PeopleGridDBTableView1: TcxGridDBTableView;
    cmnID_MAN: TcxGridDBColumn;
    cmnID_PCARD: TcxGridDBColumn;
    cmnTN: TcxGridDBColumn;
    cmnFIO: TcxGridDBColumn;
    cmnAvans: TcxGridDBColumn;
    cmnTypePayment: TcxGridDBColumn;
    cmnTin: TcxGridDBColumn;
    cmnBDate: TcxGridDBColumn;
    cmnShifr: TcxGridDBColumn;
    cmnSex: TcxGridDBColumn;
    PeopleGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    use_email: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    PageControl1: TPageControl;
    TabSheetRmoving: TTabSheet;
    Panel2: TPanel;
    PanelDetailGrid: TPanel;
    DetailGrid: TcxGrid;
    DetailGridDBTableView1: TcxGridDBTableView;
    Grid2ClRMoving: TcxGridDBColumn;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    DetailGridLevel1: TcxGridLevel;
    Panel6: TPanel;
    PageControl3: TPageControl;
    TabSheet2: TTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGridLevel4: TcxGridLevel;
    TabSheet1: TTabSheet;
    Panel10: TPanel;
    LabelCategor: TcxLabel;
    EditRazryad: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    EditDepartment: TcxDBMaskEdit;
    LabelPrikaz: TcxLabel;
    EditPrikaz: TcxDBMaskEdit;
    cxLabel1: TcxLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxSplitter2: TcxSplitter;
    Panel7: TPanel;
    DetailGridBanded: TcxGrid;
    DetailGridDBBandedTableView1: TcxGridDBBandedTableView;
    Grid22ClManMoving: TcxGridDBBandedColumn;
    Grid22ClDateBeg: TcxGridDBBandedColumn;
    Grid22ClRealDateEnd: TcxGridDBBandedColumn;
    Grid22ClNameSovmest: TcxGridDBBandedColumn;
    Grid22ClNamePost: TcxGridDBBandedColumn;
    Grid22ClStavka: TcxGridDBBandedColumn;
    Grid22ClKodSmBase: TcxGridDBBandedColumn;
    Grid22ClOkladBase: TcxGridDBBandedColumn;
    Grid22ClKodSmPPS: TcxGridDBBandedColumn;
    Grid22ClOkladPPS: TcxGridDBBandedColumn;
    DetailGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    Grid22ClPayment: TcxGridDBBandedColumn;
    DetailGridLevel4: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    PageControl2: TPageControl;
    TabSheetBMoving: TTabSheet;
    Panel8: TPanel;
    GridManBonus: TcxGrid;
    GridManBonusDBTableView: TcxGridDBTableView;
    KodVidoplColumn: TcxGridDBColumn;
    BonusNameColumn: TcxGridDBColumn;
    MoneyColumn: TcxGridDBColumn;
    BonusBegColumn: TcxGridDBColumn;
    BonusEndColumn: TcxGridDBColumn;
    OrderNumColumn: TcxGridDBColumn;
    GridManBonusUniverTV: TcxGridDBBandedTableView;
    GridManBonusUniverTVDBBandedColumn1: TcxGridDBBandedColumn;
    UniverVOKodColumn: TcxGridDBBandedColumn;
    UniverVONameColumn: TcxGridDBBandedColumn;
    UniverDateBegColumn: TcxGridDBBandedColumn;
    UniverDateEndColumn: TcxGridDBBandedColumn;
    UniverOrderNum: TcxGridDBBandedColumn;
    UniverPercentColumn: TcxGridDBBandedColumn;
    GridManBonusLevel: TcxGridLevel;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxSplitter5: TcxSplitter;
    Panel9: TPanel;
    cxGrid4: TcxGrid;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridLevel5: TcxGridLevel;
    TabSheetHolidays: TTabSheet;
    GridManHoliday: TcxGrid;
    GridManHolidayDBTableView1: TcxGridDBTableView;
    VODBColumn: TcxGridDBColumn;
    HolidayNameColumn: TcxGridDBColumn;
    HolDateBegColumn: TcxGridDBColumn;
    HolDateEndColumn: TcxGridDBColumn;
    HolPeriodBegColumn: TcxGridDBColumn;
    HolPeriodEndColumn: TcxGridDBColumn;
    HolidayOrderNumColumn: TcxGridDBColumn;
    HolidayOrderDateColumn: TcxGridDBColumn;
    ispayColumn: TcxGridDBColumn;
    HolNumberOfDaysColumn: TcxGridDBColumn;
    GridManHolidayLevel1: TcxGridLevel;
    Panel5: TPanel;
    LProject: TcxLabel;
    cxDBTextEditProject: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    TabSheetRMovingExc: TTabSheet;
    GridRMovingExc: TcxGrid;
    GridRMovingExcDBTableView1: TcxGridDBTableView;
    GridRMovingExcClDateBeg: TcxGridDBColumn;
    GridRMovingExcClDateEnd: TcxGridDBColumn;
    GridRMovingExcDBTableView1DBColumn1: TcxGridDBColumn;
    GridRMovingExcLevel1: TcxGridLevel;
    TabSheetDopNach: TTabSheet;
    GridDopNach: TcxGrid;
    GridDopNachDBTableView1: TcxGridDBTableView;
    GridDopNachClVO: TcxGridDBColumn;
    GridDopNachClVidOpl: TcxGridDBColumn;
    GridDopNachClSumma: TcxGridDBColumn;
    GridDopNachClDateBeg: TcxGridDBColumn;
    GridDopNachClDateEnd: TcxGridDBColumn;
    GridDopNachLevel1: TcxGridLevel;
    TabSheetDedConst: TTabSheet;
    GridDedConst: TcxGrid;
    GridDedConstDBTableView1: TcxGridDBTableView;
    GridDedConstClVO: TcxGridDBColumn;
    GridDedConstClVidOpl: TcxGridDBColumn;
    GridDedConstClSumma: TcxGridDBColumn;
    GridDedConstClDateBeg: TcxGridDBColumn;
    GridDedConstClDateEnd: TcxGridDBColumn;
    GridDedConstLevel1: TcxGridLevel;
    TabSheetRemont: TTabSheet;
    GridRemont: TcxGrid;
    GridRemontDBBandedTableView1: TcxGridDBBandedTableView;
    GridRemontClGHours: TcxGridDBBandedColumn;
    GridRemontClHours: TcxGridDBBandedColumn;
    GridRemontClTarif: TcxGridDBBandedColumn;
    GridRemontClDayMonth: TcxGridDBBandedColumn;
    GridRemontClTarifRemont: TcxGridDBBandedColumn;
    GridRemontClClockRemont: TcxGridDBBandedColumn;
    GridRemontLevel1: TcxGridLevel;
    TabSheetWorkMode: TTabSheet;
    GridPeoplesWorkMode: TcxGrid;
    PeopleWorkModeTableView: TcxGridDBTableView;
    PeopleWorkModeColumn1: TcxGridDBColumn;
    PeopleWorkModeColumn2: TcxGridDBColumn;
    PeopleWorkModeColumn3: TcxGridDBColumn;
    PeopleWorkModeTableViewDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TabSheetComand: TTabSheet;
    cxGrid1: TcxGrid;
    ComandirovkiTableView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    ComandirovkiTableViewDBColumn1: TcxGridDBColumn;
    ComandirovkiTableViewDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxSplitter4: TcxSplitter;
    TabSheetHospital: TTabSheet;
    GridManHospital: TcxGrid;
    GridManHospitalDBTableView: TcxGridDBTableView;
    VOColumn: TcxGridDBColumn;
    DateBegColumn: TcxGridDBColumn;
    DateEndColumn: TcxGridDBColumn;
    SeriaColumn: TcxGridDBColumn;
    NumColumn: TcxGridDBColumn;
    PercentColumn: TcxGridDBColumn;
    ReestrNumColumn: TcxGridDBColumn;
    is_firstColumn: TcxGridDBColumn;
    GridManHospitalLevel1: TcxGridLevel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBMaskEdit3: TcxDBMaskEdit;
    cxDBMaskEdit4: TcxDBMaskEdit;
    TabSheetInvalid: TTabSheet;
    GridInvalid: TcxGrid;
    GridInvalidDBTableView1: TcxGridDBTableView;
    GridInvalidClDateBeg: TcxGridDBColumn;
    GridInvalidClDateEnd: TcxGridDBColumn;
    GridInvalidClNote: TcxGridDBColumn;
    GridInvalidLevel1: TcxGridLevel;
    TabSheetCurrent: TTabSheet;
    GridCurrent: TcxGrid;
    GridCurrentDBTableView1: TcxGridDBTableView;
    GridCurrentClKodSetup: TcxGridDBColumn;
    GridCurrentClSmeta: TcxGridDBColumn;
    GridCurrentClDepartment: TcxGridDBColumn;
    GridCurrentClVo: TcxGridDBColumn;
    GridCurrentClVidOpl: TcxGridDBColumn;
    GridCurrentClSumma: TcxGridDBColumn;
    GridCurrentClPeriod: TcxGridDBColumn;
    GridCurrentClSovmest: TcxGridDBColumn;
    GridCurrentDBTableView1DBColumn1: TcxGridDBColumn;
    GridCurrentNDay: TcxGridDBColumn;
    GridCurrentClock: TcxGridDBColumn;
    GridCurrentSUM_Clock: TcxGridDBColumn;
    GridCurrentPercent: TcxGridDBColumn;
    GridCurrentPrikaz: TcxGridDBColumn;
    GridCurrentLevel1: TcxGridLevel;
    SplitterCurrent: TcxSplitter;
    PanelCurrentGroup: TPanel;
    EditCategoryCurrent: TcxDBMaskEdit;
    LabelCategoryCurrent: TcxLabel;
    LabelDepartmentCurrent: TcxLabel;
    EditDepartmentCurrent: TcxDBMaskEdit;
    LabelSmetaCurrent: TcxLabel;
    EditSmetaCurrent: TcxDBMaskEdit;
    LEnterDate: TcxLabel;
    EditEnterDate: TcxDBMaskEdit;
    LPrikaz: TcxLabel;
    EditPrikaz1: TcxDBMaskEdit;
    LNDay: TcxLabel;
    EditNDay: TcxDBMaskEdit;
    LClock: TcxLabel;
    EditClock: TcxDBMaskEdit;
    LPercent: TcxLabel;
    EditPercent: TcxDBMaskEdit;
    LSumClock: TcxLabel;
    EditSumClock: TcxDBMaskEdit;
    TabSheetAlimony: TTabSheet;
    PanelAlimonyDopData: TPanel;
    EditDocumentAlimony: TcxDBMaskEdit;
    LabelDocumentAlimony: TcxLabel;
    SendPeopleLabelAlimony: TcxLabel;
    SendPeopleEditAlimony: TcxDBMaskEdit;
    SendAdressEditAlimony: TcxDBMaskEdit;
    SendAdressLabelAlimony: TcxLabel;
    SplitterAlimony: TcxSplitter;
    GridAlimony: TcxGrid;
    GridAlimonyDBTableView1: TcxGridDBTableView;
    GridAlimonyClDolg: TcxGridDBColumn;
    GridAlimonyClDateBeg: TcxGridDBColumn;
    GridAlimonyClDateEnd: TcxGridDBColumn;
    GridAlimonyClPercent: TcxGridDBColumn;
    GridAlimonyClMaxPercent: TcxGridDBColumn;
    GridAlimonyClPochtaPercent: TcxGridDBColumn;
    GridAlimonyLevel1: TcxGridLevel;
    TabSheetPriv: TTabSheet;
    GridPeoplePriv: TcxGrid;
    GridPeoplePrivDBTableView1: TcxGridDBTableView;
    GridPeoplePrivClPrivKod: TcxGridDBColumn;
    GridPeoplePrivClPrivName: TcxGridDBColumn;
    GridPeoplePrivClDateBeg: TcxGridDBColumn;
    GridPeoplePrivClDateEnd: TcxGridDBColumn;
    GridPeoplePrivClExpense: TcxGridDBColumn;
    GridPeoplePrivLevel1: TcxGridLevel;
    TabSheetProp: TTabSheet;
    GridPeopleProp: TcxGrid;
    GridPeoplePropDBTableView1: TcxGridDBTableView;
    GridPeoplePropClPropName: TcxGridDBColumn;
    GridPeoplePropClDateBeg: TcxGridDBColumn;
    GridPeoplePropClDateEnd: TcxGridDBColumn;
    GridPeoplePropLevel1: TcxGridLevel;
    TabSheetIndex: TTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    TabSheetHospByMoving: TTabSheet;
    Panel11: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxDBMaskEdit5: TcxDBMaskEdit;
    cxDBMaskEdit6: TcxDBMaskEdit;
    cxDBMaskEdit7: TcxDBMaskEdit;
    GridManHospitalByRMoving: TcxGrid;
    GridManHospitalByRMovingDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    DataSetPcard: TpFIBDataSet;
    DataSetAlg: TpFIBDataSet;
    ComandirovkiClVidOpl: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCurrentClKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridNonSpisokClKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure DSetBandedFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DetailGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ShowAvgBtnClick(Sender: TObject);
    procedure PanelCurrentDopDataResize(Sender: TObject);
    procedure PanelAlimonyDopDataResize(Sender: TObject);
    procedure PeopleGridDBTableView1KeyPress(Sender: TObject;
      var Key: Char);
    procedure ShowAllDataBtnClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure AcctCardBtnClick(Sender: TObject);
    procedure AvansBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmnTypePaymentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DSet2AfterClose(DataSet: TDataSet);
    procedure cmnShifrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure PeopleWorkModeTableViewDblClick(Sender: TObject);
    procedure EditCategoryCurrentPropertiesChange(Sender: TObject);
    procedure EditDepartmentCurrentPropertiesChange(Sender: TObject);
    procedure EditSmetaCurrentPropertiesChange(Sender: TObject);
    procedure EditEnterDatePropertiesChange(Sender: TObject);
    procedure EditPrikaz1PropertiesChange(Sender: TObject);
    procedure EditNDayPropertiesChange(Sender: TObject);
    procedure EditClockPropertiesChange(Sender: TObject);
    procedure EditPercentPropertiesChange(Sender: TObject);
    procedure EditSumClockPropertiesChange(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure PeoplePanelCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure use_emailPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PeopleGridDBTableView1DblClick(Sender: TObject);
    procedure ComandirovkiTableViewDBColumn1GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGridDBTableView1DBColumn5GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PAOwner:TComponent;
    use_zemail:Variant;
    pKodSetupBeg:Integer;
    pKodSetupEnd:Integer;
    pKodSetupCurrent :Integer;
    pStylesDM:TStylesDM;
    pLanguageIndex:Byte;
    pUseManHospRMoving :string;
    ActiveAlg : Integer;
    DateBegAlg,DateEndAlg : Tdate;
//    pBarLocate:TZBarLocate;
    pFilterParams:TSotrFilter;
    pNumPredpr:integer;
    procedure ApplyFilter;
    procedure ResetDetail;
    procedure DisableAllDBControls;
//Details
    procedure LoadPeopleProp;
    procedure LoadCurrent;
    procedure LoadNonSpisok;
    procedure LoadDopNach;
    procedure LoadDedConst;
    procedure LoadInvalid;
    procedure LoadAlimony;
    procedure LoadPeoplePriv;
    procedure LoadRemont;
    procedure LoadRMovingExc;
    procedure LoadManBonus;
    procedure LoadManHospital;
    procedure LoadManHoliday;
    procedure LoadPeopleWorkMode;
    procedure LoadComandirovki;
    procedure LoadIndexActs;
    procedure LoadManHospitalRMoving;
    procedure GetPcard;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;FilterParams:TSotrFilter); reintroduce;
  end;

implementation

{$R *.dfm}

uses StrUtils, Dates, cxLookAndFeels, ZWait, ZTypes, Math;

procedure TfmSotrData.ResetDetail;
var id_rmoving:int64;
begin
  id_rmoving:=-1;
  if DSetDetail.Active
  then begin
            if DSetDetail.RecordCount>0
            then id_rmoving:=DSetDetail['rmoving'];
            
            DSetDetail.Close;
  end;


  if DSetBanded.Active then DSetBanded.Close;
  if (ShowAllDataBtn=nil) or (ShowAllDataBtn.Down) then
  begin
     DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING_BY_PERIOD(?OUT_ID_MAN,'''+
                                      DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order by DATE_END descending';

     DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_(?OUT_ID_MAN,'''+
                                      DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order by REAL_END descending,RMOVING';


     //DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_PERIOD(?OUT_ID_MAN,'''+
     //                                 DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order by REAL_END descending,RMOVING';
  end
  else
  begin
     DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING_BY_PERIOD(?OUT_ID_MAN,NULL,NULL) order by DATE_END descending';

     //DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_PERIOD(?OUT_ID_MAN,NULL,NULL) order by REAL_END descending,RMOVING';

     DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_(?OUT_ID_MAN,NULL,NULL) order by REAL_END descending,RMOVING';
  end;
  DSetDetail.Open;
  DSetDetail.Locate('rmoving',id_rmoving,[]);
  DSetBanded.Open;
  DetailGridDBBandedTableView1.Controller.GridView.ViewData.Expand(true);

end;

procedure TfmSotrData.ApplyFilter;
var wf:TForm;
    str:string;
    id:Integer;
begin
  id:=-1;
  wf:=ShowWaitForm(Self);
  try
    pKodSetupBeg := DateToKodSetup(pFilterParams.DateBeg);
    pKodSetupEnd := DateToKodSetup(pFilterParams.DateEnd);  
    if DSetMain.Active
    then begin
              if DSetMain.RecordCount>0
              then id:=DSetMain.FieldByName('OUT_TN').Value;
              DSetMain.Close;
    end;

    str := 'SELECT DISTINCT * FROM Z_GET_SOTR_DATA(';

    if pFilterParams.Is_man then
    begin
        if pFilterParams.Tn>0
        then str := str + IntToStr(pFilterParams.Tn)+','
        else str := str + 'NULL,';
    end
    else str := str + 'NULL,';

    if pFilterParams.Is_main_job
    then str := str + '''1'','
    else str := str + 'NULL,';

    if pFilterParams.Is_notmain_job
    then str := str + '''1'','
    else str := str + 'NULL,';

    if (pFilterParams.Is_department) and (pFilterParams.Id_department>0)
    then str := str + IntToStr(pFilterParams.Id_department) + ','
    else str := str + 'NULL,';
    
    if (pFilterParams.Is_priv) and (pFilterParams.id_priv>0)                    // учитывать льготы
    then str := str + inttostr(pFilterParams.id_priv) + ',' + IfThen(pFilterParams.has_priv,'''1'',','''0'',')
    else str := str + 'NULL,NULL,';

    if (pFilterParams.Is_prop) and (pFilterParams.Id_prop>0)                    // учитывать свойства
    then str := str + inttostr(pFilterParams.id_prop) + ',' + IfThen(pFilterParams.has_prop,'''1'',','''0'',')
    else str := str + ' NULL,NULL,';

    if (pFilterParams.Is_raise) and (pFilterParams.Id_Raise>0)                  // учитывать надбавки
    then str := str + IntToStr(pFilterParams.Id_Raise) + ',' + IfThen(pFilterParams.has_raise,'''1'',','''0'',')
    else str := str + 'NULL,NULL,';

    if pFilterParams.Is_period then                                             // учитывать период
    begin
        if pFilterParams.Is_just_leaved then str := str + '''1'','              // искать только уволенных в этот период
                                        else str := str + 'NULL,';              // искать всех
        str := str + ''''+DateToStr(pFilterParams.DateBeg)+''',';
        str := str + ''''+DateToStr(pFilterParams.DateEnd)+''') order by OUT_TN';
    end
    else
        str := str + 'NULL,NULL,NULL) order by OUT_TN';
                           
    DSetMain.SQLs.SelectSQL.Text := str;
    DSetMain.Open;
    DSetMain.Locate('OUT_TN',id,[]);


  finally
    CloseWaitForm(wf);
  end;
end;


constructor TfmSotrData.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;FilterParams:TSotrFilter);
begin
  inherited Create(AOwner);
  PageControl1.ActivePage:=TabSheetRmoving;
  PageControl2.ActivePage:=TabSheetBMoving;
  //cxSplitter2.CloseSplitter;
  //cxLabel3.Left:=Panel2.Width-cxLabel3.Width-1;
  //cxLabel4.Left:=Panel2.Width-cxLabel4.Width-1;
  pLanguageIndex                                 := LanguageIndex;
  pKodSetupBeg                                   := CurrentKodSetup(ADB_Handle);
  pKodSetupEnd                                   := CurrentKodSetup(ADB_Handle);
  pKodSetupCurrent                               := CurrentKodSetup(ADB_Handle);
  pNumPredpr                                     := StrToInt(VarToStrDef(ValueFieldZSetup(ADB_Handle,'NUM_PREDPR'),'0'));
  pUseManHospRMoving                            := VarToStrDef(ValueFieldZSetup(ADB_Handle,'USE_MAN_HOSP_R_MOVING'),'0');
//******************************************************************************
  DB.Handle                                      := ADB_Handle;
  PAOwner                                        := AOwner;
  ReadTransaction.Active                         := True;
  Caption                                        := GetConst('Workers',tcForm);
//******************************************************************************
  pStylesDM                                      := TStylesDM.Create(Self);

  PeopleGridDBTableView1.Styles.StyleSheet       := pStylesDM.GridTableViewStyleSheetDevExpress;
  DetailGridDBTableView1.Styles.StyleSheet       := pStylesDM.GridTableViewStyleSheetDevExpress;
  DetailGridDBBandedTableView1.Styles.StyleSheet := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
  cxGridDBBandedTableView1.Styles.StyleSheet     := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
  GridPeoplePropDBTableView1.Styles.StyleSheet   := pStylesDM.GridTableViewStyleSheetDevExpress;
  PeopleWorkModeTableView.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridCurrentDBTableView1.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridDopNachDBTableView1.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridDedConstDBTableView1.Styles.StyleSheet     := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridInvalidDBTableView1.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridAlimonyDBTableView1.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridPeoplePrivDBTableView1.Styles.StyleSheet   := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridRMovingExcDBTableView1.Styles.StyleSheet   := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridManBonusUniverTV.Styles.StyleSheet         := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
  GridManHospitalDBTableView.Styles.StyleSheet   := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridManHospitalByRMovingDBTableView2.Styles.StyleSheet   := pStylesDM.GridTableViewStyleSheetDevExpress;
  GridManHolidayDBTableView1.Styles.StyleSheet   := pStylesDM.GridTableViewStyleSheetDevExpress;
  ComandirovkiTableView.Styles.StyleSheet        := pStylesDM.GridTableViewStyleSheetDevExpress;
  cxGridDBTableView1.Styles.StyleSheet           := pStylesDM.GridTableViewStyleSheetDevExpress;
  cxGridDBBandedTableView2.Styles.StyleSheet     := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
//******************************************************************************
  pFilterParams := FilterParams;
//  ShowMessage(inttostr(pFilterParams.Id_Raise));
  ApplyFilter;
  ResetDetail;
//******************************************************************************
  InsertBtn.Caption                  := GetConst('Insert',tcButton);
  UpdateBtn.Caption                  := GetConst('Update',tcButton);
  DeleteBtn.Caption                  := GetConst('Delete',tcButton);
  DetailBtn.Caption                  := GetConst('Detail',tcButton);
  FilterBtn.Caption                  := GetConst('Filter',tcButton);
  ExitBtn.Caption                    := GetConst('Exit',tcButton);
  AcctCardBtn.Caption                := GetConst('AcctCard',tcButton);
  ShowAllDataBtn.Caption             := GetConst('KodSetup',tcButton);
  ShowAvgBtn.Caption                 := GetConst('Avarage',tcButton);
  AvansBtn.Caption                   := GetConst('Avans',tcButton);
  dxBarLargeButton1.Caption          := 'Перегляд розрахунку';  //GetConst('TestRazr',tcButton);
//******************************************************************************
  TabSheetRmoving.Caption            := GetConst('RMoving',tcTabSheet);
  TabSheetBMoving.Caption            := GetConst('BMoving',tcTabSheet);
  TabSheetHolidays.Caption           := GetConst('Holiday',tcTabSheet);
  TabSheetRMovingExc.Caption         := GetConst('Exception',tcTabSheet);
  TabSheetHospital.Caption           := GetConst('Hospital',tcTabSheet);
  TabSheetHospByMoving.Caption       := GetConst('Hospital',tcTabSheet);
  TabSheetInvalid.Caption            := GetConst('Invalid',tcTabSheet);
  TabSheetCurrent.Caption            := GetConst('Current',tcTabSheet);
  TabSheetAlimony.Caption            := GetConst('Alimony',tcTabSheet);
  TabSheetDopNach.Caption            := GetConst('DopNach',tcTabSheet);
  TabSheetDedConst.Caption           := GetConst('DedConst',tcTabSheet);
  TabSheetPriv.Caption               := GetConst('Priv',tcTabSheet);
  TabSheetProp.Caption               := GetConst('Prop',tcTabSheet);
  TabSheetWorkMode.Caption           := GetConst('WorkMode',tcTabSheet);
  TabSheetRemont.Caption             := GetConst('Remont',tcTabSheet);
  TabSheetIndex.Caption              := 'Індексація';

//******************************************************************************
  LabelSmetaCurrent.Caption          := GetConst('Smeta',tcLabel);
  LabelDepartmentCurrent.Caption     := GetConst('Department',tcLabel);
  LabelCategoryCurrent.Caption       := GetConst('Category',tcLabel);
  LEnterDate.Caption                 := GetConst('EnterDate',tcLabel);
  LPrikaz.Caption                    := GetConst('Prikaz',tcLabel);
  LNDay.Caption                      := GetConst('NDay',tcLabel);
  LClock.Caption                     := GetConst('Clock',tcLabel);
  LPercent.Caption                   := GetConst('Percent',tcLabel);
  LSumClock.Caption                  := GetConst('SumClock',tcLabel);
  LabelDepartment.Caption            := GetConst('Department',tcLabel);
  LabelPrikaz.Caption                := GetConst('Prikaz',tcLabel);
  LabelCategor.Caption               := GetConst('Category',tcLabel);
  LabelDocumentAlimony.Caption       := GetConst('Document',tcLabel);
  SendPeopleLabelAlimony.Caption     := GetConst('SendPeople',tcLabel);
  SendAdressLabelAlimony.Caption     := GetConst('SendAdress',tcLabel);
//******************************************************************************
  cmnTN.Caption                      := GetConst('Tn',tcGridColumn);
  cmnFIO.Caption                     := GetConst('FIO',tcGridColumn);

  Grid2ClPeriodBeg.Caption           := GetConst('DateBeg',tcGridColumn);
  Grid2ClPeriodEnd.Caption           := GetConst('DateEnd',tcGridColumn);
//  Grid2ClNameSovmest.Caption         := GetConst('Sovmest',tcGridColumn);

  Grid22ClDateBeg.Caption            := GetConst('DateBeg',tcGridColumn);
  Grid22ClRealDateEnd.Caption        := GetConst('DateEnd',tcGridColumn);
  Grid22ClNamePost.Caption           := GetConst('Post',tcGridColumn);
  Grid22ClStavka.Caption             := GetConst('Stavka',tcGridColumn);
  Grid22ClPayment.Caption            := GetConst('Oklad',tcGridColumn);
{  Grid22ClOkladBase.Caption          := GetConst('SummaBase',tcGridColumn);
  Grid22ClOkladPPS.Caption           := GetConst('SummaPPS',tcGridColumn);
  Grid22ClKodSmBase.Caption          := GetConst('KodSmBase',tcGridColumn);
  Grid22ClKodSmPPS.Caption           := GetConst('KodSmPPS',tcGridColumn);
}
  GridPeoplePropClPropName.Caption   := GetConst('Property',tcGridColumn);
  GridPeoplePropClDateBeg.Caption    := GetConst('PeriodBeg',tcGridColumn);
  GridPeoplePropClDateEnd.Caption    := GetConst('PeriodEnd',tcGridColumn);

  GridCurrentClKodSetup.Caption      := GetConst('KodSetup',tcGridColumn);
  GridCurrentClDepartment.Caption    := GetConst('KodDepartment',tcGridColumn);
  GridCurrentClSumma.Caption         := GetConst('Summa',tcGridColumn);
  GridCurrentClSmeta.Caption         := GetConst('KodSmeta',tcGridColumn);
  GridCurrentClVo.Caption            := GetConst('KodVidopl',tcGridColumn);
  GridCurrentClVidOpl.Caption        := GetConst('NameVidopl',tcGridColumn);
  GridCurrentClPeriod.Caption        := GetConst('WorkPeriod',tcGridColumn);
  GridCurrentClSovmest.Caption       := GetConst('Sovmest',tcGridColumn);

  GridDopNachClVO.Caption            := GetConst('KodVidopl',tcGridColumn);
  GridDopNachClVidOpl.Caption        := GetConst('NameVidopl',tcGridColumn);
  GridDopNachClSumma.Caption         := GetConst('Summa',tcGridColumn);
  GridDopNachClDateBeg.Caption       := GetConst('PeriodBeg',tcGridColumn);
  GridDopNachClDateEnd.Caption       := GetConst('PeriodEnd',tcGridColumn);

  GridDedConstClVO.Caption           := GetConst('KodVidopl',tcGridColumn);
  GridDedConstClVidOpl.Caption       := GetConst('NameVidopl',tcGridColumn);
  GridDedConstClSumma.Caption        := GridClSumma_Caption[PLanguageIndex]+'/'+GridClPercent_Caption[PLanguageIndex];//GetConst('Summa',tcGridColumn);
  GridDedConstClDateBeg.Caption      := GetConst('PeriodBeg',tcGridColumn);
  GridDedConstClDateEnd.Caption      := GetConst('PeriodEnd',tcGridColumn);

  GridInvalidClNote.Caption          := GetConst('Note',tcGridColumn);
  GridInvalidClDateBeg.Caption       := GetConst('PeriodBeg',tcGridColumn);
  GridInvalidClDateEnd.Caption       := GetConst('PeriodEnd',tcGridColumn);

  GridAlimonyClPercent.Caption       := GetConst('PercentSign',tcGridColumn);
  GridAlimonyClDateBeg.Caption       := GetConst('PeriodBeg',tcGridColumn);
  GridAlimonyClDateEnd.Caption       := GetConst('PeriodEnd',tcGridColumn);
  GridAlimonyClDolg.Caption          := GetConst('Dolg',tcGridColumn);
  GridAlimonyClMaxPercent.Caption    := GetConst('MaxPercent',tcGridColumn);
  GridAlimonyClPochtaPercent.Caption := GetConst('PochtaPercent',tcGridColumn);

  GridPeoplePrivClExpense.Caption    := GetConst('Expense',tcGridColumn);
  GridPeoplePrivClPrivKod.Caption    := GetConst('Kod',tcGridColumn);
  GridPeoplePrivClPrivName.Caption   := GetConst('Priv',tcGridColumn);
  GridPeoplePrivClDateBeg.Caption    := GetConst('PeriodBeg',tcGridColumn);
  GridPeoplePrivClDateEnd.Caption    := GetConst('PeriodEnd',tcGridColumn);

  GridRMovingExcClDateBeg.Caption    := GetConst('PeriodBeg',tcGridColumn);
  GridRMovingExcClDateEnd.Caption    := GetConst('PeriodEnd',tcGridColumn);

  UniverVOKodColumn.Caption          := GetConst('KodVidopl',tcGridColumn);
  UniverVONameColumn.Caption         := GetConst('NameVidopl',tcGridColumn);
  UniverDateBegColumn.Caption        := GetConst('DateBeg',tcGridColumn);
  UniverDateEndColumn.Caption        := GetConst('DateEnd',tcGridColumn);
  //UniverMainSummColumn.Caption       := GetConst('SummaBase',tcGridColumn);
  //UniverPPSSummColumn.Caption        := GetConst('SummaPPS',tcGridColumn);
  //UniverMainSmetaColumn.Caption      := GetConst('KodSmBase',tcGridColumn);
  //UniverPPSSmetaColumn.Caption       := GetConst('KodSmPPS',tcGridColumn);
  UniverOrderNum.Caption             := GetConst('Prikaz',tcGridColumn);

  DateBegColumn.Caption              := GetConst('PeriodBeg',tcGridColumn);
  DateEndColumn.Caption              := GetConst('PeriodEnd',tcGridColumn);
  SeriaColumn.Caption                := GetConst('Seria',tcGridColumn);
  NumColumn.Caption                  := GetConst('Number',tcGridColumn);
  PercentColumn.Caption              := GetConst('Percent',tcGridColumn);
  ReestrNumColumn.Caption            := GetConst('Reestr',tcGridColumn);

  cxGridDBColumn7.Caption              := GetConst('PeriodBeg',tcGridColumn);
  cxGridDBColumn8.Caption              := GetConst('PeriodEnd',tcGridColumn);
  cxGridDBColumn9.Caption                := GetConst('Seria',tcGridColumn);
  cxGridDBColumn10.Caption                  := GetConst('Number',tcGridColumn);
  cxGridDBColumn11.Caption              := GetConst('Percent',tcGridColumn);
  cxGridDBColumn12.Caption            := GetConst('Reestr',tcGridColumn);

  HolidayNameColumn.Caption          := GetConst('Name',tcGridColumn);
  HolPeriodBegColumn.Caption         := GetConst('PeriodBeg',tcGridColumn);
  HolPeriodEndColumn.Caption         := GetConst('PeriodEnd',tcGridColumn);
  HolDateBegColumn.Caption           := GetConst('DateBeg',tcGridColumn);
  HolDateEndColumn.Caption           := GetConst('DateEnd',tcGridColumn);
  HolidayOrderNumColumn.Caption      := GetConst('Prikaz',tcGridColumn);

  PeopleWorkModeColumn1.Caption      := GetConst('WorkModeTitle',tcGridColumn);
  PeopleWorkModeColumn2.Caption      := GetConst('PeriodBeg',tcGridColumn);
  PeopleWorkModeColumn3.Caption      := GetConst('PeriodEnd',tcGridColumn);
//******************************************************************************
//  pBarLocate                         := TZBarLocate.Create(BarManager);
//  pBarLocate.DataSet                 := DSetMain;
//  pBarLocate.BorderStyle             := bbsNone;
//  pBarLocate.AddLocateItem(cmnTN.DataBinding.FieldName,cmnTN.Caption,[loCaseInsensitive]);
//  pBarLocate.AddLocateItem(cmnFIO.DataBinding.FieldName,cmnFIO.Caption,[loCaseInsensitive,loPartialKey]);
//pBarLocate.DockControl             := LocateBarDockControl;
//******************************************************************************
  SplitterCurrent.Color              := GridCurrentDBTableView1.Styles.Header.Color;
  PanelCurrentGroup.Color          := GridCurrentDBTableView1.Styles.Background.Color;
//******************************************************************************
  SplitterAlimony.Color              := GridAlimonyDBTableView1.Styles.Header.Color;
  PanelAlimonyDopData.Color          := GridAlimonyDBTableView1.Styles.Background.Color;
//******************************************************************************
 (GridRemontClTarifRemont.Properties as TcxMaskEditProperties).EditMask := '\d\d?\d?\d?\d?\d?(['+ZSystemDecimalSeparator+']\d\d?)?';
 (GridRemontClTarifRemont.Properties as TcxMaskEditProperties).MaskKind := emkRegExpr;
 (GridRemontClTarifRemont.Properties as TcxMaskEditProperties).ReadOnly := False;
 (GridRemontClClockRemont.Properties as TcxMaskEditProperties).EditMask := '\d\d?\d?\d?(['+ZSystemDecimalSeparator+']\d\d?\d?)?';
 (GridRemontClClockRemont.Properties as TcxMaskEditProperties).MaskKind := emkRegExpr;
 (GridRemontClClockRemont.Properties as TcxMaskEditProperties).ReadOnly := False;
//******************************************************************************
{      cxDBTextEdit1.DataBinding.DataSource:=nil;
      cxDBTextEdit2.DataBinding.DataSource:=nil;
      cxDBTextEdit3.DataBinding.DataSource:=nil;
      cxDBTextEdit4.DataBinding.DataSource:=nil;
      cxDBTextEdit5.DataBinding.DataSource:=nil;   }

  DataSetAlg.Close;
  DataSetAlg.SQLs.SelectSQL.Text:='SELECT * FROM Z_SYS_ALGORITM where ID_ALGORITM='+inttostr(2);
  DataSetAlg.Open;

  ActiveAlg := DataSetAlg.FieldByname('ACTIV_ALGORITM').AsInteger;
  //DateBegAlg := DataSetAlg.FieldByname('DATE_BEG').AsDateTime;
 // DateEndAlg := DataSetAlg.FieldByname('DATE_END').AsDateTime;

  if (ActiveAlg=0) then
  begin
      TabSheetHospByMoving.Destroy;
  end;

  PageControl2Change(self);
  ShowAllDataBtnClick(self);
  if pNumPredpr<>1 then TabSheetRemont.Destroy;


 // if pUseManHospRMoving='T' then TabSheetHospital.Destroy
  //else TabSheetHospByMoving.Destroy;
//******************************************************************************
end;

procedure TfmSotrData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfmSotrData.LoadPeopleWorkMode;
begin
     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceDetail;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLE_WORKMODE_SELECT_FORMAN(?RMoving)';
     if not DSetDetail.IsEmpty then DSet2.Open;
     PeopleWorkModeTableView.DataController.DataSource:=DSource2;
end;


procedure TfmSotrData.LoadPeopleProp;
begin
 if DSet2.Active then DSet2.Close;
 DSet2.DataSource:=DSourceMain;
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLE_PROP_SELECT_FORMAN(?OUT_ID_MAN,''F'')';
 if not DSetMain.IsEmpty then DSet2.Open;
 GridPeoplePropDBTableView1.DataController.DataSource:=DSource2;
end;

procedure TfmSotrData.LoadCurrent;
begin
 if DSet2.Active then DSet2.Close;
 DSet2.DataSource:=DSourceMain;
 DSet2.SQLs.SelectSQL.Text := 'select * from Z_CURRENT_SELECT_DATA(?OUT_ID_MAN,'
                              +IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)
                              +',NULL,NULL,NULL,NULL) ORDER BY KOD_SETUP descending';

 GridCurrentDBTableView1.DataController.DataSource := DSource2;                              
 if not DSetMain.IsEmpty then DSet2.Open;

 EditSmetaCurrent.DataBinding.DataSource      := DSource2;
 EditDepartmentCurrent.DataBinding.DataSource := DSource2;
 EditCategoryCurrent.DataBinding.DataSource   := DSource2;
 EditEnterDate.DataBinding.DataSource         := DSource2;
 EditNDay.DataBinding.DataSource              := DSource2;
 EditClock.DataBinding.DataSource             := DSource2;
 EditSumClock.DataBinding.DataSource          := DSource2;
 EditPercent.DataBinding.DataSource           := DSource2;
 EditPrikaz1.DataBinding.DataSource           := DSource2;

end;

procedure TfmSotrData.LoadNonSpisok;
begin
end;

procedure TfmSotrData.LoadDopNach;
begin
 if DSet2.Active then DSet2.Close;
 DSet2.DataSource:=DSourceDetail;
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_DOP_NACH_SELECT(?RMOVING,'''
                      //      +IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)+') order By DATE_BEG';
                              +DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order By OUT_DATE_BEG';
 if not DSetDetail.IsEmpty then DSet2.Open;
 GridDopNachDBTableView1.DataController.DataSource := DSource2;
end;

procedure TfmSotrData.LoadDedConst;
begin
 if DSet2.Active then DSet2.Close;
 DSet2.DataSource:=DSourceDetail;
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_DEDCONST_SELECT(?RMOVING,'+IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)+') order by DATE_BEG';
//                              +DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order By DATE_BEG';
 if not DSetDetail.IsEmpty    then DSet2.Open;
 GridDedConstDBTableView1.DataController.DataSource := DSource2;
end;

procedure TfmSotrData.LoadInvalid;
begin
 if DSet2.Active then DSet2.Close;
 DSet2.DataSource:=DSourceMain;
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_INVALID_SELECT_FOR_MAN(?OUT_ID_MAN)';
 if not DSetMain.IsEmpty then DSet2.Open;
 GridInvalidDBTableView1.DataController.DataSource := DSource2;
end;

procedure TfmSotrData.LoadAlimony;
begin
 if DSet2.Active then DSet2.Close;
 DSet2.DataSource:=DSourceMain;
 DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ALIMONY_SELECT(?OUT_ID_MAN)';
 if not DSetMain.IsEmpty then DSet2.Open;

 EditDocumentAlimony.DataBinding.DataSource   := DSource2;
 SendPeopleEditAlimony.DataBinding.DataSource := DSource2;
 SendAdressEditAlimony.DataBinding.DataSource := DSource2;
 GridAlimonyDBTableView1.DataController.DataSource := DSource2;
end;

procedure TfmSotrData.LoadPeoplePriv;
begin
     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceMain;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLE_PRIV_S(?OUT_ID_MAN)';
     if not DSetMain.IsEmpty then DSet2.Open;
     GridPeoplePrivDBTableView1.DataController.DataSource := DSource2;
end;

procedure TfmSotrData.LoadRemont;
begin
     InsertBtn.Enabled:=False;
     UpdateBtn.Enabled:=False;
     DeleteBtn.Enabled:=False;
     DetailBtn.Enabled:=False;

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceDetail;
     DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_S(?RMOVING,NULL) Order by DayMonth';
     if not DSetDetail.IsEmpty then DSet2.Open;
     GridRemontDBBandedTableView1.Bands[0].Caption:=
                  DSetMain.FieldByName('OUT_TN').AsString+' - '+DSetMain.FieldByName('OUT_FIO').AsString;
     GridRemontDBBandedTableView1.DataController.DataSource:=DSource2;
end;

procedure TfmSotrData.LoadRMovingExc;
begin
     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceDetail;
     DSet2.SQLs.SelectSQL.Text:= 'select * from Z_RMOVING_EXC_S(?RMOVING) order by DATE_BEG';
     if not DSetDetail.IsEmpty then DSet2.Open;
     GridRMovingExcDBTableView1.DataController.DataSource:=DSource2;
end;

procedure TfmSotrData.LoadManBonus;
begin
     InsertBtn.Enabled:=False;
     UpdateBtn.Enabled:=False;
     DeleteBtn.Enabled:=False;
     DetailBtn.Enabled:=False;

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceBanded;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_MAN_BONUS_(?ID_MAN_MOVING,?DATE_BEG,?REAL_END) ORDER BY BONUS_BEG';
     if not DSetBanded.IsEmpty then DSet2.Open;
     GridManBonusUniverTV.DataController.DataSource:=DSource2;
     cxDBTextEdit4.DataBinding.DataSource:=DSource2;
     cxDBTextEdit5.DataBinding.DataSource:=DSource2;
end;

procedure TfmSotrData.LoadManHospital;
begin
     InsertBtn.Enabled:=False;
     UpdateBtn.Enabled:=False;
     DeleteBtn.Enabled:=False;
     DetailBtn.Enabled:=False;
     ShowAvgBtn.Visible:=ivAlways;

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceMain;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_MAN_HOSPITAL(?OUT_ID_MAN) order by DATE_BEG desc';
     GridManHospitalDBTableView.DataController.DataSource:=DSource2;
     if not DSetMain.IsEmpty then DSet2.Open;
     cxDBMaskEdit2.DataBinding.DataSource:=DSource2;
     cxDBMaskEdit3.DataBinding.DataSource:=DSource2;
     cxDBMaskEdit4.DataBinding.DataSource:=DSource2;
end;

procedure TfmSotrData.LoadManHospitalRMoving;
begin
     //InsertBtn.Enabled:=False;
   //  UpdateBtn.Enabled:=False;
   //  DeleteBtn.Enabled:=False;
     DetailBtn.Enabled:=False;
     ShowAvgBtn.Visible:=ivAlways;

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceDetail;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM MAN_HOSPITAL_RMOVING_SEL_FULL(?RMOVING) order by DATE_BEG desc';
     if not DSetMain.IsEmpty then DSet2.Open;

     GridManHospitalByRMovingDBTableView2.DataController.DataSource:=DSource2;
     cxDBMaskEdit2.DataBinding.DataSource:=DSource2;
     cxDBMaskEdit3.DataBinding.DataSource:=DSource2;
     cxDBMaskEdit4.DataBinding.DataSource:=DSource2;
end;

procedure TfmSotrData.LoadManHoliday;
begin
     InsertBtn.Enabled:=False;
     UpdateBtn.Enabled:=False;
     DeleteBtn.Enabled:=False;
     DetailBtn.Enabled:=False;
     ShowAvgBtn.Visible:=ivAlways;

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceDetail;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_MAN_HOLIDAYS(?RMOVING) order by HOLIDAY_BEG desc, DATE_BEG';
     if not DSetDetail.IsEmpty then DSet2.Open;
     GridManHolidayDBTableView1.DataController.DataSource:=DSource2;
     cxDBTextEdit1.DataBinding.DataSource:=DSource2;
     cxDBTextEdit2.DataBinding.DataSource:=DSource2;
     cxDBTextEditProject.DataBinding.DataSource:=DSource2;
end;

procedure TfmSotrData.DisableAllDBControls;
begin
     if GridPeoplePropDBTableView1   <> nil then GridPeoplePropDBTableView1.DataController.DataSource   := nil;
     if GridCurrentDBTableView1      <> nil then GridCurrentDBTableView1.DataController.DataSource      := nil;
     if GridDopNachDBTableView1      <> nil then GridDopNachDBTableView1.DataController.DataSource      := nil;
     if GridDedConstDBTableView1     <> nil then GridDedConstDBTableView1.DataController.DataSource     := nil;
     if GridInvalidDBTableView1      <> nil then GridInvalidDBTableView1.DataController.DataSource      := nil;
     if GridAlimonyDBTableView1      <> nil then GridAlimonyDBTableView1.DataController.DataSource      := nil;
     if GridPeoplePrivDBTableView1   <> nil then GridPeoplePrivDBTableView1.DataController.DataSource   := nil;
     if GridRemontDBBandedTableView1 <> nil then GridRemontDBBandedTableView1.DataController.DataSource := nil;
     if GridRMovingExcDBTableView1   <> nil then GridRMovingExcDBTableView1.DataController.DataSource   := nil;
     if GridManBonusDBTableView      <> nil then GridManBonusDBTableView.DataController.DataSource      := nil;
     if GridManHospitalByRMovingDBTableView2 <> nil then GridManHospitalByRMovingDBTableView2.DataController.DataSource     := nil;

    // Теперь выключаются поля редактирования
    //RMoving
     if EditRazryad <> nil then EditRazryad.DataBinding.DataSource            := nil;
     if EditDepartment <> nil then EditDepartment.DataBinding.DataSource            := nil;
     if EditPrikaz <> nil then EditPrikaz.DataBinding.DataSource            := nil;
     if cxDBMaskEdit1 <> nil then cxDBMaskEdit1.DataBinding.DataSource            := nil;
     if cxDBTextEdit4 <> nil then cxDBTextEdit4.DataBinding.DataSource            := nil;
     if cxDBTextEdit5 <> nil then cxDBTextEdit5.DataBinding.DataSource            := nil;
     if cxDBTextEditProject <> nil then cxDBTextEditProject.DataBinding.DataSource            := nil;
     if cxDBTextEdit1 <> nil then cxDBTextEdit1.DataBinding.DataSource            := nil;
     if cxDBTextEdit2 <> nil then cxDBTextEdit2.DataBinding.DataSource            := nil;
    //Holiday
     if cxDBMaskEdit2 <> nil then cxDBMaskEdit2.DataBinding.DataSource            := nil;
     if cxDBMaskEdit3 <> nil then cxDBMaskEdit3.DataBinding.DataSource            := nil;
     if cxDBMaskEdit4 <> nil then cxDBMaskEdit4.DataBinding.DataSource            := nil;
    //Current
     if EditSmetaCurrent <> nil then EditSmetaCurrent.DataBinding.DataSource      := nil;
     if EditDepartmentCurrent <> nil then EditDepartmentCurrent.DataBinding.DataSource := nil;
     if EditCategoryCurrent <> nil then EditCategoryCurrent.DataBinding.DataSource   := nil;
     if EditEnterDate <> nil then EditEnterDate.DataBinding.DataSource          := nil;
     if EditNDay <> nil then EditNDay.DataBinding.DataSource               := nil;
     if EditClock <> nil then EditClock.DataBinding.DataSource              := nil;
     if EditSumClock <> nil then EditSumClock.DataBinding.DataSource           := nil;
     if EditPercent <> nil then EditPercent.DataBinding.DataSource            := nil;
     if EditPrikaz1 <> nil then EditPrikaz1.DataBinding.DataSource            := nil;
    //Alimony
     if EditDocumentAlimony <> nil then EditDocumentAlimony.DataBinding.DataSource   := nil;
     if SendPeopleEditAlimony <> nil then SendPeopleEditAlimony.DataBinding.DataSource := nil;
     if SendAdressEditAlimony <> nil then SendAdressEditAlimony.DataBinding.DataSource := nil;
end;

procedure TfmSotrData.GridCurrentClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if AText<>''
     then begin
               try
               AText:=KodSetupToPeriod(StrToInt(AText),1);
               except on E:Exception do
               end;
     end;
end;

procedure TfmSotrData.GridNonSpisokClKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     if AText<>''
     then begin
               try
               AText:=KodSetupToPeriod(StrToInt(AText),1);
               except on E:Exception do
               end;
     end;          
end;

procedure TfmSotrData.GetPcard;
begin
   DataSetPcard.Close;
   DataSetPcard.SQLs.SelectSQL.Text:='SELECT * FROM UP_GET_ID_PCARD_BY_ID_MAN(:oUT_ID_MAN,:date_acc)';
   DataSetPcard.ParamByName('oUT_ID_MAN').AsInteger  := DSetMain['OUT_ID_MAN'];;
   DataSetPcard.ParamByName('date_acc').Asdate       := pFilterParams.DateBeg;
   DataSetPcard.Open;
end;

procedure TfmSotrData.InsertBtnClick(Sender: TObject);
var ParameterPeopleProp:TZPeoplePropParameters;
    ParameterCurrent:TZCurrentParameters;
    ParameterDopNach:TDopNachControlParameter;
    ParameterDedConst:TDedConstControlParameter;
    ParameterHospRMoving:THospRMovingParameter;
    ParameterInvalid:TZCtrlWithHistoryParam;
    ParameterAlimony:TZAlimonyParameters;
    ParameterPeoplePriv:TZPeoplePrivParameters;
    ParameterPeopleWorkModeProp:TZPeopleWorkModeParameters;
    ParameterPeopleComandirovki:TZPeopleComandirovParameters;
    IndexParameters:TZIndexParameters;
    ResLoad:variant;
    KOD_VIDOPL_DEF:string;
begin
  if PageControl1.ActivePage=TabSheetRmoving then
  begin
    // Исключения в трудовых договорах
    if PageControl2.ActivePage=TabSheetRMovingExc then
    begin
       ResLoad := 0;
       if not DSetDetail.IsEmpty then ResLoad := LoadRMovingExcCtrl(self,DB.Handle,zcfsInsert,DSetDetail['RMOVING']);
       if ResLoad>0 then
       begin
         DSet2.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.SQLs.RefreshSQL.Text := 'select * from Z_RMOVING_EXC_S_BY_ID('+IntToStr(ResLoad)+')';
         DSet2.Insert;
         DSet2.Post;
         DSet2.SQLs.InsertSQL.Clear;
         DSet2.SQLs.RefreshSQL.Clear;
       end;
    end;

    if (PageControl2.ActivePage=TabSheetDopNach) and (not DsetDetail.IsEmpty) then
    begin                                
      ParameterDopNach.AOwner:=self;
      ParameterDopNach.ADb_Handle:=DB.Handle;
      ParameterDopNach.AControlFormStyle:=zcfsInsert;
      ParameterDopNach.AId:=DSetDetail['RMOVING'];
      ResLoad:=LoadDopNachControl(ParameterDopNach);
      If ResLoad<>NULL then
      begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_DOP_NACH',ResLoad,[loCaseInsensitive]);
      end;
    end;

    if (PageControl2.ActivePage=TabSheetDedConst) and (not DsetDetail.IsEmpty) then
    begin
       ParameterDedConst.AOwner:=self;
       ParameterDedConst.ADb_Handle:=DB.Handle;
       ParameterDedConst.AControlFormStyle:=zcfsInsert;
       ParameterDedConst.AId:=DSetDetail['RMOVING'];
       ResLoad:=LoadDedConstControl(ParameterDedConst);
       If ResLoad<>NULL then
       begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_DEDCONST',ResLoad,[loCaseInsensitive]);
       end;
    end;

    if (PageControl2.ActivePage=TabSheetHospByMoving) and (not DsetDetail.IsEmpty) then
    begin
       ParameterHospRMoving.AOwner:=self;
       ParameterHospRMoving.ADb_Handle:=DB.Handle;
       ParameterHospRMoving.AControlFormStyle:=zcfsInsert;
       ParameterHospRMoving.AId       :=DSetMain['OUT_ID_MAN'];
       GetPcard;
       ParameterHospRMoving.AId_Pcard :=DataSetPcard.FieldByname('ID_PCARD').Asinteger;
       ResLoad:=LoadHospRMovingControl(ParameterHospRMoving);
       If ResLoad<>NULL then
       begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_man_hosp',ResLoad,[loCaseInsensitive]);
       end;
    end;
  end;

  if (PageControl1.ActivePage=TabSheetInvalid) and (not DSetMain.IsEmpty) then
  begin
     ParameterInvalid.ID := DSetMain['OUT_ID_MAN'];
     ParameterInvalid.ControlFormStyle := zcfsInsert;
     ResLoad:=LoadInvalidControl(self,DB.Handle,ParameterInvalid);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID',ResLoad[1],[loCaseInsensitive]);
     end;
  end;

  if (PageControl1.ActivePage=TabSheetCurrent) and (not DSetMain.IsEmpty) then
  begin
     ParameterCurrent.ID:=DSetMain['OUT_ID_MAN'];
     ParameterCurrent.TypeID:=zcptRMoving;
     ParameterCurrent.Owner:=self;
     ParameterCurrent.ControlFormStyle:=zcfsInsert;
     ParameterCurrent.Db_Handle:=DB.Handle;
     ResLoad:=LoadCurrentControl(ParameterCurrent);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_CURRENT',ResLoad[1],[loCaseInsensitive]);
     end;
  end;



  if (PageControl1.ActivePage=TabSheetAlimony) and (not DSetMain.IsEmpty) then
  begin
     ParameterAlimony.ID := DSetMain['OUT_ID_MAN'];
     ParameterAlimony.ControlFormStyle := zcfsInsert;
     ResLoad:=LoadAlimonyControl(self,DB.Handle,ParameterAlimony);
     if (VarArrayDimCount(ResLoad)>0) and ResLoad[0]=mrYes then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_ALIMONY',ResLoad[1],[loCaseInsensitive]);
     end;
  end;

  if (PageControl1.ActivePage=TabSheetIndex) and (not DSetMain.IsEmpty) then
  begin
       IndexParameters.id_man := DSetMain['OUT_ID_MAN'];
       IndexParameters.ID :=-1;
       IndexParameters.ControlFormStyle := zcfsInsert;
       ResLoad:=LoadIndexActsControl(self,DB.Handle,IndexParameters);
       if (VarArrayDimCount(ResLoad)>=0) then
       begin
           DSet2.CloseOpen(True);
           DSet2.Locate('ID_RECORD',ResLoad[0],[loCaseInsensitive]);
       end;
  end;

  if (PageControl1.ActivePage=TabSheetPriv) and (not DSetMain.IsEmpty) then
  begin
     ParameterPeoplePriv.ID := DSetMain['OUT_ID_MAN'];
     ParameterPeoplePriv.TypeId := zppctIdPeople;
     ParameterPeoplePriv.ControlFormStyle := zcfsInsert;
     ResLoad:=LoadPeoplePrivControl(self,DB.Handle,ParameterPeoplePriv);
     if (VarArrayDimCount(ResLoad)>0) and ResLoad[0]=mrYes then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_PEOPLE_PRIV',ResLoad[1],[loCaseInsensitive]);
     end;
  end;


  if PageControl1.ActivePage=TabSheetProp then
  begin
     ParameterPeopleProp.ID := DSetMain['OUT_ID_MAN'];
     ParameterPeopleProp.TypeId := zppptIdMan;
     ParameterPeopleProp.ControlFormStyle := zcfsInsert;
     ResLoad:=LoadPeoplePropControl(self,DB.Handle,ParameterPeopleProp);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID',ResLoad[1],[loCaseInsensitive]);
     end;
  end;

  if (PageControl2.ActivePage=TabSheetWorkMode) and (not DsetDetail.IsEmpty) then
  begin
       ParameterPeopleWorkModeProp.rmoving := DSetDetail['RMOVING'];
       ParameterPeopleWorkModeProp.ControlFormStyle := zcfsInsert;
       ResLoad:=LoadPeopleWorkModeControl(self,DB.Handle,ParameterPeopleWorkModeProp);
       if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
       begin
            DSet2.CloseOpen(True);
            DSet2.Locate('ID_PEOPLE_WORKMODE',ResLoad[1],[loCaseInsensitive]);
       end;
  end;

  if (PageControl2.ActivePage=TabSheetComand) and (not DsetDetail.IsEmpty)
  then begin
            StProcTransaction.Starttransaction;
            try
            StoredProc.StoredProcName:='Z_GET_VIDOPL_KOD_BY_CONST';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_VIDOPL_PROP').AsInteger :=1901;
            StoredProc.ExecProc;
            KOD_VIDOPL_DEF:=StoredProc.ParamByName('KOD_VIDOPL').AsString;
            StProcTransaction.commit;
            except
            StProcTransaction.Rollback;
            end;


            ParameterPeopleComandirovki.rmoving := DSetDetail['RMOVING'];
            ParameterPeopleComandirovki.ControlFormStyle := zcfsInsert;
            ParameterPeopleComandirovki.KOD_VIDOPL:=KOD_VIDOPL_DEF; //defkodkomanderovki

            ResLoad:=LoadPeopleComandiriovkiControl(self,DB.Handle,ParameterPeopleComandirovki);
            if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
            begin
                  DSet2.CloseOpen(True);
                  DSet2.Locate('ID_COM',ResLoad[1],[loCaseInsensitive]);
            end;
  end;


end;

procedure TfmSotrData.UpdateBtnClick(Sender: TObject);
var ParameterPeopleProp:TZPeoplePropParameters;
    ParameterCurrent:TZCurrentParameters;
    ParameterDopNach:TDopNachControlParameter;
    ParameterDedConst:TDedConstControlParameter;
    ParameterInvalid:TZCtrlWithHistoryParam;
    ParameterAlimony:TZAlimonyParameters;
    ParameterPeoplePriv:TZPeoplePrivParameters;
    ParameterPeopleWorkModeProp:TZPeopleWorkModeParameters;
    ParameterPeopleComandirovki:TZPeopleComandirovParameters;
        ParameterHospRMoving:THospRMovingParameter;
    IndexParameters:TZIndexParameters;
    ResLoad:variant;
begin
  if PageControl1.ActivePage=TabSheetRmoving then
  begin
    // Исключения в трудовых договорах
    if PageControl2.ActivePage=TabSheetRMovingExc then
    begin
       ResLoad := 0;
       if not DSet2.IsEmpty then ResLoad := LoadRMovingExcCtrl(self,DB.Handle,zcfsUpdate,DSet2['ID']);
       if ResLoad>0
       then begin
                 DSet2.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
                 DSet2.SQLs.RefreshSQL.Text := 'select * from Z_RMOVING_EXC_S_BY_ID('+IntToStr(ResLoad)+')';
                 DSet2.Edit;
                 DSet2.Post;
                 DSet2.SQLs.UpdateSQL.Clear;
                 DSet2.SQLs.RefreshSQL.Clear;
       end;
    end;

    if (PageControl2.ActivePage=TabSheetDopNach) and (not Dset2.IsEmpty) then
    begin
      ParameterDopNach.AOwner:=self;
      ParameterDopNach.ADb_Handle:=DB.Handle;
      ParameterDopNach.AControlFormStyle:=zcfsUpdate;
      ParameterDopNach.AId:=DSet2['ID_DOP_NACH'];
      ResLoad:=LoadDopNachControl(ParameterDopNach);
      If ResLoad<>NULL then
      begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_DOP_NACH',ResLoad,[loCaseInsensitive]);
      end;
    end;

    if (PageControl2.ActivePage=TabSheetComand) and (not Dset2.IsEmpty)
    then begin
              ParameterPeopleComandirovki.rmoving :=DSetDetail['RMOVING'];
              ParameterPeopleComandirovki.ID      :=DSet2['ID_COM'];
              ParameterPeopleComandirovki.date_beg:=DSet2['DATE_BEG'];
              ParameterPeopleComandirovki.date_end:=DSet2['DATE_END'];
              ParameterPeopleComandirovki.avg_sum :=DSet2['AVG_SUM'];
              ParameterPeopleComandirovki.ControlFormStyle := zcfsUpdate;
              ParameterPeopleComandirovki.id_smeta:=DSet2['ID_SMETA'];
              ParameterPeopleComandirovki.id_vidopl:=ifThen(DSet2['ID_VIDOPL']<>NULL,DSet2['ID_VIDOPL'],-1);
              ParameterPeopleComandirovki.kod_vidopl:=VarToStrDef(DSet2['KOD_VIDOPL'],'');
              if DSet2['ID_SMETA']<>NULL
              then ParameterPeopleComandirovki.smeta_kod:=VArToStr(DSet2['SMETA_KOD'])
              else ParameterPeopleComandirovki.smeta_kod:='АВТО';
              ResLoad:=LoadPeopleComandiriovkiControl(self,DB.Handle,ParameterPeopleComandirovki);
              if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
              begin
                    DSet2.CloseOpen(True);
                    DSet2.Locate('ID_COM',ParameterPeopleComandirovki.ID,[]);
              end;
    end;

    if (PageControl2.ActivePage=TabSheetWorkMode) and (not Dset2.IsEmpty) then
    begin
         ParameterPeopleWorkModeProp.ControlFormStyle:=zcfsUpdate;
         ParameterPeopleWorkModeProp.ID:=DSet2['ID_PEOPLE_WORKMODE'];
         ParameterPeopleWorkModeProp.id_workmode:=DSet2['ID_WORKMODE'];
         ParameterPeopleWorkModeProp.rmoving:=DSetDetail['RMOVING'];
         ParameterPeopleWorkModeProp.date_beg:=DSet2['DATE_BEG'];
         ParameterPeopleWorkModeProp.date_end:=DSet2['DATE_END'];
         ParameterPeopleWorkModeProp.SHIFT   :=DSet2['SHIFT'];
         ResLoad:=LoadPeopleWorkModeControl(self,DB.Handle,ParameterPeopleWorkModeProp);
         if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
         begin
            DSet2.CloseOpen(True);
            DSet2.Locate('ID_PEOPLE_WORKMODE',ParameterPeopleWorkModeProp.ID,[loCaseInsensitive]);
         end;
    end;


    if (PageControl2.ActivePage=TabSheetDedConst) and (not Dset2.IsEmpty) then
    begin
       ParameterDedConst.AOwner:=self;
       ParameterDedConst.ADb_Handle:=DB.Handle;
       ParameterDedConst.AControlFormStyle:=zcfsUpdate;
       ParameterDedConst.AId:=DSet2['ID_DEDCONST'];
       ResLoad:=LoadDedConstControl(ParameterDedConst);
       If ResLoad<>NULL then
       begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_DEDCONST',ResLoad,[loCaseInsensitive]);
       end;
    end;
  end;

  if (PageControl1.ActivePage=TabSheetInvalid) and (not DSet2.IsEmpty) then
  begin
     ParameterInvalid.ID := DSet2['ID'];
     ParameterInvalid.Use_DateTime := DSet2['USE_END'];
     ParameterInvalid.ControlFormStyle := zcfsUpdate;
     ResLoad:=LoadInvalidControl(self,DB.Handle,ParameterInvalid);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID',ParameterInvalid.ID,[loCaseInsensitive]);
     end;
  end;

  if (PageControl1.ActivePage=TabSheetCurrent) and (not DSet2.IsEmpty) then
  begin
     ParameterCurrent.ID:=DSet2['ID_CURRENT'];
     ParameterCurrent.TypeID:=zcptIdCurrent;
     ParameterCurrent.Owner:=self;
     ParameterCurrent.ControlFormStyle:=zcfsUpdate;
     ParameterCurrent.Db_Handle:=DB.Handle;
     ResLoad:=LoadCurrentControl(ParameterCurrent);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_CURRENT',ParameterCurrent.ID,[loCaseInsensitive]);
     end;
  end;

  if (PageControl1.ActivePage=TabSheetAlimony) and (not DSet2.IsEmpty) then
  begin
     ParameterAlimony.ID := DSet2['ID_ALIMONY'];
     ParameterAlimony.ControlFormStyle := zcfsUpdate;
     ResLoad:=LoadAlimonyControl(self,DB.Handle,ParameterAlimony);
     if (VarArrayDimCount(ResLoad)>0) and ResLoad[0]=mrYes then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_ALIMONY',ParameterAlimony.ID,[loCaseInsensitive]);
     end;
  end;

  if (PageControl1.ActivePage=TabSheetIndex) and (not DSetMain.IsEmpty) then
  begin
       IndexParameters.ID           :=DSet2['ID_RECORD'];
       IndexParameters.id_man       :=DSetMain['OUT_ID_MAN'];
       IndexParameters.ActualDate   :=DSet2['kod_setup_date_'];
       IndexParameters.IndexBaseDate:=DSet2['base_kod_setup_date_'];
       IndexParameters.SUMMA_IND_FACT:=VarToStrDef(DSet2['SUMMA_IND_FACT'],'');
       IndexParameters.SUMMA_IND_FIX :=VarToStrDef(DSet2['SUMMA_IND_FIX'],'');

       IndexParameters.SUMMA_IND_FIX_BOOL:= True;
       IndexParameters.SUMMA_IND_FACT_BOOL:=True;
       IndexParameters.IS_HAND_EDIT:= True;

       if DSet2['IS_HAND_EDIT_FIX']=0  then
         IndexParameters.SUMMA_IND_FIX_BOOL:=False;
       if DSet2['SUMMA_IND_FACT']=null  then
         IndexParameters.SUMMA_IND_FACT_BOOL:=False;
       if DSet2['IS_HAND_EDIT']=0  then
         IndexParameters.IS_HAND_EDIT:=False;

       IndexParameters.ControlFormStyle := zcfsUpdate;
       ResLoad:=LoadIndexActsControl(self,DB.Handle,IndexParameters);
       if (VarArrayDimCount(ResLoad)>0) 
       then begin
                 DSet2.CloseOpen(True);
                 DSet2.Locate('ID_RECORD',ResLoad[0],[]);
                 {DSet2.RefreshSQL:=DSet2.SelectSQL;
                 DSet2.Refresh;
                 DSet2.Locate('ID_RECORD',ResLoad[0],[loCaseInsensitive]); }

       end;
  end;

  if (PageControl1.ActivePage=TabSheetPriv) and (not DSet2.IsEmpty) then
  begin
     ParameterPeoplePriv.ID := DSet2['ID_PEOPLE_PRIV'];
     ParameterPeoplePriv.TypeId := zppctIdPeoplePriv;
     ParameterPeoplePriv.ControlFormStyle := zcfsUpdate;
     ResLoad:=LoadPeoplePrivControl(self,DB.Handle,ParameterPeoplePriv);
     if (VarArrayDimCount(ResLoad)>0) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_PEOPLE_PRIV',ParameterPeoplePriv.ID,[loCaseInsensitive]);
     end;
  end;


  if (PageControl1.ActivePage=TabSheetProp) and (not DSet2.IsEmpty)  then
  begin
     ParameterPeopleProp.ID := DSet2['ID'];
     ParameterPeopleProp.TypeId := zppptIdPeopleProp;
     ParameterPeopleProp.ControlFormStyle := zcfsUpdate;
     ResLoad:=LoadPeoplePropControl(self,DB.Handle,ParameterPeopleProp);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID',ParameterPeopleProp.ID,[loCaseInsensitive]);
     end;
  end;

  if (PageControl2.ActivePage=TabSheetHospByMoving) and (not DsetDetail.IsEmpty) then
  begin
       ParameterHospRMoving.AOwner:=self;
       ParameterHospRMoving.ADb_Handle:=DB.Handle;
       ParameterHospRMoving.AControlFormStyle:=zcfsUpdate;
       ParameterHospRMoving.AId       :=DSetMain['OUT_ID_MAN'];
       GetPcard;
       ParameterHospRMoving.AId_Pcard :=DataSetPcard.FieldByname('ID_PCARD').Asinteger;
       ParameterHospRMoving.AId_Hosp:=DSet2['ID_MAN_HOSP'];
       ResLoad:=LoadHospRMovingControl(ParameterHospRMoving);
       If ResLoad<>NULL then
       begin
         DSet2.CloseOpen(True);
         DSet2.Locate('ID_man_hosp',ResLoad,[loCaseInsensitive]);

       end;
  end;
end;

procedure TfmSotrData.DeleteBtnClick(Sender: TObject);
var ParameterPeopleProp:TZPeoplePropParameters;
    ParameterCurrent:TZCurrentParameters;
    ParameterDopNach:TDopNachControlParameter;
    ParameterDedConst:TDedConstControlParameter;
    ParameterInvalid:TZCtrlWithHistoryParam;
    ParameterAlimony:TZAlimonyParameters;
    ParameterPeoplePriv:TZPeoplePrivParameters;
    ParameterPeopleWorkModeProp:TZPeopleWorkModeParameters;
    ParameterPeopleComandirovki:TZPeopleComandirovParameters;
    IndexParameters:TZIndexParameters;
    ResLoad:variant;
begin
  if PageControl1.ActivePage=TabSheetRmoving then
  begin
    // Исключения в трудовых договорах
    if PageControl2.ActivePage=TabSheetRMovingExc then
    begin
       ResLoad := 0;
       if not DSet2.IsEmpty then ResLoad := LoadRMovingExcCtrl(self,DB.Handle,zcfsDelete,DSet2['ID']);
       if ResLoad>0 then
       begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
       end;
    end;

    if (PageControl2.ActivePage=TabSheetDopNach) and (not Dset2.IsEmpty) then
    begin
      ParameterDopNach.AOwner:=self;
      ParameterDopNach.ADb_Handle:=DB.Handle;
      ParameterDopNach.AControlFormStyle:=zcfsDelete;
      ParameterDopNach.AId:=DSet2['ID_DOP_NACH'];
      ResLoad:=LoadDopNachControl(ParameterDopNach);
      If ResLoad<>NULL then
      begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
      end;
    end;


    if (PageControl2.ActivePage=TabSheetWorkMode) and (not Dset2.IsEmpty) then
    begin
         ParameterPeopleWorkModeProp.ControlFormStyle:=zcfsDelete;
         ParameterPeopleWorkModeProp.ID:=DSet2['ID_PEOPLE_WORKMODE'];
         ResLoad:=LoadPeopleWorkModeControl(self,DB.Handle,ParameterPeopleWorkModeProp);
         If (VarArrayDimCount(ResLoad)>0) then
         begin
              DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
              DSet2.Delete;
              DSet2.SQLs.DeleteSQL.Clear;
         end;
    end;

    if (PageControl2.ActivePage=TabSheetComand) and (not Dset2.IsEmpty) then
    begin
         ParameterPeopleComandirovki.ControlFormStyle:=zcfsDelete;
         ParameterPeopleComandirovki.ID      :=DSet2['ID_COM'];
         ParameterPeopleComandirovki.rmoving :=DSet2['rmoving'];
         ParameterPeopleComandirovki.date_beg:=DSet2['DATE_BEG'];
         ParameterPeopleComandirovki.date_end:=DSet2['DATE_END'];

         ResLoad:=LoadPeopleComandiriovkiControl(self,DB.Handle,ParameterPeopleComandirovki);
         If (VarArrayDimCount(ResLoad)>0) then
         begin
              DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
              DSet2.Delete;
              DSet2.SQLs.DeleteSQL.Clear;
         end;
    end;

    if (PageControl2.ActivePage=TabSheetDedConst) and (not Dset2.IsEmpty) then
    begin
       ParameterDedConst.AOwner:=self;
       ParameterDedConst.ADb_Handle:=DB.Handle;
       ParameterDedConst.AControlFormStyle:=zcfsDelete;
       ParameterDedConst.AId:=DSet2['ID_DEDCONST'];
       ResLoad:=LoadDedConstControl(ParameterDedConst);
       If ResLoad<>NULL then
       begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
       end;
    end;
  end;

  if (PageControl1.ActivePage=TabSheetInvalid) and (not DSet2.IsEmpty) then
  begin
     ParameterInvalid.ID := DSet2['ID'];
     ParameterInvalid.ControlFormStyle := zcfsDelete;
     ParameterInvalid.Use_DateTime := DSet2['USE_END'];
     ResLoad:=LoadInvalidControl(self,DB.Handle,ParameterInvalid);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
     end;
  end;

  if (PageControl1.ActivePage=TabSheetCurrent) and (not DSet2.IsEmpty) then
  begin
     ParameterCurrent.ID:=DSet2['ID_CURRENT'];
     ParameterCurrent.TypeID:=zcptIdCurrent;
     ParameterCurrent.Owner:=self;
     ParameterCurrent.ControlFormStyle:=zcfsDelete;
     ParameterCurrent.Db_Handle:=DB.Handle;
     ResLoad:=LoadCurrentControl(ParameterCurrent);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
     end;
  end;

  if (PageControl1.ActivePage=TabSheetAlimony) and (not DSet2.IsEmpty) then
  begin
     ParameterAlimony.ID := DSet2['ID_ALIMONY'];
     ParameterAlimony.ControlFormStyle := zcfsDelete;
     ResLoad:=LoadAlimonyControl(self,DB.Handle,ParameterAlimony);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
         DSet2.CloseOpen(True);
     end;
  end;

  if (PageControl1.ActivePage=TabSheetIndex) and (not DSetMain.IsEmpty) then
  begin
       if DSet2['ID_RECORD']>-1
       then begin
                 IndexParameters.ID := DSet2['ID_RECORD'];
                 ResLoad:= DSet2['KOD_SETUP'];
                 IndexParameters.ControlFormStyle := zcfsDelete;
                 LoadIndexActsControl(self,DB.Handle,IndexParameters);
                 DSet2.CloseOpen(true);
                 Dset2.Locate('KOD_SETUP',ResLoad,[]);
       end;
  end;

  if (PageControl1.ActivePage=TabSheetPriv) and (not DSet2.IsEmpty) then
  begin
     ParameterPeoplePriv.ID := DSet2['ID_PEOPLE_PRIV'];
     ParameterPeoplePriv.TypeId := zppctIdPeoplePriv;
     ParameterPeoplePriv.ControlFormStyle := zcfsDelete;
     ResLoad:=LoadPeoplePrivControl(self,DB.Handle,ParameterPeoplePriv);
     if (VarArrayDimCount(ResLoad)>0) and ResLoad[0]=mrYes then
     begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
     end;
  end;


  if (PageControl1.ActivePage=TabSheetProp) and (not DSet2.IsEmpty)  then
  begin
     ParameterPeopleProp.ID := DSet2['ID'];
     ParameterPeopleProp.TypeId := zppptIdPeopleProp;
     ParameterPeopleProp.ControlFormStyle := zcfsDelete;
     ResLoad:=LoadPeoplePropControl(self,DB.Handle,ParameterPeopleProp);
     if (VarArrayDimCount(ResLoad)>0) and (ResLoad[0]=mrYes) then
     begin
         DSet2.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
         DSet2.Delete;
         DSet2.SQLs.DeleteSQL.Clear;
     end;
  end;
end;

procedure TfmSotrData.DetailBtnClick(Sender: TObject);
var ParameterPeopleProp:TZPeoplePropParameters;
    ParameterCurrent:TZCurrentParameters;
    ParameterDopNach:TDopNachControlParameter;
    ParameterDedConst:TDedConstControlParameter;
    ParameterInvalid:TZCtrlWithHistoryParam;
    ParameterAlimony:TZAlimonyParameters;
    ParameterPeoplePriv:TZPeoplePrivParameters;
    ParameterPeopleWorkModeProp:TZPeopleWorkModeParameters;
    ParameterPeopleComandirovki:TZPeopleComandirovParameters;
    ResLoad:variant;
begin
  if PageControl1.ActivePage=TabSheetRmoving then
  begin
    // Исключения в трудовых договорах
    if PageControl2.ActivePage=TabSheetRMovingExc then
    begin
       ResLoad := 0;
       if not DSet2.IsEmpty then ResLoad := LoadRMovingExcCtrl(self,DB.Handle,zcfsShowDetails,DSet2['ID']);
    end;

    if (PageControl2.ActivePage=TabSheetDopNach) and (not Dset2.IsEmpty) then
    begin
      ParameterDopNach.AOwner:=self;
      ParameterDopNach.ADb_Handle:=DB.Handle;
      ParameterDopNach.AControlFormStyle:=zcfsShowDetails;
      ParameterDopNach.AId:=DSet2['ID_DOP_NACH'];
      ResLoad:=LoadDopNachControl(ParameterDopNach);
    end;

    if (PageControl2.ActivePage=TabSheetDedConst) and (not Dset2.IsEmpty) then
    begin
       ParameterDedConst.AOwner:=self;
       ParameterDedConst.ADb_Handle:=DB.Handle;
       ParameterDedConst.AControlFormStyle:=zcfsShowDetails;
       ParameterDedConst.AId:=DSet2['ID_DEDCONST'];
       ResLoad:=LoadDedConstControl(ParameterDedConst);
    end;
  end;

  if (PageControl1.ActivePage=TabSheetInvalid) and (not DSet2.IsEmpty) then
  begin
     ParameterInvalid.ID := DSet2['ID'];
     ParameterInvalid.ControlFormStyle := zcfsShowDetails;
     ParameterInvalid.Use_DateTime := DSet2['USE_END'];
     ResLoad:=LoadInvalidControl(self,DB.Handle,ParameterInvalid);
  end;

  if (PageControl1.ActivePage=TabSheetCurrent) and (not DSet2.IsEmpty) then
  begin
     ParameterCurrent.ID:=DSet2['ID_CURRENT'];
     ParameterCurrent.TypeID:=zcptIdCurrent;
     ParameterCurrent.Owner:=self;
     ParameterCurrent.ControlFormStyle:=zcfsShowDetails;
     ParameterCurrent.Db_Handle:=DB.Handle;
     ResLoad:=LoadCurrentControl(ParameterCurrent);
  end;

  if (PageControl1.ActivePage=TabSheetAlimony) and (not DSet2.IsEmpty) then
  begin
     ParameterAlimony.ID := DSet2['ID_ALIMONY'];
     ParameterAlimony.ControlFormStyle := zcfsShowDetails;
     ResLoad:=LoadAlimonyControl(self,DB.Handle,ParameterAlimony);
  end;

  if (PageControl1.ActivePage=TabSheetPriv) and (not DSet2.IsEmpty) then
  begin
     ParameterPeoplePriv.ID := DSet2['ID_PEOPLE_PRIV'];
     ParameterPeoplePriv.TypeId := zppctIdPeoplePriv;
     ParameterPeoplePriv.ControlFormStyle := zcfsShowDetails;
     ResLoad:=LoadPeoplePrivControl(self,DB.Handle,ParameterPeoplePriv);
  end;


  if (PageControl1.ActivePage=TabSheetProp) and (not DSet2.IsEmpty)  then
  begin
     ParameterPeopleProp.ID := DSet2['ID'];
     ParameterPeopleProp.TypeId := zppptIdPeopleProp;
     ParameterPeopleProp.ControlFormStyle := zcfsShowDetails;
     ResLoad:=LoadPeoplePropControl(self,DB.Handle,ParameterPeopleProp);
  end;

  if (PageControl2.ActivePage=TabSheetWorkMode) and (not DSet2.IsEmpty)  then
  begin
     ParameterPeopleWorkModeProp.ID:=DSet2['ID_PEOPLE_WORKMODE'];
     ParameterPeopleWorkModeProp.id_workmode:=DSet2['ID_WORKMODE'];
     ParameterPeopleWorkModeProp.rmoving:=DSetDetail['RMOVING'];
     ParameterPeopleWorkModeProp.date_beg:=DSet2['DATE_BEG'];
     ParameterPeopleWorkModeProp.date_end:=DSet2['DATE_END'];
     ParameterPeopleWorkModeProp.ControlFormStyle := zcfsShowDetails;
     ResLoad:=LoadPeopleWorkModeControl(self,DB.Handle,ParameterPeopleWorkModeProp);
  end;

  if (PageControl2.ActivePage=TabSheetComand) and (not DSet2.IsEmpty)  then
  begin
         ParameterPeopleComandirovki.ID:=DSet2['ID_COM'];
         ParameterPeopleComandirovki.rmoving:=DSetDetail['RMOVING'];
         ParameterPeopleComandirovki.date_beg:=DSet2['DATE_BEG'];
         ParameterPeopleComandirovki.date_end:=DSet2['DATE_END'];
         ParameterPeopleComandirovki.avg_sum :=DSet2['AVG_SUM'];
         ParameterPeopleComandirovki.id_vidopl:=ifThen(DSet2['ID_VIDOPL']<>NULL,DSet2['ID_VIDOPL'],-1);
         ParameterPeopleComandirovki.kod_vidopl:=VarToStrDef(DSet2['KOD_VIDOPL'],'');
         ParameterPeopleComandirovki.ControlFormStyle := zcfsShowDetails;
         ResLoad:=LoadPeopleComandiriovkiControl(self,DB.Handle,ParameterPeopleComandirovki);
  end;


end;

procedure TfmSotrData.DSetBandedFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    if DSetBanded['RMOVING']=DSetDetail['RMOVING'] then Accept:=True
    else Accept:=False;
end;

procedure TfmSotrData.DetailGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  DSetBanded.DisableControls;
  DSetBanded.Filtered:=False;
  DSetBanded.Filtered:=True;
  DSetBanded.EnableControls;
end;

procedure TfmSotrData.ShowAvgBtnClick(Sender: TObject);
begin
  if DSet2.IsEmpty then Exit;
  if (PageControl1.ActivePage=TabSheetHospital)  then PackageLoad.LoadHospAvg(self,DB.Handle,DSet2['ID_MAN_HOSP'],-1)
   else
   if (PageControl2.ActivePage=TabSheetHospByMoving) then PackageLoad.LoadHospAvg(self,DB.Handle,DSet2['ID_MAN_HOSP'],DSetDetail['RMOVING'])
   else
     if PageControl2.ActivePage=TabSheetHolidays
     then begin
               if pNumPredpr=1 //1 Днепр
               then PackageLoad.LoadShowHolAvg(Self,DB.Handle,DSetDetail['RMOVING'],DSet2['DATE_BEG'],12,DSet2['ID_VIDOPL'],DSet2['ID_MAN_HOLIDAY'])
               else begin
                         if DSet2.RecordCount>0
                         then PackageLoad.LoadHolAvg(self,db.Handle,DSet2['ID_MAN_HOLIDAY']);
               end;
     end else



     if PageControl2.ActivePage=TabSheetComand
     then begin
               if pNumPredpr<>1
               then begin
                         if DSet2.RecordCount>0
                         then PackageLoad.LoadComAvg(self,db.Handle,DSet2['ID_COM']);
               end;
     end;

end;

procedure TfmSotrData.PanelCurrentDopDataResize(Sender: TObject);
begin
 EditCategoryCurrent.Width   := Max(100,PanelCurrentGroup.Width-98);
 EditDepartmentCurrent.Width := Max(100,PanelCurrentGroup.Width-98);
 EditSmetaCurrent.Width      := Max(100,PanelCurrentGroup.Width-98);
 EditEnterDate.Width         := Max(100,PanelCurrentGroup.Width-98);
 EditPrikaz1.Width           := Max(100,PanelCurrentGroup.Width-98);
end;

procedure TfmSotrData.PanelAlimonyDopDataResize(Sender: TObject);
begin
 EditDocumentAlimony.Width   := Max(100,PanelAlimonyDopData.Width-114);
 SendPeopleEditAlimony.Width := Max(100,PanelAlimonyDopData.Width-114);
 SendAdressEditAlimony.Width := Max(100,PanelAlimonyDopData.Width-114);
end;

procedure TfmSotrData.PeopleGridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (PeopleGridDBTableView1.OptionsBehavior.IncSearchItem<>cmnTN)then
    begin
     PeopleGridDBTableView1.Controller.IncSearchingText   := '';
     PeopleGridDBTableView1.OptionsBehavior.IncSearchItem := cmnTN;
    end
  end
 else
  if (PeopleGridDBTableView1.OptionsBehavior.IncSearchItem<>cmnFIO)then
   begin
    PeopleGridDBTableView1.Controller.IncSearchingText   := '';
    PeopleGridDBTableView1.OptionsBehavior.IncSearchItem := cmnFIO;
   end;
end;

procedure TfmSotrData.ShowAllDataBtnClick(Sender: TObject);
var wf:TForm;
begin
  wf:=ShowWaitForm(Self);
 try
  ResetDetail;
  PageControl1Change(Sender);
 finally
  CloseWaitForm(wf);
 end;
end;

procedure TfmSotrData.cxButton1Click(Sender: TObject);
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

  try
    try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := DB.Handle;
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_UP_BUFF_RMOVING_END_ROLLBACK';
       pStProc.Prepare;
       pStProc.ParamByName('RMOVING').AsVariant := DSetDetail['RMOVING'];
       pStProc.ExecProc;

       pStProc.Transaction.Commit;
       DSetBanded.Close;
       DSetDetail.CloseOpen(True);
       DSetBanded.Open;
       DetailGridDBBandedTableView1.Controller.GridView.ViewData.Expand(true);
       PageControl1Change(Self);
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       end;
    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
  end;
end;

procedure TfmSotrData.PageControl2Change(Sender: TObject);
begin
  DisableAllDBControls;

  EditRazryad.DataBinding.DataSource  := DSourceBanded;
  EditDepartment.DataBinding.DataSource  := DSourceBanded;
  EditPrikaz.DataBinding.DataSource  := DSourceBanded;
  cxDBMaskEdit1.DataBinding.DataSource  := DSourceBanded;  
  if InsertBtn<>nil then InsertBtn.Enabled:=True;
  if UpdateBtn<>nil then UpdateBtn.Enabled := True;
  if DeleteBtn<>nil then DeleteBtn.Enabled := True;
  if DetailBtn<>nil then DetailBtn.Enabled := True;
  if ShowAvgBtn<>nil then ShowAvgBtn.Visible:=ivNever;
  if (DSetMain<>nil) and (DSetMain.Active)
  and (PageControl1.ActivePage=TabSheetRmoving) then
  begin
    if PageControl2.ActivePage=TabSheetBMoving then LoadManBonus;
    if PageControl2.ActivePage=TabSheetHolidays then LoadManHoliday;
    if PageControl2.ActivePage=TabSheetRMovingExc then LoadRMovingExc;
//    if PageControl2.ActivePage=TabSheetDopNach then LoadDopNach;
    if PageControl2.ActivePage=TabSheetDedConst then LoadDedConst;
    if PageControl2.ActivePage=TabSheetRemont then LoadRemont;
    if PageControl2.ActivePage=TabSheetWorkMode then LoadPeopleWorkMode;
    if PageControl2.ActivePage=TabSheetComand then LoadComandirovki;
    if PageControl2.ActivePage=TabSheetHospByMoving then LoadManHospitalRMoving;
    if not DSet2.IsEmpty      then DSet2.First;
    //if not DSetDetail.IsEmpty then DSetDetail.First;
    if not DSetBanded.IsEmpty then DSetBanded.First;
  end;
end;

procedure TfmSotrData.PageControl1Change(Sender: TObject);
begin
  DisableAllDBControls;
  DSet2.Close;
  if InsertBtn<>nil then InsertBtn.Enabled:=True;
  if UpdateBtn<>nil then UpdateBtn.Enabled := True;
  if DeleteBtn<>nil then DeleteBtn.Enabled := True;
  if DetailBtn<>nil then DetailBtn.Enabled := True;
  if ShowAvgBtn<>nil then ShowAvgBtn.Visible:=ivNever;
  if (DSetMain<>nil) and (DSetMain.Active) then
  begin
    if PageControl1.ActivePage=TabSheetRMoving  then PageControl2Change(Sender);
    if PageControl1.ActivePage=TabSheetHospital then LoadManHospital;
    if PageControl1.ActivePage=TabSheetInvalid  then LoadInvalid;
    if PageControl1.ActivePage=TabSheetCurrent  then LoadCurrent;
    if PageControl1.ActivePage=TabSheetAlimony  then LoadAlimony;
    if PageControl1.ActivePage=TabSheetPriv     then LoadPeoplePriv;
    if PageControl1.ActivePage=TabSheetProp     then LoadPeopleProp;
    if PageControl1.ActivePage=TabSheetWorkMode then LoadPeopleWorkMode;
    if PageControl1.ActivePage=TabSheetComand   then LoadComandirovki;
    if PageControl1.ActivePage=TabSheetIndex    then LoadIndexActs;

    if not DSet2.IsEmpty then DSet2.First;
  end;
end;

procedure TfmSotrData.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSotrData.FilterBtnClick(Sender: TObject);
begin
  pFilterParams.is_filtered := True;
  if ShowFilter(self,DB.Handle,pFilterparams) then
    begin
      ApplyFilter;
      ResetDetail;
      PageControl1Change(Self);
    end;
end;

procedure TfmSotrData.AcctCardBtnClick(Sender: TObject);
begin
     if DSetMain.RecordCount>0
     then PackageLoad.LoadSpAllPeopleEditForm(Self,DB.Handle,DSetMain['OUT_ID_MAN'],True);
end;

procedure TfmSotrData.AvansBtnClick(Sender: TObject);
begin
  if PeopleGridDBTableView1.Controller.FocusedRecord <> nil then
  begin
    StoredProc.StoredProcName := 'Z_TNACCESS_IS_AVANS_UPDATE';
    try
      StoredProc.Transaction.StartTransaction;
      UpKernelUnit.StartHistory(TpFIBTransaction(StoredProc.Transaction),ValueFieldZSetup(DB.Handle,'Z_ID_SYSTEM'));
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_MAN').AsInteger := DSetMain['OUT_ID_MAN'];
      StoredProc.ParamByName('IS_AVANS_O').AsString := DSetMain['IS_AVANS'];
      StoredProc.ExecProc;
      StoredProc.Transaction.Commit;
      ApplyFilter;
      ResetDetail;
      PageControl1Change(self);
    except
    on E:Exception do
      begin
        if StoredProc.Transaction.InTransaction then StoredProc.Transaction.Rollback;
        zshowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOk]);
      end;
    end;
  end;

end;


procedure TfmSotrData.FormCreate(Sender: TObject);
begin
     PageControl2.ActivePage:=TabSheetBMoving;

     use_zemail:= ValueFieldZSetup(DB.Handle,'USE_ZEMAIL');

     if (use_zemail<>null)
     then begin
               if (use_zemail=1)
               then begin
                         use_email.Visible:=true;
               end
               else begin
                         use_email.Visible:=false;
               end;
     end
     else begin
               use_email.Visible:=False;
     end;
end;

procedure TfmSotrData.cmnTypePaymentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
    if DSetMain.RecordCount>0
    then begin
              PackageLoad.LoadTnAccess(Self,DB.Handle,DSetMain['OUT_ID_MAN']);
              ApplyFilter;
              ResetDetail;
              PageControl1Change(self);
    end;
end;

procedure TfmSotrData.DSet2AfterClose(DataSet: TDataSet);
begin       
{    if PageControl1.ActivePageIndex <> 1 then
    begin
        cxDBMaskEdit2.DataBinding.DataSource          := nil;
        cxDBMaskEdit3.DataBinding.DataSource          := nil;
        cxDBMaskEdit4.DataBinding.DataSource          := nil;
    end;
    if (PageControl1.ActivePageIndex <> 0) or (PageControl2.ActivePageIndex <> 0) then
    begin
        cxDBTextEdit4.DataBinding.DataSource          := nil;
        cxDBTextEdit5.DataBinding.DataSource          := nil;
    end;
    if (PageControl1.ActivePageIndex <> 0) or (PageControl2.ActivePageIndex <> 1) then
    begin
        cxDBTextEditProject.DataBinding.DataSource    := nil;
        cxDBTextEdit1.DataBinding.DataSource          := nil;
        cxDBTextEdit2.DataBinding.DataSource          := nil;
    end;
    if PageControl1.ActivePageIndex <> 3 then
    begin
        EditCategoryCurrent.DataBinding.DataSource    := nil;
        EditDepartmentCurrent.DataBinding.DataSource  := nil;
        EditSmetaCurrent.DataBinding.DataSource       := nil;
        EditEnterDate.DataBinding.DataSource          := nil;
        EditNDay.DataBinding.DataSource               := nil;
        EditClock.DataBinding.DataSource              := nil;
        EditSumClock.DataBinding.DataSource           := nil;
        EditPercent.DataBinding.DataSource            := nil;
        EditPrikaz1.DataBinding.DataSource            := nil;
    end;
 }
end;

procedure TfmSotrData.cmnShifrPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
    if (DSetMain.RecordCount>0)
    then begin
              PackageLoad.LoadTnAccess(Self,DB.Handle,DSetMain['OUT_ID_MAN']);
              ApplyFilter;
              ResetDetail;
              PageControl1Change(self);
    end;

end;

procedure TfmSotrData.N1Click(Sender: TObject);
begin
     cmnShifr.Visible:=not cmnShifr.Visible;
end;

procedure TfmSotrData.LoadComandirovki;
begin
     ShowAvgBtn.Visible:=ivAlways;

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceDetail;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM z_comandirovki_select(?RMoving)';
     if not DSetDetail.IsEmpty then DSet2.Open;
     ComandirovkiTableView.DataController.DataSource:=DSource2;
end;

procedure TfmSotrData.PeopleWorkModeTableViewDblClick(Sender: TObject);
var  Trans:TIBTransaction;
     DBib:TIBDatabase;
begin
     if PageControl2.ActivePage=TabSheetWorkMode
     then begin
               if pNumPredpr<>1
               then begin
                         Trans:=TIBTransaction.Create(self);
                         DBib:=TIBDatabase.Create(self);
                         DBib.SQLDialect:=3;
                         DBib.DefaultTransaction:=Trans;
                         DBib.SetHandle(Ibexternals.pvoid(db.Handle));
                         Trans.StartTransaction;

                         if Dset2.RecordCount>0
                         then ZProc.DrawWorkMode(pFilterParams.DateBeg,
                                                 IncMonth(pFilterParams.DateEnd),
                                                 DSet2['id_workmode'],
                                                 DSet2['shift'],
                                                 trans,
                                                 DSet2.fieldbyname('NAME').AsString+', зсув '+DSet2.fieldbyname('shift').AsString+' днів '
                                                 );

               end;
     end;

end;

procedure TfmSotrData.EditCategoryCurrentPropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('CATEGORY_NAME').AsString = '' then
    begin
        LabelCategoryCurrent.Visible:=False;
        EditCategoryCurrent.Visible:=False;
    end else begin
        LabelCategoryCurrent.Visible:=True;
        EditCategoryCurrent.Visible:=True;
    end;
end;

procedure TfmSotrData.EditDepartmentCurrentPropertiesChange(
  Sender: TObject);
begin
    if DSet2.FieldByName('NAME_DEPARTMENT').AsString = '' then
    begin
        LabelDepartmentCurrent.Visible:=False;
        EditDepartmentCurrent.Visible:=False;
    end else begin
        LabelDepartmentCurrent.Visible:=True;
        EditDepartmentCurrent.Visible:=True;
    end;
end;

procedure TfmSotrData.EditSmetaCurrentPropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('SMETA_NAME').AsString = '' then
    begin
        LabelSmetaCurrent.Visible:=False;
        EditSmetaCurrent.Visible:=False;
    end else begin
        LabelSmetaCurrent.Visible:=True;
        EditSmetaCurrent.Visible:=True;
    end;
end;

procedure TfmSotrData.EditEnterDatePropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('insert_date').AsString = '' then
    begin
        LEnterDate.Visible:=False;
        EditEnterDate.Visible:=False;
    end else begin
        LEnterDate.Visible:=True;
        EditEnterDate.Visible:=True;
    end;
end;

procedure TfmSotrData.EditPrikaz1PropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('OUT_PRIKAZ').AsString = '' then
    begin
        LPrikaz.Visible:=False;
        EditPrikaz1.Visible:=False;
    end else begin
        LPrikaz.Visible:=True;
        EditPrikaz1.Visible:=True;
    end;
end;

procedure TfmSotrData.EditNDayPropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('OUT_NDAY').AsString = '' then
    begin
        LNDay.Visible:=False;
        EditNDay.Visible:=False;
    end else begin
        LNDay.Visible:=True;
        EditNDay.Visible:=True;
    end;
end;

procedure TfmSotrData.EditClockPropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('OUT_CLOCK').AsString = '' then
    begin
        LClock.Visible:=False;
        EditClock.Visible:=False;
    end else begin
        LClock.Visible:=True;
        EditClock.Visible:=True;
    end;
end;

procedure TfmSotrData.EditPercentPropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('OUT_PERCENT').AsString = '' then
    begin
        LPercent.Visible:=False;
        EditPercent.Visible:=False;
    end else begin
        LPercent.Visible:=True;
        EditPercent.Visible:=True;
    end;
end;

procedure TfmSotrData.EditSumClockPropertiesChange(Sender: TObject);
begin
    if DSet2.FieldByName('OUT_SUM_CLOCK').AsString = '' then
    begin
        LSumClock.Visible:=False;
        EditSumClock.Visible:=False;
    end else begin
        LSumClock.Visible:=True;
        EditSumClock.Visible:=True;
    end;
end;

procedure TfmSotrData.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    if NewWidth<800 then Resize:=False;
end;

procedure TfmSotrData.PeoplePanelCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    if NewWidth>300 then Resize:=False;
end;

procedure TfmSotrData.LoadIndexActs;
begin
     //В будущем можна написать форму показывающая анализ расчета для периода
     ShowAvgBtn.Visible:=ivNever; //***************
     //********************************************

     if DSet2.Active then DSet2.Close;
     DSet2.DataSource:=DSourceMain;
     DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_INDEX_ACTS(?OUT_ID_MAN) order by KOD_SETUP_DATE_ desc';
     if not DSetMain.IsEmpty then DSet2.Open;
     cxGridDBTableView1.DataController.DataSource:=DSource2;
     cxGridDBTableView1.Controller.gotofirst;
end;

procedure TfmSotrData.use_emailPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  T:TfrmUseEmail;
begin
     if (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailAddrConfigure','Belong')=0)
     then begin
               if (DSetMain.RecordCount>0)
               then begin
                         T:=TfrmUseEmail.Create(self, DB.Handle, DSetMain['OUT_ID_MAN']);
                         if T.ShowModal=mrYes
                         then begin
                                   ApplyFilter;
                                   ResetDetail;
                                   PageControl1Change(self);
                         end;
                         T.Free;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї інформації.');
end;

procedure TfmSotrData.PeopleGridDBTableView1DblClick(Sender: TObject);
begin
     if (DSetMain.RecordCount>0)
     then AllPeopleUnit.ShowManEditForm(Self, DB.Handle, PeopleGridDBTableView1.Controller.FocusedRecord.Values[0], true);
end;

procedure TfmSotrData.ComandirovkiTableViewDBColumn1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
      if Arecord.Values[2]=null then AText:='АВТО';
end;

procedure TfmSotrData.cxGridDBTableView1DBColumn5GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText='' then AText:='AUTO';
end;

procedure TfmSotrData.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (PageControl1.ActivePage=TabSheetIndex) and (DSet2.active) then
  if DSet2['ID_RECORD']=-1 then DeleteBtn.enabled:=false
  else  DeleteBtn.enabled:=true;
end;

procedure TfmSotrData.dxBarLargeButton1Click(Sender: TObject);
begin
  LoadDateAcc2(PAOwner, DB.Handle, pKodSetupCurrent, pKodSetupCurrent, DSetMain['OUT_ID_MAN']);
end;


procedure TfmSotrData.FormShow(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheetRmoving;
end;

end.
