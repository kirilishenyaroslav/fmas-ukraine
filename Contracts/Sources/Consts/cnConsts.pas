//******************************************************************************
// Contracts
// Файл строковых ресурсов
// Чернявский А.Э.                             
// последние изменения Перчак А.Л. 27/10/2008
//******************************************************************************
unit cnConsts;

interface
{Windows}  
const cn_Windows_Tiltle              :array[1..2] of String=('Вікна','Окна');
const cn_WindowsCacade               :array[1..2] of String=('Каскад','Каскад');
const cn_WindowsHorizontal           :array[1..2] of String=('Горизонтально','Горизонтально');
const cn_WindowsVertical             :array[1..2] of String=('Вертикально','Вертикально');
const cn_WindowsMinimizeAll          :array[1..2] of String=('Звернути усі','Свернуть все');
const cn_WindowsCloseAll             :array[1..2] of String=('Закрити усі','Закрыть все');

{Form_Titles}
const cn_ReestrContracts_Tiltle      :array[1..2] of String=('Реєстр контрактів','Реестр контрактов');
const cn_DBInfo_Tiltle               :array[1..2] of String=('Підключення до БД','Подключение к БД');
const cn_FileVersion                 :array[1..2] of String=('Версія','Версия');
const cn_AssemblingVersion           :array[1..2] of String=('Зборка','Сборка');
const cn_ConnectionInfo              :array[1..2] of String=('Інформація про з''єднання','Информация про подключение');
const cn_ApplicationName             :array[1..2] of String=('Ім''я файлу: ','Имя приложения: ');
const cn_ApplicationWay              :array[1..2] of String=('Розміщення файлу: ','Путь к приложению: ');
const cn_FileVersionFull             :array[1..2] of String=('Версія файлу: ','Версия файла: ');
const cn_AssemblingDate              :array[1..2] of String=('Дата зборки: ','Дата сборки: ');
const cn_DBWay                       :array[1..2] of String=('Розміщення файлу БД: ','Путь к базе данных: ');
const cn_FilterText                  :array[1..2] of String=('введіть прізвище','введите фамилию');
const cn_HelpText                    :array[1..2] of String=('Допомога','Помощь');
const cn_ContractsReestrText         :array[1..2] of String=('Реєстр контрактів','Реестр контрактов');
const cn_NowDate_Caption             :array[1..2] of String=('Сьогодні: ','Сегодня: ');
const cn_RaschetSchet_Title          :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');
const cn_UserFio                     :array[1..2] of String=('П.І.Б. користувача: ','ФИО пользователя: ');
const cn_Login                       :array[1..2] of String=('Логін: ','Логин: ');
const cn_UserInfo                    :array[1..2] of String=('Інформація про користувача: ','Информация про пользователя');
const cn_grid_ADDVerName             :array[1..2] of String=('Назва версії прейскаранта','Название версии прейскуранта'); 
{Date_Formats}
const cn_Year_Short                  :array[1..2] of String=(' рр.',' гг.');


{ShortCuts}
const cn_HelpBtn_ShortCut            :array[1..2] of String=('F1 ', 'F1 ');
const cn_InsertBtn_ShortCut          :array[1..2] of String=('Ins ', 'Ins ');
const cn_EditBtn_ShortCut            :array[1..2] of String=('F2 ','F2 ');
const cn_DeleteBtn_ShortCut          :array[1..2] of String=('Del ','Del ');
const cn_RefreshBtn_ShortCut         :array[1..2] of String=('F5 ', 'F5 ');
const cn_ExitBtn_ShortCut            :array[1..2] of String=('Esc ','Esc ');
const cn_FilterBtn_ShortCut          :array[1..2] of String=('Ctrl+F ','Ctrl+F ');
const cn_EnterBtn_ShortCut           :array[1..2] of String=('Enter ','Enter ');
const cn_PaymentBtn_ShortCut         :array[1..2] of String=('F6 ','F6 ');
const cn_PrintBtn_ShortCut           :array[1..2] of String=('Ctrl+P ','Ctrl+P ');
const cn_ModeBtn_ShortCut            :array[1..2] of String=('F9 ','F9 ');
const cn_F10Btn_ShortCut             :array[1..2] of String=('F10 ','F10 ');
const cn_F3Btn_ShortCut              :array[1..2] of String=('F3 ','F3 ');

