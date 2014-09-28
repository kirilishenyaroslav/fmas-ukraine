unit Favour_Spr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox,
  cxGridTableView, cxTL, dxBarExtItems, dxBar, FIBQuery, pFIBQuery,
  pFIBStoredProc, Menus, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ImgList, dxStatusBar, StdCtrls, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,IBAse,globalspr, LoadDogManedger,dogLoaderUnit,
  Mask, ToolEdit,CurrEdit,uCommonSp, cxRadioGroup,AArray,LoaderUnit,
  cxCurrencyEdit, cxButtonEdit, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxCalendar,DateUtils, Add_Favour, SprTypeFav,DBCtrls, Buttons,Sum_Add,
  PriceAdd,Math,ArndInflForm,Sum_infl;

type
  TfrmFavour = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BottomPanel: TPanel;
    ImageList1: TImageList;
    ActionList: TActionList;
    add: TAction;
    red: TAction;
    del: TAction;
    up: TAction;
    cl: TAction;
    prosmotr: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_pr: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_get: TdxBarLargeButton;
    dxBarLargeButton_get_group_doc: TdxBarLargeButton;
    dxBarLargeButton_close: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    pFIBTransaction_lock: TpFIBTransaction;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;

    pFIBDatabase: TpFIBDatabase;
    pFIBDataSet_spr: TpFIBDataSet;
    DataSource: TDataSource;
    DataSetPrices: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    CodeColumn: TcxGridDBColumn;
    NameColumn: TcxGridDBColumn;
    DateBegColumn: TcxGridDBColumn;
    DateEndColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Panel1: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    dxStatusBar2: TdxStatusBar;
    DateBeg: TcxDateEdit;
    Label1: TLabel;
    DateEnd: TcxDateEdit;
    Label3: TLabel;
    StProc: TpFIBStoredProc;
    DelProc: TpFIBStoredProc;
    IF_F_Transfer: TDBText;
    ExName: TDBText;
    BitBtn1: TBitBtn;
    SummColumn: TcxGridDBColumn;
    TypeFavColumn: TcxGridDBColumn;
    NeedCountColumn: TcxGridDBColumn;
    EdizmColumn: TcxGridDBColumn;
    DataSource1: TDataSource;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DATE_BEG: TcxGridDBColumn;
    cxGridDBTableView1DATE_END: TcxGridDBColumn;
    cxGridDBTableView1ONE_PRICE: TcxGridDBColumn;
    cxGridDBTableView1SN: TcxGridDBColumn;
    cxGridDBTableView1RN: TcxGridDBColumn;
    cxGridDBTableView1STN: TcxGridDBColumn;
    cxGridDBTableView1KEKVN: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label15: TLabel;
    S_Label: TLabel;
    St_Label: TLabel;
    KEKV_Label: TLabel;
    Sn: TLabel;
    Rn: TLabel;
    Stn: TLabel;
    Kn: TLabel;
    dxBarButton3: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    R_Label: TLabel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    SelProc: TpFIBStoredProc;
    Label4: TLabel;
    DateTar: TcxDateEdit;
    RProc: TpFIBStoredProc;
    dxBarButton7: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    IF_PRICE: TDBText;
    ID_S_C: TDBText;
    Panel2: TPanel;
    Label5: TLabel;
    ID_K_C: TDBText;
    DBText2: TDBText;
    ID_ST_C: TDBText;
    ID_R_C: TDBText;
    Edit2: TEdit;
    dxStatusBar1: TdxStatusBar;
    BitBtn2: TBitBtn;
    ID_S_P: TDBText;
    ID_R_P: TDBText;
    ID_ST_P: TDBText;
    ID_KEKV_P: TDBText;
    StProcInfl: TpFIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton_closeClick(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_prClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure dxBarLargeButton_get_group_docClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cxGrid1DBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure DateEndKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);

  private
    PDateBeg : string;  // Переменные на отправку в фильр данных
    PDateEnd : string;
  public
    // Переменные для трансфера данных из справочника

    id_S     : Integer;
    id_R     : Integer;
    id_St    : Integer;
    id_Kekv  : Integer;
    S_Name   : string;
    R_Name   : string;
    St_Name  : string;
    kekv_name: string;
    fav_name : string;
    S        : Integer;
    R        : Integer;
    St       : Integer;
    kekv     : Integer;
    Summ     : Double;
  is_count_f : string;
    id_fav   : integer;
    edizme   : string;
    PeriodBeg:TDateTime;
    PeriodEnd:TDateTime;
    pr_viz   :String;

    a_in   : DogLoaderUnit.TSpravParams;
    a_out  : DogLoaderUnit.PSpravParams;
    id_document : Int64;
     lastPeriodN:Integer;
     lastPeriodSumm:Variant;
     lastPeriodIdFav:Variant;
    procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
    procedure  UpdateFavList();
    constructor Create(AOwner:TComponent; DBHandle : TISC_DB_HANDLE; frmStyle: TFormStyle;Pr_vizova: String); overload;

  end;

 procedure Load(Owner : TComponent; input : DogLoaderUnit.PSpravParams; output : DogLoaderUnit.PSpravParams); stdcall;
 exports Load;

var
 frmFavour: TfrmFavour;
implementation

uses IB_EXTERNALS,FavCountAdd, Counters;

{$R *.dfm}
procedure Load(Owner : TComponent; input : DogLoaderUnit.PSpravParams; output : DogLoaderUnit.PSpravParams); stdcall;
var
  a_in_l   : DogLoaderUnit.TSpravParams;
  a_out_l  : DogLoaderUnit.PSpravParams;
  DBHandle: TISC_DB_HANDLE;
  frmStyle: TFormStyle;
  Pr_vizova: String;
