unit Cn_uReportsConst;

interface
{Message}
const Studcity_MESSAGE_NO_CHOOSE_SUMMA :array[1..2] of String=('Не вибран тип заборгованості','Не выбран тип зодолженности');
const Studcity_MESSAGE_WARNING_CONST   :array[1..2] of String=('Увага','Внимание');
const Studcity_MESSAGE_WAIT_CONST      :array[1..2] of String=('Чекайте! Йде обробка данних!','Ждите! Идет обработка данных!');
const Studcity_MESSAGE_SCH_DB          :array[1..2] of String=('Не вибран дебетовий рахунок','Не выбран дебетовый счет');
const Studcity_MESSAGE_SCH_KD          :array[1..2] of String=('Не вибран кредитовий рахунок','Не выбран кредитовый счет');
const Studcity_MESSAGE_SMETA           :array[1..2] of String=('Не вибрана бюджет','Не выбрана смета');
{Button}
const  cn_ButtonView                   :array[1..2] of String=('Перегляд(F12)','Просмотр(F12)');
const  cn_ButtonCancel                 :array[1..2] of String=('Відмінити','Отменить');


const  cn_RepFIO                     :array[1..2] of String=('П.І.Б.','Ф.И.О.');
const  cn_RepDog                     :array[1..2] of String=('Договір №','Договор №');
const  cn_RepDateDog                 :array[1..2] of String=('Дата заключення','Дата заключения');
const  cn_RepDogperiod               :array[1..2] of String=('Період дії договору','Период действия договора');
const  cn_RepDogPay                  :array[1..2] of String=('Платник по договору','Плательщик по договору');
const  cn_RepDogSumEnd               :array[1..2] of String=('Сума договору, грн','Сумма договора, грн');
const  cn_RepDogSumNeed              :array[1..2] of String=('Спл. на дату разрахунку, грн','Опл. на дату расчета, грн');
const  cn_RepDogSumPay               :array[1..2] of String=('Сплачено, грн','Оплачено, грн');
const  cn_RepDogSumOverPay           :array[1..2] of String=('Переплата, грн','Переплата, грн');
const  cn_RepDogSumNeedPay           :array[1..2] of String=('Заборгованність, грн','Задолженность, грн');
const  cn_RepDogSumDate              :array[1..2] of String=('Сплачено по','Оплачено по');
const  cn_RepDogSumTextOver          :array[1..2] of String=('Сума переплати','Сумма переплаты');
const  cn_RepDogSumText              :array[1..2] of String=('Точна сплата','Точная оплата');
const  cn_RepDogSumTextNEED          :array[1..2] of String=('Сума заборгованності','Сумма задолженности');
const  cn_RepDatePayNeed             :array[1..2] of String=('Заборгованність на','Задолженность на');
const cn_RepSumAll                    :array[1..2] of String=('Усього:','Итого:');
{Отчет}
const  cn_RepStudFT                  :array[1..2] of String=('Реєстр/Зведена відомость  осіб, що навчаються','Реестр/сводная обучаемых');
const  cn_RepStudPayFT               :array[1..2] of String=('Реєстр/Зведена відомость  боржників за навчання','Реестр/сводная должников за обучение');
const  cn_RepStudSVFT                :array[1..2] of String=('Зведена відомость  осіб, що навчаються','Сводная форма колическва обучаемых');
const  cn_RepStudPeriod              :array[1..2] of String=('Період навчання','Период обучения');
const  cn_RepStudPeriodBeg           :array[1..2] of String=('з','с');
const  cn_RepStudPeriodEnd           :array[1..2] of String=('по','по');
const  cn_RepStudFilter              :array[1..2] of String=('Відбір параметрів навчання(F7)','Установка параметров обучения(F7)');
const  cn_RepStudRun                 :array[1..2] of String=('Формувати(F10)','Формировать(F10)');
const  cn_RepStudCancel              :array[1..2] of String=('Відміна','Отмена');
const  cn_RepStudQuit                :array[1..2] of String=('Вихід','Выход');
const  cn_RepStudMainDog             :array[1..2] of String=('Основні договора','Основные договора');
const  cn_RepStudDopDog              :array[1..2] of String=('Додаткові договора','Дополнительные договора');
const  cn_RepStudView                :array[1..2] of String=('Перегляд(F12)','Просмотр(F12)');
const  cn_RepStudDOC                 :array[1..2] of String=('Провести документ переплати','Провести документ переплаты');
const  cn_RepStudDOC_Message         :array[1..2] of String=('Документ переплати проведен успiшно','Документ переплаты проведен успешно');
const  cn_RepStudDOC_Message_Err_del :array[1..2] of String=('Помилка при редагуваннi документа','Ошибка при редавктировании документа');
const  cn_RepStudSelFiled            :array[1..2] of String=('Групувати по','Группировать по');
const  cn_RepRestr                   :array[1..2] of String=('Реєстр','Реестр');
const  cn_RepRestr_ex                :array[1..2] of String=('Реєстр(розгорнутий)','Реестр(развернутый)');
const  cn_RepSV                      :array[1..2] of String=('Зведена','Сводная');
const  cn_RepSVPAY                   :array[1..2] of String=('Зведена форма заборгованності','Сводная форма о задолженности');
const  cn_RepSVPAYPERE               :array[1..2] of String=('Зведена форма переплати','Сводная форма о переплаты');
const  cn_RepSVPAY1                  :array[1..2] of String=('за сплату договорів за навчання на','по оплате договоров за обучение на');
const  cn_RepALL                     :array[1..2] of String=('Загальна кількість договірників:','Общее количество договорников:');
const  cn_RepSVALL                   :array[1..2] of String=('Усього','Всего');
const  cn_RepMainDog                 :array[1..2] of String=('студентів, що навчаються за основними договорами','обучаемых по основным договорам');
const  cn_RepDopDog                  :array[1..2] of String=('студентів, що навчаються за додатковими договорами','обучаемых по дополнительным договорам');
const  cn_RepPeiodDog                :array[1..2] of String=('за період','в период');
const  cn_RepPere                    :array[1..2] of String=('студентів, що переплатили за навчання','переплативших за обучения');
const  cn_RepNeed                    :array[1..2] of String=('студентів, що заборгували за навчання','должников за обучение');
const  cn_RepToch                    :array[1..2] of String=('студентів, що повністю сплатили за навчання','полностью оплативших');
const  cn_RepOpldate                 :array[1..2] of String=('розрахунок суми до сплати на','расчет суммы к оплате на');
const  cn_RepMainDogEX               :array[1..2] of String=('за основними договорами','по основным договорам');
const  cn_RepDopDogEX                :array[1..2] of String=('за додатковими договорами','по дополнительным договорам');
const  cn_RepFormZad                 :array[1..2] of String=('Заборгованність','Задолженность');
const  cn_RepFormToch                :array[1..2] of String=('Точна сплата','Точная оплата');
const  cn_RepFormPere                :array[1..2] of String=('Переплата','Переплата');

