{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uResources;

interface

resourcestring

 MAT_ACTION_ADD_CONST          ='Додати';
 MAT_ACTION_DELETE_CONST       ='Видалити';
 MAT_ACTION_UPDATE_CONST       ='Змінити';
 MAT_ACTION_REFRESH_CONST      ='Обновити';
 MAT_ACTION_CLOSE_CONST        ='Закрити';
 MAT_ACTION_PRINT_CONST        ='Друк';
 MAT_ACTION_PRINT_REP_CONST    ='Друк звіту';
 MAT_ACTION_HELP_CONST         ='Допомога';
 MAT_ACTION_CHOOSE_CONST       ='Вибрати';
 MAT_ACTION_FILTER_CONST       ='Фільтр';
 MAT_ACTION_ANALIZE_CONST      ='Аналіз';
 MAT_ACTION_SET_CONST          ='Встановити';
 MAT_ACTION_FIND_CONST         ='Знайти';
 MAT_ACTION_TEMPLATE_CONST     ='Шаблон';
 MAT_ACTION_VIEW_CONST         ='Перегляд';
 MAT_ACTION_WORK_CONST         ='Обробка';
 MAT_ACTION_EXPORT_CONST       ='Експорт в Excel';

 MAT_BUTTON_OK_CONST           ='Прийняти';
 MAT_BUTTON_CANCEL_CONST       ='Відмінити';
 MAT_BUTTON_SAVE_CONST         ='Зберегти';
 MAT_BUTTON_YES_CONST          ='Так';
 MAT_BUTTON_NO_CONST           ='Ні';
 MAT_BUTTON_CHOOSE_CONST       ='Вибрати';
 MAT_BUTTON_EXIT_CONST         ='Вихід';
 MAT_BUTTON_MOVE_CONST         ='Перенести';
 MAT_BUTTON_ABORT_CONST        ='Відмінити';
 MAT_BUTTON_RETRY_CONST        ='Повторити';
 MAT_BUTTON_IGNORE_CONST       ='Ігнорувати';
 MAT_BUTTON_ALL_CONST          ='Всі';
 MAT_BUTTON_HELP_CONST         ='Допомога';
 MAT_BUTTON_NO_ALL_CONST       ='Ні для всіх';
 MAT_BUTTON_YES_ALL_CONST      ='Да для всіх';
 MAT_BUTTON_CLEAR_CONST        ='Очистити';
 MAT_BUTTON_SHOW_CONST         ='Показати';
 MAT_BUTTON_EXPORT_CONST       ='Експортувати';

 MAT_SYSTEM_SHORT_NAME         = 'Облік ТМЦ';
 MAT_SYSTEM_FULL_NAME          = 'Облік товарно-матеріальних цінностей';

 MAT_STR_MODE_ADD              ='Додавання';
 MAT_STR_MODE_DEL              ='Видалення';
 MAT_STR_MODE_EDIT             ='Редагування';

 MAT_SYS_PREFIX                = 'Облік ТМЦ :: ';

 MAT_SPLASH_INIT               = 'Ініціалізація програми';
 MAT_SPLASH_CONNECT            = 'З''єднання з базою даних';
 MAT_SPLASH_LOAD_BPL           = 'Завантажується пакет';
 MAT_SPLASH_TITLE              = 'Виконується процес';
 MAT_WAIT_MESSAGE              = 'Чекайте!';
 MAT_WAIT_WORKED               = 'Виконується обробка данних';

 MAT_STR_VERSION               = 'Версія';
 MAT_STR_EXIT_QUEST            = 'Завершити роботу з програмою ?';
 MAT_STR_LOAD_BPL_ERROR        = 'Помилка при роботі з бібліотекою ';
 MAT_STR_CONNECT_ERROR         = 'Неможливо з''єднатися з базою даних!';
 MAT_STR_NO_RECORD             = 'Нема записів!';
 MAT_STR_ASK_DELETE            = 'Ви дійсно бажаєте видалити цей запис?';
 MAT_STR_ASK_DOC_DELETE        = 'Ви дійсно бажаєте видалити цей документ';
 MAT_STR_ASK_UNWORK            = 'Ви дійсно бажаєте відмінити відпрацювання в обліку?';
 MAT_STR_ASK_CORRECT_OST       = 'Ви дійсно бажаєте корригувати поточні залишки?';
 MAT_STR_ERROR_DELETE          = 'Не можливо видалити запис!';
 MAT_STR_NO_DELETE             = 'Не можна видаляти цей запис!';
 MAT_STR_NO_EDIT               = 'Не можна редагувати цей запис!';
 MAT_STR_FIND_ERROR            = 'Не задані поля для пошуку!';
 MAT_STR_NOT_FIND              = 'Не знайдено ні одного запису!';
 MAT_STR_NEED_TEXT             = 'Необхідно ввести текст для пошуку!';
 MAT_STR_SAVE_ERROR            = 'При збереженні даних виникла помилка: ';
 MAT_STR_NEXT_PERIOD           = 'Перенести залишки на';
 MAT_STR_ERR_ACC_MANAGER       = 'Фатальна помилка у системі безпеки';
 MAT_STR_PERIOD                = 'Період';
 MAT_STR_USER                  = 'Користувач';
 MAT_STR_DB                    = 'База даних';
 MAT_STR_SERVER                = 'Сервер';
 MAT_STR_WARNING               = 'УВАГА!';
 MAT_STR_ERROR                 = 'Помилка!';
 MAT_STR_SYS_DOC_NO_EDIT       = 'Не можна змінювати системні документи!';
 MAT_STR_SYS_DOC_NO_DEL        = 'Не можна видаляти системні документи!';
 MAT_STR_SKLAD_CONST           = 'Скл.';
 MAT_STR_NEED_PEOPLE           = 'Необхідно вибрати фізичну особу!';
 MAT_STR_NEED_SPODR            = 'Необхідно вибрати підрозділ!';
 MAT_STR_NOTHING_SELECT        = 'Нічого не вибрано!';
 MAT_STR_ERR_ACCESS_DEL        = 'Недостатньо прав для видалення!';
 MAT_STR_ERR_ACCESS_EDIT       = 'Недостатньо прав для редагування!';
 MAT_STR_CANNOT_EDIT_WORK_DOC  = 'Відпрацьований документ змінити не можна';
 MAT_STR_ERR_DEL_DOC           = 'При видаленні документа виникли помилки:';
 MAT_STR_CANNOT_KART_EDIT_DOC  = 'Документ має зв''язок з картотекою. Редагування неможливе!';
 MAT_STR_CANNOT_KART_DEL_DOC   = 'Документ має зв''язок з картотекою. Видалення неможливе!';
 MAT_STR_CORRECT_OST_CUR       = 'Коректувати поточні залишки';
 MAT_STR_MOVE_OST              = 'Перенести залишки';

 MAT_STR_MO_LABEL_FIO          = 'Фізична особа';
 MAT_STR_MO_LABEL_SPODR        = 'Підрозділ';
 MAT_STR_MO_LABEL_KAT          = 'Категорія';
 MAT_STR_MO_LABEL_HISTORY      = 'Зберегти в історії';
 MAT_STR_MO_ITEMS_KAT1         = 'Матеріально-відповідальна особа';
 MAT_STR_MO_ITEMS_KAT2         = 'Комірник';

 MAT_STR_MONTH01               = 'січень';
 MAT_STR_MONTH02               = 'лютий';
 MAT_STR_MONTH03               = 'березень';
 MAT_STR_MONTH04               = 'квітень';
 MAT_STR_MONTH05               = 'травень';
 MAT_STR_MONTH06               = 'червень';
 MAT_STR_MONTH07               = 'липень';
 MAT_STR_MONTH08               = 'серпень';
 MAT_STR_MONTH09               = 'вересень';
 MAT_STR_MONTH10               = 'жовтень';
 MAT_STR_MONTH11               = 'листопад';
 MAT_STR_MONTH12               = 'грудень';

 MAT_FORMCAP_EXIT              = 'Вихід';
 MAT_FORMCAP_SP_NOMN           = 'Номенклатор';
 MAT_FORMCAP_LOGIN             = 'Ідентифікація користувача';
 MAT_FORMCAP_SP_TIPDOC         = 'Типи документів';
 MAT_FORMCAP_DOCWORK           = 'Робота з документами';
 MAT_FORMCAP_OSTWORK           = 'Робота з початковими залишками ТМЦ';
 MAT_FORMCAP_SP_MO             = 'Матеріально-відповідальні особи';
 MAT_FORMCAP_SP_MATSCH         = 'Довідник матеріальних рахунів';
 MAT_FORMCAP_SETUP             = 'Налагодження системи';
 MAT_FORMCAP_PERIOD            = 'Перенос залишків';
 MAT_FORMCAP_TOOLS             = 'Додаткові функції';
 MAT_FORMCAP_WORK_OSTB         = 'Відпрацювання вхідних залишків';

 MAT_LOGIN_STR_NAME            = 'Користувач';
 MAT_LOGIN_STR_PWD             = 'Пароль';

 MAT_SP_MO_FORM_FIND_NAME      = 'Пошук';
 MAT_SP_MO_FORM_FIND_GROUP     = 'Поле для пошуку';
 MAT_SP_MO_FORM_FIND_TEXT      = 'Текст для пошуку:';
 MAT_SP_MO_FORM_FIND_NEXT      = 'Шукати далі';

 MAT_SETUP_TS_COMMON           = 'Загальні';
 MAT_SETUP_TS_PRINT_CAPTION    = 'Документи';

 MAT_SETUP_GROUP_USER          = ' Користувач ';
 MAT_SETUP_GROUP_PERIOD        = ' Звітний період ';
 MAT_SETUP_GROUP_PRINT         = ' Друк ';
 MAT_SETUP_GROUP_HISTORY       = ' Хронологія ';
 MAT_SETUP_GROUP_INTERFACE     = ' Інтерфейс ';
 MAT_SETUP_GROUP_UPPER_CASE    = ' Регістр ';
 MAT_SETUP_GROUP_DOC_WORK      = ' Робота з документами ';
 MAT_SETUP_GROUP_DOC_NUM       = ' Нумерація документів ';

 MAT_SETUP_LABEL_SYS_LANG      = 'Мова інтерфейса';
 MAT_SETUP_LABEL_USER_PARAMS   = 'Зберігати налагодження користувача';
 MAT_SETUP_LABEL_STARTUP       = 'Відкривати після входу';
 MAT_SETUP_LABEL_PRINT_LANG    = 'Мова друку';
 MAT_SETUP_LABEL_ON_PRINTER    = 'Друкувати на принтер';
 MAT_SETUP_LABEL_EDIT_TEMPL    = 'Редагування шаблонів';
 MAT_SETUP_LABEL_SAVE_HIST     = 'Хронологія змін';
 MAT_SETUP_LABEL_SAVE_USER     = 'Зберігати користувача';
 MAT_SETUP_LABEL_POS_WIND      = 'Позицювання модальних вікон';
 MAT_SETUP_LABEL_CLOSE_ESC     = 'Закривати вікна клавішою Esc';
 MAT_SETUP_LABEL_SAVE_GROUP    = 'Зберігати розділи в довідниках';
 MAT_SETUP_LABEL_UPPER_KOD     = 'Приводити до верхнього регістру коди';
 MAT_SETUP_LABEL_UPPER_SHORT   = 'Приводити до верхнього регістру стислі назви';
 MAT_SETUP_LABEL_UPPER_NAME    = 'Приводити до верхнього регістру назви';
 MAT_SETUP_LABEL_ALLOW_EDIT    = 'Дозволити редагування "чужих" документів';
 MAT_SETUP_LABEL_DATE_DOC      = 'Дата документа при створенні';
 MAT_SETUP_LABEL_ALLOW_DUP_NUM = 'Дозволити однакові документи у межах року';
 MAT_SETUP_LABEL_UPPER_NUM     = 'Приводити до верхнього регістру букви у номерах документів';
 MAT_SETUP_LABEL_AUTO_NUM      = 'Автодоповнення номерів';

 MAT_SETUP_SYS_LANG_ITEMS01    = 'російська';
 MAT_SETUP_SYS_LANG_ITEMS02    = 'украінська';
 MAT_SETUP_PRINT_LANG_ITEMS01  = 'російська';
 MAT_SETUP_PRINT_LANG_ITEMS02  = 'украінська';
 MAT_SETUP_SAVE_HIST_ITEMS01   = 'повна';
 MAT_SETUP_SAVE_HIST_ITEMS02   = 'часткова';
 MAT_SETUP_SAVE_USER_ITEMS01   = 'першого';
 MAT_SETUP_SAVE_USER_ITEMS02   = 'посліднього';
 MAT_SETUP_DATE_DOC_ITEMS01    = 'поточна дата';
 MAT_SETUP_DATE_DOC_ITEMS02    = '25 число поточного месяца';
 MAT_SETUP_DATE_DOC_ITEMS03    = 'перший день поточного місяця';
 MAT_SETUP_DATE_DOC_ITEMS04    = 'послідній день поточного місяця';
 MAT_SETUP_DATE_DOC_ITEMS05    = '25 число поточного звітного періода';
 MAT_SETUP_DATE_DOC_ITEMS06    = 'перший день звітного періода';
 MAT_SETUP_DATE_DOC_ITEMS07    = 'послідній день звітного періода';
 MAT_SETUP_DATE_DOC_ITEMS08    = 'поточна дата з урахуванням періоду';

 MAT_OPER_LABEL_NAME           = 'Назва операції';
 MAT_OPER_LABEL_OBJECT         = 'Назва операції';
 MAT_OPER_LABEL_DOC            = 'Документ';
 MAT_OPER_LABEL_IN             = 'Кому';
 MAT_OPER_LABEL_OUT            = 'Від кого';
 MAT_OPER_LABEL_USE_DOG        = 'Використовувати "Договора"';
 MAT_OPER_LABEL_BARTER         = 'Бартерна операція';

 MAT_STR_COL_SCH               = 'Рахунок';
 MAT_STR_COL_SUB_SCH           = 'Субрахунок';
 MAT_STR_COL_NAME              = 'Назва';
 MAT_STR_COL_SHORT_NAME        = 'Назва стисла';
 MAT_STR_COL_NOMN              = 'Код ТМЦ';
 MAT_STR_COL_FIO               = 'П.І.Б.';
 MAT_STR_COL_MOL               = 'МВО';
 MAT_STR_COL_DEP               = 'Підрозділ';
 MAT_STR_COL_DB                = 'Дебет';
 MAT_STR_COL_KR                = 'Кредит';
 MAT_STR_COL_NUM               = 'Номер';
 MAT_STR_COL_DATA              = 'Дата';
 MAT_STR_COL_DOC               = 'Документ';
 MAT_STR_COL_OUT               = 'Кому';
 MAT_STR_COL_IN                = 'Від кого';
 MAT_STR_COL_SUMMA             = 'Сума';
 MAT_STR_COL_KOL               = 'Кількість';
 MAT_STR_COL_PERIOD            = 'Період';
 MAT_STR_COL_NAME_TMC          = 'Назва ТМЦ';
 MAT_STR_COL_GROUP_TMC         = 'Група ТМЦ';
 MAT_STR_COL_TMC               = 'ТМЦ';
 MAT_STR_COL_NAME_UNIT         = 'Од.виміру';
 MAT_STR_COL_PRICE             = 'Ціна';
 MAT_STR_COL_KOL_DOC           = 'Кільк. докум.';
 MAT_STR_COL_KOL_MAT           = 'Кільк. факт';
 MAT_STR_COL_TIPD              = 'Тип';
 MAT_STR_COL_TIPD_GRP          = 'Група документів';
 MAT_STR_COL_TIPD_NAME         = 'Назва типу документа';
 MAT_STR_COL_TEMPLATE          = 'Файл шаблона';
 MAT_STR_COL_OST_BEG           = 'Залишок на початок';
 MAT_STR_COL_OST_END           = 'Залишок на кінець';
 MAT_STR_COL_PRH               = 'Прихід';
 MAT_STR_COL_RSH               = 'Видаток';
 MAT_STR_COL_SALDO_BEG         = 'Сальдо на початок';
 MAT_STR_COL_SALDO_END         = 'Сальдо на кінець';
 MAT_STR_COL_PRH_KOL           = 'Прихід (кільк.)';
 MAT_STR_COL_RSH_KOL           = 'Видаток (кільк.)';
 MAT_STR_COL_NUM_DOC           = '№ док';
 MAT_STR_COL_DATE_DOC          = 'Дата док.';
 MAT_STR_COL_KOL_BEG           = 'Кількість на початок';
 MAT_STR_COL_KOL_END           = 'Кількість на кінець';
 MAT_STR_COL_SUM_BEG           = 'Сума на початок';
 MAT_STR_COL_SUM_END           = 'Сума на кінець';
 MAT_STR_COL_PRH_SUM           = 'Прихід (сума)';
 MAT_STR_COL_RSH_SUM           = 'Видаток (сума)';
 MAT_STR_COL_ISTFIN            = 'Бюджет';
 MAT_STR_COL_PERCENT           = 'Відсоток';
 MAT_STR_COL_BEG               = 'з';
 MAT_STR_COL_END               = 'по';
 MAT_STR_COL_COMMENT           = 'Примітка';
 MAT_STR_COL_INV_NUMS          = 'Інв. номери';
 MAT_STR_COL_INV_NUM           = 'Інв. номер';
 MAT_STR_COL_ZAV_NUM           = 'Заводський номер';
 MAT_STR_COL_NOM_NUMS          = 'Номенкл. номери';
 MAT_STR_COL_NOM_NUM           = 'Номенкл. номер';

 MAT_STR_MAIN_MENU_SYS         ='Система';
 MAT_STR_MAIN_MENU_ACC         ='Облік';
 MAT_STR_MAIN_MENU_REP         ='Звіти';
 MAT_STR_MAIN_MENU_SPR         ='Довідники';
 MAT_STR_MAIN_MENU_WIN         ='Вікна';
 MAT_STR_MAIN_MENU_HELP        ='?';

 MAT_STR_MAIN_MENU_SYS_OST     ='Прихід залишків ТМЦ';
 MAT_STR_MAIN_MENU_SYS_BEG_OST ='Початкові залишки ТМЦ';
 MAT_STR_MAIN_MENU_SYS_NEXT    ='Перенос залишків';
 MAT_STR_MAIN_MENU_SYS_SETUP   ='Налагодження системи';
 MAT_STR_MAIN_MENU_SYS_PERIOD  ='Звітний період';
 MAT_STR_MAIN_MENU_SYS_EXIT    ='Вихід';
 MAT_STR_MAIN_MENU_SYS_TOOLS   ='Додаткові функції';

 MAT_STR_MAIN_MENU_ACC_DOC     ='Робота з документами';
 MAT_STR_MAIN_MENU_ACC_OSTC    ='Залишки ТМЦ поточні';
 MAT_STR_MAIN_MENU_ACC_OSTB    ='Залишки ТМЦ бухгалтерії';
 MAT_STR_MAIN_MENU_ACC_ISTF    ='Залишки за бюджетами';
 MAT_STR_MAIN_MENU_ACC_B_ISTF  ='Залишки за бюджетами по бухгалтерії';
 MAT_STR_MAIN_MENU_ACC_OBM     ='Обороти по МВО';
 MAT_STR_MAIN_MENU_ACC_OBV     ='Оборотна відомість за МВО';
 MAT_STR_MAIN_MENU_ACC_OBOR    ='Обороти ТМЦ за період';
 MAT_STR_MAIN_MENU_ACC_SCH_OB  ='Загальна оборотна відомість';
 MAT_STR_MAIN_MENU_ACC_INV     ='Інвентарна картотека';
 MAT_STR_MAIN_MENU_ACC_MNA     ='Картотека МНА та МШП';
 MAT_STR_MAIN_MENU_ACC_OSCH    ='Перегляд оборотів по рахунку';
 MAT_STR_MAIN_MENU_ACC_RECOST  ='Відомості переоцінки ТМЦ';
 MAT_STR_MAIN_MENU_ACC_OBOR_IF ='Обороти за бюджетами';

 MAT_STR_MAIN_MENU_REP_OOV     ='Оборотні відомості';
 MAT_STR_MAIN_MENU_REP_OMO     ='Аналітичні відомості';
 MAT_STR_MAIN_MENU_REP_MO      ='Меморіальні ордера';
 MAT_STR_MAIN_MENU_REP_JO      ='Журнал-ордер';
 MAT_STR_MAIN_MENU_REP_OBR     ='Розшифровка оборотів';
 MAT_STR_MAIN_MENU_REP_MB      ='Додатки до головної книги';
 MAT_STR_MAIN_MENU_REP_OST     ='Звіт по залишкам ТМЦ';
 MAT_STR_MAIN_MENU_REP_INV     ='Інвентаризаційні описи';
 MAT_STR_MAIN_MENU_REP_OPER    ='Звіт по операціям';
 MAT_STR_MAIN_MENU_REP_DJO     ='Додатки до журнал-ордеру';
 MAT_STR_MAIN_MENU_REP_DM      ='Рух дорогоцінних металів';
 MAT_STR_MAIN_MENU_REP_NOMOVE  ='Звіт наявності неліквідів';
 MAT_STR_MAIN_MENU_REP_WHKART  ='Картотека складського обліку';
 MAT_STR_MAIN_MENU_REP_TMC     ='Розшифровка оборотів по ТМЦ';

 MAT_STR_MAIN_MENU_SPR_NOM     ='Номенклатор';
 MAT_STR_MAIN_MENU_SPR_UNITS   ='Одиниці виміру';
 MAT_STR_MAIN_MENU_SPR_MOL     ='Відповідальні особи';
 MAT_STR_MAIN_MENU_SPR_CUST    ='Контрагенти';
 MAT_STR_MAIN_MENU_SPR_DEP     ='Підрозділи';
 MAT_STR_MAIN_MENU_SPR_SCH     ='План рахунків';
 MAT_STR_MAIN_MENU_SPR_DOG     ='Договора';
 MAT_STR_MAIN_MENU_SPR_TIPD    ='Типи документів';
 MAT_STR_MAIN_MENU_SPR_OPER    ='Зразки операцій';
 MAT_STR_MAIN_MENU_SPR_AMOR    ='Групи амортизації';

 MAT_STR_MAIN_MENU_WIN_CASC    ='Каскадом';
 MAT_STR_MAIN_MENU_WIN_HORZ    ='Горизонтально';
 MAT_STR_MAIN_MENU_WIN_VERT    ='Вертикально';
 MAT_STR_MAIN_MENU_WIN_SORT    ='Упорядкувати';

 MAT_STR_MAIN_MENU_HELP_ABOUT  ='Про програму';
 MAT_STR_MAIN_MENU_HELP_HELP   ='Допомога';
 MAT_STR_MAIN_MENU_HELP_USERS  ='Користувачі';
 MAT_STR_MAIN_MENU_HELP_ERRORS ='Помилки';

 MAT_STR_TOOLS_01_SCH_SALDO    ='Сальдо матеріальних рахунків';
 MAT_STR_TOOLS_02_SCH_MANAGER  ='Управління рахунками';

 MAT_DOC_STR_POSMODE            = 'ТМЦ';
 MAT_DOC_STR_PROVMODE           = 'Проводки';
 MAT_DOC_STR_PPMODE             = 'Проводки та ТМЦ';
 MAT_DOC_STR_SPLASH_CAPTION     = 'Робота з документами';
 MAT_DOC_STR_SPLASH_INIT1       = 'Підготовка типів документів';
 MAT_DOC_STR_SPLASH_INIT2       = 'Ініціалізація констант';
 MAT_DOC_STR_SPLASH_INIT3       = 'Відновлення параметрів';
 MAT_DOC_STR_SPLASH_INIT4       = 'Ініціалізація фільтра';
 MAT_DOC_STR_SPLASH_INIT5       = 'Візуалізація даних';

 MAT_DOC_STR_PRINT_REP          = 'Реєстр документів';
 MAT_DOC_STR_PRINT_PRH          = 'Звіт про прихід ТМЦ';
 MAT_DOC_STR_PRINT_RSH          = 'Звіт про видаток ТМЦ';
 MAT_DOC_STR_PRINT_MAT          = 'Звіт за групами ТМЦ';
 MAT_DOC_STR_PRINT_DOC          = 'Матеріальний звіт';
 MAT_DOC_STR_CLONE_DOC          = 'Клонувати';
 MAT_DOC_STR_ACTION_WORK        = 'Відпрацювати в обліку';
 MAT_DOC_STR_ACTION_UNWORK      = 'Зняти відпрацювання в обліку';
 MAT_DOC_STR_ACTION_INV_WORK    = 'Відпрацювати в інвентарному обліку';
 MAT_DOC_STR_ACTION_INV_UNWORK  = 'Зняти відпрацювання в інвентарному обліку';
 MAT_DOC_STR_ACTION_MNA_WORK    = 'Відпрацювати в картотеці МНА та МШП';
 MAT_DOC_STR_ACTION_MNA_UNWORK  = 'Зняти відпрацювання в картотеці МНА та МШП';

 MAT_DOC_STR_WORK_DOC_CAP       = 'Відпрацювання документа';
 MAT_DOC_STR_WORK_DOC_MSG1      = 'Попередній розрахунок проводок';
 MAT_DOC_STR_WORK_DOC_MSG2      = 'Підготовка проводок';
 MAT_DOC_STR_WORK_DOC_MSG3      = 'Збереження проводок';
 MAT_DOC_STR_WORK_DOC_MSG4      = 'Збереження документа';
 MAT_DOC_STR_WORK_DOC_MSG5      = 'Неможливо видалити основну проводку!';

{ Контстанты для инвентарной картотеки }
 MAT_INV_system_name                = 'Iнвентарна картотека :: ';

 MAT_INV_print_drag                 = 'Вiдомiсть наявностi дорогоцiнних металiв';
 MAT_INV_oprihodov                  = 'Оприбуткування';
 MAT_INV_vnutr                      = 'Внутрішне переміщення';
 MAT_INV_VvodvExpl                  = 'Ввод в эксплуатацію';
 MAT_INV_Spisanie                   = 'Списання';
 MAT_INV_Namoder                    = 'Встановлення на модернізацію';
 MAT_INV_smoder                     = 'Зняття з модернізації';
 MAT_INV_oper                       = 'Операції';
 MAT_INV_save                       = 'Зберегти';
 MAT_INV_Print                      = 'Друк';
 MAT_INV_Find                       = 'Фільтр';
 MAT_INV_Add                        = 'Додати';
 MAT_INV_Close                      = 'Вихід';
 MAT_INV_Refrash                    = 'Оновити';
 MAT_INV_Cansel                     = 'Відмінити';
 MAT_INV_Change                     = 'Змінити';
 MAT_INV_Delete                     = 'Видалити';
 MAT_INV_Work_with_inv_kart_capsh   = 'Робота з інвентарнними картками';
 MAT_INV_Folders                    = 'Папки';
 MAT_INV_SCH                        = 'Рахунок';
 MAT_INV_MOL                        = 'МВO';
 MAT_INV_new_MOL                    = 'Новий МВO';
 MAT_INV_Name                       = 'Назва';
 MAT_INV_Balans_price               = 'Почат. вартість';
 MAT_INV_Bal_price                  = 'Бал. вартість';
 MAT_INV_Ost_price                  = 'Залиш. ціна';
 MAT_INV_Iznos                      = 'Знос';
 MAT_INV_Num_Grp                    = 'Номер групи';
 MAT_INV_Inv_Num                    = 'Інв. номер';
 MAT_INV_full_inv                   = 'Повний Iнв. номер';
 MAT_INV_Vklad_Osnovnie             = 'Основні';
 MAT_INV_Vklad_Amort                = 'Амортизація';
 MAT_INV_Vklad_Dop                  = 'Додаткові';
 MAT_INV_Vklad_Dragmet              = 'Дорог.металли';
 MAT_INV_Vklad_Sost_obekta          = 'Склад об''єкта';
 MAT_INV_Tip_karti                  = 'Тип картки';
 MAT_INV_Num_kart                   = 'Номер картки';
 MAT_INV_Nach_price                 = 'Почат. ціна';
 MAT_INV_Nach_Iznos                 = 'Почат. знос';
 MAT_INV_Date_ost                   = 'Дата залиш. ціни.';
 MAT_INV_Ost_Iznos                  = 'Сум. знос';
 MAT_INV_Date_opr                   = 'Дата оприбутк.';
 MAT_INV_date_nach_expl             = 'Дата поч. експл.';
 MAT_INV_Date_Refrash               = 'Дата оновлення';
 MAT_INV_Date_Exit                  = 'Дата вилучення';
 MAT_INV_Primechanie                = 'Примітка';
 MAT_INV_Zav_num                    = 'Заводський номер';
 MAT_INV_Pass_num                   = 'Номер паспорта';
 MAT_INV_Model                      = 'Модель';
 MAT_INV_Marka                      = 'Марка';
 MAT_INV_Date_vipuska               = 'Дата випуска';
 MAT_INV_Reg_doc                    = 'Документ реєстр.';
 MAT_INV_Date_reg_doc               = 'Дата реєстрації';
 MAT_INV_Nazv_full                  = 'Назва повна';
 MAT_INV_Nazv_Short                 = 'Назва скорочена';
 MAT_INV_Kol_vo                     = 'Кількість';
 MAT_INV_MonthYear                  = 'Період експл.';
 MAT_INV_PerNach_Perc               = 'Період нарахування %';
 MAT_INV_buh_db_sch                 = 'Дебетовий рахунок';
 MAT_INV_buh_kr_sch                 = 'Кредитовий рахунок';
 MAT_INV__am_grp                    = 'Група амортизації';
 MAT_INV__method_name               = 'Метод начислення';
 MAT_INV_minprice                   = 'Мінім. ціна';
 MAT_INV_Percent                    = 'Відсотки';
 MAT_INV_GroupBoxNal                = 'Податковий облік';
 MAT_INV_GroupBoxBuh                = 'Бухгалтерський облік';
 MAT_INV_na_check                   = 'Податковий облік';
 MAT_INV_na_buhg_check              = 'Бухгалтерський облік';
 MAT_INV_look                       = 'Перегляд';
 MAT_INV_ved_main_menu              = 'Амортизацiйнi вiдомостi';
 MAT_INV_looksrooved                = 'Перегляд вiдомостей';
 MAT_INV_destroyved                 = 'Розформування вiдомостей';
 MAT_INV_print_ved                  = 'Друк вiдомостей';
 MAT_INV_create_ved                 = 'Формування вiдомостей';
 MAT_INV_ved_create                 = 'Зформувати';
 MAT_INV_sel_in_main                = 'Вiдiбрати';
 MAT_INV_Mitka                      = 'Помiтка';
 MAT_INV_un_metka                   = 'Зняти помiтку';
 MAT_INV_pometit_all                = 'Помiтити усi';
 MAT_INV_unmetka_one                = 'з однiєї';
 MAT_INV_unmetka_all                = 'з усiх';
 MAT_INV_checked_ost                = 'Створювати запис у залишках';
 MAT_INV_Show_Ost                   = 'Відображення залишків';
 MAT_INV_nomn_num                   = 'Номенклатурний номер';
 MAT_INV_okrugl_doizn               = 'округляти до гривні';

// Hnut_spr_ost_pr                 = 'Справка об остаточной стоимости ОС';
// Hnut_ved_nal_os                 = 'Ведомость наличия основных средств по субсчетам';

 MAT_INV_spr_ost_pr                 = 'Справка об остаточной стоимости ОС';
 MAT_INV_ved_nal_os                 = 'Ведомость наличия основных средств по субсчетам';

 MAT_INV_ved_come_os                = 'Ведомость основных средств, введённых';
 MAT_INV_ved_out_os                 = 'Ведомость основных средств, выведенных';
 MAT_INV_inv_opis_os                = 'Iнвентаризацiйний опис основних засобiв';
 MAT_INV_inv_inv_grp                = 'Ведомость наличия ОС по инв. группам';
 MAT_INV_inv_nomn_grp               = 'Ведомость наличия ОС по номенкл. группам';
 MAT_INV_grp_checked                = 'Друкувати поточну групу';


 {Showmessage}
 MAT_INV_Error_add_Papka            = 'Папка містить данні, тому додати в неї нову папку неможливо!';
 MAT_INV_Error_add_to_main_Papka    = 'Ця папка головна! Тому в неї може бути додана лише нова папка!';
 MAT_INV_Error_add_Kart             = 'Папка має вложеність, тому додати в неї картку неможливо!';
 MAT_INV_Del_papka_not_Checked      = 'Папка, що видаляється,  не вибрана!';
 MAT_INV_Error_Connect              = 'Помилка з''єднання!!!';
 MAT_INV_Delete_Papka               = 'Видалити папку';
 MAT_INV_Attention                  = 'Попередження...';
 MAT_INV_mail                       = 'Повідомлення...';
 MAT_INV_not_Razrabotano            = 'Не доопрацьовано!';
 MAT_INV_Dele_pole_not_insert       = 'Поле для видалення не задано!';
 MAT_INV_delete_pole                = 'Видалити поле';
 MAT_INV_mess_print                 = 'Поле друку не вибран!';
 MAT_INV_Error_Add                  = 'Помилка додання!';
 MAT_INV_Error_Change               = 'Помилка змінення!';
 MAT_INV_opov_oper                  = 'Подібна операція з документом вже виконана!';
 MAT_INV_checked_error              = 'Обов''язково повинен бути обраний один з 2-х облiкiв!';
 MAT_INV_Mess_ost                   = 'Спочатку треба обрати МВО та ТМЦ';
 MAT_INV_Otricatelnoe               = 'Сума залишкового зносу не може бути меньше нуля!';

 {Same constant}
 MAT_INV_const_PerNach_Perc         = 'Невстановлено';
 MAT_INV_const_Goda                 = 'рока';
 MAT_INV_const_Let                  = 'років';
 MAT_INV_const_God                  = 'рік';
 MAT_INV_const_mesyaca              = 'місяця';
 MAT_INV_const_mesyacev             = 'місяців';
 MAT_INV_const_mesyac               = 'місяць';
 MAT_INV_const_Pomesyachno          = 'Щомісячно';
 MAT_INV_const_Pokvartalno          = 'Щоквартально';
 MAT_INV_const_Ejegodno             = 'Щорічно';
 MAT_INV_mol_new                    = 'МВО нов.';
 MAT_INV_mol_old                    = 'МВО стар.';
 MAT_INV_sch_new                    = 'Рах.нов.';
 MAT_INV_sch_old                    = 'Рах.стар.';
 MAT_INV_ost_price_old              = 'Зал.цiна стар';
 MAT_INV_ost_iznos_old              = 'Зал.знос стар';

 {Глобальные константы формы на добавление папки}

 MAT_INV_Add_Papka_Name_papki       = 'Им''я папки';
 MAT_INV_Add_Papka_Group_kod        = 'Код групи';
 MAT_INV_Add_Papka_Caption_na_Add   = 'Додання папки';
 MAT_INV_Add_Papka_Caption_na_change= 'Зміна папки';

 {ShowMessage}
 MAT_INV_Add_Papka_zap_all_pola     = 'Заповніть усі поля!';
 MAT_INV_Error_add_double           = 'Треба обрати тип нарахування амортизацiї!';
 MAT_INV_Error_into_change          = 'З цiєю карткою були проведені операції оприбуткування чи операції вводу до експлуатації!';
 MAT_INV_Error_for_del_kart         = 'Залишилися не вiдкаченi операцiї, тому картка не може бути видалена!';

 {Глобальные константы формы на добавление карты}
 MAT_INV_Add_Kart_ID_Oper_Opr       = 'Опер. оприб.';
 MAT_INV_Add_Kart_IdOperExpl        = 'Опер. поч. експл.';
 MAT_INV_Add_Kart_IdOperUpdate      = 'Опер. модерн.';
 MAT_INV_Add_Kart_IdOperOut         = 'Опер. вилучення.';
 MAT_INV_Add_Kart_IdCust            = 'Ід. контраг.';
 MAT_INV_Add_Kart_IdOst             = 'Ід. ост';

 MAT_INV_Add_Kart_Caption_na_AddKar = 'Додати картку';
 MAT_INV_Add_Kart_Caption_na_change = 'Змінити картку';
 {ShowMessage}
 MAT_INV_Kart_enter_beg_price       = 'Поле Поч вартість пусте! Заповніть його!';
 MAT_INV_Kart_enter_beg_iznos       = 'Поле Поч. знос пусте! Заповніть його!';
 MAT_INV_kart_Error                 = 'Значення зноса неможе бути більше за значення початкової вартості!';

 {Глобальные константы формы добавления драгметаллов}

 {Showmessage}
 MAT_INV_metall_not_all_Row         = 'Необхідно заповнити усі поля!';
 MAT_INV_metall_Checked_metall      = 'Оберіть драг.метал';
 MAT_INV_metall_Add_kol             = 'Введіть кількість';
 MAT_INV_metall_Add_new_metall      = 'Додавання драг.метала';
 MAT_INV_metall_Change_metall       = 'Зміна драг.метала';

 //Норма износа
 MAT_INV_izn_caption                = 'Довідник норм зносу';
 MAT_INV_izn_vibor                  = 'Обрати';
 MAT_INV_izn_period                 = 'Період';
 MAT_INV_izn_God                    = 'Рік';
 MAT_INV_izn_Month                  = 'Місяць';
 MAT_INV_izn_formula                = 'Формула';
 MAT_INV_izn_method                 = 'Метод';

 //Добавление нормы
 MAT_INV_norm_nor                   = 'Норма зносу';
 MAT_INV_norm_tip                   = 'Тип обліка';
 MAT_INV_norm_NaAdd                 = 'Додання норми зносу';
 MAT_INV_norm_NaIzm                 = 'Зміна норми зносу';
 MAT_INV_norm_tipi                  = 'Тип начислення';
 MAT_INV_norm_buh_uch               = 'Бухгалтерський Облік';
 MAT_INV_norm_nal_uch               = 'Податковий облік';

 //Форма добавления состава объекта
 MAT_INV_obj_caption_Add            = 'Додання складу об''єкта';
 MAT_INV_obj_caption_Izm            = 'Зміна складу об''єкта';
 MAT_INV_obj_koef                   = 'Коефіцієнт';
 MAT_INV_obj_kol_vo                 = 'Кількість';
 MAT_INV_obj_siyz                   = 'Розмір';
 MAT_INV_obj_material               = 'Матеріал';
 MAT_INV_obj_sum                    = 'Сума';
 // Short names
 MAT_INV_obj_koef_sh                = 'Коеф.';
 MAT_INV_obj_kol_sh                 = 'Кіл.';
 MAT_INV_obj_siyz_sh                = 'Розмір';
 MAT_INV_obj_material_sh            = 'Матеріал';

 //Работа с операциями
 MAT_INV_oper_add                   = 'Робота з операціями';
 MAT_INV_oper_change                = 'Зміна операции';
 MAT_INV_oper_opih                  = 'Оприбуткування';
 MAT_INV_oper_perem                 = 'Внутрішнього переміщення';
 MAT_INV_oper_expl                  = 'Ввода в експлуатацію';
 MAT_INV_oper_spis                  = 'Вилучення';
 MAT_INV_oper_Labl_oper             = 'Операція';
 MAT_INV_un_oper                    = 'Скасувати операцію';
 MAT_INV_oper_num_doc               = 'Номер док.';
 MAT_INV_oper_date_doc              = 'Дата док.';
 MAT_INV_history                    = 'Історія операцій';
 MAT_INV_koef_pereoc                = 'Коефіцієнт переоцінки';
 MAT_INV_sum_osp_pr                 = 'Сума залишк. ціни';
 MAT_INV_sum_ost_izn                = 'Сума залишк. зносу';
 MAT_INV_sm                         = 'Бюджет';
 MAT_INV_rz                         = 'Розділ';
 MAT_INV_st                         = 'Стаття';
 MAT_INV_kekv                       = 'Кекв';


 //Showmessega
// Hnut_opov_ob_otmene_oper        = 'Ви дійсно бажаєте скасувати цю операцію?';
 MAT_INV_opov_ob_otmene_oper        = 'Ви дійсно бажаєте скасувати цю операцію?';
 MAT_INV_unoper                     = 'Операцію було вдало скасовано!';
 MAT_INV_Error_oper_otmena          = 'Не можна скасувати неіснуючу операцію!';
 MAT_INV_worked                     = 'Є невідпрацьовані картки!';
 MAT_INV_aleni                      = 'Для коректної роботи програми заповніть усі поля правильно!';

 //Add provodki
 MAT_INV_prov_caption               = 'Додання проводок';
 MAT_INV_ustan                      = 'Прийняти';
 MAT_INV_clear                      = 'Очистити';
 MAT_INV_period_now                 = 'Поточний період';
 MAT_INV_s                          = 'з';
 MAT_INV_po                         = 'по';
 MAT_INV_working                    = 'Чи відпрацьована картка';
 MAT_INV_prov_caption_change        = 'Зміна iнформацiї';
 MAT_INV_db_name                    = 'Дебет';
 MAT_INV_kr_name                    = 'Кредит';

 //Messages from filter
 MAT_INV_find_error_sel             = 'Залишилися не заповнені поля! Тому фільтрація не може бути виконана!';
 MAT_INV_peremesh                   = 'Увага! Над цією карткою щє не здійснювалась операція переміщення';
 MAT_INV_spisan                     = 'Увага! Над цією карткою щє не здійснювалась операція вилучення';
 //Filter
 MAT_INV_all                        = 'Усі';
 MAT_INV_expl                       = 'Експлуатуємі';
 MAT_INV_out                        = 'Вилучені';
 MAT_INV_zap_nema                   = '';

 //Popup_print
 MAT_INV_popup_print_main           = 'Інвентарної картки';
 MAT_INV_priem_peredacha            = 'Акту прийома передачі';
 MAT_INV_inv_os                     = 'Інвентарного списка основних засобів (ОЗ-11)';
 MAT_INV_inv_spisanie               = 'Акта про вилучення основних засобів';
 MAT_INV_inv_kniga                  = 'Інвентарної книги';
 MAT_INV_expl_now                   = 'Експлуатуємих';
 MAT_INV_do_not_expl                = 'Не Експлуатуємих';

 //messages for chacked form
 MAT_INV_Alarm                      = 'Оберіть групу розташування  об''єкта!';
 MAT_INV_Grp_name                   = 'Найменування групи';
 MAT_INV_id_grp                     = 'Код групи';
 MAT_INV_name_fm                    = 'Оберіть нову групу';
 // Hunte_Pereoc                    = 'Переоцінка';
 MAT_INV_Pereoc                    = 'Переоцінка';

 //lable for fmWaite
 // Hunte_loading                   = 'Увага! Йде збір данних... Чекайте...';
 MAT_INV_loading                   = 'Увага! Йде збір данних... Чекайте...';
 MAT_INV_vot_urodi                  = 'Ви не можете редагувати не існуюче поле!!!';
 MAT_INV_primitka                   = 'Примiтка';
 MAT_INV_hoz_raz                    = 'Гозп.разрахунок';
 MAT_INV_date_narah                 = 'Дата нарахування';
 MAT_INV_select_tepy                = 'Оберiть тип облiку';
 MAT_INV_coeff_amort                = 'Коефіцієнт';

 //Constants for amort form
 MAT_INV_amort_afte_save            = 'Увага! Було проведене збереження даних!';
 MAT_INV_amort_after_save           = 'Увага! Збереження даних вже було проведено, тому повторний процес неможливий!';
 MAT_INV_amort_caption              = 'Нарахування амортизацiї';

 //For Printing Form
 MAT_INV_print_kol                  = 'Кількість копій';
 // Hnut_print_caption              = 'Форма друку';
 MAT_INV_print_caption              = 'Форма друку';
 MAT_INV_print_on_printer           = 'Друкувати на принтер';
 MAT_INV_print_sel_printer          = 'Вибрати принтер';
 MAT_INV_print_sel_Shablon          = 'Шаблон друку';
 MAT_INV_printing_finish_card       = 'Друк зношених карток';

 //Mesyaci
 MAT_INV_sichen                     = 'січень';
 MAT_INV_lyutiy                     = 'лютий';
 MAT_INV_berezen                    = 'березень';
 MAT_INV_kviten                     = 'квітень';
 MAT_INV_traven                     = 'травень';
 MAT_INV_lipen                      = 'липень';
 MAT_INV_cherven                    = 'червень';
 MAT_INV_serpen                     = 'серпень';
 MAT_INV_veresen                    = 'вересень';
 MAT_INV_jovten                     = 'жовтень';
 MAT_INV_listopad                   = 'листопад';
 MAT_INV_gruden                     = 'грудень';

 //**** Messages
 MAT_INV_Error_in_Shablon           = 'Шаблон друку не обрано!';
 MAT_INV_uncreate_amort_ved         = 'Останнє нарахування зносу було проведено ';
 MAT_INV_Quetion                    = 'Провести росформування?';
 MAT_INV_She_E_Z_oper               = 'Увага! Залишились картки, в яких операція відкату зносу не виконана! Причиною стала наявність операцій молодших за датою!';
 MAT_INV_Finish_otkat               = 'Откатку було завершено!';
 MAT_INV_You_must_sel_line          = 'Оберіть дату нарахування зносу!';
 MAT_INV_Operaciya_ne_diysna        = 'Ви не в змозi провести цю операцiю, тому що вона дiйсна лише для податкового облiку! Для бухгалтерського облiку операцiю можно провести у системi "Облiк ТМЦ"';
 MAT_INV_date_create_pereoc         = 'Перiод проведення операцiї';
 MAT_INV_dep_name                   = 'Пiдроздiл';
 MAT_INV_DT_oper                    = 'Дата та час проведення операцiї';

implementation

end.




