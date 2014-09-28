unit uMain_Book_Ini;


interface

type TConfigConnStructure=record
     DB_PATH       : ShortString;
     DB_SERVER     : ShortString;
     DB_USER       : ShortString;
     DB_PASSWORD   : ShortString;
     end;

TViewMode = (vmFixSch, vmFixProp);
TPropType = (ptSch, ptOper, ptRazdSt, ptKekv);
TRazdStViewMode = (allEnable, allData, allEnableValid);
TRazdStChMode = (cmNone, cmRazd, cmSt);

resourcestring
    ErrorCaption =      'Внимание ошибка!';
    WarningCaption=     'Внимание!';

    PingError =         'Сервер не отвечает на TCP/IP запросы. Возможно неполадки в сети или он выключен. Обратитесь к системному администратору.';
    OpenConfigError =   'Невозможно открыть файл инициализации. Обратитесь к системному администратору.';
    OpenDBError =       'Невозможно подсоединиться к базе данных. Обратитесь к системному администратору.';
    CountLevelError=    'Превышен уровень возможной аналитики баланса.';
    TitleError     =    ' Не задан заголовок объекта';
    TypeError      =    ' Не задан тип объекта';
    KodError       =    ' Не задан код объекта';
    DeleteConfirmation= 'Вы действительно хотите удалить объект?';
    HasChildError=      ' Данный объект имеет дочерние, поэтому не может быть удален.';
    DistanceError=      ' Ошибочное построение иерархии объектов';
    PropError=          ' C данным объектом справочника не связаны свойства';
    OperError=          ' C данным объектом справочника не связаны операции';
    PropDelError=       ' Нельзя удалить свойство так как оно еще не установлено ';
    DateError   =       ' Ошибка при задании периодов ';
    MinDateError   =    ' Дата начала периода не может быть меньше актуальной даты работы главной книги ';
    StError   =         ' Статья не может ссылаться сама на себя ';
    ChooseStError   =   ' Вы должны выбрать статью  ';
    ChooseRzError   =   ' Вы должны выбрать раздел  ';

    Yes_const      =   'Да';
    No_const       =   'Нет';
    OperPropError=' Не все свойства операции заданы';
    HieracChooseError =' Невозможно выбрать данный объект';
    Month_01  = 'январь   ';
    Month_02  = 'февраль  ';
    Month_03  = 'март     ';
    Month_04  = 'апрель   ';
    Month_05  = 'май      ';
    Month_06  = 'июнь     ';
    Month_07  = 'июль     ';
    Month_08  = 'август   ';
    Month_09  = 'сентябрь ';
    Month_10  = 'октябрь  ';
    Month_11  = 'ноябрь   ';
    Month_12  = 'декабрь  ';
    CHECK_OPER_ID_EQUALITY_ERROR='Счет не может корреспондироваться сам с собой';



const INI_FILENAME        : String       = 'config.ini';
      BASE_YEAR           : Integer      = 2000;
      YEARS_COUNT         : Integer      = 25;
      DEFAULT_ROOT_ID     : Integer      = 1;

function MonthTitle(ADate:TdateTime):String;



var
   APP_PATH         :  string;
   DB_PATH          :  string;
   DB_USER          :  string;
   DB_PASSWORD      :  string;
   DB_SERVER        :  string;
   CORRECT_CONFIG   :  boolean;
   CORRECT_CONNECT  :  boolean;


implementation

uses DateUtils;


function MonthTitle(ADate:TdateTime):String;
var Num:WORD;
begin
    Num:=MonthOf(ADate);
    if Num=1  then  MonthTitle:=Month_01;
    if Num=2  then  MonthTitle:=Month_02;
    if Num=3  then  MonthTitle:=Month_03;
    if Num=4  then  MonthTitle:=Month_04;
    if Num=5  then  MonthTitle:=Month_05;
    if Num=6  then  MonthTitle:=Month_06;
    if Num=7  then  MonthTitle:=Month_07;
    if Num=8  then  MonthTitle:=Month_08;
    if Num=9  then  MonthTitle:=Month_09;
    if Num=10 then  MonthTitle:=Month_10;
    if Num=11 then  MonthTitle:=Month_11;
    if Num=12 then  MonthTitle:=Month_12;
end;



initialization

   DB_USER      :='SYSDBA';
   DB_PASSWORD  :='masterkey';
   DB_SERVER    :='localhost';
   CORRECT_CONFIG   :=false;
   CORRECT_CONNECT  :=false;


end.
