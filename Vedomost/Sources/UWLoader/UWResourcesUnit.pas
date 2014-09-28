unit UWResourcesUnit;

interface

const   IndexLang = 2;
//resourcestring

const   MY_CONST_ADD                    : array [1..2] of string[10]         = ('Додати', 'Добавить');
const   MY_CONST_DELETE                 : array [1..2] of string[10]         = ('Видалити', 'Удалить');
const   MY_CONST_UPDATE                 : array [1..2] of string[10]         = ('Змінити', 'Изменить');
const   MY_CONST_REFRESH                : array [1..2] of string[10]         = ('Відновити', 'Обновить');
const   MY_CONST_CLOSE                  : array [1..2] of string[10]         = ('Закрити', 'Закрыть');
const   MY_CONST_VIH                    : array [1..2] of string[10]         = ('Вихід', 'Выход');
const   MY_CONST_THE_PRINT              : array [1..2] of string[10]         = ('Друк', 'Печать');
const   MY_CONST_HELP                   : array [1..2] of string[10]         = ('Допомога', 'Помощь');
const   MY_CONST_CHOOSE                 : array [1..2] of string[10]         = ('Вибрати', 'Выбрать');
const   MY_CONST_FILTER                 : array [1..2] of string[10]         = ('Фільтр', 'Фильтр');
const   MY_CONST_ANALIZE                : array [1..2] of string[10]         = ('Аналіз', 'Анализ');
const   MY_CONST_SET                    : array [1..2] of string[10]         = ('Встановити', 'Установить');
const   MY_CONST_OK                     : array [1..2] of string[10]         = ('Ввести', 'Ввести');
const   MY_CONST_FIND                   : array [1..2] of string[10]         = ('Пошук', 'Поиск');
const   MY_CONST_PRINT                  : array [1..2] of string[10]         = ('Друкувати', 'Печатать');
const   MY_CONST_PRINT_PRN              : array [1..2] of string[25]         = ('Друкувати на прінтер', 'Печать на принтер');
const   MY_CONST_VALUE_PRINT_CAPTION    : array [1..2] of string[17]         = ('Ознака друку', 'Признак печати');
const   MY_CONST_SHOW                   : array [1..2] of string[10]         = ('Перегляд', 'Просмотр');
const   MY_CONST_BUTTON_OK              : array [1..2] of string[10]         = ('Прийняти', 'Принять');
const   MY_CONST_BUTTON_CANCEL          : array [1..2] of string[10]         = ('Відмінити', 'Отменить');
const   MY_CONST_BUTTON_YES             : array [1..2] of string[2]          = ('Да', 'Да');
const   MY_CONST_BUTTON_NO              : array [1..2] of string[3]          = ('Ні', 'Нет');
const   MY_CONST_BUTTON_CHOOSE          : array [1..2] of string[10]         = ('Вибрати', 'Выбрать');
const   MY_CONST_MESSAGE_WARNING        : array [1..2] of string[10]         = ('Увага!', 'Внимание!');
const   MY_CONST_MESSAGE_ERROR          : array [1..2] of string[10]         = ('Помилка! ', 'Ошибка!');
const   MY_CONST_FATAL_ERROR_SYS        : array [1..2] of string[30]         = ('Помилка в системі безпеки!', 'Ошибка в системе безопасности!');
const   MY_CONST_ERROR_KERNELL          : array [1..2] of string[40]         = ('Помилка ядра (система Головна книга)', 'Ошибка ядра (система Гловна книга)');
const   MY_CONST_FATAL_ERROR            : array [1..2] of string[50]         = ('Фатальна помилка в системі безпеки : ', 'Фатальная ошибка в системе безопасности : ');
const   MY_CONST_ERROR_DONT_WORK        : array [1..2] of string[45]         = ('Ви не маєте права працювати в цій системі!', 'Вы не имеете права работать в этой системе!');
const   MY_CONST_FORM_FORM              : array [1..2] of string[45]         = ('При з''єднанні з БД виникла помилка: " ', 'При соединении с БД возникла ошибка: "');
const   MY_CONST_MESSAGE_HINT           : array [1..2] of string[15]         = ('Попередження!', 'Предупреждение!');
const   MY_CONST_UNDER_CONSTRUCTION     : array [1..2] of string[20]         = ('На стадії розробки', 'На стадии разработки');
const   MY_CONST_DOC_ERROR_KERNELL      : array [1..2] of string[50]         = ('При проведенні документа виникли помилки', 'При проведении документа возникли ошибки');
const   MY_CONST_BUTTON_EXPORT_TO_EXCEL : array [1..2] of string[25]         = ('Експорт до Excel', 'Экспорт в Excel');
const   MY_CONST_FIO                    : array [1..2] of string[5]          = ('ПІБ', 'ФИО');
const   MY_CONST_TAB_NUM                : array [1..2] of string[13]         = ('Таб. номер', 'Таб. номер');
const   MY_CONST_COMMENT                : array [1..2] of string[13]         = ('Коментар', 'Комментарий');
const   MY_CONST_DATE_OPEN              : array [1..2] of string[15]         = ('Дата відкриття', 'Дата открытия');
const   MY_CONST_LIC_SCH                : array [1..2] of string[18]         = ('Особовий рахунок', 'Лицевой счет');
const   MY_CONST_VIHOD                  : array [1..2] of string[48]         = ('Ви дійсно бажаєте вийти з програми?', 'Вы действительно желаете выйти из программы?');
const   MY_CONST_USER                   : array [1..2] of string[15]         = ('Користувач', 'Пользователь');
const   MY_CONST_BASA                   : array [1..2] of string[4]          = ('База', 'База');
const   MY_CONST_OPEN_CONFIG            : array [1..2] of string[48]         = ('Читаємо настройки з файлу "config.ini" ...', 'Считываем настройки из файла "config.ini" ...');
const   MY_CONST_FORM_DATABASE_OPEN     : array [1..2] of string[48]         = ('З''єднуємося з базою даних ...', 'Соединяемся с базой данных ...');
const   MY_CONST_NAME                   : array [1..2] of string[5]          = ('І''мя', 'Имя');
CONST   MY_CONST_PAROL                  : array [1..2] of string[7]          = ('Пароль', 'Пароль');
const   MY_CONST_IDENTIFICATION         : array [1..2] of string[75]         = ('І''мя', 'Идентификация пользователя в подсистеме "Учет ведомостей"');
const   MY_CONST_SP                     : array [1..2] of string[15]         = ('Довідники', 'Справочники');
const   MY_CONST_WORK                   : array [1..2] of string[15]         = ('Робота', 'Работа');
const   MY_CONST_INFO                   : array [1..2] of string[15]         = ('Інформація', 'Информация');
const   MY_CONST_DATE                   : array [1..2] of string[5]          = ('Дата', 'Дата');
const   MY_CONST_NOMER                  : array [1..2] of string[5]          = ('Номер', 'Номер');
const   MY_CONST_SUMMA                  : array [1..2] of string[5]          = ('Сума', 'Сумма');
const   MY_CONST_CHOOSE_SP              : array [1..2] of string[23]         = ('Вибрати з довідника', 'Выбрать из справочника');
const   MY_CONST_SMETA                  : array [1..2] of string[6]          = ('Бюджет', 'Бюджет');
const   MY_CONST_RAZD                   : array [1..2] of string[6]          = ('Розділ', 'Раздел');
const   MY_CONST_STATE                  : array [1..2] of string[7]          = ('Стаття', 'Статья');
const   MY_CONST_KEKV                   : array [1..2] of string[4]          = ('КЕКВ', 'КЭКЗ');
const   MY_CONST_SMETA_S                : array [1..2] of string[6]          = ('Бюдж', 'Бюдж');
const   MY_CONST_RAZD_S                 : array [1..2] of string[6]          = ('Розд', 'Разд');
const   MY_CONST_STATE_S                : array [1..2] of string[7]          = ('Ст', 'Ст');
const   MY_CONST_KEKV_S                 : array [1..2] of string[4]          = ('КЕКВ', 'КЭКЗ');
const   MY_CONST_DOGOVOR                : array [1..2] of string[7]          = ('Договір', 'Договор');
const   MY_CONST_SCH                    : array [1..2] of string[7]          = ('Рахунок', 'Счет');
const   MY_CONST_DELETE_PROV            : array [1..2] of string[45]         = ('Ви дійсно бажаете вилучити проводку - ', 'Вы действительно желаете удалить проводку - ');
const   MY_CONST_PO                     : array [1..2] of string[2]          = ('до', 'по');
const   MY_ABOUT_SYSTEM                 : array [1..2] of string[10]         = ('О системі', 'О системе');
const   MY_N_42                         : array [1..2] of string[40]         = ('Нові можливості та усунення зауважень', 'Новые возможности и устранение замечаний');

