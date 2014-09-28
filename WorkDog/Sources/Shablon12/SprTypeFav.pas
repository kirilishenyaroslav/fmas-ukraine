unit SprTypeFav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBDatabase,
  pFIBDatabase, cxGridTableView, cxTL, dxBarExtItems, dxBar, FIBQuery,
  pFIBQuery, pFIBStoredProc, Menus, ActnList, FIBDataSet, pFIBDataSet,
  ImgList, dxStatusBar, StdCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, DBCtrls, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,IBAse,FavTypeAdd;

type
  TForm2 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    dxStatusBar2: TdxStatusBar;
    ImageList1: TImageList;
    DataSource: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
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
    StProc: TpFIBStoredProc;
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
    DelProc: TpFIBStoredProc;
    cxGrid1DBTableView1ID_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1FULL_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1IS_MONTH_PAY: TcxGridDBColumn;
    cxGrid1DBTableView1IS_COUNT_F: TcxGridDBColumn;
    ExpID: TDBText;
    ExpName: TDBText;
    ExpIsM: TDBText;
    ExpIsC: TDBText;
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure dxBarLargeButton_closeClick(Sender: TObject);
    procedure dxBarLargeButton_get_group_docClick(Sender: TObject);
    procedure dxBarLargeButton_prClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     SelectedID:Integer;
     TypeName : string;
     is_month : string;
     is_count : string;

     procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
     constructor Create(AOwner:TComponent; DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle); overload;
     procedure  UpdateFavTypeList();

    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
// -----------------------------------------------------------------------------
// Заменяем стандартный конструктор
constructor TForm2.Create(AOwner: TComponent;DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle);
begin
 inherited Create (Aowner);
 InitConnection(DBhandle);

end;
// -----------------------------------------------------------------------------
// Инициализируем подключение к БД
procedure TForm2.InitConnection(DBhandle : TISC_DB_HANDLE);
begin
 pFIBDatabase.Handle:= DBhandle;
 pFIBTransactionRead.StartTransaction;
end;
// -----------------------------------------------------------------------------
// Обновляем список типов услуг (из справочника)
procedure TForm2.UpdateFavTypeList();
begin
 pFIBDataSet_spr.Active:=false;
 pFIBDataSet_spr.SQLs.SelectSQL.Clear;
 pFIBDataSet_spr.SQLs.SelectSQL.Add('SELECT * FROM PUB_SP_TYPE_FAVOUR_SEL;');
 pFIBDataSet_spr.Active:=true;
end;
// -----------------------------------------------------------------------------
// Вызов формы добавления услуги
procedure TForm2.dxBarLargeButton_addClick(Sender: TObject);
var
 TypeAdd:TTypeFavAdd;
 Tss:String;
begin
 Tss:=ExpID.Caption;
 TypeAdd:=TTypeFavAdd.Create(self, pFIBDatabase.Handle,fsNormal,'add',0);
 TypeAdd.Caption      := 'Додання типа послуги';
 if TypeAdd.ShowModal <> mrOk then
 begin
   UpdateFavTypeList();
   pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
   Exit;
 end;
 UpdateFavTypeList();
 pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
end;

{$R *.dfm}
// -----------------------------------------------------------------------------
// События, при появлении формы
procedure TForm2.FormCreate(Sender: TObject);
begin
 UpdateFavTypeList();
end;
// -----------------------------------------------------------------------------
// Кнопка "Обновить"
procedure TForm2.dxBarLargeButton_updClick(Sender: TObject);
var
 Tss:String;
begin
 Tss:=ExpID.Caption;
 UpdateFavTypeList();
 pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
end;
// -----------------------------------------------------------------------------
// Редактирование типа услуги
procedure TForm2.dxBarLargeButton_redClick(Sender: TObject);
var
 TypeAdd:TTypeFavAdd;
 Tss:String;
begin
 Tss:=ExpID.Caption;
 TypeAdd:=TTypeFavAdd.Create(self, pFIBDatabase.Handle,fsNormal,'mod',StrToInt(ExpID.Caption));
 TypeAdd.Caption      := 'Редагування типа послуги';
 if TypeAdd.ShowModal <> mrOk then
 begin
   UpdateFavTypeList();
   pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
   Exit;
 end;
 UpdateFavTypeList();
 pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
end;
// -----------------------------------------------------------------------------
// Закрытие справочника типов услуг
procedure TForm2.dxBarLargeButton_closeClick(Sender: TObject);
begin
 Close();
end;
// -----------------------------------------------------------------------------
// Выбор типа услуги и возврат его в родительскую форму
procedure TForm2.dxBarLargeButton_get_group_docClick(Sender: TObject);
begin
 SelectedID:=StrToInt(ExpID.Caption);
 TypeName:=ExpName.Caption;
 is_month:=ExpIsM.Caption;
 is_count:=ExpIsC.Caption ;
 Close();
end;
// -----------------------------------------------------------------------------
// Просмотр элемента справочника
procedure TForm2.dxBarLargeButton_prClick(Sender: TObject);
var
 TypeAdd:TTypeFavAdd;
 Tss:String;
begin
 Tss:=ExpID.Caption;
 TypeAdd:=TTypeFavAdd.Create(self, pFIBDatabase.Handle,fsNormal,'view',StrToInt(ExpID.Caption));

 if TypeAdd.ShowModal <> mrOk then
 begin
   UpdateFavTypeList();
   pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
   Exit;
 end;
 UpdateFavTypeList();
 pFIBDataSet_spr.Locate('ID_TYPE',Tss,[]);
end;
// -----------------------------------------------------------------------------
// Выбор элемента справочника (по даблклику)
procedure TForm2.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  dxBarLargeButton_get_group_docClick(Self);
end;
// -----------------------------------------------------------------------------
// Удаление элемента из справочника услуг
procedure TForm2.dxBarLargeButton_delClick(Sender: TObject);
begin
 if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити обраний тип послуги?'),
 'Підтвердження видалення',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;

 StProc.Transaction.StartTransaction;
 StProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_DEL';
 StProc.ParamByName('ID_TYPE_F').AsInteger:=StrToInt(ExpID.Caption);
 StProc.ExecProc;
 StProc.Transaction.Commit;
 UpdateFavTypeList();
end;
// -----------------------------------------------------------------------------
// Поиск в справочнике типов договоров
procedure TForm2.Edit1Change(Sender: TObject);
begin
  ShowMessage('Realised, but... not work :( sorry... try to use later');
  pFIBDataSet_spr.Locate('FULL_NAME', Edit1.Text, [loPartialKey,loCaseInsensitive])
end;
// -----------------------------------------------------------------------------
// Поиск в справочнике типов договоров
procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =VK_RETURN then
  begin
    pFIBDataSet_spr.Locate('FULL_NAME', Edit1.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;
// -----------------------------------------------------------------------------
// Поиск в справочнике типов договоров
procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
const
	LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
	LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
	Signs = '0123456789-()/\.';
begin
	if ( Pos(Key,LettersBig) = 0)
	   and ( Pos(Key,LettersSmall) = 0 )
	   and ( Pos(Key,Signs) = 0 )
     and ( key <> #8 )
			then
      begin
        Key:=#0;
      end;
end;

procedure TForm2.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =VK_RETURN then
  begin
    dxBarLargeButton_get_group_docClick(self);
  end;
end;

end.