{All_Actions}
const cn_HelpBtn_Caption             :array[1..2] of String=('Допомога','Помощь');
const cn_InsertBtn_Caption           :array[1..2] of String=('Додати','Добавить');
const cn_EditBtn_Caption             :array[1..2] of String=('Змінити','Изменить');
const cn_DeleteBtn_Caption           :array[1..2] of String=('Видалити','Удалить');
const cn_RefreshBtn_Caption          :array[1..2] of String=('Оновити', 'Обновить');
const cn_ExitBtn_Caption             :array[1..2] of String=('  Вихід  ','  Выход  ');
const cn_FilterBtn_Caption           :array[1..2] of String=('Фільтр','Фильтр');
const cn_FilterParams_Need           :array[1..2] of String=('Не вибрані параметри для фільтрації!','Не выбраны параметры для фильтрации!');
const cn_SearchBtn_Caption           :array[1..2] of String=('Пошук','Поиск');
const cn_Print_Caption               :array[1..2] of String=(' Друк ',' Печать ');
const cn_Pay_Caption                 :array[1..2] of String=(' Оплата ',' Оплата ');
const cn_Lgota_Caption               :array[1..2] of String=(' Пільги ',' Льготы ');
const cn_EntryRest_Caption           :array[1..2] of String=('Вхідний залишок','Входящий остаток');
const cn_History                     :array[1..2] of String=('Історія','История');
const cn_SelectBtn_Caption           :array[1..2] of String=('Вибрати','Выбрать');
const cn_ModeBtn_Caption             :array[1..2] of String=('Зміна режиму','Смена режима');
const cn_PrintShort_Caption          :array[1..2] of String=('Друк','Печать');
const cn_ViewShort_Caption           :array[1..2] of String=('Перегляд','Просмотр');
const cn_AutoShort_Caption           :array[1..2] of String=('Автоматично','Автоматично');
const cn_Credit_Caption              :array[1..2] of String=('Кредит','Кредит');
const cn_Upload_Caption              :array[1..2] of String=('Переоформити','Переоформить');
const cn_BreakDown_Caption           :array[1..2] of String=('Розірвати','Расторгнуть');
const  cn_PayerInfoData              :array[1..2] of String=('Дані про платника','Данные о плательщике');
const  cn_Pri4inaRastorg             :array[1..2] of String=('Причина розірвання','Причина расторжения');
const cn_ViewAll                     :array[1..2] of String=('Розгорнути усі','Развернуть все');
const cn_HidenAll                    :array[1..2] of String=('Згорнути усі','Свернуть все');
{Confirms}
const cn_Confirmation_Caption        :array[1..2] of String=('Підтвердження','Подтверждение');
const cn_Uvaga_Caption               :array[1..2] of String=('Увага!','Внимание!');
const cn_ExitPromt                   :array[1..2] of String=('Ви бажаєте вийти?', 'Вы хотите выйти?');
const cn_DeletePromt                 :array[1..2] of String=('Ви дійсно хочете видалити запис?', 'Вы действительно хотите удалить запись?');
const cn_Accept                      :array[1..2] of String=('Прийняти','Принять');
const cn_Cancel                      :array[1..2] of String=('Відмінити','Отмена');
const cn_ClearBufferPromt            :array[1..2] of String=('Ви дійсно хочете очистити буфер?', 'Вы действительно хотите очистить буфер?');
{ApplicationInitialise}
const cn_Application_Caption         :array[1..2] of String=('Контракти','Контракты');
const cn_Main_Ready_Caption          :array[1..2] of String=('Готовий','Готов');
const cn_Main_StatusBar_Caption      :array[1..2] of String=('Панель інформації','Панель информации');
const cn_HotKeys                     :array[1..2] of String=('Горячі клавіши','Горячие клавиши');
{MainButtons}
const cn_Main_WorkBtn_Caption        :array[1..2] of String=('Робота','Работа');
const cn_Main_SpravBtn_Caption       :array[1..2] of String=('Довідники','Справочники');
const cn_Main_AboutBtn_Caption       :array[1..2] of String=('Про програму','О программе');
const cn_Main_ExitBtn_Caption        :array[1..2] of String=('Вихід','Выход');

{Errors}
const cn_Error_Caption               :array[1..2] of String=('Помилка','Ошибка');
const cn_Error_LoadBPL_Text          :array[1..2] of String=('Помилка при завантаженні пакету','Ошибка при загрузке пакета');

{MainGuides}
const  cn_Main_TypeLgot              :array[1..2] of String=('Довідник типів пільг', 'Справочник типов льгот');
const  cn_Main_PayerType             :array[1..2] of String=('Довідник типів платників', 'Справочник типов плательщиков');
const  cn_Main_FacultySpeciality     :array[1..2] of String=('Довідник cпеціальностей та груп', 'Справочник специальностей и групп');
const  cn_Main_FormStudy             :array[1..2] of String=('Довідник форм навчання', 'Справочник форм обучения');
const  cn_Main_Faculty               :array[1..2] of String=('Довідник факультетів', 'Справочник факультетов');
const  cn_Main_Nationality           :array[1..2] of String=('Довідник національностей', 'Справочник национальностей');
const  cn_Main_CategoryStudy         :array[1..2] of String=('Довідник категорій навчання', 'Справочник категорий обучения');
const  cn_Main_IniPeriodic           :array[1..2] of String=('Довідник періодичностей оплат', 'Справочник периодичности оплат');
const  cn_Main_FaculSpecGroup        :array[1..2] of String=('Довідник факультетів, cпеціальностей та груп', 'Справочник факультетов, специальностей и групп');
const  cn_PaymentAnalysis            :array[1..2] of String=('Форма аналізу оплати', 'Форма анализа оплаты');
const  cn_Main_SpRoles               :array[1..2] of String=('Довідник груп користувачів та кошторисів','Справочник групп пользователей и смет');
const  cn_Main_SpActions             :array[1..2] of String=('Довідник дій','Справочник действий');
const  cn_Main_SpSignature           :array[1..2] of String=('Довідник підписів','Справочник подписей');
const  cn_Main_SpSpec                :array[1..2] of String=('Довідник cпеціальностей','Справочник специальностей');
const  cn_Main_SpDepartment          :array[1..2] of String=('Довідник підрозділів','Справочник подразделений');
const  cn_Main_SpDogStatus           :array[1..2] of String=('Довідник статусів контрактів','Справочник статусов контрактов');
const  cn_Main_SpPeople              :array[1..2] of String=('Довідник фізичних осіб','Справочник физических лиц');
const  cn_Main_SpYurLiza             :array[1..2] of String=('Довідник юрідичних осіб','Справочник юридических лиц');
const  cn_Main_SpRapStatus           :array[1..2] of String=('Довідник статусів рапортів','Справочник статусов рапортов');
const  cn_Main_SpTypeDocum           :array[1..2] of String=('Довідник типів стану документів','Справочник типов состояния документов');
const  cn_Main_SpOrderTypes          :array[1..2] of String=('Довідник типів наказів','Справочник типов приказов');
const  cn_Main_SpNamesReport         :array[1..2] of String=('Довідник найменувань звітів','Справочник наименований отчетов');
const  cn_Main_SpTypeDog             :array[1..2] of String=('Довідник типів контрактів','Справочник типов контрактов');
const  cn_Main_SpDatePay             :array[1..2] of String=('Довідник дат оплат','Справочник дат оплат');

