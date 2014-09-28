unit Unit_ZGlobal_Consts;

interface

const ShowGroupBoxBtn_Caption      :array[1..2] of string = ('Показати групи','Показать группы');
const HideGroupBoxBtn_Caption      :array[1..2] of string = ('Скрити групи','Скрыть группы');
const InsertBtn_Caption            :array[1..2] of string = ('Додати','Добавить');
const AddAllBtn_Caption            :array[1..2] of string = ('Додати всіх','Добавить всех');
const DelAllBtn_Caption            :array[1..2] of string = ('Вилучити всіх','Удалить всех');
const ProgressBar_Caption          :array[1..2] of string = ('Прогрес','Прогресс');
const UpdateBtn_Caption            :array[1..2] of string = ('Редагувати','Изменить');
const FormBtn_Caption              :array[1..2] of string = ('Формувати','Формировать');
const DeleteBtn_Caption            :array[1..2] of string = ('Видалити','Удалить');
const DetailBtn_Caption            :array[1..2] of string = ('Перегляд','Просмотр');
const BreakBtn_Caption             :array[1..2] of string = ('Перервати','Прервать');
const ExportBtn_Caption            :array[1..2] of string = ('Експорт','Экспорт');
const ShowDetailsBtn_Caption       :array[1..2] of string = ('Детальніше','Детали');
const AddManBtn_Caption            :array[1..2] of string = ('Додати особу','Додавить человека');
const RefreshBtn_Caption           :array[1..2] of string = ('Оновити','Обновить');
const ExitBtn_Caption              :array[1..2] of string = ('Вийти','Выход');
const YesBtn_Caption               :array[1..2] of string = ('Прийняти','Принять');
const CancelBtn_Caption            :array[1..2] of string = ('Відмінити','Отменить');
const FilterBtn_Caption            :array[1..2] of string = ('Фільтр','Фильтр');
const LocateBtn_Caption            :array[1..2] of string = ('Шукати','Искать');
const LocateNextBtn_Caption        :array[1..2] of string = ('Далі','Дальше');
const ReportsBtn_Caption           :array[1..2] of string = ('Друк','Печать');
const PrintBtn_Caption             :array[1..2] of string = ('Друк','Печать');
const NewPrintBtn_Caption          :array[1..2] of string = ('Новий друк','Новая печать');
const SelectBtn_Caption            :array[1..2] of string = ('Обрати','Выбрать');
const SelectWithDependence_Caption :array[1..2] of string = ('Обрати з підлеглими','Выбрать с подчиненными');
const PrintSvodBtn_Caption         :array[1..2] of string = ('Друк звіту','Печать свода');
const LineViewBtn_Caption          :array[1..2] of string = ('Лінійно','Линейно');
const TableBtn_Caption             :array[1..2] of string = ('Табель','Табель');
const SaveBtn_Caption              :array[1..2] of string = ('Зберегти','Сохранить');
const ClearBtn_Caption             :array[1..2] of string = ('Очистити','Очистить');
const AddReport_Caption            :array[1..2] of string = ('Створити','Создать');
const DelReport_Caption            :array[1..2] of string = ('Видалити','Удалить');
const FileToBankBtn_Caption        :array[1..2] of string = ('Файл для банку','Файл в банк');
const EditManBtn_Caption           :array[1..2] of string = ('Змінити фіз. особу','Поменять физ. лицо');
const EditManWithZamenaBtn_Caption :array[1..2] of string = ('Змінити фіз. особу та суми','Поменять физ. лицо и суммы');
const EditData_Caption             :array[1..2] of string = ('Редагування даних','Изменение данных');
const Finish_Caption               :array[1..2] of string = ('Закінчення','Окончание');
const Report_Caption               :array[1..2] of string = ('Звіт','Отчет');
const ToCorrect_Caption            :array[1..2] of string = ('До коригування','В корректировку');
const CountBtn_Caption             :array[1..2] of string = ('Розрахувати','Рассчитать');
const PropertiesBtn_Caption        :array[1..2] of string = ('Властивості','Свойства');

const GoodFinish_Text              :array[1..2] of string = ('Операцію було вдало завершено','Операция была успешно заверщена');
const CreateReport_Caption         :array[1..2] of string = ('Створення звіту','Создание отчета');
const Add_SP_Const_type            :array[1..2] of string = ('Додати тип констант','Добавить тип констант');
const Upd_SP_Const_type            :array[1..2] of string = ('Редагувати тип констант','Редактировать тип констант');
const Del_SP_Const_type            :array[1..2] of string = ('Видалити тип констант','Удалить тип констант');

const InsertBtn_Hint               :array[1..2] of string = ('Ins - Додати','Ins - Добавить');
const UpdateBtn_Hint               :array[1..2] of string = ('F2 - Редагувати','F2 - Изменить');
const DeleteBtn_Hint               :array[1..2] of string = ('Del - Видалити','Del - Удалить');
const DetailBtn_Hint               :array[1..2] of string = ('Space - Перегляд','Space - Просмотр');
const SelectBtn_Hint               :array[1..2] of string = ('Enter - Обрати','Enter - Выбрать');
const ExitBtn_Hint                 :array[1..2] of string = ('Esc - Вихід','Esc - Выход');
const YesBtn_Hint                  :array[1..2] of string = ('F10 - Прийняти','F10 - Принять');
const CancelBtn_Hint               :array[1..2] of string = ('Esc - Відмінити','Esc - Отменить');
const ToBufferBtn_Hint             :array[1..2] of string = ('F9 - Зберегти в буфер','F9 - Сохранить в буфер');
const RefreshBtn_Hint              :array[1..2] of string = ('F5 - Оновити','F5 - Обновить');
const LocateBtn_Hint               :array[1..2] of string = ('F7 - Шукати','F7 - Искать');
const LocateNextBtn_Hint           :array[1..2] of string = ('Ctrl+F7 - Далі','Ctrl+F7 - Дальше');
const AddManBtn_Hint               :array[1..2] of string = ('Ctrl+Ins - Дод. особу','Ctrl+Ins - Доб. человека');
const FilterBtn_Hint               :array[1..2] of string = ('F8 - Фільтр','F8 - Фильтр');
const LineViewBtn_Hint             :array[1..2] of string = ('Ctrl+F8 - Лінійно','Ctrl+F8 - Линейно');
const TableBtn_Hint                :array[1..2] of string = ('Space - Табель','Space - Табель');
const SaveBtn_Hint                 :array[1..2] of string = ('F10 - Зберегти','F10 - Сохранить');
const PrintBtn_Hint                :array[1..2] of string = ('F9 - Друк','F9 - Печать');
const FileToBankBtn_Hint           :array[1..2] of string = ('Зробити файл для банка','Сделать файл для банка');
const ClearReestrBtn_Hint          :array[1..2] of string = ('Очистити реєстр','Очистить реестр');
const AddSheetsToReestrBtn_Hint    :array[1..2] of string = ('Додати відомості до реєстра','Добавить ведомости в реестр');
const DelSheetFromReestrBtn_Hint   :array[1..2] of string = ('Видалити відомость з реєстра','Удалить ведомость из реестра');

const Caption_Form                 :array[1..2] of string = ('Формування','Формирование');
const Caption_Insert               :array[1..2] of string = ('Додавання','Добавление');
const Caption_Update               :array[1..2] of string = ('Редагування','Изменение');
const Caption_Delete               :array[1..2] of string = ('Вилучення','Удаление');
const Caption_Detail               :array[1..2] of string = ('Перегляд','Просмотр');
const Caption_Confirmation         :array[1..2] of string = ('Підтвердження','Подтверждение');

const Message_Data_Nothing_Selected:array[1..2] of string = ('За вашим запитом нічого не знайдено!',
                                                             'По вашему запросу ничего не найдено!');

const OperationWasEnded_Text       :array[1..2] of string = ('Операцію було завершено!','Операция завершена!');

const Information_Caption          :array[1..2] of string = ('Інформація','Информация');

const Confirm_Caption              :array[1..2] of string = ('Підтверження операції',
                                                             'Подтверждение действия');
const DeleteRecordQuestion_Text    :array[1..2] of string = ('Ви дійсно бажаєте'+#13+
                                                             'видалити обраний запис?',
                                                             'Вы действительно хотите'+#13+
                                                             'удалить выбранную запись?');
const DelAllRecordsQuestion_Text   :array[1..2] of string = ('Ви дійсно бажаєте'+#13+
                                                             'видалити всі записи?',
                                                             'Вы действительно хотите'+#13+
                                                             'удалить все записи?');
