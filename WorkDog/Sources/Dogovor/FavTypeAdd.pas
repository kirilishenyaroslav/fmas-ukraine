unit FavTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, ActnList, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,IBAse;

type
  TTypeFavAdd = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    NameEditFull: TcxTextEdit;
    NameEditShort: TcxTextEdit;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    MainDB: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    ActionList1: TActionList;
    Action1: TAction;
    SaveProc: TpFIBStoredProc;
    pFIBTransaction2: TpFIBTransaction;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    ActionList2: TActionList;
    Action2: TAction;
    procedure cxButton2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
     PrCall:String;
     idFavExp:Integer;
     procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
     constructor Create(AOwner:TComponent; DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_fav_type:Integer); overload;

    { Public declarations }
  end;

var
  TypeFavAdd: TTypeFavAdd;

implementation
// -----------------------------------------------------------------------------
// Конструктор
constructor TTypeFavAdd.Create(AOwner: TComponent;DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_fav_type:Integer);
begin
 inherited Create (Aowner);
 InitConnection(DBHandle); // Инициализируем связь с БД
 PrCall:=Pr_vizova;
 idFavExp:=id_fav_type;
 // Инициализация базовых параметров формы.
 FormStyle  := frmStyle;
  // -- Признак вызова формы на просмотр типа услуги
  if PrCall = 'view' then
  begin
   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_SEL_ID';
   SaveProc.ParamByName('ID_TYPE').AsInteger:=id_fav_type;
   SaveProc.ExecProc;
   NameEditFull.Text:=SaveProc.FldByName['full_name'].AsString;
   NameEditShort.Text:=SaveProc.FldByName['short_name'].AsString;
   if SaveProc.FldByName['is_month_pay'].AsString = '1' then
   begin
    cxCheckBox1.Checked:=true;
   end
   else begin
    cxCheckBox1.Checked:=False;
   end;

   if SaveProc.FldByName['is_count_f'].AsString = '1' then
   begin
    cxCheckBox2.Checked:=true;
   end
   else begin
    cxCheckBox2.Checked:=False;
   end;

   NameEditFull.Properties.ReadOnly:=true;
   NameEditFull.Style.Color:=$00D9EBE0;

   NameEditShort.Properties.ReadOnly:=true;
   NameEditShort.Style.Color:=$00D9EBE0;
   cxCheckBox1.Properties.ReadOnly:=true;
   cxCheckBox2.Properties.ReadOnly:=true;
   Caption:='Перегляд';
  end;
  // -- Признак вызова формы на редактирование типа услуги
  // -- Загружаем уже существующие данные
  if PrCall = 'mod' then
  begin
   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_SEL_ID';
   SaveProc.ParamByName('ID_TYPE').AsInteger:=id_fav_type;
   SaveProc.ExecProc;
   NameEditFull.Text:=SaveProc.FldByName['full_name'].AsString;
   NameEditShort.Text:=SaveProc.FldByName['short_name'].AsString;
   if SaveProc.FldByName['is_month_pay'].AsString = '1' then
   begin
    cxCheckBox1.Checked:=true;
   end
   else begin
    cxCheckBox1.Checked:=False;
   end;

   if SaveProc.FldByName['is_count_f'].AsString = '1' then
   begin
    cxCheckBox2.Checked:=true;
   end
   else begin
    cxCheckBox2.Checked:=False;
   end;
   Caption:='Редагування';
  end;
end;
// -----------------------------------------------------------------------------
// Инициализация соединения с БД
procedure TTypeFavAdd.InitConnection(DBhandle : TISC_DB_HANDLE);
begin
 MainDB.Handle:= DBhandle;
 pFIBTransaction1.StartTransaction;
end;

{$R *.dfm}
// -----------------------------------------------------------------------------
// Вариации кнопки "Сохранить"
procedure TTypeFavAdd.cxButton2Click(Sender: TObject);
begin
  // Признак вызова - добавление
  if PrCall = 'add' then
  begin
   // Заполняем параметры для сохранения значений в БД
   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_ADD';

   SaveProc.ParamByName('full_name_type_f').AsString:=NameEditFull.Text;
   SaveProc.ParamByName('short_name_type_f').AsString:=NameEditShort.Text;

   if cxCheckBox2.Checked then
   begin
     SaveProc.ParamByName('is_month_pay').AsString:='1';
   end
   else
   begin
     SaveProc.ParamByName('is_month_pay').AsString:='0';
   end;

   if cxCheckBox1.Checked then
   begin
     SaveProc.ParamByName('is_count_f').AsString:='1';
   end
   else
   begin
     SaveProc.ParamByName('is_count_f').AsString:='0';
   end;
   SaveProc.ExecProc;
   SaveProc.Transaction.Commit;
   Close;
  end;
  // Признак вызова - редактирование
  if PrCall = 'mod' then
  begin
   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_MOD';

   SaveProc.ParamByName('ID_TYPE_F').AsInteger:=idFavExp;
   SaveProc.ParamByName('full_name_type_f').AsString:=NameEditFull.Text;
   SaveProc.ParamByName('short_name_type_f').AsString:=NameEditShort.Text;
   if cxCheckBox2.Checked then
   begin
     SaveProc.ParamByName('is_month_pay').AsString:='1';
   end
   else
   begin
     SaveProc.ParamByName('is_month_pay').AsString:='0';
   end;

   if cxCheckBox1.Checked then
   begin
     SaveProc.ParamByName('is_count_f').AsString:='1';
   end
   else
   begin
     SaveProc.ParamByName('is_count_f').AsString:='0';
   end;
   SaveProc.ExecProc;
   SaveProc.Transaction.Commit;
   Close;
  end;
end;
// -----------------------------------------------------------------------------
// Выход по клавише "Эскейп"
procedure TTypeFavAdd.Action2Execute(Sender: TObject);
begin
 Close();
end;

end.