const  cn_Main_DawaVCImport          :array[1..2] of String=('Імпорт даних з ОЦ','Импорт данных из ВЦ');
const  cn_Main_DawaVCPrimary         :array[1..2] of String=('Імпорт договорів у буфер','Импорт договров в буфер');
const  cn_Main_DawaVCLinks           :array[1..2] of String=('Імпорт договорів з буферу','Импорт договоров из буфера');
const  cn_Main_DawaVCBuffer          :array[1..2] of String=('Буфер контрактів','Буфер контрактов');

const  cn_Main_RaportOtchisl         :array[1..2] of String=('Рапорти на відрахування','Рапорта на отчисление');
const  cn_Main_RaportVotanovl        :array[1..2] of String=('Рапорти на відновлення','Рапорта на восстановление');

const  cn_print_RZ_Postyp            :array[1..2] of String=('Реєстр/Зведена форма надходжень за навчання','Реестр/Сводная форма поступлений за обучение');

{Contracts_Grid}
const  cn_grid_FIO_Column            :array[1..2] of String=('П.І.Б.', 'Ф.И.О.');
const  cn_grid_Date_Dog_Column       :array[1..2] of String=('Дата укладання', 'Дата заключения');
const  cn_grid_Num_Dog_Column        :array[1..2] of String=('Номер договору', 'Номер договора');
const  cn_grid_Date_Beg              :array[1..2] of String=('Дата початку', 'Дата начала');
const  cn_grid_Date_End              :array[1..2] of String=('Дата закінчення', 'Дата окончания');
const  cn_grid_IsDiss_Column         :array[1..2] of String=('Не діючий', 'Не действующий');
const  cn_IS_Deleted_Column         :array[1..2] of String=('Видалено', 'Удалено');

{Contracts_Footer}
const  cn_footer_Faculty             :array[1..2] of String=('Факультет', 'Факультет');
const  cn_footer_Spec                :array[1..2] of String=('Спеціальність', 'Специальность');
const  cn_footer_Group               :array[1..2] of String=('Група', 'Группа');
const  cn_footer_FormStudy           :array[1..2] of String=('Форма навчання', 'Форма обучения');
const  cn_footer_CategoryStudy       :array[1..2] of String=('Категорія навчання', 'Категория обучения');
const  cn_footer_Kurs                :array[1..2] of String=('Курс', 'Курс');
const  cn_Gragdanstvo                :array[1..2] of String=('Громадянство', 'Гражданство');
const  cn_srok_study                 :array[1..2] of String=('Строк навчання','Срок обучения');

//-----{Contracts_Components}------------------------------------------------------------------//

{Contracts_Components_GroupBox}
const  cn_BasicInfo_GroupBox         :array[1..2] of String=('Основна інформація', 'Основная информация');
const  cn_Study_GroupBox             :array[1..2] of String=('Інформація про осіб, що навчаються', 'Обучающиеся');
const  cn_Studer_Osoba               :array[1..2] of String=('Особа, що навчається', 'Обучающийся');
const  cn_Payer_Osoba                :array[1..2] of String=('Платник', 'Плательщик');
const  cn_Payers_GroupBox            :array[1..2] of String=('Платники', 'Плательщики');
const  cn_Periods_GroupBox           :array[1..2] of String=('Періоди оплати', 'Периоды оплаты');
const  cn_Istochniki_GroupBox        :array[1..2] of String=('Джерела фінансування', 'Источники финансирования');
{Contracts_Components_Lables}
const  cn_Num_Dog_Label              :array[1..2] of String=('Номер договору', 'Номер договора');
const  cn_Date_Zakl_Label            :array[1..2] of String=('Дата укладання', 'Дата заключения');
const  cn_Date_Beg_Label             :array[1..2] of String=('Дата початку', 'Дата начала');
const  cn_Date_End_Label             :array[1..2] of String=('Дата закінчення', 'Дата окончания');
const  cn_Type_Dog_Label             :array[1..2] of String=('Тип договору', 'Тип договора');
const  cn_Basic_Dog_Label            :array[1..2] of String=('Основний', 'Основной');
const  cn_Addit_Dog_Label            :array[1..2] of String=('Додатковий', 'Дополнительный');
{Contracts_Components_Grid_Captions}
const  cn_Payer_Column               :array[1..2] of String=('Платник', 'Плательщик');
const  cn_Period_Column              :array[1..2] of String=('Періодичність', 'Периодичность');
const  cn_Persent_Column             :array[1..2] of String=('Відсоток', 'Процент');
const  cn_Date_Opl_Column            :array[1..2] of String=('Дата оплати', 'Дата оплаты');
const  cn_Summa_Column               :array[1..2] of String=('Сума', 'Сумма');
const  cn_Name_Column                :array[1..2] of String=('Найменування', 'Наименование');
const  cn_cntMonth_Column            :array[1..2] of String=('Кількість місяців', 'Кол-во месяцев');

const  cn_ParamStudyModify_Caption   :array[1..2] of String=('Редагувати параметри навчання', 'Редактировать параметры обучения');
const  cn_FIOModify_Caption          :array[1..2] of String=('Редагувати особу, що навчається', 'Редактировать обучающегося');
const  cn_add_new_summ               :array[1..2] of String=('Додати нову ціну', 'Добавить новую цену');
const  cn_add_new_summ_by_param      :array[1..2] of String=('Додати нову ціну на підставі вибранних параметрів', 'Добавить новую цену на основе выбранных параметров');

{Smeta-Razdel-Statya-Kekv}
const  cn_Smeta                      :array[1..2] of String=('Кошторис', 'Смета');
const  cn_Razdel                     :array[1..2] of String=('Розділ', 'Раздел');
const  cn_Statya                     :array[1..2] of String=('Стаття', 'Статья');
const  cn_Kekv                       :array[1..2] of String=('КЕКВ', 'КЭКЗ');
{Contracts_Components_Filtration}
const  cn_Filtration                 :array[1..2] of String=('Фільтрація', 'Фильтрация');
const  cn_FiltrByFIO                 :array[1..2] of String=('П.І.Б.', 'Ф.И.О.');
const  cn_FiltrByNum                 :array[1..2] of String=('Номер', 'Номер');
const  cn_FiltrHint                  :array[1..2] of String=('Фільтровати негайно!', 'Фильтровать немедленно!');

