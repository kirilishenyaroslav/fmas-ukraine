unit JO5_Consts;

interface

//******************************************************************************
//
//Заголовки форм
const Application_Caption          :array[1..2] of string = ('Журнал-ордер №5','Журнал-ордер №5');
const MainMenu_Caption             :array[1..2] of string = ('Система розрахунку заробітної плати та стипендії [Ж/О №5]','Система расчета заработной платы и стипендии [Ж/О №5]');
const Access_Caption               :array[1..2] of string = ('Вхід','Вход');
const RegSch_Caption               :array[1..2] of string = ('Реєстр рахунків','Реестр счетов');
const KorToSch_Caption             :array[1..2] of string = ('Кореспонденція рахунка','Корреспонденция счета');
const DopKorToSch_Caption          :array[1..2] of string = ('Деталізація рахунку','Детализация счета');
const Print_Caption                :array[1..2] of string = ('Друк журналу','Печать журнала');

const LabelRegUch_Caption          :array[1..2] of string = ('Регістр обліку','Регистр учета');
const LabelCurrentRegUch_Caption   :array[1..2] of string = ('Поточний регістр обліку','Текущий регистр учета');
const LabelFilterPeriod_Caption    :array[1..2] of string = ('Період фільтрації','Период фильтрации');
const LabelSelectKorType_Caption   :array[1..2] of string = ('Оберіть тип кореспонденції','Выберите тип корреспондеции');
const LabelKorType_Caption         :array[1..2] of string = ('Тип кореспонденції','Тип корреспондеции');
const LabelDbKorType_Caption       :array[1..2] of string = ('Дебетова','Дебетовая');
const LabelKrKorType_Caption       :array[1..2] of string = ('Кредитова','Кредитовая');
const LabelExpandAll_Caption       :array[1..2] of string = ('Розвернути все','Развернуть все');
const LabelCloseAll_Caption        :array[1..2] of string = ('Звернути все','Свернуть все');
const LabelIsNotOpenSch_Caption    :array[1..2] of string = ('Рахунок закрито','Счет закрыт');
const LabelIsLockedSch_Caption     :array[1..2] of string = ('Рахунок заблоковано','Счет заблокирован');
const LabelCurrPeriod_Caption      :array[1..2] of string = ('Поточний період','Текущий период');
const LabelDataType_Caption        :array[1..2] of string = ('Оберіть тип даних','Выберите тип данных');
const LabelDocs_Caption            :array[1..2] of string = ('Документи','Документы');
const LabelSCHs_Caption            :array[1..2] of string = ('Рахунки','Счета');

// Заголовки кнопок
const ApplyBtn_Caption             :array[1..2] of string = ('Прийняти','Применить');
const InsertBtn_Caption            :array[1..2] of string = ('Додати','Добавить');
const UpdateBtn_Caption            :array[1..2] of string = ('Редагувати','Изменить');
const DeleteBtn_Caption            :array[1..2] of string = ('Видалити','Удалить');
const DelAllBtn_Caption            :array[1..2] of string = ('Видалити усе','Удалить всё');
const DetailBtn_Caption            :array[1..2] of string = ('Перегляд','Просмотр');
const AddManBtn_Caption            :array[1..2] of string = ('Додати особу','Додавить человека');
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
const AdditionalBtn_Caption        :array[1..2] of string = ('Додатково','Дополнительно');

const OpenSchBtn_Caption           :array[1..2] of string = ('Відкрити','Открыть');
const CloseSchBtn_Caption          :array[1..2] of string = ('Закрити','Закрыть');
const OpenSchBtn_Hint              :array[1..2] of string = ('Відкотити поточний рахунок у попередній період','Откатить текущий счет в предыдущий период');
const CloseSchBtn_Hint             :array[1..2] of string = ('Перевести поточний рахунок у наступний період','Перевести текущий счет в следующий период');
const SelectAnalizeBtn_Hint        :array[1..2] of string = ('Отримати аналіз рахунка','Получить анализ счета');

//******************************************************************************
const LabelPeriod_Caption          :array[1..2] of string = ('Період','Период');
const LabelSumma_Caption           :array[1..2] of string = ('Сума','Сумма');
const LabelMonth_Caption           :array[1..2] of string = ('Місяць','Месяц');
const LabelYear_Caption            :array[1..2] of string = ('Рік','Год');
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
const EnotInputData_Text           :array[1..2] of string = ('Не введено данні!',
                                                             'Не ведены данные!');
const EManInput_Text               :array[1..2] of string = ('Не обрано фізичну особу','Не выбрано физическое лицо');
const EMonthInput_Text             :array[1..2] of string = ('Не обрано місяць','Не выбран месяц');
const EYearInput_Text              :array[1..2] of string = ('Помилка вводу року','Ошибка ввода года');
const ESummaInput_Text             :array[1..2] of string = ('Не введено суму','Не введена сумма');
const ECategoryInput_Text          :array[1..2] of string = ('Не обрано категорію','Не выбрана категория');
const EVidOplInput_Text            :array[1..2] of string = ('Не обрано вид операції','Не выбран вид оплаты');
const EDepartmentInput_Text        :array[1..2] of string = ('Не обрано підрозділ','Не выбрано подразделение');
const EPostInput_Text              :array[1..2] of string = ('Не обрано посаду','Не выбрана должность');
const ESmetaInput_Text             :array[1..2] of string = ('Не обрано кошторис','Не выбрана смета');
const EStudentMovingNotSelect_Text :array[1..2] of string = ('Не обрано термін навчання','Не выбран срок обученя');
const EReportNotFound              :array[1..2] of string = ('Файл звіту не знайдено','Файл отчета не найден');
//******************************************************************************

