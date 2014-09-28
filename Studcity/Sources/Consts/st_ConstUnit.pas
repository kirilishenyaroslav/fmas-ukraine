//------------------------------------------
// Studcity
// Файл строковых ресурсов
// Чернявский А.Э.
//------------------------------------------
unit st_ConstUnit;

interface
{Windows}
const  st_Application                :array[1..2] of String=('Студмістечко', 'Студгородок');

const st_Windows_Tiltle              :array[1..2] of String=('Вікна','Окна');
const st_WindowsCacade               :array[1..2] of String=('Каскад','Каскад');
const st_WindowsHorizontal           :array[1..2] of String=('Горизонтально','Горизонтально');
const st_WindowsVertical             :array[1..2] of String=('Вертикально','Вертикально');
const st_WindowsMinimizeAll          :array[1..2] of String=('Звернути усі','Свернуть все');
const st_WindowsCloseAll             :array[1..2] of String=('Закрити усі','Закрыть все');
const st_WindowsOnTop                :array[1..2] of String=('Відновити','Восстановить');
{Form_Titles}
const st_Connect_Tiltle              :array[1..2] of String=('З''єднання: ','Соединение: ');
const st_ReestrContracts_Tiltle      :array[1..2] of String=('Реєстр контрактів','Реестр контрактов');
const st_DBInfo_Tiltle               :array[1..2] of String=('Підключення до БД','Подключение к БД');
const st_FileVersion                 :array[1..2] of String=('Версія: ','Версия: ');
const st_AssemblingVersion           :array[1..2] of String=('Зборка: ','Сборка: ');
const st_ConnectionInfo              :array[1..2] of String=('Інформація про з''єднання','Информация про подключение');
const st_ApplicationName             :array[1..2] of String=('Ім''я файлу: ','Имя приложения: ');
const st_ApplicationWay              :array[1..2] of String=('Розміщення файлу: ','Путь к приложению: ');
const st_FileVersionFull             :array[1..2] of String=('Версія файлу: ','Версия файла: ');
const st_AssemblingDate              :array[1..2] of String=('Дата зборки: ','Дата сборки: ');
const st_DBWay                       :array[1..2] of String=('Розміщення файлу БД: ','Путь к базе данных: ');
const st_FilterText                  :array[1..2] of String=('введіть прізвище','введите фамилию');
const st_HelpText                    :array[1..2] of String=('Допомога','Помощь');
const st_ContractsReestrText         :array[1..2] of String=('Реєстр контрактів','Реестр контрактов');
const st_NowDate_Caption             :array[1..2] of String=('Сьогодні: ','Сегодня: ');
const st_RaschetSchet_Title          :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');
const st_PaspDataCaption             :array[1..2] of String=('Паспортні дані','Паспортные данные'); 
{LoginInfo}
const st_Login                       :array[1..2] of String=('Логін: ','Логин: ');
const st_User                        :array[1..2] of String=('Користувач: ','Пользователь: ');
const st_UserUser                    :array[1..2] of String=('Логін:  ','Псевдоним (логин): ');
const st_FIOUser                     :array[1..2] of String=('ПІБ:  ','ФИО:  ');
const st_UserRole                    :array[1..2] of String=('Група (роль):  ','Группа (роль):  ');


const st_Hint                        :array[1..2] of String=('Підказка : ','Подсказка : ');
const st_FirstBootHint               :array[1..2] of String=('Подвійний клік - завантаження форми РЕЄСТРАЦІЇ ПРОЖИВАЮЧИХ','Двойной щелчок левой кнопкой мыши - загрузка формы РЕГИСТРАЦИИ ПРОЖИВАЮЩИХ');
{Date_Formats}
const st_Year_Short                  :array[1..2] of String=(' рр.',' гг.');

{ShortCuts}
const st_HelpBtn_ShortCut            :array[1..2] of String=('F1 ', 'F1 ');
const st_InsertBtn_ShortCut          :array[1..2] of String=('Ins ', 'Ins ');
const st_EditBtn_ShortCut            :array[1..2] of String=('F2 ','F2 ');
const st_DeleteBtn_ShortCut          :array[1..2] of String=('Del ','Del ');
const st_RefreshBtn_ShortCut         :array[1..2] of String=('F5 ', 'F5 ');
const st_ExitBtn_ShortCut            :array[1..2] of String=('Esc ','Esc ');
const st_FilterBtn_ShortCut          :array[1..2] of String=('Ctrl+F ','Ctrl+F ');
const st_EnterBtn_ShortCut           :array[1..2] of String=('Enter ','Enter ');
const st_F6Btn_ShortCut              :array[1..2] of String=('F6 ','F6 ');
const st_CtrlF8Btn_ShortCut          :array[1..2] of String=('Ctrl+F8 ','Ctrl+F8 ');
const st_F9Btn_ShortCut              :array[1..2] of String=('F9 ','F9 ');
const st_F8Btn_ShortCut              :array[1..2] of String=('F8 ','F8 ');
const st_PrintBtn_ShortCut           :array[1..2] of String=('Ctrl+P ','Ctrl+P ');

{All_Actions}
const st_HelpBtn_Caption             :array[1..2] of String=('Помошь','Допомога');
const st_InsertBtn_Caption           :array[1..2] of String=('Додати','Добавить');
const st_EditBtn_Caption             :array[1..2] of String=('Редагувати','Редактировать');
const st_DeleteBtn_Caption           :array[1..2] of String=('Видалити','Удалить');
const st_RefreshBtn_Caption          :array[1..2] of String=('Обновити', 'Обновить');
const st_ExitBtn_Caption             :array[1..2] of String=('  Вихід  ','  Выход  ');
const st_FilterBtn_Caption           :array[1..2] of String=('Фільтр','Фильтр');
const st_FilterZBtn_Caption          :array[1..2] of String=('Фільтр З','Фильтр С');
const st_SearchBtn_Caption           :array[1..2] of String=('Пошук','Поиск');
const st_Print_Caption               :array[1..2] of String=('Друкувати',' Печать ');
const st_Pay_Caption                 :array[1..2] of String=('Оплата','Оплата');
const st_Lgota_Caption               :array[1..2] of String=('Пільги','Льготы');
const st_EntryRest_Caption           :array[1..2] of String=('Вхідний залишок','Входящий остаток');
const st_History                     :array[1..2] of String=('Історія','История');
const st_SelectBtn_Caption           :array[1..2] of String=('Вибрати','Выбрать');
const st_ViewBtn_Caption             :array[1..2] of String=('Перегляд','Просмотр');
const st_PropiBtn_Caption            :array[1..2] of String=('Прописка','Прописка');
const st_NarushBtn_Caption           :array[1..2] of String=('Порушення','Нарушения');
const st_NakazBtn_Caption            :array[1..2] of String=('Накази','Приказы');
const st_ProgressBtn_Caption         :array[1..2] of String=('Відсоток виконання поточного завдання','Процент выполнения  текущей задачи');
const st_SearchByIdFIOCaption        :array[1..2] of String=('За П.І.Б.','По ФИО');
const st_SearchByIdNalogCaption      :array[1..2] of String=('За Ід.кодом','По ид.коду');
const st_SearchByBarcodeCaption      :array[1..2] of String=('За штрих кодом','По штрих коду'); 
const st_SpyMonutor_Caption          :array[1..2] of String=('Моніторінг запису','Мониторинг записи');
const st_ZaNom                       :array[1..2] of String=('За номером', 'По номеру');
const st_ZaName                      :array[1..2] of String=('За найм.', 'По наим.');
const st_Select_Caption              :array[1..2] of String=('Вибрати ', 'Выбрать');
const st_WhatsNew_Caption            :array[1..2] of String=('Що нового?', 'Что нового?');
const st_Inc_Caption                 :array[1..2] of String=('Інк', 'Инк');
const st_Inc_Hint                    :array[1..2] of String=('Інкрементальний пошук у таблиці за прізвищем', 'Инкрементальный поиск в таблице по фамилии');
const st_BuildNum_Caption            :array[1..2] of String=('Номер будинку', 'Номер дома');

