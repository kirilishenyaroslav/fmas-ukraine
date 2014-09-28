//******************************************************************************
// Проект "ГорВодоКанал" (bs)
// Файл строковых ресурсов
// создан 18/01/2010
// последние изменения Перчак А.Л. 18/01/2010
//******************************************************************************
unit uConsts;

interface
{Set Language}
const bs_Lang                        :array[1..3] of string=('00000409', '00000419', '00000422'); 



{Options}
const bs_max_sys_timestamp           :array[1..2] of String=('Нескінченна дата','Бесконечная дата');
const bs_date_start                  :array[1..2] of String=('Дата старту системи','Дата старта системы');

{Windows}
const bs_Windows_Tiltle              :array[1..2] of String=('Вікна','Окна');
const bs_WindowsCacade               :array[1..2] of String=('Каскад','Каскад');
const bs_WindowsHorizontal           :array[1..2] of String=('Горизонтально','Горизонтально');
const bs_WindowsVertical             :array[1..2] of String=('Вертикально','Вертикально');
const bs_WindowsMinimizeAll          :array[1..2] of String=('Звернути усі','Свернуть все');
const bs_WindowsCloseAll             :array[1..2] of String=('Закрити усі','Закрыть все');

{Form_Titles}
const bs_ReestrContracts_Tiltle      :array[1..2] of String=('Реєстр контрактів','Реестр контрактов');
const bs_DBInfo_Tiltle               :array[1..2] of String=('Підключення до БД','Подключение к БД');
const bs_FileVersion                 :array[1..2] of String=('Версія','Версия');
const bs_AssemblingVersion           :array[1..2] of String=('Зборка','Сборка');
const bs_ConnectionInfo              :array[1..2] of String=('Інформація про з''єднання','Информация про подключение');
const bs_ApplicationName             :array[1..2] of String=('Ім''я файлу: ','Имя приложения: ');
const bs_ApplicationWay              :array[1..2] of String=('Розміщення файлу: ','Путь к приложению: ');
const bs_FileVersionFull             :array[1..2] of String=('Версія файлу: ','Версия файла: ');
const bs_AssemblingDate              :array[1..2] of String=('Дата зборки: ','Дата сборки: ');
const bs_DBWay                       :array[1..2] of String=('Розміщення файлу БД: ','Путь к базе данных: ');
const bs_FilterText                  :array[1..2] of String=('введіть прізвище','введите фамилию');
const bs_HelpText                    :array[1..2] of String=('Допомога','Помощь');
const bs_WorkWithPopulation          :array[1..2] of String=('Робота з населенням','Работа с населением');
const bs_WorkWithEnterprise          :array[1..2] of String=('Робота з підприємствами','Работа с предприятиями');
const bs_WorkWitDogs                 :array[1..2] of String=('Робота з договорами','Работа с договорами');
const bs_NowDate_Caption             :array[1..2] of String=('Сьогодні: ','Сегодня: ');
const bs_RaschetSchet_Title          :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');
const bs_UserFio                     :array[1..2] of String=('П.І.Б. користувача: ','ФИО пользователя: ');
const bs_Login                       :array[1..2] of String=('Логін: ','Логин: ');
const bs_UserInfo                    :array[1..2] of String=('Інформація про користувача: ','Информация про пользователя');
const bs_grid_ADDVerName             :array[1..2] of String=('Назва версії прейскаранта','Название версии прейскуранта');

{Date_Formats}
const bs_Year_Short                  :array[1..2] of String=(' рр.',' гг.');

{ShortCuts}
const bs_InsertBtn_ShortCut          :array[1..2] of String=('Ins ', 'Ins ');
const bs_EditBtn_ShortCut            :array[1..2] of String=('F2 ','F2 ');
const bs_DeleteBtn_ShortCut          :array[1..2] of String=('Del ','Del ');
const bs_RefreshBtn_ShortCut         :array[1..2] of String=('F5 ', 'F5 ');
const bs_ExitBtn_ShortCut            :array[1..2] of String=('Esc ','Esc ');
const bs_FilterBtn_ShortCut          :array[1..2] of String=('Ctrl+F ','Ctrl+F ');
const bs_EnterBtn_ShortCut           :array[1..2] of String=('Enter ','Enter ');
const bs_PaymentBtn_ShortCut         :array[1..2] of String=('F6 ','F6 ');
const bs_PrintBtn_ShortCut           :array[1..2] of String=('Ctrl+P ','Ctrl+P ');
const bs_ModeBtn_ShortCut            :array[1..2] of String=('F9 ','F9 ');
const bs_F10Btn_ShortCut             :array[1..2] of String=('F10 ','F10 ');
const bs_F3Btn_ShortCut              :array[1..2] of String=('F3 ','F3 ');

{All_Actions}
const bs_InsertBtn_Caption           :array[1..2] of String=('Додати','Добавить');
const bs_EditBtn_Caption             :array[1..2] of String=('Змінити','Изменить');
const bs_DeleteBtn_Caption           :array[1..2] of String=('Видалити','Удалить');
const bs_RefreshBtn_Caption          :array[1..2] of String=('Оновити', 'Обновить');
const bs_ExitBtn_Caption             :array[1..2] of String=('  Вихід  ','  Выход  ');
const bs_FilterBtn_Caption           :array[1..2] of String=('Фільтр','Фильтр');
const bs_FilterParams_Need           :array[1..2] of String=('Не вибрані параметри для фільтрації!','Не выбраны параметры для фильтрации!');
const bs_SearchBtn_Caption           :array[1..2] of String=('Пошук','Поиск');
const bs_Print_Caption               :array[1..2] of String=(' Друк ',' Печать ');
const bs_Pay_Caption                 :array[1..2] of String=(' Оплата ',' Оплата ');
const bs_Lgota_Caption               :array[1..2] of String=(' Пільги ',' Льготы ');
const bs_living_Caption              :array[1..2] of String=('Проживають','Проживающие');
const bs_Kat_Caption                 :array[1..2] of String=('Послуги','Услуги');
const bs_Subsidy_Caption             :array[1..2] of String=('Субсидії','Субсидии');
const bs_EntryRest_Caption           :array[1..2] of String=('Вхідний залишок','Входящий остаток');
const bs_History                     :array[1..2] of String=('Історія','История');
const bs_SelectBtn_Caption           :array[1..2] of String=('Вибрати','Выбрать');
const bs_ModeBtn_Caption             :array[1..2] of String=('Зміна режиму','Смена режима');
const bs_PrintShort_Caption          :array[1..2] of String=('Друк','Печать');
const bs_ViewShort_Caption           :array[1..2] of String=('Перегляд','Просмотр');
const bs_AutoShort_Caption           :array[1..2] of String=('Автоматично','Автоматично');
const bs_Credit_Caption              :array[1..2] of String=('Кредит','Кредит');
const bs_Upload_Caption              :array[1..2] of String=('Переоформити','Переоформить');
const bs_BreakDown_Caption           :array[1..2] of String=('Розірвати','Расторгнуть');
const  bs_PayerInfoData              :array[1..2] of String=('Дані про платника','Данные о плательщике');
const  bs_Pri4inaRastorg             :array[1..2] of String=('Причина розірвання','Причина расторжения');
const bs_ViewAll                     :array[1..2] of String=('Розгорнути усі','Развернуть все');
const bs_HidenAll                    :array[1..2] of String=('Згорнути усі','Свернуть все');
{Confirms}
const bs_Confirmation_Caption        :array[1..2] of String=('Підтвердження','Подтверждение');
const bs_Uvaga_Caption               :array[1..2] of String=('Увага!','Внимание!');
const bs_ExitPromt                   :array[1..2] of String=('Ви бажаєте вийти?', 'Вы хотите выйти?');
const bs_DeletePromt                 :array[1..2] of String=('Ви дійсно хочете видалити запис?', 'Вы действительно хотите удалить запись?');
const bs_Accept                      :array[1..2] of String=('Прийняти','Принять');
const bs_Cancel                      :array[1..2] of String=('Відмінити','Отмена');
const bs_ClearBufferPromt            :array[1..2] of String=('Ви дійсно хочете очистити буфер?', 'Вы действительно хотите очистить буфер?');

