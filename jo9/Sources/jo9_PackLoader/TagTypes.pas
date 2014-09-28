{******************************************************************************}
{*              Автоматизированная система «Учет расчетов с контрагентами»    *}
{*                                    LFMAS                                   *}
{*              (c) Донецкий национальный университет, 2002-2006              *}
{******************************************************************************}

{                  Модуль "Основные типы и функции системы"                    }
{ Содержит информацию необходимую для функционирования системы, а также базовые}
{ функции часто используемые системой.                                         }
{                                              ответственный: Таганский Андрей }

unit TagTypes;

interface
uses pFIBDatabase, pFIBQuery, pFIBStoredProc, pFIBDataSet, Dialogs, FIBDataBase,
     Controls, Forms, IB_Externals, Classes, Registry, Windows, Accmgmt, ExtCtrls,
     DogLoaderUnit, IBase;

const
 REG_KEY = '\Software\FMAS\JO9\';

 ThousandSeparator = #146;

 INI_FILENAME    = 'config.ini';
 DELETE_QUESTION = 'Ви дійсно хочете видалити виділений запис?';
 EMPTY_WARNING   = 'Необхідно заповнити всі дані';
 EXISTS_WARNING  = 'Даний запис використовується в інших довідниках. Видалення неможливе.';
 ST_REMOTE       = 0;//Server type
 ST_LOCAL        = 1;

 JO9_REPORT_MAIN       = 0; // Журнал-ордер №9
 JO9_REPORT_MAIN_MO_2011= 13; // Мемориальный ордер
 JO9_REPORT_MAIN_MO_BASE_2011= 15; // Мемориальный ордер
 JO9_REPORT_REG        = 1; // Реестр документов
 JO9_REPORT_REG_EX     = 12;// Реестр документов (№ п\п, Контрагент, (См,Рз,Ст,Кэкз,) Сумма)
 JO9_REPORT_SCH        = 2; // Аналитическая ведомость движения средств по счетам
 JO9_REPORT_SCH_CUR    = 3; // Расшифровка счетов (обороты)
 JO9_REPORT_SCH_GRP    = 4; // Расшифровка счетов по статьям затрат (группировка Sm\Rz\St\Kekv)
 JO9_REPORT_OST        = 5; // Расшивровка задолженности в разрезе лет
 JO9_REPORT_CUST       = 6; // Ведомость расчетов с контрагентами (для ДнДз)
 JO9_REPORT_MAIN_MO    = 7; // Мемориальный ордер
 JO9_REPORT_SCH_MO     = 8; // МО: Аналитическая ведомость движения средств по счетам
 JO9_REPORT_SCH_CUR_MO = 9; // МО: Расшифровка счетов (обороты)
 JO9_REPORT_REG_MO     = 10;// МО: Реестр документов
 JO9_REPORT_SCH_GRP_MO = 11;// МО: Расшифровка счетов по статьям затрат (группировка Sm\Rz\St\Kekv)
 JO9_AKT_SVERKI        = 14;// акт сверки взаиморасчетов с контрагентами
