unit DogLoaderUnit;

interface
uses Windows, Controls, Classes, IBase, Forms, cxGridDBTableView, AccMgmt,
     pFIBDataBase, pFIBDataSet, GlobalSPR, SysUtils, Variants, Dialogs, LoadDogManedger,
     WinSock, DateUtils, IB_EXTERNALS, AArray;

resourcestring
     REG_KEY = '\Software\FMAS\Dogovor\';

type
 TCustSelectMode = (selNone, selCustomer, selRateAccount, selPeople);

 TSpravParams = class
 private
   fValues : array of Variant;
   fNames  : array of string;
   function IndexOf(const param_name : string) : Integer;
   procedure SetParam(param_name : string; val : Variant);
   function GetParam(param_name : string) : Variant;
   function GetParamCount : Integer;
   function GetName(Index : Integer) : string;
 public
   constructor Create;
   destructor Destroy;
   procedure ApplyOnForm(frm : TForm);
   property Values[Index : string] : Variant read GetParam write SetParam; default;
   property ParamCount : Integer read GetParamCount;
   property Name[Index : Integer] : string read GetName;
 end;
 PSpravParams = ^TSpravParams;
 TSpravProc = procedure (Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;


 TDogLocateInfo = record // Информация для позиционирования
  summa : Variant; // По сумме
  name_customer : Variant; // По низванию контрагента
  rate_acc : Variant; // По р/р
 end;

 TDogFilter = record         // Используеться для фильтрации
  bUseFilter : boolean;      // Применен ли фильтр
  bShowFilterForm : boolean; // отображать ли форму фильтрации при открытии договоров
  RegNum     : string;       // Фильтр по рег. номеру
  bRegNum    : boolean;      // Применять ли фильтр по рег. номеру
  SummaFrom  : currency;     // Фильтр по сумме
  SummaTo    : currency;     // Фильтр по сумме
  bSumma     : boolean;      // Применять ли фильтр по сумме
  DateBeg    : TDate;        // Фильтр по дате
  DateEnd    : TDAte;        // Фильтр по дате
  bDate      : boolean;      // Применять ли фильтр по дате
  ShowClosed : integer;      // Отображать закрытые
  NameCust   : string;       // Фильтр по названию контрагента
  bNameCust  : boolean;      // Применять ли фильтр по названию контрагента
  id_cust    : int64;      // Фильтр по идентификатору контрагента
  bID_Cust   : boolean;      // Применять ли фильтр по идентификатору контрагента
  NameTipDog : string;       // Значение названия типа договора
  id_tip_dog : integer;      // Фильтр по типу договора
  bTipdog    : boolean;      // Применять ли фильтр по типу договора
 end;

 TDogColumn = record  // Колонка
  FieldName : string; // Название поля
  Caption   : string; // Название колонки
 end;

 TDogColumns = array of TDogColumn; // Колонки

 TDogInput = record             // Запись используеться для передачи входящих параметров
  Owner      : TComponent;      // Родительская форма
  DBHandle   : TISC_DB_HANDLE;  // Хэндл БД
  WriteTrans : TISC_TR_HANDLE;  // Хэндл пишущей транзакции
  ReadTrans  : TISC_TR_HANDLE;  // Хэндл читающей транзакции
  FormStyle  : TFormStyle;      // Стиль формы
  Values     : TSpravParams;
  isZayav    : boolean;         // Справочник вызываеться как реестр заявок к оплате
  FormCaption : string;         // Заголофок формы договоров
  //--------------------------
  Summa       : Currency;       // Сумма передаваемая для разбивки
  id_TypeDog  : integer;        // Не используеться
  id_Group    : integer;        // ID группы которые пользователь сможет добавлять;
  id_Group_add: integer;        // ID группы которые пользователь сможет видеть;
  id_Customer : int64;          // Не используеться
  MFO         : string;         // Не используеться
  RateAcc     : string;         // Не используеться
  DateSys     : TDate;          // Не используеться
  NumDoc      : string;         // Не используеться
  DateDoc     : TDate;          // Не используеться
  id_dog      : int64;        // Не используеться
  arndGetPay  : integer;        // При выборе договора аренды используеться оплатная разбивка(0, 1)
  id_doc      : int64;        // Идентификатор который игнорируетьс при расчете суммы оплаты по ALL_PROV
  lInfo       : TDogLocateInfo; // Используеться для позиционирования
  filter      : TDogFilter;     // Используеться для фильтрации
  columns     : TDogColumns;    // Колонки которые необходимо отображать
  shablon_data: TShablonInputData; //Информация которая передаеться в шаблон(модуль LoadDogManedger);
 end;


 TDogSmeta = record
  NumSmeta : int64;
  NumRazd  : int64;
  NumStat  : Int64;
  NumKekv  : int64;
  id_people: integer;
  Summa    : currency;
  NSumma   : currency;
  tn       : string[20];
  kod_payer: string[20];
 end;

 TDogResult = record
  ModalResult     : integer;
  kod_dog         : Variant;
  id_dog          : Variant;
  id_tip_dog      : Variant;
  name_tip_dog    : Variant;
  n_dog           : Variant;
  d_dog           : Variant;
  nomn_dog        : Variant;
  nomd_dog        : Variant;
  id_customer     : Variant;
  name_customer   : Variant;
  id_rate_acc     : Variant;
  rate_acc        : Variant;
  mfo             : Variant;
  bank            : Variant;
  id_rate_acc_nat : Variant;
  date_beg        : Variant;
  date_end        : Variant;
  summa           : Variant;
  continue        : Variant;
  not_summa       : Variant;
  close           : Variant;
  dog_note        : Variant;
  fio_donnu       : Variant;
  fio_postav      : Variant;
  krit_date       : Variant;
  nds_sum         : Variant;
  nds_pay         : Variant;
  sum_fulfil      : Variant;
  sum_pay         : Variant;
  sum_today       : Variant;
  before_pay      : Variant;
  before_prcn     : Variant;
  regest_num      : Variant;
  comment         : Variant;
  name_shablon    : Variant;
  id_bl_account   : int64;
  Smets           : array of TDogSmeta;
  handle          : THandle;
 end;

 TImportCustomer = record
  id_customer : int64;
  id_higher_instance : integer;
  name_customer : string[180];
  short_name : string[40];
  kod_edrpou : string[16];
  date_nns   : TDate;
  nns        : string[16];
  nalog_nom  : integer;
  fiz_lico   : integer;
  plat_nds   : integer;
  pay_nds    : integer;
  id_type_property : integer;
  id_branch  : integer;
  bShowInfo : Boolean;
 end;

 TImportCustRateAcc = record
  id_customer : int64;
  id_cust_rate_acc : int64;
  rate_account : string[30];
  id_bank : integer;
  id_type_account : integer;
  date_beg : TDate;
  date_end : TDate;
  bShowInfo : Boolean;
 end;

 TImportBank = record
  id_bank : integer;
  mfo     : string[16];
  name    : string[80];
  city    : string[30];
  bShowInfo : Boolean;
 end;

const DogMainBpl   = 'dogMain.bpl';
const ZayavBpl     = 'ZayavPackage.bpl';
const PlatBpl      = 'PlatPackage.bpl';
const RepBpl      = 'dogReport.bpl';
const FilterBpl    = 'FilterPackage.bpl';
const ReeBpl       = 'ReePack.bpl';
const PayFulfilBpl = 'FulfilPack.bpl';
const ShowSPBpl    = 'ShowSP.bpl';


procedure LoadSprav(const BplName : string; Owner : TComponent; input : TSpravParams; output : TSpravParams);
function ShowDogMain(input_params : TDogInput) : TDogResult;
//function ShowDogMainFlt(input_params : TDogInput; flt : TDogFilter; const ShowFltScreen : boolean) : TDogResult;
function ShowZayav(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant;
function ShowPlat(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const _id_reestr : integer = -1; const dog_reg_num : string = '') : variant;
function ShowRep(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant;
function ShowFilterForm(AOwner : TForm; const Capt : string; DBTableView : TcxGridDBTableView; const Fields : array of string; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE) : HWND; stdcall;
function ShowRee(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; in_param, out_param : taarray) : variant;
function ShowDogPayFulfil(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const id_dog, exclude_id_doc : int64) : variant;
procedure LoadSysData(ReadTransaction : TpFIBTransaction);
function CheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;
//function ShowCustomersSprav(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : integer; const multi_select : boolean = false; const id_session : integer = -1):Variant; stdcall;
//function ShowCustomersSprav1(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : integer; const multi_select : boolean = false; const id_session : integer = -1; const show_dep: boolean = false):Variant; stdcall;
function ShowCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : int64 = -1; const show_dep: boolean = true):Variant; stdcall;
procedure LoadPositionFromRegistry(Form : TForm);
procedure SavePositionToRegistry(Form : TForm);
procedure GetDogovorPayFulfil(const id_dog : integer; var pay, fulfil : Currency; ReadTransaction : TpFIBTransaction);
function MessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
procedure ShowMessage(const Msg : string);
function ImportCustomer(cust : TImportCustomer; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
function ImportCustRateAcc(cust_rate_acc : TImportCustRateAcc; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
function ImportBank(bank : TImportBank; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
function CheckAccount(acc, mfo : string) : boolean;
function GetCompName : string;
function GetIPAddress : string;
function agCurrToStr(const cur : currency) : string;
procedure agShowMessage(const Text : string);
procedure Test;
function isFloat(const s : string) : boolean;
function isInteger(const s : string) : boolean;
procedure CheckInteger(var Key : char);
procedure CheckFloat(var Key : char);
function RemoveApostrof(const s : string) : string;
procedure GetDogovorInfo(Owner : TComponent; input : PSpravParams; output : PSpravParams);//рПМХЮБЕФ РПДТПВОХА ЙОЖПТНБГЙА РП ДПЗПЧПТХ
function IfNull(const variable : Variant; const Value : Variant) : Variant;
procedure ShowSpravParams(AOwner : TComponent; params : TSpravParams);
function dog_get_nds(const d : TDate; Transaction : TpFIBTransaction) : Currency;

procedure dog_add_dogovor_ext(const i : TAArray; var o : TAArray);
procedure dog_close_dogovor_ext(const i : TAArray; var o : TAArray);

var
 SYS_DEFAULT_DOG_INPUT : TDogInput;
 SYS_ID_GROUP_DOG : integer = 1;
 SYS_ID_GROUP_ZAYAV : integer = 2;
 SYS_ID_GROUP_DOG_VIEW : integer = 1;
 SYS_ID_GROUP_ZAYAV_VIEW : integer = 2;
 SYS_KOD_VAL: String = 'ЗТО';
 SYS_RAZD_SUMMA: String = ',';
 SYS_NAME_CUSTOMER_NATIVE : string = 'дПОох';
 SYS_ID_PREDOPL : integer;
 SYS_ID_SMETA   : integer;
 SYS_ID_USER    : integer;
 SYS_DOG_PERIOD : integer;
 SYS_TEST       : Boolean;
 SYS_TEMP_NUM   : String;
 SYS_TEMP_DATE  : String;
 SYS_TEMP_NOTE  : String;
 SYS_LANG_FILE  : String = 'Lang\ukr.ini';
 SYS_APP_PATH   : String;
 SYS_DIGITS_AFTER_DOT : Integer = 4;
 SYS_DOG_DISABLED : Boolean = False;
 SYS_SERVER     : integer;
 SYS_USE_DEP_IN_CUST : integer = 0;
 SYS_IS_DONNU : boolean = false;
 SYS_IS_CH : boolean = false;
 SYS_IS_DNEPR  : BOOLEAN = false;
 SYS_CURRENT_DEPARTMENT : integer;
 SYS_CURRENT_DATE : TDate;
 isAdmin : boolean = false;
 isSuperAdmin : Boolean = False;

 CurrentID_PCARD : Integer;
 FIO : String;
 Sys_User_Name : string;
 Sys_User_Password : string;
 SYS_ID_TYPE_ACCOUNT :  Integer;
 SYS_NAME_TYPE_ACCOUNT : String;
 SYS_CITY: String;

 // юЕТНЕФ
 SYS_DEF_UNIT_MEAS : integer;
 SYS_DEF_UNIT_MEAS_SUM : integer;
 SYS_DEF_NAME_UNIT_MEAS : string = 'Н3';
 SYS_DEF_NAME_UNIT_MEAS_SUM : string = 'Н3';
 SYS_DEF_UNIT_MEAS_COEF : Integer = 1;
 SYS_DEF_UNIT_MEAS_SUM_COEF : Integer = 1;
 SYS_MAX_TIMESTAMP : TDate;
 SYS_NDS : Currency = 0.2;
 SYS_DEF_NAME_DEPARTMENT : string;
 SYS_DEF_ID_DEPARTMENT : Integer;
 SYS_DEF_ID_DEPARTMENT2 : integer;



implementation
uses Registry, StdCtrls, FIBDatabase, FIBDataSet, pFIBProps, pFIBQuery, pFIBStoredProc,
  FIBQuery;

function dog_get_nds(const d : TDate; Transaction : TpFIBTransaction) : Currency;
var
  q : TpFIBQuery;
begin
  Result := 0.2;
  q             := TpFIBQuery.Create(Nil);
  q.Database    := Transaction.DefaultDatabase;
  q.Transaction := Transaction;
  q.SQL.Text    := 'select NDS from DOG_GET_NDS(:in_date)';
  q.Prepare;
  q.ParamByName('in_date').AsDate := d;
  try
    q.ExecQuery;
  except
    q.Close;
    q.Free;
    exit;
  end;
  if q.RecordCount <> 0 then
  begin
    Result := q['NDS'].AsCurrency/100;
  end;
  q.Free;
end;

procedure dog_add_dogovor_ext(const i : TAArray; var o : TAArray);
var
  q : TpFIBQuery;
  p : TpFIBStoredProc;
  cnt : integer;
  smt : integer;
  def_account : int64;
  def_customer : int64;
  def_cust_account : int64;
  def_date : TDate;
  def_note : string;
  def_number : string;
  summa : Currency;

  procedure GetDefaultData;
  begin
    def_account := -1;
    def_customer := -1;
    def_cust_account := -1;
    def_date := date;
    def_note := '';
    def_number := '';

    q := TpFIBQuery.Create(Nil);
    q.Database := p.Database;
    q.Transaction := p.Transaction;
    q.SQL.Text := 'select first(1) * from PUB_SP_TIP_DOG_DEF where id_tip_dog = :d_id_tip_dog';
    q.Prepare;
    q.ParamByName('d_id_tip_dog').AsInt64 := i['d_id_tip_dog'].AsInt64;
    q.ExecQuery;
    if q.RecordCount <> 0 then
    begin
      def_account := q.FieldByName('DEF_ACCOUNT').AsInt64;
      def_customer := q.FieldByName('DEF_CUSTOMER').AsInt64;
      def_cust_account := q.FieldByName('DEF_CUST_ACCOUNT').AsInt64;
      def_date := q.FieldByName('DEF_DATE').AsDate;
      def_number := q.FieldByName('DEF_NUMBER').AsString;
      def_note := q.FieldByName('DEF_NOTE').AsString;
    end;
    q.Close;
    if def_account = 0 then def_account := -1;
    if def_customer = 0 then def_customer := -1;
    if def_cust_account = 0 then def_cust_account := -1;
    if def_date = 0 then def_date := date;
  end;


begin
  o['Result'].AsVariant := false;
  if i['Database'].AsObject = Nil then
  begin
    o['Message'].AsString := 'Некорректно передан handle базы данных';
    exit;
  end;
  if i['Transaction'].AsObject = Nil then
  begin
    o['Message'].AsString := 'Некорректно передан handle транзакции';
    exit;
  end;
  p := TpFIBStoredProc.Create(Nil);
  p.Database := TFIBDatabase(i['Database'].asObject);
  p.Transaction := TFIBTransaction(i['Transaction'].asObject);
  p.Transaction.StartTransaction;
  p.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
  p.Prepare;
  if VarIsNull(i['d_id_tip_dog'].AsVariant) then
  begin
    o['Message'].AsString := 'Не передан тип договора: d_id_tip_dog';
    p.Transaction.Rollback;
    exit;
  end else p.ParamByName('d_id_tip_dog').AsInt64 := i['d_id_tip_dog'].AsInt64;

  GetDefaultData;

  summa := 0;
  if not VarIsNull(i['SMET']['Count'].AsVariant) then
  begin
    cnt := i['SMET']['Count'].AsInteger;
    for smt := 0 to cnt - 1 do if not VarIsNull(i['SMET'][smt]['d_summa_sm'].AsVariant) then summa := summa + i['SMET'][smt]['d_summa_sm'].AsCurrency; 
  end;

  if VarIsNull(i['d_n_dog'].AsVariant) then p.ParamByName('d_n_dog').AsString := def_number
                                else p.ParamByName('d_n_dog').AsString := i['d_n_dog'].AsString;
  if VarIsNull(i['d_d_dog'].AsVariant) then p.ParamByName('d_d_dog').AsVariant := date
                                else p.ParamByName('d_d_dog').AsDate := i['d_d_dog'].AsVariant;
  if VarIsNull(i['d_summa'].AsVariant) then p.ParamByName('d_summa').AsCurrency := summa
                                else p.ParamByName('d_summa').AsCurrency := i['d_summa'].AsCurrency;
  if VarIsNull(i['d_dog_note'].AsVariant) then p.ParamByName('d_dog_note').AsString := def_note
                                else p.ParamByName('d_dog_note').AsString := i['d_dog_note'].AsString;
  if VarIsNull(i['d_krit_dat'].AsVariant) then p.ParamByName('d_krit_dat').AsVariant := Null
                                else p.ParamByName('d_krit_dat').AsDate := i['d_krit_dat'].AsVariant;
  if VarIsNull(i['d_nds_sum'].AsVariant) then p.ParamByName('d_nds_sum').AsCurrency := 0
                                else p.ParamByName('d_nds_sum').AsCurrency := i['d_nds_sum'].AsCurrency;
  if VarIsNull(i['d_id_rate_account'].AsVariant) then
  begin
    if def_cust_account = -1 then
    begin
      o['Message'].AsString := 'Не передан расчетный счет: d_id_rate_account';
      p.Transaction.Rollback;
      exit;
    end else p.ParamByName('d_id_rate_account').AsInt64 := def_cust_account;
  end else p.ParamByName('d_id_rate_account').AsInt64 := i['d_id_rate_account'].AsInt64;
  if VarIsNull(i['d_id_rate_acc_native'].AsVariant) then
  begin
    if def_account = -1 then
    begin
      p.Transaction.Rollback;
      o['Message'].AsString := 'Не передан расчетный счет: d_id_rate_acc_native';
      exit;
    end else p.ParamByName('d_id_rate_acc_native').AsInt64 := def_account;
  end else p.ParamByName('d_id_rate_acc_native').AsInt64 := i['d_id_rate_acc_native'].AsInt64;
  if VarIsNull(i['d_id_customer'].AsVariant) then
  begin
    if def_customer = -1 then
    begin
      o['Message'].AsString := 'Не передан контрагент: d_id_customer';
      p.Transaction.Rollback;
      exit;
    end else p.ParamByName('d_id_customer').AsInt64 := def_customer;
  end else p.ParamByName('d_id_customer').AsInt64 := i['d_id_customer'].AsInt64;

  if VarIsNull(i['d_name_customer'].AsVariant) then
  begin
     p.ParamByName('d_name_customer').AsString := '';
    {o['Message'].AsString := 'оЕ РЕТЕДБОП ОБЪЧБОЙЕ ЛПОФТБЗЕОФ: d_name_customer';
    p.Transaction.Rollback;
    exit;}
  end else p.ParamByName('d_name_customer').AsString := i['d_name_customer'].AsString;
  if VarIsNull(i['d_nomn_dog'].AsVariant) then p.ParamByName('d_nomn_dog').AsString := ''
                                else p.ParamByName('d_nomn_dog').AsString := i['d_nomn_dog'].AsString;
  if VarIsNull(i['d_nomd_dog'].AsVariant) then p.ParamByName('d_nomd_dog').AsDate := date
                                else p.ParamByName('d_nomd_dog').AsDate := i['d_nomd_dog'].AsVariant;

  if VarIsNull(i['d_date_beg'].AsVariant) then p.ParamByName('d_date_beg').AsDate := date
                                else p.ParamByName('d_date_beg').AsDate := i['d_date_beg'].AsVariant;
  if VarIsNull(i['d_date_end'].AsVariant) then p.ParamByName('d_date_end').asDate := date
                                else p.ParamByName('d_date_end').AsDate := i['d_date_end'].AsVariant;
  if VarIsNull(i['d_not_summa'].AsVariant) then p.ParamByName('d_not_summa').AsInteger := 0
                                else p.ParamByName('d_not_summa').AsInteger := i['d_not_summa'].AsInteger;
  if VarIsNull(i['d_fio_dongu'].AsVariant) then p.ParamByName('d_fio_dongu').AsString := ''
                                else p.ParamByName('d_fio_dongu').AsString := i['d_fio_dongu'].AsString;
  if VarIsNull(i['d_fio_postav'].AsVariant) then p.ParamByName('d_fio_postav').AsString := ''
                                else p.ParamByName('d_fio_postav').AsString := i['d_fio_postav'].AsString;
  if VarIsNull(i['d_continue'].AsVariant) then p.ParamByName('d_continue').AsInteger := 0
                                else p.ParamByName('d_continue').AsInteger := i['d_continue'].AsInteger;
  if VarIsNull(i['d_close'].AsVariant) then p.ParamByName('d_close').AsInteger := 0
                                else p.ParamByName('d_close').AsInteger := i['d_close'].AsInteger;
  if VarIsNull(i['d_kod_dog'].AsVariant) then p.ParamByName('d_kod_dog').AsVariant := 0
                                else p.ParamByName('d_kod_dog').AsInt64 := i['d_kod_dog'].AsInt64;
  if VarIsNull(i['d_sum_fulfil'].AsVariant) then p.ParamByName('d_sum_fulfil').AsCurrency := 0
                                else p.ParamByName('d_sum_fulfil').AsCurrency := i['d_sum_fulfil'].AsCurrency;
  if VarIsNull(i['d_sum_opl'].AsVariant) then p.ParamByName('d_sum_opl').AsCurrency := 0
                                else p.ParamByName('d_sum_opl').AsCurrency := i['d_sum_opl'].AsCurrency;
  if VarIsNull(i['d_sum_pay'].AsVariant) then p.ParamByName('d_sum_pay').AsCurrency := 0
                                else p.ParamByName('d_sum_pay').AsCurrency := i['d_sum_pay'].AsCurrency;
  if VarIsNull(i['d_nds_pay'].AsVariant) then p.ParamByName('d_nds_pay').AsCurrency := 0
                                else p.ParamByName('d_nds_pay').AsCurrency := i['d_nds_pay'].AsCurrency;
  if VarIsNull(i['d_id_man'].AsVariant) then p.ParamByName('d_id_man').AsVariant := Null
                                else p.ParamByName('d_id_man').AsInt64 := i['d_id_man'].AsInt64;
  if VarIsNull(i['d_id_user'].AsVariant) then
  begin
    o['Message'].AsString := 'Не передан пользователь: d_id_user';
    p.Transaction.Rollback;
    exit;
  end else p.ParamByName('d_id_user').AsInteger := i['d_id_user'].AsInteger;
  if VarIsNull(i['d_ip_comp'].AsVariant) then p.ParamByName('d_ip_comp').AsString := GetIPAddress
                                else p.ParamByName('d_ip_comp').AsString := i['d_ip_comp'].AsString;
  if VarIsNull(i['d_name_comp'].AsVariant) then p.ParamByName('d_name_comp').AsString := GetCompName
                                else p.ParamByName('d_name_comp').AsString := i['d_name_comp'].AsString;
  if VarIsNull(i['d_id_man_suppl'].AsVariant) then p.ParamByName('d_id_man_suppl').AsVariant := Null
                                else p.ParamByName('d_id_man_suppl').AsInt64 := i['d_id_man_suppl'].AsInt64;
  if VarIsNull(i['d_id_man_cust'].AsVariant) then p.ParamByName('d_id_man_cust').AsVariant := Null
                                else p.ParamByName('d_id_man_cust').AsInt64 := i['d_id_man_cust'].AsInt64;
  if VarIsNull(i['d_id_otdel'].AsVariant) then p.ParamByName('d_id_otdel').AsVariant := Null
                                else p.ParamByName('d_id_otdel').AsInt64 := i['d_id_otdel'].AsInt64;
  if VarIsNull(i['d_is_project'].AsVariant) then p.ParamByName('d_is_project').AsInteger := 0
                                else p.ParamByName('d_is_project').AsInteger := i['d_is_project'].AsInteger;
  if VarIsNull(i['d_comment'].AsVariant) then p.ParamByName('d_comment').AsString := ''
                                else p.ParamByName('d_comment').AsString := i['d_comment'].AsString;
  if VarIsNull(i['d_id_class'].AsVariant) then p.ParamByName('d_id_class').AsVariant := Null
                                else p.ParamByName('d_id_class').AsInt64 := i['d_id_class'].AsInt64;

  try
    p.ExecProc;
  except
    on E: Exception do
    begin
      o['Message'].AsString := e.Message;
      p.Transaction.Rollback;
      exit;
    end;
  end;
  o['ID_DOG'].AsInt64 := p['VIX_ID_DOG'].AsInt64;
  p.Close;

  //Добавляем сметы
  if not VarIsNull(i['SMET']['Count'].AsVariant) then
  begin
    cnt := i['SMET']['Count'].AsInteger;
    for smt := 0 to cnt - 1 do
    begin
      p.StoredProcName := 'DOG_DT_SMET_INSERT';
      p.Prepare;
      p.ParamByName('D_ID_DOG').AsInt64 := o['ID_DOG'].AsInt64;
      if VarIsNull(i['SMET'][smt]['d_id_smeta'].AsVariant) then
      begin
        o['Message'].AsString := 'Не передана смета, поле: d_id_smeta';
        p.Transaction.Rollback;
        exit;
      end else p.ParamByName('d_id_smeta').AsInt64 := i['SMET'][smt]['d_id_smeta'].AsInt64;

      if VarIsNull(i['SMET'][smt]['d_id_stat'].AsVariant) then
      begin
        o['Message'].AsString := 'Не переданf статья, поле: d_id_stat';
        p.Transaction.Rollback;
        exit;
      end else p.ParamByName('d_id_stat').AsInt64 := i['SMET'][smt]['d_id_stat'].AsInt64;
      if VarIsNull(i['SMET'][smt]['d_razd'].AsVariant) then
      begin
        o['Message'].AsString := 'Не передан раздел, поле: d_razd';
        p.Transaction.Rollback;
        exit;
      end else p.ParamByName('d_razd').AsInt64 := i['SMET'][smt]['d_razd'].AsInt64;
      if VarIsNull(i['SMET'][smt]['d_summa_sm'].AsVariant) then
                                                  p.ParamByName('d_summa_sm').AsCurrency := 0
                                                           else
                                                  p.ParamByName('d_summa_sm').AsCurrency := i['SMET'][smt]['d_summa_sm'].AsCurrency;
      if VarIsNull(i['SMET'][smt]['d_id_people'].AsVariant) then
                                                  p.ParamByName('d_id_people').AsVariant := Null
                                                           else
                                                  p.ParamByName('d_id_people').AsInt64 := i['SMET'][smt]['d_id_people'].AsInt64;
      if VarIsNull(i['SMET'][smt]['d_id_kekv'].AsVariant) then
      begin
        o['Message'].AsString := 'Не передан КЕКВ, поле: d_id_kekv';
        p.Transaction.Rollback;
        exit;
      end else p.ParamByName('d_id_kekv').AsInt64 := i['SMET'][smt]['d_id_kekv'].AsInt64;

      if VarIsNull(i['SMET'][smt]['ID_DOG_BANKCARD'].AsVariant) then
      begin
       p.ParamByName('D_ID_DOG_BANKCARD').asVariant := Null
      end else p.ParamByName('D_ID_DOG_BANKCARD').AsInt64 := i['SMET'][smt]['ID_DOG_BANKCARD'].AsInt64;

     try
      p.ExecProc;
     except
      on E: Exception do
      begin
        o['Message'].AsString := e.Message;
        p.Transaction.Rollback;
        exit;
      end;
     end;
     p.Close;

    end;
  end;

  p.Transaction.Commit;
  o['Result'].AsVariant := true;
  o['Message'].AsString := 'OK';
end;


procedure dog_close_dogovor_ext(const i : TAArray; var o : TAArray);
var
  q : TpFIBQuery;
begin
  o['Result'].AsVariant := false;
  if i['Database'].AsObject = Nil then
  begin
    o['Message'].AsString := 'Некорректно передан handle базы данных';
    exit;
  end;
  if i['Transaction'].AsObject = Nil then
  begin
    o['Message'].AsString := 'Некорректно передан handle транзакции';
    exit;
  end;

  if VarIsNull(i['id_dog'].AsVariant) then
  begin
    o['Message'].AsString := 'Не передан идентификатор договора: id_dog';
    q.Transaction.Rollback;
    exit;
  end;

  q := TpFIBQuery.Create(Nil);
  q.Database := TFIBDatabase(i['Database'].asObject);
  q.Transaction := TFIBTransaction(i['Transaction'].asObject);
  q.Transaction.StartTransaction;
  q.SQL.Text := 'update dog_dt_document set dog_close = 1 where id_dog = :id_dog';
  q.Prepare;
  q.ParamByName('id_dog').AsInt64 := i['id_dog'].AsInt64;

     try
      q.ExecQuery;
     except
      on E: Exception do
      begin
        o['Message'].AsString := e.Message;
        q.Transaction.Rollback;
        exit;
      end;
     end;

  q.Transaction.Commit;
  o['Result'].AsVariant := true;
  o['Message'].AsString := 'OK';
end;


procedure CheckInteger(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13]) then Key := #0;
end;

procedure CheckFloat(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13, DecimalSeparator]) then Key := #0;
end;

function isInteger(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  CheckInteger(k);
  if k = #0 then exit;
 end;
 Result := true;
end;

function isFloat(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  CheckFloat(k);
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;

procedure agShowMessage(const Text : string);
begin
 ShowMessage(Text);
end;

procedure LoadSprav(const BplName : string; Owner : TComponent; input : TSpravParams; output : TSpravParams);
var
 SprProc : TSpravProc;
 HandlePack: HModule;
begin
 HandlePack:=GetModuleHandle(PAnsiChar(BplName));
 if HandlePack < 32 then
 begin
   Screen.Cursor:=crHourGlass;
   HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + BplName);
   Screen.Cursor:=crDefault;
 end;
 if HandlePack > 0 then
 begin
   @SprProc:=GetProcAddress(HandlePack, PChar('Load'));
   try
    if @SprProc <> nil then SprProc(Owner, @input, @output);
   except
    on E: Exception do agShowMessage('Произошла ошибка при вызове справочника: ' + BplName + #13 + E.Message);
   end
 end
 else agShowMessage('Ошибка загрузки bpl: ' + BplName);
end;

function agCurrToStr(const cur : currency) : string;
begin
 Result := CurrToStrF(cur, ffFixed, SYS_DIGITS_AFTER_DOT);
end;

function RemoveApostrof(const s : string) : string;
begin
 Result := StringReplace(s, '''', '''''', [rfReplaceAll]);
end;

function GetCompName : string;
var
 s : string;
 sLen : Longword;
begin
 SetLength(s, 255);
 sLen := 255;
 GetHostName(@s[1], sLen);
 Result := Trim(StrPas(PAnsiChar(s)));
end;

function GetIPAddress : string;
var
  wVerReq: WORD;
  wsaData: TWSAData;
  i: pchar;
  h: PHostEnt;
  c: array[0..128] of char;
begin
  wVerReq := MAKEWORD(1, 1);
  WSAStartup(wVerReq, wsaData);
  {Получаем хост (имя) компа}
  GetHostName(@c, 128);
  h := GetHostByName(@c);
//  Host.Caption := h^.h_Name; //Host отображает хост(имя) компьютера
  {Достаем IP}
  i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
  Result := i; //Теперь IPaddr отображает IP-адрес
  WSACleanup;
end;


function CheckAccount(acc, mfo : string) : boolean;
const
 dstr = '1371337137137137137';
var
 str, res : string;
 i, a, b  : integer;
 c        : string;
 k        : integer;
 check_n  : string;
begin
 Result := false;
 if Length(mfo) > 6 then exit;
 if Length(acc) < 6 then exit;
 if Length(acc) > 14 then exit;
 if mfo = '' then exit;
 if length(mfo) = 6 then mfo := Copy(mfo, 1, Length(mfo) - 1);
 check_n := acc[5];
 acc[5] := 'B';
 str := mfo + acc;
 for i := 1 to Length(str) do begin
  if str[i] in ['0'..'9'] then a := StrToInt(str[i]) else a := 0;
  b := StrToInt(dstr[i]);
  c := IntToStr(a * b);
  res := res + c[Length(c)];
 end;
 k := 0;
 for i := 1 to Length(res) do k := k + StrToInt(res[i]);
 k := k + Length(acc);
 c := IntToStr(k);
 c := c[Length(c)];
 k := StrToInt(c) * 7;
 c := IntToStr(k);
 c := c[Length(c)];
 Result := c = check_n;
end;

function ImportCustomer(cust : TImportCustomer; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
var
  HandlePack: HModule;
  icFunc   : function (cust : TImportCustomer; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;stdcall;
begin
  HandlePack:=GetModuleHandle('custpackage.bpl');
  if HandlePack<32 then begin
   Screen.Cursor:=crHourGlass;
   HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Customer\CustPackage.bpl');
   Screen.Cursor:=crDefault;
  end;
  if HandlePack > 0 then begin
   @icFunc:=GetProcAddress(HandlePack,PChar('cust_ImportCustomer'));
   if @icFunc<>nil then Result:=icFunc(cust, AOwner, DBHandle, WTrans);
  end else Result := false;
end;

function ImportCustRateAcc(cust_rate_acc : TImportCustRateAcc; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
var
  HandlePack: HModule;
  icFunc   : function (cust_rate_acc : TImportCustRateAcc; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;stdcall;
begin
  HandlePack:=GetModuleHandle('custpackage.bpl');
  if HandlePack<32 then begin
   Screen.Cursor:=crHourGlass;
   HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Customer\CustPackage.bpl');
   Screen.Cursor:=crDefault;
  end;
  if HandlePack > 0 then begin
   @icFunc:=GetProcAddress(HandlePack,PChar('cust_ImportCustRateAcc'));
   if @icFunc<>nil then Result:=icFunc(cust_rate_acc, AOwner, DBHandle, WTrans);
  end else Result := false;
end;


function ImportBank(bank : TImportBank; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
var
  HandlePack: HModule;
  icFunc   : function (bank : TImportBank; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;stdcall;
begin
  HandlePack:=GetModuleHandle('SpBankPac.bpl');
  if HandlePack<32 then begin
   Screen.Cursor:=crHourGlass;
   HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Customer\SpBankPac.bpl');
   Screen.Cursor:=crDefault;
  end;
  if HandlePack > 0 then begin
   @icFunc:=GetProcAddress(HandlePack,PChar('bank_ImportBank'));
   if @icFunc<>nil then Result:=icFunc(bank, AOwner, DBHandle, WTrans);
  end else Result := false;
end;

function MessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
var
 form : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 form := CreateMessageDialog(Msg, DlgType, Buttons);
 form.Caption := Caption;
 for i := 0 to form.ComponentCount - 1 do if form.Components[i] is TButton then begin
  if UpperCase(TButton(form.Components[i]).Caption) = 'OK' then TButton(form.Components[i]).Caption := 'Прийняти';
  if UpperCase(TButton(form.Components[i]).Caption) = 'CANCEL' then TButton(form.Components[i]).Caption := 'Відмінити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&YES' then TButton(form.Components[i]).Caption := 'Так';
  if UpperCase(TButton(form.Components[i]).Caption) = '&NO' then TButton(form.Components[i]).Caption := 'Ні';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ABORT' then TButton(form.Components[i]).Caption := 'Відмінити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&RETRY' then TButton(form.Components[i]).Caption := 'Повторити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&IGNORE' then TButton(form.Components[i]).Caption := 'Ігнорувати';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ALL' then TButton(form.Components[i]).Caption := 'Все';
  if UpperCase(TButton(form.Components[i]).Caption) = '&HELP' then TButton(form.Components[i]).Caption := 'Допомога';
  if UpperCase(TButton(form.Components[i]).Caption) = 'N&O TO ALL' then TButton(form.Components[i]).Caption := 'Ні для всіх';
  if UpperCase(TButton(form.Components[i]).Caption) = 'YES TO &ALL' then TButton(form.Components[i]).Caption := 'Так для всіх';
  end;
 Result := form.ShowModal;
end;

procedure ShowMessage(const Msg : string);
begin
  MessageDlg('Увага', Msg, mtWarning, [mbOk]);
end;

procedure Test;
begin
 PCHAR(nil)^ := 'a';
end;

procedure LoadPositionFromRegistry(Form : TForm);
var
 r : TRegistry;
 s : string;
begin
 if Form.WindowState = wsMaximized then exit;
 r := TRegistry.Create;
 try
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey(REG_KEY + Form.Name, true);
  s := r.ReadString('Left');
  if s <> '' then Form.Left := StrToInt(s);
  s := r.ReadString('Top');
  if s <> '' then Form.Top := StrToInt(s);
  s := r.ReadString('Width');
  if s <> '' then Form.Width := StrToInt(s);
  s := r.ReadString('Height');
  if s <> '' then Form.Height := StrToInt(s);
 except
 end;
 r.Free;
end;

procedure SavePositionToRegistry(Form : TForm);
var
 r : TRegistry;
 s : string;
begin
 if Form.WindowState = wsMaximized then exit;
 r := TRegistry.Create;
 try
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey(REG_KEY + Form.Name, true);
  r.WriteString('Left', IntToStr(Form.Left));
  r.WriteString('Top', IntToStr(Form.Top));
  r.WriteString('Width', IntToStr(Form.Width));
  r.WriteString('Height', IntToStr(Form.Height));
 except
 end;
 r.Free;
end;

function ShowCustomersSprav(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : integer = -1):Variant; stdcall;
var
  HandlePack: HModule;
  MDIFUNC   : function (AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : integer = -1):Variant;stdcall;
begin
 ShowMessage('Внимание! Старый вызов контрагентов. Обратитесь к разработчику.');
  HandlePack:=GetModuleHandle('custpackage.bpl');
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Customer\CustPackage.bpl');
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetCustomersWithPos'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner, DBHANDLE, fs, ActualDate, SeleMode, id_customer, id_rate_acc, multi_select, id_session);
  end
  else begin
//            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkTypeDogSPRbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
end;

function ShowCustomersSprav1(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : integer = -1; const show_dep: boolean = false):Variant; stdcall;
var
  HandlePack: HModule;
  MDIFUNC   : function (AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : integer = -1;  show_dep: boolean = false):Variant;stdcall;
begin
  ShowMessage('Внимание! Старый вызов контрагентов. Обратитесь к разработчику.');
  HandlePack:=GetModuleHandle('custpackage.bpl');
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Customer\CustPackage.bpl');
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetCustomersWithDep'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner, DBHANDLE, fs, ActualDate, SeleMode, id_customer, id_rate_acc, multi_select, id_session, show_dep);
  end
  else begin
//            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkTypeDogSPRbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
end;


// function ShowCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : int64 = -1; const show_dep: boolean = true):Variant; stdcall;

function ShowCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : int64 = -1; const show_dep: boolean = true):Variant; stdcall;
var
  HandlePack: HModule;
  MDIFUNC   : function (AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : int64 = -1;  show_dep: boolean = false):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle('custpackage.bpl');
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Customer\CustPackage.bpl');
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetCustomersWithDep'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner, DBHANDLE, fs, ActualDate, SeleMode, id_customer, id_rate_acc, multi_select, id_session, show_dep);
  end
  else begin
//            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkTypeDogSPRbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
end;

function CheckAccess(Path:string;Action:String;
                      DisplayMessage:Boolean=False):Integer;
var
i:Integer;
begin
i:=0;
  if (not isAdmin) then
    begin

          i:=CheckPermission(Path,Action);
            if i<>0 then
              begin
                if DisplayMessage then
                  MessageDlg('Увага', AcMgmtErrMsg(i),mtError,[mbOk]);
              end;

    end;
  CheckAccess:=i;
end;

function ShowDogMain(input_params : TDogInput) : TDogResult;
var
 HandlePack : HModule;
 MDIFunc    : function(input_params : TDogInput) : TDogResult;stdcall;
begin
 Result.ModalResult := mrCancel;
 HandlePack := GetModuleHandle(DogMainBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+DogMainBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(input_params);
 end else MessageBox(TForm(input_params.Owner).Handle,PChar(LoadErrorG+DogMainBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

function ShowZayav(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant;
var
 HandlePack : HModule;
 MDIFunc    : function(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant;stdcall;
begin
 Result := NULL;
 HandlePack := GetModuleHandle(ZayavBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+ZayavBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(AOwner, DBHANDLE, RTrans, WTrans, FS);
 end else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+ZayavBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

function ShowPlat(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const _id_reestr : integer = -1; const dog_reg_num : string = '') : variant;
var
 HandlePack : HModule;
 MDIFunc    : function(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const _id_reestr : integer = -1; const dog_reg_num : string = '') : variant;stdcall;
begin
 Result := NULL;
 HandlePack := GetModuleHandle(PlatBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+PlatBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(AOwner, DBHANDLE, RTrans, WTrans, FS, _id_reestr, dog_reg_num);
 end else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+PlatBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

function ShowRep(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant;
var
 HandlePack : HModule;
 MDIFunc    : function(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant;stdcall;
begin
 Result := NULL;
 HandlePack := GetModuleHandle(RepBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+RepBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(AOwner, DBHANDLE, RTrans, WTrans, FS);
 end else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+PlatBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

function ShowDogPayFulfil(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const id_dog, exclude_id_doc : int64) : variant;
var
 HandlePack : HModule;
 MDIFunc    : function(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const id_dog, exclude_id_doc : int64) : variant;stdcall;
begin
 Result := NULL;
 HandlePack := GetModuleHandle(PayFulfilBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+PayFulfilBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(AOwner, DBHANDLE, RTrans, WTrans, FS, id_dog, exclude_id_doc);
 end else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+PayFulfilBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

function ShowRee(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; in_param, out_param : TAArray) : variant;
var
 HandlePack : HModule;
 MDIFunc    : function(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; in_param, out_param : TAArray) : variant;stdcall;
begin
 Result := NULL;
 HandlePack := GetModuleHandle(ReeBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+ReeBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(AOwner, DBHANDLE, RTrans, WTrans, FS, in_param, out_param);
 end else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+ReeBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

procedure LoadSysData(ReadTransaction : TpFIBTransaction);
var
 ds : TpFIBDataSet;
begin
 ds := TpFIBDataSet.Create(Nil);
 ds.Transaction := ReadTransaction;
 try
  ds.SelectSQL.Text := 'select id_group from dog_ini_def_group where id = 1';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_GROUP']) then SYS_ID_GROUP_DOG := ds['ID_GROUP'];
  ds.Close;

  ds.SelectSQL.Text := 'select id_group from dog_ini_def_group where id = 2';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_GROUP']) then SYS_ID_GROUP_ZAYAV := ds['ID_GROUP'];
  ds.Close;

  ds.SelectSQL.Text := 'select id_group from dog_ini_def_group where id = 3';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_GROUP']) then SYS_ID_GROUP_DOG_VIEW := ds['ID_GROUP'];
  ds.Close;

  ds.SelectSQL.Text := 'select id_group from dog_ini_def_group where id = 4';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_GROUP']) then SYS_ID_GROUP_ZAYAV_VIEW := ds['ID_GROUP'];
  ds.Close;

{  ds.SelectSQL.Text := 'select distinct SERVER_TITLE from PUB_SYS_DATA';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['SERVER_TITLE']) then SYS_NAME_CUSTOMER_NATIVE := ds['SERVER_TITLE'];
  ds.Close;}

  ds.SelectSQL.Text := 'select t.id_tip_dog from   dog_dt_group_doc g, pub_sp_tip_dog t, dog_group_tip_dog gt, dog_ini_def_group i ' +
                       'where  i.id_group=g.id_group_doc and i.id=7 and g.id_group_doc=gt.id_group_doc ' +
                       'and t.id_tip_dog=gt.id_tip_dog and  gt.value_group=1';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_TIP_DOG']) then SYS_ID_PREDOPL := ds['ID_TIP_DOG'];
  ds.Close;

  ds.SelectSQL.Text := 'select t.id_tip_dog from dog_dt_group_doc g, pub_sp_tip_dog t, dog_group_tip_dog gt, dog_ini_def_group i ' +
                       'where  i.id_group=g.id_group_doc and i.id=6 and g.id_group_doc=gt.id_group_doc ' +
                       'and t.id_tip_dog=gt.id_tip_dog and gt.value_group=1';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_TIP_DOG']) then SYS_ID_SMETA := ds['ID_TIP_DOG'];
  ds.Close;

{  ds.SelectSQL.Text := 'select id_user from users where ID_USER_EXT = ' + IntToStr(CurrentID_PCARD);
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_USER']) then SYS_ID_USER := ds['ID_USER'];
  ds.Close;}

  ds.SelectSQL.Text := 'select USE_ID_DEP_IN_CUST from DOG_SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['USE_ID_DEP_IN_CUST']) then SYS_USE_DEP_IN_CUST := ds['USE_ID_DEP_IN_CUST'];
  ds.Close;

  ds.SelectSQL.Text := 'select IS_CH from DOG_SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['IS_CH']) then SYS_IS_CH := ds['IS_CH'] = 1;
  ds.Close;

  ds.SelectSQL.Text := 'select ID_TYPE_ACCOUNT from pub_sys_data';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_TYPE_ACCOUNT']) then SYS_ID_TYPE_ACCOUNT := ds['ID_TYPE_ACCOUNT'];
  ds.Close;

  ds.SelectSQL.Text := 'select NAME_TYPE_ACCOUNT from pub_ini_type_account where id_type_account = '+IntToStr(Sys_id_type_account);
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['NAME_TYPE_ACCOUNT']) then SYS_NAME_TYPE_ACCOUNT := ds['NAME_TYPE_ACCOUNT'];
  ds.Close;

  ds.SelectSQL.Text := 'select KOD_VAL from Dog_sys_options';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['KOD_VAL']) then SYS_KOD_VAL := ds['KOD_VAL'];
  ds.Close;

  ds.SelectSQL.Text := 'select CITY from PUB_SYS_DATA';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['CITY']) then SYS_CITY := ds['CITY'];
  ds.Close;

  ds.SelectSQL.Text := 'select ID_SERVER from PUB_SYS_DATA';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ID_SERVER']) then SYS_SERVER := ds['ID_SERVER'];
  ds.Close;

  ds.SelectSQL.Text := 'select DOG_PERIOD from DOG_SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['DOG_PERIOD']) then SYS_DOG_PERIOD := ds['DOG_PERIOD'];
  ds.Close;

  ds.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['NAME']) then SYS_NAME_CUSTOMER_NATIVE := ds['NAME'];
  ds.Close;

  ds.SelectSQL.Text := 'select DOG_DISABLED from DOG_SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['DOG_DISABLED']) then if ds['DOG_DISABLED'] = 1 then SYS_DOG_DISABLED := True else SYS_DOG_DISABLED := false;
  ds.Close;

  ds.SelectSQL.Text := 'select IS_DONNU from DOG_SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['IS_DONNU']) then if ds['IS_DONNU'] = 1 then SYS_IS_DONNU := True else SYS_IS_DONNU := false;
  ds.Close;

  ds.SelectSQL.Text := 'select ISDNEPR from DOG_SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['ISDNEPR']) then SYS_IS_DNEPR := ds['ISDNEPR'];
  ds.Close;

  ds.SelectSQL.Text := 'select INFINITY_DATE from PUB_SYS_DATA';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['INFINITY_DATE']) then SYS_MAX_TIMESTAMP := ds['INFINITY_DATE'] else SYS_MAX_TIMESTAMP := StrToDate('31.12.9999');
  ds.Close;

  ds.SelectSQL.Text := 'select LOCAL_DEPARTMENT from INI_ASUP_CONSTS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['LOCAL_DEPARTMENT']) then SYS_DEF_ID_DEPARTMENT := ds['LOCAL_DEPARTMENT'];
  ds.Close;

  ds.SelectSQL.Text := 'select CURRENT_DEPARTMENT from INI_ASUP_CONSTS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['CURRENT_DEPARTMENT']) then SYS_DEF_ID_DEPARTMENT2 := ds['CURRENT_DEPARTMENT'];
  ds.Close;

  ds.SelectSQL.Text := 'select CURRENT_DEPARTMENT from INI_ASUP_CONSTS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['CURRENT_DEPARTMENT']) then SYS_CURRENT_DEPARTMENT := ds['CURRENT_DEPARTMENT'];
  ds.Close;

  ds.SelectSQL.Text := 'select NAME_FULL from SP_DEPARTMENT where id_department = ' + IntToStr(SYS_DEF_ID_DEPARTMENT) + ' and use_end >= ''01.01.2050''';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['NAME_FULL']) then SYS_DEF_NAME_DEPARTMENT := ds['NAME_FULL'];
  ds.Close;

  ds.SelectSQL.Text := 'select DEF_UNIT_MEAS from SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['DEF_UNIT_MEAS']) then SYS_DEF_UNIT_MEAS := ds['DEF_UNIT_MEAS'] else SYS_DEF_UNIT_MEAS := -1;
  ds.Close;

  ds.SelectSQL.Text := 'select DEF_UNIT_MEAS_SUM from SYS_OPTIONS';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['DEF_UNIT_MEAS_SUM']) then SYS_DEF_UNIT_MEAS_SUM := ds['DEF_UNIT_MEAS_SUM'] else SYS_DEF_UNIT_MEAS_SUM := -1;
  ds.Close;

  ds.SelectSQL.Text := 'select * from ini_unit_meas where id_unit_meas = ' + IntToStr(SYS_DEF_UNIT_MEAS);
  ds.Open;
  if ds.RecordCount <> 0 then
  begin
    if not VarIsNull(ds['SHORT_NAME']) then SYS_DEF_NAME_UNIT_MEAS := ds['NAME_UNIT_MEAS'] else SYS_DEF_NAME_UNIT_MEAS := '';
    if not VarIsNull(ds['COEFFICIENT']) then SYS_DEF_UNIT_MEAS_COEF := ds['COEFFICIENT'] else SYS_DEF_UNIT_MEAS_COEF := 0;
  end;
  ds.Close;

  ds.SelectSQL.Text := 'select * from ini_unit_meas where id_unit_meas = ' + IntToStr(SYS_DEF_UNIT_MEAS_SUM);
  ds.Open;
  if ds.RecordCount <> 0 then
  begin
    if not VarIsNull(ds['SHORT_NAME']) then SYS_DEF_NAME_UNIT_MEAS_SUM := ds['NAME_UNIT_MEAS'] else SYS_DEF_NAME_UNIT_MEAS_SUM := '';
    if not VarIsNull(ds['COEFFICIENT']) then SYS_DEF_UNIT_MEAS_SUM_COEF := ds['COEFFICIENT'] else SYS_DEF_UNIT_MEAS_SUM_COEF := 0;
  end;
  ds.Close;


  ds.Free;
 except
  ShowMessage('Внимание! Невозможно загрузить параметры по умолчанию. Обратитесь к разработчику.' + #13 + 'Модуль LoadDog.bpl, DogLoaderUnit.pas, процедура LoadSysData');
  ds.Free;
 end;
end;

procedure GetDogovorPayFulfil(const id_dog : integer; var pay, fulfil : Currency; ReadTransaction : TpFIBTransaction);
var
 ds : TpFIBDataSet;
begin
 fulfil := 0;
 pay := 0;
 ds := TpFIBDataSet.Create(Nil);
 ds.Transaction := ReadTransaction;
 try
  ds.SelectSQL.Text := 'select SUM(SUM_DOG) from PROC_DOG_DT_DOC_PAY_FULFIL_ALL(' + IntToStr(id_dog) + ', 1)';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['SUM']) then pay := ds['SUM'];
  ds.Close;

  ds.SelectSQL.Text := 'select SUM(SUM_DOG) from PROC_DOG_DT_DOC_PAY_FULFIL_ALL(' + IntToStr(id_dog) + ', 0)';
  ds.Open;
  if ds.RecordCount <> 0 then if not VarIsNull(ds['SUM']) then fulfil := ds['SUM'];
  ds.Close;
 except
  exit;
 end;
end;

function ShowFilterForm(AOwner : TForm; const Capt : string; DBTableView : TcxGridDBTableView; const Fields : array of string; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE) : HWND; stdcall;
var
 HandlePack : HModule;
 func   : function (AOwner : TForm; const Capt : string; DBTableView : TcxGridDBTableView; const Fields : array of string; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE) : HWND; stdcall;
begin
 Result := 0;
 HandlePack := GetModuleHandle(FilterBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+ PathDogovor+ FilterBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @func := GetProcAddress(HandlePack, PChar('ShowFilter'));
  if @func <> nil then Result := func(AOwner, Capt, DBTableView, Fields, DBHandle, RTrans, WTrans);
 end else MessageBox(0,PChar(LoadErrorG+FilterBpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;


{ TSpravParams }

procedure TSpravParams.ApplyOnForm(frm : TForm);
begin
 frm.FormStyle := Values['FormStyle'];
end;

constructor TSpravParams.Create;
begin
  inherited;
  fValues := nil;
  fNames  := nil;
end;

destructor TSpravParams.Destroy;
begin
  fValues := nil;
  fNames  := nil;
  inherited;
end;

function TSpravParams.GetName(Index: Integer): string;
begin
 Result := '';
 if ParamCount = 0 then Exit;
 if Index > ParamCount - 1 then Exit;
 Result := fNames[Index];
end;

function TSpravParams.GetParam(param_name: string): Variant;
var
 i : Integer;
begin
 Result := Null;
 i := IndexOf(param_name);
 if i <> -1 then Result := fValues[i];
end;

function TSpravParams.GetParamCount: Integer;
begin
 Result := Length(fValues);
end;

function TSpravParams.IndexOf(const param_name: string): Integer;
var
 i : Integer;
begin
 Result := -1;
 if fNames = nil then Exit;
 for i := 0 to Length(fNames) - 1 do if AnsiUpperCase(fNames[i]) = AnsiUpperCase(param_name) then
 begin
   Result := i;
   Exit;
 end;
end;

procedure TSpravParams.SetParam(param_name: string; val: Variant);
var
 i : Integer;
begin
 i := IndexOf(param_name);
 if i = -1 then
 begin
   SetLength(fValues, ParamCount + 1);
   fValues[ParamCount - 1] := val;
   SetLength(fNames, ParamCount);
   fNames[ParamCount - 1] := param_name;
 end
 else
   fValues[i] := val;
end;


procedure GetDogovorInfo(Owner : TComponent; input : PSpravParams; output : PSpravParams);//рПМХЮБЕФ РПДТПВОХА ЙОЖПТНБГЙА РП ДПЗПЧПТХ
var
 DataBase : TpFIBDatabase;
 Transaction :  TpFIBTransaction;
 DataSet : TpFIBDataSet;
 i  :Integer;
 id_dog, kod_dog : Int64;
begin
 DataBase := TpFIBDatabase.Create(Owner);
 Transaction := TpFIBTransaction.Create(Owner);
 DataSet := TpFIBDataSet.Create(Owner);
 DataBase.SQLDialect := 3;
 DataBase.Handle := PVoid(Integer(input.Values['DataBase']));
 Transaction.Handle := PVoid(Integer(input.Values['ReadTransaction']));
 DataSet.Transaction := Transaction;
 DataSet.Database := DataBase;
 id_dog := input^['ID_DOG'];
 kod_dog := input^['KOD_DOG'];
 DataSet.SelectSQL.Text := 'select * from PROC_DOG_DT_DOCUMENT_GET_INFO(' + IntToStr(id_dog) + ', ' + IntToStr(kod_dog) + ')';
 DataSet.Open;
 for i := 0 to DataSet.FieldCount - 1 do
 begin
   output^[UpperCase(DataSet.Fields[i].FullName)] := DataSet.FieldByName(DataSet.Fields[i].FullName).Value;
 end;
 DataSet.Close;
 DataSet.Free;
 Transaction.Free;
 DataBase.Free;
end;

function IfNull(const variable : Variant; const Value : Variant) : Variant;
begin
  if VarIsNull(variable) then Result := Value else Result := Variable;
end;

procedure ShowSpravParams(AOwner : TComponent; params : TSpravParams);
var
 HandlePack : HModule;
 func   : procedure (AOwner : TComponent; params : TSpravParams); stdcall;
begin
 HandlePack := GetModuleHandle(ShowSPBpl);
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+ PathDogovor+ ShowSPBpl);
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @func := GetProcAddress(HandlePack, PChar('Load'));
  if @func <> nil then func(AOwner, params);
 end else MessageBox(0,PChar(LoadErrorG+'ShowSP.bpl'),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;








INITIALIZATION
begin
 SYS_DEFAULT_DOG_INPUT.Owner        := Nil;
 SYS_DEFAULT_DOG_INPUT.DBHandle     := 0;
 SYS_DEFAULT_DOG_INPUT.WriteTrans   := 0;
 SYS_DEFAULT_DOG_INPUT.ReadTrans    := 0;
 SYS_DEFAULT_DOG_INPUT.FormStyle    := fsMdiChild;
 SYS_DEFAULT_DOG_INPUT.Summa        := 0;
 SYS_DEFAULT_DOG_INPUT.isZayav      := false;
 SYS_DEFAULT_DOG_INPUT.FormCaption  := '';
 SYS_DEFAULT_DOG_INPUT.id_TypeDog   := -1;
 SYS_DEFAULT_DOG_INPUT.id_Group     := -1;
 SYS_DEFAULT_DOG_INPUT.id_Group_add := -1;
 SYS_DEFAULT_DOG_INPUT.id_Customer  := -1;
 SYS_DEFAULT_DOG_INPUT.id_dog       := -1;
 SYS_DEFAULT_DOG_INPUT.id_doc       := -1;
 SYS_DEFAULT_DOG_INPUT.MFO          := '';
 SYS_DEFAULT_DOG_INPUT.RateAcc      := '';
 SYS_DEFAULT_DOG_INPUT.DateSys      := now;
 SYS_DEFAULT_DOG_INPUT.NumDoc       := '';
 SYS_DEFAULT_DOG_INPUT.DateDoc      := 0;
 SYS_DEFAULT_DOG_INPUT.lInfo.summa  := 0;
 SYS_DEFAULT_DOG_INPUT.lInfo.name_customer := '';
 SYS_DEFAULT_DOG_INPUT.lInfo.rate_acc := '';
 SYS_DEFAULT_DOG_INPUT.filter.bUseFilter := false;
 SYS_DEFAULT_DOG_INPUT.filter.bShowFilterForm := false;
 SYS_DEFAULT_DOG_INPUT.filter.RegNum := '';
 SYS_DEFAULT_DOG_INPUT.filter.bRegNum := false;
 SYS_DEFAULT_DOG_INPUT.filter.SummaFrom := 0;
 SYS_DEFAULT_DOG_INPUT.filter.SummaTo := 0;
 SYS_DEFAULT_DOG_INPUT.filter.bSumma  := false;
 SYS_DEFAULT_DOG_INPUT.filter.DateBeg := EncodeDate(YearOf(now), 1, 1);
 SYS_DEFAULT_DOG_INPUT.filter.DateEnd := EncodeDate(YearOf(now), 12, 31);
 SYS_DEFAULT_DOG_INPUT.filter.bDate   := false;
 SYS_DEFAULT_DOG_INPUT.filter.ShowClosed := 0;
 SYS_DEFAULT_DOG_INPUT.filter.NameCust := '';
 SYS_DEFAULT_DOG_INPUT.filter.bNameCust := false;
 SYS_DEFAULT_DOG_INPUT.filter.id_cust := -1;
 SYS_DEFAULT_DOG_INPUT.filter.bID_Cust := false;
 SYS_DEFAULT_DOG_INPUT.filter.NameTipDog := '';
 SYS_DEFAULT_DOG_INPUT.filter.id_tip_dog := -1;
 SYS_DEFAULT_DOG_INPUT.filter.bTipdog := false;

 SYS_DEFAULT_DOG_INPUT.shablon_data.bUse := False;
 SYS_DEFAULT_DOG_INPUT.shablon_data.num := '';
 SYS_DEFAULT_DOG_INPUT.shablon_data.date_dog := now;
 SYS_DEFAULT_DOG_INPUT.shablon_data.note := '';
 SYS_DEFAULT_DOG_INPUT.shablon_data.summa := 0;
 SYS_DEFAULT_DOG_INPUT.shablon_data.id_rate_account := -1;
 SYS_DEFAULT_DOG_INPUT.shablon_data.id_rate_acc_native := -1;


 SYS_CURRENT_DATE := now;
// SYS_MAX_TIMESTAMP := StrToDate('30.12.9999');
end;


end.