{Hints}
const st_FioSearch_Hint              :array[1..2] of String=('Фільтр за прізвищем та налоговим номером','Фильтр по фамилии\налоговому номеру');
const st_ReestrFilter_Hint           :array[1..2] of String=('Фільтр за періодом реєстрації','Фильтрация по периоду регистрации');
const st_CancelFilter_Hint           :array[1..2] of String=('Відмінити фільтр','Отменить фильтр');
const st_GoFilter_Hint               :array[1..2] of String=('Застосувати фільтр','Отфильтровать записи');
const st_NalofFilter_Hint            :array[1..2] of String=('Фільтр за податковим номером','Фильтр по налоговому номеру');
const st_FIOFilter_Hint              :array[1..2] of String=('Фільтр за прізвищем','Фильтр по фамилии');
const st_Combo_Hint                  :array[1..2] of String=('','Введите полностью или часть фамилии либо ид.кода');
const st_Subsidy_Modify              :array[1..2] of String=('Змінити субсидії','Изменить субсидии');
const st_Lgots_Modify                :array[1..2] of String=('Змінити пільги','Изменить льготы');
{const st_ Hint           :array[1..2] of String=('','');
const st_ Hint           :array[1..2] of String=('','');
}
{Confirms}
const st_Confirmation_Caption        :array[1..2] of String=('Підтвердження','Подтверждение');
const st_ExitPromt                   :array[1..2] of String=('Ви дійсно бажаєте вийти?', 'Вы действительно хотите выйти?');
const st_DeletePromt                 :array[1..2] of String=('Ви дійсно бажаєте видалити запис?', 'Вы действительно хотите удалить запись?');
const st_Accept                      :array[1..2] of String=('Прийняти','Принять');
const st_Cancel                      :array[1..2] of String=('Відмінити','Отмена');
const st_SafeData                    :array[1..2] of String=('Зберегти дані?','Сохранить данные?');
{ApplicationInitialise}
const st_Application_Caption         :array[1..2] of String=('Студмістечко','Студгородок');
const st_Main_Ready_Caption          :array[1..2] of String=('Готовий','Готов');
const st_Main_StatusBar_Caption      :array[1..2] of String=('Панель інформації','Панель информации');
const st_HotKeys                     :array[1..2] of String=('Горячі клавіши','Горячие клавиши');
{MainButtons}
const st_Main_WorkBtn_Caption        :array[1..2] of String=('Робота','Работа');
const st_Main_SpravBtn_Caption       :array[1..2] of String=('Довідники','Справочники');
const st_Main_ZvitBtn_Caption        :array[1..2] of String=('Звіти','Отчеты');
const st_Main_SlygBtn_Caption        :array[1..2] of String=('Служби','Службы');
const st_Main_OptionsBtn_Caption     :array[1..2] of String=('Опції','Опции');
const st_Main_AboutBtn_Caption       :array[1..2] of String=('Про програму','О программе');
const st_Main_ExitBtn_Caption        :array[1..2] of String=('Вихід','Выход');
{MainWork}
const st_Main_Registration           :array[1..2] of String=('Реєстрація','Регистрация');
const st_BuildRoomLook               :array[1..2] of String=('Перегляд даних про гуртожитки та кімнати','Просмотр данных по общежитиям и комнатам');
const st_ROVDList                    :array[1..2] of String=('Список осіб на прописку для РВВС ','Список РОВД на прописку');
const st_UniversalVisa               :array[1..2] of String=('Список осіб, які одержали універсальну перепустку','Список лиц, получивших универсальный пропуск');
const st_SchWork                     :array[1..2] of String=('Робота з рахунками','Работа со счетами');
const st_Subcidy                     :array[1..2] of String=('Субсидії','Субсидии');
{SubMain}
const st_SubcidyList                 :array[1..2] of String=('Списки на субсидію','Списки субсидируемых');
const st_EntrySubcidyList            :array[1..2] of String=('Прийом списків на субсидію','Прием списка субсидированных');
const st_WorkEntrySubcidyList        :array[1..2] of String=('Обробка списків на субсидію','Обработка списка субсидируемых');
const st_UsersLook                   :array[1..2] of String=('Показати список користувачів','Показать список пользователей');
const st_ErrorsLook                  :array[1..2] of String=('Показати список помилок','Показать список ошибок');
const st_UserInfo                    :array[1..2] of String=('Інформація про користувача','Информация о пользователе');
const st_LoginHide                   :array[1..2] of String=('Ховати логін','Скрывать логин');
const st_TrayHide                    :array[1..2] of String=('Згортати у трей','Сворачивать в трей');
const st_printsForms                 :array[1..2] of String=('Печатні форми','Печатные формы');
const st_System                      :array[1..2] of String=('Система','Система');
const st_Site                        :array[1..2] of String=('Сайт розробників','Сайт разработчиков');
const st_Mail                        :array[1..2] of String=('Лист до розробників','Письмо разработчикам');
const st_Forum                       :array[1..2] of String=('Форум','Форум');
const st_NeedRelax                   :array[1..2] of String=('Треба відпочити?','Нужно отдохнуть?');
const st_PaykPlay                    :array[1..2] of String=('Спробуйте розкласти пасьянс "Павук"!','Попробуйте разложить пасьянс "Паук"!');
const st_About                       :array[1..2] of String=('Про програму','О программе');

