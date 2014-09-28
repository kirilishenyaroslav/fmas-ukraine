unit DatesAcc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo, ZcxLocateBar,
  FIBQuery, pFIBQuery, ZProc, Dates, ZSvodTypesUnit, ZTypes, dateAcc_Filter,ZMessages,
  ZSvodLoaderUnit, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView, Unit_ZGlobal_Consts,
  dxStatusBar, ActnList, unit_NumericConsts,
  PackageLoad, z_dmCommonStyles, cxDBLabel, pFIBProps,
  cxGridCustomPopupMenu, cxGridPopupMenu, zWait, Menus, RxMemDS, DateUtils ;

type
  TFZDateAcc = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DSource3: TDataSource;
    DSource1: TDataSource;
    DataBase: TpFIBDatabase;
    DSet3: TpFIBDataSet;
    DSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Styles: TcxStyleRepository;
    FilterBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
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
    DSet2: TpFIBDataSet;
    DSource2: TDataSource;
    dxStatusBar1: TdxStatusBar;
    ActionList: TActionList;
    ActionSystem: TAction;
    DockSite: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    DockPanel2: TdxDockPanel;
    ContainerDockSite: TdxTabContainerDockSite;
    DockPanel1: TdxDockPanel;
    DockPanel3: TdxDockPanel;
    Grid1: TcxGrid;
    Grid1View1: TcxGridDBTableView;
    Grid1ClTn: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClTin: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Grid3: TcxGrid;
    Grid3DBBandedTableView1: TcxGridDBBandedTableView;
    Grid3ClVo: TcxGridDBBandedColumn;
    Grid3ClVidOpl: TcxGridDBBandedColumn;
    Grid3ClSumma: TcxGridDBBandedColumn;
    Grid3ClP1: TcxGridDBBandedColumn;
    Grid3ClDepartment: TcxGridDBBandedColumn;
    Grid3ClSmeta: TcxGridDBBandedColumn;
    Grid3ClKodSetup3: TcxGridDBBandedColumn;
    Grid3ClReCount: TcxGridDBBandedColumn;
    Grid3ClNDay: TcxGridDBBandedColumn;
    Grid3ClClock: TcxGridDBBandedColumn;
    Grid3ClStavkaPercent: TcxGridDBBandedColumn;
    Grid3Level1: TcxGridLevel;
    PanelGrid3DopData: TPanel;
    DBMaskEditDepartment: TcxDBMaskEdit;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    DBMaskEditPost: TcxDBMaskEdit;
    LabelPost: TcxLabel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    Grid2: TcxGrid;
    Grid2View1: TcxGridDBTableView;
    Grid2ClKodSetup: TcxGridDBColumn;
    Grid2ClDateAcc: TcxGridDBColumn;
    Grid2ClTypeAcc: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    BarDockLocate: TdxBarDockControl;
    SplitterGrids1And2: TSplitter;
    Panel2: TPanel;
    Grid4: TcxGrid;
    Grid4Level1: TcxGridLevel;
    DBTextEditFio: TcxDBTextEdit;
    ShowGroupBoxBtn: TdxBarLargeButton;
    DBMaskEditCategory: TcxDBMaskEdit;
    LabelCategory: TcxLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    dxBarPopupMenu1: TdxBarPopupMenu;
    PrintSmetaBtn: TdxBarLargeButton;
    BtnPrintPeriod: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    BarBtnShortPrint: TdxBarButton;
    Grid3ClKodSetTaxGroup: TcxGridDBBandedColumn;
    cxSplitter2: TcxSplitter;
    Grid5DBTableView1: TcxGridDBTableView;
    Grid5Level1: TcxGridLevel;
    Grid5: TcxGrid;
    DSet5: TpFIBDataSet;
    DSource5: TDataSource;
    Grid5ClKodSheet: TcxGridDBColumn;
    Grid5ClTypeSheet: TcxGridDBColumn;
    Grid5ClSumma: TcxGridDBColumn;
    Grid5ClSmetaKod: TcxGridDBColumn;
    Grid5ClDep: TcxGridDBColumn;
    Grid5ClReestr: TcxGridDBColumn;
    Grid5ClNameViplata: TcxGridDBColumn;
    dxDockPanel1: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    cxgirdGirdCalendar: TcxGrid;
    cxGridDBTableViewCalendar: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxgirdTrudDog: TcxGrid;
    cxGridDBTableViewTrudDog: TcxGridDBTableView;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    pnl1: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridDBColumnCl8: TcxGridDBColumn;
    DSetTrudDog: TpFIBDataSet;
    DSourceTrudDog: TDataSource;
    DSetCalendar: TpFIBDataSet;
    DSourceCalendar: TDataSource;
    RxDSetCalendar: TRxMemoryData;
    cxSplitter3: TcxSplitter;
    cxGridDBTableView3DBColumn1: TcxGridDBColumn;
    cxGridDBTableView3DBColumn2: TcxGridDBColumn;
    cxGridDBTableView3DBColumn3: TcxGridDBColumn;
    DSetCalendarClock: TpFIBDataSet;
    DSourceCalendarClock: TDataSource;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FilterBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid3ClP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure PrintBtnClick(Sender: TObject);
    procedure Grid3ClKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid3ClNDayGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid3ClClockGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid2ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid1View1KeyPress(Sender: TObject; var Key: Char);
    procedure DSet3AfterOpen(DataSet: TDataSet);
    procedure Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure RefreshBtnClick(Sender: TObject);
    procedure dxStatusBar1Resize(Sender: TObject);
    procedure PanelGrid3DopDataResize(Sender: TObject);
    procedure ActionSystemExecute(Sender: TObject);
    procedure Grid3DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarButton1Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure ShowGroupBoxBtnClick(Sender: TObject);
    procedure Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure PrintSmetaBtnClick(Sender: TObject);
    procedure BtnPrintPeriodClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure BarBtnShortPrintClick(Sender: TObject);
    procedure cxGridDBTableViewTrudDogFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    PParameter:TZDataFilter;
    PMode:TZTypeData;
    PLanguageIndex:byte;
    PBarLocate:TZBarLocate;
    pStyles:TStylesDM;
    pWidth:integer;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TZTypeData;AParameter:TZDataFilter);reintroduce;
    property Mode:TZTypeData read PMode;
  end;