{Contracts_Add_Edit_Messages}
const  cn_Num_Dog_Need               :array[1..2] of String=('Необхідно заповнити номер договору!','Необходимо заполнить номер договора!');
const  cn_Date_Dog_Need              :array[1..2] of String=('Необхідно заповнити дату укладання договору!','Необходимо заполнить дату заключения договора!');
const  cn_summ_prices_Need           :array[1..2] of string=('Необхідно ввести суму!','Необходимо ввести сумму!');

//--------------{Contracts_Payer_AE}-------------------------------------------------------------
const  cn_FizOsoba                  :array[1..2] of String=('Фізична особа', 'Физическое лицо');
const  cn_YurOsoba                  :array[1..2] of String=('Юридична особа','Юридическое лицо');
const  cn_PayerType                 :array[1..2] of String=('Тип платника','Тип плательщика');
const  cn_MFO_Caption               :array[1..2] of String=('МФО','МФО');
const  cn_RasSchet_Caption          :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');
{Contracts_Payer_AE_Messages}
const  cn_Payer_Need                :array[1..2] of String=('Необхідно заповнити платника!','Необходимо заполнить плательщика!');
const  cn_Percent_Need              :array[1..2] of String=('Необхідно заповнити відсоток!','Необходимо заполнить процент!');
const  cn_Period_Need               :array[1..2] of String=('Необхідно заповнити періодичність!','Необходимо заполнить периодичность!');
//--------------{Contracts_Studer_AE}-------------------------------------------------------------
const  cn_Studer                    :array[1..2] of String=('Особа, що навчається','Обучающийся');
const  cn_Studer_Need               :array[1..2] of String=('Необхідно заповнити особу, що навчається!','Необходимо заполнить обучающегося!');

const  cn_LowSpecimen               :array[1..2] of String=('Законий представник студента','Законный представитель студента');
const  cn_LowSpecimen_Need          :array[1..2] of String=('Необхідно обрати законого представника студента','Необходимо выбрать законного представителя студента');
//--------------{Contracts_Periods_AE}-------------------------------------------------------------
const  cn_Periods_DateOpl           :array[1..2] of String=('Дата оплати','Дата оплати');
{Contracts_Periods_AE_Messages}
const  cn_Periods_Date_Beg_Need     :array[1..2] of String=('Необхідно заповнити дату початку!','Необходимо заполнить дату начала!');
const  cn_Periods_Date_End_Need     :array[1..2] of String=('Необхідно заповнити дату закінчення!','Необходимо заполнить дату окончания!');
const  cn_Periods_Date_Pay_Need     :array[1..2] of String=('Необхідно заповнити дату оплати!','Необходимо заполнить дату оплаты!');
const  cn_Periods_Date_PaySum_Need  :array[1..2] of String=('Необхідно заповнити суму!','Необходимо заполнить сумму!');
//-----------------------------------------------------------------------------------------------
{Contracts_Istochniki_AE_Messages}
const  cn_Smeta_Need                :array[1..2] of String=('Необхідно заповнити кошторис!','Необходимо заполнить смету!');
const  cn_Razdel_Need               :array[1..2] of String=('Необхідно заповнити розділ!','Необходимо заполнить раздел!');
const  cn_Stat_Need                 :array[1..2] of String=('Необхідно заповнити статтю!','Необходимо заполнить статью!');
const  cn_Kekv_Need                 :array[1..2] of String=('Необхідно заповнити КЕКВ!','Необходимо заполнить КЭКЗ!');

{Contracts_StudyParams_Title}
const  cn_StudyParams_Title         :array[1..2] of String=(' параметри навчання',' параметры обучения');

const  cn_CollectDog                :array[1..2] of String=('КОЛЕКТИВНИЙ','КОЛЛЕКТИВНЫЙ');
const  cn_EntryRest                 :array[1..2] of String=('Вхідний залишок','Входящий остаток');
const  cn_EntryRestShort            :array[1..2] of String=('Вх.залишок','Вх.остаток');

{Oplata_Analiz}
const  cn_Beg_Opl                    :array[1..2] of String=('Початок періоду', 'Начало периода');
const  cn_End_Opl                    :array[1..2] of String=('Закінчення періоду', 'Конец периода');
const  cn_Summa_Opl                  :array[1..2] of String=('Вартість навчання', 'Стоимость обучения');
const  cn_PercentLg_Opl              :array[1..2] of String=('Відсоток пільги, %', 'Процент льготы, %');
const  cn_SummaLg_Opl                :array[1..2] of String=('Сума пільги', 'Сумма льготы');
const  cn_MonthCount_Opl             :array[1..2] of String=('Кіл-сть місяців', 'Кол-во месяцев');
const  cn_SummFinal_Opl              :array[1..2] of String=('Сума за період', 'Сумма за период');
const  cn_NumDoc_Pay                 :array[1..2] of String=('Документ №', 'Документ №');
const  cn_DateDoc_Pay                :array[1..2] of String=('Дата докум.', 'Дата докум.');
const  cn_Summa_Pay                  :array[1..2] of String=('Сума', 'Сумма');
const  cn_Need_Pay                   :array[1..2] of String=('Треба сплатити:', 'Надо оплатить:');
const  cn_Was_Pay                    :array[1..2] of String=('Вже сплачено:', 'Уже оплачено:');
const  cn_PayPo_Pay                  :array[1..2] of String=('Сплачено по ', 'Оплачено по ');
const  cn_Now_Pay                    :array[1..2] of String=('До сплати на сьогодні', 'К оплате на сегодня:');
const  cn_Itogo_Pay                  :array[1..2] of String=('Разом', 'Итого');
const  cn_Zadolg_Pay                 :array[1..2] of String=('Заборгованість:', 'Задолженность:');
const  cn_Hint_Pay                   :array[1..2] of String=('Документи оплати не знайдено', 'Документы оплаты не найдены');
const  cn_Hint_CALC                  :array[1..2] of String=('Документи нарахувань не знайдено', 'Документы начислений не найдены');
const  cn_DateBorn                   :array[1..2] of String=('Дата народження: ', 'Дата рождения:');
const  cn_DSetRecordCount            :array[1..2] of String=('Кількість записів: ', 'Количество записей: ');
const  cn_FullPay                    :array[1..2] of String=('Cплачено повністю','Оплачено полностью');