const st_SubSystem                   :array[1..2] of String=('Підсистема Студмістечко','Подсистема Студгородок');
const st_LastCompile                 :array[1..2] of String=('Остання зборка від: ','Последння сборка от: ');

{Errors}
const st_Error_Caption               :array[1..2] of String=('Помилка','Ошибка');
const st_Error_LoadBPL_Text          :array[1..2] of String=('Помилка при завантаженні пакету','Ошибка при загрузке пакета');

{MainGuides}
const  st_main_fiz_lica              :array[1..2] of String=('Довідник фізичних осіб', 'Справочник физических лиц');
const  st_Main_Lgot                  :array[1..2] of String=('Довідник пільг', 'Справочник льгот');
const  st_Main_Kat                   :array[1..2] of String=('Довідник категорій оплати', 'Справочник категорий оплаты');
const  st_Main_Builds                :array[1..2] of String=('Довідник гуртожитків', 'Справочник общежитий');
const  st_Main_Propi_Builds          :array[1..2] of String=('Довідник адрес прописки', 'Справочник адресов прописки');
const  st_Main_Subsidy               :array[1..2] of String=('Довідник субсидій', 'Справочник субсидий');
const  st_Main_Pidpozdiliv           :array[1..2] of String=('Довідник підрозділів', 'Справочник подразделений');
const  st_Main_KatClass              :array[1..2] of String=('Довідник класів категорій', 'Справочник классов категорий');
const  st_Main_KatType               :array[1..2] of String=('Довідник типів категорій', 'Справочник типов категорий');
const  st_Main_SubStage              :array[1..2] of String=('Довідник стану субсидій', 'Справочник состояний субсидий');
const  st_Main_TypeRoom              :array[1..2] of String=('Довідник типів кімнат', 'Справочник типов комнат');
const  st_Main_LiveInBuilds          :array[1..2] of String=('Довідник тих, хто мешкає у гуртожитку', 'Справочник проживающих в общежитиях');
const  St_Services_title             :array[1..2] of string=('Довідник послуг', 'Справочник услуг');

{Report_name}
const st_report_lgot                 :array[1..2] of string=('Звіт по пільговикам', 'Отчет по льготникам');
const st_report_hist_propisk         :array[1..2] of string=('Історія проживання', 'История проживания');

{Registration_Grid}
const  st_grid_FIO_Column            :array[1..2] of String=('П.І.Б.', 'Ф.И.О.');
const  st_grid_Date_Dog_Column       :array[1..2] of String=('Дата укладання', 'Дата заключения');
const  st_grid_Num_Nalog_Column      :array[1..2] of String=('Налог.номер', 'Налог.номер');
const  st_grid_Date_Beg              :array[1..2] of String=('Дата початку', 'Дата начала');
const  st_grid_Date_End              :array[1..2] of String=('Дата закінчення', 'Дата окончания');
const  st_grid_Hostel                :array[1..2] of String=('Гурт.', 'Общ.');
const  st_grid_HostelRoom            :array[1..2] of String=('Кімната', 'Комната');


const  st_footer_Faculty             :array[1..2] of String=('Факультет', 'Факультет');
const  st_footer_Spec                :array[1..2] of String=('Спеціальність', 'Специальность');
const  st_footer_Group               :array[1..2] of String=('Група', 'Группа');
const  st_footer_FormStudy           :array[1..2] of String=('Форма навчання', 'Форма обучения');
const  st_footer_Category            :array[1..2] of String=('Категорія', 'Категория');
const  st_footer_Kurs                :array[1..2] of String=('Курс', 'Курс');
const  st_Gragdanstvo                :array[1..2] of String=('Громадянство', 'Гражданство');
const  st_Status                     :array[1..2] of String=('Статус', 'Статус');
const  st_Dog                        :array[1..2] of String=('Договір', 'Договор');
const  st_Propuk                     :array[1..2] of String=('Перепустка', 'Пропуск');