const   MY_BASE_HANDLE_ERROR            : array [1..2] of string[35]         = ('Похибка Handl`a Бази', 'Ошибка Handl`a Базы');

const   UV_CAPTION                      : array [1..2] of string[100]        = ('Підсистеми "Облік відомостей" фінансової системи "Бухгалтерія"', 'Подсистемы "Учет ведомостей" финансовой системы "Бухгалтерия"');
const   UV_MAIN_CAPTION                 : array [1..2] of string[48]         = ('Головне вікно підсистеми "Облік відомостей"', 'Главное окно подсистемы "Учет ведомостей"');
const   UV_MAIN_N11                     : array [1..2] of string[48]         = ('Робота з відомостями', 'Работа с ведомостями');
const   UV_MAIN_N12                     : array [1..2] of string[48]         = ('Робота з реєстрами', 'Работа с реестрами');
const   UV_MAIN_N33                     : array [1..2] of string[48]         = ('Довідник типів відомостей', 'Справочник типов ведомостей');
const   UV_MAIN_N34                     : array [1..2] of string[48]         = ('Імпорт банківських карток з DBF-файлу', 'Импорт банковских карточек из DBF-файла');

const   SPBANKCARD_FIO_TN               : array [1..2] of string[15]         = ('ПІБ або ТН', 'ФИО или ТН');
const   SPBANKCARD_CAPTION              : array [1..2] of string[35]         = ('Довідник банківських карток', 'Справочник банковских карточек');
const   SPBANKCARD_DELETE_BANKCARD      : array [1..2] of string[45]         = ('Ви дійсно бажаєте вилучити картку ', 'Вы действительно желаете удалить карточку');
const   SPBANKCARD_ADD_CAPTION          : array [1..2] of string[65]         = ('Вікно редагування банківських карток', 'Окно редактирования банковских карточек');
const   SPBANKCARD_ADD_FLAG_OPEN        : array [1..2] of string[20]         = ('Закрити картку', 'Закрыть карточку');
const   SPBANKCARD_ADD_SELECT_DOG       : array [1..2] of string[20]         = ('Договір з банком', 'Договор с банком');
const   SPBANKCARD_ADD_DONT_LIC         : array [1..2] of string[50]         = ('Особтистий рахунок не повинен бути пустим', 'Лицевой счет не должен быть пустым');
const   SPBANKCARD_ADD_DONT_DOG         : array [1..2] of string[50]         = ('Ви не вибрали договір', 'Вы не выбрали договор');
const   SPBANKCARD_DOG_SHORTNAME        : array [1..2] of string[10]         = ('Назва', 'Название');
const   SPBANKCARD_DOG_NUMBER           : array [1..2] of string[5]          = ('Номер', 'Номер');
const   SPBANKCARD_DOG_DATE             : array [1..2] of string[5]          = ('Дата', 'Дата');
const   SPBANKCARD_DOG_RS               : array [1..2] of string[3]          = ('Р\р', 'Р\с');
const   SPBANKCARD_DOG_NAME_CUST        : array [1..2] of string[20]         = ('Назва контрагенту', 'Название контрагента');
const   SPBANKCARD_DOG_MFO              : array [1..2] of string[3]          = ('МФО', 'МФО');
const   SPBANKCARD_DOG_BANK             : array [1..2] of string[5]          = ('Банк', 'Банк');
const   SPBANKCARD_DOG_OKPO             : array [1..2] of string[7]          = ('ЄДРПОУ', 'ОКПО');
const   SPBANKCARD_DOG_CAPTION          : array [1..2] of string[35]         = ('Довідник банківських договорів', 'Справочник банковских договоров');
const   SPBANKCARD_DOG_DONT_DEL         : array [1..2] of string[75]         = ('Неможливо вилучити договір, бо під ним існують банківсі картки!', 'Нельзя удалить договор, так как под ним существуют банковские карточки!');
const   SPBANKCARD_DOG_ADD_RS_OUR       : array [1..2] of string[75]         = ('Р\р наш', 'Р\с наш');
const   SPBANKCARD_DOG_ADD_RS_CUST      : array [1..2] of string[75]         = ('Р\р контрагенту', 'Р\с контрагента');
const   SPBANKCARD_DOG_ADD_CAPTION      : array [1..2] of string[75]         = ('Форма редагування договору', 'Форма редактирование договора');
const   SPBANKCARD                      : array [1..2] of string[20]         = ('Банківська картка', 'Банковская карточка');