const  cn_RepDogNotArhiv             :array[1..2] of String=('Діючі договора','Действующие договора');
const  cn_RepDogArhiv                :array[1..2] of String=('Не діючі договора','Не действующие договора');

{Фильтр}
const  cn_RepFilterFT                :array[1..2] of String=('Параметри навчання','Параметры обучения');

const  cn_RepFacult                  :array[1..2] of String=('Факультет','Факультет');
const  cn_RepSpec                    :array[1..2] of String=('Спеціальність','Специальность');
const  cn_RepNational                :array[1..2] of String=('Громадянство','Гражданство');
const  cn_RepFormStud                :array[1..2] of String=('Форма навчання','Форма обучения');
const  cn_RepKatStud                 :array[1..2] of String=('Категорія навчання','Категория обучения');
const  cn_RepKurs                    :array[1..2] of String=('Курс','Курс');
const  cn_RepGroup                   :array[1..2] of String=('Група','Группа');
const  cn_Zamov                      :array[1..2] of String=('Споживча спилка', 'Потребительский союз');
const  cn_Type_Stage                 : array[1..2] of string = ('Періодичність оплати','Периодичность оплаты');  

const cn_RepFilterFac                :array[1..2] of String=('Вибір факультетів','Выбор факультетов');
const cn_RepFilterSpec               :array[1..2] of String=('Вибір спеціальностей','Выбор специальностей');
const cn_RepFilterNational           :array[1..2] of String=('Вибір національностей','Выбор национальностей');
const cn_RepFilterFormStud           :array[1..2] of String=('Вибір форм навчання','Выбор форм обучения');
const cn_RepFilterKatStud            :array[1..2] of String=('Вибір категорій навчання','Выбор категорий обучения');
const cn_RepFilterCurs               :array[1..2] of String=('Вибір курсів','Выбор курсов');
const cn_RepFilterGroup              :array[1..2] of String=('Вибір груп','Выбор групп');

