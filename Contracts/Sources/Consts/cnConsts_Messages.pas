unit cnConsts_Messages;

interface

const cn_Error               :array[1..2] of String=('Помилка!','Ошибка!');
const OkBtnCaption           :array[1..2] of string=('Ок','Ок');
const CancelBtnCaption       :array[1..2] of string=('Відмінити','Отменить');
const YesBtnCaption          :array[1..2] of string=('Так','Да');
const NoBtnCaption           :array[1..2] of string=('Ні','Нет');
const AbortBtnCaption        :array[1..2] of string=('Перервати','Прервать');
const RetryBtnCaption        :array[1..2] of string=('Повторити','Повторить');
const IgnoreBtnCaption       :array[1..2] of string=('Продовжити','Продолжить');
const AllBtnCaption          :array[1..2] of string=('Усі','Все');
const NowBtnCaption          :array[1..2] of string=('Поточні','Текущие');
const NeverBtnCaption        :array[1..2] of string=('Жоден','Никакой');
const HelpBtnCaption         :array[1..2] of string=('Допомога','Помощь');
const NoToAllBtnCaption      :array[1..2] of string=('Ні для всіх','Нет для всех');
const YesToAllBtnCaption     :array[1..2] of string=('Так для всіх','Да для всех');

const YesFromBufferCaption    :array[1..2] of string=('З буферу','Из буфера');
const NoFromBufferCaption     :array[1..2] of string=('Вручну','Вручную');

const wfLoadPackage_Const    :array[1..2] of string=('Чекайте! Йде пошук та завантаження пакету!','Ждите, идет поиск и загрузка пакета!');
const wfLocateFunction_Const :array[1..2] of string=('Чекайте! Йде пошук функції!','Ждите, идет поиск функции!');
const wfSelectData_Const     :array[1..2] of string=('Чекайте! Йде відбор даних!','Ждите, идет отбор данных!');
const wfPrepareData_Const    :array[1..2] of string=('Чекайте! Йде підготовка даних!','Ждите, идет подготовка данных!');

const cn_warning_PercentSum  :array[1..2] of string=('Сума за відсотками не повинна перевищувати 100 % !','Сумма по процентам не должна превышать 100 % !');
const cn_warning_StageOpl    :array[1..2] of string=('Спочатку треба заповнити осіб, що навчаються та платників!','Сначала необходимо заполнить обущающихся и плательщиков!');


const cn_warningVvod_Percent        :array[1..2] of string=('Відсоток введений невірно!','Процент введен неверно!');
const cn_warningVvod_Code           :array[1..2] of string=('Код введений невірно!','Код введен неверно!');
const cn_warningVvod_Razdel         :array[1..2] of string=('Код розділу введений невірно! Даного розділу не існує.','Код раздела введен неверно! Данного раздела не существует.');
const cn_warningVvod_Stat           :array[1..2] of string=('Код статті введений невірно! Даної статті не існує.','Код статьи введен неверно! Данной статьи не существует.');
const cn_warningVvod_Kekv           :array[1..2] of string=('Код КЕКВ введений невірно! Даного КЕКВ не існує.','Код КЕКЗ введен неверно! Данного КЕКЗ не существует.');
const cn_warningVvod_Smeta          :array[1..2] of string=('Код кошторису введений невірно! Даного кошторису не існує.','Код сметы введен неверно! Данной сметы не существует.');
const cn_warning_PercentMoreThen100 :array[1..2] of string=('Відсоток не може бути більш, ніж 100%','Процент не может быть более 100 %');
const cn_warning_SmRozdStat         :array[1..2] of string=('Сполучення кошторис-розділ-стаття невірно!','Сочетание смета-раздел-статья неверно!');

const cn_warning_SummaNotSame       :array[1..2] of string=('Сума розбивки не співпадає з зазначеною!', 'Сумма разбивки не совпадант с указанной!');

const cn_warning_Delete             :array[1..2] of string=('Ви дійсно хочете видалити цей запис?','Вы действительно хотите удалить эту запись?');
const cn_warning_Execute            :array[1..2] of string=('Ви дійсно хочете виконати цю дію?','Вы действительно хотите выполнить это действие?');

