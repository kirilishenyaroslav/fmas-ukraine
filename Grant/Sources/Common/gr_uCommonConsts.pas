unit gr_uCommonConsts;

interface

//******************************************************************************
//
//Заголовки форм
const Application_Caption          :array[1..2] of string = ('Стипендія','Стипендия');
const Access_Caption               :array[1..2] of string = ('Вхід','Вход');
const Exit_Caption                 :array[1..2] of string = ('Вихід','Выход');
const Add_Group                    :array[1..2] of string = ('Додати групу','Добавить группу');
const Delete_Group                 :array[1..2] of string = ('Видалити групу','Удалить групу');
const Add_Paiment                  :array[1..2] of string = ('Додати виплати','Добавить выплаты');
const DataStud_Caption             :array[1..2] of string = ('Дані студентів','Данные студентов');
const InformatData_Text            :array[1..2] of string = ('Довідка','Справка');
const Spisok_Text                  :array[1..2] of string = ('Список','Список');
const Group_Caption                :array[1..2] of string = ('Група','Группа');
const Sheets_Text                  :array[1..2] of string = ('Відомості','Ведомости');
const Data_Text                    :array[1..2] of string = ('Дані','Данные');
const CurrentOperationsData_Text   :array[1..2] of string = ('Дані поточних операцій','Данные текущих выплат');
const Service_Text                 :array[1..2] of string = ('Сервіс','Сервис');
const Sprav_Text                   :array[1..2] of string = ('Довідники','Справочники');
const Nalogi_Text                  :array[1..2] of string = ('Податки','Налоги');
const ViewUsers_Text               :array[1..2] of string = ('Показати юзерів','Показать юзеров');
const ViewErrors_Text              :array[1..2] of string = ('Показати помилки','Показать ошибки');
const People_Text                  :array[1..2] of string = ('Фізичні особи','Физические лица');
const VidOpl_Text                  :array[1..2] of string = ('Види операцій','Виды операций');
const Departments_Text             :array[1..2] of string = ('Групи','Группы');
const TypePayment_Text             :array[1..2] of string = ('Види виплат','Виды выплат');
const Information_Text             :array[1..2] of string = ('Інформація','Информация');
const LastPeriodData_Text          :array[1..2] of string = ('Дані минулих періодів','Данные прошедших периодов');
const UchVed_Text                  :array[1..2] of string = ('Ведення відомостей','Ведение ведомостей');
const PeriodVed_Text               :array[1..2] of string = ('Відомості поточного періоду','Ведомости текущего периода');
const ReeVed_Text                  :array[1..2] of string = ('Реєстри відомостей','Реестры ведомостей');
const LocateAndFilter_Text         :array[1..2] of string = ('Фільтр та пошук відомостей','Фильтр и поиск ведомостей');
const Work_Text                    :array[1..2] of string = ('Робота','Работа');
const Current_Text                 :array[1..2] of string = ('Поточні виплати','Текущие выплаты');
const QuickCount_Text              :array[1..2] of string = ('Терміновий розрахунок','Срочный расчет');
const AllCount_Text                :array[1..2] of string = ('Розрахунок','Расчет');
const Recount_Text                 :array[1..2] of string = ('Перерахунок','Пересчет');
const ViewVedData_Text             :array[1..2] of string = ('Дані відомостей','Данные ведомостей');
const ViewAccData_Text             :array[1..2] of string = ('Дані розрахунку','Данные расчета');
const ViewRecData_Text             :array[1..2] of string = ('Дані перерахунку','Данные пересчета');
const OperationEnd_Text            :array[1..2] of string = ('Закінчення операції','Окончание операции');
const Windows_Text                 :array[1..2] of string = ('Вікна','Окна');
const Cascade_Text                 :array[1..2] of string = ('Каскадом','Каскадом');
const TileGor_Text                 :array[1..2] of string = ('Горизонтально','Горизонтально');
const TileVer_Text                 :array[1..2] of string = ('Вертикально','Вертикально');
const Minimize_Text                :array[1..2] of string = ('Мінімізувати','Свернуть');
const Maximize_Text                :array[1..2] of string = ('Максимізувати','Развернуть');
const Normalize_Text               :array[1..2] of string = ('Нормалізувати','Нормализовать');
const CloseAll_Text                :array[1..2] of string = ('Закрити всі','Закрыть все');
const Filter_Text                  :array[1..2] of string = ('Фільтр','Фильтр');
const NotFilter_Text               :array[1..2] of string = ('Без фільтру','Без фильтра');
const SumMoreNull_Text             :array[1..2] of string = ('Сума>0','Сумма>0');
const SumLessNull_Text             :array[1..2] of string = ('Сума<0','Сумма<0');
const SumEqualsNull_Text           :array[1..2] of string = ('Сума=0','Сумма=0');
const SumIsNull_Text               :array[1..2] of string = ('Сума - пусте значення','Сумма - пустое значение');
const CountContinue_Text           :array[1..2] of string = ('Йде розрахунок','Идёт расчёт');
const PrepareDataContinue_Text     :array[1..2] of string = ('Йде підготовка данних','Идёт подготовка данных');
const FormSheetsContinue_Text      :array[1..2] of string = ('Йде формування відомостей','Идёт формирование ведомостей');
const AccDepart_Text               :array[1..2] of string = ('Розширений фільтр','Расширенный фильтр');
const GrantRise_Text               :array[1..2] of string = ('Підвищення','Повышения');
const GrantIndexation_Text         :array[1..2] of string = ('Індексація','Индексация');
const StudentCards_Caption         :array[1..2] of string = ('Довідник студентів','Справочник студентов');
const SelAll_Caption               :array[1..2] of string = ('Обрати всі','Выбрать все');
// Заголовки кнопок