const cn_RepFilterFacL               :array[1..2] of String=('Вибрано факультетів:','Выбрано факультетов:');
const cn_RepFilterSpecL              :array[1..2] of String=('Вибрано спеціальностей:','Выбрано специальностей:');
const cn_RepFilterNationalL          :array[1..2] of String=('Вибрано національностей:','Выбрано национальностей:');
const cn_RepFilterFormStudL          :array[1..2] of String=('Вибрано форм навчання:','Выбрано форм обучения:');
const cn_RepFilterKatStudL           :array[1..2] of String=('Вибрано категорій навчання:','Выбрано категорий обучения:');
const cn_RepFilterCursL              :array[1..2] of String=('Вибрано курсів:','Выбрано курсов:');
const cn_RepFilterGroupL             :array[1..2] of String=('Вибрано груп:','Выбрано групп:');

{Поступления}
const  cn_RepFormFilter              :array[1..2] of String=('Джерела фінансування','Источники финансирования');
const  cn_RepFormFilterSmNotProv     :array[1..2] of String=('Неприв'''+''''+'язані документи оплати','Непривязанные документы оплаты');
const  cn_RepFormFilterSmNotProvGet  :array[1..2] of String=('Відібрати неприв'''+''''+'язані документи оплати','Отобрать непривязанные документы оплаты');

const  cn_RepDocProv                 :array[1..2] of String=('Реєстр/Зведена відомость надходжень за навчання','Реестр/сводная поступлений за обучение');
const  cn_RepDocProvROS              :array[1..2] of String=('Реєстр надходжень за навчання за основними договорами','Реестр поступлений за обучение по основным договорам');
const  cn_RepDocProvRDop             :array[1..2] of String=('Реєстр надходжень за навчання за додатковими договорами','Реестр поступлений за обучение по дополнительным договорам');
const  cn_RepDocProvR                :array[1..2] of String=('Зведена відомость надходжень за навчання','Сводная поступлений за обучение');
const  cn_RepDocProvR1               :array[1..2] of String=('в розрізі джерел фінансування','в разрезе источников финансирования');
const  cn_RepDocProvR2               :array[1..2] of String=('за період з','за период с');
const  cn_RepDocProvR3               :array[1..2] of String=('до','по');
const  cn_RepDocProvRT1              :array[1..2] of String=('Найменування бюджету','Наименование сметы');
const  cn_RepDocProvRT2              :array[1..2] of String=('Розділ Стаття КЕКВ','Раздел Статья КЕКВ');
const  cn_RepDocProvRT3              :array[1..2] of String=('Дебет','Дебет');
const  cn_RepDocProvRT4              :array[1..2] of String=('Кредіт','Кредит');
const  cn_RepDocProvRT5              :array[1..2] of String=('Усьго по бюджету','Всего по смете');
const  cn_RepDocProvRT6              :array[1..2] of String=('Сума, грн','Сумма, грн');
const  cn_RepDocProvSch              :array[1..2] of String=('З разбивкою по рахунках','С разбивкой по счетам');
const  cn_RepDocProvSm               :array[1..2] of String=('З разбивкою по бюджетам','С разбивкой по сметам');
const  cn_RepDocPrintProvSm          :array[1..2] of String=('Зведена по іст. фін. ','Сводная по ист. фин.');
const  cn_RepDocProvRT7              :array[1..2] of String=('Документ №','Документ №');
const  cn_RepDocProvRT8              :array[1..2] of String=('Дата документу','Дата документа');
const  cn_RepDocProvRT9              :array[1..2] of String=('Платник/  Отримувач','Плательщик/ Получатель');
const  cn_RepDocProvRT10             :array[1..2] of String=('Призначення платежу','Назначение платежа');
const  cn_RepDocProvRT11             :array[1..2] of String=('Сума надходжень','сумма поступлений');
const  cn_RepDocProvRT12             :array[1..2] of String=('від','от');
const  cn_RepDocProvRT13             :array[1..2] of String=('Іст. фін.','Ист. фин.');

const  cn_RepSchDB                   :array[1..2] of String=('Дебетові рахунки','Дебетовые счета');
const  cn_RepSchKD                   :array[1..2] of String=('Кредитові рахунки','Кредитовые счета');
const  cn_RepSmeta                   :array[1..2] of String=('См\Розд\Ст\КЕКВ','См\Разд\Ст\КЕКВ');
const  cn_RepSmetaName               :array[1..2] of String=('Назва бюджету','Название сметы');
const  cn_RepDocAllSum               :array[1..2] of String=('Надрукована сума надходжень','Распечатанная сумма поступлений');
const  cn_RepDocAllDoc               :array[1..2] of String=('Загальна кількість надходжень','Общее число поступлений');
{Количество для ДонГУЭТ}
const  cn_RepDONGUETOtdel            :array[1..2] of String=('Відділення','Отделение');
const  cn_RepDONGUETCNT              :array[1..2] of String=('Кіл-сть','Кол-во');
const  cn_RepDONGUETCNTOtdel         :array[1..2] of String=('Усього по відділу','Итого по отделению');
const  cn_RepDONGUETAll              :array[1..2] of String=('Усього по звіту','Итого по списку');

{Аналитеческие формы}
const  cn_RepRAnalyz                 :array[1..2] of String=('Аналітичний реєстр сплати за навчання','Аналитический реестр по оплате за обучение');
const  cn_RepSVAnalyz                :array[1..2] of String=('Аналітичий звіт сплати за навчання','Аналитическая сводная по оплате за обучение');
const  cn_RepRAnalyzIN               :array[1..2] of String=('Вхідне сальдо, грн','Входящее сальдо, грн');
const  cn_RepRAnalyzNEED             :array[1..2] of String=('Планова сума, грн.','Планируемая сумма, грн');
const  cn_RepRAnalyzPAY              :array[1..2] of String=('Сплачено, грн','Поступившая сумма, грн');
const  cn_RepRAnalyzOUT              :array[1..2] of String=('Вихідне сальдо, грн','Исходящее сальдо, грн');
const  cn_RepRAnalyzAllSaldo         :array[1..2] of String=('Усього вихідне сальдо','Всего исходящее сальдо, грн');
const  cn_RepRAnalyzCNT              :array[1..2] of String=('Загальна кількість','Общее число обучаемых');
const  cn_RepRAnalyzSUMPrint         :array[1..2] of String=('Надрукована сума','Распечатанная сумма');
const  cn_RepRAnalyzAll              :array[1..2] of String=('Загальний список','Общий список');
{анализ в разрезе источников финансирования}
const  cn_RepRAnalyzSmetaSV          :array[1..2] of String=('Аналіз сплати за навчання за джерелами фінансування','Анализ оплаты обучения в разрезе источников финансирования');
const  cn_RepSVAnalyzSmName          :array[1..2] of String=('Джерела фінансування','Источник финансирования');
const  cn_RepSVAnalyzSmOstNach       :array[1..2] of String=('Залишок на початок періода','Остаток на начало периода');
const  cn_RepSVAnalyzSmOstNow        :array[1..2] of String=('Поточний період','Текущий период');
const  cn_RepSVAnalyzSmOstBeg        :array[1..2] of String=('Залишок на кінец періода','Остаток на конец пеиода');
const  cn_RepSVAnalyzSmDolg          :array[1..2] of String=('Борг','Долг');
const  cn_RepSVAnalyzSmPere          :array[1..2] of String=('Переплата','Переплата');
const  cn_RepSVAnalyzSmIn            :array[1..2] of String=('Вхідне сальдо','Входящее сальдо');
const  cn_RepSVAnalyzSmOut           :array[1..2] of String=('Віхідне сальдо','Исходящее сальдо');
const  cn_RepSVAnalyzSmNach          :array[1..2] of String=('Нараховано','Начислено');
const  cn_RepSVAnalyzSmOpl           :array[1..2] of String=('Сплачено','Оплачено');
const  cn_RepSVAnalyzSmZad           :array[1..2] of String=('Заборгованність','Задолженность');

{Накопительная ведоомсть}
const  cn_RepSVDPDocShort            :array[1..2] of String=('Накопичувальна відомість','Накопительная ведомость');
const  cn_RepSVDPDoc                 :array[1..2] of String=('Накопичувальна відомість сплати за навчання','Накопительная ведомость оплаты за обучение');
const  cn_RepSVDPDocNumber           :array[1..2] of String=('№№','№№');
const  cn_RepSVDPDocDate             :array[1..2] of String=('Дата','Дата');
const  cn_RepSVDPDocCNT              :array[1..2] of String=('Кіл-сть','Кол-во');
const  cn_RepSVDPDocSumma            :array[1..2] of String=('Сума, грн','Сумма, грн');
const  cn_RepSVDPDocAll              :array[1..2] of String=('Усьго','Итого');
{Форма процентного выполнения договоров}
const  cn_RepSVPercent              :array[1..2] of String=('Форма відсоткового виконання договорів за навчання','Форма процентного выполнения договоров');
const  cn_RepSVPercentPay           :array[1..2] of String=('Сплата навчання','Оплата обучения');
const  cn_RepSVPercentCNT           :array[1..2] of String=('Загальна кіл-сть договорів','Общее кол-во договоров');
const  cn_RepSVPercentCNTShort      :array[1..2] of String=('Кіл-сть','Кол-во');
const  cn_RepSVPercentPeriod        :array[1..2] of String=('Період','Период');

{недопоступившие суммы}
const  cn_RepUnSumName              :array[1..2] of String=('Реєстр/Зведена відомость сумм, що не надійшли','Реестр/Сводная недопоступившых сумм');
const  cn_RepUnSumSV                :array[1..2] of String=('Зведена форма сум, що не надійшли за навчання','Сводная форма недопоступивших сумм за обучение');
const  cn_RepUnSumR                 :array[1..2] of String=('Реєстр сум, що не надійшли за навчання','Реестр недопоступивших сумм за обучение');
const  cn_RepUnSumNew               :array[1..2] of String=('Тільки зараховані','Вновь поступившые');
const  cn_RepUnSumCNT               :array[1..2] of String=('Кіл-сть','Кол-во');
const  cn_RepUnSumSum               :array[1..2] of String=('Сума, грн','Сумма, грн');
const  cn_RepUnSumSumALL            :array[1..2] of String=('Загальна сума','Общая сумма');
const  cn_RepUnRSumCNT              :array[1..2] of String=('Загальна кількість, що навчається','Общее число обучаемых');
const  cn_RepUnRSumSum              :array[1..2] of String=('Сума, що не надійшла, грн','Недопоступившая сумма, грн');
const  cn_RepUnRSumSumALL           :array[1..2] of String=('Надрукована сума','Распечатанная сумма');
const  cn_RepUnRSumALL              :array[1..2] of String=('Усього не надійшло','Всего недополучено');
const  cn_RepSVPeriod               :array[1..2] of String=('Період','Период');

{Сводная отчисленных}
const  cn_RepSVDiss                 :array[1..2] of String=('Зведена відсоткового відношення відрахованих','Сводная процентного отношения отчисленных');
const  cn_RepSVDISSDISS             :array[1..2] of String=('Відрах.','Отчисл.');
const  cn_RepSVDISSUNDISS           :array[1..2] of String=('Навч.','Обуч.');
const  cn_RepSVDISSPERSENT          :array[1..2] of String=('Від., %','Отн., %');
const  cn_RepSVDissChPersent        :array[1..2] of String=('Відсоткова Зведена','Процентная сводная');
const  cn_RepSVDissChCNT            :array[1..2] of String=('Перенесені, до недіючих','Перенесенные в недействующие');
const  cn_RepSVDissType             :array[1..2] of String=('Найменування підстави переносу до архіву','Наименование причины переноса в архив');
const  cn_RepSVDissArchName         :array[1..2] of String=('Кількість перенесених до архіву','Количество перенесенных в архив');


implementation



end.