const  cn_FullName                   :array[1..2] of String=('Повна назва', 'Полное название');
const  cn_ShortName                  :array[1..2] of String=('Скорочена назва', 'Краткое название');


const  cn_sp_ContractsList           :array[1..2] of String=('Довідник осіб, що навчаються за контрактом', 'Справочник обучающихся по договорам');
const  cn_OplataCaption              :array[1..2] of String=('Оплата контракту','Оплата контракта');
const  cn_ActionDates                :array[1..2] of String=('Період дії','Период действия');
const  cn_PayPeriod                  :array[1..2] of String=('Оплата за період','Оплата за период');
const  cn_SumCheck                   :array[1..2] of String=('Із зазначенням суми','С указанием суммы');
const  cn_NeedPay                    :array[1..2] of String=('Треба сплатити','Надо уплатить');
const  cn_WhosPay                    :array[1..2] of String=('Вже сплачено','Уже уплачено');
const  cn_Borg                       :array[1..2] of String=('Заборгованність','Задолженность');
const  cn_EnterSum                   :array[1..2] of String=('Сума, що вноситься','Вносимая сумма');
const  cn_Z                          :array[1..2] of String=('З','С');
const  cn_Po                         :array[1..2] of String=('По','По');

const  cn_View                       :array[1..2] of String=('Перегляд','Просмотр');
const  cn_Pay                        :array[1..2] of String=('Оплата','Оплата');

const  cn_Zaborgov                   :array[1..2] of String=('Заборгованність','Задолженность');
const  cn_Pereplata                  :array[1..2] of String=('Переплата','Переплата');

const  cn_Lgots_Sp                   :array[1..2] of String=('Пільги за договорами','Льготы по договорам');
const  cn_NomPrikaz                  :array[1..2] of String=('Номер наказу','Номер приказа');
const  cn_DatePrikaz                 :array[1..2] of String=('Дата наказу','Дата приказа');
const  cn_Osnovanie                  :array[1..2] of String=('Підстава','Основание');

const  cn_BegDate_Short              :array[1..2] of String=('Дата поч.','Дата нач.');
const  cn_EndDate_Short              :array[1..2] of String=('Дата закін.','Дата оконч.');
const  cn_RateAcc_Default            :array[1..2] of String=('Довідник розрахункових рахунків','Справочник расчетных счетов');
const  cn_RateAcc_Rate               :array[1..2] of String=('Розрахунковий рахунок','Расчетный счет');

const  cn_SearchCaption_Ex           :array[1..2] of String=('Розширений фільтр','Расширенный фильтр');
const  cn_Search_Ex                  :array[1..2] of String=('Шукати за','Искать по');
const  cn_TIN_Ex                     :array[1..2] of String=('ідентифікаційним податковим номером','идентификационному налоговому номеру');
const  cn_Need_TIN                   :array[1..2] of String=('Необхідно заповнити ідентифікаційний податковий номер!','Необходимо заполнить идентификационный налоговый номер!');
const  cn_Payer_Ex                   :array[1..2] of String=('платником','плательщику');

const  cn_Config                     :array[1..2] of String=('Конфігурація','Конфигурация');
const  cn_Tunning                    :array[1..2] of String=('Настройка...','Настройка...');
const  cn_Desctop                    :array[1..2] of String=('Робочий стіл','Рабочий стол');
const  cn_StartMenu                  :array[1..2] of String=('Меню "Пуск"','Меню "Пуск"');
const  cn_CreateIcons                :array[1..2] of String=('Помістити іконку на ...','Поместить иконку на ...');
const  cn_Icons                      :array[1..2] of String=('Іконки','Иконки');

const  cn_WhatsNew                   :array[1..2] of String=('Контракти: історія версій','Контракты: история версий');
const  cn_WhatsNew_Cap               :array[1..2] of String=('Що нового?','Что нового?');
const  cn_Exit                       :array[1..2] of String=('Вихід','Выход');
// DogDiss
const  cn_InfoDiss                   :array[1..2] of String=('Інформація про розірвання','Информация про расторжение');
const  cn_DateDiss                   :array[1..2] of String=('Дата розірвання','Дата расторжения');
const  cn_DateOrderDiss              :array[1..2] of String=('Дата наказу','Дата приказа');
const  cn_NumOrderDiss               :array[1..2] of String=('Номер наказу','Номер приказа');
const  cn_CommentDiss                :array[1..2] of String=('Коментарі','Комментарии');

const  cn_TypeLg_Label               :array[1..2] of String=('Тип пільги','Тип льготы');
const  cn_TypeDiss                   :array[1..2] of String=('Причина(тип розірвання)','Причина(тип расторжения)');
const  cn_sp_IniTypeDiss             :array[1..2] of String=('Довідник типів розірвання контракту','Справочник типов расторжения контракта');
const  cn_Confirm                    :array[1..2] of String=('Підтвердження','Подтверждения');
const  cn_Interface                  :array[1..2] of String=('Інтерфейс','Интерфейс');
const  cn_NoExitConfirm              :array[1..2] of String=('Не підтверджувати вихід','Не подтверждать выход');