begin
 a_in_l:=input^;
 a_out_l:=output;

 DBHandle:=PVoid(integer(a_in_l['DataBase']));
 frmStyle:=a_in_l['FormStyle'];
 Pr_vizova:=a_in_l['PriznVizova'];
 frmFavour:= TfrmFavour.Create(Owner,DBHandle,frmStyle,Pr_vizova);
 if (not (a_in_l['lastPeriodN']= null)) then begin
        frmFavour.lastPeriodN:=a_in_l['lastPeriodN'];
        frmFavour.lastPeriodSumm:=a_in_l['lastPeriodsumm'];
        frmFavour.lastPeriodidFav:=a_in_l['lastPeriodidFav'];
 end;

 frmFavour.PeriodBeg:=a_in_l['PeriodBeg'];
 frmFavour.PeriodEnd:=a_in_l['PeriodEnd'];
 frmFavour.id_document:=a_in_l['id_dog'];


 frmFavour.a_in:=input^;
 frmFavour.a_out:=output;
 frmFavour.pr_viz:=Pr_vizova;

 frmFavour.WindowState:=wsMaximized;

 if Pr_vizova = 'Edit' then
 begin
  frmFavour.dxBarLargeButton_get_group_docClick(Owner);
 end
 else
 begin
  if frmFavour.FormStyle = fsNormal then
  begin
    frmFavour.ShowModal;
    frmFavour.Free;
  end
  else
  begin
    frmFavour.Show;
    frmFavour.Repaint;
  end;
 end;
end;
// -----------------------------------------------------------------------------
// Конструктор класса
constructor TfrmFavour.Create(AOwner: TComponent;DBHandle: TISC_DB_HANDLE; frmStyle: TFormStyle;Pr_vizova: String);
begin
 inherited Create (Aowner);
 InitConnection(DBHandle); // Инициализируем связь с БД
 // Инициализация базовых параметров формы.
 FormStyle  := frmStyle;
 Caption := 'Справочник Услуг Аренды (тестовый)';
// -- Необходимо обдумать необходимость данного признака
// self.WindowState:=wsMaximized;
 if Pr_vizova = 'SpView' then
 begin
  dxBarLargeButton_get_group_doc.Enabled:=false;
 end;
end;
// -----------------------------------------------------------------------------
// Инициализация соединения с БД
procedure TfrmFavour.InitConnection(DBhandle : TISC_DB_HANDLE);
begin
 pFIBDatabase.Handle:= DBhandle;
 pFIBTransactionRead.StartTransaction;
 pFIBDataSet_spr.Database:=pFIBDatabase;
end;
// -----------------------------------------------------------------------------
// Инициализация справочника услуг по аренде
procedure TfrmFavour.FormCreate(Sender: TObject);
begin
 // -- Сделать настройку согласно правам

 // -- Настройка изначального фильтра
// DateBeg.Date := date;
 DateBeg.Date := EncodeDate(YearOf(now), 1, 1);
// DateBeg.Date := EncodeDate(YearOf(now), MonthOf(now),1);
 DateEnd.Date := EncodeDate(2999,12,31);
// DateEnd.Date := EncodeDate(YearOf(now), MonthOf(now),DayOf(EndOfAMonth(YearOf(now), MonthOf(now))));
 DateTar.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfAMonth(YearOf(now), MonthOf(now))));
 // -- Обновление данных согласно фильтра
 UpdateFavList();
 cxGrid1DBTableView1.DataController.GotoFirst;
 cxGrid1DBTableView1SelectionChanged(cxGrid1DBTableView1);
 SummColumn.DataBinding.ValueTypeClass        := TcxCurrencyValueType;