const  st_Fam                        :array[1..2] of String=('Прізвище', 'Фамилия');
const  st_Name                       :array[1..2] of String=('Ім''я', 'Имя');
const  st_Otch                       :array[1..2] of String=('По батькові', 'Отчество');
const  st_DateBorn                   :array[1..2] of String=('Дата народження', 'Дата рождения');
const  st_Sex                        :array[1..2] of String=('Стать', 'Пол');
const  st_Inostr                     :array[1..2] of String=('Іноземець', 'Иностранец');
const  st_WithPropi                  :array[1..2] of String=('З пропискою', 'С пропиской');
const  st_PropPrint                  :array[1..2] of String=('Друкувати перепустку', 'Печатать пропуск');
const  st_Nomer                      :array[1..2] of String=('Номер', 'Номер');
const  st_Room                       :array[1..2] of String=('Кімната', 'Комната');
const  st_Type                       :array[1..2] of String=('Тип', 'Тип');
const  st_Identify                   :array[1..2] of String=('Ідентифікація', 'Идентификация');
const  st_Study                      :array[1..2] of String=('Навчання', 'Обучение');
const  st_Pidrozdil                  :array[1..2] of String=('Підрозділ', 'Подразделение');
const  st_Live                       :array[1..2] of String=('Проживання', 'Проживание');
const  st_Category                   :array[1..2] of String=('Категорія', 'Категория');
const  st_Z                          :array[1..2] of String=('З', 'С');
const  st_Po                         :array[1..2] of String=('По', 'По');
const  st_DogNomer                   :array[1..2] of String=('Номер договору', 'Номер договора');
const  st_DogDate                    :array[1..2] of String=('Дата договору', 'Дата договора');
const  st_TabNomer                   :array[1..2] of String=('Таб.номер', 'Таб.номер');
const  st_NalogNomer                 :array[1..2] of String=('Податк.номер', 'Налог.номер');
const  st_CategoryAll                :array[1..2] of String=('Категорії', 'Категории');
const  st_dop_serv                   :array[1..2] of string=('Дод. послуги','Доп. услуги');
const  st_SubsAll                    :array[1..2] of String=('Субсидії', 'Субсидии');
const  st_LgotsAll                   :array[1..2] of String=('Пільги', 'Льготы');
const  st_Aditional                  :array[1..2] of String=('Доповнення', 'Дополонение');
const  st_EntryRest                  :array[1..2] of String=('Вх.залишок', 'Вх.остаток');
const  st_Hostel                     :array[1..2] of String=('Гуртожиток', 'Общежитие');
const  st_CategoryCode               :array[1..2] of String=('Код категорії', 'Код категории');
const  st_Begin                      :array[1..2] of String=('Початок', 'Начало');
const  st_End                        :array[1..2] of String=('Закінчення', 'Окончание');
const  st_KolVoMes                   :array[1..2] of String=('Кіль-сть міс.', 'Кол-во мес.');
const  st_State                      :array[1..2] of String=('Стан', 'Состояние');
const  st_Sum                        :array[1..2] of String=('Сума', 'Сумма');
const  st_LgCode                     :array[1..2] of String=('Код пільги', 'Код льготы');
const  st_PikazDate                  :array[1..2] of String=('Дата наказу', 'Дата приказа');
const  st_PrikazNomer                :array[1..2] of String=('Номер наказу', 'Номер приказа');
const  st_WorkPlace                  :array[1..2] of String=('Місце роботи', 'Место работы');
const  st_WorkPosada                 :array[1..2] of String=('Посада', 'Должность');
const  st_Rasch                      :array[1..2] of String=('Розрахунок', 'Расчет');
const  st_IstFinance                 :array[1..2] of String=('Джерела фінансування', 'Источники финансирования');
const  st_IstFinanceHint             :array[1..2] of String=('Розбити суму автоматично  | Автоматична розбивка суми за джерелами фінансування ', 'Разбить сумму автоматически  | Автоматическое разбиение суммы по источникам финансирования');
const  st_HostelNomer                :array[1..2] of String=('№ будинку', '№ здания');
const  st_RoomNomer                  :array[1..2] of String=('№ кімнати', '№ комнаты');
const  st_RoomType                   :array[1..2] of String=('Тип кімнати', 'Тип комнаты');
const  st_SubType                    :array[1..2] of String=('Тип субсидії', 'Тип субсидии');
const  st_Comments                   :array[1..2] of String=('Коментар', 'Комментарий');
const  st_LgNomer                    :array[1..2] of String=('Номер пільги', 'Номер льготы');
const  st_Smeta                      :array[1..2] of String=('Кошторис', 'Смета');
const  st_Razdel                     :array[1..2] of String=('Розділ', 'Раздел');
const  st_Stat                       :array[1..2] of String=('Стаття', 'Статья');
const  st_KEKV                       :array[1..2] of String=('КЕКВ', 'КЭКЗ');
{Oplata_Analiz}
const  st_Form_Opl                   :array[1..2] of String=('Форма аналізу оплати', 'Форма анализа оплаты');
const  st_Beg_Opl                    :array[1..2] of String=('Початок періоду', 'Начало периода');
const  st_End_Opl                    :array[1..2] of String=('Закінчення періоду', 'Конец периода');
const  st_Summa_Opl                  :array[1..2] of String=('Сума оплати за місяць, грн', 'Сумма оплаты в месяц, грн');
const  st_Percent_Opl                :array[1..2] of String=('Відсоток оплати, %', 'Процент оплаты, %');
const  st_SubsSumma_Opl              :array[1..2] of String=('Сума житлової субсидії, грн', 'Сумма жилищной субсидии, грн');
const  st_MonthCount_Opl             :array[1..2] of String=('Кіл-сть місяців', 'Кол-во месяцев');
const  st_SummFinal_Opl              :array[1..2] of String=('Сума оплати. грн', 'Сумма к оплате, грн');
const  st_NumDoc_Pay                 :array[1..2] of String=('Документ №', 'Документ №');
const  st_DateDoc_Pay                :array[1..2] of String=('Дата докум.', 'Дата докум.');
const  st_Percent                    :array[1..2] of String=('Відсоток', 'Процент');
const  st_Summa                      :array[1..2] of String=('Сума', 'Сумма');
const  st_Summa_Pay                  :array[1..2] of String=('Сума, грн.', 'Сумма, грн.');
const  st_Need_Pay                   :array[1..2] of String=('Треба сплатити:', 'Надо оплатить:');
const  st_Was_Pay                    :array[1..2] of String=('Вже сплачено:', 'Уже оплачено:');
const  st_PayPo_Pay                  :array[1..2] of String=('Сплачено по ', 'Оплачено по ');
const  st_Now_Pay                    :array[1..2] of String=('До сплати на сьогодні', 'К оплате на сегодня:');
const  st_Itogo_Pay                  :array[1..2] of String=('Разом', 'Итого');
const  st_Zadolg_Pay                 :array[1..2] of String=('Заборгованість:', 'Задолженность:');
const  st_Hint_Pay                   :array[1..2] of String=('Документи оплати не знайдено', 'Документы оплаты не найдены');
{Wait_Form}
const  st_GoingWait                  :array[1..2] of String=('Йде обробка записів', 'Идет обработка записей');
const  st_PleaseWait                 :array[1..2] of String=('Будь ласка, зачекайте...', 'Пожалуйста, подождите...');

const st_Zareestr                    :array[1..2] of String=('Зареєстрував: ', 'Зарегистрировал: ');
const st_DateZareestr                :array[1..2] of String=('Дата реєстрації: ', 'Дата регистрации: ');
const st_Izmenil                     :array[1..2] of String=('Змінив: ', 'Изменил:');
const st_DateIzmenil                 :array[1..2] of String=('Дата змінення: ', 'Дата изменения:');


const  st_ShortLable                 :array[1..2] of String=('Скорочення:', 'Сокращение:');
const  st_TypeLable                  :array[1..2] of String=('Тип:', 'Тип:');
const  st_ClassLable                 :array[1..2] of String=('Клас:', 'Класс:');
const  st_NameLable                  :array[1..2] of String=('Найменування', 'Наименование');