const  cn_DateProv                   :array[1..2] of String=('Дата проводки','Дата проводки');
const  cn_ProvNote                   :array[1..2] of String=('Підстава','Основание');
const  cn_Pevdonim                   :array[1..2] of String=('Псевдонім','Псевдоним');
const  cn_Kr                         :array[1..2] of String=('Кредит','Кредит');
const  cn_Db                         :array[1..2] of String=('Дебет','Дебет');
const  cn_DogNumProv                 :array[1..2] of String=('Договір №','Договор №');
const  cn_Dodatki                    :array[1..2] of String=('Додаткові дії','Дополнительные действия');

const  cn_Cookies                     :array[1..2] of String=('Заповнити автоматично(взяти з історії)','Заполнить автоматически(взять из истории)');
const  cn_Language                    :array[1..2] of String=('Мова (потрібно перезавантаження програми)','Язык (необходима перезагрузка программы)');
const  cn_Rus_Lang                    :array[1..2] of String=('Російська','Русский');
const  cn_Ukr_Lang                    :array[1..2] of String=('Українська','Украинский');
const  cn_LangReload                  :array[1..2] of String=('Необхідно перезавантаження програми','Чтобы изменения вступили в силу необходим перезапуск программы');
const  cn_Baloon                      :array[1..2] of String=('Підказка','Подсказка');
const  cn_Welcome                     :array[1..2] of String=('Система "Контракти" бажає Вам приємної роботи... ','Система "Контракты" желает Вам приятной работы...');

const  cn_PreyskurantWork             :array[1..2] of String=('Робота з прейскурантом','Работа с прейскурантом');
const  cn_FizLizoEdit                 :array[1..2] of String=('Редагувати дані фіз.особи','Редактировать данные физ.лица');

// Tree
const  cn_tree_FullOpen               :array[1..2] of String=('Розкрити дерево цілком','Раскрыть дерево целиком');
const  cn_tree_FullClose              :array[1..2] of String=('Згорнути дерево цілком','Свернуть дерево целиком');
const  cn_tree_BranchOpen             :array[1..2] of String=('Розкрити гілку','Раскрыть ветвь');
const  cn_tree_BranchClose            :array[1..2] of String=('Згорнути гілку','Свернуть ветвь');
const  cn_tree_FullScreen             :array[1..2] of String=('Повний екран','Полный экран');

const  cn_Preved                      :array[1..2] of String=('Не показувати вітання при завантаженні ','Не показывать приветствие при загрузке');
const  cn_PrevedSelf                  :array[1..2] of String=('введіть сюди всій варіант привітання чи нагадування','введите сюда свой вариант приветствия или напоминания');
const  cn_PrevedHint                  :array[1..2] of String=('для системної інформації залиште поле пустим','для системной информации оставьте поле пустым');

const  cn_PayerSelect                 :array[1..2] of String=('Вибір платника за договором','Выбор плательщика по договору');

// preyskurant
const  cn_Spec_Kod                    :array[1..2] of String=('Код спеціальності','Код специальности');

const  cn_ViewPrice_Hint              :array[1..2] of String=('Показати актуальну версію','Показать актуальную версию');
const  cn_grid_VerName                :array[1..2] of String=('Назва версії прейскуранта','Название версии прейскуранта');
const  cn_showVerssions               :array[1..2] of String=('Показувати версії','Показывать версии');
const  cn_AddVerssion                 :array[1..2] of String=('Додати версію','Добавить версию');
const  cn_Preyskurant                 :array[1..2] of String=('Прейскурант...','Прейскурант...');
const  cn_PreyskurantHint             :array[1..2] of String=('Вибрати дані з прейскуранту','Выбрать данные из прейскуранта');

const  cn_roles_Kod                   :array[1..2] of String=('Код','Код');
const  cn_roles_Group                 :array[1..2] of String=('Групи користувачів','Группы пользователей');
const  cn_roles_Smets                 :array[1..2] of String=('Кошториси','Сметы');

const  cn_AcademYear                  :array[1..2] of String=('Академ. рік','Академ. год');
const  cn_StudInfWarning              :array[1..2] of String=('Інформація про осіб, що навчаються заповнена лише частково. Уважно перевірте дані!','Информация про обучающихся заполнена лишь частично. Внимательно проверьте данные!');

const  cn_Service                     :array[1..2] of String=('Служби','Службы');
const  cn_VC_Import                   :array[1..2] of String=('Імпорт контрактів','Импорт контрактов');
const  cn_VC_ClearBuffer              :array[1..2] of String=('Очистити буфер','Очистить буфер');
const  cn_VC_AllBuffer                :array[1..2] of String=('Буфер цілком','Буфер целиком');
const  cn_VC_BufferCaption            :array[1..2] of String=('DBF-буфер','DBF-буфер');
const  cn_VCBuffer_or_Not             :array[1..2] of String=('Додати з буферу чи вручну?','Добавить из буфера или вручную?');

const  cn_Log                         :array[1..2] of String=('Лог-історія роботи з контрактом','Лог-история работы с контрактом');
const  cn_User                        :array[1..2] of String=('Користувач','Пользователь');
const  cn_Action                      :array[1..2] of String=('Дія','Действие');
const  cn_Stamp                       :array[1..2] of String=('Дата\Час','Дата\Время');

const  cn_Use_Beg                     :array[1..2] of String=('Нач. дії','Нач. действ.');
const  cn_Use_End                     :array[1..2] of String=('Кінець дії','Оконч. действ.');

const  cn_RaxynokNaSplaty             :array[1..2] of String=('Рахунок на сплату договору №','Счет на оплату обучения №');
const  cn_SymaPaxynky                 :array[1..2] of String=('Сума рахунку','Сумма счета');
const  cn_NDS                         :array[1..2] of String=('ПДВ','НДС');
const  cn_PazomZNDS                   :array[1..2] of String=('Разом з ПДВ','Итого с НДС');
const  cn_RaxynokNaSplatyCaption      :array[1..2] of String=('Виписка рахунку на сплату навчання','Выписка счета на оплату обучения');
const  cn_Vid                         :array[1..2] of String=('від','от');

