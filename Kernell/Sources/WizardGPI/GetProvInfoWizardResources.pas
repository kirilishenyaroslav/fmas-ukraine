unit GetProvInfoWizardResources;

interface

const MAIN_FORM_TITLE          :array[1..2] of String = ('Мастер выставления информации по проводке','Модуль вибору інформації для операції');
const MAIN_FORM_SCH_TITLE      :array[1..2] of String = ('Счет балланса','Рахунок балансу');
const MAIN_FORM_SMT_TITLE      :array[1..2] of String = ('Бюджет','Кошторис');
const MAIN_FORM_RAZ_TITLE      :array[1..2] of String = ('Раздел','Розділ');
const MAIN_FORM_STA_TITLE      :array[1..2] of String = ('Статья','Стаття');
const MAIN_FORM_KVZ_TITLE      :array[1..2] of String = ('Код затрат','Код витрат');
const MAIN_FORM_DB_TITLE       :array[1..2] of String = ('Дебет','Дебет');
const MAIN_FORM_KR_TITLE       :array[1..2] of String = ('Кредит','Кредіт');
const MAIN_FORM_BACK_BUTTON    :array[1..2] of String = ('Назад','Назад');
const MAIN_FORM_OK_BUTTON      :array[1..2] of String = ('Выбрать','Вибрати');
const MAIN_FORM_CLOSE_BUTTON   :array[1..2] of String = ('Отмена','Відмінити');
const MAIN_FORM_AN_TITLE       :array[1..2] of String = ('Аналитика','Аналітика');

const MAIN_FORM_POPUP1         :array[1..2] of String = ('Выбор системы учета','Вибір системи обліку');
const MAIN_FORM_POPUP2         :array[1..2] of String = ('Выбор главного счета','Вибір головного рахунку');
const MAIN_FORM_POPUP3         :array[1..2] of String = ('Выбор счета для корреспонденции','Вибір кореспондуючого рахунку');
const MAIN_FORM_POPUP4         :array[1..2] of String = ('Выбор бюджета','Вибір кошторису');
const MAIN_FORM_POPUP5         :array[1..2] of String = ('Выбор раздела','Вибір розділу');
const MAIN_FORM_POPUP6         :array[1..2] of String = ('Выбор статьи','Вибір статті');
const MAIN_FORM_POPUP7         :array[1..2] of String = ('Выбор кода затрат','Вибір коду витрат');

const CHOOSE_OBJ_CH_TITLE_SM1  :array[1..2] of String = ('Необходимо выбрать бюджет','Необхідно вибрати кошторис');
const CHOOSE_OBJ_CH_TITLE_SM2  :array[1..2] of String = ('Необходимо выбрать бюджет для дебетовой части проводки','Необхідно вибрати кошторис для дебету');
const CHOOSE_OBJ_CH_TITLE_SM3  :array[1..2] of String = ('Необходимо выбрать бюджет для кредитовой части проводки','Необхідно вибрати кошторис для кредіту');

const CHOOSE_OBJ_CH_TITLE_RZ1  :array[1..2] of String = ('Необходимо выбрать раздел бюджета','Необхідно вибрати розділ кошторису');
const CHOOSE_OBJ_CH_TITLE_RZ2  :array[1..2] of String = ('Необходимо выбрать раздел бюджета для дебетовой части проводки','Необхідно вибрати розділ кошторису для дебету');
const CHOOSE_OBJ_CH_TITLE_RZ3  :array[1..2] of String = ('Необходимо выбрать раздел бюджета для кредитовой части проводки','Необхідно вибрати розділ кошторису для кредіту');

const CHOOSE_OBJ_CH_TITLE_ST1  :array[1..2] of String = ('Необходимо выбрать статью бюджета','Необхідно вибрати статтю кошторису');
const CHOOSE_OBJ_CH_TITLE_ST2  :array[1..2] of String = ('Необходимо выбрать статью бюджета для дебетовой части проводки','Необхідно вибрати статтю кошторису для дебету');
const CHOOSE_OBJ_CH_TITLE_ST3  :array[1..2] of String = ('Необходимо выбрать статью бюджета для кредитовой части проводки','Необхідно вибрати статтю кошторису для кредіту');