type
 TAccessResult=record
  Login        : string;
  Pswrd        : string;
  Name_User    : string;
  ID_User      : integer;
  User_Id_Card : integer;
  User_Fio     : string;
  Connection   : TISC_DB_HANDLE;
 end;

 TSpecOperMode=(somAdd, somEdit, somView);
 TStringArray = array of string;
 TPaperFormat = (pfDef, pfA4, pfA3);
 TOstDateKind = (odkAppear, odkMove);

 TJO9_Report_Kind = byte;

 TSchRecord = packed record
  _id_Sch     : integer;
  _Num_Sch    : string;
  _Name_Sch   : string;
  _is_Blocked : boolean;
  _Date_Beg   : TDate;
  _Open_Sch   : TDate;

  _id_Type_Dog   : integer; // Используется только при группировке
  _Num_Type_Dog  : string; //   по типу договоров
  _Name_Type_Dog : string;//       при печати отчета
 end;

 TKekvRecord = packed record
  _id_Kekv   : integer;
  _Kod_Kekv  : string;
  _Name_Kekv : string;
 end;

 TIntArray = array of integer;
 TInt64Array = array of int64;

 TKekvArray = array of TKekvRecord;
 TSpravAction = (saAdd, saMod, saView);
 TResultArray = array of variant;
 TSchArray = array of TSchRecord;

 Tjo9_SYS_INFO = packed record
  _kod_Sys     : string; // код системы
  _id_Server   : integer; // ИД сервера
  _Name_Sys    : string;  // наименование системы
  _Year        : variant; // год периода системы
  _Month       : variant; // месяц периода системы
  _Period_Beg  : TDate;   // дата начала периода системы
  _Period_End  : TDate;   // дата окончания периода системы
  _Sys_Caption : string;  // заголовок отчетно формы Журнал-ордер

  _Sys_Beg     : variant; // дата начала функционирования системы
  _Show_Months : variant; // количество отображаемых месяцев, начиная с текущего периода

  _NOT_DIF_BDG_FG : boolean; // бюджет Дб и Кр в проводках тек. док-ов одинаков
  _WIZARD_FORM_SH : boolean; //
  _INFO_PANEL_SH  : boolean; // показывать инф-ную панель в менеджере проводок

  _id_Reg_Uch     : integer; // регистр учета
  _id_Form_Uch    : integer; // форма учета
  _id_Type_Doc    : integer; // тип док-та
  _Native_Sch     : ^TSchArray; // родные счета
  _Undef_Contr    : variant;    // несколько контрагентов

  _id_User        : integer;    // юзверь системы
  _id_PCard       : integer;    // ИД личной карточки юзверя
  _Name_User      : string;     // его имя
  _Comp_Name      : string;     // имя компа
  _Comp_User      : string;     // юзер компа
  _Admin_Mode     : boolean;    // режим администрирования ???

  _App_Path       : string;     // путь к приложению

  _id_Org         : integer;    // ИД организации
  _Name_Org       : string;     // имя организации
  _Full_Name_Org       : string;     // имя организации

  _id_Group_Dog_View : variant; // ИД группы договоров на просмотр
  _id_Group_Dog_Add  : variant; // ИД группы договоров на добавление

  _Use_Sec_Provs     : boolean; // можно ли добавлять вторые проводки
  _Main_Book_Reg_Uch : integer; // ИД регистра учета главной книги (для добавления вторых проводок)
  _id_Grp_Doc_Auto   : integer; // Идентификатор группы документов, для которых необходимо автоматически генерировать начисления (бухгалтерские) в спец. операциях
  _id_Tip_Doc_Auto   : integer; // Идентификатор типа документов, которым автоматически добавляется документ начислений (спец. операции)

  _id_Dog_Transfer     : variant;//Идентификатор договора, на который автоматически будут перенесены все проводки документов, типы договоров которых не входят в фиксированную группу договоров
  _id_Dog_Transfer_Fix : variant;//Идентификатор договора, на который автоматически будут перенесены все проводки документов, типы договоров которых входят в фиксированную группу договоров

  _Use_MO               : boolean;// Признак того, что в системе используется мемориально-ордерный тип отчетности
 end;

 TForm_Params = packed record
  _Left   : integer;
  _Top    : integer;
  _Width  : integer;
  _Height : integer;
 end;

 Pjo9_SYS_INFO = ^Tjo9_SYS_INFO;

 TSpravOptions = packed record
  canAdd     : boolean;
  canEdit    : boolean;
  canDelete  : boolean;
  canSelect  : boolean;
  canSelect2 : boolean;
  HideButtons : boolean;
  isModal    : boolean;
  MoveUp     : boolean;
  MoveDown   : boolean;
 end;

 TCustRecord = packed record
  _id   : integer;
  _Name : string;
 end;

 TSRecord = packed record
  _id   : integer;
  _kod  : integer;
  _name : string;
 end;

 TDRecord = packed record
  _id   : int64;
 end;

 TRStRecord = packed record
  _id_R  : integer;
  _id_St : integer;
 end;

 TMORecord = packed record
  _id_PKV       : integer;
  _id_Type_Fin  : integer;
  _MO_Char      : string;
  _kod_PKV      : string;
  _kod_Type_Fin : string;
 end;

 TMOArray = array of TMORecord;

 TFilterRecord = packed record
  _PrintKind   : TJO9_Report_Kind;

  _Font_Name : string;
  _Font_Size : integer;

  _Date_Beg  : TDate;
  _Date_End  : TDate;

  _is_Kredit : boolean;

  _PrintOnNewPage : boolean;
  _PrintCurDoc : boolean; // печатать текушие документы или в остатках

  _Customers : array of TCustRecord;
  _Db_Cust   : boolean; // Установить фильтр на дебеторов   в Мемориальном ордере
  _Kr_Cust   : boolean; // Установить фильтр на кредиторов  в Мемориальном ордере

  _RazdSt : array of TRStRecord;
  _Smets  : array of TSRecord;
  _Kekv   : array of TSRecord;
  _Dogs   : array of TDRecord;

  _NSch   : array of TSchRecord;
  _CSch   : array of TSchRecord;

  _DoNote  : boolean;
  _Note_Or : boolean;
  _Note    : TStringArray;

  _GroupByTypeDog : boolean;

  _PaperFormat : TPaperFormat;

  _Gr : array[1..4] of integer;

   // Для отчета по задолженности в разрезе лет
  _OstYear      : integer;
  _OstMonth     : byte;
  _YearByMonths : integer; // Какой год расшифровать помесячно, если -1, то никакой
  _ShowSRStKEKV : boolean; // Показывать расшифровку по См/Рз/Ст/КЕКЗ
  _GroupBySch   : boolean; // Верхний уровень группировки Счет или См/Рз/Ст/КЕКЗ
  _DateKind     : TOstDateKind; // Отбирать по дате возникновения задолженности или по последнему движению средств???
  _ShowSelYear  : boolean; // Признак: отображать ТОЛЬКО год, который расшифровуется помесячно

  _MO_Sel       : TMOArray;
  _CommitTrans  : boolean; // Закомитить траназакцию, которой читаю, чтобы смотреть данные в темповых таблицах
  _PrintSvodTable  : Boolean; //  печать сводной таблицы в акте сверки взаиморасчетов с контрагентом
 end;

 TSPEC_OPER_STRUCTURE = packed record
  AOwner     : TComponent;
  DBHandle   : TISC_DB_HANDLE;
  RTrans     : TISC_TR_HANDLE;
  WTrans     : TISC_TR_HANDLE;
  FS         : TFormStyle;
  Mode       : TSpecOperMode;
  Kredit     : boolean;
  ActualDate : TDate;
  Info       : Pjo9_SYS_INFO;

  pk_id      : int64;        //   necessarily
  id_out_doc : variant;     //      only
  NumDoc     : string;     //            for
  DateDoc    : TDate;     //                view  &
  Note       : string;   //                          edit
 end;
