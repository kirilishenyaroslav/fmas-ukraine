unit TuTimesheet_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,iBase, dxBar, dxBarExtItems, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxCheckBox, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls, cxLabel,
  cxSpinEdit, cxContainer, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ExtCtrls, dxStatusBar, cxGroupBox,TuCommonProc,Dates,TuCommonLoader,
  cxGridDBTableView,TuCommonStyles, TuTimesheet_Edit,TuCommonTypes,
  TUCommonConsts,ZcxLocateBar,TuMessages,TuTimesheet_Sign, cxMemo,
  cxSplitter, cxTL, cxInplaceContainer, cxTLData, cxDBTL, StdCtrls,AccMGMT,
  cxTimeEdit;
type
  TParamFilterTsh=class(Tobject)
    Owner:TComponent;
    KodSetup:variant;
    id:variant;
    idPostMoving:variant;
    typeId:integer;
    nameId:string;
end;

type
  TFormTimesheet_Main = class(TForm)
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonInsert: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar2: TdxStatusBar;
    StatusBar3: TdxStatusBar;
    StatusBar5: TdxStatusBar;
    StatusBar4: TdxStatusBar;
    Splitter1: TSplitter;
    ButtonSigned: TdxBarLargeButton;
    ButtonRedeFined: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    cxStyle31: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    StatusBar1: TdxStatusBar;
    StatusBar6: TdxStatusBar;
    StatusBar7: TdxStatusBar;
    StyleOutPut: TcxStyle;
    StyleHoliday: TcxStyle;
    StyleSimple: TcxStyle;
    StyleSimple1: TcxStyle;
    BarDockLocate: TdxBarDockControl;
    cxStyleTshAbsHeader: TcxStyle;
    StyleBold: TcxStyle;
    dxStatusBar1: TdxStatusBar;
    StyleFio: TcxStyle;
    dxBarColorCombo1: TdxBarColorCombo;
    ButtonNoteDelete: TdxBarLargeButton;
    ButtonPrint: TdxBarLargeButton;
    ButtonFilter: TdxBarLargeButton;
    StyleNotDay: TcxStyle;
    StyleSelect: TcxStyle;
    StyleSelect1: TcxStyle;
    dxBarButton1: TdxBarButton;
    ButtonNoteInsert: TdxBarButton;
    ButtonNoteUpdate: TdxBarButton;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    GridHeader: TcxGrid;
    GridHeaderBandedTableView1: TcxGridBandedTableView;
    GridColTN: TcxGridBandedColumn;
    GridColFio: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn3: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn5: TcxGridBandedColumn;
    Col1: TcxGridBandedColumn;
    Col2: TcxGridBandedColumn;
    Col30: TcxGridBandedColumn;
    Col3: TcxGridBandedColumn;
    Col4: TcxGridBandedColumn;
    Col5: TcxGridBandedColumn;
    Col6: TcxGridBandedColumn;
    Col7: TcxGridBandedColumn;
    Col8: TcxGridBandedColumn;
    Col9: TcxGridBandedColumn;
    Col10: TcxGridBandedColumn;
    Col11: TcxGridBandedColumn;
    Col12: TcxGridBandedColumn;
    Col15: TcxGridBandedColumn;
    ColX: TcxGridBandedColumn;
    Col17: TcxGridBandedColumn;
    Col20: TcxGridBandedColumn;
    Col21: TcxGridBandedColumn;
    Col19: TcxGridBandedColumn;
    Col18: TcxGridBandedColumn;
    Col31: TcxGridBandedColumn;
    Col29: TcxGridBandedColumn;
    Col16: TcxGridBandedColumn;
    Col14: TcxGridBandedColumn;
    Col13: TcxGridBandedColumn;
    Col23: TcxGridBandedColumn;
    Col24: TcxGridBandedColumn;
    Col26: TcxGridBandedColumn;
    Col27: TcxGridBandedColumn;
    Col25: TcxGridBandedColumn;
    Col22: TcxGridBandedColumn;
    Col28: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn38: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn39: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn40: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn41: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn42: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn43: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn44: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn45: TcxGridBandedColumn;
    GridThDBBandedTableView1: TcxGridDBBandedTableView;
    ColNum: TcxGridDBBandedColumn;
    ColTN: TcxGridDBBandedColumn;
    ColName: TcxGridDBBandedColumn;
    ColD1: TcxGridDBBandedColumn;
    ColD2: TcxGridDBBandedColumn;
    ColD3: TcxGridDBBandedColumn;
    ColD4: TcxGridDBBandedColumn;
    ColD6: TcxGridDBBandedColumn;
    ColD7: TcxGridDBBandedColumn;
    ColD8: TcxGridDBBandedColumn;
    ColD9: TcxGridDBBandedColumn;
    ColD10: TcxGridDBBandedColumn;
    ColD11: TcxGridDBBandedColumn;
    ColD12: TcxGridDBBandedColumn;
    ColD13: TcxGridDBBandedColumn;
    ColD14: TcxGridDBBandedColumn;
    ColD15: TcxGridDBBandedColumn;
    ColDX: TcxGridDBBandedColumn;
    ColD16: TcxGridDBBandedColumn;
    ColD17: TcxGridDBBandedColumn;
    ColD18: TcxGridDBBandedColumn;
    ColD19: TcxGridDBBandedColumn;
    ColD20: TcxGridDBBandedColumn;
    ColD21: TcxGridDBBandedColumn;
    ColD22: TcxGridDBBandedColumn;
    ColD23: TcxGridDBBandedColumn;
    ColD24: TcxGridDBBandedColumn;
    ColD25: TcxGridDBBandedColumn;
    ColD26: TcxGridDBBandedColumn;
    ColD27: TcxGridDBBandedColumn;
    ColD28: TcxGridDBBandedColumn;
    ColD29: TcxGridDBBandedColumn;
    ColD30: TcxGridDBBandedColumn;
    ColD5: TcxGridDBBandedColumn;
    ColD31: TcxGridDBBandedColumn;
    ColT1: TcxGridDBBandedColumn;
    ColT5: TcxGridDBBandedColumn;
    ColT2: TcxGridDBBandedColumn;
    ColT3: TcxGridDBBandedColumn;
    ColT4: TcxGridDBBandedColumn;
    ColT6: TcxGridDBBandedColumn;
    ColT7: TcxGridDBBandedColumn;
    ColT8: TcxGridDBBandedColumn;
    ColT9: TcxGridDBBandedColumn;
    ColT10: TcxGridDBBandedColumn;
    ColT11: TcxGridDBBandedColumn;
    ColT12: TcxGridDBBandedColumn;
    ColT13: TcxGridDBBandedColumn;
    ColT14: TcxGridDBBandedColumn;
    ColT15: TcxGridDBBandedColumn;
    ColTX: TcxGridDBBandedColumn;
    ColT16: TcxGridDBBandedColumn;
    ColT17: TcxGridDBBandedColumn;
    ColT18: TcxGridDBBandedColumn;
    ColT19: TcxGridDBBandedColumn;
    ColT20: TcxGridDBBandedColumn;
    ColT21: TcxGridDBBandedColumn;
    ColT22: TcxGridDBBandedColumn;
    ColT23: TcxGridDBBandedColumn;
    ColT24: TcxGridDBBandedColumn;
    ColT25: TcxGridDBBandedColumn;
    ColT26: TcxGridDBBandedColumn;
    ColT27: TcxGridDBBandedColumn;
    ColT28: TcxGridDBBandedColumn;
    ColT29: TcxGridDBBandedColumn;
    ColT30: TcxGridDBBandedColumn;
    ColT31: TcxGridDBBandedColumn;
    ColDays: TcxGridDBBandedColumn;
    ColAll: TcxGridDBBandedColumn;
    ColOvertime: TcxGridDBBandedColumn;
    ColNight: TcxGridDBBandedColumn;
    ColHoliday: TcxGridDBBandedColumn;
    ColOutput: TcxGridDBBandedColumn;
    ColRmoving: TcxGridDBBandedColumn;
    ColIdPostMoving: TcxGridDBBandedColumn;
    GridHeaderLevel1: TcxGridLevel;
    GridTh: TcxGrid;
    GridThLevel1: TcxGridLevel;
    TabSheet2: TTabSheet;
    cxGrid1: TcxGrid;
    GridThAbsDBBandedTableView1: TcxGridDBBandedTableView;
    GridThAbsColNum: TcxGridDBBandedColumn;
    GridThAbsCol1: TcxGridDBBandedColumn;
    GridThAbsCol2: TcxGridDBBandedColumn;
    GridThAbsCol3: TcxGridDBBandedColumn;
    GridThAbsCol4: TcxGridDBBandedColumn;
    GridThAbsCol5: TcxGridDBBandedColumn;
    GridThAbsCol6: TcxGridDBBandedColumn;
    GridThAbsCol7: TcxGridDBBandedColumn;
    GridThAbsCol8: TcxGridDBBandedColumn;
    GridThAbsCol9: TcxGridDBBandedColumn;
    GridThAbsCol10: TcxGridDBBandedColumn;
    GridThAbsCol11: TcxGridDBBandedColumn;
    GridThAbsCol12: TcxGridDBBandedColumn;
    GridThAbsCol13: TcxGridDBBandedColumn;
    GridThAbsColFio: TcxGridDBBandedColumn;
    GridThAbsColTN: TcxGridDBBandedColumn;
    GridThAbsCol31: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    dxBarStatic1: TdxBarStatic;
    CaptionTsh: TdxBarStatic;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    dxBarDockControl2: TdxBarDockControl;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarStatic4: TdxBarStatic;
    EditMonth: TdxBarCombo;
    EditYear: TdxBarSpinEdit;
    cxGroupBox2: TcxGroupBox;
    dxBarButton2: TdxBarButton;
    ButtonUnSigned: TdxBarLargeButton;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    cxGrid4: TcxGrid;
    cxGrid4Level1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    ButtonTestData: TdxBarLargeButton;
    StyleTypeTshCon: TcxStyle;
    GridTempletOrPeriod: TcxGrid;
    GridTempletOrPeriodLevel1: TcxGridLevel;
    GridTempletOrPeriodDBTableView1: TcxGridDBBandedTableView;
    GridTempletOrPeriodDBTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    StyleBackGround: TcxStyle;
    Panel5: TPanel;
    cxGrid4DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid4DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    StyleHistory1: TcxStyle;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter2: TcxSplitter;
    dxBarStatic5: TdxBarStatic;
    CaptionIsAct: TdxBarStatic;
    GridTempletOrPeriodDBTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditTempletPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonSignedClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonRedeFinedClick(Sender: TObject);
    procedure GridThDBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure GridPeriodTypeDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ColDXGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridThDBBandedTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure GridThDBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridHeaderBandedTableView1StylesGetHeaderStyle(
      Sender: TcxGridTableView; AColumn: TcxGridColumn;
      out AStyle: TcxStyle);
    procedure ButtonPrintClick(Sender: TObject);
    procedure GridPeriodTypeDBTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure ButtonNoteUpdateClick(Sender: TObject);
    procedure ButtonNoteInsertClick(Sender: TObject);
    procedure ButtonNoteDeleteClick(Sender: TObject);
    procedure ButtonFilterClick(Sender: TObject);
    procedure GridThAbsDBBandedTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridThDBBandedTableView1DblClick(Sender: TObject);
    procedure PageControl1Exit(Sender: TObject);
    procedure EditYearChange(Sender: TObject);
    procedure RedeFinedDogInTsh;
    procedure ButtonUnSignedClick(Sender: TObject);
    procedure GridPeriodTypeDBTableView2FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure TablePeriodTypeClick(Sender: TObject);
    procedure ButtonTestDataClick(Sender: TObject);
  private
    ActivePageIndex:integer;
  public
    FCanvasCircl:TRect;
    FFormStyle:TtuFormStyleTh;
    pStylesDM:TStyleDM;
    FIdMan:variant;
    PBarLocate:TZBarLocate;
    FDay:integer;
    Fid_official_note_trans:Variant;
    Fid_official_note:Variant;
    FNote:Variant ;
    FIdManTsh:variant;
    FIdVihod:variant;
    FVihodName:string;
    FIsWork:string;
    FdateDoc:Tdate;
    FNum:variant;
    Sotrud:Boolean;
    FParamFilter:TParamFilterTsh;
    KodSetupCurrent:integer;
  constructor Create(Aowner:TComponent;Aid_man:integer; tuFormStyleTh:TtuFormStyleTh;AParamFilter:TParamFilterTsh );reintroduce;
    procedure IsActiveButton;
    procedure IsTimesheetInfo;
 end;

 var     Month:word;
         Year:word;