const   VEDOMOST_CAPTION                : array [1..2] of string[35]         = ('Вікно списку відомостей', 'Окно списка ведомостей');
const   VEDOMOST_NAME                   : array [1..2] of string[25]         = ('Тип відомості', 'Тип ведомости');
const   VEDOMOST_DELETE                 : array [1..2] of string[55]         = ('Ви дійсно бажаєте вилучити відомість ', 'Вы действительно желаете удалить ведомость ');
const   VEDOMOST_REESTR_NUMBER          : array [1..2] of string[10]         = ('№ реєстру', '№ реестра');
const   VEDOMOST_DONT_DELETE            : array [1..2] of string[85]         = ('Неможливо вилучити відомість, бо вона вже підлегла під бухгалтерський документ!', 'Нельзя удалить ведомость, так как она уже подложена под бухгалтерский документ!');
const   VEDOMOST_DONT_EDIT              : array [1..2] of string[85]         = ('Неможливо редагувати відомість, бо вона вже підлегла під бухгалтерський документ!', 'Нельзя редактировать ведомость, так как она уже подложена под бухгалтерский документ!');
const   VEDOMOST_DONT_EDIT_REESTR       : array [1..2] of string[85]         = ('Неможливо редагувати відомість, бо існує заява з цією відомістю!', 'Нельзя редактировать ведомость, так как существует реестр с этой ведомостью!');
const   VEDOMOST_DONT_ZAPIS             : array [1..2] of string[85]         = ('Вибачте, але такої відомості вже не існує (вона була вилучена)', 'Извените, но такой ведомости уже не существует (она была удалена)');
const   VEDOMOST_SHOW_ALL_VEDOMOST      : array [1..2] of string[35]         = ('Відображати всі типи відомостей', 'Отображать все типы ведомостей');
const   VEDOMOST_PROV_CAPTION           : array [1..2] of string[35]         = ('Вікно проводок для відомостей', 'Окно проводок для ведомостей');
const   VEDOMOST_OTOBRAJAT              : array [1..2] of string[35]         = ('Відображати відомості з', 'Отображать ведомости с');
const   VEDOMOST_OTOBRAJAT_TYPE         : array [1..2] of string[8]          = ('по типу', 'по типу');
const   VEDOMOST_PROV_DONT_PEOPL        : array [1..2] of string[35]         = ('Ви не вибрали банківську карточку', 'Вы не выбрали банковскую карточку');
const   VEDOMOST_PROV_DONT_SCH          : array [1..2] of string[25]         = ('Ви не вибрали рахунок', 'Вы не выбрали счет');
const   VEDOMOST_PROV_DONT_SMETA        : array [1..2] of string[25]         = ('Ви не вибрали бюджет', 'Вы не выбрали бюджет');
const   VEDOMOST_PROV_DONT_RAZD         : array [1..2] of string[25]         = ('Ви не вибрали розділ', 'Вы не выбрали раздел');
const   VEDOMOST_PROV_DONT_STATE        : array [1..2] of string[25]         = ('Ви не вибрали статтю', 'Вы не выбрали статью');
const   VEDOMOST_PROV_DONT_KEKV         : array [1..2] of string[25]         = ('Ви не вибрали КЕКВ', 'Вы не выбрали КЭКЗ');
const   VEDOMOST_PROV_DONT_DOGOVOR      : array [1..2] of string[25]         = ('Ви не вибрали договір', 'Вы не выбрали договор');
const   VEDOMOST_PROV_DONT_SUMMA        : array [1..2] of string[45]         = ('Сума проводки не повинна дорівнювати нулю', 'Сумма проводки не должна равняться нулю');
const   VEDOMOST_EDIT_CAPTION           : array [1..2] of string[35]         = ('Вікно редагування відомості', 'Окно редактирования ведомости');
const   VEDOMOST_EDIT_NOMBER            : array [1..2] of string[15]         = ('Відомость номер', 'Ведомость номер');
const   VEDOMOST_EDIT_VID               : array [1..2] of string[3]          = ('від', 'от');
const   VEDOMOST_EDIT_PO_TYPE           : array [1..2] of string[7]          = ('по типу', 'по типу');
const   VEDOMOST_TYPE_VEDOM_CAPTION     : array [1..2] of string[27]         = ('Довідник типів відомостей', 'Справочник типов ведомостей');
const   VEDOMOST_TYPE_VEDOM_MAKE_DBF    : array [1..2] of string[20]         = ('вигрузка у DBF-файл', 'выгрузка в DBF-файл');
const   VEDOMOST_TYPE_VEDOM_SEL_DOG     : array [1..2] of string[20]         = ('наявність договору', 'наличие договора');
const   VEDOMOST_TYPE_VEDOM_DONT_DEL    : array [1..2] of string[85]         = ('Неможливо вилучити цей тип відомостей, бо під ним існують банківські картки!', 'Нельзя удалить этот тип ведомости, так как под ним существуют банковские карточки!');
const   VEDOMOST_TYPE_VEDOM_DELETE      : array [1..2] of string[48]         = ('Ви дійсно бажаєте вилучити тип відомості ', 'Вы действительно желаете удалить тип ведомости ');
const   VEDOMOST_TYPE_VEDOM_CAPTION_ADD : array [1..2] of string[37]         = ('Вікно редагування типів відомостей', 'Окно редактирования типов ведомостей');
const   VEDOMOST_TYPE_VEDOM_ADD_NO_NAME : array [1..2] of string[35]         = ('Ви не ввели назву типу відомості', 'Вы не ввели название типа ведомости');
const   VEDOMOST_TYPE_VEDOM_ADD_CAP_SH  : array [1..2] of string[15]         = ('Шаблон друку', 'Шаблон печати');
const   VEDOMOST_TYPE_VEDOM_SHABLO_CAP  : array [1..2] of string[35]         = ('Вікно вибору шаблона друку', 'Окно выбора шаблона печати');