const CHOOSE_OBJ_CH_TITLE_KV1  :array[1..2] of String = ('Необходимо выбрать код затрат','Необхідно вибрати код витрат');
const CHOOSE_OBJ_CH_TITLE_KV2  :array[1..2] of String = ('Необходимо выбрать код затрат для дебетовой части проводки','Необхідно вибрати код витрат для дебету');
const CHOOSE_OBJ_CH_TITLE_KV3  :array[1..2] of String = ('Необходимо выбрать код затрат для кредитовой части проводки','Необхідно вибрати код витрат для кредіту');

const CHOOSE_OBJ_CH_TITLE_MA_SC:array[1..2] of String = ('Необходимо выбрать главный счет для проводки','Необхідно вибрати головний рахунок');
const CHOOSE_OBJ_CH_TITLE_CO_SC:array[1..2] of String = ('Необходимо выбрать корреспондирующий счет','Необхідно вибрати кореспондуючий рахунок');

const CHOOSE_OBJ_GRID1_COL1    :array[1..2] of String = ('Код бюджета','Код кошторису');
const CHOOSE_OBJ_GRID1_COL2    :array[1..2] of String = ('Наименование бюджета','Найменування кошторису');
const CHOOSE_OBJ_GRID1_COL3    :array[1..2] of String = ('Наименование группы бюджета','Найменування групи кошторису');

const CHOOSE_OBJ_GRID2_COL1    :array[1..2] of String = ('Код','Код');
const CHOOSE_OBJ_GRID2_COL2    :array[1..2] of String = ('Наименование','Найменування');

const ANALITIC_FORM_HEAD_PANEL1 :array[1..2] of String = ('Выберите аналитику по дебетовому счету','Виберіть аналітику дебетового рахунку');
const ANALITIC_FORM_HEAD_PANEL2 :array[1..2] of String = ('Выберите аналитику по кредитовому счету','Виберіть аналітику кредитового рахунку');

const ANALITIC_FORM_RESULT_OK   :array[1..2] of String = ('Выбрана','Вибрана');
const ANALITIC_FORM_RESULT_NONE :array[1..2] of String = ('Не выставляется','Не виставляється');

const FACED_FORM_CAPTION       :array[1..2] of String = ('Работа со встречными документами','Робота з зустрічними документами');
const FACED_FORM_HEADER_PANEL  :array[1..2] of String = ('Выберите общую проводку','Виберіть загальну проводку');
const FACED_FORM_BASE_DOCUMENT :array[1..2] of String = ('Основание документа','Коментар');
const FACED_FORM_OK_BUTTON     :array[1..2] of String = ('Выбрать проводку','Вибрати проводку');
const FACED_FORM_CLOSE_BUTTON  :array[1..2] of String = ('Отмена','Закрити');

const FACED_FORM_BAND1         :array[1..2] of String = ('Информация по документу','Інформація по документу');
const FACED_FORM_BAND2         :array[1..2] of String = ('Информация по проводке','Інформація по проводці');

const FACED_GRID_COLUMN1       :array[1..2] of String = ('Сумма документа','Сума документу');
const FACED_GRID_COLUMN2       :array[1..2] of String = ('Номер документа','Номер документу');
const FACED_GRID_COLUMN3       :array[1..2] of String = ('Тип документа','Тип документу');
const FACED_GRID_COLUMN4       :array[1..2] of String = ('Сумма','Сума');
const FACED_GRID_COLUMN5       :array[1..2] of String = ('Бюджет','Кошторис');
const FACED_GRID_COLUMN6       :array[1..2] of String = ('Раздел','Розділ');
const FACED_GRID_COLUMN7       :array[1..2] of String = ('Статья','Стаття');
const FACED_GRID_COLUMN8       :array[1..2] of String = ('КЭКЗ','КЕКВ');
const FACED_GRID_COLUMN9       :array[1..2] of String = ('Отчетный период','Звітній період');


implementation

end.