implementation

uses TuTimesheet_DM, FIBQuery, pFIBStoredProc, pFIBQuery,
  cxDBLookupComboBox,TuTimesheet_OptionCreate;

constructor TFormTimesheet_Main.Create(Aowner:TComponent;Aid_man:integer; tuFormStyleTh:TtuFormStyleTh;AParamFilter:TParamFilterTsh );
var DateLoc:TDate ;
    day,i:word;

begin

  DateLoc:=strtodate(KodSetupToPeriod(AParamFilter.KodSetup,6));
  DecodeDate(DateLoc, Year, Month,day );
  DM.DSetCalendar.SelectSQL.Text:='SELECT * FROM GET_CALENDAR('+IntToStr(Year)+','+IntToStr(Month)+') where HOLIDAY=''T''';
  DM.DSetCalendar.open;
  FParamFilter:=AParamFilter;
  inherited Create(Aowner);
  KodSetupCurrent:=CurrentKodSetup(DM.DB.Handle);
  EditYear.Value:=Year;
  EditMonth.Items.Text:=GetConst('MonthJanuary','OtherConsts')+#13+
                                  GetConst('MonthFebruary','OtherConsts')+#13+
                                  GetConst('MonthMarch','OtherConsts')+#13+
                                  GetConst('MonthApril','OtherConsts')+#13+
                                  GetConst('MonthMay','OtherConsts')+#13+
                                  GetConst('MonthJune','OtherConsts')+#13+
                                  GetConst('MonthJuly','OtherConsts')+#13+
                                  GetConst('MonthAutumn','OtherConsts')+#13+
                                  GetConst('MonthSeptember','OtherConsts')+#13+
                                  GetConst('MonthOctober','OtherConsts')+#13+
                                  GetConst('MonthNovember','OtherConsts')+#13+
                                  GetConst('MonthDecember','OtherConsts');
  EditMonth.ItemIndex:= Month-1;
  FDay:=1;
  Sotrud:=true;

  FFormStyle:=tuFormStyleTh;
  FIdMan:=AID_MAN;
  //ButtonRefreshClick(self);