{ApplicationInitialise}
const bs_Application_Caption         :array[1..2] of String=('Горводоканал','Горводоканал');
const bs_Reestr_Main_Caption         :array[1..2] of String=('Реестр договорів','Реестр договоров');
const bs_Main_Ready_Caption          :array[1..2] of String=('Готовий','Готов');
const bs_Main_StatusBar_Caption      :array[1..2] of String=('Панель інформації','Панель информации');
const bs_HotKeys                     :array[1..2] of String=('Горячі клавіши','Горячие клавиши');
{MainButtons}
const bs_Main_WorkBtn_Caption        :array[1..2] of String=('Робота','Работа');
const bs_Main_SpravBtn_Caption       :array[1..2] of String=('Довідники','Справочники');
const bs_Main_AboutBtn_Caption       :array[1..2] of String=('Про програму','О программе');
const bs_Main_ExitBtn_Caption        :array[1..2] of String=('Вихід','Выход');

{Errors}
const bs_Error_Caption               :array[1..2] of String=('Помилка','Ошибка');
const bs_Error_LoadBPL_Text          :array[1..2] of String=('Помилка при завантаженні пакету','Ошибка при загрузке пакета');

{MainGuides}
const  bs_Main_Lgot              :array[1..2] of String=('Довідник типів пільг', 'Справочник типов льгот');
const  bs_Main_PayerType             :array[1..2] of String=('Довідник типів платників', 'Справочник типов плательщиков');
const  bs_Main_FacultySpeciality     :array[1..2] of String=('Довідник cпеціальностей та груп', 'Справочник специальностей и групп');
const  bs_Main_FormStudy             :array[1..2] of String=('Довідник форм навчання', 'Справочник форм обучения');
const  bs_Main_Faculty               :array[1..2] of String=('Довідник факультетів', 'Справочник факультетов');
const  bs_Main_Nationality           :array[1..2] of String=('Довідник національностей', 'Справочник национальностей');
const  bs_Main_Kat                   :array[1..2] of String=('Довідник послуг', 'Справочник услуг');
const  bs_Main_Subsidy               :array[1..2] of String=('Довідник субсидій', 'Справочник субсидий');
const  bs_Main_IniPeriodic           :array[1..2] of String=('Довідник періодичностей оплат', 'Справочник периодичности оплат');
const  bs_Main_FaculSpecGroup        :array[1..2] of String=('Довідник факультетів, cпеціальностей та груп', 'Справочник факультетов, специальностей и групп');
const  bs_PaymentAnalysis            :array[1..2] of String=('Форма аналізу оплати', 'Форма анализа оплаты');
const  bs_Main_SpRoles               :array[1..2] of String=('Довідник груп користувачів та кошторисів','Справочник групп пользователей и смет');
const  bs_Main_SpActions             :array[1..2] of String=('Довідник дій','Справочник действий');
const  bs_Main_SpSignature           :array[1..2] of String=('Довідник підписів','Справочник подписей');
const  bs_Main_SpSpec                :array[1..2] of String=('Довідник cпеціальностей','Справочник специальностей');
const  bs_Main_SpDepartment          :array[1..2] of String=('Довідник підрозділів','Справочник подразделений');
const  bs_Main_SpDogStatus           :array[1..2] of String=('Довідник статусів контрактів','Справочник статусов контрактов');
const  bs_Main_SpPeople              :array[1..2] of String=('Довідник фізичних осіб','Справочник физических лиц');
const  bs_Main_SpYurLiza             :array[1..2] of String=('Довідник юрідичних осіб','Справочник юридических лиц');
const  bs_Main_SpRapStatus           :array[1..2] of String=('Довідник статусів рапортів','Справочник статусов рапортов');
const  bs_Main_SpTypeDocum           :array[1..2] of String=('Довідник типів стану документів','Справочник типов состояния документов');
const  bs_Main_SpOrders              :array[1..2] of String=('Довідник наказів','Справочник приказов');
const  bs_Main_SpNamesReport         :array[1..2] of String=('Довідник найменувань звітів','Справочник наименований отчетов');
const  bs_Main_SpTypeDog             :array[1..2] of String=('Довідник типів контрактів','Справочник типов контрактов');
const  bs_Main_SpDatePay             :array[1..2] of String=('Довідник дат оплат','Справочник дат оплат');

const  bs_Main_DawaVCImport          :array[1..2] of String=('Імпорт даних з ОЦ','Импорт данных из ВЦ');
const  bs_Main_DawaVCPrimary         :array[1..2] of String=('Імпорт договорів у буфер','Импорт договров в буфер');
const  bs_Main_DawaVCLinks           :array[1..2] of String=('Імпорт договорів з буферу','Импорт договоров из буфера');
const  bs_Main_DawaVCBuffer          :array[1..2] of String=('Буфер контрактів','Буфер контрактов');

