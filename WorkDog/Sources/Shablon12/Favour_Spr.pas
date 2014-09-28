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
  cxCalendar,DateUtils, Add_Favour, DBCtrls, Buttons;

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
    R_Label: TLabel;
    St_Label: TLabel;
    KEKV_Label: TLabel;
    Sn: TLabel;
    Rn: TLabel;
    Stn: TLabel;
    Kn: TLabel;
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

    procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
    procedure  UpdateFavList();
    constructor Create(AOwner:TComponent; DBHandle : TISC_DB_HANDLE; frmStyle: TFormStyle;Pr_vizova: String); overload;
  end;

var
  frmFavour: TfrmFavour;
implementation

uses Arnd_Contract_Add;

{$R *.dfm}
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
// if Pr_vizova = 'add' then
// begin
//
// end;
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
 DateBeg.Date := date;
 DateBeg.Date := EncodeDate(YearOf(now), 1, 1);
 DateEnd.Date := date;
 // -- Обновление данных согласно фильтра
 UpdateFavList();
 cxGrid1DBTableView1SelectionChanged(cxGrid1DBTableView1);
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
begin
 UpdateFavList();
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
 pFIBDataSet_spr.Locate('ID_F',Tss,[]);

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
end;
// -----------------------------------------------------------------------------
// Возврат данных в родительскую форму
// [+]
procedure TfrmFavour.dxBarLargeButton_get_group_docClick(Sender: TObject);
begin

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='PUB_SP_ARND_FAVOUR_SEL_ID';
  StProc.ParamByName('ID_F').AsInteger:=StrToInt(IF_F_Transfer.Caption);
  StProc.ExecProc;

  fav_name  := StProc.FldByName['name_f'].AsString;
  edizme     := StProc.FldByName['ED_IZM'].AsString;

  S_Name     := StProc.FldByName['SM'].AsString;
  R_Name     := StProc.FldByName['razd'].AsString;
  St_Name    := StProc.FldByName['st'].AsString;
  kekv_name  := StProc.FldByName['kekv'].AsString;

  id_S       := StProc.FldByName['id_smo'].AsInteger;
  id_R       := StProc.FldByName['id_razdo'].AsInteger;
  id_St      := StProc.FldByName['id_sto'].AsInteger;
  id_Kekv    := StProc.FldByName['id_kekvo'].AsInteger;

  S          := StProc.FldByName['SN'].AsInteger;
  R          := StProc.FldByName['RN'].AsInteger;
  St         := StProc.FldByName['STN'].AsInteger;
  kekv       := StProc.FldByName['KEKVN'].AsInteger;

  Summ       := StProc.FldByName['Summ'].AsVariant;
  is_count_f := StProc.FldByName['is_count_f'].AsString;



  id_fav     := StrToInt(IF_F_Transfer.Caption);
  BitBtn1.ModalResult:=mrOk;
  BitBtn1Click(self);
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
 dxBarLargeButton_get_group_docClick(self);
end;

procedure TfrmFavour.BitBtn1Click(Sender: TObject);
begin
 Close();
end;

procedure TfrmFavour.cxGrid1DBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
 if (pFIBDataSet_spr.Active <> true ) then
    Exit;
 DataSetPrices.Active:=false;
 DataSetPrices.ParamByName('ID_FAV').AsInteger:=StrToInt(IF_F_Transfer.Caption);
 DataSetPrices.Active:=True;

 S_Label.Caption:=DataSetPrices.FieldByName('SM').AsString;
 R_Label.Caption:=DataSetPrices.FieldByName('RAZD').AsString;
 St_Label.Caption:=DataSetPrices.FieldByName('ST').AsString;
 KEKV_Label.Caption:=DataSetPrices.FieldByName('KEKV').AsString;

 Sn.Caption:=DataSetPrices.FieldByName('SN').AsString;
 Rn.Caption:=DataSetPrices.FieldByName('RN').AsString;
 Stn.Caption:=DataSetPrices.FieldByName('STN').AsString;
 Kn.Caption:=DataSetPrices.FieldByName('KEKVN').AsString;


// Need update Smet Panel
{
 DATE_END,
 DATE_BEG,
 MONTH_PRICE,
 ONE_PRICE,
 SM,
 RAZD,
 ST,
 KEKV,
 SN,
 RN,
 STN,
 KEKVN }


end;

end.