//******************************************************************************
  pStylesDM:=TStyleDM.Create(Self);
  GridThDBBandedTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
 // GridPeriodTypeDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
 // GridTempletOrPeriodDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridHeaderBandedTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridThAbsDBBandedTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  GridTempletOrPeriodDBTableView1.DataController.DataSource:=Dm.DSourceTempletOrPeriod;
  GridThDBBandedTableView1.DataController.DataSource:=Dm.DSourceTimeSheet;
  GridThAbsDBBandedTableView1.DataController.DataSource:=Dm.DSourceTimeSheet;

  cxGridDBTableView1.DataController.DataSource:=dm.DSourcePeriodType;
  cxGrid4DBBandedTableView1.DataController.DataSource:=Dm.DSourceHistory;
 //******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DM.DSetTimeSheet;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('FIO',GridColFio.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('TN',GridColTN.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TN';
 PBarLocate.FieldSelectVisible := False;
 PBarLocate.DockControl := BarDockLocate;
//******************************************************************************
{GridThAbsColNum.Caption:='N'+#13+'п/п';
GridThAbsCol1.Caption:='основна та додаткова выдпустки'+#13+'коди 8-10';
GridThAbsCol2.Caption:='відпустки у зв`язку з навчанням, творчі, в обов. порядку та інші'+#13+'коди 11-15, 17, 22';
GridThAbsCol3.Caption:='відпустки без збереження з/п за згодою сторін'+#13+'коди 18';
GridThAbsCol4.Caption:='відпустки без збереження з/п на період припинення виконання робіт '+#13+'коди 19';
GridThAbsCol5.Caption:='перевод на неповний робочи день'+#13+'коди 20';
GridThAbsCol6.Caption:='тимчасовий перевод на інше підприємство '+#13+'коди 21';
GridThAbsCol7.Caption:='простої'+#13+'коди 23';
GridThAbsCol8.Caption:='прогули'+#13+'коди 24';
GridThAbsCol9.Caption:='страйки'+#13+'коди 25';
GridThAbsCol10.Caption:='тимчасова непрацездатність'+#13+'коди 26-27';
GridThAbsCol11.Caption:='інші'+#13+'коди 28-30';
GridThAbsCol12.Caption:='Всього неявок'+#13+'години';
GridThAbsCol13.Caption:='Оклад, тарифна ставка, грн.'; }

GridThAbsColNum.Caption:='N'+#13+'п/п';
GridThAbsColTN.Caption:='Табельний номер';
GridThAbsColFIO.Caption:='П. І. Б.';
GridThAbsCol1.Caption:='8-10';
GridThAbsCol2.Caption:='11-15,'+#13+'17,22';
GridThAbsCol3.Caption:='18';
GridThAbsCol4.Caption:='19';
GridThAbsCol5.Caption:='20';
GridThAbsCol6.Caption:='21';
GridThAbsCol8.Caption:='24';
GridThAbsCol7.Caption:='23';
GridThAbsCol9.Caption:='25';
GridThAbsCol10.Caption:='26-27';
GridThAbsCol11.Caption:='28-30';
GridThAbsCol12.Caption:='Всього неявок'+#13+'години';
GridThAbsCol13.Caption:='Оклад, тарифна ставка, грн.';
dxStatusBar1.Panels[0].text:='Ins-'+ButtonInsert.Caption;
dxStatusBar1.Panels[1].text:='Del-'+ButtonDelete.Caption;
dxStatusBar1.Panels[2].text:='F5-'+ButtonRefresh.Caption;
dxStatusBar1.Panels[3].text:='F6-'+ButtonRedeFined.Caption;
dxStatusBar1.Panels[4].text:='F9-'+ButtonSigned.Caption;
dxStatusBar1.Panels[5].text:='F10-'+ButtonUnSigned.Caption;
dxStatusBar1.Panels[6].text:='F8-'+ButtonFilter.Caption;
dxStatusBar1.Panels[7].text:='Esc-'+ButtonExit.Caption;
//******************************************************************************
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

 end;
{$R *.dfm}