const  bs_Main_RaportOtchisl         :array[1..2] of String=('Рапорти на відрахування','Рапорта на отчисление');
const  bs_Main_RaportVotanovl        :array[1..2] of String=('Рапорти на відновлення','Рапорта на восстановление');

const  bs_print_RZ_Postyp            :array[1..2] of String=('Реєстр/Зведена форма надходжень за навчання','Реестр/Сводная форма поступлений за обучение');

{Contracts_Grid}
const  bs_grid_FIO_Column            :array[1..2] of String=('П.І.Б.', 'Ф.И.О.');
const  bs_grid_Date_Dog_Column       :array[1..2] of String=('Дата укладання', 'Дата заключения');
const  bs_grid_Num_Dog_Column        :array[1..2] of String=('Номер договору', 'Номер договора');
const  bs_grid_Date_Beg              :array[1..2] of String=('Дата початку', 'Дата начала');
const  bs_grid_Date_End              :array[1..2] of String=('Дата закінчення', 'Дата окончания');
const  bs_grid_IsDiss_Column         :array[1..2] of String=('Не діючий', 'Не действующий');
const  bs_grid_IsNotDiss_Column      :array[1..2] of String=('Діючий', 'Действующий');
{Contracts_Footer}
const  bs_footer_Faculty             :array[1..2] of String=('Факультет', 'Факультет');
const  bs_footer_Spec                :array[1..2] of String=('Спеціальність', 'Специальность');
const  bs_footer_Group               :array[1..2] of String=('Група', 'Группа');
const  bs_footer_FormStudy           :array[1..2] of String=('Форма навчання', 'Форма обучения');
const  bs_footer_CategoryStudy       :array[1..2] of String=('Категорія навчання', 'Категория обучения');
const  bs_footer_Kurs                :array[1..2] of String=('Курс', 'Курс');
const  bs_Gragdanstvo                :array[1..2] of String=('Громадянство', 'Гражданство');
const  bs_srok_study                 :array[1..2] of String=('Строк навчання','Срок обучения');

//-----{Contracts_Components}------------------------------------------------------------------//

{Contracts_Components_GroupBox}
const  bs_BasicInfo_GroupBox         :array[1..2] of String=('Основна інформація', 'Основная информация');
const  bs_Study_GroupBox             :array[1..2] of String=('Інформація про осіб, що навчаються', 'Обучающиеся');
const  bs_Studer_Osoba               :array[1..2] of String=('Особа, що навчається', 'Обучающийся');
const  bs_Payer_Osoba                :array[1..2] of String=('Платник', 'Плательщик');
const  bs_Payers_GroupBox            :array[1..2] of String=('Платники', 'Плательщики');
const  bs_Periods_GroupBox           :array[1..2] of String=('Періоди оплати', 'Периоды оплаты');
const  bs_Istochniki_GroupBox        :array[1..2] of String=('Джерела фінансування', 'Источники финансирования');
{Contracts_Components_Lables}
const  bs_Num_Dog_Label              :array[1..2] of String=('Номер договору', 'Номер договора');
const  bs_Date_Zakl_Label            :array[1..2] of String=('Дата укладання', 'Дата заключения');
const  bs_Date_Beg_Label             :array[1..2] of String=('Дата початку', 'Дата начала');
const  bs_Date_End_Label             :array[1..2] of String=('Дата закінчення', 'Дата окончания');
const  bs_Type_Dog_Label             :array[1..2] of String=('Тип договору', 'Тип договора');
const  bs_Basic_Dog_Label            :array[1..2] of String=('Основний', 'Основной');
const  bs_Addit_Dog_Label            :array[1..2] of String=('Додатковий', 'Дополнительный');
const  bs_Status_Dog_Label           :array[1..2] of String=('Статус договору', 'Статус договора');

{Contracts_Components_Grid_Captions}
const  bs_Payer_Column               :array[1..2] of String=('Платник', 'Плательщик');
const  bs_Period_Column              :array[1..2] of String=('Періодичність', 'Периодичность');
const  bs_Persent_Column             :array[1..2] of String=('Відсоток', 'Процент');
const  bs_Date_Opl_Column            :array[1..2] of String=('Дата оплати', 'Дата оплаты');
const  bs_Summa_Column               :array[1..2] of String=('Сума', 'Сумма');
const  bs_Name_Column                :array[1..2] of String=('Найменування', 'Наименование');
const  bs_IS_Deleted_Column          :array[1..2] of String=('Видалено', 'Удалено');
const  bs_CntMonth_Column            :array[1..2] of String=('Кількість місяців', 'Кол-во месяцев');

const  bs_ParamStudyModify_Caption   :array[1..2] of String=('Редагувати параметри навчання', 'Редактировать параметры обучения');
const  bs_FIOModify_Caption          :array[1..2] of String=('Редагувати особу, що навчається', 'Редактировать обучающегося');
const  bs_add_new_summ               :array[1..2] of String=('Додати нову ціну', 'Добавить новую цену');
const  bs_add_new_summ_by_param      :array[1..2] of String=('Додати нову ціну на підставі вибранних параметрів', 'Добавить новую цену на основе выбранных параметров');

{Smeta-Razdel-Statya-Kekv}
const  bs_Smeta                      :array[1..2] of String=('Кошторис', 'Смета');
const  bs_Razdel                     :array[1..2] of String=('Розділ', 'Раздел');
const  bs_Statya                     :array[1..2] of String=('Стаття', 'Статья');
const  bs_Kekv                       :array[1..2] of String=('КЕКВ', 'КЭКЗ');
{Contracts_Components_Filtration}
const  bs_Filtration                 :array[1..2] of String=('Фільтрація', 'Фильтрация');
const  bs_FiltrByFIO                 :array[1..2] of String=('П.І.Б.', 'Ф.И.О.');
const  bs_FiltrByNum                 :array[1..2] of String=('Номер', 'Номер');
const  bs_FiltrHint                  :array[1..2] of String=('Фільтровати негайно!', 'Фильтровать немедленно!');
const  bs_FiltrBarCode               :array[1..2] of string=('Штрих код','Штрих код');

{Contracts_Add_Edit_Messages}
const  bs_Num_Dog_Need               :array[1..2] of String=('Необхідно заповнити номер договору!','Необходимо заполнить номер договора!');
const  bs_Date_Dog_Need              :array[1..2] of String=('Необхідно заповнити дату укладання договору!','Необходимо заполнить дату заключения договора!');
const  bs_summ_prices_Need           :array[1..2] of string=('Необхідно ввести суму!','Необходимо ввести сумму!');

