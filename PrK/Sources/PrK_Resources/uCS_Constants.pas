unit uCS_Constants;

interface
                                                 {Укр}       {Рус}
const nLayoutLang  :array[0..1] of PAnsiChar =('00000422','00000419');

const nFormKlassSpravEdit_Add      :array[0..1] of string[15] =(' Додати.',   '');
const nFormKlassSpravEdit_Change   :array[0..1] of string[15] =(' Змінити.',  '');
const nFormKlassSpravEdit_View     :array[0..1] of string[15] =(' Перегляд.', '');

const nCaptionFirstLevelPreim      :array[0..1] of string[30] =('  Категорії переваг',  '  Категории преимуществ');
const nCaptionSecondLevelPreim     :array[0..1] of string[20] =('  Переваги',           '  Преимущества');

const nAction_Add          :array[0..1] of string[10] =('Додати',              'Добавить');
const nAction_Change       :array[0..1] of string[10] =('Змінити',             'Изменить');
const nAction_Del          :array[0..1] of string[10] =('Видалити',            'Удалить');
const nAction_Old          :array[0..1] of string[10] =('Застаріле',           'Устаревшее');
const nAction_View         :array[0..1] of string[10] =('Перегляд',            'Просмотр');
const nActiont_Obnov       :array[0..1] of string[10] =('Оновити',             'Обновить');
const nAction_Vibrat       :array[0..1] of string[10] =('Вибрати',             'Выбрать');
const nActiont_Otmena      :array[0..1] of string[10] =('Відмінити',           'Отменить');
const nAction_Exit         :array[0..1] of string[10] =('Вийти',               'Выйти');
const nActiont_OK          :array[0..1] of string[5]  =('ОК',                  'ОК');
const nActiont_Cansel      :array[0..1] of string[10] =('Відмінити',           '');
const nActionCalc          :array[0..1] of string[10] =('Підрахунок',          'Подсчет');
const nActionCalcDeleteRec :array[0..1] of string[15] =('Видалити запис',      'Удалить запись');
const nActionAddCN         :array[0..1] of string[20] =('Додати договір',      'Добавить договор');
const nActionChangeCN      :array[0..1] of string[20] =('Змінити договір',     '');
const nActionDelCN         :array[0..1] of string[20] =('Видалити договір',    '');
const nActionDelAbit       :array[0..1] of string[20] =('Видалити Картку','');
const nActionSave          :array[0..1] of string[20] =('Зберегти',            'Сохранить');
const nActionExit          :array[0..1] of string[20] =('Вихід',               '');
const nActiontPrint        :array[0..1] of string[10] =('Друк',                'Печать');
const nAction_Edit              :array[0..1] of string[15] =('Редагувати',        'Редактировать');
const nActionFiltr              :array[0..1] of string[15] =('Фільтрувати',       'фильтровать');
const nActionMakeOld            :array[0..1] of string[15] =('Застаріле',         'Устаревшее');

const nHintAction_Add         :array[0..1] of string[10] =('Додати',        'Добавить');
const nHintAction_Change      :array[0..1] of string[10] =('Змінити',       'Изменить');
const nHintAction_Del         :array[0..1] of string[10] =('Видалити',      'Удалить');
const nHintAction_Old         :array[0..1] of string[40] =('Зробити запис застарілим',      'Сделать запись устаревшей');
const nHintAction_View        :array[0..1] of string[10] =('Перегляд',      'Просмотр');
const nHintAction_Obnov       :array[0..1] of string[10] =('Оновити',       'Обновить');
const nHintAction_Vibrat      :array[0..1] of string[10] =('Вибрати',       'Выбрать');
const nHintAction_Otmena      :array[0..1] of string[10] =('Відмінити',     'Отменить');
const nHintAction_Exit        :array[0..1] of string[10] =('Вийти',         'Выйти');
const nHintActiont_OK         :array[0..1] of string[5]  =('ОК',            'ОК');
const nHintActiont_Cansel     :array[0..1] of string[10] =('Відмінити',     'Отменить');
const nHintActionCalc         :array[0..1] of string[10] =('Підрахунок',    'Подсчет');
const nHintActionCalcDeleteRec:array[0..1] of string[15] =('Видалити запис','Удалить запись');
const nHintActionSave         :array[0..1] of string[20] =('Зберегти',      'Сохранить');
const nHintActiontPrint       :array[0..1] of string[10] =('Друк',          'Печать');

const nHintActionFiltrOK            :array[0..1] of string[20] =('Фільтрувати',                            'Фильтровать');
const nHintAction_Edit              :array[0..1] of string[15] =('Редагувати',        'Редактировать');
const nHintActionFiltr              :array[0..1] of string[15] =('Фільтрувати',       'фильтровать');