const cn_warning_Preyskurant        :array[1..2] of string=('Вартість навчання за даними параметрами не знайдена. Бажаєте вибрати з прейскуранту?','Стоимость обучения по данным параметрам не найдена. Хотите выбрать из прейскуранта?');

const  cn_Faculty_Need              :array[1..2] of String=('Необхідно заповнити факультет!','Необходимо заполнить факультет!');
const  cn_Spec_Need                 :array[1..2] of String=('Необхідно заповнити спеціальніть!','Необходимо заполнить специальность!');
const  cn_Group_Need                :array[1..2] of String=('Необхідно заповнити групу!','Необходимо заполнить группу!');
const  cn_FormStud_Need             :array[1..2] of String=('Необхідно заповнити форму навчання!','Необходимо заполнить форму обучения!');
const  cn_KatStud_Need              :array[1..2] of String=('Необхідно заповнити категорію навчання!','Необходимо заполнить категорию обучения!');
const  cn_National_Need             :array[1..2] of String=('Необхідно заповнити громадянство!','Необходимо заполнить гражданство!');
const  cn_DateBeg_Need              :array[1..2] of String=('Необхідно заповнити дату початку!','Необходимо заполнить дату начала!');
const  cn_DateEnd_Need              :array[1..2] of String=('Необхідно заповнити дату закінчення!','Необходимо заполнить дату окончания!');
const  cn_Sum_Need                  :array[1..2] of String=('Необхідно заповнити суму!','Необходимо заполнить сумму!');
const  cn_AllData_Need              :array[1..2] of String=('Необхідно заповнити усі дані за контрактом!','Необходимо заполнить все данные по контракту!');

const  cn_Dates_Prohibition         :array[1..2] of String=('Дата початку не може бути більш, ніж дата закінчення!','Дата начала не может быть больше даты окончания!');
const  cn_SummaNotNul_Prohibition   :array[1..2] of String=('Сума не може бути нульовою!', 'Сумма не может быть нулевой!');
const  cn_Period_Prohibition        :array[1..2] of String=('Дата закінчення вийшла за період дії контракту!', 'Дата окончания вышла за период действия контракта!');

const  cn_no_actual_price           :array[1..2] of String=('Немає актуальної версії','Нет актуальной версии');

{Льготы}
const  cn_lg_DateNakaz_Need         :array[1..2] of String=('Необхідно заповнити дату наказу!','Необходимо заполнить дату приказа!');
const  cn_lg_NomNakaz_Need          :array[1..2] of String=('Необхідно заповнити номер наказу!','Необходимо заполнить номер приказа!');
const  cn_lg_SumPerc_Need           :array[1..2] of String=('Необхідно заповнити суму чи відсоток !','Необходимо заполнить сумму или процент!');
const  cn_lg_DateBeg_Need           :array[1..2] of String=('Необхідно заповнити дату початку!','Необходимо заполнить дату начала!');
const  cn_lg_DateEnd_Need           :array[1..2] of String=('Необхідно заповнити дату закінчення!','Необходимо заполнить дату окончания!');

const  cn_PercentPeriods_Cross      :array[1..2] of String=('Періоди з відсотками перетинаються!','Периоды с процентами пересекаются!');
const  cn_SummaPeriods_Cross        :array[1..2] of String=('Періоди з сумами перетинаються!','Периоды с суммами пересекаются!');
const  cn_PercentMore100            :array[1..2] of String=('Відсоток не може перевищувати 100%!','Процент не может превышать 100%!');

const  cn_ShortcutWhosCreate        :array[1..2] of String=('Іконка була успішно створена в: ','Иконка была успешно создана в: ');

const  cn_DateDiss_Need             :array[1..2] of String=('Необхідно заповнити дату розірвання контракту!','Необходимо заполнить дату расторжения контракта!');
const  cn_DateOrder_Need            :array[1..2] of String=('Необхідно заповнити дату наказу!','Необходимо заполнить дату приказа!');
const  cn_NumOrder_Need             :array[1..2] of String=('Необхідно заповнити номер наказу!','Необходимо заполнить номер приказа!');