procedure TFormTimesheet_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if dm.TransactionR.Active then  Dm.TransactionR.Commit;
 if dm.TransactionW.Active then  Dm.TransactionW.Commit;
 DM.Free;
 Action:=caFree;
end;

procedure TFormTimesheet_Main.EditTempletPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var PKodSetup, M, Y,D:word;
begin

end;

procedure TFormTimesheet_Main.ButtonInsertClick(Sender: TObject);
var Form : TFormEditTsh;
    dateBeg, DateEnd:Tdate;
    T:variant;

begin



  Form:=TFormEditTsh.create(self, FParamFilter.KodSetup);
  if FFormStyle=tfsWork then
  begin
    Form.EditMonth.Enabled:=false;
    Form.EditYear.Enabled:=false;
  end;
  if dm.DSetTempletOrPeriod.RecordCount=0 then
  begin
    Form.FID:=FParamFilter.id;
    Form.FTypeID:=FParamFilter.TypeId;
    Form.FIdPostMoving:=FParamFilter.IdPostMoving;
  end
  else
  begin
    Form.FID:=dm.DSetTempletOrPeriod['ID'];
    Form.FTypeID:=dm.DSetTempletOrPeriod['TYPE_ID'];
    Form.FIdPostMoving:=dm.DSetTempletOrPeriod['ID_POST_MOVING'];
  end;
  case FParamFilter.TypeId of
    1:Form.RadioButtonTemplet.Checked:=true;
    2:Form.RadioButtonDog.Checked:=true;
  end;
  if FParamFilter.TypeId<>3 then
  begin

    Form.EditTemOrDog.Text:= FParamFilter.nameId;
  end;
  if Form.ShowModal= mrYes then
  begin
    DateBeg:=EncodeDate(Form.EditYear.Value, Form.EditMonth.ItemIndex+1, Form.Editfrom.value);
    DateEnd:=EncodeDate(Form.EditYear.Value, Form.EditMonth.ItemIndex+1, Form.EditTo.value);
    with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_IS_FORM';
      Prepare;
      ParamByName('ID').AsInteger:=Form.FID;
      ParamByName('ID_POST_MOVING_IN').Asvariant:=Form.FIdPostMoving;
      ParamByName('DATE_BEG_IN').asdate:=DateBeg;
      ParamByName('DATE_END_IN').asdate:=DateEnd;
      ParamByName('is_test').AsString:='F';
      ParamByName('id_man_in').AsInteger:=AccMGMT.GetUserIdMan;
      ParamByName('comp_name').AsString:=TuGetCompName;
      ParamByName('comp_ip').AsString:=TuGetIPAddress;
      ExecProc;
      T:= ParamByName('ID_TSH_GROUP').asvariant;
      if  ParamByName('ERROR_CAPTION').AsString<>'' then
      begin
        TuShowMessage('Увага',ParamByName('ERROR_CAPTION').AsString, mtInformation, [mbOK]);
        Transaction.Rollback;
        exit;
      end;
      Transaction.commit;
      ButtonRefreshClick(Sender);
      DM.DSetTempletOrPeriod.Locate('ID',Form.FID,[] );
      if T<>null then
        DM.DSetPeriodType.Locate('ID_TSH_GROUP', T,[])
      else
        TuShowMessage('Увага','Сформований корегуючий табель порожній', mtInformation, [mbOK]);

    end;
  end;
  Form.Free;
end;

procedure TFormTimesheet_Main.ButtonRefreshClick(Sender: TObject);
var T1, T2:variant;
begin
with DM do
 begin
  if DSetTempletOrPeriod.active then T1:=DSetTempletOrPeriod['ID'];
  if DSetPeriodType.active then  T2:=DSetPeriodType['ID_TSH_GROUP'];
  DSetTempletOrPeriod.Close;
  DSetPeriodType.Close;
  DSetTimeSheet.Close;
  DM.DsetHistory.Close;

  DM.DSetTempletOrPeriod.SelectSQL.Text:='select * from TU_TIMESHEET_TEMPLETE_S('+inttostr(FParamFilter.KodSetup)+','
                                                                              +inttostr(FParamFilter.TypeId)+','
                                                                              +VarToStrDef(FParamFilter.ID, 'Null')+','
                                                                              +VarToStrDef(FParamFilter.IdPostMoving, 'Null,')
                                                                              +inttostr(AccMGMT.GetUserIdMan)+')';
  DM.DSetPeriodType.SelectSQL.Text:='select * from  TU_TIMESHEET_TYPE_S(?ID,?TYPE_ID,'+inttostr(FParamFilter.KodSetup)+',?ID_POST_MOVING) ';
  DM.DSetTimeSheet.SelectSQL.Text:='select * from  TU_TIMESHEET_S(?ID_TSH_GROUP) order by INDEXNUM';
  DM.DsetHistory.SelectSql.text:='select * from  TU_TSH_GROUP_HISTORY_S(?ID,?ID_POST_MOVING,'+inttostr( FParamFilter.KodSetup) +' )';
  DM.DSetTempletOrPeriod.open;
  DM.DSetPeriodType.open;
  DM.DSetTimeSheet.open;
  DM.DsetHistory.open;
  DSetTempletOrPeriod.Locate('ID', T1,[]);
  DSetPeriodType.Locate('ID_TSH_GROUP',T2,[]);
  IsActiveButton;
  GridPeriodTypeDBTableView1FocusedRecordChanged(nil, nil,nil,true);
  GridHeaderBandedTableView1BandedColumn3.Caption:=KodSetupToPeriod(FParamFilter.KodSetup,3);
  GridHeaderBandedTableView1.Invalidate(true);
 end;
end;

procedure TFormTimesheet_Main.ButtonSignedClick(Sender: TObject);
var T:variant;
begin