//--------------{Contracts_Payer_AE}-------------------------------------------------------------
const  bs_FizOsoba                  :array[1..2] of String=('Фізична особа', 'Физическое лицо');
const  bs_YurOsoba                  :array[1..2] of String=('Юридична особа','Юридическое лицо');
const  bs_PayerType                 :array[1..2] of String=('Тип платника','Тип плательщика');
const  bs_MFO_Caption               :array[1..2] of String=('МФО','МФО');
const  bs_RasSchet_Caption          :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');
{Contracts_Payer_AE_Messages}
const  bs_Payer_Need                :array[1..2] of String=('Необхідно заповнити платника!','Необходимо заполнить плательщика!');
const  bs_Percent_Need              :array[1..2] of String=('Необхідно заповнити відсоток!','Необходимо заполнить процент!');
const  bs_Period_Need               :array[1..2] of String=('Необхідно заповнити періодичність!','Необходимо заполнить периодичность!');
//--------------{Contracts_Studer_AE}-------------------------------------------------------------
const  bs_Studer                    :array[1..2] of String=('Особа, що навчається','Обучающийся');
const  bs_Studer_Need               :array[1..2] of String=('Необхідно заповнити особу, що навчається!','Необходимо заполнить обучающегося!');
//--------------{Contracts_Periods_AE}-------------------------------------------------------------
const  bs_Periods_DateOpl           :array[1..2] of String=('Дата оплати','Дата оплати');
{Contracts_Periods_AE_Messages}
const  bs_Periods_Date_Beg_Need     :array[1..2] of String=('Необхідно заповнити дату початку!','Необходимо заполнить дату начала!');
const  bs_Periods_Date_End_Need     :array[1..2] of String=('Необхідно заповнити дату закінчення!','Необходимо заполнить дату окончания!');
const  bs_Periods_Date_Pay_Need     :array[1..2] of String=('Необхідно заповнити дату оплати!','Необходимо заполнить дату оплаты!');
const  bs_Periods_Date_PaySum_Need  :array[1..2] of String=('Необхідно заповнити суму!','Необходимо заполнить сумму!');
//-----------------------------------------------------------------------------------------------
{Contracts_Istochniki_AE_Messages}
const  bs_Smeta_Need                :array[1..2] of String=('Необхідно заповнити кошторис!','Необходимо заполнить смету!');
const  bs_Razdel_Need               :array[1..2] of String=('Необхідно заповнити розділ!','Необходимо заполнить раздел!');
const  bs_Stat_Need                 :array[1..2] of String=('Необхідно заповнити статтю!','Необходимо заполнить статью!');
const  bs_Kekv_Need                 :array[1..2] of String=('Необхідно заповнити КЕКВ!','Необходимо заполнить КЭКЗ!');

{Contracts_StudyParams_Title}
const  bs_StudyParams_Title         :array[1..2] of String=(' параметри навчання',' параметры обучения');

const  bs_CollectDog                :array[1..2] of String=('КОЛЕКТИВНИЙ','КОЛЛЕКТИВНЫЙ');
const  bs_EntryRest                 :array[1..2] of String=('Вхідний залишок','Входящий остаток');
const  bs_EntryRestShort            :array[1..2] of String=('Вх.залишок','Вх.остаток');

{Oplata_Analiz}
const  bs_Beg_Opl                    :array[1..2] of String=('Початок періоду', 'Начало периода');
const  bs_End_Opl                    :array[1..2] of String=('Закінчення періоду', 'Конец периода');
const  bs_Summa_Opl                  :array[1..2] of String=('Вартість навчання, грн', 'Стоимость обучения, грн');
const  bs_PercentLg_Opl              :array[1..2] of String=('Відсоток пільги, %', 'Процент льготы, %');
const  bs_SummaLg_Opl                :array[1..2] of String=('Сума пільги, грн', 'Сумма льготы, грн');
const  bs_MonthCount_Opl             :array[1..2] of String=('Кіл-сть місяців', 'Кол-во месяцев');
const  bs_SummFinal_Opl              :array[1..2] of String=('Сума за період, грн', 'Сумма за период, грн');
const  bs_NumDoc_Pay                 :array[1..2] of String=('Документ №', 'Документ №');
const  bs_DateDoc_Pay                :array[1..2] of String=('Дата докум.', 'Дата докум.');
const  bs_Summa_Pay                  :array[1..2] of String=('Сума, грн.', 'Сумма, грн.');
const  bs_Need_Pay                   :array[1..2] of String=('Треба сплатити:', 'Надо оплатить:');
const  bs_Was_Pay                    :array[1..2] of String=('Вже сплачено:', 'Уже оплачено:');
const  bs_PayPo_Pay                  :array[1..2] of String=('Сплачено по ', 'Оплачено по ');
const  bs_Now_Pay                    :array[1..2] of String=('До сплати на сьогодні', 'К оплате на сегодня:');
const  bs_Itogo_Pay                  :array[1..2] of String=('Разом', 'Итого');
const  bs_Zadolg_Pay                 :array[1..2] of String=('Заборгованість:', 'Задолженность:');
const  bs_Hint_Pay                   :array[1..2] of String=('Документи оплати не знайдено', 'Документы оплаты не найдены');
const  bs_DateBirth                  :array[1..2] of String=('Дата народження: ', 'Дата рождения:');
const  bs_DSetRecordCount            :array[1..2] of String=('Кількість записів: ', 'Количество записей: ');
const  bs_FullPay                    :array[1..2] of String=('Cплачено повністю','Оплачено польностью');

const  bs_FullName                   :array[1..2] of String=('Повна назва', 'Полное название');
const  bs_ShortName                  :array[1..2] of String=('Скорочена назва', 'Краткое название');


const  bs_sp_ContractsList           :array[1..2] of String=('Довідник осіб, що навчаються за контрактом', 'Справочник обучающихся по договорам');
const  bs_OplataCaption              :array[1..2] of String=('Оплата контракту','Оплата контракта');
const  bs_ActionDates                :array[1..2] of String=('Період дії','Период действия');
const  bs_PayPeriod                  :array[1..2] of String=('Оплата за період','Оплата за период');
const  bs_SumCheck                   :array[1..2] of String=('Із зазначенням суми','С указанием суммы');
const  bs_NeedPay                    :array[1..2] of String=('Треба сплатити','Надо уплатить');
const  bs_WhosPay                    :array[1..2] of String=('Вже сплачено','Уже уплачено');
const  bs_Borg                       :array[1..2] of String=('Заборгованність','Задолженность');
const  bs_EnterSum                   :array[1..2] of String=('Сума, що вноситься','Вносимая сумма');
const  bs_Z                          :array[1..2] of String=('З','С');
const  bs_Po                         :array[1..2] of String=('По','По');

