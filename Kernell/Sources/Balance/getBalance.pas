unit getBalance;

interface

uses UBalance, USetFilter, Classes, IBase, Forms;

const
  btn_Add       = 'Додати';
  btn_Edit      = 'Редагувати';
  btn_Del       = 'Видалити';
  btn_Cancel    = 'Відмінити';
  btn_Ok        = 'Прийняти';
  btn_Exit      = 'Вийти';
  btn_Print     = 'Друкувати';
  btn_CheckInSch= 'Перевірити';
  btnhint_CheckInSch      = 'Перевірити баланс на входження усіх рахунків';
  btnhint_DateChange      = 'Змінити дату разрахунку';

  page_Active             = '  АКТИВ  ';
  page_Passive            = '  ПАСИВ  ';
  column_Name             = 'Назва';
  column_Code             = 'Код рядка';
  column_Order            = 'Код для сортування';
  column_BegYear          = 'На початок року';
  column_EndPeriod        = 'На кінець звітнього періоду';
  column_BalanceName      = 'Назва балансу';
  column_DKUD             = 'ДКУД';
  column_KODU             = 'КОДУ';
  column_RoundTo          = 'Округляти до';
  column_CodeVydatkiv     = 'Код відомчої класифікації видатків';

  rdbtn_frmlbycode        = 'Формула за номером рядків';
  rdbtn_frmlbysch         = 'Формула за рахунками';
  rdbtn_frmlbysum         = 'Підсумки';
  checkbox_root           = 'Зробити коренем';
  checkbox_nosumm         = 'Не підсумовувати';

  frmCap_BalanceMain      = 'Баланс підприємства';
  frmCap_BalanceSetupAdd  = 'Додавання рядка балансу';
  frmCap_BalanceSetupEdit = 'Редагування рядка балансу';
  frmCap_AddBalance       = 'Додавання балансу';
  frmCap_EditBalance      = 'Редагування балансу';
  frmCap_Delete           = 'Видалення';

  msg_Del                 = 'Ви бажаєте видалити запис';
  Lbl_NotIncludedSch      = 'Рахунки, яких немає у          ';

procedure get_Balance(AOwner:TComponent; DB_handler:TISC_DB_HANDLE; id_user:int64);stdcall;
exports get_Balance;

implementation

procedure get_Balance(AOwner:TComponent; DB_handler:TISC_DB_HANDLE; id_user:int64);
var
  FormFilter : TfrmSetFilter;
begin
    FormFilter:=  TfrmSetFilter.Create(AOwner);
    if FormFilter.ShowModal=6
    then TfrmBalance.Create(AOwner, DB_handler, FormFilter.PeriodDate, id_user);    
end;

end.
 