const   VEDOMOST_TYPE_VEDOM_SHABLO_D1   : array [1..2] of string[13]         = ('1-ша посада', '1-я должность');
const   VEDOMOST_TYPE_VEDOM_SHABLO_P1   : array [1..2] of string[13]         = ('1-й підпис', '1-я подпись');
const   VEDOMOST_TYPE_VEDOM_SHABLO_D2   : array [1..2] of string[13]         = ('1-га посада', '2-я должность');
const   VEDOMOST_TYPE_VEDOM_SHABLO_P2   : array [1..2] of string[13]         = ('2-й підпис', '2-я подпись');
const   VEDOMOST_TYPE_VEDOM_SHABLO_TY   : array [1..2] of string[17]         = ('Опис шаблону', 'Описание шаблона');


const   VEDOMOST_REESTR_CAPTION         : array [1..2] of string[37]         = ('Довідник реєстрів відомостей', 'Справочник реестров ведомостей');
const   VEDOMOST_REESTR_EDIT_CAPTION    : array [1..2] of string[40]         = ('Вікно редагування реєстру відомостей', 'Окно редактирования реестра ведомостей');
const   VEDOMOST_REESTR_OTOBRAJAT       : array [1..2] of string[25]         = ('Відображати реєстри з', 'Отображать реестры с');
const   VEDOMOST_REESTR_DATE            : array [1..2] of string[13]         = ('Дата реєстру', 'Дата реестра');
const   VEDOMOST_NAMEDOG                : array [1..2] of string[17]         = ('Назва договору', 'Название договора');
const   VEDOMOST_NOMBER_VEDOM           : array [1..2] of string[15]         = ('Номер відомості', 'Номер ведомости');
const   VEDOMOST_REESTR_DELETE          : array [1..2] of string[48]         = ('Ви дійсно бажаєте вилучити реєстр ', 'Вы действительно желаете удалить реестр ');
const   VEDOMOST_REESTR_DONT_DELETE     : array [1..2] of string[90]         = ('Неможливо вилучити реєстр, бо одна з відомостей вже оброблена у бух.обліку ', 'Невозможно удалить реестр, так как одна из ведомостей обработана в бухгалтерском учете ');
const   VEDOMOST_REESTR_N               : array [1..2] of string[10]         = ('Реєстр №', 'Реестр №');
const   VEDOMOST_REESTR_VID             : array [1..2] of string[3]          = ('від', 'от');
const   VEDOMOST_REESTR_DONT_ZAPIS_E_V  : array [1..2] of string[43]         = ('Неможливо зберігти реєстр без відомостей!', 'Нельзя сохранить реестр без ведомостей!');
const   VEDOMOST_REESTR_DONT_UPDATE     : array [1..2] of string[33]         = ('Неможливо змінити реєстр!', 'Нельзя изменить реестр!');
const   VEDOMOST_REESTR_INTO_BUH        : array [1..2] of string[43]         = (' проведена по бухгалтерському обліку', ' проведена по бухгалтерскому учёту');
const   VEDOMOST_REESTR_INTO_OTHER_R    : array [1..2] of string[33]         = (' належить іншому реєстру', ' принадлежит другому реестру');
const   VEDOMOST_REESTR_PRINT           : array [1..2] of string[15]         = ('Друк реєстру', ' Печать реестра');
const   VEDOMOST_DATE                   : array [1..2] of string[15]         = ('Дата відомості', 'Дата ведомости');