const  bs_View                       :array[1..2] of String=('Перегляд','Просмотр');
const  bs_Pay                        :array[1..2] of String=('Оплата','Оплата');

const  bs_Zaborgov                   :array[1..2] of String=('Заборгованність','Задолженность');
const  bs_Pereplata                  :array[1..2] of String=('Переплата','Переплата');

const  bs_Lgots_Sp                   :array[1..2] of String=('Пільги за договорами','Льготы по договорам');
const  bs_NomPrikaz                  :array[1..2] of String=('Номер наказу','Номер приказа');
const  bs_DatePrikaz                 :array[1..2] of String=('Дата наказу','Дата приказа');
const  bs_Osnovanie                  :array[1..2] of String=('Підстава','Основание');

const  bs_BegDate_Short              :array[1..2] of String=('Дата поч.','Дата нач.');
const  bs_EndDate_Short              :array[1..2] of String=('Дата закін.','Дата оконч.');
const  bs_RateAcc_Default            :array[1..2] of String=('Довідник розрахункових рахунків','Справочник расчетных счетов');
const  bs_RateAcc_Rate               :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');

const  bs_SearchCaption_Ex           :array[1..2] of String=('Розширений фільтр','Расширенный фильтр');
const  bs_Search_Ex                  :array[1..2] of String=('Шукати за','Искать по');
const  bs_TIN_Ex                     :array[1..2] of String=('ідентифікаційним податковим номером','идентификационному налоговому номеру');
const  bs_Need_TIN                   :array[1..2] of String=('Необхідно заповнити ідентифікаційний податковий номер!','Необходимо заполнить идентификационный налоговый номер!');
const  bs_Payer_Ex                   :array[1..2] of String=('платником','плательщику');

const  bs_Config                     :array[1..2] of String=('Конфігурація','Конфигурация');
const  bs_Tunning                    :array[1..2] of String=('Настройка...','Настройка...');
const  bs_Desctop                    :array[1..2] of String=('Робочий стіл','Рабочий стол');
const  bs_StartMenu                  :array[1..2] of String=('Меню "Пуск"','Меню "Пуск"');
const  bs_CreateIcons                :array[1..2] of String=('Помістити іконку на ...','Поместить иконку на ...');
const  bs_Icons                      :array[1..2] of String=('Іконки','Иконки');

const  bs_WhatsNew                   :array[1..2] of String=('Контракти: історія версій','Контракты: история версий');
const  bs_WhatsNew_Cap               :array[1..2] of String=('Що нового?','Что нового?');
const  bs_Exit                       :array[1..2] of String=('Вихід','Выход');
// DogDiss
const  bs_InfoDiss                   :array[1..2] of String=('Інформація про розірвання','Информация про расторжение');
const  bs_DateDiss                   :array[1..2] of String=('Дата розірвання','Дата расторжения');
const  bs_DateOrderDiss              :array[1..2] of String=('Дата наказу','Дата приказа');
const  bs_NumOrderDiss               :array[1..2] of String=('Номер наказу','Номер приказа');
const  bs_CommentDiss                :array[1..2] of String=('Коментарі','Комментарии');

const  bs_TypeLg_Label               :array[1..2] of String=('Тип пільги','Тип льготы');
const  bs_TypeDiss                   :array[1..2] of String=('Причина(тип розірвання)','Причина(тип расторжения)');
const  bs_sp_IniTypeDiss             :array[1..2] of String=('Довідник типів розірвання контракту','Справочник типов расторжения контракта');
const  bs_Confirm                    :array[1..2] of String=('Підтвердження','Подтверждения');
const  bs_Interface                  :array[1..2] of String=('Інтерфейс','Интерфейс');
const  bs_NoExitConfirm              :array[1..2] of String=('Не підтверджувати вихід','Не подтверждать выход');


const  bs_DateProv                   :array[1..2] of String=('Дата проводки','Дата проводки');
const  bs_ProvNote                   :array[1..2] of String=('Підстава','Основание');
const  bs_Pevdonim                   :array[1..2] of String=('Псевдонім','Псевдоним');
const  bs_Kr                         :array[1..2] of String=('Кредит','Кредит');
const  bs_Db                         :array[1..2] of String=('Дебет','Дебет');
const  bs_DogNumProv                 :array[1..2] of String=('Договір №','Договор №');
const  bs_Dodatki                    :array[1..2] of String=('Додаткові дії','Дополнительные действия');

const  bs_Cookies                     :array[1..2] of String=('Заповнити автоматично(взяти з історії)','Заполнить автоматически(взять из истории)');
const  bs_Language                    :array[1..2] of String=('Мова (потрібно перезавантаження програми)','Язык (необходима перезагрузка программы)');
const  bs_Rus_Lang                    :array[1..2] of String=('Російська','Русский');
const  bs_Ukr_Lang                    :array[1..2] of String=('Українська','Украинский');
const  bs_LangReload                  :array[1..2] of String=('Необхідно перезавантаження програми','Чтобы изменения вступили в силу необходим перезапуск программы');
const  bs_Baloon                      :array[1..2] of String=('Підказка','Подсказка');
const  bs_Welcome                     :array[1..2] of String=('Система "Горводоканал" бажає Вам приємної роботи... ','Система "Горводоканал" желает Вам приятной работы...');

const  bs_PreyskurantWork             :array[1..2] of String=('Робота з прейскурантом','Работа с прейскурантом');
const  bs_FizLizoEdit                 :array[1..2] of String=('Редагувати дані фіз.особи','Редактировать данные физ.лица');

// Tree
const  bs_tree_FullOpen               :array[1..2] of String=('Розкрити дерево цілком','Раскрыть дерево целиком');
const  bs_tree_FullClose              :array[1..2] of String=('Згорнути дерево цілком','Свернуть дерево целиком');
const  bs_tree_BranchOpen             :array[1..2] of String=('Розкрити гілку','Раскрыть ветвь');
const  bs_tree_BranchClose            :array[1..2] of String=('Згорнути гілку','Свернуть ветвь');
const  bs_tree_FullScreen             :array[1..2] of String=('Повний екран','Полный экран');

const  bs_Preved                      :array[1..2] of String=('Не показувати вітання при завантаженні ','Не показывать приветствие при загрузке');
const  bs_PrevedSelf                  :array[1..2] of String=('введіть сюди всій варіант привітання чи нагадування','введите сюда свой вариант приветствия или напоминания');
const  bs_PrevedHint                  :array[1..2] of String=('для системної інформації залиште поле пустим','для системной информации оставьте поле пустым');