function View_ZDateAcc(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TZTypeData):Variant; stdcall;
 exports  View_ZDateAcc;


implementation

uses StrUtils, Math;

{$R *.dfm}

function View_ZDateAcc(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TZTypeData):Variant;
var ViewForm: TFZDateAcc;
    Parameter:TZDataFilter;
begin
Parameter.Id:=0;
Parameter.TypeId:=tztdfNULL;
Parameter.KodSetup1:=0;
Parameter.KodSetup2:=0;
Parameter.ModalResult := mrYes;
{for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = TFZDateAcc) then
  if (Application.MainForm.MDIChildren[i] as TFZDateAcc).mode=ATypeView
   then
    begin
     Application.MainForm.MDIChildren[i].BringToFront;
     F:=False;
     break;
    end;}
Parameter := ViewFilter(AOwner,DB,Parameter);
if Parameter.ModalResult=mrYes then
    ViewForm  :=  TFZDateAcc.Create(AOwner,DB,ATypeView,Parameter);
View_ZDateAcc:=NULL;
end;

constructor TFZDateAcc.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TZTypeData;AParameter:TZDataFilter);
var TypeId,i:Byte;
    tmpColumn:TcxGridDBBandedColumn;
    wf:TForm;
    k,p,VDayOfTheWeek,PDayOfTheWeek,Day:integer;
    g,m,d:Word;
    Value:Variant;
