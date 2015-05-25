{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasVars;

interface

uses ibase;

const
// пути к модулям
 _PATH_PUBLIC    =    '';
 _PATH_MATAS     =    'Matas';
 _PATH_REPORTS   =    'Reports\Matas';

 _WHATS_NEW_MAT_FILENAME = 'MAT_Whats_New.txt';
 _WHATS_NEW_INV_FILENAME = 'MAT_INV_Whats_New.txt';

// ид. форм учета
 _KOD_SYSTEM_OS  = 131;         // основные средства
 _KOD_SYSTEM_MNA = 132;         // МНА
 _KOD_SYSTEM_MBP = 134;         // МБП
 _KOD_SYSTEM_MAT = 133;         // материалы

var
// глобальные константы
 MAIN_DB_HANDLE : TISC_DB_HANDLE;

// форма учета
 _TYPE_ACCOUNT: integer;             // 1-бюджет; 2 - хозрасчет;

// форма списания ТМЦ
 _TYPE_MAT_ACCOUNT: integer;         // 0 - "в ручную", 1 - ФИФО, 2 - ЛИФО
 _USE_FIFO_ON_MAT_SCH: integer;      // признак использования ФИФО для мат. счетов
 _GET_OST_MODE: integer;             // 0 - по одному, 1 - мультивыбор

// форма субсчетов
 _TYPE_SUB_SCH: shortint;             // 0 - без субсчетов, 1 - простая, 2 - сложная

// данные о пользователе
 _CURRENT_USER_ID: int64;             // ID пользователя
 _CURRENT_USER_ID_PCARD: int64;       // ID физ.лица
 _CURRENT_USER_NAME: string;          // имя входа (логин)
 _CURRENT_USER_FIO: string;           // Ф.И.О.

// данные о рабочем периоде
 _MATAS_PERIOD: TDateTime;            // учетный период
 _MATAS_MONTH, _MATAS_YEAR: integer;  // учетный год и месяц
 _MATAS_OST_PERIOD: TDateTime;        // дата ввода остатков
 _MATAS_BEG_PERIOD: TDateTime;        // период начала отсчета
 _MATAS_CHECK_SALDO:Integer;          //проверять ли на сходимость сальдо
 
// данные о периодах
 _MATAS_BEG_MONTH: integer;           // месяц начала функционирования системы
 _MATAS_BEG_YEAR: integer;            // год начала функционирования системы
 _MATAS_NEXT_MONTH: integer;          // следующий месяц расчета
 _MATAS_NEXT_YEAR: integer;           // следующий год расчета
 _MATAS_PREV_MONTH: integer;          // предыдущий месяц расчета
 _MATAS_PREV_YEAR: integer;           // предыдущий год расчета

// прочее
 _MATAS_ID_SYSTEM: integer;           // ID системы "Учет ТМЦ"
 _ID_SETUP: integer;
 _SERVER_TITLE: string;               // текущие сервер данных
 _ID_UNDEF_CUST: int64;               // ID неопределенного поставщика
 _ID_DEP_ROOT: int64;                 // ID корня подразделений
 _ID_SCH_ROOT: int64;                 // ID корня справ.счетов
 _MAX_DEP_DATE: TDateTime;
 _USE_EXT_ACCESS_FOR_MO: integer;     // использование расш. доступа к МОЛам
 _SHOW_EXCEPTIONS: Boolean;           // признак показа исключений на экране

// данные об организации
 _ORG_FULL_NAME: string;              // полное название организации
 _ORG_SHORT_NAME: string;             // краткое название организации
 _ORG_KOD_OKPO: string;               // код ОКПО
 _USE_ORG_SHORT_NAME: Integer;        //использовать ли краткое название организации
 _SHOW_OPER_FORM:Integer;             // показывать ли форму операций при работе с документами

// данные о программе и организации
// _MATAS_VERSION: string;              // номер версии программы
// _MATAS_AUTHORS: string;              // разработчики системы
// _MATAS_BUILD: string;                // версия exe-модуля для контроля

// настройки
 _SYSTEM_LANG: integer;
 _SAVE_USER_PARAMS: integer;
 _SAVE_HISTORY: integer;
 _SAVE_OWNER: integer;
 _PRINT_LANG: integer;
 _SET_PRINT_ON_PRINTER: integer;
 _ALLOW_EDIT_TEMPLATE: integer;
 _SET_POS_MODAL_WINDOW: integer;
 _ALLOW_CLOSE_WINDOW_ESC: integer;
 _SAVE_GROUP: integer;
 _SET_UPPER_KOD: integer;
 _SET_UPPER_SHORT_NAME: integer;
 _SET_UPPER_NAME: integer;
 _SET_UPPER_DOC_NUMBER: integer;
 _ALLOW_EDIT_OWNER: integer;
 _SET_DATE_DOC: integer;
 _ALLOW_DUP_NUMBER: integer;
 _SET_AUTO_DOC_NUMBER: integer;
 _SET_SCH_ID_DOC: integer;
 _CLOSE_SYS_SCH: integer;
 _MAKE_MBOOK_REP: integer;
 _AUTO_NUM_DOC_MODE: integer;
 _INUM_MANUAL_MODE: integer;
 
// очищать буфера после записи
 _CLEAR_BUFFERS_AFTER_SAVE: boolean;

// очищать ист. финансирования перед добавлением договора
  _CLEAR_ISTFIN_BY_DOG: integer;

// проверять проводки менеджером перед записью
 _CHECK_PROV_BY_MANAGER: boolean;

// данные о группах договоров
 _GROUP_DOG_SEL_COMMON: integer;
 _GROUP_DOG_ADD_COMMON: integer;

// конфигурация программы
 _INV_KART_ENABLED: integer;
 _MNA_KART_ENABLED: integer;
 _TOOLS_ENABLED: integer;
 _MBOOK_ENABLED: integer;
 _LINK_TO_NDS_ENABLED: integer;
 _GET_INV_NOM_MODE: integer;
 _MNA_INV_ACC :Integer;
 _MBP_INV_ACC :Integer;
 _IS_TWICE_INV_NUM: Integer;
 
//значение бюджетов и КЕКВов по умолчанию
 _USE_DEFAULT_SMETA: integer;
 _USE_DEFAULT_KEKV: integer;
 _DEFAULT_ID_SM: integer;
 _DEFAULT_SM_TITLE: string;
 _DEFAULT_SM_KOD: integer;
 _DEFAULT_ID_RZ: integer;
 _DEFAULT_RZ_TITLE: string;
 _DEFAULT_RZ_KOD: integer;
 _DEFAULT_ID_ST: integer;
 _DEFAULT_ST_TITLE: string;
 _DEFAULT_ST_KOD: integer;
 _DEFAULT_ID_KEKV: integer;
 _DEFAULT_KEKV_TITLE: string;
 _DEFAULT_KEKV_KOD: integer;

 _NOT_CHANGE_INV_NUM:Integer;

// статья НДС
_NDS_ST:Integer;

_PRINT_ISPOLNIT_IN_DOC:Integer;

_COMPARE_OST_OBOROT:Integer;
_PRINT_INV_VED_BY_SCH:Integer; // формирование износа ос по счетам

implementation

end.
