unit FavTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, ActnList, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,IBAse, cxMaskEdit,
  cxDropDownEdit;

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
    ActionList2: TActionList;
    Action2: TAction;
    cxCheckBox3: TcxCheckBox;
    NdsBox: TcxCheckBox;
    DblNdsBox: TcxCheckBox;
    FormBox: TcxComboBox;
    Label3: TLabel;
    pFIBQuery1: TpFIBQuery;
    TarBox: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
     PrCall:String;
     idFavExp:Integer;
     procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
     constructor Create(AOwner:TComponent; DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_fav_type:Integer); overload;
     function IPreferencesControl():integer;
    { Public declarations }
  end;

var
  TypeFavAdd: TTypeFavAdd;

implementation
// -----------------------------------------------------------------------------
// Конструктор
constructor TTypeFavAdd.Create(AOwner: TComponent;DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_fav_type:Integer);
var
  i:integer;
begin
 inherited Create (Aowner);
 InitConnection(DBHandle); // Инициализируем связь с БД
 PrCall:=Pr_vizova;
 idFavExp:=id_fav_type;
 // Инициализация базовых параметров формы.
 FormStyle  := frmStyle;
  // -- Признак вызова формы на просмотр типа услуги

 //SaveProc.GoToFirstRecordOnExecute:=true;
 pFIBQuery1.Transaction.StartTransaction;
 pFIBQuery1.SQL.Clear;
 pFIBQuery1.SQL.Add('SELECT * FROM PUB_SP_ARND_FAV_FORMS;');
 pFIBQuery1.ExecQuery;

 for i:=0 to pFIBQuery1.RecordCount + 3 do
 begin
  FormBox.Properties.Items.Add(pFIBQuery1.FldByName['form_desc'].AsString);
  pFIBQuery1.Next;
 end;

 if PrCall = 'view' then
 begin
   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_SEL_ID';
   SaveProc.ParamByName('ID_TYPE').AsInteger:=id_fav_type;
   SaveProc.ExecProc;
   NameEditFull.Text:=SaveProc.FldByName['full_name'].AsString;
   NameEditShort.Text:=SaveProc.FldByName['short_name'].AsString;

   pFIBStoredProc1.Transaction.StartTransaction;
   pFIBStoredProc1.StoredProcName:='PUB_SP_FAV_FORMS_SEL_NAME';
   pFIBStoredProc1.ParamByName('ID_FORM').AsInteger:=SaveProc.FldByName['ID_FORM'].AsInteger;
   pFIBStoredProc1.ExecProc;
   FormBox.Text:=pFIBStoredProc1.ParamByName('FORM_DESC').AsString;

   //  -----------------------------------------------------------
   // Флаг, разрешающий редактирования суммы под услугой
   if SaveProc.FldByName['allow_sum_edit'].AsString = '1' then begin
    cxCheckBox3.Checked:=true; end
   else begin
    cxCheckBox3.Checked:=False; end;
   // -----------------------------------------------------------
   // Флаг, требующий расчёт для текущей стоимости услуги
   if SaveProc.FldByName['is_nds'].AsString = '1' then begin
    NdsBox.Checked:=true; end
   else begin
    NdsBox.Checked:=False; end;
   // -----------------------------------------------------------
   // Флаг, требующий расчёт "двойного" НДС для текущей стоимости услуги
   if SaveProc.FldByName['IS_dblnds'].AsString = '1' then begin
    DblNdsBox.Checked:=true; end
   else begin
    DblNdsBox.Checked:=False; end;
   // -------------------------------------------------
   // Печатать тариф в акте
   if SaveProc.FldByName['is_tar_print'].AsString = '1' then begin
    TarBox.Checked:=true; end
   else begin
    TarBox.Checked:=False; end;



   NameEditFull.Properties.ReadOnly:=true;
   NameEditFull.Style.Color:=$00D9EBE0;

   NameEditShort.Properties.ReadOnly:=true;
   NameEditShort.Style.Color:=$00D9EBE0;
   NdsBox.Properties.ReadOnly:=true;

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

   pFIBStoredProc1.Transaction.StartTransaction;
   pFIBStoredProc1.StoredProcName:='PUB_SP_FAV_FORMS_SEL_NAME';
   pFIBStoredProc1.ParamByName('ID_FORM').AsInteger:=SaveProc.FldByName['ID_FORM'].AsInteger;
   pFIBStoredProc1.ExecProc;
   FormBox.Text:=pFIBStoredProc1.ParamByName('FORM_DESC').AsString;

   // -----------------------------------------------------------
   // Флаг, разрешающий редактирования суммы под услугой
   if SaveProc.FldByName['allow_sum_edit'].AsString = '1' then begin
    cxCheckBox3.Checked:=true; end
   else begin
    cxCheckBox3.Checked:=False; end;
   // -----------------------------------------------------------
   // Флаг, требующий расчёт для текущей стоимости услуги
   if SaveProc.FldByName['is_nds'].AsString = '1' then begin
    NdsBox.Checked:=true; end
   else begin
    NdsBox.Checked:=False; end;
   // -----------------------------------------------------------
   // Флаг, требующий расчёт "двойного" НДС для текущей стоимости услуги
   if SaveProc.FldByName['IS_dblnds'].AsString = '1' then begin
    DblNdsBox.Checked:=true; end
   else begin
    DblNdsBox.Checked:=False; end;
   // -------------------------------------------------
   // Печатать тариф в акте
   if SaveProc.FldByName['is_tar_print'].AsString = '1' then begin
    TarBox.Checked:=true; end
   else begin
    TarBox.Checked:=False; end;


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
   if (IPreferencesControl=0) then Exit;

   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_ADD';

   SaveProc.ParamByName('full_name_type_f').AsString:=NameEditFull.Text;
   SaveProc.ParamByName('short_name_type_f').AsString:=NameEditShort.Text;

   pFIBStoredProc1.Transaction.StartTransaction;
   pFIBStoredProc1.StoredProcName:='PUB_SP_ARND_FAV_FORMS_SEL_ID';
   pFIBStoredProc1.ParamByName('FORM_DESC').AsString:=FormBox.Text;
   pFIBStoredProc1.ExecProc;
   SaveProc.ParamByName('ID_FORM').AsInteger:=pFIBStoredProc1.FldByName['ID_FORM'].AsInteger;
   // Признак разрешения редактирования суммы
   if cxCheckBox3.Checked then begin
     SaveProc.ParamByName('allow_sum_edit').AsString:='1'; end
   else begin SaveProc.ParamByName('allow_sum_edit').AsString:='0'; end;

   // -------------------------------------------------
   // Учёт обычного процента НДС
   if NdsBox.Checked then begin
     SaveProc.ParamByName('is_nds').AsString:='1'; end
   else begin
     SaveProc.ParamByName('is_nds').AsString:='0'; end;
   // -------------------------------------------------

   // Удвоенный процент НДС
   if DblNdsBox.Checked then begin
     SaveProc.ParamByName('is_DblNds').AsString:='1'; end
   else begin
     SaveProc.ParamByName('is_DblNds').AsString:='0'; end;

   // Печатать тариф в акте
   if TarBox.Checked then begin
     SaveProc.ParamByName('is_tar_print').AsString:='1'; end
   else begin
     SaveProc.ParamByName('is_tar_print').AsString:='0'; end;


   SaveProc.ExecProc;
   SaveProc.Transaction.Commit;
   ModalResult:=mrOk;

  end;
  // ---------------------------------------------------------------------------
  // Признак вызова - редактирование
  if PrCall = 'mod' then
  begin
   if (IPreferencesControl=0) then Exit;
   SaveProc.Transaction.StartTransaction;
   SaveProc.StoredProcName:='PUB_SP_TYPE_FAVOUR_MOD';

   SaveProc.ParamByName('ID_TYPE_F').AsInteger:=idFavExp;
   SaveProc.ParamByName('full_name_type_f').AsString:=NameEditFull.Text;
   SaveProc.ParamByName('short_name_type_f').AsString:=NameEditShort.Text;

   pFIBStoredProc1.Transaction.StartTransaction;
   pFIBStoredProc1.StoredProcName:='PUB_SP_ARND_FAV_FORMS_SEL_ID';
   pFIBStoredProc1.ParamByName('FORM_DESC').AsString:=FormBox.Text;
   pFIBStoredProc1.ExecProc;
   SaveProc.ParamByName('ID_FORM').AsInteger:=pFIBStoredProc1.FldByName['ID_FORM'].AsInteger;
   // -------------------------------------------------
   // Признак разрешения редактирования суммы
   if cxCheckBox3.Checked then begin
     SaveProc.ParamByName('allow_sum_edit').AsString:='1'; end
   else begin SaveProc.ParamByName('allow_sum_edit').AsString:='0'; end;
   // -------------------------------------------------
   // Учёт обычного процента НДС
   if NdsBox.Checked then begin
     SaveProc.ParamByName('is_nds').AsString:='1'; end
   else begin
     SaveProc.ParamByName('is_nds').AsString:='0'; end;
   // -------------------------------------------------
   // Удвоенный процент НДС
   if DblNdsBox.Checked then begin
     SaveProc.ParamByName('is_DblNds').AsString:='1'; end
   else begin
     SaveProc.ParamByName('is_DblNds').AsString:='0'; end;
   // -------------------------------------------------
   // Печатать тариф в акте
   if TarBox.Checked then begin
     SaveProc.ParamByName('is_tar_print').AsString:='1'; end
   else begin
     SaveProc.ParamByName('is_tar_print').AsString:='0'; end;

   SaveProc.ExecProc;
   SaveProc.Transaction.Commit;
   ModalResult:=mrOk;
//   Close;
  end;
end;
// -----------------------------------------------------------------------------
// Выход по клавише "Эскейп"
procedure TTypeFavAdd.Action2Execute(Sender: TObject);
begin
 Close();
end;
// -----------------------------------------------------------------------------
function TTypeFavAdd.IPreferencesControl():Integer;
begin

 // Блок проверки указания обоих НДС в настройке
 if (DblNdsBox.Checked=True) and (NdsBox.Checked=True) then begin
  MessageBox(Handle,PChar('Послуга не може мати показник "Враховувати ПДВ" і "Подвоєний ПДВ" одночасно! '),'Увага!',MB_OK+MB_ICONWARNING);
  Result:=0;
 end;
 // Блок проверки указания формы обработки услуги
 if FormBox.Text = '' then
 begin
  MessageBox(Handle,PChar('Не вибрана форма обробки послуги! '),'Увага!',MB_OK+MB_ICONWARNING);
  Result:=0;
  Exit;
 end;

 Result:=1;
end;

end.