//******************************************************************************
//Столбцы гридов
const GridClDate_Caption           :array[1..2] of string = ('Дата','Дата');
const GridClSumma_Caption          :array[1..2] of string = ('Сума','Сумма');

const GridClNum_Caption            :array[1..2] of string = ('№','№');
const GridClName_Caption           :array[1..2] of string = ('Назва','Название');
const GridClDebet_Caption          :array[1..2] of string = ('Дебет','Дебет');
const GridClKredit_Caption         :array[1..2] of string = ('Кредит','Кредит');
const GridClRekvizitSch_Caption    :array[1..2] of string = ('Реквізити рахунка','Реквизиты счета');
const GridClBegSaldo_Caption       :array[1..2] of string = ('Сальдо на початок місяця','Сальдо на начало месяца');
const GridClEndSaldo_Caption       :array[1..2] of string = ('Сальдо на кінець місяця','Сальдо на конец месяца');
const GridClOborots_Caption        :array[1..2] of string = ('Обороти','Обороты');
const GridClGrSmetaNum_Caption     :array[1..2] of string = ('№ гр.бюджетів','№ гр.бюджетов');
const GridClGrSmetaName_Caption    :array[1..2] of string = ('Назва гр.бюджетів','Название гр.бюджетов');
const GridClSmetaNum_Caption       :array[1..2] of string = ('№ кошторису','№ сметы');
const GridClSmetaName_Caption      :array[1..2] of string = ('Назва кошторису','Название сметы');
const GridClRazdNum_Caption        :array[1..2] of string = ('№ розділу','№ раздела');
const GridClRazdName_Caption       :array[1..2] of string = ('Назва розділу','Название раздела');
const GridClStatNum_Caption        :array[1..2] of string = ('№ статті','№ статьи');
const GridClStatName_Caption       :array[1..2] of string = ('Назва статті','Название статьи');
const GridClKekvNum_Caption        :array[1..2] of string = ('№ КЕКВ','№ КЕКВ');
const GridClKekvName_Caption       :array[1..2] of string = ('Назва КЕКВ','Название КЕКВ');
const GridClNote_Caption           :array[1..2] of string = ('Примітка','Примечание');



//******************************************************************************
//Для RegSch

	//Сообщения закрытия(отката) текущего счёта
const	sMsgSchIsAbsent              :array[1..2] of string = ('Поточний рахунок не знайдено','Текущий счёт не найден');
const sMsgSchIsOpened              :array[1..2] of string = ('Неможливо відкрити поточний рахунок,'#13'оскільки його було відкрито раніше','Невозможно открыть текущий счёт,'#13'поскольку он был открыт ранее');
const sMsgSchIsClosed              :array[1..2] of string = ('Неможливо закрити поточний рахунок,'#13'оскільки його було закрито раніше','Невозможно закрыть текущий счёт,'#13'поскольку он был закрыт ранее');
const	sMsgSchIsParentOp            :array[1..2] of string = ('Неможливо відкрити поточний рахунок,'#13'оскільки він не є субрахунком','Невозможно открыть текущий счёт,'#13'поскольку он не является субсчётом');
const	sMsgSchIsParentCl            :array[1..2] of string = ('Неможливо закрити поточний рахунок,'#13'оскільки він не є субрахунком','Невозможно закрыть текущий счёт,'#13'поскольку он не является субсчётом');
const	sMsgDataSetIsEmpty           :array[1..2] of string = ('Неможливо друкувати інформацію по'#13'рахунках, оскільки реєстр рахунків порожній','Невозможно распечатать информацию по'#13'счетам, поскольку реестр счетов пуст');

const	sMsgOKOpenSCH                :array[1..2] of string = ('Рахунок успішно переведено у попередній період','Cчёт успешно переведён в предыдущий период');
const sMsgOKCloseSCH               :array[1..2] of string = ('Рахунок успішно переведено у наступний період','Cчёт успешно переведён в следующий период');
const	sMsgErrOpenSCH               :array[1..2] of string = ('Не вдалося відкотити рахунок у попередній період...'#13'Показати розшифровку помилки для непереведеного рахунка?','Не удалось откатить счёт в предыдущий период...'#13'Показать расшифровку ошибки для неоткатившегося счёта?');
const	sMsgErrCloseSCH              :array[1..2] of string = ('Не вдалося перевести рахунок у наступний період...'#13'Показати розшифровку помилки для непереведеного рахунка?','Не удалось перевести счёт в следующий период...'#13'Показать расшифровку ошибки для непереведённого счёта?');

	//Сообщения получения корреспонденции
const	sMSG_SelectSubSCH            :array[1..2] of string = ('Для того, щоб переглянути кореспонденцію по рахунку,'#13'оберіть, будь ласка, рахунок нижчого рівня','Для того, чтобы просмотреть корреспонденцию по счету,'#13'выберите, пожалуйста, счет нижнего уровня');
const	sMSG_KorrIsNotFound          :array[1..2] of string = ('Неможливо отримати кореспонденцію,'#13'тому що відсутній обраний рахунок','Невозможно получить корреспонденцию,'#13'поскольку отсутствует выбранный счёт');

resourcestring
 INI_FILENAME = 'config.ini';
 PathReports  = '\Reports\Jo5\';

implementation

end.
