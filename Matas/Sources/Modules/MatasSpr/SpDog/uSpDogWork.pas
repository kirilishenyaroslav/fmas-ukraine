{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpDogWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, Controls,
  Dialogs, DogLoaderUnit, StdCtrls, ibase, FIBDatabase, pFIBDatabase,
  uMatasVars;

procedure ShowSpDog(AOwner:TComponent;
                    DBHANDLE : TISC_DB_HANDLE;
                    R_TR_HANDLE : TISC_DB_HANDLE;
                    W_TR_HANDLE : TISC_DB_HANDLE;
                    READ_TR     : TpFIBTransaction;
                    aFormStyle: TFormStyle;
                    aID_USER : INT64);stdcall;
exports ShowSpDog;

implementation

procedure ShowSpDog(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; R_TR_HANDLE : TISC_DB_HANDLE; W_TR_HANDLE : TISC_DB_HANDLE; READ_TR: TpFIBTransaction; aFormStyle: TFormStyle; aID_USER : INT64);stdcall;
var
 ID_USER : Int64;
 input : TDogInput;
 dog_filter: TDogFilter;
 res   : TDogResult;
 s: string;
 i: integer;
begin
 ID_USER:=aID_USER;
 LoadSysData(READ_TR);
 input.Owner      := AOwner;
 input            := SYS_DEFAULT_DOG_INPUT;
 input.DBHandle   := DBHandle;
 input.ReadTrans  := R_TR_Handle;
 input.WriteTrans := W_TR_Handle;
 input.FormStyle  := aFormStyle;
 input.isZayav    := false;
 input.id_Group_add := _GROUP_DOG_ADD_COMMON;
 input.id_Group   := _GROUP_DOG_SEL_COMMON;
 input.Summa := 0.00;
 with dog_filter do
 begin
  bUseFilter :=true;      // Применен ли фильтр
  bShowFilterForm:=false; // отображать ли форму фильтрации при открытии договоров
//  RegNum     : string;       // Фильтр по рег. номеру
  bRegNum    :=false;      // Применять ли фильтр по рег. номеру
//  SummaFrom  : currency;     // Фильтр по сумме
//  SummaTo    : currency;     // Фильтр по сумме
  bSumma     :=false;      // Применять ли фильтр по сумме
//  DateBeg    : TDate;        // Фильтр по дате
//  DateEnd    : TDAte;        // Фильтр по дате
  bDate      := false;      // Применять ли фильтр по дате
//  DateBeg    := Date;        // Фильтр по дате
//  DateEnd    := Date;        // Фильтр по дате
  ShowClosed :=1;      // Отображать закрытые
  NameCust   :='';       // Фильтр по названию контрагента
  bNameCust  :=false;      // Применять ли фильтр по названию контрагента
  id_cust    :=0;      // Фильтр по идентификатору контрагента
  bID_Cust   :=false;      // Применять ли фильтр по идентификатору контрагента
  NameTipDog :='';       // Значение названия типа договора
  id_tip_dog :=0;      // Фильтр по типу договора
  bTipdog    :=false;      // Применять ли фильтр по типу договора
 end;
 SYS_ID_USER:=_CURRENT_USER_ID;
 input.filter:=dog_filter;
 res := ShowDogMain(input);
{ if res.ModalResult=mrOk then
 begin
  s:='SMETA:';
  for i:=0 to High(res.Smets) do
   s:=s+'['+IntToStr(res.Smets[i].NumSmeta)
       +'/'+IntToStr(res.Smets[i].NumRazd)
       +'/'+IntToStr(res.Smets[i].NumStat)+']='+
       FloatToStr(res.Smets[i].Summa)+'/'+FloatToStr(res.Smets[i].NSumma)+chr(13)+chr(10);

  ShowMessage('kod_dog='+VarToStr(res.kod_dog)+chr(13)+chr(10)+
              'id_dog='+VarToStr(res.id_dog)+chr(13)+chr(10)+
              'id_tip_dog='+VarToStr(res.id_tip_dog)+chr(13)+chr(10)+
              'name_tip_dog='+VarToStr(res.name_tip_dog)+chr(13)+chr(10)+
              'n_dog='+VarToStr(res.n_dog)+chr(13)+chr(10)+
              'd_dog='+VarToStr(res.d_dog)+chr(13)+chr(10)+
              'id_customer='+VarToStr(res.id_customer)+chr(13)+chr(10)+
              'name_customer='+VarToStr(res.name_customer)+chr(13)+chr(10)+
              'summa='+VarToStr(res.summa)+chr(13)+chr(10)+
              'dog_note='+VarToStr(res.dog_note)+chr(13)+chr(10)+s);
 end;
}
end;

{
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
  id_cust    : integer;      // Фильтр по идентификатору контрагента
  bID_Cust   : boolean;      // Применять ли фильтр по идентификатору контрагента
  NameTipDog : string;       // Значение названия типа договора
  id_tip_dog : integer;      // Фильтр по типу договора
  bTipdog    : boolean;      // Применять ли фильтр по типу договора
 end;

 TDogInput = record             // Запись используеться для передачи входящих параметров
  Owner      : TComponent;      // Родительская форма
  DBHandle   : TISC_DB_HANDLE;  // Хэндл БД
  WriteTrans : TISC_TR_HANDLE;  // Хэндл пишущей транзакции
  ReadTrans  : TISC_TR_HANDLE;  // Хэндл читающей транзакции
  FormStyle  : TFormStyle;      // Стиль формы
  isZayav    : boolean;         // Справочник вызываеться как реестр заявок к оплате
  FormCaption : string;         // Заголофок формы договоров
  //--------------------------
  Summa       : Currency;       // Сумма передаваемая для разбивки
  id_TypeDog  : integer;        // Не используеться
  id_Group    : integer;        // ID группы которые пользователь сможет добавлять;
  id_Group_add: integer;        // ID группы которые пользователь сможет видеть;
  id_Customer : integer;        // Не используеться
  MFO         : string;         // Не используеться
  RateAcc     : string;         // Не используеться
  DateSys     : TDate;          // Не используеться
  NumDoc      : string;         // Не используеться
  DateDoc     : TDate;          // Не используеться
  id_dog      : integer;        // Не используеться
  id_doc      : integer;        // Идентификатор который игнорируетьс при расчете суммы оплаты по ALL_PROV
  lInfo       : TDogLocateInfo; // Используеться для позиционирования
  filter      : TDogFilter;     // Используеться для фильтрации
  columns     : TDogColumns;    // Колонки которые необходимо отображать
 end;

 TDogLocateInfo = record // Информация для позиционирования
  summa : Variant; // По сумме
  name_customer : Variant; // По низванию контрагента
  rate_acc : Variant; // По р/р
 end;

 TDogSmeta = record
  NumSmeta : integer;
  NumRazd  : integer;
  NumStat  : integer;
  NumKekv  : integer;
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

}
end.