const nStatBarAdd                   :array[0..1] of string[20] =('Ins - Додати',   '');
const nStatBarChange                :array[0..1] of string[20] =('F2 - Змінити',   '');
const nStatBarDel                   :array[0..1] of string[20] =('Del - Видалити', '');
const nStatBarView                  :array[0..1] of string[20] =('F3 - Перегляд',  '');
const nStatBarVibrat                :array[0..1] of string[20] =('Enter - Вибрати','');
const nStatBarObnov                 :array[0..1] of string[20] =('F5 - Обновити',  '');
const nStatBarExit                  :array[0..1] of string[20] =('Esc - Вийти',    '');

const nPopMenuCountSerBal           :array[0..1] of string[15] =('Підрахувати',    'Подсчитать');
const nPopMenuClear                 :array[0..1] of string[15] =('Очистити',       'Очистить');


const nMsgToAdmin                   :array[0..1] of string[60]  =('Зверніться, будь ласка, до адміністратора',
                                                       '');
const nMsgTryAgain                  :array[0..1] of string[20]  =('Спробуйте ще раз.','');
const nMsgOr                        :array[0..1] of string[5]   =(' Або ','');
const nMsgBoxTitle                  :array[0..1] of PAnsiChar   =('Увага','');
const nMsgOld                       :array[0..1] of string[60]  =('Ви дійсно бажаєте зробити цей запис застарілим',
                                                       '');
const nMsgDel                       :array[0..1] of string[60]  =('Ви дійсно бажаєте видалити цей запис',
                                                       '');
const nMsgCannotEdit                :array[0..1] of string[60]  =('Ви не маєте можливості редагувати цей запис',
                                                       '');
const nMsgERRORDel                  :array[0..1] of string[50]  =('Неможливо видалити запис!',
                                                       '');
const nMsgErrorTransaction          :array[0..1] of string[50]  =('Неможливо виповнити запит!',
                                                       '');


const nMsgEmptyName         :array[0..1] of string[20]  =('Введіть назву',            '');
const nMsgEmptyShortName    :array[0..1] of string[40]  =('Введіть скорочену назву',  '');
const nMsgEmptyKod          :array[0..1] of string[20]  =('Введіть код',              '');
const nMsgZerroKod          :array[0..1] of string[40]  =('Код не може бути нулевим.','');
const nMsgThisKodExist      :array[0..1] of string[50]  =('Такий Код вже існує! Введіть інший.',             '');
const nMsgEmptyNpp          :array[0..1] of string[50]  =('Введіть Порядковий номер', '');
const nMsgZerroNpp          :array[0..1] of string[50]  =('Порядковий номер не може бути нулевим.',          '');
const nMsgThisNppExist      :array[0..1] of string[60]  =('Такий Порядковий номер вже існує! Введіть інший.','');
const nMsgCannotDelSecLevel :array[0..1] of string[200] =('Неможливо видалити другий рівень.' +chr(13)+'Перший рівень повинен містити під собою інші рівні',
                                                          '');
const nMsgFreeNomer         :array[0..1] of string[60]  =('Вільний номер:','Свободный номер:');
const nMsgExistProfPredm    :array[0..1] of PAnsiChar   =('Неможливо видалити запис!'+CHR(13)+'Спочатку потрібно виставити інший профіл. предмет'+CHR(13)+'Потім ви зможете видалити поточний запис',
                                                          'Невозможно удалить запись!'+CHR(13)+'Сначала нужно выставить другой профил. предмет!'+CHR(13)+'Затем вы сможете удалить текущую запись');

const nMsgEmptyVinitPadeg :array[0..1] of string[40]  =('Введіть Знахідний відмінок','');
const nMsgEmptyRoditPadeg :array[0..1] of string[40]  =('Введіть Родовий відмінок',  '');
const nMsgEmptyDateBeg    :array[0..1] of string[40]  =('Введіть Дату початку',      '');
const nMsgEmptyDateEnd    :array[0..1] of string[40]  =('Введіть Дату закінчення',   '');

const nMsgEmptyModuleName       :array[0..1] of string[50]  =('Введіть назву модулю',                     '');
const nMsgEmptyId               :array[0..1] of string[50]  =('Введіть Індефікатор',                      'Введите Индефикатор');
const nMsgEmptyComponent        :array[0..1] of string[50]  =('Виберіть Компонент',                       '');
const nMsgEmptySELECT_STATEMENT :array[0..1] of string[50]  =('Введіть Текст запроса',                    '');
const nMsgEmptyWHERE_STATEMENT  :array[0..1] of string[50]  =('Введіть условие запроса',                  '');
const nMsgSelectedBefore        :array[0..1] of string[40]  =('Вибрано раніше',                           '');
const nMsgEmptyDataAfterFiltr   :array[0..1] of string[90]  =('За таким фільтром немає даних!'+CHR(13)+'Спробуйте змінити умови фільтру',
                                                              '');
const nMsgCopyPlanNaboraCancel  :array[0..1] of string[50]  =('Не копіювати','Не копировать');
const nMsgEmptyFields           :array[0..1] of string[40]  =('Не всі поля заповнено!','Не все поля заполнены!');


