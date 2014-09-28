unit uPI_Constants;

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
const nAction_GetDataFromEDBO   :array[0..1] of string[30] = ('Отримати дані з ЄДБО', 'Получить данные из ЕГБО');
const nAction_UpdDataFromEDBO   :array[0..1] of string[30] = ('Імпорт даних за наказом', 'Импорт данных по приказу');
const nAction_GetOrderTypeFromEDBO :array[0..1] of string[50] = ('Імпортувати види наказів з ЄДБО', 'Импортировать виды приказов из ЕГБО');

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
const nHint_GetDataFromEDBO         : array[0..1] of string[30] = ('Отримати дані з ЄДБО', 'Получить данные из ЕГБО');
const nHint_UpdDataFromEDBO         :array[0..1] of string[30] = ('Імпорт даних за наказом', 'Импорт данных по приказу');

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
const nMsgErrorWithEDBO         :array[0..1] of string[50]  =('Помилка при роботі з модулем взаємодії з ЄДБО', 'Ошибка при работе с модулем взаимодействия с ЕГБО');
const nMsgErrorConnectEDBO      :array[0..1] of string[70]  =('Подальша робота неможлива, не вдалося встановити зв''''язок з ЄДБО', 'Дальнейшая работа невозможна, не удалось установить связь с ЕГБО');

const nMsgEmptyOrdersEDBO       :array[0..1] of string[80]  =('Відсутні данні для імпорту. Спочатку необхідно отримати дані з ЄДБО!', 'Отсутствуют данные для импорта. Сначала необходимо получить данные из ЕГБО!');

const nMsgSaveOrderInfo         :array[0..1] of string[50]  =('Зберігаємо інформацію за наказом', 'Сохраняем информацию по приказу');

const nMsgError                 :array[0..1] of string[50]  =('Виникла помилка!', 'Возникла ошибка!');

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
const nCol_IdOrder        :array[0..1] of string[30]  =('Код наказу','Код приказа');
const nCol_NumOrder       :array[0..1] of string[30]  =('Номер наказу', 'Номер приказа');
const nCol_OrderType      :array[0..1] of string[30]  =('Тип наказу', 'Тип приказа');
const nCol_DateOrder      :array[0..1] of string[30]  =('Дата наказу', 'Дата приказа');
const nCol_Verification   :array[0..1] of string[30]  =('Стан верифікації', 'Состояние верификации');
const nCol_Status         :array[0..1] of string[30]  =('Статус', 'Статус');
const nCol_VerificationType :array[0..1] of string[30]=('Тип верифікації', 'Тип верификации');
const nCol_DateChange     :array[0..1] of string[30]  =('Дата останньої зміни', 'Дата последнего изменения');
const nCol_StudCount      :array[0..1] of string[30]  =('Кількість студентів', 'Количество студентов');
const nCol_IsSyncWithDB   :array[0..1] of string[30]  =('Імпортовано', 'Импортирован');
const nCol_AcademicYears  :array[0..1] of string[30]  =(' академічного року', 'академического года');
const nCol_IsActive		  :array[0..1] of string[30]  =('Активний рік', 'Активный год');


const nGroupBoxMova          :array[0..1] of string[10]  =('Мова',          'Язык');
const nGroupBoxColorShem     :array[0..1] of string[15]  =('Колір схеми',   'Цвет схемы');
const nFIO                   :array[0..1] of string[10]  =('ПІБ',           'ФИО');
const nFacul                 :array[0..1] of string[10]  =('Факультет',     'Факультет');
const nSpeciality            :array[0..1] of string[20]  =('Спеціальність', 'Специальность');
const nKurs                  :array[0..1] of string[10]  =('Курс',          'Курс');
const nFormEduc              :array[0..1] of string[20]  =('Форма навчання','Форма обучения');
const nKatEduc               :array[0..1] of string[20]  =('Категорія',     'Категория');
const nSeason                :array[0..1] of string[20]  =('Вступна кампанія','Вступна кампания');
const nDateFrom              :array[0..1] of string[10]  =('З',             'С');
const nDateto                :array[0..1] of string[10]  =('По',            'По');

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
const nHelp               :array[0..1] of string[10] =('Довідка',      '');
const nItemSpravochniki   :array[0..1] of string[15] =('Довідники',   '');
const nReports            :array[0..1] of string[15] =('Звітність','');

const ndxAbout       :array[0..1] of string[50] =('Про систему','О системе');
const ndxWhatsNew       :array[0..1] of string[50] =('Що нового','Что нового');

const ndxBtnDocType      :array[0..1] of string[50] =('Типи документів','Типы документов');
const ndxBtnOznDohod     :array[0..1] of string[50] =('Ознаки доходів','Признаки доходов');
const ndxBtnVidOper      :array[0..1] of string[50] =('Види операцій','Виды операций');
const ndxBtnPeople       :array[0..1] of string[50] =('Довідник фізичних осіб','Справочник физических лиц');
const ndxBtnFilial       :array[0..1] of string[50] =('Філіали','Филиалы');

const ndxBtn1dfReports   :array[0..1] of string[50] =('Звіт за формою 1дф','Отчет по форме 1дф');
const ndxBtnPrepareDoc   :array[0..1] of string[50] =('Підготовка документів','Подготовка документов');

// Названия Форм
const nFormPI_Caption             :array[0..1] of string[100] =('Підсистема підготовки та формування персоніфікованої звітності в Міністерство Доходів',   'Подсистема подготовки и формирования персонифицированной отчетности в Министерство Доходов');
const nFormLogin_Caption           :array[0..1] of string[100] =('Підсистема підготовки та формування персоніфікованої звітності в Міністерство Доходів',   'Подсистема подготовки и формирования персонифицированной отчетности в Министерство Доходов');
const nFormOptionInterfase_Caption :array[0..1] of string[20] =('Настройка Інтерфейсу', 'Настройка Интерфейса');
const nFormOptionWork_Caption      :array[0..1] of string[20] =('Опції роботи',         'Опции работы');
const nFormPtint_Caption           :array[0..1] of string[20] =('Друк',                 'Печать');
//const nOrdersType_MainForm_Caption : array[0..1] of string[30] = ('Довідник видів наказів','Справочник видов приказов');
//const nOrders_MainForm_Caption     : array[0..1] of string[30] = ('Реєстр наказів з ЄДБО', 'Реестр приказов из ЕГБО');
const nFormAcademicYears		:array[0..1] of string [40] = ('Довідник академічних років', 'Справочник академических годов');

//const nFormImportStud		:array[0..1] of string [50] = ('Імпорт даних за зарахованими студентам', 'Импорт данных по зачисленным студентам');


implementation

end.