const
 DEF_OPTIONS : TSpravOptions = (canAdd: true; canEdit: true; canDelete: true; canSelect: true; canSelect2: false; HideButtons: false; isModal: true);
var
 APP_PATH         : string;
 DB_PATH          : string;
 DB_USER          : string = 'SYSDBA';
 DB_PASSWORD      : string = 'masterkey';
 DB_SERVER_TYPE   : integer;// 0 - remote  1 - local
 DB_SERVER_NAME   : string;
 CURRENT_USER     : string;
 CURRENT_PASSWORD : string;
 COMPUTER_NAME    : string;
 COMPUTER_USER    : string;
 ID_PROTOCOL      : integer;

 AccessResult     : TAccessResult;

 SYS_INFO         : Tjo9_SYS_INFO;
 KOD_SYS          : string;
 NAME_SYS         : string;
 SYS_YEAR         : variant;
 SYS_MONTH        : variant;
 SYS_CAPTION      : string;
 SYS_REG_UCH      : integer;
 SYS_FORM_UCH     : integer;
 SYS_TYPE_DOC     : integer;
 SYS_NATIVE_SCH   : TSchArray;
 SYS_UNDEF_CONTR  : variant; // Неопределенный контрагент
 ID_GRP_DOC_AUTO  : variant; // Идентификатор группы документов, для которых необходимо автоматически генерировать начисления (бухгалтерские) в спец. операциях
 ID_TIP_DOC_AUTO  : variant; // Идентификатор типа документов, которым автоматически добавляется документ начислений (спец. операции)

 ID_DOG_TRANSFER     : variant; //Идентификатор договора, на который автоматически будут перенесены все проводки документов, типы договоров которых не входят в фиксированную группу договоров
 ID_DOG_TRANSFER_FIX : variant; //Идентификатор договора, на который автоматически будут перенесены все проводки документов, типы договоров которых входят в фиксированную группу договоров

 SYS_ID_ORGANIZATION   : integer;
 SYS_NAME_ORGANIZATION : string;
 SYS_FULL_NAME_ORGANIZATION : string;

 SYS_BEG          : variant;
 SHOW_MONTHS      : variant;

 ID_SERVER         : integer;
 SYS_MAX_TIMESTAMP : TDateTime;
 NOT_DIF_BDG_FG    : boolean;
 WIZARD_FORM_SH    : boolean;
 INFO_PANEL_SH     : boolean;

 CurrentLogin     : string;
 CurrentPassword  : string;
 CurrentID_PCARD  : integer;
 id_User          : integer;
 ADMIN_MODE       : boolean = false;
 NO_PASS_MODE     : boolean = false;

 SYS_ID_GROUP_DOG_V : integer;
 SYS_ID_GROUP_DOG_A : integer;

 SYS_USE_SEC_PROVS   : boolean;
 SYS_MN_BOOK_REG_UCH : integer;

 function  GetLocalComputerName: String;
 function  GetUserName:string;

 procedure CheckInteger(var Key : char);
 procedure CheckFloat(var Key : char);
 function  isFloat(const s : string) : boolean;
 function  isInteger(const s : string) : boolean;

 function  MessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word; overload;
 procedure ShowMessage(const Msg : string); overload;

 procedure ReadIniFile;
 function  ReadSysInfo(ReadTransaction : TpFIBTransaction) : boolean;

 function  GetMonthName(Month : integer; lang : byte = 1) : string;
 function  GetMonth(const from_date, to_date : TDate) : string;

 procedure GetFormParams(InForm : TForm);
 procedure SetFormParams(InForm : TForm);

 procedure WriteProtocolIn(WriteTransaction : TpFIBTransaction);
 procedure WriteProtocolError(WriteTransaction : TpFIBTransaction; Error : string);
 procedure WriteProtocolOut(WriteTransaction : TpFIBTransaction);

 function  GetNativeSch(ReadTransaction : TpFIBTransaction; var s : TSchArray; ActualPeriod : TDate) : boolean;
 procedure WriteSYS_INFO;

 function  CheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;

 function  DoCurrFormat(Curr : string) : string; // Возвращает сумму с разделителем между тысячами