const  bs_PayerSelect                 :array[1..2] of String=('Вибір платника за договором','Выбор плательщика по договору');

// preyskurant
const  bs_ViewPrice_Hint              :array[1..2] of String=('Показати актуальну версію','Показать актуальную версию');
const  bs_grid_VerName                :array[1..2] of String=('Назва версії прейскуранта','Название версии прейскуранта');
const  bs_showVerssions               :array[1..2] of String=('Показувати версії','Показывать версии');
const  bs_AddVerssion                 :array[1..2] of String=('Додати версію','Добавить версию');
const  bs_Preyskurant                 :array[1..2] of String=('Прейскурант...','Прейскурант...');
const  bs_PreyskurantHint             :array[1..2] of String=('Вибрати дані з прейскуранту','Выбрать данные из прейскуранта');

const  bs_roles_Kod                   :array[1..2] of String=('Код','Код');
const  bs_roles_Group                 :array[1..2] of String=('Групи користувачів','Группы пользователей');
const  bs_roles_Smets                 :array[1..2] of String=('Кошториси','Сметы');

const  bs_AcademYear                  :array[1..2] of String=('Академ. рік','Академ. год');
const  bs_StudInfWarning              :array[1..2] of String=('Інформація про осіб, що навчаються заповнена лише частково. Уважно перевірте дані!','Информация про обучающихся заполнена лишь частично. Внимательно проверьте данные!');

const  bs_Service                     :array[1..2] of String=('Служби','Службы');
const  bs_VC_Import                   :array[1..2] of String=('Імпорт контрактів','Импорт контрактов');
const  bs_VC_ClearBuffer              :array[1..2] of String=('Очистити буфер','Очистить буфер');
const  bs_VC_AllBuffer                :array[1..2] of String=('Буфер цілком','Буфер целиком');
const  bs_VC_BufferCaption            :array[1..2] of String=('DBF-буфер','DBF-буфер');
const  bs_VCBuffer_or_Not             :array[1..2] of String=('Додати з буферу чи вручну?','Добавить из буфера или вручную?');

const  bs_Log                         :array[1..2] of String=('Лог-історія роботи з контрактом','Лог-история работы с контрактом');
const  bs_User                        :array[1..2] of String=('Користувач','Пользователь');
const  bs_Action                      :array[1..2] of String=('Дія','Действие');
const  bs_Stamp                       :array[1..2] of String=('Дата\Час','Дата\Время');

const  bs_Use_Beg                     :array[1..2] of String=('Нач. дії','Нач. действ.');
const  bs_Use_End                     :array[1..2] of String=('Кінець дії','Оконч. действ.');

const  bs_RaxynokNaSplaty             :array[1..2] of String=('Рахунок на сплату договору №','Счет на оплату обучения №');
const  bs_SymaPaxynky                 :array[1..2] of String=('Сума рахунку','Сумма счета');
const  bs_NDS                         :array[1..2] of String=('ПДВ','НДС');
const  bs_PazomZNDS                   :array[1..2] of String=('Разом з ПДВ','Итого с НДС');
const  bs_RaxynokNaSplatyCaption      :array[1..2] of String=('Виписка рахунку на сплату навчання','Выписка счета на оплату обучения');
const  bs_Vid                         :array[1..2] of String=('від','от');

const  bs_SysOptions                  :array[1..2] of String=('Системні параметри','Системные параметры');
const  bs_Signature                   :array[1..2] of String=('Підпис','Подпись');
const  bs_Signature_off               :array[1..2] of String=('Зняти підпис','Снять подпись');
const  bs_Signature_on                :array[1..2] of String=('Поставити підпис','Поставить подпись');
const  bs_TransferToNextCurs          :array[1..2] of String=('Переведення на наст. курс','Перевод на след. курс');

const  bs_ForEach                     :array[1..2] of String=('Підтвердження для кожного студенту','Подтверждение для каждого студента');
const  bs_AvtoRastorg                 :array[1..2] of String=('Автоматично розривати контракти','Автоматически расторгать контракты');
const  bs_ParamsOtbor                 :array[1..2] of String=('Установка параметрів відбору','Установка параметров отбора');
const  bs_Params                      :array[1..2] of String=('Параметри','Параметры');
const  bs_CurrentTaskPercent          :array[1..2] of String=('Відсоток виконання','Процент выполнения');
const  bs_Admit                       :array[1..2] of String=('Пропустити','Пропустить');
const  bs_Admit_All                   :array[1..2] of String=('Пропустити усі','Пропустить все');
const  bs_NewPeriod                   :array[1..2] of String=('Новий період навчання','Новый период обучения');

const  bs_Role                        :array[1..2] of String=('Група','Группа');

const  bs_AllForAdmin                 :array[1..2] of String=('Адміну доступно усе!','Админу доступнно всё!');
const  bs_DotypSmetiTitle             :array[1..2] of String=('Доступні кошториси','Доступные сметы');

const  bs_NextCursAvto                :array[1..2] of String=('Додати наступний курс автоматично','Добавить следующий курс автоматично');

const  bs_RahunokWork                 :array[1..2] of String=('Робота з рахунками','Работа со счетами');

const  bs_Relation                    :array[1..2] of String=('Зв''язок','Связь');
const  bs_RelDepartment               :array[1..2] of String=('Зв''язок з підрозділом','Связь с подразделением');
const  bs_NoRelDepartment             :array[1..2] of String=('Зв''язку з підрозділом не знайдено','Связь с подразделением не определена');
const  bs_DepGrName                   :array[1..2] of String=('Група у підрозділі','Группа в подразделении');
const  bs_NameExec                    :array[1..2] of String=('Посада відповідального','Должность ответственного');
const  bs_Dekan                       :array[1..2] of String=('ПІБ відповідального','ФИО ответственного');
const  bs_SearchAll                   :array[1..2] of String=('Усі','Все');
const  bs_Write                       :array[1..2] of String=('Запис','Запись');

const  bs_Sort                        :array[1..2] of String=('Сортування','Сортировка');

const  bs_Success                     :array[1..2] of String=('Успішно!','Успешно!');
const  bs_WasFullWork                 :array[1..2] of String=('Оброблено усього: ','Обработано всего: ');
const  bs_WasBreak                    :array[1..2] of String=('Розірвано: ','Расторгнуто: ');
const  bs_WasTransfer                 :array[1..2] of String=('Переведено на наступний курс: ','Переведено на следующий курс: ');
const  bs_WasAdmit                    :array[1..2] of String=('Пропущено: ','Пропущено: ');