begin
Inherited Create(AOwner,);
 try
   wf:=ShowWaitForm(Application.MainForm);
  //******************************************************************************
   pWidth := PanelGrid3DopData.Width-DBMaskEditDepartment.Width;
   PLanguageIndex:=LanguageIndex;
   Caption := IfThen(ATypeView=ztdNotSaved,
                     DatesAcc_NotSaves_Caption[PLanguageIndex],
                     DatesAcc_Saves_Caption[PLanguageIndex]);
   RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
   PrintBtn.Caption := PrintBtn_Caption[PLanguageIndex];
   FilterBtn.Caption := FilterBtn_Caption[PLanguageIndex];
   ExitBtn.Caption := ExitBtn_Caption[PLanguageIndex];
   ShowGroupBoxBtn.Caption:=ShowGroupBoxBtn_Caption[PLanguageIndex];
  //******************************************************************************
   Grid1ClTn.Caption := GridClTn_Caption[PLanguageIndex];
   Grid1ClTin.Caption := GridClTin_Caption[PLanguageIndex];
   Grid1ClFIO.Caption := GridClFIO_Caption[PLanguageIndex];
  //******************************************************************************
   Grid2ClKodSetup.Caption := GridClKodSetup_Caption[PLanguageIndex];
   Grid2ClDateAcc.Caption := GridClDate_Caption[PLanguageIndex];
   Grid2ClTypeAcc.Caption := Acc_Const[PLanguageIndex];
  //******************************************************************************
   Grid3ClVo.Caption := GridClKodVidOpl_Caption[PLanguageIndex];
   Grid3ClVidOpl.Caption := GridClNameVidopl_Caption[PLanguageIndex];
   Grid3ClSumma.Caption := GridClSumma_Caption[PLanguageIndex];
   Grid3ClP1.Caption := GridClP1_Caption[PLanguageIndex];
   Grid3ClDepartment.Caption := GridClKodDepartment_Caption[PLanguageIndex];
   Grid3ClSmeta.Caption := GridClKodSmeta_Caption[PLanguageIndex];
   Grid3ClKodSetup3.Caption := GridClKodSetup_Caption[PLanguageIndex];
   Grid3ClReCount.Caption := '';
   Grid3ClNDay.Caption := GridClNday_Caption[PLanguageIndex];
   Grid3ClClock.Caption := GridClClock_Caption[PLanguageIndex];
   Grid3ClStavkaPercent.Caption := GridClStavkaPercent_Caption[PLanguageIndex];
   Grid3ClKodSetTaxGroup.Caption:='Період для податків';
  //******************************************************************************
   Grid5ClKodSheet.Caption    := GridClKod_Caption[PLanguageIndex];
   Grid5ClTypeSheet.Caption   := GridClTypeSheet_Caption[PLanguageIndex];
   Grid5ClSumma.Caption       := GridClSumma_Caption[PLanguageIndex];
   Grid5ClSmetaKod.Caption    := GridClKodSmeta_Caption[PLanguageIndex];
   Grid5ClDep.Caption         := GridClKodDepartment_Caption[PLanguageIndex];
   Grid5ClReestr.Caption      := Reestr_Const[PLanguageIndex];
   Grid5ClNameViplata.Caption := GridClViplata_Caption[PLanguageIndex];
  //******************************************************************************
   LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
   LabelSmeta.Caption := LabelSmeta_Caption[PLanguageIndex];
   LabelPost.Caption := LabelPost_Caption[PLanguageIndex];
   LabelCategory.Caption := LabelCategory_Caption[PLanguageIndex];
  //******************************************************************************
   PParameter:=AParameter;
   PMode:=ATypeView;
  //******************************************************************************