with Dm.StProc do
begin
  T:=dm.DSetPeriodType['ID_TSH_GROUP'];
  Transaction.StartTransaction;
  StoredProcName:='TU_TSH_GROUP_SIGN';
  Prepare;
  ParamByName('ID_TSH_GROUP').AsInteger:=T;
  ParamByName('IS_SIGN').AsString:='T';
  ParamByName('id_man').AsInteger:=AccMGMT.GetUserIdMan;
  ParamByName('comp_name').AsString:=TuGetCompName;
  ParamByName('comp_ip').AsString:=TuGetIPAddress;
  ExecProc;
  if   ParamByName('ERROR_CAPTION').AsVariant <>null then
  begin
    TuShowMessage('Увага', ParamByName('ERROR_CAPTION').asstring, mtInformation, [mbOK]);
    Exit;
  end ;
  Transaction.Commit;
  dm.DSetPeriodType.CloseOpen(true);
  dm.DsetHistory.closeopen(true);
  dm.DSetPeriodType.Locate('ID_TSH_GROUP', T, []);
  dm.DSetTimeSheet.open;

end;







end;

procedure TFormTimesheet_Main.ButtonExitClick(Sender: TObject);
begin
Close
end;

procedure TFormTimesheet_Main.ButtonDeleteClick(Sender: TObject);
begin


 if TuShowMessage('Увага', 'Ви дійсно бажаєте видалити?', mtInformation, mbOKCancel)=MrOk then
  with DM.StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TU_TIMESHEET_D';
    Prepare;
    ParamByName('ID_TSH_GROUP').AsInteger:=DM.DSetPeriodType['ID_TSH_GROUP'];
    ParamByName('id_man').AsInteger:=AccMGMT.GetUserIdMan;
    ParamByName('comp_name').AsString:=TuGetCompName;
    ParamByName('comp_ip').AsString:=TuGetIPAddress;
    ExecProc;
    if (ParamByName('ERROR_CAPTION').AsString<>'') then
    begin
       TuShowMessage('Увага!', ParamByName('ERROR_CAPTION').AsString, mtInformation, [mbOK]);
       Transaction.Rollback;
       exit;
    end
    else
    Transaction.commit;
  end;

  ButtonRefreshClick(Sender);
end;

procedure TFormTimesheet_Main.ButtonRedeFinedClick(Sender: TObject);
var T,T1,T2:variant;
begin



  with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_IS_FORM';
      Prepare;
      ParamByName('ID').AsInteger:=Dm.DSetTempletOrPeriod['ID'];
      ParamByName('ID_POST_MOVING_IN').Asvariant:=Dm.DSetTempletOrPeriod['ID_POST_MOVING'];
      ParamByName('DATE_BEG_IN').asdate:=Dm.DSetPeriodType['DATE_BEG'];
      ParamByName('DATE_END_IN').asdate:=Dm.DSetPeriodType['DATE_END'];
      ParamByName('is_test').AsString:='F';
      ParamByName('id_man_in').AsInteger:=AccMGMT.GetUserIdMan;
      ParamByName('comp_name').AsString:=TuGetCompName;
      ParamByName('comp_ip').AsString:=TuGetIPAddress;
      ExecProc;
      if  ParamByName('ERROR_CAPTION').AsString<>'' then
      begin
        TuShowMessage('Увага',ParamByName('ERROR_CAPTION').AsString, mtInformation, [mbOK]);
        Transaction.Rollback;
        exit;
      end;
      Transaction.commit;
    end;


T1:=GridThDBBandedTableView1.Controller.FocusedItemIndex;
  T2:=FDay;
  T:=DM.DSetTimeSheet['ID_TIMESHEET'] ;
  DM.DSetTimeSheet.CloseOpen(true);
   dm.DsetHistory.closeopen(true);
  Dm.DSetTimeSheet.Locate('ID_TIMESHEET', T, []);
   Fday:=T2;
  GridThDBBandedTableView1.Invalidate(true);
  Fday:=T2;
  GridThDBBandedTableView1.Controller.FocusedItemIndex:=T1;
end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin

if FParamFilter.TypeId=2 then
if( strtoint(ARecord.DisplayTexts[73])=FParamFilter.Id) and( strtoint(ARecord.DisplayTexts[74])=FParamFilter.IdPostMoving) then
 AStyle:=cxStyle31 ;
//else  AStyle:=pStylesDM.cxStyle2;
if Assigned(AItem) and  (AItem.Caption=inttostr(FDay)) then
 AStyle:=StyleSelect;

end;

procedure TFormTimesheet_Main.IsActiveButton;
begin
if (FFormStyle=tfsPast) then
 ButtonInsert.Visible:=ivNever
else
 ButtonInsert.Visible:=ivAlways;
end;

procedure TFormTimesheet_Main.GridPeriodTypeDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if DM.DSetPeriodType['IS_ACT']='F' then
  CaptionIsAct.Visible:=ivAlways
else
  CaptionIsAct.Visible:=ivNever;

if(dm.DSetPeriodType.RecordCount>0) then  ButtonNoteInsert.Visible:=ivNever;
if (dm.DSetPeriodType.RecordCount>0) then
begin
  ButtonNoteInsert.Enabled:=true;
  if  dm.DSetPeriodType['SIGNED']='T' then
    ButtonSigned.Enabled:=false
  else
    ButtonSigned.Enabled:=true;
  if  dm.DSetPeriodType['ID_LEVEL'] =0 then
  begin
    ButtonRedeFined.Enabled:=true;
    ButtonNoteUpdate.Enabled:=true;
    ButtonTestData.Enabled:=false;
    ButtonUnSigned.Enabled:=false;
    ButtonDelete.Enabled:=true;
  end
  else
  begin
    ButtonRedeFined.Enabled:=false;
    ButtonTestData.Enabled:=true;
    ButtonDelete.Enabled:=false;
    ButtonUnSigned.Enabled:=true;
  end ;
  ButtonPrint.Enabled:=true
end
else
begin
  ButtonNoteInsert.Enabled:=false;
  ButtonNoteUpdate.Enabled:=false;
  ButtonSigned.Enabled:=false;
  ButtonRedeFined.Enabled:=false;
  ButtonDelete.Enabled:=false;
  if (dm.DSetPeriodType.RecordCount>0) then
    ButtonPrint.Enabled:=true ;
  ButtonPrint.Enabled:=false;
  ButtonUnSigned.Enabled:=false;
  ButtonTestData.Enabled:=false;
end;
if (FFormStyle=tfsPast) then
begin
  ButtonSigned.Visible:=ivNever;
  ButtonRedeFined.Visible:=ivNever;
  ButtonNoteInsert.Visible:=ivNever;
  ButtonNoteUpdate.Visible:=ivNever;