const  bs_Add_List                    :array[1..2] of String=('Додати зписок','Добавить список');
const  bs_Status                      :array[1..2] of String=('Статус','Статус');
const  bs_Type                        :array[1..2] of String=('Тип','Тип');
const  bs_DateCalc                    :array[1..2] of String=('Дата розрахунку','Дата расчета');
const  bs_RaportAvto                  :array[1..2] of String=('Додати автоматично на дату розрахунку','Добавить автоматически на дату расчета');
const  bs_RaportAvtoComments          :array[1..2] of String=('Автоматичне додавання усіх контрактів, які мають заборгованність на дату розрахунку ','Автоматическое добавление всех контрактов, которые имеют задолженность на дату расчета');

const  bs_Lgota                       :array[1..2] of String=('Пільга:','Льгота:');
const  bs_OnovnieTypeDoc              :array[1..2] of String=('Основні','Основные');
const  bs_DodatkovTypeDoc             :array[1..2] of String=('Додаткові','Дополнительные');

const  bs_Recovery                    :array[1..2] of String=('Відновлення','Восстановление');
const  bs_grid_Actual                 :array[1..2] of String=('Актуальність','Актуальность');
const  bs_price_already_signed        :array[1..2] of String=('Підписаний','Подписаный');

const  fr_Reports_CALC_NameREP0       :array[1..2] of String=('Розрахунок на','Расчет на');
const  fr_Reports_CALC_NameREP        :array[1..2] of String=('Довідка №','Справка №');
const  fr_Reports_CALC_NameREP1       :array[1..2] of String=('про стан виконання договору за навчання','о состоянии выполнения договора за обучение');
const  fr_Reports_CALC_NameREP2       :array[1..2] of String=('Договір №','Договор №');
const  fr_Reports_CALC_NameStuder     :array[1..2] of String=('Особа, що навчається','Обучаемый');

const  fr_Reports_CALC_Beg            :array[1..2] of String=('Початок періоду','Начало периода');
const  fr_Reports_CALC_End            :array[1..2] of String=('Кінець періоду','Конец периода');
const  fr_Reports_CALC_Stoimost       :array[1..2] of String=('Вартість навч., грн','Стоимость обуч., грн');
const  fr_Reports_CALC_SummaLg        :array[1..2] of String=('Сумова пільга, грн','Суммовая льгота, грн');
const  fr_Reports_CALC_PersentLg      :array[1..2] of String=('Відсоток пільги, %','Процент льготы, %');
const  fr_Reports_CALC_DolgBeg        :array[1..2] of String=('Борг на початок, грн','Долг на начало, грн');
const  fr_Reports_CALC_AllPeriod      :array[1..2] of String=('Сума за період, грн','Сумма за период, грн');
const  fr_Reports_CALC_SumPay         :array[1..2] of String=('Сума, що надійшла, грн','Поступившая сумма, грн');
const  fr_Reports_CALC_DolgEnd        :array[1..2] of String=('Борг на кінець, грн','Долг на конец, грн');

const  fr_Reports_CALC_SumDolg        :array[1..2] of String=('Сума до сплати, грн','Сумма к оплате, грн');
const  fr_Reports_CALC_WhasPay         :array[1..2] of String=('Вже сплачено, грн','Уже уплачено, грн');

const  fr_Reports_CALC_All            :array[1..2] of String=('Разом:','Итого:');
const  fr_Reports_CALC_PayConf        :array[1..2] of String=('Сплачено','Оплачено');
const  fr_Reports_CALC_PayConf1       :array[1..2] of String=('повністю','полностью');

const  fr_Reports_SUMMA_K_OPLATE      :array[1..2] of String=('Сума оплати','Сумма к оплате');
const  fr_Reports_UGE_OPLACHENO       :array[1..2] of String=('Вже сплачено','Уже оплачено');
const  fr_Reports_SUMMA_DOLGA         :array[1..2] of String=('Сума боргу','Сумма долга');