const  cn_SysOptions                  :array[1..2] of String=('Системні параметри','Системные параметры');
const  cn_Signature                   :array[1..2] of String=('Підпис','Подпись');
const  cn_Signature_off               :array[1..2] of String=('Зняти підпис','Снять подпись');
const  cn_Signature_on                :array[1..2] of String=('Поставити підпис','Поставить подпись');
const  cn_TransferToNextCurs          :array[1..2] of String=('Переведення на наст. курс','Перевод на след. курс');

const  cn_ForEach                     :array[1..2] of String=('Підтвердження для кожного студенту','Подтверждение для каждого студента');
const  cn_AvtoRastorg                 :array[1..2] of String=('Автоматично розривати контракти','Автоматически расторгать контракты');
const  cn_ParamsOtbor                 :array[1..2] of String=('Установка параметрів відбору','Установка параметров отбора');
const  cn_Params                      :array[1..2] of String=('Параметри','Параметры');
const  cn_CurrentTaskPercent          :array[1..2] of String=('Відсоток виконання','Процент выполнения');
const  cn_Admit                       :array[1..2] of String=('Пропустити','Пропустить');
const  cn_Admit_All                   :array[1..2] of String=('Пропустити усі','Пропустить все');
const  cn_NewPeriod                   :array[1..2] of String=('Новий період навчання','Новый период обучения');

const  cn_Role                        :array[1..2] of String=('Група','Группа');

const  cn_AllForAdmin                 :array[1..2] of String=('Адміну доступно усе!','Админу доступнно всё!');
const  cn_DotypSmetiTitle             :array[1..2] of String=('Доступні кошториси','Доступные сметы');

const  cn_NextCursAvto                :array[1..2] of String=('Додати наступний курс автоматично','Добавить следующий курс автоматично');

const  cn_RahunokWork                 :array[1..2] of String=('Робота з рахунками','Работа со счетами');

const  cn_Relation                    :array[1..2] of String=('Зв''язок','Связь');
const  cn_RelDepartment               :array[1..2] of String=('Зв''язок з підрозділом','Связь с подразделением');
const  cn_NoRelDepartment             :array[1..2] of String=('Зв''язку з підрозділом не знайдено','Связь с подразделением не определена');
const  cn_DepGrName                   :array[1..2] of String=('Група у підрозділі','Группа в подразделении');
const  cn_NameExec                    :array[1..2] of String=('Посада відповідального','Должность ответственного');
const  cn_Dekan                       :array[1..2] of String=('ПІБ відповідального','ФИО ответственного');
const  cn_SearchAll                   :array[1..2] of String=('Усі','Все');
const  cn_Write                       :array[1..2] of String=('Запис','Запись');

const  cn_Sort                        :array[1..2] of String=('Сортування','Сортировка');

const  cn_Success                     :array[1..2] of String=('Успішно!','Успешно!');
const  cn_WasFullWork                 :array[1..2] of String=('Оброблено усього: ','Обработано всего: ');
const  cn_WasBreak                    :array[1..2] of String=('Розірвано: ','Расторгнуто: ');
const  cn_WasTransfer                 :array[1..2] of String=('Переведено на наступний курс: ','Переведено на следующий курс: ');
const  cn_WasAdmit                    :array[1..2] of String=('Пропущено: ','Пропущено: ');

const  cn_Add_List                    :array[1..2] of String=('Додати зписок','Добавить список');
const  cn_Status                      :array[1..2] of String=('Статус','Статус');
const  cn_Type                        :array[1..2] of String=('Тип','Тип');
const  cn_DateCalc                    :array[1..2] of String=('Дата розрахунку','Дата расчета');
const  cn_RaportAvto                  :array[1..2] of String=('Додати автоматично на дату розрахунку','Добавить автоматически на дату расчета');
const  cn_RaportAvtoComments          :array[1..2] of String=('Автоматичне додавання усіх контрактів, які мають заборгованність на дату розрахунку ','Автоматическое добавление всех контрактов, которые имеют задолженность на дату расчета');

const  cn_Lgota                       :array[1..2] of String=('Пільга:','Льгота:');
const  cn_OnovnieTypeDoc              :array[1..2] of String=('Основні','Основные');
const  cn_DodatkovTypeDoc             :array[1..2] of String=('Додаткові','Дополнительные');

const  cn_Recovery                    :array[1..2] of String=('Відновлення','Восстановление');
const  cn_grid_Actual                 :array[1..2] of String=('Актуальність','Актуальность');
const  cn_price_already_signed        :array[1..2] of String=('Прейскурант вже підписаний.','Прейскурант уже подписан.');

const  fr_Reports_CALC_NameREP0       :array[1..2] of String=('Розрахунок на','Расчет на');
const  fr_Reports_CALC_NameREP        :array[1..2] of String=('Довідка №','Справка №');
const  fr_Reports_CALC_NameREP1       :array[1..2] of String=('про стан виконання договору за навчання','о состоянии выполнения договора за обучение');
const  fr_Reports_CALC_NameREP2       :array[1..2] of String=('Договір №','Договор №');
const  fr_Reports_CALC_NameStuder     :array[1..2] of String=('Особа, що навчається','Обучаемый');

const  fr_Reports_CALC_Beg            :array[1..2] of String=('Початок періоду','Начало периода');
const  fr_Reports_CALC_End            :array[1..2] of String=('Кінець періоду','Конец периода');
const  fr_Reports_CALC_Stoimost       :array[1..2] of String=('Вартість навч.','Стоимость обуч.');
const  fr_Reports_CALC_SummaLg        :array[1..2] of String=('Сумова пільга','Суммовая льгота');
const  fr_Reports_CALC_PersentLg      :array[1..2] of String=('Відсоток пільги, %','Процент льготы, %');
const  fr_Reports_CALC_DolgBeg        :array[1..2] of String=('Борг на початок','Долг на начало');
const  fr_Reports_CALC_AllPeriod      :array[1..2] of String=('Сума за період','Сумма за период');
const  fr_Reports_CALC_SumPay         :array[1..2] of String=('Сума, що надійшла','Поступившая сумма');
const  fr_Reports_CALC_DolgEnd        :array[1..2] of String=('Борг на кінець','Долг на конец');