end
else
begin
  ButtonSigned.Visible:=ivAlways;
  ButtonRedeFined.Visible:=ivAlways;
  ButtonNoteUpdate.Visible:=ivAlways;
  ButtonNoteInsert.Visible:=ivAlways;
end ;
cxGridDBTableView1.ViewData.Expand(true);
cxGrid4DBBandedTableView1.ViewData.Expand(true);

end;

procedure TFormTimesheet_Main.ColDXGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText:='*';
end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);

begin
  if strtoint(AFocusedItem.caption)=0 then
    FDay:=1
  else
    FDay:=strtoint(AFocusedItem.caption);
  IsTimesheetInfo;
  GridHeaderBandedTableView1.Columns[4].Styles.Content:=cxStyle31;
  GridThDBBandedTableView1.Invalidate(true);
  GridHeaderBandedTableView1.Invalidate(true);
end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FDay:=1;
  IsTimesheetInfo;
end;

procedure TFormTimesheet_Main.IsTimesheetInfo;
begin
  if  (DM.DSetTempletOrPeriod.Active )and (DM.DSetTimeSheet.RecordCount>0) then
    with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_INFO';
      Prepare;
      ParamByName('ID_timesheet').AsInteger:=DM.DSetTimeSheet['ID_timesheet'];
      ParamByName('num_day').AsInteger:= FDay;
      ExecProc;
      if  ParamByName('ID_VIHOD').AsVariant =null then
      begin
        Sotrud:=false;
        ButtonNoteInsert.Enabled:=false;
      end
      else
      begin
        Sotrud:=true;
        ButtonNoteInsert.Enabled:=true;
      end;

      FIdVihod:= ParamByName('ID_VIHOD').AsInteger ;
      FVihodName:=ParamByName('Type_work').asstring;
      FIsWork:=ParamByName('IS_WORK').asstring;
      StatusBar1.Panels[1].Text:='Підрозділ: '+ ParamByName('DEP_NAME').asstring;
      StatusBar2.Panels[1].Text:='Посада: '+ParamByName('post_name').asstring +' '+ParamByName('stavka').asstring+' cт. ('+ParamByName('DOG_DATE_BEG').asstring+' - '+ParamByName('DOG_DATE_END').asstring+')';
      StatusBar3.Panels[1].Text:='Дата народжения: '+ ParamByName('BIRTH_DAY').asstring;
      StatusBar4.Panels[1].Text:='Режим роботи: '+ ParamByName('wm_name').asstring;
      StatusBar5.Panels[1].Text:='Тип вихода: '+ ParamByName('Type_work').asstring;

      //

      StatusBar1.Panels[6].Text:=DM.DSetTimeSheet['DATE_BEG']+Fday-1;
      if ParamByName('WM_WORK_BEG').asstring<>ParamByName('wm_work_end').asstring then
      begin
        StatusBar3.Panels[9].Text:=ParamByName('WM_WORK_BEG').asstring ;
        StatusBar4.Panels[9].Text:=ParamByName('wm_work_end').asstring;
      end
      else
      begin
        StatusBar3.Panels[9].Text:='';
        StatusBar4.Panels[9].Text:='';
      end ;
      if ParamByName('work_beg').asstring<>ParamByName('work_end').asstring then
      begin
        StatusBar3.Panels[10].Text:=ParamByName('work_beg').asstring;
        StatusBar4.Panels[10].Text:=ParamByName('work_end').asstring ;
      end
      else
      begin
        StatusBar3.Panels[10].Text:='';
        StatusBar4.Panels[10].Text:='';
      end;
      StatusBar5.Panels[9].Text:=ParamByName('wm_hours').asstring;
      StatusBar5.Panels[10].Text:=ParamByName('hours').asstring;
      StatusBar6.Panels[9].Text:=ParamByName('wm_hours_night').asstring;
      StatusBar6.Panels[10].Text:=ParamByName('hours_night').asstring;

      StatusBar3.Panels[4].Text:=ParamByName('wm_work_day').asstring;
      StatusBar3.Panels[5].Text:=ParamByName('work_day').asstring;
      StatusBar3.Panels[6].Text:=ParamByName('wm_work_hours').asstring;
      StatusBar3.Panels[7].Text:=ParamByName('work_hours').asstring;

      StatusBar4.Panels[4].Text:=ParamByName('wm_work_day_hol').asstring;
      StatusBar4.Panels[5].Text:=ParamByName('work_day_hol').asstring;
      StatusBar4.Panels[6].Text:=ParamByName('wm_work_hours_hol').asstring;
      StatusBar4.Panels[7].Text:=ParamByName('work_hours_hol').asstring;

      StatusBar5.Panels[4].Text:=ParamByName('wm_work_day_night').asstring;
      StatusBar5.Panels[5].Text:=ParamByName('work_day_night').asstring;
      StatusBar5.Panels[6].Text:=ParamByName('wm_work_hours_night').asstring;
      StatusBar5.Panels[7].Text:=ParamByName('work_hours_night').asstring;

      StatusBar6.Panels[4].Text:=ParamByName('wm_work_day_hol_night').asstring;
      StatusBar6.Panels[5].Text:=ParamByName('work_day_hol_night').asstring;
      StatusBar6.Panels[6].Text:=ParamByName('wm_work_hours_hol_night').asstring;
      StatusBar6.Panels[7].Text:=ParamByName('work_hours_hol_night').asstring;

      StatusBar7.Panels[4].Text:='-';
      StatusBar7.Panels[5].Text:=ParamByName('work_day_output').asstring;
      StatusBar7.Panels[6].Text:='-';
      StatusBar7.Panels[7].Text:=ParamByName('work_hours_output').asstring;
      // StatusBar1.Panels[7].Text:=ParamByName('SIGN_TEXT').asstring;
      //  StatusBar7.Panels[8].Text:=ParamByName('TYPE_WORK').asstring;
      //  StatusBar7.Panels[5].Text:=ParamByName('').asstring;
      //  StatusBar7.Panels[6].Text:=ParamByName('').asstring;
      Transaction.commit;
      //**************************************************************************
      //**************************************************************************
      //**************************************************************************
      Transaction.StartTransaction;
      StoredProcName:='TU_OFFICIAL_NOTE_BY_ID_TSH';
      Prepare;
      ParamByName('id_timesheet').AsInteger        := DM.DSetTimeSheet['id_timesheet'];
      ParamByName('num_day').AsInteger := FDay;
      ExecProc;
      Fid_official_note_trans:=ParamByName('ID_OFFICIAL_NOTE_TRANS').AsVariant;
      Fid_official_note:=ParamByName('ID_OFFICIAL_NOTE').AsVariant;
      FIdMan:=ParamByName('ID_MAN').AsVariant;
      FNote:=ParamByName('NOTE').AsVariant;
      FNum:= ParamByName('NUm').AsVariant;
      FDateDoc:= ParamByName('Date_doc').AsDate;
      if  Fid_official_note_trans <> null then
      begin
        ButtonNoteUpdate.Enabled:=true;
        ButtonNoteDelete.Enabled:=true;
        StatusBar6.Panels[1].Text:='Діє службова записка "'+ParamByName('note').AsString +'"';
      end
      else
      begin
        StatusBar6.Panels[1].Text:= '';
        ButtonNoteUpdate.Enabled:=false;
        ButtonNoteDelete.Enabled:=false;
      end;
  end;