const nMsgDlgOk           :array[0..1] of string[5]   =('Так',          '');
const nMsgDlgCansel       :array[0..1] of string[10]  =('Ні',           '');
const nMsgDlgYes          :array[0..1] of string[5]   =('Так',          '');
const nMsgDlgNo           :array[0..1] of string[5]   =('Ні',           '');
const nMsgDlgAbort        :array[0..1] of string[10]  =('Відмінити',    '');
const nMsgDlgRetry        :array[0..1] of string[10]  =('Повторити',    '');
const nMsgDlgIgnore       :array[0..1] of string[15]  =('Ігнорувати',   '');
const nMsgDlgAll          :array[0..1] of string[5]   =('Все',          '');
const nMsgDlgHelp         :array[0..1] of string[10]  =('Допомога',     '');
const nMsgDlgNoToAll      :array[0..1] of string[15]  =('Ні для всіх',  '');
const nMsgDlgYesToAll     :array[0..1] of string[15]  =('Так для всіх', '');


const nColName            :array[0..1] of string[10]  =('Назва',        '');
const nColShortName       :array[0..1] of string[15]  =('Коротка назва','');
const nColFullName        :array[0..1] of string[15]  =('Повна назва','Полное название');
const nColKod             :array[0..1] of string[5]   =('Код',          '');
const nColNpp             :array[0..1] of string[10]  =('№п/п',         '№п/п');
const ncolVINIT_PADEG     :array[0..1] of string[25]  =('Знахідний відмінок','Винительный падеж');
const ncolRODIT_PADEG     :array[0..1] of string[25]  =('Родовий відмінок',  'Родительный падеж');

const nGroupBoxMova          :array[0..1] of string[10]  =('Мова',       'Язык');
const nGroupBoxColorShem     :array[0..1] of string[15]  =('Колір схеми','Цвет схемы');

const ncxGroupBoxDataFoFiltr :array[0..1] of string[70]  =('Вибір або введення данних для фільтрування',            '');

const ncxRadioButtonUkr    :array[0..1] of string[15]  =('Українська',            '');
const ncxRadioButtonRus    :array[0..1] of string[15]  =('Російська',             '');
const ncxRadioButtonYellow :array[0..1] of string[15]  =('Жовта',                 '');
const ncxRadioButtonBlue   :array[0..1] of string[15]  =('Блакитна',              '');
const ncxRadioButtonAll    :array[0..1] of string[15]  =('Всі',                   'Все');

const ncxLabelMustOverload :array[0..1] of string[40]  =('Потрібне перезавантаження програми',  '');
const nLabelLogin              :array[0..1] of string[10]  =('Логін',              'Логин');
const nLabelPassword           :array[0..1] of string[10]  =('Пароль',             'Пароль');

// Названия к кнопкам меню на главной формы
const nItemWork           :array[0..1] of string[10] =('Робота',      '');
const nItemSpravochniki   :array[0..1] of string[15] =('Довідники',   '');
const nService            :array[0..1] of string[15] =('Сервіс','');


const ndxBtnKont         :array[0..1] of string[50] =('Контингент','Контингент');
const ndxBtnOrderds      :array[0..1] of string[50] =('Накази','Приказы');
const ndxBtnReports      :array[0..1] of string[50] =('Звітність','Отчетность');

const ndxBtnGrantSize    :array[0..1] of string[50] =('Розміри стипендій','Размеры стипендий');
const ndxBtnMinGrant     :array[0..1] of string[50] =('Мінімальна стипендія','Минимальная стипендия');
const ndxBtnGrantType    :array[0..1] of string[50] =('Види стипендій','Виды стипендий');
const ndxBtnOrderType    :array[0..1] of string[50] =('Види наказів','Виды приказов');
const ndxBtnPeople       :array[0..1] of string[50] =('Довідник фізичних осіб','Справочник физических лиц');
const ndxBtnStreetType   :array[0..1] of string[50] =('Типи вулиць','Типы улиц');

const ndxBtnOptionInterfase :array[0..1] of string[20] =('Настройка Інтерфейсу',        '');
const ndxBtnOptionWork      :array[0..1] of string[20] =('Опції роботи',         'Опции работы');

// Названия Форм
const nFormCS_Caption             :array[0..1] of string[20] =('Контингент студентів',   'Контингент студентов');
const nFormLogin_Caption           :array[0..1] of string[20] =('Контингент студентів',   'Контингент студентов');
const nFormOptionInterfase_Caption :array[0..1] of string[20] =('Настройка Інтерфейсу', 'Настройка Интерфейса');
const nFormOptionWork_Caption      :array[0..1] of string[20] =('Опції роботи',         'Опции работы');
const nFormPtint_Caption           :array[0..1] of string[20] =('Друк',                 'Печать');

implementation

end.