const DeletePayment_Caption        :array[1..2] of string = ('Видалити виплати','Удалить выплаты');
const UpdateRecBtn_Caption         :array[1..2] of string = ('Редагувати виплати','Ред. доб. выплаты');
const ApplyBtn_Caption             :array[1..2] of string = ('Прийняти','Применить');
const InsertBtn_Caption            :array[1..2] of string = ('Додати','Добавить');
const CorrentBtn_Caption           :array[1..2] of string = ('Додати поточні виплати','Добавить поточные выплаты');
const GrantBtn_Caption             :array[1..2] of string = ('Додати стипендію','Добавить стипендию');
const UpdateBtn_Caption            :array[1..2] of string = ('Редагувати','Изменить');
const DeleteBtn_Caption            :array[1..2] of string = ('Видалити','Удалить');
const DelAllBtn_Caption            :array[1..2] of string = ('Видалити усе','Удалить всё');
const DetailBtn_Caption            :array[1..2] of string = ('Перегляд','Просмотр');
const AddManBtn_Caption            :array[1..2] of string = ('Додати особу','Добавить человека');
const Man_Caption                  :array[1..2] of string = ('Фізична особа','Физическое лицо');
const RefreshBtn_Caption           :array[1..2] of string = ('Поновити','Обновить');
const ExitBtn_Caption              :array[1..2] of string = ('Вийти','Выход');
const YesBtn_Caption               :array[1..2] of string = ('Прийняти','Принять');
const CancelBtn_Caption            :array[1..2] of string = ('Відмінити','Отменить');
const FilterBtn_Caption            :array[1..2] of string = ('Фільтр','Фильтр');
const LocateBtn_Caption            :array[1..2] of string = ('Шукати','Искать');
const LocateNextBtn_Caption        :array[1..2] of string = ('Далі','Дальше');
const PrintBtn_Caption             :array[1..2] of string = ('Друк','Печать');
const SelectBtn_Caption            :array[1..2] of string = ('Обрати','Выбрать');
const ClearBtn_Caption             :array[1..2] of string = ('Очистити','Очистить');
const DoCountBtn_Caption           :array[1..2] of string = ('Розрахувати','Посчитать');
const InverseBtn_Caption           :array[1..2] of string = ('Інвертувати','Инвертировать');
const SnBtn_Caption                :array[1..2] of string = ('Зняти всі','Снять все');
const WhatsNewBtn_Caption          :array[1..2] of string = ('Що нового','Что нового');
const PrintSubItemSvods_Caption    :array[1..2] of string = ('Звіти','Отчеты');
const PrintSvodBySch_Caption       :array[1..2] of string = ('Звіт за рахунком','Отчеты по счетам');
const PrintReeAlimony_Caption      :array[1..2] of string = ('Реєстр аліментників','Реестр алиментников');
const PrintReeDolg_Caption         :array[1..2] of string = ('Реєстр боргів','Реестр долгов');
const PrintSvodVed_Caption         :array[1..2] of string = ('Зведена відомість','Сводная ведомость');
const PrintVedByFilter_Caption     :array[1..2] of string = ('Звіт за фільтром','Отчет по фильтру');
const PrintSpDohSubs_Caption       :array[1..2] of string = ('Довідка про доходи(субсидія)','Справка о доходах(субсидия)');
const PrintSpDoh_Caption           :array[1..2] of string = ('Довідка про доходи','Справка о доходах');
const Indexation_Caption           :array[1..2] of string = ('Індексація','Индексация');
const MenuPrint_Caption            :array[1..2] of string = ('Друк','Печать');
const RecDeleteBtn_Caption         :array[1..2] of string = ('Видалити з розрахунку','Удалить из пересчета');
const RecDeleteAllBtn_Caption      :array[1..2] of string = ('Видалити усіх','Удалить всех');
const PrintVedByMonth_Caption      :array[1..2] of string = ('Відомість за місяцем','Ведомость по месяцу');
const InsertAll_Caption            :array[1..2] of string = ('Додати усіх','Добавить всех');
//******************************************************************************
const LabelShifr_Caption           :array[1..2] of string = ('Шифр','Шифр');
const LabelFirm_Caption            :array[1..2] of string = ('Підприємство','Предприятие');
const LabelStudent_Caption         :array[1..2] of string = ('Студент','Студент');
const LabelProgress_Caption        :array[1..2] of string = ('Прогрес','Прогресс');
const LabelFormSheet_Caption       :array[1..2] of string = ('Формувати відомості','Формировать ведомости');
const LabelStudentMoving_Caption   :array[1..2] of string = ('Навчання','Навчання');
const LabelVidOpl_Caption          :array[1..2] of string = ('Вид операції','Вид операции');
const LabelDepartment_Caption      :array[1..2] of string = ('Група','Группа');
const LabelKodDepartment_Caption   :array[1..2] of string = ('Код групи','Код группы');
const LabelNameDepartment_Caption  :array[1..2] of string = ('Назва групи','Название группы');
const LabelSmeta_Caption           :array[1..2] of string = ('Кошторис','Смета');
const LabelTypeSheet_Caption       :array[1..2] of string = ('Тип відомості','Тип ведомости');
const LabelCategory_Caption        :array[1..2] of string = ('Категорія','Категория');
const LabelPost_Caption            :array[1..2] of string = ('Посада','Посада');
const LabelPeriod_Caption          :array[1..2] of string = ('Період','Период');
const LabelPrikaz_Caption          :array[1..2] of string = ('Наказ','Приказ');
const LabelSumma_Caption           :array[1..2] of string = ('Сума','Сумма');
const LabelMin_Caption             :array[1..2] of string = ('Мінімум','Минимум');
const LabelMax_Caption             :array[1..2] of string = ('Максімум','Максимум');
const LabelPercent_Caption         :array[1..2] of string = ('Відсоток','Процент');
const LabelWaitData_Caption        :array[1..2] of string = ('Зачекайте, йде відбір даних!','Подождите, идет отбор данных!');
const LabelDateBeg_Caption         :array[1..2] of string = ('Початок','Начало');
const LabelDateEnd_Caption         :array[1..2] of string = ('Закінчення','Окончание');
const LabelKod_Caption             :array[1..2] of string = ('Код','Код');
const LabelTin_Caption             :array[1..2] of string = ('Ідентифікаційний номер','Идентификационный номер');
const LabelFIO_Caption             :array[1..2] of string = ('П.І.Б.','Ф.И.О.');
const LabelName_Caption            :array[1..2] of string = ('Назва','Название');
const LabelNameShort_Caption       :array[1..2] of string = ('Скорочена назва','Сокращенное название');
const LabelNameFull_Caption        :array[1..2] of string = ('Повна назва','Полное название');
const LabelMonth_Caption           :array[1..2] of string = ('Місяць','Месяц');
const LabelYear_Caption            :array[1..2] of string = ('Рік','Год');
const LabelHours_Caption           :array[1..2] of string = ('Години','Часы');
const LabelDays_Caption            :array[1..2] of string = ('Дні','Дни');
const LabelNotFilter_Caption       :array[1..2] of string = ('Без фільтра','Без фильтра');
const LabelKvartal_Caption         :array[1..2] of string = ('Квартал','Квартал');
const LabelPachka_Caption          :array[1..2] of string = ('Пачка','Пачка');
const LabelNote_Caption            :array[1..2] of string = ('Примітка','Примечание');
const LabelKurs_Caption            :array[1..2] of string = ('Курс','Курс');
const LabelDocument_Caption        :array[1..2] of string = ('Документ','Документ');
const LabelSendPeople_Caption      :array[1..2] of string = ('Адресат','Адресат');
const LabelSendAdress_Caption      :array[1..2] of string = ('Адреса','Адреса');
const LabelBal_Caption             :array[1..2] of string = ('Середній бал','Средний балл');
const LabelShowContracts_Caption   :array[1..2] of string = ('Показувати контрактників','Показывать контрактников');
const LabelContracts_Caption       :array[1..2] of string = ('Контракт','Контракт');
const LabelButgets_Caption         :array[1..2] of string = ('Бюджет','Бюджет');
const LabelAcctCard_Caption        :array[1..2] of string = ('Картковий рахунок','Карточный счет');
const LabelTypePayment_Caption     :array[1..2] of string = ('Тип виплати','Тип выплаты');
const LabelMonthFinish_Caption     :array[1..2] of string = ('Кінець місяця','Конец месяца');
const LabelOperationsFilter_Caption:array[1..2] of string = ('Фільтрувати операції','Фильтровать операции');
const LabelIndexMinim_Caption      :array[1..2] of string = ('Прожітковий мінімум','Прожиточный минимум');
const LabelIndexPercent_Caption    :array[1..2] of string = ('Відсоток','Процент');
const VidTraining_Caption          :array[1..2] of string = ('Вид навчання','Вид обучения');
const BasePeriod_Caption           :array[1..2] of string = ('Базовий період','Базовый период');