end;

procedure TFormTimesheet_Main.GridHeaderBandedTableView1StylesGetHeaderStyle(
  Sender: TcxGridTableView; AColumn: TcxGridColumn; out AStyle: TcxStyle);
  var j,Days:integer;
begin
  if  (AColumn<>nil) and (strtointdef(AColumn.Caption, 0)>0)then
  begin
   AStyle:= StyleSimple ;
   case Month of
    1, 3, 5, 7, 8, 10, 12: Days := 31;
    4, 6, 9, 11: Days := 30;
    2: if IsLeapYear(Year) then
         Days := 29
       else
         Days := 28;
    end;
   if  strtoint(AColumn.Caption)<=Days   then
     j := DayOfWeek(EncodeDate(Year, Month,strtoint(AColumn.Caption)))
   else j:=0;
   dec(j);
   if j = 0 then j := 7;
   case j of
     6: begin  AStyle:=StyleOutPut  end;
     7: begin  AStyle:=StyleOutPut end;
     -1:begin AStyle:=StyleNotDay end;
   end;
   if dm.DsetCalendar.Locate('TBL_DAY',AColumn.Caption,[]) then
     AStyle:=StyleHoliday

  end;
  if (AColumn<>nil) and( AColumn.Caption='X')then  AStyle:= StyleSimple ;
  if Assigned(AColumn) and (AColumn.Caption=inttostr(Fday))  then AStyle:=StyleSelect1;
end;

procedure TFormTimesheet_Main.ButtonPrintClick(Sender: TObject);
begin
    
IsTshSign (self,Dm.DSetPeriodType['ID_TSH_GROUP'],FParamFilter.KodSetup);


end;

procedure TFormTimesheet_Main.GridPeriodTypeDBTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin

  FDay:=0;
IsTimesheetInfo;
end;

procedure TFormTimesheet_Main.ButtonNoteUpdateClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
    ID:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnTshE;
  Parameter.IdOfficialNoteTrans:=Fid_official_note_trans ;
  Parameter.IdOfficialNote:=Fid_official_note ;
  Parameter.Note:=FNote ;
  Parameter.Num:=FNum;
  Parameter.datedoc:=FdateDoc;
  Parameter.KodSetup:=FParamFilter.KodSetup;
  ID:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack) ;
  if ID[2]=mrYes then
  begin
    if not ButtonRedeFined.Enabled then
      TuShowMessage('Увага','Службова записка була додана, але зміни не набули чинності, так як табель має підписи', mtInformation, [mbOK])
    else
    if TuShowMessage('Увага', 'Щоб зміни вcтупили в дію, табель необхідно переформувати. Переформувати?', mtInformation, mbOKCancel) =mrOk then
     RedeFinedDogInTsh;
  end;
  Parameter.Destroy;
end;

procedure TFormTimesheet_Main.ButtonNoteInsertClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
    ID:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnFromTshI;
  Parameter.DateBeg:= DM.DSetPeriodType['DATE_BEG']+Fday-1;
  Parameter.DateEnd:= DM.DSetPeriodType['DATE_Beg']+Fday-1;
  Parameter.Rmoving:=DM.DSetTimeSheet['RMOVING'];
  Parameter.Idman:=DM.DSetTimeSheet['ID_MAN'];
  Parameter.IdPostMoving:=DM.DSetTimeSheet['ID_POST_MOVING'];
  Parameter.FIO:=Dm.DSetTimeSheet['FIO'];
  Parameter.KodSetup:=FParamFilter.KodSetup;
  Parameter.IdVihod:=FidVihod;
  Parameter.VihodName:=FVihodName;
  Parameter.iswork:=FIsWork;
  Parameter.Note:='Корегування з табеля: '+DM.DSetTimeSheet['caption_note'] ;
  ID:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack) ;

  if  ID[2]=mrYes then
  begin
    if not ButtonRedeFined.Enabled then
      TuShowMessage('Увага','Службова записка була додана, але зміни не набули чинності, так як табель має підписи', mtInformation, [mbOK])
    else
    if TuShowMessage('Увага', 'Щоб зміни вcтупили в дію, табель необхідно переформувати. Переформувати?', mtInformation, mbOKCancel) =mrOk then
     RedeFinedDogInTsh;
  end;
  Parameter.Destroy;
end;

procedure TFormTimesheet_Main.ButtonNoteDeleteClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
    ID:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnTransD;
  Parameter.IdOfficialNoteTrans:=Fid_official_note_trans ;
  ID:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack) ;
  if not  VarIsNull(ID) then
  begin
    ButtonRefreshClick(sender);
  end;
  Parameter.Destroy;
end;

procedure TFormTimesheet_Main.ButtonFilterClick(Sender: TObject);
var Form:TFormOptionCreate;
 DateLoc:Tdate  ;
 day:word  ;

begin
  Form:=TFormOptionCreate.create(FParamFilter);
  if Form.ShowModal=mrYes then
  begin

    DateLoc:=strtodate(KodSetupToPeriod(FParamFilter.KodSetup,6));
    DecodeDate(DateLoc, Year, Month,day );
    ButtonRefreshClick(sender);

   end;