const   VEDOMOST_IMPORT_SCROL_1         : array [1..2] of string[33]         = ('Загальний процент виконання', 'Общий процент выполнения');
const   VEDOMOST_IMPORT_SCROL_2         : array [1..2] of string[33]         = ('Поцент виконання діючої задачи', 'Процент выполнения текущей задачи');
const   VEDOMOST_IMPORT_CAPTION         : array [1..2] of string[33]         = ('Вікно імпорту банківських корток', 'Окно импорта банковских карточек');
const   VEDOMOST_IMPORT_ZAPUSK          : array [1..2] of string[33]         = ('Запуск імпорту', 'Запуск импорта');
const   VEDOMOST_IMPORT_PRINT_CAP       : array [1..2] of string[13]         = ('Друк помилок', 'Печать ошибок');

const   VEDOMOST_VN_VEDOMOST            : array [1..2] of string[10]         = ('Відомість', 'Ведомость');
const   VEDOMOST_VN_PEESTR              : array [1..2] of string[10]         = ('Реєстр', 'Реестр');
const   VEDOMOST_VN_TAKE_ALLREADY       : array [1..2] of string[30]         = ('Ця відомість вже вибрана!', 'Эта ведомость уже выбрана');
const   VEDOMOST_VN_NOT_TAKE            : array [1..2] of string[60]         = ('Ви дійсно бажаєте вилучити відомость з списка?', 'Вы действительно желаете исключить ведомость из списка?');