implementation

uses StdCtrls, SysUtils, IniFiles, DateUtils, FIBQuery, Variants, uPwdDeCrypt, jo9_PackageLoader;

function GetLocalComputerName: String;
var
 L : LongWord;
begin
 L := MAX_COMPUTERNAME_LENGTH + 2;
 SetLength(Result, L);
 if Windows.GetComputerName(PChar(Result), L) and (L > 0) then
  SetLength(Result, StrLen(PChar(Result)))
 else
  Result := '';
end;

function GetUserName:string;
var
 Buffer: array[0..MAX_PATH] of Char;
 sz:DWord;
begin
 sz:=MAX_PATH-1;
 if windows.GetUserName(Buffer,sz) then begin
  if sz>0 then dec(sz);
  SetString(Result,Buffer,sz);
 end
 else Result := '';
end;

function GetMonthName(Month : integer; lang : byte = 1) : string;
begin
 if lang = 0 then begin
  case Month of
   1  : Result := 'январь';
   2  : Result := 'февраль';
   3  : Result := 'март';
   4  : Result := 'апрель';
   5  : Result := 'май';
   6  : Result := 'июнь';
   7  : Result := 'июль';
   8  : Result := 'август';
   9  : Result := 'сентябрь';
   10 : Result := 'октябрь';
   11 : Result := 'ноябрь';
   12 : Result := 'декабрь';
  end;
 end
 else begin
  case Month of
   1  : Result := 'січень';
   2  : Result := 'лютий';
   3  : Result := 'березень';
   4  : Result := 'квітень';
   5  : Result := 'травень';
   6  : Result := 'червень';
   7  : Result := 'липень';
   8  : Result := 'серпень';
   9  : Result := 'вересень';
   10 : Result := 'жовтень';
   11 : Result := 'листопад';
   12 : Result := 'грудень';
  end;
 end; 
end;

function GetMonth(const from_date, to_date : TDate) : string;
var
 fy, fm, ty, tm, d1, d2 : word;
begin
 Result := '';
 DecodeDate(from_date, fy, fm, d1);
 DecodeDate(to_date, ty, tm, d2);
 if (DateToStr(EndOfAMonth(fy, fm)) = DateToStr(to_date))
 and (DateToStr(StartOfAMonth(ty, tm)) = DateToStr(from_date)) then Result := GetMonthName(tm);