const DelAllRecords_Text           :array[1..2] of string = ('З видаленням типу констант будуть видалені всі записи цього типу.'+#13+
                                                             'Ви дійсно бажаєте видалити обраний тип констант?',
                                                             'C удалением типа констант будут удалены все записи этого типа.'+#13+
                                                             'Вы действительно желаете удалить выбранный тип констант?');
const ClearReestrQuestion_Text     :array[1..2] of string = ('Ви дійсно бажаєте'+#13+
                                                             'очистити реєстр?',
                                                             'Вы действительно хотите'+#13+
                                                             'очичтить реестр?');
const SaveDataQuestion_Text        :array[1..2] of string = ('Можливо, що деякі'+#13+
                                                             'данні не було збережено.'+#13+
                                                             'Зберегти?',
                                                             'Возможно, что некоторые данные'+#13+
                                                             'не были сохранены.'+#13+
                                                             'Сохранить?');
const AreYouSureQuestion_Text      :array[1..2] of string = ('Ви впевнені?','Вы уверены?');

const Error_Caption                :array[1..2] of string = ('Помилка','Ошибка');
const EFileNotSelected_Caption     :array[1..2] of string = ('Файл не обрано','Файл не выбран');
const EFileCanNotCreate_Caption    :array[1..2] of string = ('Неможливо створити файл','Невозможно создать файл');

const Term_Text                    :array[1..2] of string = ('Період','Период');
const Net_Text                     :array[1..2] of string = ('Сіть','Сеть');
const Options_Text                 :array[1..2] of string = ('Властивості','Свойства');
const NonTerm_Caption              :array[1..2] of string = ('Без терміна','Без периода');
const NonDate_Caption              :array[1..2] of string = ('Без дати','Без даты');
const Order_Text                   :array[1..2] of string = ('Порядок','Порядок');
const FIO_Text                     :array[1..2] of string = ('П. І. Б.','Ф. И. О.');
const Tn_Text                      :array[1..2] of string = ('Т. н.','Т. н.');
const Spisok_Text                  :array[1..2] of string = ('Список','Список');
const Table_Text                   :array[1..2] of string = ('Табель','Табель');

const GridClTn_Caption             :array[1..2] of string = ('Т.н.','Т.н.');
const GridClName_Caption           :array[1..2] of string = ('Назва','Название');
const GridClKoefficicent_Caption   :array[1..2] of string = ('Коефіціент','Коеффициент');
const GridClMinAmount_Caption      :array[1..2] of string = ('Найменша кількість','Наименьшее количество');
const GridClMaxAmount_Caption      :array[1..2] of string = ('Найбільша кількість','Наибольшее количество');
const GridClMan_Caption            :array[1..2] of string = ('Фіз. особа','Физ. лицо');
const GridClFIO_Caption            :array[1..2] of string = ('П. І. Б.','Ф. И. О.');
const GridClKodSmeta_Caption       :array[1..2] of string = ('Кошт.','См.');
const GridClKodDepartment_Caption  :array[1..2] of string = ('Підр.','Подр.');
const GridClKodVidOpl_Caption      :array[1..2] of string = ('ВО','ВО');
const GridClBudget_Caption         :array[1..2] of string = ('Бюджет','Бюджет');
const GridClNameVidopl_Caption     :array[1..2] of string = ('Вид операції','Вид операцмм');
const GridClKodSetup_Caption       :array[1..2] of string = ('Період','Период');
const GridClSumma_Caption          :array[1..2] of string = ('Сума','Сумма');
const GridClPercent_Caption        :array[1..2] of string = ('Відсоток','Процент');
const GridClCount_Caption          :array[1..2] of string = ('Розрахунок','Расчет');
const GridClViplata_Caption        :array[1..2] of string = ('Виплата','Выплата');
const GridClDeponir_Caption        :array[1..2] of string = ('Депонент','Депонент');
const GridClRaznoe_Caption         :array[1..2] of string = ('Різне','Разное');
const GridClFullNumberSch_Caption  :array[1..2] of string = ('Номер рахунку','Номер счета');
const GridClFullNameSch_Caption    :array[1..2] of string = ('Назва рахунку','Название счета');
const GridClKod_Caption            :array[1..2] of string = ('Код','Код');
const GridClExpense_Caption        :array[1..2] of string = ('Кількість','Количество');
const GridClNamePriv_Caption       :array[1..2] of string = ('Назва льготи','Название льготы');
const GridClFlagVipl_Caption       :array[1..2] of string = ('Сплачено','Выплачено');
const GridClNumber_Caption         :array[1..2] of string = ('Номер','Номер');
const GridClTypePayment_Caption    :array[1..2] of string = ('Тип виплати','Тип выплаты');
const GridClTypeSheet_Caption      :array[1..2] of string = ('Тип відомості','Тип ведомости');
const GridClFullNameLong_Caption   :array[1..2] of string = ('Повна назва','Полное название');
const GridClShortNameLong_Caption  :array[1..2] of string = ('Скорочена назва','Сокращенное название');
const GridClType_Caption           :array[1..2] of string = ('Тип','Тип');
const GridClFullName_Caption       :array[1..2] of string = ('Повно','Полностью');
const GridClShortName_Caption      :array[1..2] of string = ('Скорочено','Сокращенно');
const GridClNote_Caption           :array[1..2] of string = ('Примітка','Примечание');
const GridClPropertyName_Caption   :array[1..2] of string = ('Властивість','Свойство');
const GridClPropertyUse_Caption    :array[1..2] of string = ('Увімкн.','Вкл');
const GridClP1_Caption             :array[1..2] of string = ('+/-','+/-');
const GridClP1_Text_True           :array[1..2] of string = ('Нарахування','Начисления');
const GridClP1_Text_False          :array[1..2] of string = ('Утримання','Удержания');
const GridClTaxName_Caption        :array[1..2] of string = ('Податки','Налоги');
const GridClBegPeriod_Caption      :array[1..2] of string = ('Початок','Начало');
const GridClEndPeriod_Caption      :array[1..2] of string = ('Закінчення','Окончание');
const GridClBirthDate_Caption      :array[1..2] of string = ('Рік народж.','Год рожд.');
const GridClFrom_Caption           :array[1..2] of string = ('Від','От');
const GridClTo_Caption             :array[1..2] of string = ('До','До');
const GridClPercentSiqn_Caption    :array[1..2] of string = ('%','%');
const GridClPlus_Caption           :array[1..2] of string = ('+','+');
const GridClAddText_Caption        :array[1..2] of string = ('Текст для вида операції','Текст для вида оплаты');
const GridClFact_Caption           :array[1..2] of string = ('Дійсно','Отработано');
const GridClPlan_Caption           :array[1..2] of string = ('За планом','По плану');
const GridClHours_Caption          :array[1..2] of string = ('Дійсно','Отработано');
const GridClGHours_Caption         :array[1..2] of string = ('За планом','По плану');
const GridClTarif_Caption          :array[1..2] of string = ('Тариф','Тариф');
const GridClClock_Caption          :array[1..2] of string = ('Години','Часы');
const GridClDayMonth_Caption       :array[1..2] of string = ('День','День');
const GridClDolg_Caption           :array[1..2] of string = ('Борг','Долг');
const GridClMaxPercent_Caption     :array[1..2] of string = ('Найбільший процент','Наибольший процент');
const GridClPochtaPercent_Caption  :array[1..2] of string = ('Поштовий збір','Почтовый сбор');
const GridClDate_Caption           :array[1..2] of string = ('Дата','Дата');
const GridClNday_Caption           :array[1..2] of string = ('Дні','Дни');
const GridClStavkaPercent_Caption  :array[1..2] of string = ('Ст./%','Ст./%');
const GridClDateTimePrint_Caption  :array[1..2] of string = ('Дата та час друку','Дата и время печати');
const GridClSystems_Caption        :array[1..2] of string = ('Система','Система');
const GridClYesNo_Caption          :array[1..2] of string = ('Так/Ні','Да/Нет');
const GridClYear_Caption           :array[1..2] of string = ('Рік','Год');
const GridClKvartal_Caption        :array[1..2] of string = ('Квартал','Квартал');
const GridClDateCame_Caption       :array[1..2] of string = ('Прийняття','Принятие');
const GridClDateLeave_Caption      :array[1..2] of string = ('Звільнення','Увольнение');
const GridClKod1DF_Caption         :array[1..2] of string = ('Ознака доходу','Тип дохода');
const GridClLgota_Caption          :array[1..2] of string = ('Пільга','Льгота');
const GridClTerm_Caption           :array[1..2] of string = ('Період','Период');
const GridClSumNar_Caption         :array[1..2] of string = ('Нараховано','Начислено');
const GridClSumVipl_Caption        :array[1..2] of string = ('Сплачено','Выплачено');
const GridClSumUd_Caption          :array[1..2] of string = ('Утримано','Удержано');
const GridClSumPerer_Caption       :array[1..2] of string = ('Перераховано','Перечислено');
const GridClTin_Caption            :array[1..2] of string = ('Ід. код','Ид.код');
const GridClNameSovmest_Caption    :array[1..2] of string = ('Тип роботи','Тип работы');
const GridClNumberShort_Caption    :array[1..2] of string = ('№','№');
const GridClAll_Caption            :array[1..2] of string = ('Всього','Всего');
const GridClPensSum_Caption        :array[1..2] of string = ('Для пенсії','Для пенсии');
const GridClHospSum_Caption        :array[1..2] of string = ('Лікарняні','Больничные');
const GridClVznosSum_Caption       :array[1..2] of string = ('Внески','Взносы');
const GridClStaj_Caption           :array[1..2] of string = ('Стаж','Стаж');