const MonthesList_Text             :array[1..2] of string = ('Січень'+#13+'Лютий'+#13+'Березень'+#13+
                                                             'Квітень'+#13+'Травень'+#13+'Червень'+#13+
                                                             'Липень'+#13+'Серпень'+#13+'Вересень'+#13+
                                                             'Жовтень'+#13+'Листопад'+#13+'Грудень',
                                                             'Январь'+#13+'Февраль'+#13+'Март'+#13+
                                                             'Апрель'+#13+'Май'+#13+'Июнь'+#13+
                                                             'Июль'+#13+'Август'+#13+'Сентябрь'+#13+
                                                             'Октябрь'+#13+'Ноябрь'+#13+'Декабрь');
const ToBuffer_Caption             :array[1..2] of string = ('Занести до буфера','Копировать в буфер');
//******************************************************************************
const Caption_Insert               :array[1..2] of string = ('Додавання запису','Добавление записи');
const Caption_Update               :array[1..2] of string = ('Редагування запису','Изменение записи');
const Caption_Delete               :array[1..2] of string = ('Вилучення запису','Удаление записи');
const Caption_Detail               :array[1..2] of string = ('Перегляд запису','Просмотр записи');

const DeleteRecordQuestion_Text    :array[1..2] of string = ('Ви дійсно бажаєте'+#13+'вилучити обраний запис?',
                                                             'Вы действительно хотите'+#13+'удалить выбранную запись?');
const DeleteRecordQuestion_Text_Mas:array[1..2] of string = ('Ви дійсно бажаєте'+#13+'вилучити усі обрані записи?',
                                                             'Вы действительно хотите'+#13+'удалить все выбранные записи?');                                                             
const DelAllRecordsQuestion_Text   :array[1..2] of string = ('Ви дійсно бажаєте'+#13+'вилучити усі записи?',
                                                             'Вы дейтсвительно хотите'+#13+'удалить все запись?');
//******************************************************************************
// Вопросы
const Q_DoYouWantExit_Text         :array[1..2] of string = ('Ви дійсно бажаєте вийти?','Вы действительно хотите выйти?');

//******************************************************************************
//Labels
const UserLabel_Caption            :array[1..2] of string = ('Користувач','Пользователь');
const LoginLabel_Caption           :array[1..2] of string = ('Пароль','Пароль');
const SystemLabel_Caption          :array[1..2] of string = ('Автоматизована'+#13+'підсистема розрахунка'+#13+'стипендії','Автоматизированная'+#13+'система расчета'+#13+'стипендии');
const RightsLabel_Caption          :array[1..2] of string = ('Права на даний продукт захищені українським та міжнародним законодавством. Усі права належать ДонНУ.',
                                                             'Права на данный продукт защищиены украинским и международним законодательстов. Все права принадлежат ДонНУ.');
const VersionLabel_Caption         :array[1..2] of String = ('Версія: ','Версия: ');

//******************************************************************************
const Yes_Text                     :array[1..2] of String = ('Так','Да ');
const No_Text                      :array[1..2] of String = ('Ні ','Нет');
const Contract_Text                :array[1..2] of String = ('Контракт ','Контракт');
const Budget_Text                  :array[1..2] of String = ('Бюджет ','Бюджет');
const Foundation_Text              :array[1..2] of String = ('Основа','Основание');
const GrantData_Text               :array[1..2] of String = ('Дані стипендіальних виплат','Данные стипендиальных выплат');
const AlimonyData_Text             :array[1..2] of String = ('Дані про аліменти','Данные про алименты');
const Grant_Text                   :array[1..2] of String = ('Стипендія','Стипендия');
const Terms_Text                   :array[1..2] of String = ('Періоди навчання','Сроки обучения');
const Summary_Text                 :array[1..2] of String = ('Всього','Всего');
const Vacation_Text                 :array[1..2] of String = ('Відпустка','Отпуск');

//******************************************************************************
//Ошибки
const ECaption                     :array[1..2] of string = ('Помилка','Ошибка');
const ELoadBplText                 :array[1..2] of string = ('Не можливо завантажити пакет','Невозможно загрузить пакет');
const ENotAccess                   :array[1..2] of string = ('Ви не маєте прав доступа до цієї системи!','У вас нет прав для входа в систему!');
const EOpenConfigText              :array[1..2] of string = ('Не можливо підключитися до файлу параметрів!','Не возможно подключиться с файлу настроек!');
const EOpenDBText                  :array[1..2] of string = ('Не можливо з''єднатися з базою даних!','Не возможно соединиться с базой данных!');
const EDateNullText                :array[1..2] of string = ('Не можна не задати дату!','Дата не может быть не заданной!');
const EInputKodSetups_Text         :array[1..2] of string = ('Період початку має'+#13+'бути меншим за період закінчення!',
                                                             'Период начал должен'+#13+'быть меньше периода окончания!');
const EInputTerms_Text             :array[1..2] of string = ('Початок терміна дії має'+#13+'бути меншим за закінчення!',
                                                             'Дата началя срока действия должна'+#13+'быть меньше даты окончания!');
const EnotInputData_Text           :array[1..2] of string = ('Не введено дані!',
                                                             'Не ведены данные!');
const EManInput_Text               :array[1..2] of string = ('Не обрано фізичну особу','Не выбрано физическое лицо');
const EMonthInput_Text             :array[1..2] of string = ('Не обрано місяць','Не выбран месяц');
const EYearInput_Text              :array[1..2] of string = ('Помилка вводу року','Ошибка ввода года');
const ESummaInput_Text             :array[1..2] of string = ('Не введено суму','Не введена сумма');
const ECategoryInput_Text          :array[1..2] of string = ('Не обрано категорію','Не выбрана категория');
const EVidOplInput_Text            :array[1..2] of string = ('Не обрано вид операції','Не выбран вид оплаты');
const EDepartmentInput_Text        :array[1..2] of string = ('Не обрано групу','Не выбрано группу');
const EPostInput_Text              :array[1..2] of string = ('Не обрано посаду','Не выбрана должность');
const ESmetaInput_Text             :array[1..2] of string = ('Не обрано кошторис','Не выбрана смета');
const EStudentMovingNotSelect_Text :array[1..2] of string = ('Не обрано термін навчання','Не выбран срок обученя');
const EVidTraining_Text            :array[1..2] of string = ('Не обран вид навчання','Не выбран вид обучения');

//******************************************************************************

//******************************************************************************
//Столбцы гридов
const GridClTn_Caption             :array[1..2] of string = ('Т.н.','Т.н.');
const GridClTin_Caption            :array[1..2] of string = ('Ід. код','Ид. код');
const GridClContract_Caption       :array[1..2] of string = ('Контракт','Контракт');
const GridClFIO_Caption            :array[1..2] of string = ('П.І.Б.','Ф.И.О.');
const GridClCategory_Caption       :array[1..2] of string = ('Категорія','Категория');
const GridClKurs_Caption           :array[1..2] of string = ('Курс','Курс');
const GridClViplata_Caption        :array[1..2] of string = ('Сплачено','Выплата');
const GridClDeponir_Caption        :array[1..2] of string = ('Депоновано','Депонент');
const GridClRaznoe_Caption         :array[1..2] of string = ('Різне','Разное');
const GridClKod_Caption            :array[1..2] of string = ('Код','Код');
const GridClBirthDate_Caption      :array[1..2] of string = ('Дата народження','Дата рождения');
const GridClDateBeg_Caption        :array[1..2] of string = ('Початок','Начало');
const GridClDateEnd_Caption        :array[1..2] of string = ('Закінчення','Окончание');
const GridClDateAcc_Caption        :array[1..2] of string = ('Дата розрахунка','Дата расчета');
const GridClDate_Caption           :array[1..2] of string = ('Дата','Дата');
const GridClTypeAcc_Caption        :array[1..2] of string = ('Дата','Дата');
const GridClKodSetup_Caption       :array[1..2] of string = ('Період','Период');
const GridClBegin_Caption          :array[1..2] of string = ('Початок','Начало');
const GridClEnd_Caption            :array[1..2] of string = ('Закінчення','Окончание');
const GridClKodVo_Caption          :array[1..2] of string = ('ВО','ВО');
const GridClSumma_Caption          :array[1..2] of string = ('Сума','Сумма');
const GridClSumma_Stud_Caption     :array[1..2] of string = ('Макс. сума індексації','Сумма');
const GridClTypeCount_Caption      :array[1..2] of string = ('Тип розрахунка','Тип расчета');
const GridClTypeCount_Acc_Text     :array[1..2] of string = ('Розрахунок','Расчет');
const GridClTypeCount_Rec_Text     :array[1..2] of string = ('Перерахунок','Пересчет');
const GridClP1_Caption             :array[1..2] of string = ('+/-','+/-');
const GridClP1_Nar_Text            :array[1..2] of string = ('Нарахування','Начисление');
const GridClP1_Ud_Text             :array[1..2] of string = ('Утримання','Удержание');
const GridClNday_Caption           :array[1..2] of string = ('Дні','Дни');
const GridClNameVo_Caption         :array[1..2] of string = ('Вид операції','Вид операции');
const GridClKodSmeta_Caption       :array[1..2] of string = ('См.','См.');
const GridClNameSmeta_Caption      :array[1..2] of string = ('Смета','Смета');
const GridClKodDepartment_Caption  :array[1..2] of string = ('Гр.','Гр.');
const GridClNameDepartment_Caption :array[1..2] of string = ('Група','Группа');
const GridClTypeViplata_Caption    :array[1..2] of string = ('Банк','Банк');
const GridClPercent_Caption        :array[1..2] of string = ('%','%');
const GridClDolg_Caption           :array[1..2] of string = ('Борг','Долг');
const GridClBank_Caption           :array[1..2] of string = ('Банк','Банк');
const GridClMaxPercent_Caption     :array[1..2] of string = ('Найбільший %','Наибольший %');
const GridClPochtaPercent_Caption  :array[1..2] of string = ('Поштовий збір','Почтовый сбор');
const GridClShifr_Caption          :array[1..2] of string = ('Шифр','Шифр');
const GridClTypePayment_Caption    :array[1..2] of string = ('Тип виплати','Тип выплаты');
const ZPeopleProp_Caption          :array[1..2] of string = ('Властивості фізичних осіб','Свойства физических лиц');
const GridClPropertyName_Caption   :array[1..2] of string = ('Властивість','Свойство');
const GridClBegPeriod_Caption      :array[1..2] of string = ('Початок','Начало');
const GridClEndPeriod_Caption      :array[1..2] of string = ('Закінчення','Окончание');
const GridClDateEndVac_Caption     :array[1..2] of string = ('Закінчення','Окончание');
const GridClDateBegVac_Caption     :array[1..2] of string = ('Початок','Начало');
const GridClPrikazVac_Caption      :array[1..2] of string = ('Наказ','Приказ');
const GridPeriodCalc_Caption       :array[1..2] of string = ('Період розрахунку','Период расчета');
const GridIndexInfl_Caption        :array[1..2] of string = ('Індекс інфляції','Индекс инфляции');
const GridLiveMin_Caption          :array[1..2] of string = ('Прожитковий мінімум','Прожиточный минимум');
const GridHandEdit_Caption         :array[1..2] of string = ('Ручна правка','Ручная правка');
const GridClBal_Caption            :array[1..2] of string = ('Середній бал','Средний бал');
const GridClForma_Ob_Caption       :array[1..2] of string = ('Форма навчання','Форма обучения');
//******************************************************************************
//Сообщения
const MReadParametersText          :array[1..2] of string = ('Завантажуються властивості','Загружаются свойства');
const MDBConnectingText            :array[1..2] of string = ('Встановлюється підключення до БД','Устанавливается соединение с БД');

//******************************************************************************
//Заголовки дерева
const TreeClGranted_Caption        :array[1..2] of string = ('Кількість стипендіатів','Количество стипендиатов');
const TreeClTotal_Caption          :array[1..2] of string = ('Кількість студентів','Количество студентов');

resourcestring
 INI_FILENAME = 'config.ini';
 PathReports  = '\Reports\Grant\';

implementation

end.