end;

procedure ReadIniFile;
var
 IniFile : TMemIniFile;
 pwd     : string;
begin
 if not FileExists(APP_PATH + INI_FILENAME) then exit;

 IniFile := TMemIniFile.Create(APP_PATH + INI_FILENAME);

 try
  DB_PATH        := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);
  DB_SERVER_NAME := IniFile.ReadString('CONNECTION', 'Server', '');

  pwd            := IniFile.ReadString('CONNECTION', 'Password_Crypted', '');
  pwd            := PwdDeCrypt(pwd);

  DB_USER        := IniFile.ReadString('CONNECTION', 'User', '');
  DB_PASSWORD    := pwd;
 finally
  IniFile.Free;
 end;

 if DB_SERVER_NAME <> '' then DB_PATH := DB_SERVER_NAME + ':' + DB_PATH;
end;

procedure CheckInteger(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13]) then Key := #0;
end;

procedure CheckFloat(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13, DecimalSeparator]) then Key := #0;
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
  if UpperCase(TButton(form.Components[i]).Caption) = '&ABORT' then TButton(form.Components[i]).Caption := 'Перервати';
  if UpperCase(TButton(form.Components[i]).Caption) = '&RETRY' then TButton(form.Components[i]).Caption := 'Повторить';
  if UpperCase(TButton(form.Components[i]).Caption) = '&IGNORE' then TButton(form.Components[i]).Caption := 'Ігнорувати';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ALL' then TButton(form.Components[i]).Caption := 'Усі';
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

function ReadSysInfo(ReadTransaction : TpFIBTransaction) : boolean;
var
 Query : TpFIBQuery;
 Flag  : boolean;
 DORepeat : boolean;