const LabelDateCame_Caption        :array[1..2] of string = ('Дата прийняття','Дата принятия');
const LabelDateLeave_Caption       :array[1..2] of string = ('Дата звільнення','Дата увольнения');
const LabelKod1DF_Caption          :array[1..2] of string = ('Код 1ДФ','Код 1ДФ');
const LabelSumNar_Caption          :array[1..2] of string = ('Нараховано','Начислено');
const LabelSumVipl_Caption         :array[1..2] of string = ('Сплачено','Выплачено');
const LabelSumUd_Caption           :array[1..2] of string = ('Утримано','Удержано');
const LabelSumPerer_Caption        :array[1..2] of string = ('Перераховано','Перечислено');
const LabelTin_Caption             :array[1..2] of string = ('Ідентифікаційний код','Идентификационный код');
const LabelFirm_Caption            :array[1..2] of string = ('Підприємство','Предприятие');
const LabelMan_Caption             :array[1..2] of string = ('Фізична особа','Физическое лицо');
const LabelVidOpl_Caption          :array[1..2] of string = ('Вид операції','Вид операции');
const LabelDepartment_Caption      :array[1..2] of string = ('Підрозділ','Подразделение');
const LabelSmeta_Caption           :array[1..2] of string = ('Кошторис','Смета');
const LabelCategory_Caption        :array[1..2] of string = ('Категорія','Категория');
const LabelPeriod_Caption          :array[1..2] of string = ('Період','Период');
const LabelDepDate_Caption         :array[1..2] of string = ('Дата актуальності довідника','Дата актуальности справочника');
const LabelPrikaz_Caption          :array[1..2] of string = ('Наказ','Приказ');
const LabelSumma_Caption           :array[1..2] of string = ('Сума','Сумма');
const LabelMin_Caption             :array[1..2] of string = ('Мінімум','Минимум');
const LabelMax_Caption             :array[1..2] of string = ('Максимум','Максимум');
const LabelPercent_Caption         :array[1..2] of string = ('Відсоток','Процент');
const LabelAddSumma_Caption        :array[1..2] of string = ('Сума, що додається','Сумма для добавления');
const LabelAddTextForVO_Caption    :array[1..2] of string = ('Текст для відображення з видом оплати','Текст для отображения с видом оплаты');
const LabelTypePayment_Caption     :array[1..2] of string = ('Оплата','Оплата');
const LabelManMoving_Caption       :array[1..2] of string = ('Посадове переміщення','Должностное перемещение');
const LabelWaitData_Caption        :array[1..2] of string = ('Зачекайте, йде відбір даних!','Подождите, идет отбор данных!');
const LabelDateBeg_Caption         :array[1..2] of string = ('Початок','Начало');
const LabelDateEnd_Caption         :array[1..2] of string = ('Закінчення','Окончание');
const LabelSender_Caption          :array[1..2] of string = ('Одержувач','Получатель');
const LabelAdress_Caption          :array[1..2] of string = ('Адреса','Адрес');
const LabelDocument_Caption        :array[1..2] of string = ('Підстава','Основание');
const LabelMaxPercent_Caption      :array[1..2] of string = ('Найбільший процент','Наибольший процент');
const LabelDolg_Caption            :array[1..2] of string = ('Борг','Долг');
const LabelPochtaPercent_Caption   :array[1..2] of string = ('Поштовий збір','Почтовый сбор');
const LabelPrivilege_Caption       :array[1..2] of string = ('Пільга','Льгота');
const LabelExpense_Caption         :array[1..2] of string = ('Кількість','Количество');
const LabelKod_Caption             :array[1..2] of string = ('Код','Код');
const LabelFIO_Caption             :array[1..2] of string = ('П.І.Б.','Ф.И.О.');
const LabelTn_Caption              :array[1..2] of string = ('Табельний номер','Табельний номер');
const LabelName_Caption            :array[1..2] of string = ('Назва','Название');
const LabelNameShort_Caption       :array[1..2] of string = ('Скорочена назва','Сокращенное название');
const LabelNameFull_Caption        :array[1..2] of string = ('Повна назва','Полное название');
const LabelMinAmount_Caption       :array[1..2] of string = ('Найменша можлива кількість','Минимальное количество');
const LabelMaxAmount_Caption       :array[1..2] of string = ('Найбільша можлива кількість','Максимальное количество');
const LabelKoefficient_Caption     :array[1..2] of string = ('Коефіціент','Коэффициент');
const LabelAvgSum_Caption          :array[1..2] of string = ('Середня сума','Средняя сумма');
const LabelByDays_Caption          :array[1..2] of string = ('По днях','По дням');
const LabelByHours_Caption         :array[1..2] of string = ('По годинах','По часам');
const LabelMonth_Caption           :array[1..2] of string = ('Місяць','Месяц');
const LabelYear_Caption            :array[1..2] of string = ('Рік','Год');
const LabelHours_Caption           :array[1..2] of string = ('Години','Часы');
const LabelDays_Caption            :array[1..2] of string = ('Дні','Дни');
const LabelNotFilter_Caption       :array[1..2] of string = ('Без фільтра','Без фильтра');
const LabelKvartal_Caption         :array[1..2] of string = ('Квартал','Квартал');
const LabelPachka_Caption          :array[1..2] of string = ('Пачка','Пачка');
const LabelNote_Caption            :array[1..2] of string = ('Примітка','Примечание');
const LabelType_Caption            :array[1..2] of string = ('Тип','Тип');
const LabelNotTinPeople_Caption    :array[1..2] of string = ('Що відмовились від ід. кода','Которые отказались от ид. кода');

const LabelOkpo_Caption            :array[1..2] of string = ('ОКПО','ОКПО');
const LabelCntShtat_Caption        :array[1..2] of string = ('Працюючих в штаті','Работающтх в штате');
const LabelCntSovmest_Caption      :array[1..2] of string = ('Сумісників','Совместителей');
const LabelCity_Caption            :array[1..2] of string = ('Місто','Город');
const LabelDirector_Caption        :array[1..2] of string = ('Директор','Директор');
const LabelGlavBuhg_Caption        :array[1..2] of string = ('Головний бухгалтер','Главный бухгалтер');
const LabelTel_Caption             :array[1..2] of string = ('Телефон','Телефон');
const LabelPost_Caption            :array[1..2] of string = ('Посада','Должность');

const LabelWorker_Caption          :array[1..2] of string = ('Працівник','Робочий');
const LabelStud_Caption            :array[1..2] of string = ('Студент','Студент');

const PanelDockProperty_Caption    :array[1..2] of string = ('Властивості','Свойства');

const BarMainButtons_Caption       :array[1..2] of string = ('Головна','Главная');

const ComboNameFields_Hint         :array[1..2] of string = ('Оберіть колонку для пошуку','Выберите колонку для поиска');
const ComboNameFields_Caption      :array[1..2] of string = ('Колонка','Колонка');
const BarEditLocate_Hint           :array[1..2] of string = ('Наберіть текст для пошуку','Наберите текст для поиска');
const BarEditLocate_Caption        :array[1..2] of string = ('Текст','Текст');