const  cn_NoDeleteContract          :array[1..2] of String=('Неможливо видалити. За контрактом вже були сплати.','Невозможно удалить. По контракту уже были оплаты.');
const  cn_CheckNumDogFalse          :array[1..2] of String=('Контракт з таким номером вже існує!','Контракт с таким номером уже существует!');

const  cn_NotHaveRights             :array[1..2] of String=('Ви не маєте повноважень для здійснення даної дії!',
                                                            'У Вас нет прав для осуществления данного действия!');
const  cn_GoToAdmin                 :array[1..2] of String=('Зверніться до адміністратора.','Обратитесь к администратору.');
const  cn_ActionDenied              :array[1..2] of String=('Дія заборонена','Действие запрещено');

const  cn_Name_Need                 :array[1..2] of String=('Необхідно заповнити найменування !','Необходимо заполнить наименование!');
const  cn_ShortName_Need            :array[1..2] of String=('Необхідно заповнити коротке найменування !','Необходимо заполнить краткое наименование!');
const  cn_Exec_Need                 :array[1..2] of String=('Необхідно заповнити посаду відповідального!','Необходимо заполнить должность ответственного!');
const  cn_Dekan_Need                :array[1..2] of String=('Необхідно заповнити ПІБ відповідального!','Необходимо заполнить ФИО ответственного!');

const  cn_NonDeleteDependet         :array[1..2] of String=('Неможливо видалити - запис має залежні записи','Невозможно удалить - запись имеет зависимые записи');

const  cn_DelAll_Caption            :array[1..2] of String=('Видалити усі','Удалить все');
const  cn_DelAll_Promt              :array[1..2] of String=('Ви дійсно бажаєте видалити усі записи у таблиці ?','Вы действительно желаете удалить все записи из таблицы?');
const  cn_Accounts_Need             :array[1..2] of String=('Необхідно заповнити розрахунковий рахунок!','Необходимо заполнить расчетный счет!');

const  cn_Some_Need                 :array[1..2] of String=('Помилка заповнення даних форми. Не усі поля заповнені','Ошибка заполнения данных формы. Не все поля заполнены');
const  cn_NotChangeRaport           :array[1..2] of String=('Дія заборонена. Рапорт вже виконаний.','Действие запрещено. Рапорт уже выполнен.');
const  cn_MoreDateStart             :array[1..2] of String=('Дата початку не повинна бути меньш, ніж дата запуску системи!',
                                                            'Дата начала не должна быть менее даты запуска системы!');

const  cn_NoDateBegVSBegRozbivka   :array[1..2] of String=('Дата початку контракту не збігається з початковою датою розбивки за періодами сплат',
                                                           'Дата начала контракта не совпадает с начальной датой разбивки по периодам оплат');
const  cn_NoDateEndVSEndRozbivka   :array[1..2] of String=('Дата закінчення контракту не збігається з кінцевою датою розбивки за періодами сплат',
                                                           'Дата окончания контракта не совпадает с конечной датой разбивки по периодам оплат');

const  cn_PeriodsLessDateStart     :array[1..2] of String=('Дати за періодами повинні бути більше, ніж дата старту системи!','Даты по периодам оплат должны быть больше, чем дата запуска системы!');

const  cn_DateBegNeedMoreDateEnd   :array[1..2] of String=('Дата закінчення повинна бути бульше, ніж дата початку!','Дата окончания должна быть больше даты начала!');
const  cn_DatesExists              :array[1..2] of String=('Вже існуює період розбивки з аналогічними датами початку та закінчення!','Уже существует период разбивки с аналогичными датами начала и окончания!');

const  cn_AcademicPeriodsCheck     :array[1..2] of String=('Період не може перевищувати 1 академічний рік!','Период не может превышать 1 академический год!');

const  cn_record_exist             :array[1..2] of String=('Такий запис вже існує!','Такая запись уже существует!');
const  cn_smet_Need                :array[1..2] of String=('Бюджет не заповнений. Продовжити ?','Бюджет не заполненный. Продолжить ?');

{const  cn_ _Need                    :array[1..2] of String=('Необхідно заповнити !','Необходимо заполнить !');
const  cn_ _Need                    :array[1..2] of String=('Необхідно заповнити !','Необходимо заполнить !');
}

implementation

end.