{Category's}
const  st_Stud_Cat                   :array[1..2] of String=('Студентська категорія', 'Студенческая категория');
const  st_Month_Cat                  :array[1..2] of String=('Оплата щомісячно', 'Оплата помесячно');
const  st_NoLivers_Cat               :array[1..2] of String=('Без проживання', 'Без проживания');
const  st_PropiOnly_Cat              :array[1..2] of String=('Тільки прописка', 'Только прописка');
const  st_PaySum_Cat                 :array[1..2] of String=('Сума оплати', 'Сумма оплаты');
const  st_SubsMax_Cat                :array[1..2] of String=('Субс. макс.', 'Субс. макс.');
const  st_SubsSum_Cat                :array[1..2] of String=('Субс. сума', 'Субс. сумма');
const  st_Sums_Cat                   :array[1..2] of String=('Суми', 'Суммы');
const  st_CopyCells                  :array[1..2] of String=('Копіювати', 'Копировать');
const  st_CopyCellsFullName          :array[1..2] of String=('Копіювати запис', 'Копировать запись');
const  st_SubPercent                 :array[1..2] of String=('Відсоток субсидії', 'Процент субсидии');
const  st_SummaSliv                  :array[1..2] of String=('Сума нарахувань', 'Сумма начислений');
const  st_PercentSliv                :array[1..2] of String=('Відсоток нарахувань', 'Процент начислений');
const  st_SubSumma                   :array[1..2] of String=('Сума субсидії', 'Сумма субсидии');
const  st_PercentOnly                :array[1..2] of String=('Відсоток', 'Процент');

{поиск}
const  st_Search_Name             :array[1..2] of String=('Пошук за найменуванням', 'Поиск по наименованию');
const  st_Search_Num              :array[1..2] of String=('Пошук за номером', 'Поиск по номеру');
const  st_FindNow                 :array[1..2] of String=('Знайти!', 'Найти!');

{Messages}
const  st_mess_NoCategoryDelete   :array[1..2] of String=('Видалити неможливо. Дана категорія використовується.', 'Удалить невозможно. Данная категория используется.');
const  st_mess_NoSubsidyDelete    :array[1..2] of String=('Видалити неможливо. Дана субсидія використовується.', 'Удалить невозможно. Данная субсидия используется.');
const  st_mess_NoSubStateDelete   :array[1..2] of String=('Видалити неможливо. Даний стан субсидії  використовується.', 'Удалить невозможно. Данное состояние субсидии используется.');

const  st_mess_NoItemDelete       :array[1..2] of String=('Видалити неможливо. Дане найменування використовується.', 'Удалить невозможно. Данное наименование используется.');

const  st_mess_Code_need          :array[1..2] of String=('Введений код не вірний', 'Введен неверный код');
const  st_mess_ShortName_need     :array[1..2] of String=('Необхідно ввести скорочену назву', 'Необходимо ввести сокращенное наименование');
const  st_mess_FullName_need      :array[1..2] of String=('Необхідно ввести найменування', 'Необходимо ввести наименование');
const  st_mess_TypeLive_need      :array[1..2] of String=('Необхідно вказати тип проживання', 'Необходимо указать тип проживания');
const  st_mess_ClassLive_need     :array[1..2] of String=('Необхідно вказати клас проживання', 'Необходимо указать класс проживания');
const  st_mess_Summs_need         :array[1..2] of String=('Необхідно заповнити суми', 'Необходимо заполнить суммы');
const  st_NotHaveRights           :array[1..2] of String=('Ви не маєте достатніх прав для здійснення даної дії!', 'У Вас недостаточно прав для совершения данного действия.');
const  st_GoToAdmin               :array[1..2] of String=('Для розширення Ваших повноважень зверніться до Адміністратора.', 'Для расширения Ваших полномочий обратитесь к Администратору.');
const  st_ActionDenied            :array[1..2] of String=('Дія заборонена!','Действие запрещено!');

const  st_SubsName_need           :array[1..2] of String=('Необхідно ввести найменування субсидії', 'Необходимо ввести наименование субсидии');
const  st_SubsShort_need          :array[1..2] of String=('Необхідно ввести скорочене найменування субсидії', 'Необходимо ввести соокращенное наименование субсидии');
const  st_SubsMin_need            :array[1..2] of String=('Необхідно ввести мінімальний період субсидії', 'Необходимо ввести минимальный период субсидии');
const  st_SubsMax_need            :array[1..2] of String=('Необхідно ввести максимальний період субсидії', 'Необходимо ввести максимальный период субсидии');
const  st_SubsMonth_need          :array[1..2] of String=('Необхідно кількість місяців', 'Необходимо ввести кол-во месяцев');
const  st_SubsMinNotCorrect       :array[1..2] of String=('Мінімальний період субсидії введений невірно', 'Минимальный период субсидии введен неверно');
const  st_SubsMaxNotCorrect       :array[1..2] of String=('Максимальний період введений невірно', 'Максимальный период субсидии введен неверно');
const  st_SubsMinMaxMore_need     :array[1..2] of String=('Мінімальний період повинен бути не більше, ніж максимальний', 'Минимальный период должен быть не больше максимального');
const  st_SubsMonthNotCorrect     :array[1..2] of String=('Кількість місяців введено невірно', 'Кол-во месяцев введено неверно');

const  st_CatAddBegDate_need             :array[1..2] of String=('Необхідно ввести дату початку', 'Необходимо ввести дату начала');
const  st_CatAddEndDate_need             :array[1..2] of String=('Необхідно ввести дату закінчення', 'Необходимо ввести дату окончания');
const  st_CatAddBegMoreEnd_need          :array[1..2] of String=('Дата початку повинна бути меньше, ніж дата закінчення', 'Дата начала должна быть меньше даты окончания');
const  st_CatAddSummNotCorrect           :array[1..2] of String=('Сума введена невірно', 'Сумма введена неверно');
const  st_CatAddSubsSumNotCorrect        :array[1..2] of String=('Субс. сума введена невірно', 'Субс. сумма введена неверно');
const  st_CatAddIstFinaceNotCorrect      :array[1..2] of String=('Необхідно ввести джерела фінансування', 'Необходимо ввести источники финансирования');
const  st_CatAddSumPercSubsNotCorrect    :array[1..2] of String=('Сумарный відсоток за субсидіями не може перевищувати (чи бути меньш) 100%. Внесіть зміни.', 'Суммарный процент по субсидиям не может превышать (либо быть менее) 100%. Внесите изменения');
const  st_CatAddSumPercOtchNotCorrect    :array[1..2] of String=('Сумарный відсоток відрахувань не може перевищувати (чи бути меньш) 100%. Внесіть зміни.', 'Суммарный процент отчислений не может превышать (либо быть менее) 100%. Внесите изменения');
const  st_CatAddPercSubsSubSTONotCorrect :array[1..2] of String=('Відсоток за субсидіями не може бути мень, ніж ', 'Процент субсидии не может быть менее 100%. Внесите изменения');
const  st_CatAddFinSubsNotCorrect        :array[1..2] of String=('Значення субсидії не співпадає з сумарним значенням розбивки. Внесіть зміни.', 'Значение субсидии не совпадает с суммарным значением разбивки. Внесите изменения');
const  st_CatAddFinSumNotCorrect         :array[1..2] of String=('Значення суми оплати не співпадає з сумарним значенням розбивки. Внесіть зміни.', 'Значение cуммы оплаты не совпадает с суммарным значением разбивки. Внесите изменения');
const  st_CatAddOtchPercSTOMORE_need     :array[1..2] of String=('Сумарный відсоток відрахувань (відсоток за субсидіями) не може перевищувати 100%', 'Суммарный процент отчислений (процент субсидий) не может превышать 100%');
const  st_Percent_need                   :array[1..2] of String=('Необхідно ввести відсоток', 'Необходимо ввести процент');
const  st_PercentNotCorrect              :array[1..2] of String=('Відсоток введено невірно', 'Процент введен неверно');
const  st_PercentMoreCTONotCorrect       :array[1..2] of String=('Відсоток введено невірно: не може перевищувати 100%', 'Процент введен неверно: не может превышать 100%');
const  st_CategoryDontAdd                :array[1..2] of String=('Неможливо додати! Вже існує категорія з таким кодом!', 'Невозможно добавить! Категория с таким кодом уже существует!');

const  st_SafeQuery                       :array[1..2] of String=('Зберегти дані?', 'Сохранить данные ?');
const  st_Query                           :array[1..2] of String=('Увага!', 'Внимание!');
{источники финансирования}
const  st_1                        :array[1..2] of String=('Введіть відсоток відрахувань', 'Введите процент отчислений');
const  st_2                        :array[1..2] of String=('Введіть номер кошторису', 'Введите номер сметы');
const  st_3                        :array[1..2] of String=('Введіть номер розділу', 'Введите номер раздела');
const  st_4                        :array[1..2] of String=('Введіть номер статті', 'Введите номер статьи');
const  st_5                        :array[1..2] of String=('Введіть номер КЕКВ', 'Введите номер КЭКЗ');
const  st_6                        :array[1..2] of String=('Сума відрахувань введена невірно', 'Сумма отчислений введена неверно');
const  st_7                        :array[1..2] of String=('Відсоток відрахувань введено невірно', 'Процент отчислений введен неверно');
const  st_8                        :array[1..2] of String=('Відсоток відрахувань не може перевищувати 100%', 'Процент отчислений не может быть более 100 %');
const  st_9                        :array[1..2] of String=('Відсоток за субсидіями не може перевищувати 100%', 'Процент субсидии не может быть более 100 %');
const  st_10                       :array[1..2] of String=('Сума відрахувань не може бути нульовою', 'Сумма отчислений не может быть нулевой');
const  st_11                       :array[1..2] of String=('Сполучення кошторис-розділ-стаття введено невірно. Внесіть зміни', 'Сочетание смета-раздел-статья неверно. Внесите изменения');
const  st_NeedSum                  :array[1..2] of String=('Введіть суму', 'Введите сумму');
const  st_serves                   :array[1..2] of String=('Послуга', 'Услуга');

const  st_CannotDelete_Lgota       :array[1..2] of String=('Неможливо видалити. Дана пільга використовується.', 'Удалить невозможно. Данная льгота используется.');
const  st_CannotDelete_Name        :array[1..2] of String=('Неможливо видалити. Найменування використовується!', 'Невозможно удалить. Наименование используется!');

{Lgots}
const  st_GosCheck                 :array[1..2] of String=('Державна пільга', 'Государственная льгота');
const  st_MedCheck                 :array[1..2] of String=('Медична пільга', 'Медицинская льгота');
const  st_Gos                      :array[1..2] of String=('Державна', 'Государственная');
const  st_Med                      :array[1..2] of String=('Медична', 'Медицинская');

const  st_LgPerc                   :array[1..2] of String=('Відсотки пільги', 'Проценты льготы');
const  st_Periods                  :array[1..2] of String=('Періоди', 'Периоды');
const  st_MinPeriod                :array[1..2] of String=('Мін. період', 'Мин. период');
const  st_MaxPeriod                :array[1..2] of String=('Макс. період', 'Макс. период');

const  st_LgCodeExists             :array[1..2] of String=('Введений код невірний. Даний код пільги вже існує', 'Введен неверный код. Данный код льготы уже существует');
const  st_LgZamknytost             :array[1..2] of String=('Порушена замкнутість за періодами. Внесіть зміни', 'Нарушена замкнутость по периодам. Внесите изменения');
const  st_LgPercent_need           :array[1..2] of String=('Необхідно заповнити відсотки пільги', 'Необходимо заполнить проценты льготы');

const  st_SpravSmet                :array[1..2] of String=('Формування довідок', 'Формирование справок');
const  st_LoadProcess              :array[1..2] of String=('Процес займе багато часу! Ви дійсно хочете запустити процес? ', 'Пройесс займет много времени! Вы действительно хотите запустить процесс? ');
const  st_GoodFormuv               :array[1..2] of String=('Формування успішно виконано!', 'Формирование успешно выполнено!');
const  st_SpravCaption             :array[1..2] of String=('Формування довідки', 'Формирование справки');

const  st_AvtoSummaCheckBox        :array[1..2] of String=('Авторозбивка суми за відсотками', 'Авторазбивка суммы по процентам');
const  st_Electorat                :array[1..2] of String=('Електорат', 'Электорат');
const  st_ElectoratQuery           :array[1..2] of String=('Ви дійсно хочете додати цю особу до списку електорату?', 'Вы действительно хотите добавить этого человека в список электората?');
const  st_GoodAdd                  :array[1..2] of String=('Успішно доданий у список!', 'Успешно добавлен в список!');
const  st_ElectoratPlus            :array[1..2] of String=('Додати у список', 'Добавить в список');
const  st_ElectoratMinus           :array[1..2] of String=('Видалити зі списку', 'Удалить из списка');
const  st_ElectoratQueryMinus      :array[1..2] of String=('Ви дійсно хочете видалити цю особу зі списку електорату?', 'Вы действительно хотите удалить этого человека из списка электората?');
const  st_GoodRemove               :array[1..2] of String=('Успішно видалений зі списку!', 'Успешно удален из списка!');
const  st_FullOplata               :array[1..2] of String=('Сплачено повністю', 'Оплачено полностью');
const  st_Short                    :array[1..2] of String=('Скорочення', 'Сокращение');
const  st_MaxCountLivers           :array[1..2] of String=('Макс. число жителів', 'Макс. число жителей');
const  st_SquareM2                 :array[1..2] of String=('Площа, м.кв.', 'Площадь, м.кв.');

{Loading_Splash}
const  st_Load_Splash              :array[1..2] of String=('Завантаження', 'Загрузка');
const  st_ReadIni                  :array[1..2] of String=('Спроба читання INI-файлу ...', 'Попытка чтения INI-файла ...');
const  st_ReadDB                   :array[1..2] of String=('Спроба з''єднання з базою даних ...', 'Попытка соединения с базой данных ...');
const  st_GoodLoad                 :array[1..2] of String=('Успішно!', 'Успешно!');
const  st_AllMostOver              :array[1..2] of String=('Майже готово ...', 'Почти готово ...');
const  st_SystemEnter              :array[1..2] of String=('Вхід до системи', 'Вход в систему');

{Ini_Type_Room}
const  st_NeedNameRoom             :array[1..2] of String=('Необхідно ввести найменування типу кімнати', 'Необходимо ввести наименование типа комнаты');
const  st_NeedMaxCount             :array[1..2] of String=('Необхідно ввести максимальну кількість жителів', 'Необходимо ввести максимальное количество жителей');
const  st_NeedSquare               :array[1..2] of String=('Необхідно ввести площу кімнати', 'Необходимо ввести площадь комнаты');
const  st_CountNotValid            :array[1..2] of String=('Кількість жителів введено невірно', 'Количество жителей введено неверно');
const  st_SquareNotValid           :array[1..2] of String=('Площа введена невірно', 'Площадь введена неверно');

const  st_MestNotValid            :array[1..2] of String=('Кількість місць введено невірно', 'Количество мест введено неверно');
{Propiska}

const  st_PropVipis                :array[1..2] of String=('Прописка - Виписка', 'Прописка - Выписка');
const  st_SafeNExit                :array[1..2] of String=('Зберегти та вийти', 'Сохранить и выйти');
const  st_prp_History              :array[1..2] of String=('Історія', 'История');
const  st_prp_Prodovg              :array[1..2] of String=('Продовжити', 'Продлить');
const  st_prp_Vipisat              :array[1..2] of String=('Виписати', 'Выписать');
const  st_prp_MisceNarodgen        :array[1..2] of String=('Місце народж.', 'Место рожд.  ');
const  st_prp_Propiska             :array[1..2] of String=('Прописка      ', 'Прописка      ');
const  st_prp_Dopovnenn            :array[1..2] of String=('Доповнення   ', 'Дополнение   ');
const  st_prp_ViyskOblik           :array[1..2] of String=('Військ. облік', 'Воинский учет');
const  st_prp_Pass                 :array[1..2] of String=('Паспорт       ', 'Паспорт       ');
const  st_prp_Batko                :array[1..2] of String=('Батько          ', 'Отец            ');
const  st_prp_Mati                 :array[1..2] of String=('Мати            ', 'Мать            ');
const  st_prp_SimStan              :array[1..2] of String=('Сім. стан   ', 'Сем. полож. ');
const  st_prp_Vipiska              :array[1..2] of String=('Виписка        ', 'Выписка        ');

const  st_prp_MestoNarodg          :array[1..2] of String=('Місце народження', 'Место рождения');
const  st_prp_Kraina               :array[1..2] of String=('Країна', 'Страна');
const  st_prp_Rayon                :array[1..2] of String=('Район', 'Район');
const  st_prp_Selo                 :array[1..2] of String=('Село', 'Село');
const  st_prp_Index                :array[1..2] of String=('Індекс', 'Индекс');

const  st_prp_WhosPropi            :array[1..2] of String=('Був прописаний', 'Был прописан');
const  st_prp_Vyliza               :array[1..2] of String=('Вулиця', 'Улица');
const  st_prp_Bydinok              :array[1..2] of String=('Буд.', 'Дом');
const  st_prp_Kvartira             :array[1..2] of String=('Квартира', 'Квартира');
const  st_prp_DataPribytiya        :array[1..2] of String=('Дата прибуття', 'Дата прибытия');
const  st_prp_Poto4naPropiska      :array[1..2] of String=('Поточна прописка', 'Текущая прописка');
const  st_prp_Po4atokPropiski      :array[1..2] of String=('Початок прописки', 'Начало прописки');
const  st_prp_Zakin4ennyaProp      :array[1..2] of String=('Закінчення прописки', 'Окончание прописки');
const  st_prp_AdresaPropiski       :array[1..2] of String=('Адреса прописки', 'Адрес прописки');
const  st_prp_DodatkovaInfo        :array[1..2] of String=('Додаткова інформація', 'Дополнительная информация');

const  st_prp_add_Info              :array[1..2] of String=('Додаткова інформація', 'Дополнительная информация');
const  st_prp_add_ProgYMisti        :array[1..2] of String=('Проживав у місці вибуття з', 'Проживал в месте убытия с');
const  st_prp_add_BasicResonPriizd  :array[1..2] of String=('Основна причина приїзду', 'Основная причина приезда');
const  st_prp_add_Strok             :array[1..2] of String=('На який строк', 'На какой срок');
const  st_prp_add_BasicResonPereizd :array[1..2] of String=('Основна причина переїзду', 'Основная причина переезда');
const  st_prp_add_GdeRab            :array[1..2] of String=('Де працював', 'Где работал');
const  st_prp_add_Posada            :array[1..2] of String=('Посада', 'Должность');
const  st_prp_add_Osvita            :array[1..2] of String=('Освіта', 'Образование');
const  st_prp_add_VchenStypin       :array[1..2] of String=('Вчений ступінь', 'Ученая степень');
const  st_prp_add_Gromadyanstvo     :array[1..2] of String=('Громадянство', 'Гражданство');
const  st_prp_add_Nationality       :array[1..2] of String=('Національність', 'Национальность');
const  st_prp_add_HomePhone         :array[1..2] of String=('Дом.телефон', 'Дом.телефон');

const  st_prp_warrior_VO            :array[1..2] of String=('Військовий облік', 'Воинский учет');
const  st_prp_warrior_FromRVK       :array[1..2] of String=('Із якого РВК прибув на облік', 'Из какого РВК прибыл на учет');
const  st_prp_warrior_Postavlen     :array[1..2] of String=('Поставлений на військовий облік', 'Поставлен на воинский учет');
const  st_prp_warrior_Snyat         :array[1..2] of String=('Знятий з військового облікку', 'Снят с воинского учета');
const  st_prp_warrior_Notes         :array[1..2] of String=('Примітки', 'Примечание');

const  st_prp_pass_Pass             :array[1..2] of String=('Паспорт', 'Паспорт');
const  st_prp_pass_History          :array[1..2] of String=('Історія паспортів', 'История паспортов');
const  st_prp_pass_Vidan            :array[1..2] of String=('Виданий: ', 'Выдан: ');
const  st_prp_pass_Date             :array[1..2] of String=('Коли був виданий: ', 'Дата выдачи: ');
const  st_prp_pass_Type             :array[1..2] of String=('Тип', 'Тип');
const  st_prp_pass_Seriya           :array[1..2] of String=('Серія', 'Серия');
const  st_prp_pass_Nomer            :array[1..2] of String=('Номер', 'Номер');
const  st_prp_Kem                   :array[1..2] of String=('Ким виданий', 'Кем выдан');
const  st_prp_Kogda                 :array[1..2] of String=('Коли виданий', 'Когда выдан');
const  st_prp_Pidstava              :array[1..2] of String=('Підстава', 'Основание');
const  st_prp_TypeDoc               :array[1..2] of String=('Тип документу', 'Тип документа');

const  st_prp_WorkPlace             :array[1..2] of String=('Місце роботи', 'Место работы');
const  st_prp_WorkPhone             :array[1..2] of String=('Роб.телефон', 'Раб.телефон');
const  st_prp_Oblast                :array[1..2] of String=('Область', 'Область');
const  st_prp_Dad                   :array[1..2] of String=('Батько', 'Отец');
const  st_prp_Mom                   :array[1..2] of String=('Мати', 'Мать');

const  st_prp_SimStanEx               :array[1..2] of String=('Сімейний стан', 'Семейное положение');
const  st_prp_Both                  :array[1..2] of String=('Разом з дружиною(чоловіком)', 'Вместе с супругой (ом)');
const  st_prp_Kinder                :array[1..2] of String=('Діти', 'Дети');
const  st_prp_RodstvSvyaz           :array[1..2] of String=('Родинні зв''язки', 'Родственные связи');
const  st_prp_Sex                   :array[1..2] of String=('Стать', 'Пол');
const  st_prp_TypeRS                :array[1..2] of String=('Тип родин.стос.', 'Тип родств.связи');
const  st_prp_KinderFIO             :array[1..2] of String=('ПІБ дитини', 'ФИО ребенка');

const  st_vip_Vip                   :array[1..2] of String=('Виписка', 'Выписка');
const  st_vip_DateVip               :array[1..2] of String=('Дата виписки', 'Дата выписки');
const  st_vip_ToTown                :array[1..2] of String=('Вибув у місто ', 'Убыл в город ');

const  st_vip_AddInfo               :array[1..2] of String=('Додаткова інформація про виписку', 'Дополнительная информация о выписке');
const  st_vip_ResonPereezd          :array[1..2] of String=('Основна причина переїзду', 'Основная причина переезда');

const  st_LongPropi_Mode            :array[1..2] of String=(' продовження прописки-', ' продления прописки-');
const  st_Vip_Mode                  :array[1..2] of String=(' виписки-', ' выписки-');

const  st_prp_his_History           :array[1..2] of String=('Історія прописки', 'История прописки');
const  st_prp_his_StanPeriody       :array[1..2] of String=('Стан прописки', 'Состояние периода');
const  st_prp_his_DelPeriod         :array[1..2] of String=('Видалити період', 'Удалить период');
const  st_prp_his_Choose            :array[1..2] of String=('Вибрати', 'Выбрать');
const  st_prp_EslinerabotalTo       :array[1..2] of String=('Якщо не працював, то', 'Если не работал, то');


const  st_prp_DelHisPart1           :array[1..2] of String=(
                                      'Видалення періоду прописки спричине видалення всіх даних за цим періодом.',
                                      'Удаление периода прописки повлечет удаление всех данных по этому периоду.');
const  st_prp_DelHisPart2           :array[1..2] of String=('Видалити період?', 'Вы уверены, что хотите удалить период?');
const  st_WhatsNew                  :array[1..2] of String=('Студмістечко: історія версій', 'Студгородок: история версий');
const  st_dt_OrderNum               :array[1..2] of String=('Номер ордеру', 'Номер ордера');

const  st_Spisanie                  :array[1..2] of String=('Робота з документами на списання', 'Работа с документами списания');
const  st_ErrorData                 :array[1..2] of String=('Помилка заповнення даних', 'Ошибка заполнения данных');
const  st_NeedFio                   :array[1..2] of String=('Потрібно заповнити П.І.Б.', 'Необходимо заполнить ФИО');
const  st_NeedSumma                 :array[1..2] of String=('Потрібно заповнити суму', 'Необходимо заполнить сумму');
const  st_SummaNotSumma             :array[1..2] of String=('Розбивка за сумою перевищена чи не повна', 'Разбивка по сумме превышена или неполна');

const  st_NotCorrectCode            :array[1..2] of String=('Введено невірний код', 'Введен неверный код');
const  st_NotCorrectSmeta           :array[1..2] of String=('Код кошторису введено невірно. Даного кошторису не існує', 'Код сметы набран неверно. Данной сметы  не существует');
const  st_NotCorrectRazdel          :array[1..2] of String=('Код розділу введено невірно. Даного розділу не існує', 'Код раздела набран неверно. Данного раздела не существует');
const  st_NotCorrectStat            :array[1..2] of String=('Код статті введено невірно. Даної статті не існує', 'Код статьи набран неверно. Данной статьи не существует');
const  st_NotCorrectKekv            :array[1..2] of String=('Код КЕКВ введено невірно. Даного КЕКВ не існує', 'Код КЕКЗ набран неверно. Данного КЕКЗ не существует');
const  st_NotCorrectMore100Pers     :array[1..2] of String=('Неможливо ввести більше 100%', 'Невозможно ввести более 100%');

const  st_Language                  :array[1..2] of String=('Мова', 'Язык');
const  st_RusLng                    :array[1..2] of String=('Російська', 'Русский');
const  st_UkrLng                    :array[1..2] of String=('Українська', 'Украинский');
const  st_NeedReboot                :array[1..2] of String=('Для здійснення змін необхідно перезавантажити програму', 'Для совершения изменений необходимо перезагрузить программу');

const  st_CatClassSprav             :array[1..2] of String=('Довідник класів категорій оплати помешкання', 'Справочник классов категорий оплаты проживания');
const  st_CatTypeSprav              :array[1..2] of String=('Довідник типів категорій оплати помешкання', 'Справочник типов категорий оплаты проживания');
const  st_KolvoLudey                :array[1..2] of String=('К-сть людей', 'Кол-во людей');
const  st_KolvoMest                 :array[1..2] of String=('К-сть місць', 'Кол-во мест');
const  st_KontextPoisk              :array[1..2] of String=('Контекстний пошук', 'Контекстный поик');
const  st_ByMonth                   :array[1..2] of String=('Оплата щомісячно', 'Оплата помесячно');

const st_Some_Need                  :array[1..2] of String=('Помилка заповнення даних форми. Не усі поля заповнені','Ошибка заполнения данных формы. Не все поля заполнены');
{
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
const  st_prp_                        :array[1..2] of String=('', '');
}

const st_prp_Title_String          : array[1..2] of string =('Інформація про прописку', 'Информация о прописке');
const st_prp_OkButton_Local_String : array[1..2] of string =('Зберегти зміни поточної вкладки', 'Сохранить изменения текущей вкладки');
const  st_PropProdleniePinudit     :array[1..2] of String=('Примусове продовження', 'Принудительное продление');

{
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
const  st_                        :array[1..2] of String=('', '');
}
implementation

end.