end;

procedure TFormTimesheet_Main.GridThAbsDBBandedTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
ButtonNoteInsertClick(Sender);
end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1DblClick(
  Sender: TObject);
begin
if (FFormStyle=tfsWork) and Sotrud then  ButtonNoteInsertClick(Sender);
end;

procedure TFormTimesheet_Main.PageControl1Exit(Sender: TObject);
begin
ActivePageIndex:=PageControl1.ActivePageIndex
end;

procedure TFormTimesheet_Main.EditYearChange(Sender: TObject);
begin
 if EditMonth.ItemIndex >-1 then
 begin
  Year:=EditYear.IntValue;
  Month:=EditMonth.ItemIndex+1;
  FParamFilter.KodSetup:=PeriodToKodSetup(EditYear.IntValue, EditMonth.ItemIndex+1);
  ButtonRefreshClick(Sender);
 end;
end;

procedure TFormTimesheet_Main.RedeFinedDogInTsh;
var T1,T2,T:variant;
begin
  with DM.StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TU_TIMESHEET_FILL_DATES';
    Prepare;
    ParamByName('ID_TSH_GROUP').AsInteger:=DM.DSetPeriodType['ID_TSH_GROUP'] ;
    ParamByName('RMOVING_IN').AsInteger:=DM.DSetTimeSheet['RMOVING'] ;
    ParamByName('ID_POST_MOVING_IN').AsInteger:=DM.DSetTimeSheet['ID_POST_MOVING'] ;
    ExecProc;
    Transaction.commit;
  end;
  T1:=GridThDBBandedTableView1.Controller.FocusedItemIndex;
  T2:=FDay;
  T:=DM.DSetTimeSheet['ID_TIMESHEET'] ;
  DM.DSetTimeSheet.CloseOpen(true);
  Dm.DSetTimeSheet.Locate('ID_TIMESHEET', T, []);
   Fday:=T2;
  GridThDBBandedTableView1.Invalidate(true);
  Fday:=T2;
  GridThDBBandedTableView1.Controller.FocusedItemIndex:=T1;
end;

procedure TFormTimesheet_Main.ButtonUnSignedClick(Sender: TObject);
var T:variant;
begin




with Dm.StProc do
begin
  T:=dm.DSetPeriodType['ID_TSH_GROUP'];
  Transaction.StartTransaction;
  StoredProcName:='TU_TSH_GROUP_SIGN';
  Prepare;
  ParamByName('ID_TSH_GROUP').AsInteger:=T;
  ParamByName('IS_SIGN').AsString:='F';
  ParamByName('id_man').AsInteger:=AccMGMT.GetUserIdMan;
  ParamByName('comp_name').AsString:=TuGetCompName;
  ParamByName('comp_ip').AsString:=TuGetIPAddress;
  ExecProc;
  if   ParamByName('ERROR_CAPTION').AsVariant <>null then
  begin
    TuShowMessage('Увага', ParamByName('ERROR_CAPTION').asstring, mtInformation, [mbOK]);
    Exit;
  end ;
  Transaction.Commit;
  dm.DSetPeriodType.CloseOpen(true);
   dm.DsetHistory.closeopen(true);
  dm.DSetPeriodType.Locate('ID_TSH_GROUP', T, []);
  dm.DSetTimeSheet.open;
end;
end;

procedure TFormTimesheet_Main.GridPeriodTypeDBTableView2FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin

  FDay:=0;
IsTimesheetInfo;
end;

procedure TFormTimesheet_Main.TablePeriodTypeClick(Sender: TObject);
begin

if(dm.DSetPeriodType.RecordCount>0) then  ButtonNoteInsert.Visible:=ivNever;
if (dm.DSetPeriodType.RecordCount>0) then
begin
  if  dm.DSetPeriodType['SIGNED']='T' then
    ButtonSigned.Enabled:=false
  else
    ButtonSigned.Enabled:=true;
  if  dm.DSetPeriodType['ID_LEVEL'] =null then
    ButtonUnSigned.Enabled:=false
  else
    ButtonUnSigned.Enabled:=true;
  ButtonRedeFined.Enabled:=true;
  ButtonDelete.Enabled:=true;
  ButtonPrint.Enabled:=true
end
else
begin
  ButtonSigned.Enabled:=false;
  ButtonRedeFined.Enabled:=false;
  ButtonDelete.Enabled:=false;
  if (dm.DSetPeriodType.RecordCount>0) then
    ButtonPrint.Enabled:=true ;
  ButtonPrint.Enabled:=false;
end;
if (FFormStyle=tfsPast) then
begin
  ButtonSigned.Visible:=ivNever;
  ButtonRedeFined.Visible:=ivNever;
  ButtonNoteInsert.Visible:=ivNever;
  ButtonNoteUpdate.Visible:=ivNever;
end
else
begin
  ButtonSigned.Visible:=ivAlways;
  ButtonRedeFined.Visible:=ivAlways;
  ButtonNoteUpdate.Visible:=ivAlways;
  ButtonNoteInsert.Visible:=ivAlways;
end


end;

procedure TFormTimesheet_Main.ButtonTestDataClick(Sender: TObject);
  var IsRefresh:Boolean;
begin


  with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_IS_FORM';
      Prepare;
      ParamByName('ID').AsInteger:=Dm.DSetTempletOrPeriod['ID'];
      ParamByName('ID_POST_MOVING_IN').Asvariant:=Dm.DSetTempletOrPeriod['ID_POST_MOVING'];
      ParamByName('DATE_BEG_IN').asdate:=Dm.DSetPeriodType['DATE_BEG'];
      ParamByName('DATE_END_IN').asdate:=Dm.DSetPeriodType['DATE_END'];
      ParamByName('is_test').AsString:='T';
      ParamByName('id_man_in').AsInteger:=AccMGMT.GetUserIdMan;
      ParamByName('comp_name').AsString:=TuGetCompName;
      ParamByName('comp_ip').AsString:=TuGetIPAddress;
      ExecProc;
      if ParamByName('test_caption').asString<>'' then
        TuShowMessage('Увага',ParamByName('test_caption').asString, mtInformation, [mbOK]);
      Transaction.commit;
      ButtonRefreshClick(Sender)


    end;

end;

end.