const MonthesList_Text             :array[1..2] of string = ('Січень'+#13+'Лютий'+#13+'Березень'+#13+
                                                             'Квітень'+#13+'Травень'+#13+'Червень'+#13+
                                                             'Липень'+#13+'Серпень'+#13+'Вересень'+#13+
                                                             'Жовтень'+#13+'Листопад'+#13+'Грудень',
                                                             'Январь'+#13+'Февраль'+#13+'Март'+#13+
                                                             'Апрель'+#13+'Май'+#13+'Июнь'+#13+
                                                             'Июль'+#13+'Август'+#13+'Сентябрь'+#13+
                                                             'Октябрь'+#13+'Ноябрь'+#13+'Декабрь');

const ZeFileNotExist_Text                 :array[1..2] of string = ('Файл не існує','Файл не существует');
const ZeFieldNotExist_Text                :array[1..2] of string = ('Колонка не існує','Колонка не существует');
const ZePrikaz_ErrorText                  :array[1..2] of string = ('Не введено підставу','Не введеено основание');
const ZeInputError_Caption                :array[1..2] of string = ('Помилка ввода','Ошибка ввода');
const ZeManMoving_NotAvailable_Text       :array[1..2] of string = ('Не можливо обрати'+#13+'посадове переміщення!!!',
                                                              'Не возможно выбрать'+#13+'должность и подразделение!!!');
const ZeInputTerms_ErrorText              :array[1..2] of string = ('Початок терміна дії має'+#13+'бути меншим за закінчення!',
                                                             'Дата началя срока действия должна'+#13+'быть меньше даты окончания!');
const ZeInputKodSetups_ErrorText          :array[1..2] of string = ('Початок має бути меншим за закінчення!',
                                                                    'Начало должно быть меньше окончания!');

const ZeInputErrorAddSum_Text             :array[1..2] of string = ('Сума, що додається має'+#13+'бути меншою за мінімальну!',
                                                                    'Сумма для добавления должна'+#13+'быть меньше минимума');
const ZeInputErrorMinMax_Text             :array[1..2] of string = ('Мінімум має бути меншим за максимум!',
                                                                    'Минимум должне быть меньне максимума!');
const ZeNotInputData_Error_Text           :array[1..2] of string = ('Необхідно ввести данні','Необходимо ввести данные');
const ZeInputProp_Error_Text              :array[1..2] of string = ('Необхідно обрати властивість','Необходимо выбрать свойство');
const ZeInputDocument_Error_Text          :array[1..2] of string = ('Не введено підставу','Не введенео основание');
const ZeInputDolg_Error_Text              :array[1..2] of string = ('Не введено борг','Не введен долг');
const ZeInputPercent_Error_Text           :array[1..2] of string = ('Не введено процент сплати','Не введен процент');
const ZeInputMaxPercent_Error_Text        :array[1..2] of string = ('Не введено можливий процент','Не введен наибольший возможный процент');
const ZeInputPochtaPercent_Error_Text     :array[1..2] of string = ('Не введено поштовий процент','Не введен почтовый сбор');
const ZeInputSender_Error_Text            :array[1..2] of string = ('Не вказано особу - одержувача','Не указан адресат');
const ZeInputAddress_Error_Text           :array[1..2] of string = ('Не вказано адресу','Ну указан адрес');
const ZeInputPercents_Error_Text          :array[1..2] of string = ('Не вірно вказано проценти','Не правильно введены проценты');
const ZeInputPrivilege_Error_Text         :array[1..2] of string = ('Не вказано льготу','Не выбрана льгота');
const ZeInputExpense_Error_Text           :array[1..2] of string = ('Не вказано кількість','Не указано количество');
const ZePrintShablonNotFound_Error_Text   :array[1..2] of string = ('Не знайдено шаблон для друку!','Не найденн шаблон для печати!');

const ManInput_ErrorText                  :array[1..2] of string = ('Не обрано фізичну особу','Не выбрано физическое лицо');
const MonthInput_ErrorText                :array[1..2] of string = ('Не обрано місяць','Не выбран месяц');
const YearInput_ErrorText                 :array[1..2] of string = ('Помилка вводу року','Ошибка ввода года');
const SummaInput_ErrorText                :array[1..2] of string = ('Не введено суму','Не введена сумма');
const CategoryInput_ErrorText             :array[1..2] of string = ('Не обрано категорію','Не выбрана категория');
const VidOplInput_ErrorText               :array[1..2] of string = ('Не обрано вид операції','Не выбран вид оплаты');
const DepartmentInput_ErrorText           :array[1..2] of string = ('Не обрано підрозділ','Не выбрано подразделение');
const SmetaInput_ErrorText                :array[1..2] of string = ('Не обрано кошторис','Не выбрана смета');


const NonSpisok_Caption            :array[1..2] of string = ('Склад поза списком','Внесписочный состав');

const ReeVed_Caption               :array[1..2] of string = ('Реєстри відомостей','Реестры ведомостей');
const ReeVed_PrintVedOpl_Caption   :array[1..2] of string = ('Відомость','Ведомость');
const ReeVed_PrintReeVed_Caption   :array[1..2] of string = ('Відомості реєстра','Ведомости реестра');
const ReeVed_PrintSvodRee_Caption  :array[1..2] of string = ('Платіжна відомость','Платежная ведомость');
const ReeVed_Control_Caption       :array[1..2] of string = ('Додавання реєстра','Добавление реестра');
const ReeVed_VedToAdd_Caption      :array[1..2] of string = ('Додавання відомостей до реєстру','Добавление ведомостей в реестр');
const ReeVeds_Text                 :array[1..2] of string = ('Реєстри',   'Реестры');
const SheetPeopleData_Text         :array[1..2] of string = ('Показники фізичної особи','Данные физического лица');
const SheetData_Text               :array[1..2] of string = ('Показники відомостей','Данные ведомостей');
const ReeVed_Text                  :array[1..2] of string = ('Реєстр',   'Реестр');
const Sheet_Text                   :array[1..2] of string = ('Відомість','Ведомость');


const RefreshSKR_Caption           :array[1..2] of string = ('Відновлення СКР','Обновление карточных счетов');
const LabelBank_Caption            :array[1..2] of string = ('Банк','Банк');
const LabelFile_Caption            :array[1..2] of string = ('Файл для відновлення','Файл для обновления');

const Monthes_Const                :array[1..2] of string = ('Місяців','Месяцев');
const EveryMonth_Const             :array[1..2] of string = ('Єжемісячно','Ежемесячно');

const Sp_Department_Caption        :array[1..2] of string = ('Довідник підрозділів','Справочник подразделений');

const Itogo_Caption                :array[1..2] of string = ('Всього','Итого');


//******************************************************************************
const ZAuthor_Caption              :array[1..2] of string = ('Про авторів','Об авторах');
const ZAuthor_LabelProgrammer_Text :array[1..2] of string = ('Розробники: Сєров О.М., Яцишин О.І.','Разработчики: Серов А.Н., Збуривский Д.');
const ZAuthor_LabelPostanov_Text   :array[1..2] of string = ('Постановник: Прігунов О.В.','Постановщик: Пригунов А.В.');
const ZAuthor_LabelPeriod_Text     :array[1..2] of string = ('2004-2005 рр.','2004-2005 гг.');
const ZAuthor_LabelFirm_Text       :array[1..2] of string = ('Донецький Національний університет','Донецкий Национальный университет');

//******************************************************************************
const ZTaxes_Caption               :array[1..2] of string = ('Ведення податків','Ведение налогов');
const ZTaxesTerms_Caption_Insert   :array[1..2] of string = ('Додавання періоду актуальності правил утримання податків',
                                                             'Добавление периода актуальности правил удержания налогов');
const ZTaxesTerms_Caption_Update   :array[1..2] of string = ('Коригування періоду актуальності правил утримання податків',
                                                             'Изменение периода актуальности правил удержания налогов');
const ZTaxesTerms_Caption_Delete   :array[1..2] of string = ('Видалення періоду',
                                                             'Удаление периода');
const ZTaxesTerms_Caption_Detail   :array[1..2] of string = ('Перегляд періоду актуальності правил утримання податків',
                                                             'Просмотр периода актуальности правил удержания налогов');
const ZTaxNets_Caption_Insert      :array[1..2] of string = ('Додавання правила утримання',
                                                             'Добавление правила удержания');
const ZTaxNets_Caption_Update      :array[1..2] of string = ('Коригування правила утримання',
                                                             'Изменение правила удержания');
const ZTaxNets_Caption_Delete      :array[1..2] of string = ('Видалення правила',
                                                             'Удаление правила');
const ZTaxNets_Caption_Detail      :array[1..2] of string = ('Перегляд правила утримання',
                                                             'Просмотр правила удержания');

//******************************************************************************
const ZCurrent_Caption             :array[1..2] of string = ('Поточні операції',
                                                             'Текущие операции');
const ZCurrent_CheckBoxFilterOperation_Caption :array[1..2] of string = ('Фільтрувати операції',
                                                             'Фильтровать операции');

const ZCurrentCtrl_Caption_Insert  :array[1..2] of string = ('Додавання операції',
                                                             'Добавление операции');
const ZCurrentCtrl_Caption_Update  :array[1..2] of string = ('Редагування операції',
                                                             'Изменение операции');
const ZCurrentCtrl_Caption_Delete  :array[1..2] of string = ('Видалення операції',
                                                             'Удаление операции');
const ZCurrentCtrl_Caption_Detail  :array[1..2] of string = ('Перегляд операції',
                                                             'Просмотр операции');
const ZCurrentLineView_Filter_Caption :array[1..2] of string = ('Встановити/відмінити фільтр по кількості операцій у фізичної особи',
                                                                'Установить/отменить фильтр по количеству операций у физического лица');

//******************************************************************************
const ZRemont_Caption              :array[1..2] of string = ('Що отримують ремонтні','Получающие ремонтные');
const ZRemont_Caption_Short        :array[1..2] of string = ('Ремонтні','Ремонтные');

//******************************************************************************
const ZDedConst_Caption            :array[1..2] of string = ('Постійні утримання',
                                                             'Постоянные удержания');
const ZDedConstCtrl_Caption_Insert :array[1..2] of string = ('Додавання утримання',
                                                             'Добавление удержания');
const ZDedConstCtrl_Caption_Update :array[1..2] of string = ('Редагування утримання',
                                                             'Изменение удержания');
const ZDedConstCtrl_Caption_Delete :array[1..2] of string = ('Видалення утримання',
                                                             'Удаление удержания');
const ZDedConstCtrl_Caption_Detail :array[1..2] of string = ('Перегляд утримання',
                                                             'Просмотр удержания');


//******************************************************************************

const ZManHosp_Caption        :array[1..2] of string = ('Листs непрацездатності',
                                                             'Больничные листы');
const ZManHosp_Caption_Insert :array[1..2] of string = ('Додавання листа непрацездатності',
                                                             'Добавление больничного листа');
const ZManHosp_Caption_Update :array[1..2] of string = ('Редагування листа непрацездатності',
                                                             'Изменение больничного листа');
const ZManHosp_Caption_Delete :array[1..2] of string = ('Видалення листа непрацездатності',
                                                             'Удаление больничного листа');
const ZManHosp_Caption_Detail :array[1..2] of string = ('Перегляд листа непрацездатності',
                                                             'Просмотр больничного листа');

//******************************************************************************
const ZLoan_Caption             :array[1..2] of string = ('Бравших ссуду',
                                                          'Бравших ссуду');
const ZLoanCtrl_Caption_Insert  :array[1..2] of string = ('Додавання ссуди',
                                                          'Добавление ссуди');
const ZLoanCtrl_Caption_Update  :array[1..2] of string = ('Редагування ссуди',
                                                          'Изменение ссуди');
const ZLoanCtrl_Caption_Delete  :array[1..2] of string = ('Видалення ссуди',
                                                          'Удаление ссуди');
const ZLoanCtrl_Caption_Detail  :array[1..2] of string = ('Перегляд ссуди',
                                                          'Просмотр ссуди');
//******************************************************************************
const ZDopNach_Caption             :array[1..2] of string = ('Додаткові нарахування',
                                                             'Дополнительные начисления');
const ZDopNachCtrl_Caption_Insert  :array[1..2] of string = ('Додавання нарахування',
                                                             'Добавление начисления');
const ZDopNachCtrl_Caption_Update  :array[1..2] of string = ('Редагування нарахування',
                                                             'Изменение начисления');
const ZDopNachCtrl_Caption_Delete  :array[1..2] of string = ('Видалення нарахування',
                                                             'Удаление удержания');
const ZDopNachCtrl_Caption_Detail  :array[1..2] of string = ('Перегляд начисления',
                                                             'Просмотр начисления');

//******************************************************************************
const ZPeopleProp_Caption          :array[1..2] of string = ('Властивості фізичних осіб',
                                                             'Свойства физических лиц');
const ZPeoplePropCtrl_Caption_Insert :array[1..2] of string = ('Додавання властивості',
                                                               'Добавление свойства');
const ZPeoplePropCtrl_Caption_Update :array[1..2] of string = ('Редагування властивості',
                                                               'Изменение свойства');
const ZPeoplePropCtrl_Caption_Delete :array[1..2] of string = ('Видалення властивості',
                                                               'Удаление свойства');

const ZPeopleWorkModeCtrl_Caption_Delete :array[1..2] of string = ('Видалення режиму роботи',
                                                               'Удаление режима работы');


const ZPeoplePropCtrl_Caption_Detail :array[1..2] of string = ('Перегляд властивості',
                                                               'Просмотр свойства');

//******************************************************************************
const ZAlimony_Caption               :array[1..2] of string = ('Аліменти та інші вик.листи',
                                                               'Алименты и другие исполн.листы');
const ZAlimonyCtrl_Caption_Insert    :array[1..2] of string = ('Додавання даних про аліменти та інші вик.листи',
                                                               'Добавление данных по алиментам и другие исполн.листы');
const ZAlimonyCtrl_Caption_Update    :array[1..2] of string = ('Редагування даних про аліменти та інші вик.листи',
                                                               'Изменение данных по алиментам и другие исполн.листы');
const ZAlimonyCtrl_Caption_Delete    :array[1..2] of string = ('Видалення даних про аліменти та інші вик.листи',
                                                               'Удаление данных по алиментам и другие исполн.листы');
const ZAlimonyCtrl_Caption_Detail    :array[1..2] of string = ('Перегляд даних про аліменти та інші вик.листи',
                                                               'Просмотр данных по алиментам и другие исполн.листы');

//******************************************************************************
const ZPeoplePriv_Caption            :array[1..2] of string = ('Що мають пільги','Льготники');
const ZPeoplePrivCtrl_Caption_Insert :array[1..2] of string = ('Додавання даних по льготам','Добавление данных о льготах');
const ZPeoplePrivCtrl_Caption_Update :array[1..2] of string = ('Редагування даних по льготам','Изменение данных о льготах');
const ZPeoplePrivCtrl_Caption_Delete :array[1..2] of string = ('Видалення даних по льготам','Удаление данных о льготах');
const ZPeoplePrivCtrl_Caption_Detail :array[1..2] of string = ('Перегляд даних по льготам','Просмотр данных о льготах');

//******************************************************************************
const ZSp_Privilege_Caption          :array[1..2] of string = ('Довідник пільг','Справочник льгот');
const ZSp_Privilege_Caption_Insert   :array[1..2] of string = ('Додавання пільги','Добавление льготы');
const ZSp_Privilege_Caption_Update   :array[1..2] of string = ('Редагування пільги','Изменение льготы');
const ZSp_Privilege_Caption_Delete   :array[1..2] of string = ('Вилучення пільги','Удаление льготы');
const ZSp_Privilege_Caption_Detail   :array[1..2] of string = ('Перегляд пільги','Просмотр льготы');
//******************************************************************************
const ZInvalid_Caption               :array[1..2] of string = ('Перелік інвалідів','Список инвалидов');
//******************************************************************************
const ZNonSpisok_Caption             :array[1..2] of string = ('Склад поза списком','Внесписочный состав');

const ZOptionsSvod_Caption           :array[1..2] of string = ('Звітні документи','Сводные документы');

const Svods_Caption                  :array[1..2] of string = ('Звіти','Своды');
const Svods_docs_Caption             :array[1..2] of string = ('Загальна звітність','Общие своды');
const Reestrs_Caption                :array[1..2] of string = ('Реєстри','Реестры');
const Reestrs_docs_Caption           :array[1..2] of string = ('Звітність за рахунками','Отчетность по счетам');

const RaschVed_Caption               :array[1..2] of string = ('Загальна','Общая');

const SvodBySch_Caption              :array[1..2] of string = ('Звіт про нарахування та утримання (Загальний)','По счетам (общая форма)');
const SvodBySchNP7_Caption           :array[1..2] of string = ('Звіт про нарахування та утримання (форма № П-7)','По счетам (форма № П-7');
const SvodByFot_Caption              :array[1..2] of string = ('Довідка по ФОП та іншим виплатам','Справка по ФОП и другим выплатам');
const SvodByFod_Caption              :array[1..2] of string = ('Фактичний місячний фонд оплати доходу','Фактический месячный фонд оплаты дохода');
const SvodByDep_Caption              :array[1..2] of string = ('По підрозділам','По подразделениям');

const ReestrHospLists_Caption        :array[1..2] of string = ('Реєстр лікарняних листів','Реестр больничных листов');
const ReestrHospLists_docs_Caption   :array[1..2] of string = ('Реєстр листів тимчасової непрацездатності','Реестр листов временной нетрудоспособности');
const ReestrHospListsByTn_Caption    :array[1..2] of string = ('За табельними номерами','по табельным номерам');
const ReestrHospListsByDep_Caption   :array[1..2] of string = ('За підрозділами','По подразделениям');
const ReestrDuty_Caption             :array[1..2] of string = ('Реєстр боргів','Реестр долгов');
const ReestrDodPlat_Caption          :array[1..2] of string = ('Реєстр додаткових платежів','Реестр дополнительных платежей');
const ReestrStrah_Caption            :array[1..2] of string = ('Реєстр страхових внесків','Реестр стаховых взносов');
const ReestrAlimony_Caption          :array[1..2] of string = ('Реєстр аліментів та інших вик. листів','Реестр алиментов и других исполн. листов');
const ReestrOtherUd_Caption          :array[1..2] of string = ('Реєстр інших утримань','Реестр других удержаний');
const ReestrPensFond_Caption         :array[1..2] of string = ('Реєстр внесків до пенсійного фонду','Реестр взносов в пенсионный фонд');
const ReestrPFU_Caption              :array[1..2] of string = ('Реєстр відрахувань до ПФУ ','Реестр отчислений в ПФУ');
const ReestrMoreSum_Caption          :array[1..2] of string = ('Реєстр інвалідів','Реестр превышения отчислений');
const ReestrInvalid_Caption          :array[1..2] of string = ('Реєстр інвалідів','Реестр инвалидов');
const ReestrPererah_Caption          :array[1..2] of string = ('Реєстр перерахунків','Реестр пересчетов');
const ReestrCredit_Caption           :array[1..2] of string = ('Реєстр утримання кредитів','Реестр удержания кредитов');
const ReeAccrualSingle_Caption       :array[1..2] of string = ('Реєстр нарахувань ЄСВ (Узагальнений)','Реестр начислений единого с. в.');
const ReeAccrualSingleForMan_Caption        :array[1..2] of string = ('Реєстр нарахувань ЄСВ (За працівниками)','Реестр начислений единого с. в. по сотрудникам');
const ReeAccrualSingleForManAll_Caption     :array[1..2] of string = ('Усі','Все');
const ReeAccrualSingleForManInvalid_Caption :array[1..2] of string = ('Що мають інвалідність','По инвалидам');
const ReeAccrualSingleForManOwer_Caption    :array[1..2] of string = ('Що мають перевищення','Которые имеют превышения');

const Full_Const                     :array[1..2] of string = ('Повністю','Полностью');
const Short_Const                    :array[1..2] of string = ('Скорочено','Сокращенно');
const ByHours_Const                  :array[1..2] of string = ('По годинах','По часам');
const Average_Const                  :array[1..2] of string = ('Середнє','Среднее');
const PrevPeriod_Const               :array[1..2] of string = ('Попередній період','Предыдущий период');
const CorrectSvod_Const              :array[1..2] of string = ('Коригування звіту','Корректировка свода');
const OfPeople_Const                 :array[1..2] of string = ('Осіб','Людей');
const OfRecords_Const                :array[1..2] of string = ('Записів','Записей');
const Reestr_Const                   :array[1..2] of string = ('Реєстр','Реестр');
const Ostatok_Const                  :array[1..2] of string = ('Залишок','Остаток');
const NotFilter_Const                :array[1..2] of string = ('Без фільтра','Без фильтра');
const SumMoreNull_Const              :array[1..2] of string = ('Сума > 0','Сума > 0');
const SumLessNull_Const              :array[1..2] of string = ('Сума < 0','Сума < 0');
const SumEqualNull_Const             :array[1..2] of string = ('Сума = 0','Сума = 0');
const SumIsNull_Const                :array[1..2] of string = ('Сума - пусте значення','Сума - пустоё значение');
const Acc_Const                      :array[1..2] of string = ('Рохрахунок','Расчёт');
const Sheets_Const                   :array[1..2] of string = ('Відомості','Ведомости');

const FRaschVed_SelDepartment_Caption:array[1..2] of string = ('Оберіть підрозділ для формування розрахункових відомостей',
                                                               'Выберите подразделение для формирования расчетных ведомостей');

const DatesAcc_Saves_Caption         :array[1..2] of string = ('Показники за попередні періоди',
                                                               'Данные за предыдущие периоды');
const DatesAcc_NotSaves_Caption      :array[1..2] of string = ('Показники останнього розрахунка поточного періода',
                                                               'Данные последнего расчета текущего периода');

const SelectRecordForCorrectSvod_Const :array[1..2] of string = ('Оберіть запис для коригування звіту','Выберите запись для корректирования свода');


//******************************************************************************
const FUV_RefreshSkr_FieldNames_Caption               :array[1..2] of string = ('Назви полів','Названия полей');
const FUV_RefreshSkr_FieldNamesTin_Caption            :array[1..2] of string = ('Ідентифікаційний номер','Идентификационый номер');
const FUV_RefreshSkr_FieldNamesAcctCard_Caption       :array[1..2] of string = ('Картковий рахунок','Карточный счет');
const FUV_RefreshSkr_FieldNamesTin_NotInput_Text      :array[1..2] of string = ('Не введено назву поля:'+#13+'Ідентифікаційний номер!',
                                                                                'Не введено название поля:'+#13+'Идентификационый номер');
const FUV_RefreshSkr_FieldNamesAcctCard_NotInput_Text :array[1..2] of string = ('Не введено назву поля:'+#13+'Картковий рахунок',
                                                                                'Не введено название поля:'+#13'Карточный счет');

const Label_Acct_Card                                 :array[1..2] of string = ('Картковий рахунок','Карточный счет');
const ETypePayment_NotSelect_Text                     :array[1..2] of string = ('Не обрано тип виплати','Не выбран тип выплаты');

const FRefreshSKR_CheckBoxNewFieldsDBFtable_Caption   :array[1..2] of string = ('Задати назви полів у DBF-таблиці',
                                                                                'Задать названия полей в DBF-таблице');
const SvodOtchislen_Caption                           :array[1..2] of string = ('Звіт відрахувань',
                                                                                'Свод отчислений');

const ArhivPrintedSheet_Caption                       :array[1..2] of string = ('Друк відомостей',
                                                                                'Печать ведомостей');

const ZSetup_Caption                                  :array[1..2] of string = ('Картка організації',
                                                                                'Карта организации');


//Vidopl
 SpravPropVidOplBtn_Caption                           :array[1..2] of string = ('Властивості','Свойства');
 SpravGroupVidOplPropBtn_Caption                      :array[1..2] of string = ('Групи властивостей','Группы свойств');
 SpravTypeVidOplPropBtn_Caption                       :array[1..2] of string = ('Типи видів оплат для друку','Типы видов оплат для печати'); 
 SpravGroupVidOplBtn_Caption                          :array[1..2] of string = ('Групи видів оплат','Группы видов операций');
 TabSheetNar_Caption                                  :array[1..2] of string = ('Нарахування','Начисления');
 TabSheetUd_Caption                                   :array[1..2] of string = ('Утримання','Удержания');
 TabSheetCorespond_Caption                            :array[1..2] of string = ('Кореспонденція','Кореспонденция');
 TabSheetConstsVo_Caption                             :array[1..2] of string = ('Константи системи','Константы системы');
 UpdateAllBtn_Caption                                 :array[1..2] of string = ('Редагувати','Редактировать');
 LocateResult_Caption                                 :array[1..2] of string = ('Пошук','Поиск');
 LocateResult_NotLocateText                           :array[1..2] of string = ('Нічого не знайдено','Ничего не найдено');

//FVOLocate
 FVOLocate_Caption                                    :array[1..2] of string = ('Пошук','Поиск');
 FVOLocate_RadioGroupTypeLocate_Caption               :array[1..2] of string = ('По','По');
 FVOLocate_GroupBoxLocate_Caption                     :array[1..2] of string = ('Текст','Текст');
 FVOLocate_RadioGroupTypeLocate_Text1                 :array[1..2] of string = ('Назва ВО','Название ВО');
 FVOLocate_RadioGroupTypeLocate_Text2                 :array[1..2] of string = ('Код ВО','Код ВО');
 FVOLocate_RadioGroupTypeLocate_Text3                 :array[1..2] of string = ('Константа','Константа');

// FCorespondEdit
 FCorespondEdit_Caption                               :array[1..2] of string = ('Редагування кореспонденції','Изменение корреспонденции');
 FCorespondEdit_LabelVidOplName_Caption               :array[1..2] of string = ('Вид оплати','Вид оплаты');
 FCorespondEdit_LabelCorespond_Caption                :array[1..2] of string = ('Назва кореспонденції','Название корреспонденции');

//FVoplIniGroupControl
 FVoplIniGroupControl_Caption_Insert_Group             :array[1..2] of string = ('Додавання групи для властивостей','Добавление группы свойств');
 FVoplIniGroupControl_Caption_Update_Group             :array[1..2] of string = ('Редагування групи для властивостей','Изменение группы свойств');
 FVoplIniGroupControl_Caption_Delete_Group             :array[1..2] of string = ('Вилучення групи для властивостей','Удаление шруппы свойств');
 FVoplIniGroupControl_Caption_Insert_Prop              :array[1..2] of string = ('Додавання властивості','Добавление свойства');
 FVoplIniGroupControl_Caption_Update_Prop              :array[1..2] of string = ('Редагування властивості','Изменение свойства');
 FVoplIniGroupControl_Caption_Delete_Prop              :array[1..2] of string = ('Вилучення властивості','Удаление свойства');
 FVoplIniGroupControl_LabelFullName_Caption            :array[1..2] of string = ('Назва','Название');

 //FZSp_VidOpl
 FZSp_VidOpl_Caption                                   :array[1..2] of string = ('Довідник видів оплат','Справочник видов оплат');
 FZSp_VidOpl_GridColumnVidOpl_Name_Caption             :array[1..2] of string = ('Назва','Название');
 FZSp_VidOpl_GridColumnOptionsName_Caption             :array[1..2] of string = ('Властивість','Свойство');
 FZSp_VidOpl_GridColumnOptionsUse_Caption              :array[1..2] of string = ('У дії','Вкл.');
 FZSp_VidOpl_GridColumnOptionsGroup_Caption            :array[1..2] of string = ('Група','Группа');
 FZSp_VidOpl_GridColumnOptionsNameGroup_Caption        :array[1..2] of string = ('Група','Группа');
 FZSp_VidOpl_DockPanelGridOptions_Caption              :array[1..2] of string = ('Властивості','Свойства');
 FZSp_VidOpl_GridColumnVidOplNachisl_Caption           :array[1..2] of string = ('Начислення','Начисления');
 FZSp_VidOpl_GridColumnVidOplCash_Caption              :array[1..2] of string = ('Грошовий','Денежный');
 FZSp_VidOpl_GridColumnVidOplKod_Caption               :array[1..2] of string = ('Код','Код');
 FZSp_VidOpl_GridColumnVidOplGroup_Caption             :array[1..2] of string = ('Група','Группа');

 FZSp_VidOpl_GridCorColumnNameProp_Caption             :array[1..2] of string = ('Тип кореспонденції','Тип корреспондеции');
 FZSp_VidOpl_GridConstsColumnNameProp_Caption          :array[1..2] of string = ('Назва константи','Название константы');

 FZSp_VidOpl_LabelTipNach_Caption                      :array[1..2] of string = ('Тип нарахування:','Тип начисления');
 FZSp_VidOpl_LabelTipFund_Caption                      :array[1..2] of string = ('Фонд:','Фонд:');
 FZSp_VidOpl_LabelDateBeg_Caption                      :array[1..2] of string = ('Початок:','Начало:');
 FZSp_VidOpl_LabelDateEnd_Caption                      :array[1..2] of string = ('Закінчення:','окончание:');
 FZSp_VidOpl_SaveChanges_Caption                       :array[1..2] of string = ('Збереження','Сохранение');
 FZSp_VidOpl_SaveChanges_Text1                         :array[1..2] of string = ('Деякі властивості вида оплати:'+#13,'Некоторые свойства вида оплат:'+#13);
 FZSp_VidOpl_SaveChanges_Text2                         :array[1..2] of string = (#13+'було змінено. Зберегти?',#13+'были изменены. Сохранить?');

 //ZFVidOplControl
 ZFVidOplControl_Caption_Insert                        :array[1..2] of string = ('Додавання виду оплати','Добавление вида оплаты');
 ZFVidOplControl_Caption_Update                        :array[1..2] of string = ('Редагування виду оплати','Изменение вида оплаты');
 ZFVidOplControl_Caption_Delete                        :array[1..2] of string = ('Вилучення виду оплати','Удаление вида оплаты');
 ZFVidOplControl_IdentificatonBox_Caption              :array[1..2] of string = ('Вид оплати','Вид оплаты');
 ZFVidOplControl_OptionsBox_Caption                    :array[1..2] of string = ('Властивості','Свойства');
 ZFVidOplControl_NameLabel_Caption                     :array[1..2] of string = ('Назва:','Название:');
 ZFVidOplControl_KodLabel_Caption                      :array[1..2] of string = ('Код:','Код:');
 ZFVidOplControl_Kod1dfLabel_Caption                   :array[1..2] of string = ('Код 1ДФ:','Код 1ДФ:');
 ZFVidOplControl_CheckCash_Caption                     :array[1..2] of string = ('Грошовий вид','Денежный тип');
 ZFVidOplControl_CheckNachisl_Caption                  :array[1..2] of string = ('Начислення','Начисление');
 ZFVidOplControl_TypeNachislLabel_Caption              :array[1..2] of string = ('Тип начислення:','Тип начисления');
 ZFVidOplControl_TypeFundLabel_Caption                 :array[1..2] of string = ('Тип фонду:','Тип фонда:');
 ZFVidOplControl_PeriodBox_Caption                     :array[1..2] of string = ('Термін дії','Срок действия');
 ZFVidOplControl_DateBegLabel_Caption                  :array[1..2] of string = ('Початок:','Начало:');
 ZFVidOplControl_DateEndLabel_Caption                  :array[1..2] of string = ('Заккінчення:','Окончание:');
 ZFVidOplControl_LabelGroup_Caption                    :array[1..2] of string = ('Группа для відображення:','Группа для отображения');

 //1Дф
 f1Df_Caption                                          :array[1..2] of string = ('Форма 1ДФ','Форма 1ДФ');
 FSpAsupIniWorkReason_Caption                          :array[1..2] of string = ('Довідник переміщень','Справочник перемещений');
 //FZ_Vopl_Filter
 FZ_Vopl_Filter_Caption                                :array[1..2] of string = ('Довідник груп видів оплат','Справочник групп видов оплат');
 FZ_Vopl_Filter_GridColumnName_Caption                 :array[1..2] of string = ('Назва групи','Название группы');

 //VoplFilterControl
 VoplFilterControl_Caption_Insert                      :array[1..2] of string = ('Додавання групи','Добавление группы');
 VoplFilterControl_Caption_Update                      :array[1..2] of string = ('Редагування групи','Редактирование группы');
 VoplFilterControl_LabelFullName_Caption               :array[1..2] of string = ('Назва групи:','Название группы:');

 //VoplPropControlForm_
 VoplPropControlForm_Caption                           :array[1..2] of string = ('Редагування властивостей','Редактирование свойств');
 VoplPropControlFormTreeListColumnName_Caption         :array[1..2] of string = ('Властивость','Свойство');
 VoplPropControlFormTreeListColumnUse_Caption          :array[1..2] of string = ('Користування','Использование');

 //FZ_Vopl_Prop
 FZ_Vopl_Prop_Caption                                  :array[1..2] of string = ('Довідник властивостей видів оплат','Справочник свойств видов оплат');
 FZ_Vopl_Prop_GridColumnName_Caption                   :array[1..2] of string = ('Назва властивості','Название свойства');
 FZ_Vopl_Prop_GridChColumnGroupName_Caption            :array[1..2] of string = ('Назва групи','Название группы');
 FZ_Vopl_Prop_GridChColumnGroupUse_Caption             :array[1..2] of string = ('Групувати','Группировать');

 //FZ_Vopl_PropGroup
 FZ_Vopl_PropGroup_Caption                             :array[1..2] of string = ('Довідник груп властивостей видів оплат','Справочник групп свойств видов оплат');
 FZ_Vopl_PropGroup_GridColumnName_Caption              :array[1..2] of string = ('Назва групи','Название группы');
 FZ_Vopl_PropGroup_GridColumnKod_Caption               :array[1..2] of string = ('Код','Код');
 FZ_Vopl_PropGroup_GridColumnNameGroup_Caption         :array[1..2] of string = ('Тип','Тип');
 FZ_Vopl_PropGroup_GridChColumnGroupName_Caption       :array[1..2] of string = ('Властивість','Свойство');
 FZ_Vopl_PropGroup_GridChColumnGroupUse_Caption        :array[1..2] of string = ('Активність','Активность');

 //FSpVoplIniPropGroupControl
 FSpVoplIniPropGroupControl_Caption                    :array[1..2] of string = ('Властивості','Свойство');
 FSpVoplIniPropGroupControl_CheckAllBtn_Caption        :array[1..2] of string = ('Прийняти всі','Принять все');
 FSpVoplIniPropGroupControl_UnCheckAllBtn_Caption      :array[1..2] of string = ('Відмінити всі','Отменить все');

 //VoplPropGroupControl
 VoplPropGroupControl_Caption_Insert                   :array[1..2] of string = ('Додавання групи','Добавление группы');
 VoplPropGroupControl_Caption_Update                   :array[1..2] of string = ('Редагування групи','Редактирование группы');
 VoplPropGroupControl_LabelFullName_Caption            :array[1..2] of string = ('Назва групи','Название группы');
 VoplPropGroupControl_LabelKod_Caption                 :array[1..2] of string = ('Код групи','Код группы');
 VoplPropGroupControl_LabelNameFilter_Caption          :array[1..2] of string = ('Тип групи властивості видів оплати','Тип группы свойств видов оплат');
 VoplPropGroupControl_ComboBoxFilter_Name_Caption      :array[1..2] of string = ('Назва типу групи','Название типа группы');

 VoplSystems_Caption                                   :array[1..2] of string = ('Фільтр видів опреацій по системам','Фильтр видов операций по системам');

 DonNU_Name_Full                                       :array[1..2] of string = ('Донецький Національний університет','Донецкий Национальный университет');
 DonNU_Name_Short                                      :array[1..2] of string = ('ДонНУ','ДонНУ');
 WhatsNew_Caption                                      :array[1..2] of string = ('Що нового','Что нового');

 //ParSetup
 FZ_ParSetup_Caption                                   :array[1..2] of string = ('Відотки відрахувань','Проценты отчислений');
 FZ_ParEdit_Caption                                    :array[1..2] of string = ('Редагування розмірів взносів','Редактировання розмеров взносов');
 FZ_AvansCount_Caption                                 :array[1..2] of string = ('Розрахунок аванса','Расчет аванса');
 FZ_FullCount_Caption                                  :array[1..2] of string = ('Розрахунок','Расчет');


 FZ_Personification_Caption                            :array[1..2] of string = ('Персоніфікація','Персонификация');
 CheckBoxFormSheet_Caption                             :array[1..2] of string = ('Формувати відомості','Формировать ведомости');
 GridClKodSetupEnd_Caption                             :array[1..2] of string = ('Дата закінчення','Дата окончания');
 GridClProcPens_Caption                                :array[1..2] of string = ('Пенсійній фонд','Пенсионный фонд');
 GridClProcProf_Caption                                :array[1..2] of string = ('Профсоюз','Профсоюз');
 GridClProcInv_Caption                                 :array[1..2] of string = ('Пенсійній фонд інвалідів','Пенсионный фонд инвалидов');
 GridClProcNSluch_Caption                              :array[1..2] of string = ('Нещасні випадки','Несчастные случаи');
 GridClProcSoc_Caption                                 :array[1..2] of string = ('Соціальне страхування','Социальное страхование');
 GridClProcZan_Caption                                 :array[1..2] of string = ('Страхування на випадок безробіття','Страхование на случай безработицы');
 EmptyFields_Message                                   :array[1..2] of string = ('Не всі поля заповнені!','Не все поля заполнены!');
 NullFields_Message                                    :array[1..2] of string = ('Всі поля не можуть'+#13+'мати нульові значення!','Все поля не могут'+#13+'иметь нулевые значения!');

 Exception_Caption                                     :array[1..2] of string = ('Винятки','Исключения');
 PostFilterCheckBox_Caption                            :array[1..2] of string = ('Фільтр посадових переміщень','Фильт должностных перемещений');
 ReestrDate_beg_Caption                                :array[1..2] of string = ('Дата початку','Дата начала');

 Show_working_Caption                                  :array[1..2] of string = ('Показувати тільки працюючих', 'Показывать только работающих');
 Filter_Department_Caption                             :array[1..2] of string = ('Фільтрувати за  підрозділом', 'Фильтровать по подразделению');
 Filter_FIO_TN_Caption                                 :array[1..2] of string = ('Фільтрувати (ПІП/б або ТН)', 'Фильтровать (ФИО или ТН)');
 ON_date_Caption                                       :array[1..2] of string = ('На дату', 'На дату');
 Filter_Rus_FIO_Caption                                :array[1..2] of string = ('Російське П.І.П/б', 'ФИО по-русски');
 ZHosp_page_main                                       :array[1..2] of string = ('Основна інформація', 'Основная информация');
 ZHosp_page_additional                                 :array[1..2] of string = ('Додатково', 'Дополнительно');
 ZHosp_list                                            :array[1..2] of string = ('Лист', 'Больничный');
 ZHosp_Seria                                           :array[1..2] of string = ('Серія', 'Серия');
 ZHosp_Nomer                                           :array[1..2] of string = ('Номер', 'Номер');
 ZHosp_Cont                                            :array[1..2] of string = ('Продовження листа №', 'Продолжение больничного №');
 ZHosp_Form                                            :array[1..2] of string = ('Форма листа непрацездатності', 'Форма больничного листа');
 ZHosp_Illness                                         :array[1..2] of string = ('Захворювання', 'Заболевания');
 ZHosp_Illness_Type                                    :array[1..2] of string = ('Тип захворювання', 'Тип заболевания');
 ZHosp_Illness_Shifr                                   :array[1..2] of string = ('Шифр захворювання', 'Шифр заболевания');
 ZHosp_Illness_Ending                                  :array[1..2] of string = ('Заключні висновки', 'Заключительные выводы');
 ZHosp_DateBeg                                         :array[1..2] of string = ('Дата початку', 'Дата начала');
 ZHosp_DateEnd                                         :array[1..2] of string = ('Дата закінчення', 'Дата окончания');
 ZHosp_Payment                                         :array[1..2] of string = ('Оплата', 'Оплата');
 ZHosp_Payment_Procent                                 :array[1..2] of string = ('Процент до оплати', 'Процент к оплате');
 ZHosp_Payment_vid                                     :array[1..2] of string = ('Вид оплати', 'Вид оплаты');
 ZHosp_Exception_Mode                                  :array[1..2] of string = ('Порушення режиму', 'Нарушение режима');
 ZHosp_Note                                            :array[1..2] of string = ('Примітка', 'Примечание');
 ZHosp_Rmoving                                         :array[1..2] of string = ('Трудовий договір', 'Трудовой договор');
 ZHosp_Work_Mode                                       :array[1..2] of string = ('Режим праці', 'Режим работы');
 ZHosp_Shift                                           :array[1..2] of string = ('Зсув', 'Сдвижка');
 ZHosp_working_day                                     :array[1..2] of string = ('Робочих днів', 'Рабочих дней');
 ZHosp_weekend_day                                     :array[1..2] of string = ('Вихідних днів', 'Выходных дней');
 ZHosp_weekend_day_list                                :array[1..2] of string = ('Вихідні дні', 'Выходные дни');
 ZHosp_Z                                               :array[1..2] of string = ('З', 'С');
 ZHosp_Po                                              :array[1..2] of string = ('По', 'По');
 ZHosp_Rmoving_type                                    :array[1..2] of string = ('Тип тр. угоди', 'Тип тр. согалшения');
 ZHosp_POst                                            :array[1..2] of string = ('Посада', 'Должность');
 ZHosp_Ok                                              :array[1..2] of string = ('Прийняти', 'Принять');
 ZHosp_Cancel                                          :array[1..2] of string = ('Відмінити', 'Отменить');
 ZHosp_GetMode                                         :array[1..2] of string = ('Забрати графік', 'Забрать график');
 ZHosp_No_Change_Opl                                   :array[1..2] of string = ('Вид оплати визначається попереднім листом непрацездатності!', 'Вид оплаты определяется предыдущим больничным листом');
 ZHosp_No_Change_IllType                               :array[1..2] of string = ('Тип захворювання визначається попереднім листом непрацездатності!', 'Тип заболевания определяется предыдущим больничным листом');
 ZHosp_No_Change_Date_beg                              :array[1..2] of string = ('Дата початку визначається попереднім листом непрацездатності!', 'Дата начала определяется предыдущим больничным листом');

 implementation

end.