end;
// -----------------------------------------------------------------------------
// Начальная загрузка и инициалиция набора данных
procedure  TfrmFavour.UpdateFavList();
begin
 pFIBDataSet_spr.Active:=false;
 pFIBDataSet_spr.SQLs.SelectSQL.Clear;
 pFIBDataSet_spr.SQLs.SelectSQL.Add('SELECT * FROM PUB_SP_ARND_FAVOUR_SEL('''+DateToStr(DateBeg.Date)+''',''' + DateToStr(DateEnd.Date) +''');');
 pFIBDataSet_spr.Active:=true;
end;
// -----------------------------------------------------------------------------
// Закрытие справочника
procedure TfrmFavour.dxBarLargeButton_closeClick(Sender: TObject);
begin
 Close();
end;
// -----------------------------------------------------------------------------
// Обновление справочника согласно установленному фильтру
procedure TfrmFavour.dxBarLargeButton_updClick(Sender: TObject);
var
 Tss:string;
begin
 Tss:=IF_F_Transfer.Caption;
 UpdateFavList();
 pFIBDataSet_spr.Locate('ID_F',Tss,[]);
end;

procedure TfrmFavour.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Values[1] = '1' then
  begin
   ACanvas.Canvas.Font.Color := clBlack;
   ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end
 else
 begin
  ACanvas.Canvas.Font.Color := clBlack;
  ACanvas.Canvas.FillRect(AViewInfo.Bounds);
 end;
end;
// -----------------------------------------------------------------------------
// Добавление элемента в справочник
procedure TfrmFavour.dxBarLargeButton_addClick(Sender: TObject);
var
 FavourFrmAdd:TForm1;
 Tss:string;
begin
 Tss:=IF_F_Transfer.Caption;
 FavourFrmAdd:=TForm1.Create(self,pFIBDatabase.Handle,fsNormal,'add',0);
 FavourFrmAdd.Caption      := 'Додання послуги';
 if FavourFrmAdd.ShowModal <> mrOk then
 begin
  dxBarLargeButton_updClick(self);
  pFIBDataSet_spr.Locate('ID_F',Tss,[]);
  Exit;
 end;

 UpdateFavList();
 pFIBDataSet_spr.Locate('ID_F',FavourFrmAdd.id_out_fav,[]);
 cxGrid1DBTableView1SelectionChanged(cxGrid1DBTableView1);
end;
// -----------------------------------------------------------------------------
// Просмотр элемента справочника
procedure TfrmFavour.dxBarLargeButton_prClick(Sender: TObject);
var
 FavourFrmView:TForm1;
 Tss:string;
begin
 Tss:=IF_F_Transfer.Caption;
 FavourFrmView:=TForm1.Create(self,pFIBDatabase.Handle,fsNormal,'view',StrToInt(IF_F_Transfer.Caption));
 FavourFrmView.Caption      := 'Перегляд послуги';
 if FavourFrmView.ShowModal <> mrOk
 then
 begin
  UpdateFavList();
  pFIBDataSet_spr.Locate('ID_F',Tss,[]);
  Exit;
 end;
 UpdateFavList();
 pFIBDataSet_spr.Locate('ID_F',Tss,[]);
 cxGrid1DBTableView1SelectionChanged(cxGrid1DBTableView1);
end;
// -----------------------------------------------------------------------------
// Удаление элемента справочника
// [+]
procedure TfrmFavour.dxBarLargeButton_delClick(Sender: TObject);
var
 id_favour:Integer;
begin

 if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити обрану послугу?'),
 'Підтвердження видалення',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;

 id_favour:=StrToInt(IF_F_Transfer.Caption);
 DelProc.Transaction.StartTransaction;
 DelProc.StoredProcName:='PUB_SP_ARND_FAVOUR_DEL_ID';
 DelProc.Prepare;

 DelProc.ParamByName('ID_F').AsInteger:=id_favour;
 DelProc.ExecProc;
 DelProc.Transaction.Commit;
 UpdateFavList();
end;
// -----------------------------------------------------------------------------
// Редактирование элемента справочника
// [-]
procedure TfrmFavour.dxBarLargeButton_redClick(Sender: TObject);
var
 FavourFrmView:TForm1;
 Tss:string;
begin
 Tss:=IF_F_Transfer.Caption;
 FavourFrmView:=TForm1.Create(self,pFIBDatabase.Handle,fsNormal,'red',StrToInt(IF_F_Transfer.Caption));
 FavourFrmView.Caption      := 'Редагування послуги';
 if FavourFrmView.ShowModal <> mrOk
 then
 begin
  UpdateFavList();
  pFIBDataSet_spr.Locate('ID_F',Tss,[]);
  Exit;
 end;
 UpdateFavList();
 pFIBDataSet_spr.Locate('ID_F',Tss,[]);
 cxGrid1DBTableView1SelectionChanged(cxGrid1DBTableView1);
end;
// -----------------------------------------------------------------------------
// Возврат данных в родительскую форму
// [+]
procedure TfrmFavour.dxBarLargeButton_get_group_docClick(Sender: TObject);
var
  AddCnt      : TForm3;
  cntFav      : string;
  CounterCurr : string;
  Sum         : Double;
  Counters    : TCountersAdd;
  SummAdd     : TSummAdd;
  ArndInflFrm : TArndInfl;
  SumInflForm : TFormSum;
  t_v         : Double;
//  s_val       : integer;
  Key         : char;
  ProcParam   : integer;
  NDSPercent  : Double;
  SumFav      : Double;
  SumNDS      : Double;
  SumTar      : Double;
  NdsSTN      : String;
  NdsStId     : integer;
  counter     : string;
  tmp_idx     : Double;
  tarif       : Double;
  index_inflation :Double;
  ArndFullSum : Double;
  ArndFullNds : Double;

  arnd_Sum    : Double;
  Sum_fv      : Double;
  i:Integer;
begin
  cntFav:='0';
  Sum :=0;
  Key:=#13;

  if a_in['PriznVizova'] = 'SpView' then begin
    ModalResult:=mrCancel;
    a_out^['ModalResult']:='mrCancel';
    Exit; end;

  if a_in['PriznVizova'] = 'Edit' then begin

   ProcParam :=a_in['id_fav'];
   // --------------------------
   // Подставляем уже существующие параметры
   cntFav:=a_in['fav_cnt'];
   Sum:=a_in['fav_sum'];
   Sum_fv:=a_in['fav_sum'];
   id_document:=a_in['id_dog'];
   frmFavour.PeriodBeg:=a_in['PeriodBeg'];
   frmFavour.PeriodEnd:=a_in['PeriodEnd'];
   counter:=a_in['counter'];
   index_inflation:= a_in['INDEX_VALUE'];
   arnd_Sum:=a_in['arnd_sum']; end
  else begin
   ProcParam:=StrToInt(IF_F_Transfer.Caption); end;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='PUB_SP_ARND_FAVOUR_SEL_ID';
  StProc.ParamByName('ID_F').AsInteger:=ProcParam;
  StProc.ExecProc;

  tarif:=StProc.FldByName['Summ'].AsDouble;
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Вызовы форм внесения количества/показания счётчиков в зависимости от настроек услуг
  // Если требуется просто указание количества услуги
  if StProc.FldByName['form_name'].AsString = 'IS_COUNT_SUM' then
  begin
    AddCnt := TForm3.Create(self);
    AddCnt.Label4.Caption := FloatToStr(StProc.FldByName['Summ'].AsDouble) + ' грн/' + StProc.FldByName['ED_IZM'].AsString;
    AddCnt.Sum_One:= StProc.FldByName['Summ'].AsDouble;
    AddCnt.Label5.Caption :=StProc.FldByName['ED_IZM'].AsString;

    SelProc.Transaction.StartTransaction;
    SelProc.StoredProcName:='PUB_SP_FAVOUR_COUNTER_SEL';
    SelProc.ParamByName('ID_FAV').AsInteger:=ProcParam;
    SelProc.ParamByName('ID_DOG').AsInt64:= id_document;
    SelProc.ParamByName('DATE_BEG_CUR').AsDate:=frmFavour.PeriodBeg;
    SelProc.ParamByName('DATE_END_CUR').AsDate:=frmFavour.PeriodEnd;
    SelProc.ExecProc;

    AddCnt.CountEdit.Value:=StrToFloat(cntFav);
    // Проверка на разрешение забора суммы из прошлого периода
    if SelProc.FldByName['FAV_CNT'].AsDouble <> 0 then begin
      t_v:=SelProc.FldByName['FAV_CNT'].AsDouble;
      AddCnt.CountEdit.Value:=t_v;
      AddCnt.SumEdit.Value:=SelProc.FldByName['SUMF'].AsCurrency;  end;

    // Проверка на разрешение редактирование суммы под договором
    if StProc.FldByName['allow_summ_edit'].AsString <> '1' then begin
     AddCnt.SumEdit.Properties.ReadOnly:=true;
     AddCnt.SumEdit.Style.Color:=$00D9EBE0; end;
    // Показываем форму
    if AddCnt.ShowModal <> mrOk then begin
     Exit; end;

    CntFav := AddCnt.CountEdit.EditValue;
    Sum := AddCnt.SumEdit.Value;
  end;

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Если требуется конкретное указание показателей счётчиков
  // CounterCurr содержит текущие показания счётчика и сохраняется как количество
  if StProc.FldByName['FORM_NAME'].AsString = 'IS_COUNTERS' then
  begin
    Counters :=TCountersAdd.Create(self);
    Counters.PeriodStr.Caption:=DateToStr(PeriodBeg)+' - '+DateToStr(PeriodEnd);
    Counters.FavLabel.Caption:=StProc.FldByName['Summ'].AsString + ' грн/' + StProc.FldByName['ED_IZM'].AsString;
    Counters.Sum_One:= StProc.FldByName['Summ'].AsDouble;

    // Вводим учёт прошлых показаний счётчиков, согласно выбранной услуге

    SelProc.Transaction.StartTransaction;
    SelProc.StoredProcName:='PUB_SP_FAVOUR_COUNTER_SEL';
    SelProc.ParamByName('ID_FAV').AsInteger:=ProcParam;
    SelProc.ParamByName('ID_DOG').AsInt64:= id_document;
    SelProc.ParamByName('DATE_BEG_CUR').AsDate:=frmFavour.PeriodBeg;
    SelProc.ParamByName('DATE_END_CUR').AsDate:=frmFavour.PeriodEnd;

    SelProc.ExecProc;
    Counters.CurEdit.Text:=counter;

    // Проверка на разрешение забора суммы из прошлого периода
    if SelProc.FldByName['counter'].AsInteger <> 0 then begin
      Counters.OldEdit.Text:=SelProc.FldByName['counter'].AsString;
      Counters.OldEdit.Properties.ReadOnly:=true;
      Counters.OldEdit.Style.Color:=$00D9EBE0; end;

    // Проверка на разрешение редактирование суммы под договором
    if StProc.FldByName['allow_summ_edit'].AsString <> '1' then begin
     Counters.SumEdit.Properties.ReadOnly:=true;
     Counters.SumEdit.Style.Color:=$00D9EBE0; end;

    // Показываем форму
    if Counters.ShowModal <> mrOk then begin
     Exit; end;

    counter:=Counters.CurEdit.Text;
    CntFav :=Counters.CountEdit.Text;    // Возвращаем значение по счётчику
    Sum := Counters.SumEdit.Value;
  end;

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Если требуется просто указать сумму
  if (StProc.FldByName['FORM_NAME'].AsString = 'IS_SUM_ONLY') then
  begin
    SummAdd := TSummAdd.Create(self);
    SummAdd.FavLabel.Caption:=StProc.FldByName['name_f'].AsString;
    SummAdd.SumEdit.Value:=StProc.FldByName['Summ'].AsDouble;
    if a_in['PriznVizova'] = 'Edit' then begin
      SummAdd.SumEdit.Value:=Sum_fv; end;

    // Проверка на разрешение редактирования суммы под услугой
    if StProc.FldByName['allow_summ_edit'].AsString <> '1' then begin
     SummAdd.SumEdit.Properties.ReadOnly:=true;
     SummAdd.SumEdit.Style.Color:=$00D9EBE0; end;

    // Показываем форму
    if SummAdd.ShowModal <> mrOk then begin
     Exit; end;

    Sum := SummAdd.SumEdit.Value;
    CntFav:='0';
  end;

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Если требуется указать сумму и коэффициент инфляции (Аренда оборудования)
  if (StProc.FldByName['FORM_NAME'].AsString = 'IS_INFL_SUM') then
  begin
    SumInflForm := TFormSum.Create(self);
    SumInflForm.FavLabel.Caption:=StProc.FldByName['name_f'].AsString;
    SumInflForm.OldSumEdit.Properties.ReadOnly:=true;
    SumInflForm.OldSumEdit.Style.Color:=$00D9EBE0;
    StProcInfl.Close;
    StProcInfl.StoredProcName := 'DOG_SP_INFLATION_SEL_BY_DATE';
    StProcInfl.Prepare;
    StProcInfl.ParamByName('DATE_CUR').AsDate := frmFavour.PeriodBeg;
    StProcInfl.ExecProc;
    if (StProcInfl.ParamByName('INFLATION_INDEX').AsVariant<>null) then
      SumInflForm.InflEdit.EditValue:=StProcInfl.ParamByName('INFLATION_INDEX').AsInteger
    else
      SumInflForm.InflEdit.Value:=1;
    StProcInfl.Transaction.Commit;

    SelProc.Transaction.StartTransaction;
    SelProc.StoredProcName:='PUB_SP_FAVOUR_COUNTER_SEL';
    SelProc.ParamByName('ID_FAV').AsInteger:=ProcParam;
    SelProc.ParamByName('ID_DOG').AsInt64:= id_document;
    SelProc.ParamByName('DATE_BEG_CUR').AsDate:=frmFavour.PeriodBeg;
    SelProc.ParamByName('DATE_END_CUR').AsDate:=frmFavour.PeriodEnd;
    SelProc.ExecProc;

    if SelProc.FldByName['SUMF'].AsDouble <> 0 then
    begin
     SumInflForm.OldSumEdit.Value:=SelProc.FldByName['SUMF'].AsCurrency;
     SumInflForm.SumEdit.Value:=SelProc.FldByName['SUMF'].AsCurrency;    end;

    if a_in['PriznVizova'] = 'Edit' then begin
     SumInflForm.SumEdit.Value:=Sum_fv; end;

    // Проверка на разрешение редактирования суммы под услугой
    if StProc.FldByName['allow_summ_edit'].AsString <> '1' then begin
     SumInflForm.OldSumEdit.Properties.ReadOnly:=true;
     SumInflForm.OldSumEdit.Style.Color:=$00D9EBE0; end;

    // Показываем форму
    if SumInflForm.ShowModal <> mrOk then begin
     Exit; end;

    Sum := SumInflForm.SumEdit.Value;
    CntFav:='0';
  end;


  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Если в качестве формы обработки указана форма аренды
  if (StProc.FldByName['FORM_NAME'].AsString = 'IS_ARND') then
  begin
   // --------------------------------------------------------------------------
   // Показываем информацию о тарифе и единице измерения
   ArndInflFrm:= TArndInfl.Create(self);

   ArndInflFrm.PR_VNZ:=StProc.FldByName['PR_VNZ'].AsExtended;
   ArndInflFrm.Label4.Caption:= StProc.FldByName['name_f'].AsString;//StProc.FldByName['Summ'].AsString + ' грн/' + StProc.FldByName['ED_IZM'].AsString;
   ArndInflFrm.Label5.Caption:=StProc.FldByName['ED_IZM'].AsString;
   ArndInflFrm.OldSumEdit.Properties.ReadOnly:=true;
   ArndInflFrm.OldSumEdit.Style.Color:=$00D9EBE0;
   // Запрещаем редактирование значений старых периодов
   ArndInflFrm.OldFullSumEdit.Properties.ReadOnly:=true;
   ArndInflFrm.OldFullSumEdit.Style.Color:=$00D9EBE0;

   ArndInflFrm.SumEdit.Properties.ReadOnly:=true;
   ArndInflFrm.SumEdit.Style.Color:=$00D9EBE0;

   // --------------------------------------------------------------------------
   // Пытаемся получить показания суммы(и количества) по данной услуге за прошлый период
   SelProc.Close;
   SelProc.Transaction.StartTransaction;
   SelProc.StoredProcName:='PUB_SP_FAVOUR_COUNTER_SEL';
   SelProc.ParamByName('ID_FAV').AsInteger:=ProcParam;
   SelProc.ParamByName('ID_DOG').AsInt64:= id_document;
   SelProc.ParamByName('DATE_BEG_CUR').AsDate:=frmFavour.PeriodBeg;
   SelProc.ParamByName('DATE_END_CUR').AsDate:=frmFavour.PeriodEnd;
   SelProc.ExecProc;


  // ShowMessage('Arnd_S= ' + SelProc.FldByName['ARND_SUM'].AsString);
 //  ShowMessage('Sum_F = ' + SelProc.FldByName['SUMF'].AsString);
   // -------------------------------------------------------------------------
   // Если показания прошлых периодов имеются в наличии - подставляем количество
   if a_in['PriznVizova'] <> 'Edit' then begin
    StProcInfl.Close;
    StProcInfl.StoredProcName := 'DOG_SP_INFLATION_SEL_BY_DATE';
    StProcInfl.Prepare;
    StProcInfl.ParamByName('DATE_CUR').AsDate := frmFavour.PeriodBeg;
    StProcInfl.ExecProc;
    if (StProcInfl.ParamByName('INFLATION_INDEX').AsVariant<>null) then
      ArndInflFrm.InflEdit.EditValue:=StProcInfl.ParamByName('INFLATION_INDEX').AsExtended
    else
      ArndInflFrm.InflEdit.Value:=1;





        i:=0;
        while (i<lastPeriodN)do begin
          if (lastPeriodIdFav[i]=ProcParam)then Break;
          i:=i+1;
        end;
        if (i=lastPeriodN) then begin
         if SelProc.FldByName['ARND_SUM'].AsDouble <> 0 then  begin
          ArndInflFrm.OldFullSumEdit.Value:=SelProc.FldByName['ARND_SUM'].AsDouble;
          ArndInflFrm.NewFullSumEdit.Value:=SelProc.FldByName['ARND_SUM'].AsDouble;end;
        end else begin
          ArndInflFrm.OldFullSumEdit.Value :=lastPeriodSumm[i];
          ArndInflFrm.NewFullSumEdit.Value :=lastPeriodSumm[i];
        end ;







    if SelProc.FldByName['FAV_CNT'].AsDouble <> 0 then  begin
     ArndInflFrm.CountEdit.Value:=SelProc.FldByName['FAV_CNT'].AsDouble;  end;




    // --------------------------------------------------------------------------
    // Проверка на наличие суммы по данной услуге в прошлом периоде
    if SelProc.FldByName['SUMF'].AsDouble <> 0 then
    begin
     ArndInflFrm.OldSumEdit.Value:=SelProc.FldByName['SUMF'].AsCurrency;
     ArndInflFrm.SumEdit.Value:=SelProc.FldByName['SUMF'].AsCurrency;    end;
   end else
   begin
    ArndInflFrm.InflEdit.Value := index_inflation;
    ArndInflFrm.CountEdit.Text:=cntFav;
    ArndInflFrm.OldSumEdit.Value:=SelProc.FldByName['SUMF'].AsCurrency;
    ArndInflFrm.OldFullSumEdit.Value:=SelProc.FldByName['ARND_SUM'].AsDouble;
    ArndInflFrm.InflEdit.Value:=index_inflation;
    ArndInflFrm.SumEdit.Value:= MyRoundTo(Sum_fv);//RoundTo(Sum_fv,-2);
    ArndInflFrm.NewFullSumEdit.Value:=MyRoundTo(arnd_Sum);//RoundTo(arnd_Sum,-2);
   end;


   //if a_in['PriznVizova'] = 'Edit' then begin
   //  ArndInflFrm.OldFullSumEdit.Value:=arnd_Sum end;


       ArndInflFrm.NewFullSumEdit.Value:=MyRoundTo(ArndInflFrm.OldFullSumEdit.Value*ArndInflFrm.InflEdit.Value);
        ArndInflFrm.SumEdit.Value:=MyRoundTo(ArndInflFrm.NewFullSumEdit.Value*ArndInflFrm.PR_VNZ);
   if ArndInflFrm.ShowModal <> mrOk then begin
    Exit; end;

   // Значение 100% стоимости аренды
   ArndFullSum := ArndInflFrm.NewFullSumEdit.Value;
   // Значение 50% стоимости аренды
   Sum := ArndInflFrm.SumEdit.Value;
   // Количество аренды (м2 или прочее)
   CntFav:=ArndInflFrm.CountEdit.Text;
   index_inflation:=ArndInflFrm.InflEdit.EditValue;
  end;

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // ---------------------------------------------------------------------------
  // Если услуга требует расчёта НДС
  if StProc.FldByName['is_nds'].AsString = '1' then
  begin
   RProc.Transaction.StartTransaction;
   RProc.StoredProcName:='PUB_GET_NAME_ST_BY_KOD';
   RProc.ParamByName('NUM_RAZD').AsInteger:=StProc.FldByName['RN'].AsInteger;
   RProc.ParamByName('NUM_ST').AsInteger:=7300;
   RProc.ParamByName('ACTUAL_DATE').AsDateTime:=frmFavour.PeriodEnd;
   RProc.ExecProc;

   if (RProc.FldByName['ID_ST'].AsInteger = null) or (RProc.FldByName['ID_ST'].AsInteger = 0) then
   begin
     ShowMessage('Данна послуга не має ПДВ!');
     Exit;
   end;

   NdsSTN:=RProc.FldByName['TITLE_ST'].AsString;
   NdsSTId:=RProc.FldByName['ID_ST'].AsInteger;

   RProc.Close;
     // -------------------------------------------------------------------------
     //Getting System NDS Procent
   RProc.Transaction.StartTransaction;
   RProc.StoredProcName:='PUB_NDS_PROCENT_INFO';
   RProc.ParamByName('D_D_DOG').AsDateTime:=frmFavour.PeriodEnd;
   RProc.ExecProc;

   NDSPercent:=RProc.FldByName['D_NDS_PROCENT'].AsFloat;
   RProc.Close;

   // -------------------------------------------------------------------------
    //Divide Sum on Sum of Favour and Sum of NDS;
   SumNDS:=(Sum*NDSPercent)/(100);
   SumNDS:= MyRoundTo(SumNDS);  // 
  end;

  // ---------------------------------------------------------------------------
  // Если услуга требует расчёта УДВОЕННОГО НДС
  if StProc.FldByName['IS_DBLNDS'].AsString = '1' then
  begin
   RProc.Transaction.StartTransaction;
   RProc.StoredProcName:='PUB_GET_NAME_ST_BY_KOD';
   RProc.ParamByName('NUM_RAZD').AsInteger:=StProc.FldByName['RN'].AsInteger;
   RProc.ParamByName('NUM_ST').AsInteger:=7300;
   RProc.ParamByName('ACTUAL_DATE').AsDateTime:=frmFavour.PeriodEnd;
   RProc.ExecProc;

   if (RProc.FldByName['ID_ST'].AsInteger = null) or (RProc.FldByName['ID_ST'].AsInteger = 0) then
   begin
     ShowMessage('Данна послуга не має ПДВ!');
     Exit;
   end;

   NdsSTN:=RProc.FldByName['TITLE_ST'].AsString;
   NdsSTId:=RProc.FldByName['ID_ST'].AsInteger;

   RProc.Close;
    // -------------------------------------------------------------------------
       // Получаем системный процент НДС
   RProc.Transaction.StartTransaction;
   RProc.StoredProcName:='PUB_NDS_PROCENT_INFO';
   RProc.ParamByName('D_D_DOG').AsDateTime:=frmFavour.PeriodEnd;
   RProc.ExecProc;


   NDSPercent:=RProc.FldByName['D_NDS_PROCENT'].AsFloat;

   RProc.Close;
    // -------------------------------------------------------------------------
       // Расчитываем удвоенный НДС для услуги

   SumNDS:=(ArndFullSum*NDSPercent)/(100);
   SumNDS:= MyRoundTo(SumNDS);
  // Расчитываем удвоенный НДС для 100% Аренды

   ArndFullNDS:=(ArndFullSum*NDSPercent)/(100);
   ArndFullNDS:=MyRoundTo(ArndFullNDS);//RoundTo(ArndFullNDS,-2);
  end;

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // ---------------------------------------------------------------------------
  // Вывод параметров в родительскую форму
  a_out^['fav_name']:=StProc.FldByName['name_f'].AsString;  // Наименование услуги
  a_out^['edizme']:=StProc.FldByName['ED_IZM'].AsString;    // Единица
  a_out^['S_Name']:= StProc.FldByName['SM'].AsString;       // Наименование сметы
  a_out^['R_Name']:= StProc.FldByName['razd'].AsString;     // Наименование раздела
  a_out^['St_Name']:= StProc.FldByName['st'].AsString;      // Наименование статьи
  a_out^['kekv_name']:=StProc.FldByName['kekv'].AsString;   // Наименование КЭКЗ
  a_out^['id_S']:= StProc.FldByName['id_smo'].AsInteger;    // ID сметы
  a_out^['id_R']:= StProc.FldByName['id_razdo'].AsInteger;  // ID раздела
  a_out^['id_St']:= StProc.FldByName['id_sto'].AsInteger;   // ID статьи
  a_out^['id_Kekv']:= StProc.FldByName['id_kekvo'].AsInteger; // ID КЭКЗ
  a_out^['S']:= StProc.FldByName['SN'].AsInteger;           // Номер сметы
  a_out^['R']:= StProc.FldByName['RN'].AsInteger;           // Номер раздела
  a_out^['St'] := StProc.FldByName['STN'].AsInteger;        // Номер статьи
  a_out^['kekv'] := StProc.FldByName['KEKVN'].AsInteger;    // Номер КЄКЗ
  a_out^['Summ'] := Sum;                                    // Общая сумма по услуге
  a_out^['tarif'] := tarif;                                 // Тариф, по которому проведён расчёт
   a_out^['INDEX_VALUE'] :=index_inflation ;                                 // Тариф, по которому проведён расчёт

  a_out^['Allow_summ_edit']:=StProc.FldByName['allow_summ_edit'].AsString; // Признак "Редактирование суммі"
  a_out^['id_fav']:= StrToInt(IF_F_Transfer.Caption);       // Айди услуги
  a_out^['fav_cnt']:=CntFav;                                // Количество услуги
  a_out^['counter']:=counter;                               // Значение счётчика
  a_out^['is_nds']:=StProc.FldByName['is_nds'].AsString;    // Признак "Обычный НДС"
  a_out^['is_dblnds']:=StProc.FldByName['IS_DBLNDS'].AsString; // Признак "Удвоенный НДС"

  a_out^['sum_nds']:=SumNDS;                                // Сумма НДС

  a_out^['NdsSTN']:=NdsSTN;                                 // !!!!!!!!!Хз что это оО
  a_out^['NdsSTId']:=NdsSTId;                               // !!!!!!!!!Хз что это оО

  a_out^['ArndFullSum']:=ArndFullSum;                       // Полная сумма (Аренда)
  a_out^['ArndFullNDS']:=ArndFullNDS;                       // Полный НДС (Аренда)

  a_out^['ModalResult'] := 'mrOk';                          // Результат вызова
  ModalResult:=mrOk;
end;

procedure TfrmFavour.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key =VK_RETURN then
  begin
    dxBarLargeButton_get_group_docClick(self);
  end;
end;

procedure TfrmFavour.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if dxBarLargeButton_get_group_doc.Enabled <> False then
    dxBarLargeButton_get_group_docClick(self);
end;

procedure TfrmFavour.BitBtn1Click(Sender: TObject);
begin

 Free;
// end;
 Close();
end;

procedure TfrmFavour.cxGrid1DBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
 if (pFIBDataSet_spr.Active <> true ) then
    Exit;
 if (pFIBDataSet_spr.RecordCount = 0) then
    Exit;

 DataSetPrices.Active:=false;
 DataSetPrices.ParamByName('ID_FAV').AsInteger:=StrToInt(IF_F_Transfer.Caption);
 DataSetPrices.ParamByName('DATE_BEG_IN').AsDateTime:=DateBeg.Date;
 DataSetPrices.ParamByName('DATE_END_IN').AsDateTime:=DateEnd.Date;

 DataSetPrices.Active:=True;

 S_Label.Caption:=DataSetPrices.FieldByName('SM').AsString;
 R_Label.Caption:=DataSetPrices.FieldByName('RAZD').AsString;
 St_Label.Caption:=DataSetPrices.FieldByName('ST').AsString;
 KEKV_Label.Caption:=DataSetPrices.FieldByName('KEKV').AsString;

 Sn.Caption:=DataSetPrices.FieldByName('SN').AsString;
 Rn.Caption:=DataSetPrices.FieldByName('RN').AsString;
 Stn.Caption:=DataSetPrices.FieldByName('STN').AsString;
 Kn.Caption:=DataSetPrices.FieldByName('KEKVN').AsString;
end;
//------------------------------------------------------------------------------
// Редактирование отдельно цены под услугой
procedure TfrmFavour.dxBarButton6Click(Sender: TObject);
var
  Price_Ad:TPriceAddForm;
  Tss:string;
  Add : variant;
  cnt : integer;
  k   : integer;
  DateBegOut:TDate;
  DateEndOut:TDate;
  sum:Double;
begin
 Tss:=IF_F_Transfer.Caption;

 DateBegOut:=EncodeDate(YearOf(now), MonthOf(now),1);
 DateEndOut:=EncodeDate(9999,12,31);

 Add:=LoadDogManedger.AddKoshtPr(self,pFibDataBase.Handle,-1,0,0,0,0,0,0,DateBeg.Date,DateBegOut,DateEndOut);

 if VarArrayDimCount(Add) <= 0 then
 begin
   Exit
 end;

 Cnt := VarArrayHighBound(Add, 1);

 k := 0;
 id_S      := Add[k][7];
 id_R      := Add[k][8];
 id_St     := Add[k][9];
 id_kekv   := Add[k][10];     
 sum       := Add[k][3];
 DateBegOut:= Add[k][13];
 DateEndOut:= Add[k][14];

 RProc.Close;
 RProc.Transaction.StartTransaction;
 RProc.StoredProcName:='PUB_SP_ARND_FAV_PRICES_ADD_TAR';
 RProc.ParamByName('ID_F').AsInteger:=StrToInt(IF_F_Transfer.Caption);
 if (IF_Price.Caption = null) then begin
    RProc.ParamByName('ID_FAV_PRICE').AsInteger:=StrToInt(IF_Price.Caption) end
 else begin
    RProc.ParamByName('ID_FAV_PRICE').AsInteger:=0; end;

 RProc.ParamByName('MONTH_PRICE').AsDouble :=Sum;
 RProc.ParamByName('ONE_PRICE').AsDouble:=Sum;
 RProc.ParamByName('ID_S').AsInteger:=id_S;
 RProc.ParamByName('ID_R').AsInteger:=id_R;
 RProc.ParamByName('ID_ST').AsInteger:=id_St;
 RProc.ParamByName('ID_KEKV').AsInteger:=id_kekv;
 RProc.ParamByName('DATE_BEG').AsDateTime:=DateBegOut;
 RProc.ParamByName('DATE_END').AsDateTime:=DateEndOut;
 RProc.ExecProc;
 RProc.Transaction.Commit;

 UpdateFavList();
 pFIBDataSet_spr.Locate('ID_F',Tss,[]);
 DataSetPrices.Active:=false;
 DataSetPrices.Active:=true;
end;
//------------------------------------------------------------------------------
// Редактирование Тарифа
procedure TfrmFavour.dxBarButton4Click(Sender: TObject);
var
 Price_Ad:TPriceAddForm;
 Tss:string;
 Add : variant;
 cnt : integer;
 k   : integer;
 DateBegOut:TDate;
 DateEndOut:TDate;
 sum:Double;
begin
// DataSetPrices.Active:=false;
// DataSetPrices.Active:=True;


 Tss:=IF_F_Transfer.Caption;
 sum:=cxGridDBTableView1.DataController.Values[cxGridDBTableView1.DataController.FocusedRecordIndex,6];
 DateBegOut:=EncodeDate(YearOf(now), MonthOf(now),1);
 DateEndOut:=EncodeDate(9999,12,31);

 Add:=LoadDogManedger.AddKoshtPr(self,pFIBDatabase.Handle,-1,2,StrToInt(ID_S_P.Caption),StrToInt(ID_R_P.Caption),StrToInt(ID_ST_P.Caption),StrToInt(ID_KEKV_P.Caption),sum,DateBeg.Date,DateBegOut,DateEndOut);

 if VarArrayDimCount(Add) <= 0 then
 begin
   Exit
 end;

 Cnt := VarArrayHighBound(Add, 1);

 k := 0;
 id_S      := Add[k][7];
 id_R      := Add[k][8];
 id_St     := Add[k][9];
 id_kekv   := Add[k][10];
 sum       := Add[k][3];
 DateBegOut:= Add[k][13];
 DateEndOut:= Add[k][14];


 RProc.Close;
 RProc.Transaction.StartTransaction;
 RProc.StoredProcName:='PUB_SP_ARND_FAV_PRICES_EDIT_TAR';
 RProc.ParamByName('ID_F').AsInteger:=StrToInt(IF_F_Transfer.Caption);
 RProc.ParamByName('ID_FAV_PRICE').AsInteger:=StrToInt(IF_Price.Caption);
 RProc.ParamByName('MONTH_PRICE').AsFloat:=Sum;
 RProc.ParamByName('ONE_PRICE').AsFloat:=Sum;
 RProc.ParamByName('ID_S').AsInteger:=id_S;
 RProc.ParamByName('ID_R').AsInteger:=id_R;
 RProc.ParamByName('ID_ST').AsInteger:=id_St;
 RProc.ParamByName('ID_KEKV').AsInteger:=id_kekv;
 RProc.ParamByName('DATE_BEG').AsDateTime:=DateBegOut;
 RProc.ParamByName('DATE_END').AsDateTime:=DateEndOut;
 RProc.ExecProc;
 RProc.Transaction.Commit;
 UpdateFavList();
 pFIBDataSet_spr.Locate('ID_F',Tss,[]);
 DataSetPrices.Active:=false;
 DataSetPrices.Active:=true;

end;

procedure TfrmFavour.DateEndKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  dxBarLargeButton_updClick(self);
 end;
end;

procedure TfrmFavour.DateBegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
  Key := #0;
  dxBarLargeButton_updClick(self);
 end;
end;

procedure TfrmFavour.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmFavour.dxBarLargeButton2Click(Sender: TObject);
var
  SprTypeFav:TForm2;
begin

 SprTypeFav:=TForm2.Create(self,pFIBDatabase.Handle,fsNormal);
 SprTypeFav.Caption      := 'Довідник типів послуг';
 if SprTypeFav.ShowModal = mrOk then
 begin

 end;
end;
//------------------------------------------------------------------------------
// Удаление цены под периодом
procedure TfrmFavour.dxBarButton5Click(Sender: TObject);
begin
 if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити обрану ціну?'),
 'Підтвердження видалення',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;

  RProc.Close;
  RProc.Transaction.StartTransaction;
  RProc.StoredProcName:='PUB_SP_ARND_FAV_PRICES_DEL';
  RProc.ParamByName('ID_F_PRC').AsInteger:=StrToInt(IF_Price.Caption);
  RProc.ExecProc;
  RProc.Transaction.Commit;

  DataSetPrices.Active:=false;
  DataSetPrices.Active:=true;
end;
end.