const  fr_Reports_CALC_KydaVidana     :array[1..2] of String=('Довідка видана для пред''''явлення за місцем вимоги','Справка выдана для предъявления по месту требования.');
const  fr_Reports_CALC_Buhg           :array[1..2] of String=('Бухгалтер','Бухгалтер');

const  fr_Reports_PrintSpravkaCalc    :array[1..2] of String=('Друк довідки','Печать справки');
const  fr_Reports_PayDocs             :array[1..2] of String=('Документи у рахунок оплати договору','Документы в счет оплаты договора');
const  fr_Reports_CalcDocs            :array[1..2] of String=('Про стан виконання договору','О состоянии выполнения договора');

const  fr_Stud                        :array[1..2] of String=('Реєстр/Зведена форма осіб, що навч. за контрактами','Реестр/Сводная форма договорников');
const  fr_Pay                         :array[1..2] of String=('Реєстр/Зведена форма боржників за навчання','Реестр/Сводная форма должников за обучение');
const  fr_Zvit                        :array[1..2] of String=('Звітні форми','Отчетные формы');

const  frSplataIstochnikiBtn          :array[1..2] of String=('Аналіз сплати за навч. за джерелами фінанс.',
                                                              'Анализ оплаты за обуч. по источникам финанс.');
const  frPercentValueBtn              :array[1..2] of String=('Відсоткове виконання договорів за навчання',
                                                              'Процентное выполнение договоров за обучение');
const  frLgotaAnalisBtn               :array[1..2] of String=('Аналіз надання пільг за сплату за навчання',
                                                              'Анализ выдачи льгот по оплате за обучение');

const  frReestrSvodPoOplate           :array[1..2] of String=('Реєстр/Аналіт. звіт по сплаті за навчання','Реестр\Аналитич. сводная по оплате за обучение');
const  frSvodNepostupSummBtn          :array[1..2] of String=('Реєстр/Зведена форма сум,що не надійшли','Реестр\Сводная форма недопоступивших сумм');
const  frSvodPoOtchislenim            :array[1..2] of String=('Зведена форма по відрахованим','Сводная форма по отчисленным');

const  bs_Execution                   :array[1..2] of String=('Виконати','Выполнить');

const  frVikonannya_Btn               :array[1..2] of String=('Аналітичний звіт, виконання договорів за навчання',
                                                              'Аналитический свод, выполнение договоров по обучению');

const  bs_Orders                      :array[1..2] of String=('Накази','Приказы');

const  bs_OrderType                   :array[1..2] of String=('Тип наказу','Тип приказа');
const  bs_NumOrd                      :array[1..2] of String=('Номер','Номер');
const  bs_DateOrd                     :array[1..2] of String=('Дата','Дата');
const  bs_Zvit                        :array[1..2] of String=('Звіт','Отчет');
const  bs_TagOrder                    :array[1..2] of String=('Пріоритет','Приоритет');

const  bs_IsVisibleReestr             :array[1..2] of String=('Видимий у реєстрі','Видимый в реестре');
const  bs_IsVisibleOplata             :array[1..2] of String=('Видимий у сплаті','Видимый в оплате');
const  bs_IsVisibleReestrShort        :array[1..2] of String=('У реєстрі','В реестре');
const  bs_IsVisibleOplataShort        :array[1..2] of String=('У сплаті','В оплате');

const  bs_BasicContract               :array[1..2] of String=('Основний','Основной');

const  bs_ContractPrint               :array[1..2] of String=('Друк контракту','Печать контракта');
const  bs_Day                         :array[1..2] of String=('День','День');
const  bs_Month                       :array[1..2] of String=('Місяць','Месяц');
const  bs_Full_Name                   :array[1..2] of String=('Повне найменування','Полное наименование');
const  bs_CopyPrintCount              :array[1..2] of String=('Кіль-сть копій для друку','Кол-во копий для печати');
const  bs_LowSpecimen                 :array[1..2] of String=('Законий представник студента','Законный представитель студента');
const  bs_OsosbaCustomer              :array[1..2] of String=('Особа, яка уклала контракт','Лицо, заключившее контракт');
const  bs_DeletedShow                 :array[1..2] of String=('Видалені контракти','Удаленные контракты');
const  bs_DeletedMode                 :array[1..2] of String=('Режим перегляду видалених контрактів','Режим просмотра удаленных контрактов');
const  bs_ExportData                  :array[1..2] of String=('Експорт даних контракту','Экспорт данных контракта');

const  bs_KillAll                     :array[1..2] of String=('Видалити усі','Удалить все');
const  bs_KillOnlyOne                 :array[1..2] of String=('Видалити за фільтром','Удалить по фильтру');

const  bs_TwainShort                  :array[1..2] of String=('Скан','Скан');
const  bs_Twain                       :array[1..2] of String=('Сканування','Сканування');
const  bs_CreditNote                  :array[1..2] of String=('Заголовок звіту','Заголовок отчета');
const  bs_CreditBank                  :array[1..2] of String=('Керуючий банком','Управляющий банком');
const  bs_LimitSum                    :array[1..2] of String=('Межа суми кредиту','Предел суммы кредита');
const  bs_LimitDogs                   :array[1..2] of String=('Межа к-сті контрактів','Предел кол-ва контрактов');
const  bs_CreditImage                 :array[1..2] of String=('Тільки з образами','Только с образами');
const  bs_Reestr                      :array[1..2] of String=('Реєстр','Реестр');
const  bs_Image                       :array[1..2] of String=('Образи','Образы');
const  bs_DogSum                      :array[1..2] of String=('Сума договору','Сумма договора');
const  bs_PrintRangeImage             :array[1..2] of String=('Друк діапазону образів...','Печать диапазона образов...');
const  bs_Main_SpCreditStatus         :array[1..2] of String=('Довідник статусів кредиту','Справочник статусов кредита');

const  bs_PrintAllPages               :array[1..2] of String=('Усі сторінки','Все страницы');
const  bs_PrintChetPages              :array[1..2] of String=('Парні сторінки','Четные страницы');
const  bs_PrintNeChetPages            :array[1..2] of String=('Непарні сторінки','Нечетные страницы');

const  bs_btnSeparate                 :array[1..2] of String=('Роз''єднання','Разделение');
const  bs_btnUnion                    :array[1..2] of String=('Об''єднання','Объединение');

const  bs_CopyPrice                   :array[1..2] of String=('Копіювати','Копировать');

const  bs_Fam                         :array[1..2] of String=('Прізвище','Фамилия');
const  bs_Name                        :array[1..2] of String=('Ім''я','Имя');
const  bs_otch                        :array[1..2] of String=('По батькові','Отчество');

{
const  bs_                           :array[1..2] of String=('','');
const  bs_                           :array[1..2] of String=('','');
const  bs_                           :array[1..2] of String=('','');
const  bs_                           :array[1..2] of String=('','');
}

//-----------------------------REG----------------------------------------------
const bs_Can_not_delete              :array[1..2] of String=('Реєстр підписаний і не може бути видалений!','Реестр подписан и не может быть удален!');
//-----------------------------Message------------------------------------------
const bs_msg_WARNING              :array[1..2] of String=('Попередження','Предупреждение');
const bs_msg_INFO                 :array[1..2] of String=('Інформація','Информация');


const bs_sp_input      : array[1..2] of String=('Довідник вводів','Справочник вводов');
const bs_sp_hydrometer : array[1..2] of String=('Довідник водомірів','Справочник водомеров');
const bs_short_cut     : array[1..2] of String=('Гарячі клавіші','Горячие клавиши');

//----------------------Справочник типов водомеров
const bs_sp_hydrometer_type      :array[1..2] of String=('Довідник типів водомірів','Справочник типов водомеров');
const bs_name_hydrometer_type    :array[1..2] of String=('Назва типу водоміра','Название типа водомера');
const bs_caliber_hydrometer      :array[1..2] of String=('Калібр водоміра','Калибр водомера');
const bs_id_unit_meas            :array[1..2] of String=('Одиниці виміру калібра водоміра','Единицы измерения калибра водомера');
const bs_capacity_hydrometer     :array[1..2] of String=('Розрядність водоміра','Разрядность водомера');
const bs_accuracy_hydrometer     :array[1..2] of String=('Точність водоміра','Точность водомера');
const bs_note_hydrometer         :array[1..2] of String=('Примітка','Примечание');
const bs_factory_hydrometer      :array[1..2] of String=('Виробник водоміра','Производитель водомера');

//----------------------Справочник видов водомеров
const bs_sp_hydrometer_vid      :array[1..2] of String=('Довідник видів водомірів','Справочник видов водомеров');
const bs_name_hydrometer_vid    :array[1..2] of String=('Назва виду водоміра','Название вида водомера');

//----------------------Справочник типов документов
const bs_sp_document_type      :array[1..2] of String=('Довідник типів документів','Справочник типов документов');
const bs_name_document_type    :array[1..2] of String=('Назва типу документу','Название типа документа');


//------------Цвета---
const BsClFieldIsEmpty = $00DDBBFF;

implementation


end.