const   VEDOMOST_VN_L_GRID              : array [1..2] of string[60]         = ('Початкові данні', 'Исходные данные');
const   VEDOMOST_VN_R_GRID              : array [1..2] of string[60]         = ('Результат вибору', 'Результат выбора');

const   V2_TYPE_NOT_NAME                : array [1..2] of string[30]         = ('Заповніть назву!', 'Заполните название!');
const   V2_TYPE_CAPTION                 : array [1..2] of string[50]         = ('Вікно редагування довідника типів виплат', 'Окно редактирования справочника типов выплат');
const   V2_TYPE_NAME_TYPE               : array [1..2] of string[30]         = ('Назва типу виплати', 'Название типа выплаты');
const   V2_TYPE_DELETE                  : array [1..2] of string[48]         = ('Ви дійсно бажаєте вилучити тип виплат ', 'Вы действительно желаете удалить тип выплаты ');
const   V2_TYPE_NAME_CAPTION            : array [1..2] of string[30]         = ('Довідник тип виплат', 'Справочник типов выплат');

const   V2_TYPE_NAME_TAKE               : array [1..2] of string[30]         = ('Виберіть тип виплати', 'Выберите тип выплаты');
const   V2_TYPE_NAME_NOT_TAKE           : array [1..2] of string[30]         = ('Ви не вибрали тип виплати', 'Вы не выберали тип выплаты');
const   V2_TYPE_NAME                    : array [1..2] of string[30]         = ('тип виплати', 'Тип выплаты');
const   V2_VEDOMOST_DOGOVOR             : array [1..2] of string[30]         = ('Виберіть договор', 'Выберите договор');
const   V2_VEDOMOST_CAP_PEOPLE_LIST     : array [1..2] of string[40]         = ('Список згідно з відомістю', 'Список согласно ведомости');
const   V2_VEDOMOST_CAP_DOGOVOR_LIST    : array [1..2] of string[40]         = ('Список заявок на оплату', 'Список заявок на оплату');
const   V2_VEDOMOST_ZAYAVKA             : array [1..2] of string[20]         = ('Зформувати заявку', 'Сформировать заявку');
const   V2_VEDOMOST_DEL_ZAYAVKA         : array [1..2] of string[25]         = ('Разформувати заявку', 'Раcформировать заявку');
const   V2_VEDOMOST_ZAYAVKA_            : array [1..2] of string[40]         = ('Буде зформована заявка на виплату', 'Будет сформирована заявка на выплату');