begin
 Result := False;
 Flag   := True;

 DORepeat := True;

 while DORepeat do begin
  DORepeat := False;

  try
   Query := TpFIBQuery.Create(Nil);
   Query.Transaction := ReadTransaction;
   Query.SQL.Text := 'select * from PUB_SYS_DATA';
   Query.ExecQuery;

   ID_SERVER           := Query['ID_SERVER'].Value;
   SYS_MAX_TIMESTAMP   := Query['INFINITY_DATE'].Value;
   SYS_ID_ORGANIZATION := Query['ORGANIZATION'].Value;

   SYS_INFO._Use_MO     := (Query['USE_MO'].Value = 1);

   Query.Close;

   Query.SQL.Text := 'select *  from JO9_INST where kod_sys='
   + IntToStr(SYS_REG_UCH);
   Query.ExecQuery;

   SYS_YEAR              := Query['SYS_YEAR'].AsInteger;
   SYS_MONTH             := Query['SYS_MONTH'].AsInteger;
   SYS_BEG               := Query['SYS_BEGIN'].AsDate;
   SHOW_MONTHS           := Query['SHOW_MONTHS'].AsInteger;
   SYS_CAPTION           := Query['SYS_CAPTION'].AsString;
   SYS_ID_GROUP_DOG_V    := Query['ID_GROUP_DOG'].AsInteger;
   SYS_ID_GROUP_DOG_A    := Query['ID_GROUP_DOG_ADD'].AsInteger;
   ID_DOG_TRANSFER       := Query['ID_DOG_TRANSFER'].AsVariant;
   ID_DOG_TRANSFER_FIX   := Query['ID_DOG_TRANSFER_FIX'].AsVariant;

   Query.Close;

   Query.SQL.Text := 'select *  from JO9_INI';
   Query.ExecQuery;

   NOT_DIF_BDG_FG    := (Query['NOT_DIF_BDG_FG'].AsString = '1');
   WIZARD_FORM_SH    := (Query['WIZARD_FORM_SH'].AsString = '1');
   INFO_PANEL_SH     := (Query['SHOW_MNG_PANEL'].AsString = '1');
   SYS_UNDEF_CONTR   :=  Query['UNDEF_ID_CUST'].AsInteger;
   ID_GRP_DOC_AUTO   :=  Query['ID_GRP_DOC_AUTO'].AsInteger;
   ID_TIP_DOC_AUTO   :=  Query['ID_TIP_DOC_AUTO'].AsInteger;


   if VarIsNull(Query['USE_SECOND_PROVS'].AsVariant) then SYS_USE_SEC_PROVS := False
   else SYS_USE_SEC_PROVS := (Query['USE_SECOND_PROVS'].AsInteger = 1);

   if VarIsNull(Query['MAIN_BOOK_REG_UCH'].AsVariant) then SYS_MN_BOOK_REG_UCH := -1
   else SYS_MN_BOOK_REG_UCH := Query['MAIN_BOOK_REG_UCH'].AsInteger;

   Query.Close;

   Query.SQL.Text := 'select id_type_doc from PUB_INI_TYPE_DOC where id_reg_uch='
   + IntToStr(SYS_REG_UCH);
   Query.ExecQuery;

   SYS_TYPE_DOC := Query['ID_TYPE_DOC'].AsInteger;

   Query.Close;

   Query.SQL.Text := 'select FIO from GET_FIO_FROM_ID_PCARD('
   + IntToStr(CurrentID_PCARD) + ')';
   Query.ExecQuery;

   CURRENT_USER := Query['FIO'].AsString;

   Query.Close;

   Query.SQL.Text := 'select ID_USER from USERS where ID_USER_EXT='
   + IntToStr(CurrentID_PCARD);
   Query.ExecQuery;

   id_user := Query.Fields[0].AsInteger;

   Query.Close;


   Query.SQL.Text := 'select SHORT_NAME from PUB_SP_CUSTOMER where ID_CUSTOMER='
   + IntToStr(SYS_ID_ORGANIZATION);
   Query.ExecQuery;

   if VarIsNull(Query['SHORT_NAME'].AsVariant) then SYS_NAME_ORGANIZATION := ' '
   else SYS_NAME_ORGANIZATION := Query['SHORT_NAME'].AsString;

   Query.Close;

    //Mardar 05.09.2012
   Query.SQL.Text := 'select NAME_CUSTOMER from PUB_SP_CUSTOMER where ID_CUSTOMER='
   + IntToStr(SYS_ID_ORGANIZATION);
   Query.ExecQuery;

   if VarIsNull(Query['NAME_CUSTOMER'].AsVariant) then SYS_FULL_NAME_ORGANIZATION := ' '
   else SYS_FULL_NAME_ORGANIZATION := Query['NAME_CUSTOMER'].AsString;

   Query.Close;
   //

   Query.Free;


   if not GetNativeSch(ReadTransaction, SYS_NATIVE_SCH, EncodeDate(SYS_YEAR, SYS_MONTH, 1)) then begin
    Flag := False;
    ShowMessage('Доступні рахунки не знайдено! Налаштуйте рахунки у Головній книзі!');
   end;

   if Flag then Result := True else Exit;

   LoadSysData(ReadTransaction);
  except
   Result := False;

   if ADMIN_MODE then begin
    if MessageDlg('Увага!', 'Вибор необхідних системних даних з БД не здійснено!'
       + #13 + 'Робота програми неможлива!' + #13 + #13 + 'Чи бажаєте Ви змінити опції системи?',
       mtConfirmation, [mbYes, mbNo]) = mrYes
    then begin
     DORepeat := True;

     SYS_INFO._id_Reg_Uch := SYS_REG_UCH;

     if not VarIsNull(SYS_BEG) then SYS_INFO._Sys_Beg := SYS_BEG else SYS_INFO._Sys_Beg := StartOfTheMonth(Now);
     if not VarIsNull(SHOW_MONTHS) then SYS_INFO._Show_Months := SHOW_MONTHS;
     if NAME_SYS <> '' then SYS_INFO._Name_Sys := NAME_SYS;
     if not VarIsNull(SYS_YEAR) then SYS_INFO._Year := SYS_YEAR;
     if not VarIsNull(SYS_MONTH) then SYS_INFO._Month := SYS_MONTH;
     if not VarIsNull(SYS_UNDEF_CONTR) then SYS_INFO._Undef_Contr := SYS_UNDEF_CONTR;
     if not VarIsNull(SYS_ID_GROUP_DOG_V) then SYS_INFO._id_Group_Dog_View := SYS_ID_GROUP_DOG_V;
     if not VarIsNull(SYS_ID_GROUP_DOG_A) then SYS_INFO._id_Group_Dog_View := SYS_ID_GROUP_DOG_A;

     jo9_PackageLoader.ShowOptions(nil, ReadTransaction.DefaultDatabase.Handle, ReadTransaction.Handle, @SYS_INFO, fsNormal);
    end;
   end
   else begin
    ShowMessage('Вибор необхідних системних даних з БД не здійснено!'
    + #13 + 'Робота програми неможлива!');
   end;
  end;
 end; 
end;

procedure GetFormParams(InForm : TForm);
var
 reg : TRegistry;
begin
 if InForm = nil then Exit;

 if InForm.WindowState = wsMaximized then Exit;

 reg := TRegistry.Create;

 try
  reg.RootKey := HKEY_CURRENT_USER;

  if reg.OpenKey(REG_KEY + InForm.ClassName, True) then begin
   if reg.ValueExists('Left')   then InForm.Left   := reg.ReadInteger('Left');
   if reg.ValueExists('Top')    then InForm.Top    := reg.ReadInteger('Top');
   if reg.ValueExists('Width')  then InForm.Width  := reg.ReadInteger('Width');
   if reg.ValueExists('Height') then InForm.Height := reg.ReadInteger('Height');

{   if InForm.FindComponent('Splitter') <> nil then
    if reg.ValueExists('Splitter') then (InForm.FindComponent('Splitter_Pos') as integer) := reg.ReadInteger('Splitter');}
  end;
 finally
  reg.Free;
 end;
end;

procedure SetFormParams(InForm : TForm);
var
 reg : TRegistry;
begin
 if InForm = nil then Exit;

 if InForm.WindowState = wsMaximized then Exit;

 reg := TRegistry.Create;

 try
  reg.RootKey := HKEY_CURRENT_USER;

  if reg.OpenKey(REG_KEY + InForm.ClassName, True) then begin
   reg.WriteInteger('Left',   InForm.Left);
   reg.WriteInteger('Top',    InForm.Top);
   reg.WriteInteger('Width',  InForm.Width);
   reg.WriteInteger('Height', InForm.Height);

{   if InForm.FindComponent('Splitter') <> nil then
    reg.WriteInteger('Splitter', (InForm.FindComponent('Splitter') as TSplitter).Top);}
  end;
 finally
  reg.Free;
 end;
end;       

function CheckAccess(Path:string;Action:String; DisplayMessage:Boolean=False):Integer;
var
 i : Integer;
begin
 i := 0;
  if (not ADMIN_MODE) then begin
   i := fibCheckPermission(Path, Action);
   if i<>0 then begin
    if DisplayMessage then ShowMessage(AcMgmtErrMsg(i));
   end;
  end;

 CheckAccess:=i;
end;

procedure WriteProtocolIn(WriteTransaction : TpFIBTransaction);
var
 SP : TpFIBStoredProc;
begin
 SP := TpFIBStoredProc.Create(Nil);
 SP.Transaction := WriteTransaction;
 SP.Transaction.StartTransaction;
 SP.ExecProcedure('JO9_PROTOCOL_ADD', [CurrentID_PCARD, COMPUTER_USER, COMPUTER_NAME]);

 ID_PROTOCOL := SP.Fields[0].AsInt64;

 SP.Transaction.Commit;
end;

procedure WriteProtocolError(WriteTransaction : TpFIBTransaction; Error : string);
var
 SP : TpFIBStoredProc;
begin
 SP := TpFIBStoredProc.Create(Nil);
 SP.Transaction := WriteTransaction;
 SP.Transaction.StartTransaction;
 SP.ExecProcedure('JO9_PROTOCOL_ERR', [ID_PROTOCOL, Error]);
 SP.Transaction.Commit;
end;

procedure WriteProtocolOut(WriteTransaction : TpFIBTransaction);
var
 SP : TpFIBStoredProc;
begin
 SP := TpFIBStoredProc.Create(Nil);
 SP.Transaction := WriteTransaction;
 SP.Transaction.StartTransaction;
 SP.ExecProcedure('JO9_PROTOCOL_UPDATE', [ID_PROTOCOL]);
 SP.Transaction.Commit; 
end;

function GetNativeSch(ReadTransaction : TpFIBTransaction; var s : TSchArray; ActualPeriod : TDate) : boolean;
var
 DataSet : TpfibDataset;
begin
 Result := False;

 s := nil;

 DataSet := TpFIBDataSet.Create(nil);
 DataSet.Transaction := ReadTransaction;

 DataSet.SelectSQL.Text := 'select * from PUB_SP_MAIN_SCH_SELECT_EX3('
 + QuotedStr(DateToStr(ActualPeriod))
 + ',1,' + IntToStr(SYS_REG_UCH) + ') where not OPEN_SCH is NULL';
 DataSet.Open;

 while not DataSet.Eof do begin
  SetLength(s, Length(s) + 1);

  with s[Length(s) - 1] do begin
   _id_Sch     :=  DataSet['ID_SCH'];
   _Num_Sch    :=  DataSet['SCH_NUMBER'];
   _Name_Sch   :=  DataSet['SCH_TITLE'];
   _is_Blocked := (DataSet['IS_BLOCKED'] = 1);
   _Date_Beg   :=  DataSet['DATE_BEG'];
   _Open_Sch   :=  DataSet['OPEN_SCH'];
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 if Length(s) > 0 then Result := True;
end;

procedure WriteSYS_INFO;
begin
 with SYS_INFO do begin
  _kod_Sys     := KOD_SYS;
  _id_Server   := ID_SERVER;
  _Name_Sys    := NAME_SYS;
  _Sys_Caption := SYS_CAPTION;
  _Year        := SYS_YEAR;
  _Month       := SYS_MONTH;
  _Period_Beg  := StartOfAMonth(_Year, _Month);
  _Period_End  := EndOfAMonth(_Year, _Month);

  _Sys_Beg     := SYS_BEG;
  _Show_Months := SHOW_MONTHS;

  _id_Reg_Uch  := SYS_REG_UCH;
  _id_Form_Uch := SYS_FORM_UCH;
  _id_Type_Doc := SYS_TYPE_DOC;
  _Native_Sch  := @SYS_NATIVE_SCH;
  _Undef_Contr := SYS_UNDEF_CONTR;

  _NOT_DIF_BDG_FG := NOT_DIF_BDG_FG;
  _WIZARD_FORM_SH := WIZARD_FORM_SH;
  _INFO_PANEL_SH  := INFO_PANEL_SH;

  _id_User        := id_User;
  _id_PCard       := CurrentID_PCARD;
  _Name_User      := CURRENT_USER;
  _Comp_Name      := COMPUTER_NAME;
  _Comp_User      := COMPUTER_USER;
  _Admin_Mode     := ADMIN_MODE;

  _App_Path       := APP_PATH;

  _id_Org         := SYS_ID_ORGANIZATION;
  _Name_Org       := SYS_NAME_ORGANIZATION;
  _Full_Name_Org  := SYS_FULL_NAME_ORGANIZATION;

  _id_Group_Dog_View := SYS_ID_GROUP_DOG_V;
  _id_Group_Dog_Add  := SYS_ID_GROUP_DOG_A;

  _Use_Sec_Provs     := SYS_USE_SEC_PROVS;
  _Main_Book_Reg_Uch := SYS_MN_BOOK_REG_UCH;
  _id_Grp_Doc_Auto   := ID_GRP_DOC_AUTO;
  _id_Tip_Doc_Auto   := ID_TIP_DOC_AUTO;

  _id_Dog_Transfer     := ID_DOG_TRANSFER;
  _id_Dog_Transfer_Fix := ID_DOG_TRANSFER_FIX;
 end;
end;

function DoCurrFormat(Curr : string) : string;
var
 k    : integer;
 _Beg : string;
 _End : string;
 is_Minus : boolean;
begin
 Result := '';

 if Curr = '' then begin
  Result := '0' + DecimalSeparator + '00';
  Exit;
 end;

 if Curr[1] = '-' then begin
  is_Minus := True;
  Curr := Copy(Curr, 2, Length(Curr) - 1);
 end
 else is_Minus := False;

 k := Pos(DecimalSeparator, Curr);

 if k = 0 then begin
  _Beg := Curr;
  _End := DecimalSeparator + '00';
 end
 else begin
  _Beg := Copy(Curr, 1, k - 1);
  _End := Copy(Curr, k, Length(Curr) - k + 1);
 end;

 while Length(_Beg) >= 3 do begin
  if Length(Result) > 0 then Result := Copy(_Beg, Length(_Beg) - 2, 3) + ThousandSeparator + Result
  else Result := Copy(_Beg, Length(_Beg) - 2, 3);

  _Beg := Copy(_Beg, 1, Length(_Beg) - 3);
 end;

 if Length(_Beg) > 0 then begin
  if Length(Result) > 0 then Result := _Beg + ThousandSeparator + Result
  else Result := _Beg;
 end;

 Result := Result + _End;

 if is_Minus then Result := '-' + Result;
end;


end.