//   Grid1View1.DataController.Summary.FooterSummaryItems[0].Format := Itogo_Caption[PLanguageIndex]+': 0';
   Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex]+':';
   Grid5DBTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex]+':';
  //******************************************************************************
   PanelGrid3DopData.Color := Grid3DBBandedTableView1.Styles.Background.Color;
   cxSplitter1.Color := Grid3DBBandedTableView1.Styles.Header.Color;
  //******************************************************************************
   DockPanel1.Caption := Spisok_Text[PLanguageIndex];
   DockPanel3.Caption := Table_Text[PLanguageIndex];
  //******************************************************************************
   for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
   dxStatusBar1.Panels[0].Text:= RefreshBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[1].Text:= LocateBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[2].Text:= LocateNextBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[3].Text:= FilterBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[4].Text:= PrintBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[5].Text:= ExitBtn_Hint[PLanguageIndex];
  //******************************************************************************
  TypeId:=IfThen(ATypeView=ztdNotSaved,1);
  DSet5.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET(?ID_MAN,?ID_GROUP_ACCOUNT) ORDER BY KOD_SHEET';
  DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S(?ID_GROUP_ACCOUNT,?ID_MAN,?KOD_SETUP_2,'
                                                                            +IntToStr(TypeId)+') order by Kod_vidopl';
  TypeId:=IfThen(ATypeView=ztdNotSaved,1)+TypeDataFilterToByte(PParameter.TypeId)*2;
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST('+IntToStr(PParameter.KodSetup1)+','
                                                               +IntToStr(PParameter.KodSetup2)+','
                                                               +IntToStr(PParameter.Id)+','
                                                               +IntToStr(TypeId)+','
                                                               +IntToStr(zPaymentType)+') order by tn';
  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS(?ID_MAN,'
                                                                   +IntToStr(PParameter.KodSetup1)+','
                                                                   +IntToStr(PParameter.KodSetup2)+','
                                                                   +IntToStr(PParameter.Id)+','
                                                                   +IntToStr(TypeId)+','
                                                                   +IntToStr(zPaymentType)+') order by KOD_SETUP_2,DATE_ACC descending';
  DataBase.Handle                              := DB;
  DSet1.Open;
  DSet2.Open;
  DSet3.Open;
  DSet5.Open;
  if ValueFieldZSetup(DB,'NUM_PREDPR')=1 then Grid4Level1.GridView := GetTable(DSource2,'KOD_SETUP_2');
  //******************************************************************************
   pStyles := TStylesDM.Create(self);
   Grid1View1.Styles.StyleSheet := pStyles.GridTableViewStyleSheetDevExpress;
   Grid2View1.Styles.StyleSheet := pStyles.GridTableViewStyleSheetDevExpress;
   Grid3DBBandedTableView1.Styles.StyleSheet := pStyles.GridBandedTableViewStyleSheetDevExpress;
   if not (Grid4Level1.GridView=nil) then
   begin
      (Grid4Level1.GridView as TcxGridDBBandedTableView).Styles.StyleSheet := pStyles.GridBandedTableViewStyleSheetDevExpress;

      tmpColumn:=nil;
      tmpColumn:=(Grid4Level1.GridView as TcxGridDBBandedTableView).GetColumnByFieldName('DAYMONTH');
      if tmpColumn<>nil then
        tmpColumn.Styles.Content := pStyles.StyleGray;
   end;
  //******************************************************************************
   PBarLocate:=TZBarLocate.Create(BarManager);

   PBarLocate.DataSet := DSet1;
   PBarLocate.BorderStyle := bbsNone;
   PBarLocate.AddLocateItem('TN',Grid1ClTn.Caption,[loCaseInsensitive]);
   PBarLocate.AddLocateItem('FIO',Grid1ClFIO.Caption,[loCaseInsensitive,loPartialKey]);
   PBarLocate.DigitalField := 'TN';
   PBarLocate.DockControl  := BarDockLocate;

   cxGridDBTableViewTrudDog.DataController.DataSource:=nil;
   DSetTrudDog.Close;
   DSetTrudDog.DataSource:= DSource1;
   DSetTrudDog.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING_BY_PERIOD(?ID_MAN,'''+
                                      KodSetupToPeriod(PParameter.KodSetup1,6)+''','''+DateToStr(StrToDate(KodSetupToPeriod(PParameter.KodSetup2+1,6))-1)+''') order by DATE_END descending';

   if not DSet1.IsEmpty then

    DSetTrudDog.Open;

   DSetCalendar.close;

   DSetCalendar.DataSource:=DSourceTrudDog;

   //отбираем данные за период и по труд договору. В т. ч. и часы и даты и вид выхода
   DSetCalendar.SQLs.SelectSQL.Text:='SELECT * FROM TABLE_READ_STD(?ID_MAN_MOVING,NULL,NULL,'''+
   KodSetupToPeriod(PParameter.KodSetup1,6)+''','''+DateToStr(StrToDate(KodSetupToPeriod(PParameter.KodSetup2+1,6))-1)+''') order by cur_date';

   if DSetTrudDog.Active then DSetCalendar.Open;

   DSetCalendarClock.DataSource :=DSourceTrudDog;

   DSourceCalendarClock.DataSet:=DSetCalendarClock;

   cxGridDBTableView3.DataController.DataSource:= DSourceCalendarClock;

   DSetCalendarClock.Close;

   DSetCalendarClock.SQLs.SelectSQL.Text:='SELECT * FROM TABLE_READ_STD_SUM(?ID_MAN_MOVING,'''+
   KodSetupToPeriod(PParameter.KodSetup1,6)+''','''+DateToStr(StrToDate(KodSetupToPeriod(PParameter.KodSetup2+1,6))-1)+''')';

   if DSetTrudDog.Active then  DSetCalendarClock.Open;

   DSourceCalendar.DataSet:=RxDSetCalendar;
   
   RxDSetCalendar.FieldDefs.Add('PN',ftString,10);
   RxDSetCalendar.FieldDefs.Add('VT',ftString,10);
   RxDSetCalendar.FieldDefs.Add('SR',ftString,10);
   RxDSetCalendar.FieldDefs.Add('CH',ftString,10);
   RxDSetCalendar.FieldDefs.Add('PT',ftString,10);
   RxDSetCalendar.FieldDefs.Add('SB',ftString,10);
   RxDSetCalendar.FieldDefs.Add('VS',ftString,10);

   cxGridDBTableViewCalendar.DataController.DataSource := DSourceCalendar;

   cxGridDBTableViewTrudDog.DataController.DataSource:=DSourceTrudDog;







   //создаем структуру для вида календаря
   {RxDSetCalendar.Close;
   RxDSetCalendar:=TRxMemoryData.Create(self);

   DSourceCalendar.DataSet:=RxDSetCalendar;

   cxGridDBTableViewCalendar.DataController.DataSource := DSourceCalendar;

   RxDSetCalendar.FieldDefs.Add('PN',ftString,10);
   RxDSetCalendar.FieldDefs.Add('VT',ftString,10);
   RxDSetCalendar.FieldDefs.Add('SR',ftString,10);
   RxDSetCalendar.FieldDefs.Add('CH',ftString,10);
   RxDSetCalendar.FieldDefs.Add('PT',ftString,10);
   RxDSetCalendar.FieldDefs.Add('SB',ftString,10);
   RxDSetCalendar.FieldDefs.Add('VS',ftString,10);

   RxDSetCalendar.Open;


   //день недели. будет увеличиваться для заполнения по дням недели календаря(рикс датасета)
   VDayOfTheWeek:=DayOfTheWeek(StrToDate(KodSetupToPeriod(PParameter.KodSetup1,6)));
   // день недели первой. для старта
   PDayOfTheWeek := VDayOfTheWeek;

   //EncodeDate(g,m,d)

   //день месяца. для заполнения дней и установления соответствия отобранным датам и данным
   Day:=1;





   // на 5 недель, макс
   for k:=1 to 5 do
   begin

    RxDSetCalendar.Append;

    if k=1 then
      for p:=1 to PDayOfTheWeek-1 do
        RxDSetCalendar.Fields[VDayOfTheWeek-1].Value:='';

    // на семь дней
    for p:=PDayOfTheWeek to 7 do
    begin
      Value:=(k-1)*7 + p-PDayOfTheWeek+1;
      if Value>31 then Value:=''; //если кол дней больше 31 значит прекращаем заполнять датасет числами


      // ставим число вместо типа выхода т к не известно есть ли дата для данного числа в данных запроса
      RxDSetCalendar.Fields[VDayOfTheWeek-(k-1)*7-1].Value:=Value;


      ShowMessage(VarToStr(RxDSetCalendar.Fields[VDayOfTheWeek-(k-1)*7-1].Value));
      // ищем день в текущей дате строки запроса. Т к Запрос упорядочен по дате с меньшей к большей
      // числа месяца и недели и записи запроса идут по порядку, поэтому мы все время перебираем по 1
      DecodeDate(DSetCalendar.FieldByName('cur_date').AsDateTime,g,m,d);
      //если есть дата то забираем выход в календарь
      if Day=d then RxDSetCalendar.Fields[VDayOfTheWeek-(k-1)*7-1].Value:=DSetCalendar.FieldByName('VIHOD_NAME_SHORT').AsString;

      // перебираем дальше по 1 дни недели и месяца по порядку
      VDayOfTheWeek:=VDayOfTheWeek+1;
      Day:=Day+1;

      if not DSetCalendar.EOF then
        DSetCalendar.Next
      else Break;
    end;
    // ставим начальный день недели для цикла, после первого раза
    PDayOfTheWeek:=1;

    RxDSetCalendar.Post;
    if DSetCalendar.EOF then Break;
   end;     }


 finally
   CloseWaitForm(wf);
 end;
end;

procedure TFZDateAcc.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZDateAcc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Rollback;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZDateAcc.FilterBtnClick(Sender: TObject);
var TypeId:Byte;
    wf:TForm;
begin
PParameter.ModalResult:=mrNone;
PParameter := ViewFilter(self,DataBase.Handle,PParameter);
if PParameter.ModalResult=mrYes then
 try
    wf := ShowWaitForm(self);
    DSet5.Close;
    DSet3.Close;
    DSet2.Close;
    DSet1.Close;

    TypeId:=IfThen(PMode=ztdNotSaved,1)+TypeDataFilterToByte(PParameter.TypeId)*2;
    DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST('+IntToStr(PParameter.KodSetup1)+','
                                                             +IntToStr(PParameter.KodSetup2)+','
                                                             +IntToStr(PParameter.Id)+','
                                                             +IntToStr(TypeId)+','
                                                             +IntToStr(zPaymentType)+') order by tn';
    DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS(?ID_MAN,'
                                                             +IntToStr(PParameter.KodSetup1)+','
                                                             +IntToStr(PParameter.KodSetup2)+','
                                                             +IntToStr(PParameter.Id)+','
                                                             +IntToStr(TypeId)+','
                                                             +IntToStr(zPaymentType)+') order by KOD_SETUP_2,DATE_ACC descending';

    DSet1.Open;
    DSet2.Open;
    DSet3.Open;
    DSet5.Open;
 finally
    CloseWaitForm(wf);
 end;   
end;

procedure TFZDateAcc.FormCreate(Sender: TObject);
begin
Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex];
end;

procedure TFZDateAcc.Grid3ClP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText='False' then
    AText:=GridClP1_Text_False[PLanguageIndex];
 if AText='True' then
    AText:=GridClP1_Text_True[PLanguageIndex];
end;

procedure TFZDateAcc.PrintBtnClick(Sender: TObject);
var parameter:TZAccListParameter;
begin
parameter.Id_Man:=DSet2['ID_MAN'];
parameter.Id_Group_Account:=DSet2['ID_GROUP_ACCOUNT'];
parameter.Kod_Setup:=DSet2['KOD_SETUP_2'];
parameter.TypeData:=IfThen(PMode=ztdNotSaved,1,0);
parameter.DB_Handle:=DataBase.Handle;
parameter.AOwner:=Self;
PrintRaschList(parameter);
end;

procedure TFZDateAcc.Grid3ClKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(Atext),1);
end;

procedure TFZDateAcc.Grid3ClNDayGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if StrToInt(AText)=0 then AText:='';
end;

procedure TFZDateAcc.Grid3ClClockGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
//var FormatSettings:TFormatSettings;
begin
  //FormatSettings.DecimalSeparator:=',';
  //FormatSettings.NegCurrFormat :=1;    тупая сучка не работает на отрицательном числе strtofloat(text,FormatSettings)

if (AText='0,000') or (AText='0') then AText:='';
end;

procedure TFZDateAcc.Grid2ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZDateAcc.Grid1View1KeyPress(Sender: TObject; var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid1View1.OptionsBehavior.IncSearchItem <> Grid1ClTn)then
    begin
     Grid1View1.Controller.IncSearchingText   := '';
     Grid1View1.OptionsBehavior.IncSearchItem := Grid1ClTn;
    end
  end
 else
  if (Grid1View1.OptionsBehavior.IncSearchItem <> Grid1ClFIO)then
   begin
    Grid1View1.Controller.IncSearchingText   := '';
    Grid1View1.OptionsBehavior.IncSearchItem := Grid1ClFIO;
   end;
end;

procedure TFZDateAcc.DSet3AfterOpen(DataSet: TDataSet);
begin
Grid3DBBandedTableView1.ViewData.Expand(False);
end;

procedure TFZDateAcc.Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFZDateAcc.RefreshBtnClick(Sender: TObject);
begin
DSet5.Close;
DSet3.Close;
DSet2.Close;
DSet1.CloseOpen(True);
DSet2.Open;
DSet3.Open;
DSet5.Open;
end;

procedure TFZDateAcc.dxStatusBar1Resize(Sender: TObject);
var i:byte;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFZDateAcc.PanelGrid3DopDataResize(Sender: TObject);
begin
DBMaskEditDepartment.Width:=PanelGrid3DopData.Width-pWidth;
DBMaskEditSmeta.Width:=PanelGrid3DopData.Width-pWidth;
DBMaskEditPost.Width:=PanelGrid3DopData.Width-pWidth;
DBMaskEditCategory.Width:=PanelGrid3DopData.Width-pWidth;
end;

procedure TFZDateAcc.ActionSystemExecute(Sender: TObject);
begin
ZShowMessage('System Data','ID_MAN = '+VarToStrDef(DSet2['ID_MAN'],'NULL')+#13+
                           'ID_GROUP_ACCOUNT = '+VarToStrDef(DSet2['ID_GROUP_ACCOUNT'],'NULL')+#13+
                           'KOD_SETUP_2 = '+VarToStrDef(DSet2['KOD_SETUP_2'],'NULL'),mtInformation,[mbOk]);
end;

procedure TFZDateAcc.Grid3DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  DBMaskEditDepartment.DataBinding.DataSource := nil;
  DBMaskEditSmeta.DataBinding.DataSource := nil;
  DBMaskEditPost.DataBinding.DataSource := nil;
  DBMaskEditCategory.DataBinding.DataSource := nil;
 end
else
 begin
  DBMaskEditDepartment.DataBinding.DataSource := DSource3;
  DBMaskEditSmeta.DataBinding.DataSource := DSource3;
  DBMaskEditPost.DataBinding.DataSource := DSource3;
  DBMaskEditCategory.DataBinding.DataSource := DSource3;
 end;
end;

procedure TFZDateAcc.dxBarButton1Click(Sender: TObject);
begin
Grid3Level1.GridView := GetTable(DSource2,'KOD_SETUP_2');
end;

procedure TFZDateAcc.Panel2Resize(Sender: TObject);
begin
DBTextEditFio.Width := Panel2.Width;
end;

procedure TFZDateAcc.ShowGroupBoxBtnClick(Sender: TObject);
begin

    If (ShowGroupBoxBtn.Down) then
    begin
        Grid3DBBandedTableView1.OptionsView.GroupByBox:=True;
        ShowGroupBoxBtn.Caption:=HideGroupBoxBtn_Caption[PLanguageIndex];
    end
    else
    begin
        Grid3DBBandedTableView1.OptionsView.GroupByBox:=False;
        ShowGroupBoxBtn.Caption:=ShowGroupBoxBtn_Caption[PLanguageIndex];
    end;


end;

procedure TFZDateAcc.Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
   if (AItem.Column.GroupIndex<Grid3ClP1.GroupIndex) and (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFZDateAcc.PrintSmetaBtnClick(Sender: TObject);
var parameter:TZAccListParameter;
begin
parameter.Id_Man:=DSet2['ID_MAN'];
parameter.Id_Group_Account:=DSet2['ID_GROUP_ACCOUNT'];
parameter.Kod_Setup:=DSet2['KOD_SETUP_2'];
parameter.TypeData:=IfThen(PMode=ztdNotSaved,1,0);
parameter.DB_Handle:=DataBase.Handle;
parameter.AOwner:=Self;
PrintRaschListBySmet(parameter);
end;

procedure TFZDateAcc.BtnPrintPeriodClick(Sender: TObject);
var parameter:TZAccListParameter;
    id:variant;
begin
  id:=DSet2['ID_GROUP_ACCOUNT'];
  DSet2.First;
  parameter.Kod_Setup:=DSet2['KOD_SETUP_2'];
  parameter.Id_Man:=DSet2['ID_MAN'];
  parameter.Id_Group_Account:=-1;
  parameter.TypeData:=IfThen(PMode=ztdNotSaved,1,0);
  parameter.DB_Handle:=DataBase.Handle;
  parameter.AOwner:=Self;
  DSet2.Last;
  parameter.Id_Department:=DSet2['KOD_SETUP_2'];
  PrintRaschList(parameter);
  Grid2View1.DataController.LocateByKey(id);
end;

procedure TFZDateAcc.dxBarLargeButton1Click(Sender: TObject);
var parameter:TZAccListParameter;
begin
parameter.Id_Man:=DSet2['ID_MAN'];
parameter.Id_Group_Account:=-1;
parameter.Kod_Setup:=DSet2['KOD_SETUP_2'];
parameter.TypeData:=IfThen(PMode=ztdNotSaved,1,0);
parameter.DB_Handle:=DataBase.Handle;
parameter.AOwner:=Self;
parameter.Id_Department:=-1;
PrintRaschList(parameter);
end;

procedure TFZDateAcc.BarBtnShortPrintClick(Sender: TObject);
var parameter:TZAccListParameter;
begin
parameter.Id_Man:=DSet2['ID_MAN'];
parameter.Id_Group_Account:=DSet2['ID_GROUP_ACCOUNT'];
parameter.Kod_Setup:=DSet2['KOD_SETUP_2'];
parameter.TypeData:=IfThen(PMode=ztdNotSaved,1,0);
parameter.DB_Handle:=DataBase.Handle;
parameter.AOwner:=Self;
PrintRaschListShort(parameter);
end;

procedure TFZDateAcc.cxGridDBTableViewTrudDogFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var TypeId,i:Byte;
    tmpColumn:TcxGridDBBandedColumn;
    wf:TForm;
    k,p,VDayOfTheWeek,PDayOfTheWeek,Day:integer;
    g,m,d:Word;
    Value:Variant;
begin
   if not DSetCalendar.Active then Exit;
   RxDSetCalendar.Close;



   RxDSetCalendar.Open;

   //день недели. будет увеличиваться для заполнения по дням недели календаря(рикс датасета)
   VDayOfTheWeek:=DayOfTheWeek(StrToDate(KodSetupToPeriod(PParameter.KodSetup1,6)));
   // день недели первой. для старта
   PDayOfTheWeek := VDayOfTheWeek;

   //EncodeDate(g,m,d)

   //день месяца. для заполнения дней и установления соответствия отобранным датам и данным
   Day:=1;





   // на 5 недель, макс
   for k:=1 to 5 do
   begin

    RxDSetCalendar.Append;

    if k=1 then
      for p:=1 to PDayOfTheWeek-1 do
        RxDSetCalendar.Fields[VDayOfTheWeek-1].Value:='';

    // на семь дней
    for p:=PDayOfTheWeek to 7 do
    begin
      Value:=(k-1)*7 + p-PDayOfTheWeek+1;
      if Value>31 then Value:=''; //если кол дней больше 31 значит прекращаем заполнять датасет числами


      // ставим число вместо типа выхода т к не известно есть ли дата для данного числа в данных запроса
      RxDSetCalendar.Fields[VDayOfTheWeek-(k-1)*7-1].Value:=Value;



      // ищем день в текущей дате строки запроса. Т к Запрос упорядочен по дате с меньшей к большей
      // числа месяца и недели и записи запроса идут по порядку, поэтому мы все время перебираем по 1
      //DecodeDate(DSetCalendar.FieldByName('cur_date').AsDateTime,g,m,d);
      //если есть дата то забираем выход в календарь
      if DSetCalendar.Locate('TBL_DAY',Day,[]) then RxDSetCalendar.Fields[VDayOfTheWeek-(k-1)*7-1].Value:=DSetCalendar.FieldByName('VIHOD_NAME_SHORT').AsString;

      

      // перебираем дальше по 1 дни недели и месяца по порядку
      VDayOfTheWeek:=VDayOfTheWeek+1;
      Day:=Day+1;

      if not DSetCalendar.EOF then
        DSetCalendar.Next
      else Break;
    end;
    // ставим начальный день недели для цикла, после первого раза
    PDayOfTheWeek:=1;

    RxDSetCalendar.Post;
    if DSetCalendar.EOF then Break;
   end;
end;

end.