const   V2_VEDOMOST_DOG_REGNU           : array [1..2] of string[30]         = ('Регіст.номер заявки', 'Регистр.номер заявки');
const   V2_VEDOMOST_DOG_BANK            : array [1..2] of string[25]         = ('Заявка до виплати', 'Заявка до выплаты');
const   V2_VEDOMOST_EXISTS_BANK         : array [1..2] of string[20]         = ('Наявність заявки', 'Наличие заявки');
const   V2_VEDOMOST_PANEL_GROUP         : array [1..2] of string[20]         = ('Панель групування', 'Панель группировки');

const   V2_VEDOMOST_S_ZAYAVKI           : array [1..2] of string[20]         = ('Сума заявки', 'Сумма заявки');
const   V2_VEDOMOST_S_OPLATI            : array [1..2] of string[20]         = ('Сума сплати', 'Сумма оплаты');
const   V2_VEDOMOST_COMMENT             : array [1..2] of string[15]         = ('Коментар: ', 'Комментарий: ');

const   V2_VEDOMOST_ZAYAVKA_D           : array [1..2] of string[20]         = ('Заявка зформована!', 'Заявка сформирована!');
const   V2_VEDOMOST_DEL_ZAYAVKA_        : array [1..2] of string[25]         = ('Заявку розформовано!', 'Заявка расформирована!!');
const   V2_VEDOMOST_SHOW_PEOPLE         : array [1..2] of string[50]         = ('Вікно перегляду людей, що війшли до заявки', 'Окно просмотра людей, которые вошли в заявку');

const   V2_VEDOMOST_KOD_PKV             : array [1..2] of string[20]         = ('Програма', 'Программа');
const   V2_VEDOMOST_TYPE_FIN            : array [1..2] of string[20]         = ('Тип фінанс-я', 'Тип финанс-я');

const   V2_VEDOMOST_FILTER_PEOPLE       : array [1..2] of string[30]         = ('Фільтрувати за людиною', 'Фильтровать по человеку');

implementation

end.
