unit SotrListViewUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  SotrListConsts, dxBar, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, dxBarExtItems,IBase,
  ExtCtrls, StdCtrls, DBCtrls, FIBQuery, pFIBQuery,SotrListFilterFormUnit,
  cxTL, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, FIBDatabase,
  pFIBDatabase,PackageLoad, ComCtrls, cxSplitter, cxGridBandedTableView,
  cxGridDBBandedTableView,uAvgEdit,ZWait, zSvodTypesUnit, zSvodLoaderUnit;

function View_SotrList(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;
exports View_SotrList;

type
  TSotrListViewForm = class(TForm)
    SotrListDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    DockControl: TdxBarDockControl;
    ManMovingDataSource: TDataSource;
    DetailsDataSet: TpFIBDataSet;
    ManBonusDataSet: TpFIBDataSet;
    ManBonusDataSource: TDataSource;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    BarEditLocate: TdxBarEdit;
    LocateNextBtn: TdxBarButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    UpdateAllBtn: TdxBarLargeButton;
    SpravBtn: TdxBarLargeButton;
    ManHospitalDataset: TpFIBDataSet;
    ManHospitalDataSource: TDataSource;
    ManHolidayDataSource: TDataSource;
    ManHolidayDataSet: TpFIBDataSet;
    Panel: TPanel;
    MovingPanel: TPanel;
    ManMovingGridHeader: TLabel;
    SotrDetailsGrid: TcxGrid;
    SotrDetailsGridDBTableView: TcxGridDBTableView;
    PeriodBegColumn: TcxGridDBColumn;
    PeriodEndColumn: TcxGridDBColumn;
    PostNameColumn: TcxGridDBColumn;
    PaymentColumn: TcxGridDBColumn;
    RMovingColumn: TcxGridDBColumn;
    SotrDetailsGridLevel: TcxGridLevel;
    MovDetailsPanel: TPanel;
    DepartmentLabel: TLabel;
    NumOrderLabel: TLabel;
    DepartmentText: TDBText;
    NumOrderText: TDBText;
    GetBegEndQuery: TpFIBQuery;
    FilterButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    ShowFilterBtn: TdxBarLargeButton;
    MainDataBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    SotrMainPageControl: TPageControl;
    ManBonusPage: TTabSheet;
    ManBonusGridHeader: TLabel;
    ManBonusGrid: TcxGrid;
    ManBonusGridDBTableView: TcxGridDBTableView;
    BonusNameColumn: TcxGridDBColumn;
    MoneyColumn: TcxGridDBColumn;
    BonusBegColumn: TcxGridDBColumn;
    BonusEndColumn: TcxGridDBColumn;
    OrderNumColumn: TcxGridDBColumn;
    ManBonusGridLevel: TcxGridLevel;
    ManHospitalPage: TTabSheet;
    ManHospitalGrid: TcxGrid;
    ManHospitalGridDBTableView: TcxGridDBTableView;
    DateBegColumn: TcxGridDBColumn;
    DateEndColumn: TcxGridDBColumn;
    SeriaColumn: TcxGridDBColumn;
    NumColumn: TcxGridDBColumn;
    PercentColumn: TcxGridDBColumn;
    ManHospitalGridLevel1: TcxGridLevel;
    ManHolidayPage: TTabSheet;
    ManHolidayGrid: TcxGrid;
    ManHolidayGridDBTableView1: TcxGridDBTableView;
    HolidayNameColumn: TcxGridDBColumn;
    HolDateBegColumn: TcxGridDBColumn;
    HolDateEndColumn: TcxGridDBColumn;
    HolPeriodBegColumn: TcxGridDBColumn;
    HolPeriodEndColumn: TcxGridDBColumn;
    ManHolidayGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
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
    ManHospToolBar: TPanel;
    ManHolidayToolBar: TPanel;
    ShowHospAvgBtn: TButton;
    ShowHolAvgBtn: TButton;
    KlassOrRarzText: TDBText;
    Label1: TLabel;
    KodVidoplColumn: TcxGridDBColumn;
    HolidayOrderNumColumn: TcxGridDBColumn;
    SovmestColumn: TcxGridDBColumn;
    GetCurPeriod: TpFIBQuery;
    GetMonthBoundsQuery: TpFIBQuery;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    SotrDetailsGridBandedTV: TcxGridDBBandedTableView;
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
    PeriodBegBandColumn: TcxGridDBBandedColumn;
    PeriodEndBandColumn: TcxGridDBBandedColumn;
    PostNameBandColumn: TcxGridDBBandedColumn;
    FullOkladBandColumn: TcxGridDBBandedColumn;
    StavkaBandColumn: TcxGridDBBandedColumn;
    BaseOkladBandColumn: TcxGridDBBandedColumn;
    PPSOkladBandColumn: TcxGridDBBandedColumn;
    SmetaBandColumn: TcxGridDBBandedColumn;
    PPSSmetaBandColumn: TcxGridDBBandedColumn;
    NameSovmestBandColumn: TcxGridDBBandedColumn;
    GetSystemQuery: TpFIBQuery;
    PPSStyle: TcxStyle;
    SotrGridPanel: TPanel;
    SotrDetailsPanel: TPanel;
    SotrListGrid: TcxGrid;
    SotrListTableView: TcxGridDBTableView;
    TNColumn: TcxGridDBColumn;
    FamiliaColumn: TcxGridDBColumn;
    ImyaColumn: TcxGridDBColumn;
    OtchestvoColumn: TcxGridDBColumn;
    SotrListGridLevel1: TcxGridLevel;
    TinLabel: TLabel;
    TinDBtext: TDBText;
    Label2: TLabel;
    BirthDateText: TDBText;
    AvgEditBtn: TButton;
    GetHandsAvgQuery: TpFIBDataSet;
    GetHandsAvgQueryAVG_SUM: TFIBBCDField;
    UpdateAvgQuery: TpFIBQuery;
    WriteTransaction: TpFIBTransaction;
    CardBtn: TdxBarLargeButton;
    ManBonusUniverTV: TcxGridDBBandedTableView;
    UniverVOKodColumn: TcxGridDBBandedColumn;
    UniverVONameColumn: TcxGridDBBandedColumn;
    UniverDateBegColumn: TcxGridDBBandedColumn;
    UniverDateEndColumn: TcxGridDBBandedColumn;
    UniverMainSummColumn: TcxGridDBBandedColumn;
    UniverPPSSummColumn: TcxGridDBBandedColumn;
    UniverMainSmetaColumn: TcxGridDBBandedColumn;
    UniverPPSSmetaColumn: TcxGridDBBandedColumn;
    UniverOrderNum: TcxGridDBBandedColumn;
    UniverPercentColumn: TcxGridDBBandedColumn;
    Label3: TLabel;
    SearchEdit: TEdit;
    Label4: TLabel;
    NameSovmestText: TDBText;
    ReestrNumColumn: TcxGridDBColumn;
    PrintAvgHolBtn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailsBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ManHospitalPageShow(Sender: TObject);
    procedure ManHolidayPageShow(Sender: TObject);
    procedure RMovingColumnGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure ShowFilterBtnClick(Sender: TObject);
    procedure ShowHolAvgBtnClick(Sender: TObject);
    procedure ShowHospAvgBtnClick(Sender: TObject);
    procedure DetailsDataSetAfterOpen(DataSet: TDataSet);
    procedure ManBonusDataSetAfterOpen(DataSet: TDataSet);
    procedure ManHospitalDatasetAfterOpen(DataSet: TDataSet);
    procedure ManHolidayDataSetAfterOpen(DataSet: TDataSet);
    procedure SotrListDataSetAfterScroll(DataSet: TDataSet);
    procedure PPSOkladBandColumnGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure PPSSmetaBandColumnGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure SotrListDataSetAfterOpen(DataSet: TDataSet);
    procedure AvgEditBtnClick(Sender: TObject);
    procedure CardBtnClick(Sender: TObject);
    procedure UniverPPSSummColumnGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure UniverPPSSmetaColumnGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure UniverPercentColumnGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DetailsDataSetEndScroll(DataSet: TDataSet);
    procedure SotrListTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditChange(Sender: TObject);
    procedure SotrDetailsGridBandedTVKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure PrintAvgHolBtnClick(Sender: TObject);
  
  private
    IsUniver:Boolean;
    FilterStr:String;
    procedure RefreshDetailsDataSet();
    procedure RefreshBonusDataSet();
  public
    Constructor Create(AOwner:TComponent;DB:TISC_DB_HANDLE);reintroduce;
    procedure   ShowFilterForm;
    procedure   PrepareQueries(Familia:String;Tn:Integer;
                        Ink:string;IdDep:Integer);
  end;

var ViewForm:TSotrListViewForm;

implementation
{$R *.dfm}

procedure TSotrListViewForm.RefreshBonusDataSet;
begin
    if IsUniver then
    begin
        ManBonusDataSet.ParamByName('ID_MAN_MOVING').Value:=
            DetailsDataSet['ID_MAN_MOVING'];
        ManBonusDataSet.ParamByName('DATE_BEG').Value:=
            DetailsDataSet['DATE_BEG'];
        ManBonusDataSet.ParamByName('REAL_END').Value:=
            DetailsDataSet['REAL_END'];
        ManBonusDataSet.CloseOpen(True);
    end;

end;


procedure TSotrListViewForm.RefreshDetailsDataSet;
begin

  if (IsUniver) then
  begin
    DetailsDataSet.ParamByName('ID_PCARD').Value:=SotrListDataSet['ID_PCARD'];
    DetailsDataSet.CloseOpen(True);
  end;

end;

function View_SotrList(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;

begin
ViewForm := TSotrListViewForm.Create(AOwner,DB);
ViewForm.Show;
View_SotrList:=null;
end;

procedure TSotrListViewForm.PrepareQueries(Familia:String;Tn:Integer;Ink:string;IdDep:Integer);
var
T_NUM,Department:String;
WaitForm:TForm;

begin
    if Familia='' then Familia:='null'
    else Familia:=''''+Familia+'''';

    if Ink='' then Ink:='null'
    else Ink:=''''+Ink+'''';

    if Tn=-1 then T_NUM:='null'
    else T_NUM:=IntToStr(Tn);

    if IdDep=-1 then Department:='null'
    else Department:=IntToStr(IdDep);

    SotrListDataSet.Close;
    SotrListDataSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_SOTR_LIST( '+
            T_NUM +','+ Familia+','+ Ink +', NULL, NULL, '+ Department+
            ',null,null,null,null,null,null,null,null,null,null) ORDER BY OUT_TN';
                                    
    WaitForm:=ShowWaitForm(Self);

    SotrListDataSet.CloseOpen(True);
    SotrListDataSet.First;

    CloseWaitForm(WaitForm);

//TnColumn.SortOrder:=soAscending;
end;

procedure TSotrListViewForm.ShowFilterForm;
var
form:   TSotrListFilterForm;
begin

form:=TSotrListFilterForm.Create(Self, MainDataBase.Handle);
    if form.ShowModal=mrOk then
            PrepareQueries(form.Fam,form.Tn,form.Ink,form.Id_Department)
                else
                   begin

                     if Self.SotrListDataSet.IsEmpty
                     then
                        Self.Close
                     else
                        Exit;

                   end;



end;

constructor TSotrListViewForm.Create(AOwner:TComponent;DB:TISC_DB_HANDLE);
var
    Year,Month:Integer;
    PerDateBeg:TDate;
begin
inherited Create(AOwner);

Self.Caption:=Form_SotrList_Caption;
Self.RefreshBtn.Caption:='Відновити'; //RefreshBtn_Caption;
Self.ShowFilterBtn.Caption:=FilterButtonCaption;

TnColumn.DataBinding.FieldName:='OUT_TN';
FamiliaColumn.DataBinding.FieldName:='OUT_FAMILIA';
ImyaColumn.DataBinding.FieldName:='IMYA';
OtchestvoColumn.DataBinding.FieldName:='OTCHESTVO';
TnColumn.Caption:=TnColumnCaption;
FamiliaColumn.Caption:=FamiliaColumnCaption;
ImyaColumn.Caption:=ImyaColumnCaption;
OtchestvoColumn.Caption:=OtchestvoColumnCaption;

Self.ManMovingGridHeader.Caption:=ManMovingGridHeaderCaption;
Self.ManBonusGridHeader.Caption:=ManBonusGridHeaderCaption;

Self.DepartmentLabel.Caption:=DepartmentLabelCaption;
Self.NumOrderLabel.Caption:=OrderNumCaption;
Self.ManBonusPage.Caption:=ManBonusPageCaption;


BonusNameColumn.Caption:=BonusNameCaption;
MoneyColumn.Caption:=BonusPaymentCaption;
BonusBegColumn.Caption:=BonusBegCaption;
BonusEndColumn.Caption:=BonusEndCAption;
OrderNumColumn.Caption:=BonusOrderNumCaption;

    //Для основоного грида с перемещениями
    RMovingColumn.DataBinding.FieldName:='RMoving';

    PeriodBegColumn.DataBinding.FieldName:='Date_Beg';
    PeriodEndColumn.DataBinding.FieldName:='REAL_END';
    PostNameColumn.DataBinding.FieldName:='VPOST';
    PAymentColumn.DataBinding.FieldName:='PAYMENT';
    SovmestColumn.DataBinding.FieldName:='NAME_SOVMEST';

    PeriodBegColumn.Caption:=PeriodBegColumnCaption;
    PeriodEndColumn.Caption:=PeriodEndColumnCaption;
    PostNameColumn.Caption:=PostColumnCaption;
    PaymentColumn.Caption:=PaymentColumnCaption;

    DepartmentText.DataField:='DEP_NAME';
    NumOrderText.DataField:='NUM_ORDER';
    KlassOrRarzText.DataField:='RAZR_OR_KLASS';
    NameSovmestText.DataField:='NAME_SOVMEST';
    //Для BandedView
    PeriodBegBandColumn.DataBinding.FieldName:='DATE_BEG';
    PeriodEndBandColumn.DataBinding.FieldName:='REAL_END';
    PostNameBandColumn.DataBinding.FieldName:='VPOST';
    FullOkladBandColumn.DataBinding.FieldName:='PAYMENT';
    StavkaBandColumn.DataBinding.FieldName:='KOL_STAVOK';
    BaseOkladBandColumn.DataBinding.FieldName:='OKLAD_BASE';
    PPSOkladBandColumn.DataBinding.FieldName:='OKLAD_PPS';
    SmetaBandColumn.DataBinding.FieldName:='KOD_SM';
    PPSSmetaBandColumn.DataBinding.FieldName:='KOD_SM_PPS';
    NameSovmestBandColumn.DataBinding.FieldName:='NAME_SOVMEST';

    GetBEgEndQuery.Transaction:=ReadTransaction;

    //Для грида с надбавками
    BonusNameColumn.DataBinding.FieldName:='NAME_BONUS';
    MoneyColumn.DataBinding.FieldName:='BONUS_MONEY';
    BonusBegColumn.DataBinding.FieldName:='BONUS_BEG';
    BonusEndColumn.DataBinding.FieldName:='BONUS_END';
    OrderNumColumn.DataBinding.FieldName:='NUM_ORDER';
    KodVidoplColumn.DataBinding.FieldName:='KOD_VIDOPL';

    // Для грида с надбавками(отображение разбивки по сметам)

    UniverVOKodColumn.DataBinding.FieldName:='KOD_VIDOPL';
    UniverVONameColumn.DataBinding.FieldName:='NAME_BONUS';
    UniverDateBegColumn.DataBinding.FieldName:='BONUS_BEG';
    UniverDateEndColumn.DataBinding.FieldName:='BONUS_END';
    UniverMainSummColumn.DataBinding.FieldName:='SUMMA';
    UniverPPSSummColumn.DataBinding.FieldName:='SUMMA_PPS';
    UniverMainSmetaColumn.DataBinding.FieldName:='KOD_SM';
    UniverPPSSmetaColumn.DataBinding.FieldName:='KOD_SM_PPS';
    UniverOrderNum.DataBinding.FieldName:='NUM_ORDER';
    UniverPercentColumn.DataBinding.FieldName:='PERCENT';

    //Для грида с больничными
    ManHospitalPage.Caption:=ManHospitalPageCaption;
    DateBegColumn.Caption:=HospDateBegCaption;
    DateEndColumn.Caption:=HospDateEndCaption;
    SeriaColumn.Caption:=HospSeriaCaption;
    NumColumn.Caption:=HospNumCaption;
    PercentColumn.Caption:=HospPercentCaption;
    ManHospitalDataSet.Transaction:=ReadTransaction;
    DateBegColumn.DataBinding.FieldName:='DATE_BEG';
    DateEndColumn.DataBinding.FieldName:='DATE_END';
    SeriaColumn.DataBinding.FieldName:='SERIA';
    NumColumn.DataBinding.FieldName:='NOMER';
    PercentColumn.DataBinding.FieldName:='PERCENT';
    ReestrNumColumn.DataBinding.FieldName:='NUM_REESTR';
    SotrMainPageControl.ActivePage:=ManBonusPage;


    //Для грида с отпусками
    ManHolidayPage.Caption:=ManHolidayPageCaption;

    ManHolidayDataSet.Transaction:=ReadTransaction;
    HolidayNameColumn.DataBinding.FieldName:='NAME_HOLIDAY';
    HolPeriodBegColumn.DataBinding.FieldNAme:='PERIOD_BEG';
    HolPeriodEndColumn.DataBinding.FieldNAme:='PERIOD_END';
    HolDateBegColumn.DataBinding.FieldName:='Date_Beg';
    HolDateEndColumn.DataBinding.FieldName:='Date_End';
    HolidayNameColumn.Caption:=ManHolNameCaption;
    HolPeriodBegColumn.Caption:=ManHolPeriodBegCaption;
    HolPeriodEndColumn.Caption:=ManHolPeriodEndCaption;
    HolDateBegColumn.Caption:=ManHolDateBegCaption;
    HolDateEndColumn.Caption:=ManHolDateEndCaption;
    HolidayOrderNumColumn.DataBinding.FieldName:='NUM_ORDER';

    //Для кнопок
    ShowHospAvgBtn.Caption:=ShowAvgBtnCaption;
    ShowHolAvgBtn.Caption:= ShowAvgBtnCaption;


MainDataBase.Handle := DB;
Self.ManBonusDataSet.Transaction:=ReadTransaction;
Self.ManBonusDataSet.SQLs.SelectSQL.Text:=
            'SELECT * FROM Z_GET_MAN_BONUS(?Id_Man_Moving,?Date_Beg,?Real_End) ORDER BY BONUS_BEG';

Self.DetailsDataSet.Transaction:=ReadTransaction;
Self.DetailsDataSet.SQLs.SelectSQL.Text:=
            'SELECT * FROM Z_GET_ALL_MOVINGS(?ID_PCARD) ORDER BY DATE_BEG';


SotrListDataSet.Transaction:=ReadTransaction;

GetCurPeriod.ExecQuery;
Year:=GetCurPeriod['YEAR_SET'].Value;
Month:=GetCurPeriod['MONTH_SET'].Value;
GetCurPeriod.Close;

GetMonthBoundsQuery.ParamByName('YEAR').Value:=Year;
GetMonthBoundsQuery.ParamByName('MONTH').Value:=Month;
GetMonthBoundsQuery.ExecQuery;
PerDateBeg:=GetMonthBoundsQuery['MONTH_BEG'].Value;
GetMonthBoundsQuery.Close;

GetSystemQuery.ExecQuery;

if (GetSystemQuery['IS_UNIVER'].AsString='T') then
    IsUniver:=True
else
    IsUniver:=False;

if (not IsUniver) then
    begin
        DetailsDataSet.DataSource:=DataSource;
        ManBonusDataSet.DataSource:=ManMovingDataSource;
    end;



if (IsUniver) then
    begin
        SotrDetailsGridLevel.GridView:=SotrDetailsGridBandedTV;
        ManBonusGridLevel.GridView:=ManBonusUniverTV;
    end
else
    begin
        SotrDetailsGridLevel.GridView:=SotrDetailsGridDBTableView;
        ManBonusGridLevel.GridView:=ManBonusGridDBTableView;
    end;



if (IsUniver) then
    begin
    SotrDetailsGridBandedTV.DataController.Filter.Root.
        AddItem(PeriodEndBandColumn,foGreaterEqual,PerDateBeg,DateToStr(PerDateBeg));

    SotrDetailsGridBandedTV.DataController.Filter.Active:=True;
   // SotrDetailsGridBandedTV.ApplyBestFit();
    end;

SotrDetailsGridDBTableView.ApplyBestFit();
TinDbText.DataField:='OUT_TIN';
BirthDateText.DataField:='OUT_BIRTH_DATE';


ShowFilterForm;

end;

procedure TSotrListViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if (ReadTransaction.InTransaction)
 then
        ReadTransaction.Commit;

        Action:=caFree;
end;

procedure TSotrListViewForm.DetailsBtnClick(Sender: TObject);
//var
//form: TSotrDetailsForm;
begin
//    form:=TSotrDetailsForm.Create(Self,SotrListDataSet['ID_PCARD']);
//    form.ShowModal;
end;

procedure TSotrListViewForm.SelectBtnClick(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure TSotrListViewForm.FormShow(Sender: TObject);
begin
    if FormStyle<>fsNormal then
        SelectBtn.Visible:=ivNever;
end;

procedure TSotrListViewForm.ManHospitalPageShow(Sender: TObject);
begin
   ManHospitalDataSEt.CloseOpen(False);

end;

procedure TSotrListViewForm.ManHolidayPageShow(Sender: TObject);
begin
    ManHolidayDataSet.CloseOpen(False);
end;

procedure TSotrListViewForm.RMovingColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin


    begin
     GetBegEndQuery.Params.ParamByName('RMOVING').Value:=StrToInt(AText);
     GetBegEndQuery.ExecQuery;
     AText:='З '+GetBegEndQuery['DATE_BEG'].AsString+' По '+
        GetBegEndQuery['DATE_END'].AsString;
    end;

end;

procedure TSotrListViewForm.ShowFilterBtnClick(Sender: TObject);
begin
    ShowFilterForm;
end;



procedure TSotrListViewForm.ShowHolAvgBtnClick(Sender: TObject);

var
Res:Variant;
begin
 if (not ManHolidayDataSet.IsEmpty) then
   Res:=PackageLoad.LoadShowHolAvg(Self,
            MainDataBase.Handle,DetailsDataSet['RMOVING'],
            ManHolidayDataSet['HOLIDAY_BEG'],12,
            ManHolidayDataSet['ID_VIDOPL'],
            ManHolidayDataSet['ID_MAN_HOLIDAY']);


end;

procedure TSotrListViewForm.ShowHospAvgBtnClick(Sender: TObject);
begin
if (not ManHospitalDataSet.IsEmpty) then
    PackageLoad.LoadHospAvg(self,MainDataBase.Handle,ManHospitalDataSet['ID_MAN_HOSP']);
end;

procedure TSotrListViewForm.DetailsDataSetAfterOpen(DataSet: TDataSet);
begin
  DetailsDataSet.Last;
end;

procedure TSotrListViewForm.ManBonusDataSetAfterOpen(DataSet: TDataSet);
begin
  ManBonusDataSet.Last;
end;

procedure TSotrListViewForm.ManHospitalDatasetAfterOpen(DataSet: TDataSet);
begin
  ManHospitalDataSet.Last;
end;

procedure TSotrListViewForm.ManHolidayDataSetAfterOpen(DataSet: TDataSet);
begin
  ManHolidayDataSet.Last;
end;

procedure TSotrListViewForm.SotrListDataSetAfterScroll(DataSet: TDataSet);
begin

   if (ViewForm=nil) then Exit;
   if (not ViewForm.Visible) then Exit;

   RefreshDetailsDataSet;

   SotrDetailsGridBandedTV.ViewData.Expand(True);
end;

procedure TSotrListViewForm.PPSOkladBandColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if (DetailsDataSet['OKLAD_PPS']=0.00)
    then
        AText:='---';
end;

procedure TSotrListViewForm.PPSSmetaBandColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if (DetailsDataSet['KOD_SM_PPS']=0)
    then
        AText:='---';
end;

procedure TSotrListViewForm.SotrListDataSetAfterOpen(DataSet: TDataSet);
begin
    RefreshDetailsDataSet;
end;

procedure TSotrListViewForm.AvgEditBtnClick(Sender: TObject);
var
   form:TAvgEditForm;
begin
     form:=TAvgEditForm.Create(Self);
     GetHandsAvgQuery.ParamByName('ID_MAN_HOLIDAY').Value:=
         ManHolidayDataSet['ID_MAN_HOLIDAY'];
     GetHandsAvgQuery.Open;
     if (not VarIsNull(GetHandsAvgQuery['AVG_SUM'])) then
              form.EditAvgSumma.Text:=GetHandsAvgQuery['AVG_SUM'];

     if form.ShowModal=mrOk then
        begin
             WriteTransaction.StartTransaction;
             UpdateAvgQuery.ParamByName('ID_MAN_HOLIDAY').Value:=
                ManHolidayDataSet['ID_MAN_HOLIDAY'];
             UpdateAvgQuery.ParamByName('AVG_SUM').Value:=
                            StrToFloat(form.EditAvgSumma.Text);

             try
                UpdateAvgQuery.ExecQuery;
                WriteTransaction.Commit;
             except on E:Exception
             do
               begin
                    ShowMessage(E.Message);
                    WriteTransaction.Rollback;
               end;
             end;

        end;
     GetHandsAvgQuery.Close;
end;

procedure TSotrListViewForm.CardBtnClick(Sender: TObject);
begin
     PackageLoad.LoadTnAccess(Self,MainDatabase.Handle,SotrListDataSet['ID_MAN']);
end;

procedure TSotrListViewForm.UniverPPSSummColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin

    if ManBonusDataSet['SUMMA_PPS']=0.00 then
        AText:='---';


end;

procedure TSotrListViewForm.UniverPPSSmetaColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin

    if ManBonusDataSet['KOD_SM_PPS']=0 then
        AText:='---';

end;

procedure TSotrListViewForm.UniverPercentColumnGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin

  {  if ManBonusDataSet['PERCENT']=0.00 then
        AText:='---';}

end;

procedure TSotrListViewForm.DetailsDataSetEndScroll(DataSet: TDataSet);
begin

   if (ViewForm=nil) then Exit;
   if (not ViewForm.Visible) then Exit;

   RefreshBonusDataSet;

end;

procedure TSotrListViewForm.SotrListTableViewKeyPress(Sender: TObject;
  var Key: Char);

begin
       if (Ord(Key)=8) then
            SearchEdit.Text:=''
       else
            begin

                FilterStr:=' UPPER(OUT_FAMILIA) LIKE '+''''
                                                   +AnsiUpperCase(SearchEdit.Text)
                                                   +'%'+'''';

                SearchEdit.Text:=SearchEdit.Text+Key;
                if (Pos(Key,'0123456789')<>0) then
                    SearchEdit.Text:=''

            end

end;

procedure TSotrListViewForm.SearchEditChange(Sender: TObject);
begin
    FilterStr:=' UPPER(OUT_FAMILIA) LIKE '+''''
                                                +AnsiUpperCase(SearchEdit.Text)
                                                  +'%'+'''';

    if (SearchEdit.Text='') then
        SotrListDataSet.Filtered:=False
    else
        begin
            if (FilterStr='NO SEARCH') then
                SotrListDataSet.Filtered:=False
            else
                begin
                    SotrListDataSet.Filter:=FilterStr;
                    SotrListDataSet.Filtered:=True;
                end;

        end;


end;

procedure TSotrListViewForm.SotrDetailsGridBandedTVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key=vk_end) then
    begin
        ShowMessage('ID_MOVING='+IntToStr(DetailsDataSet['ID_MAN_MOVING'])+
                    'RMOVING='+IntToStr(DetailsDataSet['RMOVING']));
    end;

end;

procedure TSotrListViewForm.PrintAvgHolBtnClick(Sender: TObject);
var Param:TAvgHolParam;
begin
 Param.DB_Handle := MainDataBase.Handle;
 Param.Owner := self;
 Param.Id := ManHolidayDataSet['ID_MAN_HOLIDAY'];
 PrintAvgHol(Param);
end;

end.