const  fr_Reports_CALC_SumDolg        :array[1..2] of String=('Сума до сплати','Сумма к оплате');
const  fr_Reports_CALC_WhasPay         :array[1..2] of String=('Вже сплачено','Уже уплачено');

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

const  cn_Execution                   :array[1..2] of String=('Виконати','Выполнить');

const  frVikonannya_Btn               :array[1..2] of String=('Аналітичний звіт, виконання договорів за навчання',
                                                              'Аналитический свод, выполнение договоров по обучению');

const  cn_Orders                      :array[1..2] of String=('Накази','Приказы');

const  cn_OrderType                   :array[1..2] of String=('Тип наказу','Тип приказа');
const  cn_NumOrd                      :array[1..2] of String=('Номер','Номер');
const  cn_DateOrd                     :array[1..2] of String=('Дата','Дата');
const  cn_Zvit                        :array[1..2] of String=('Звіт','Отчет');
const  cn_TagOrder                    :array[1..2] of String=('Пріоритет','Приоритет');

const  cn_IsVisibleReestr             :array[1..2] of String=('Видимий у реєстрі','Видимый в реестре');
const  cn_IsVisibleOplata             :array[1..2] of String=('Видимий у сплаті','Видимый в оплате');
const  cn_IsVisibleReestrShort        :array[1..2] of String=('У реєстрі','В реестре');
const  cn_IsVisibleOplataShort        :array[1..2] of String=('У сплаті','В оплате');

const  cn_BasicContract               :array[1..2] of String=('Основний','Основной');

const  cn_ContractPrint               :array[1..2] of String=('Друк контракту','Печать контракта');
const  cn_Day                         :array[1..2] of String=('День','День');
const  cn_Month                       :array[1..2] of String=('Місяць','Месяц');
const  cn_Full_Name                   :array[1..2] of String=('Повне найменування','Полное наименование');
const  cn_CopyPrintCount              :array[1..2] of String=('Кіль-сть копій для друку','Кол-во копий для печати');

const  cn_OsosbaCustomer              :array[1..2] of String=('Особа, яка уклала контракт','Лицо, заключившее контракт');
const  cn_DeletedShow                 :array[1..2] of String=('Видалені контракти','Удаленные контракты');
const  cn_DeletedMode                 :array[1..2] of String=('Режим перегляду видалених контрактів','Режим просмотра удаленных контрактов');
const  cn_ExportData                  :array[1..2] of String=('Експорт даних контракту','Экспорт данных контракта');

const  cn_KillAll                     :array[1..2] of String=('Видалити усі','Удалить все');
const  cn_KillOnlyOne                 :array[1..2] of String=('Видалити за фільтром','Удалить по фильтру');

const  cn_TwainShort                  :array[1..2] of String=('Скан','Скан');
const  cn_Twain                       :array[1..2] of String=('Сканування','Сканування');
const  cn_CreditNote                  :array[1..2] of String=('Заголовок звіту','Заголовок отчета');
const  cn_CreditBank                  :array[1..2] of String=('Керуючий банком','Управляющий банком');
const  cn_LimitSum                    :array[1..2] of String=('Межа суми кредиту','Предел суммы кредита');
const  cn_LimitDogs                   :array[1..2] of String=('Межа к-сті контрактів','Предел кол-ва контрактов');
const  cn_CreditImage                 :array[1..2] of String=('Тільки з образами','Только с образами');
const  cn_Reestr                      :array[1..2] of String=('Реєстр','Реестр');
const  cn_Image                       :array[1..2] of String=('Образи','Образы');
const  cn_DogSum                      :array[1..2] of String=('Сума договору','Сумма договора');
const  cn_PrintRangeImage             :array[1..2] of String=('Друк діапазону образів...','Печать диапазона образов...');
const  cn_Main_SpCreditStatus         :array[1..2] of String=('Довідник статусів кредиту','Справочник статусов кредита');

const  cn_PrintAllPages               :array[1..2] of String=('Усі сторінки','Все страницы');
const  cn_PrintChetPages              :array[1..2] of String=('Парні сторінки','Четные страницы');
const  cn_PrintNeChetPages            :array[1..2] of String=('Непарні сторінки','Нечетные страницы');

const  cn_btnSeparate                 :array[1..2] of String=('Роз''єднання','Разделение');
const  cn_btnUnion                    :array[1..2] of String=('Об''єднання','Объединение');

const  cn_CopyPrice                   :array[1..2] of String=('Копіювати','Копировать');

const  cn_ImportDbf                   :array[1..2] of String=('Імпорт з DBF','Импорт из DBF');
const  cn_ImportAdd                   :array[1..2] of String=('Обробити','Обработать');
const  cn_ImportAddAll                :array[1..2] of String=('Обробити всі','Обработать все');
const  cn_is_Def                      :array[1..2] of String=('За замовчуванням','По умолчанию');

{
const  cn_                           :array[1..2] of String=('','');
const  cn_                           :array[1..2] of String=('','');
const  cn_                           :array[1..2] of String=('','');
const  cn_                           :array[1..2] of String=('','');
}

//-----------------------------REG----------------------------------------------
const cn_Can_not_delete              :array[1..2] of String=('Реєстр підписаний і не може бути видалений!','Реестр подписан и не может быть удален!');
//-----------------------------Message------------------------------------------
const cn_msg_WARNING              :array[1..2] of String=('Попередження','Предупреждение');
const cn_msg_INFO                 :array[1..2] of String=('Інформація','Информация');

implementation

end.
