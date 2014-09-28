unit uUO_Constants;

interface
                                                 {Укр}       {Рус}
const nLayoutLang  :array[0..1] of PAnsiChar =('00000422','00000419');

const nFormKlassSpravEdit_Add      :array[0..1] of string[15] =(' Додати.',   '');
const nFormKlassSpravEdit_Change   :array[0..1] of string[15] =(' Змінити.',  '');
const nFormKlassSpravEdit_View     :array[0..1] of string[15] =(' Перегляд.', '');

const nCaptionFirstLevelPreim      :array[0..1] of string[30] =('  Категорії переваг',  '  Категории преимуществ');
const nCaptionSecondLevelPreim     :array[0..1] of string[20] =('  Переваги',           '  Преимущества');

const nCaptionFirstLevelPredm      :array[0..1] of string[30] =('  Предмети конкурсного циклу',  '  Предметы конкурсного цикла');
const nCaptionSecondLevelPredm     :array[0..1] of string[20] =('  Предмети атестата',           '  Предметы аттестата');

const nCaptionFirstLevelNapr      :array[0..1] of string[50] =(' Категорії підготовки',  ' Категории подготовки');
const nCaptionSecondLevelNapr     :array[0..1] of string[30] =(' Напрямку підготовки',   ' Направления подготовки');


const nAction_Add          :array[0..1] of string[10] =('Додати',              'Добавить');
const nAction_Change       :array[0..1] of string[10] =('Змінити',             '');
const nAction_Del          :array[0..1] of string[10] =('Видалити',            '');
const nAction_View         :array[0..1] of string[10] =('Перегляд',            '');
const nActiont_Obnov       :array[0..1] of string[10] =('Оновити',             '');
const nAction_Vibrat       :array[0..1] of string[10] =('Вибрати',             '');
const nActiont_Otmena      :array[0..1] of string[10] =('Відмінити',           '');
const nAction_Exit         :array[0..1] of string[10] =('Вийти',               '');
const nActiont_OK          :array[0..1] of string[5]  =('ОК',                  'ОК');
const nActiont_Cansel      :array[0..1] of string[10] =('Відмінити',           '');
const nActionCalc          :array[0..1] of string[10] =('Підрахунок',          'Подсчет');
const nActionCalcDeleteRec :array[0..1] of string[15] =('Видалити запис',      'Удалить запись');
const nActionAddCN         :array[0..1] of string[20] =('Додати договір',      'Добавить договор');
const nActionChangeCN      :array[0..1] of string[20] =('Змінити договір',     '');
const nActionDelCN         :array[0..1] of string[20] =('Видалити договір',    '');
const nActionDelAbit       :array[0..1] of string[20] =('Видалити Картку','');
const nActionSave          :array[0..1] of string[20] =('Зберегти',            'Сохранить');
const nActionExit          :array[0..1] of string[20] =('Вихід',               '');
const nActiontPrint        :array[0..1] of string[10] =('Друк',                'Печать');
const nAction_ChangeEkzRasp:array[0..1] of string[20] =('Змінити дату ісп.',   'Изменить дату экз.');
const nAction_Del_PiV      :array[0..1] of string[40] =('Видалити абітурієнта з відомості',
                                                        'Удалить абитуриента из ведомости');
const nAction_Sklasti      :array[0..1] of string[10] =('Скласти',             'Составить');
const nAction_DelVedom     :array[0..1] of string[20] =('Видалити відомість',            '');
const nActionSaveOcenka    :array[0..1] of string[15] =('Зберегти оцінки',     'Сохранить');
const nAction_AddEkzRasp   :array[0..1] of string[20] =('Додати дату ісп.',    'Добавить дату экз.');
const nActionPrintRecDoZarah    :array[0..1] of string[20] =('Рек. до зарах.',    'Рек. к зачисл.');
const nActionPrintPovidProZarah :array[0..1] of string[20] =('Повід. про зарах.', 'Сообщ. про зачисл.');
const nActionChangeCN_Status    :array[0..1] of string[20] =('Змінити статус',    'Изменить статус');
const nActionAddExistPr         :array[0..1] of string[30] =('Додати існуючий наказ',    'Добавить существующий приказ');
const nAction_ChangeRekvizit    :array[0..1] of string[20] =('Змінити Реквізити', '');
const nActionAbitShow           :array[0..1] of string[20] =('Абітурієнт',        'Абитуриент');
const nAction_Edit              :array[0..1] of string[15] =('Редагувати',        'Редактировать');
const nActionFiltr              :array[0..1] of string[15] =('Фільтрувати',       'фильтровать');
const nActionCopyPlanNabora     :array[0..1] of string[15] =('Копіювати план',    'Копировать план');
const nActionMakeOld            :array[0..1] of string[15] =('Застаріле',         'Устаревшее');


const nHintAction_Add         :array[0..1] of string[10] =('Додати',        'Добавить');
const nHintAction_Change      :array[0..1] of string[10] =('Змінити',       '');
const nHintAction_Del         :array[0..1] of string[10] =('Видалити',      '');
const nHintAction_View        :array[0..1] of string[10] =('Перегляд',      '');
const nHintAction_Obnov       :array[0..1] of string[10] =('Оновити',       '');
const nHintAction_Vibrat      :array[0..1] of string[10] =('Вибрати',       '');
const nHintAction_Otmena      :array[0..1] of string[10] =('Відмінити',     '');
const nHintAction_Exit        :array[0..1] of string[10] =('Вийти',         '');
const nHintActiont_OK         :array[0..1] of string[5]  =('ОК',            'ОК');
const nHintActiont_Cansel     :array[0..1] of string[10] =('Відмінити',     '');
const nHintActionCalc         :array[0..1] of string[10] =('Підрахунок',    'Подсчет');
const nHintActionCalcDeleteRec:array[0..1] of string[15] =('Видалити запис','Удалить запись');
const nHintActionSave         :array[0..1] of string[20] =('Зберегти',      'Сохранить');
const nHintActiontPrint       :array[0..1] of string[10] =('Друк',          'Печать');
const nHintActionChangeEkzRasp:array[0..1] of string[25] =('Змінити дату іспиту',     'Изменить дату экзамена');
const nHintAction_Add_PiV     :array[0..1] of string[40] =('Додати абітурієнта в відомість',
                                                           'Добавить абитуриента в ведомость');
const nHintAction_SklastiVedom      :array[0..1] of string[20] =('Скласти відомість',           'Составить ведомость');
const nHintActionSaveVedom          :array[0..1] of string[20] =('Зберегти відомість',          'Сохранить ведомость');
const nHintAction_SklastiRecDoZarah :array[0..1] of string[25] =('Скласти рекомендації',        'Составить рекомендации');
const nHintActionSaveRecDoZarah     :array[0..1] of string[25] =('Зберегти рекомендації',       'Сохранить рекомендации');
const nHintActionPrintRecDoZarah    :array[0..1] of string[30] =('Рекомендації до зарахування', 'Рекомендации к зачислению');
const nHintActionPrintPovidProZarah :array[0..1] of string[30] =('Повідомлення про зарахування','Сообщение про зачисление');
const nHintActionChangeCN_Status    :array[0..1] of string[40] =('Змінити статус договору на кандидат',    'Изменить статус договора на кандидат');
const nHintAction_ChangeRekvizit    :array[0..1] of string[20] =('Змінити Реквізити', '');
const nHintActionAbitShowProtokol   :array[0..1] of string[40] =('Перегляд Абітурієнтів у Протоколі',      '');
const nHintActionAbitShowPrikaz     :array[0..1] of string[40] =('Перегляд Абітурієнтів у Наказах',        '');
const nHintActionFiltrOK            :array[0..1] of string[20] =('Фільтрувати',                            'Фильтровать');
const nHintAction_Edit              :array[0..1] of string[15] =('Редагувати',        'Редактировать');
const nHintActionFiltr              :array[0..1] of string[15] =('Фільтрувати',       'фильтровать');
const nHintActionCopyPlanNabora     :array[0..1] of string[25] =('Копіювати план набору','Копировать план набора');
const nHintActionMakeOld            :array[0..1] of string[20] =('Зробити застарілим',   'Сделать устаревшим');

const nStatBarAdd         :array[0..1] of string[20] =('Ins - Додати',   '');
const nStatBarChange      :array[0..1] of string[20] =('F2 - Змінити',   '');
const nStatBarDel         :array[0..1] of string[20] =('Del - Видалити', '');
const nStatBarView        :array[0..1] of string[20] =('F3 - Перегляд',  '');
const nStatBarVibrat      :array[0..1] of string[20] =('Enter - Вибрати','');
const nStatBarObnov       :array[0..1] of string[20] =('F5 - Обновити',  '');
const nStatBarExit        :array[0..1] of string[20] =('Esc - Вийти',    '');

const nPopMenuCountSerBal :array[0..1] of string[15] =('Підрахувати',    'Подсчитать');
const nPopMenuClear       :array[0..1] of string[15] =('Очистити',       'Очистить');


const nMsgToAdmin         :array[0..1] of string[60]  =('Зверніться, будьласка, до адміністратора',
                                                       '');
const nMsgTryAgain        :array[0..1] of string[20]  =('Спробуйте ще раз.','');
const nMsgOr              :array[0..1] of string[5]   =(' Або ','');
const nMsgBoxTitle        :array[0..1] of PAnsiChar   =('Увага','');
const nMsgDel             :array[0..1] of string[60]  =('Ви дійсно бажаєте видалити цей запис',
                                                       '');
const nMsgDelAbit         :array[0..1] of string[60]  =('Ви дійсно бажаєте видалити картку цього абітуріента',
                                                       '');
const nMsgDelContract     :array[0..1] of string[60]  =('Ви дійсно бажаєте видалити контракт цього абітуріента',
                                                       '');
const nMsgCannotEdit      :array[0..1] of string[60]  =('Ви не маєте можливості редагувати цей запис',
                                                       '');
const nMsgERRORDel        :array[0..1] of string[50]  =('Неможливо видалити запис!',
                                                       '');
const nMsgErrorTransaction:array[0..1] of string[50]  =('Неможливо виповнити запит!',
                                                       '');
const nMsgDelVedom        :array[0..1] of string[60]  =('Ви дійсно бажаєте видалити цю відомість',
                                                       '');
const nMsgChangeCN_Status :array[0..1] of string[60]  =('Ви дійсно бажаєте змінити статус договору на кандидат',
                                                       '');



const nMsgEmptyName         :array[0..1] of string[20]  =('Введіть назву',            '');
const nMsgEmptyShortName    :array[0..1] of string[40]  =('Введіть скорочену назву',  '');
const nMsgEmptyKod          :array[0..1] of string[20]  =('Введіть код',              '');
const nMsgZerroKod          :array[0..1] of string[40]  =('Код не може бути нулевим.','');
const nMsgThisKodExist      :array[0..1] of string[50]  =('Такий Код вже існує! Введіть інший.',             '');
const nMsgEmptyNpp          :array[0..1] of string[50]  =('Введіть Порядковий номер', '');
const nMsgZerroNpp          :array[0..1] of string[50]  =('Порядковий номер не може бути нулевим.',          '');
const nMsgThisNppExist      :array[0..1] of string[60]  =('Такий Порядковий номер вже існує! Введіть інший.','');
const nMsgCannotDelSecLevel :array[0..1] of string[200] =('Неможливо видалити другий рівень.' +chr(13)+'Перший рівень повинен містити під собою інші рівні',
                                                          '');
const nMsgFreeNomer         :array[0..1] of string[60]  =('Вільний номер:','Свободный номер:');
const nMsgExistProfPredm    :array[0..1] of PAnsiChar   =('Неможливо видалити запис!'+CHR(13)+'Спочатку потрібно виставити інший профіл. предмет'+CHR(13)+'Потім ви зможете видалити поточний запис',
                                                          'Невозможно удалить запись!'+CHR(13)+'Сначала нужно выставить другой профил. предмет!'+CHR(13)+'Затем вы сможете удалить текущую запись');
const nMsgCannotDelProtZach :array[0..1] of string[200] =('Неможливо видалити Протокол' +chr(13)+'Видаліть спочатку всі Накази з Цього протоколу',
                                                          '');


const nMsgSrBalOn5System     :array[0..1] of string[80]  =('Такий Середній бал не може обчислюватися '+CHR(13)+' по п`яти бальній системі',    'Такой Средний балл не может исчисляться '+CHR(13)+' по пяти бальной системе');
const nMsgOcenkaOn5System    :array[0..1] of string[80]  =('Така оцінка не може стояти '+CHR(13)+' по п`яти бальній системі',   'Такая оценка не может стоять '+CHR(13)+' по пяти бальной системе');
const nMsgSaveAbitWasOk      :array[0..1] of string[80]  =('Дані Абітуріента були успішно збережені',   'Данные абитуриента были успешно сохранены');
const nMsgSaveDataWasOk      :array[0..1] of string[80]  =('Дані були успішно збережені',  'Данные были успешно сохранены');


const nMsgSaveAbitVedomOcenkaWasOk      :array[0..1] of string[80]  =('Всі оцінки були успішно збережені',   'Все оценки были успешно сохранены');
const nMsgSaveRecDoZarah                :array[0..1] of string[80]  =('Рекомендації до зарахування були успішно збережені',   'Рекомендации к зачислению были успешно сохранены');
const nMsgSaveProtokolWasOk             :array[0..1] of string[80]  =('Протокол був успішно збережений',     'Протокол был успешно сохранен');



const nMsgEmptyVinitPadeg :array[0..1] of string[40]  =('Введіть Знахідний відмінок','');
const nMsgEmptyRoditPadeg :array[0..1] of string[40]  =('Введіть Родовий відмінок',  '');
const nMsgEmptyDateBeg    :array[0..1] of string[40]  =('Введіть Дату початку',      '');
const nMsgEmptyDateEnd    :array[0..1] of string[40]  =('Введіть Дату закінчення',   '');
const nMsgEmptySHIFR      :array[0..1] of string[15]  =('Введіть Шифр',              '');
const nMsgEmptyMinPerelikPrim  :array[0..1] of string[40]  =('Потрібно вибрати примітку', 'Нужно выбрать примечание');
const nMsgEmptyNameSpec   :array[0..1] of string[40]  =('Потрібно вибрати спеціальність', 'Нужно выбрать специальность');
const nMsgEmptyNameStud   :array[0..1] of string[40]  =('Потрібно вибрати О.К. рівень',   'Нужно выбрать О.К. уровень');
const nMsgEmptyNameObuchKateg   :array[0..1] of string[60]  =('Потрібно вибрати категорію форми навчання', 'Нужно выбрать категорию формы обучения');
const nMsgEmptyLicenseValue     :array[0..1] of string[40]  =('Введіть Ліцензійний набір',               '');
const nMsgEmptyLicenseDateEnd   :array[0..1] of string[50]  =('Введіть Дату закінчення ліцензії',        '');
const nMsgEmptyCnFaculSpec      :array[0..1] of string[50]  =('Потрібно вибрати спеціальність',          'Нужно выбрать специальность');
const nMsgEmptyNameCnKatStud    :array[0..1] of string[50]  =('Потрібно вибрати Категорію навчання',     '');
const nMsgEmptyCnFormStud       :array[0..1] of string[50]  =('Потрібно вибрати Форму навчання',         '');
const nMsgEmptyGodNabora        :array[0..1] of string[50]  =('Виберіть Роки набору абітурієнтів',       '');
const nMsgEmptyDergZakaz        :array[0..1] of string[50]  =('Виберіть Державне замовлення/договір',    '');
const nMsgEmptyKurs             :array[0..1] of string[50]  =('Виберіть Курс навчання',                  '');
const nMsgEmptySrokOb           :array[0..1] of string[50]  =('Виберіть строк навчання',                 '');
const nMsgEmptyPlanValue        :array[0..1] of string[50]  =('Введіть плановий набір',                  '');
const nMsgEmptyTypeDoc          :array[0..1] of string[50]  =('Виберіть тип документа про освіту',       '');
const nMsgEmptySeria            :array[0..1] of string[50]  =('Введіть серію',                           '');
const nMsgEmptyNomer            :array[0..1] of string[50]  =('Введіть номер',                           '');
const nMsgEmptyDATE_VIDACHI     :array[0..1] of string[50]  =('Виберіть дату видачі',                    '');
const nMsgEmptyCannotDate       :array[0..1] of string[50]  =('Дата не може бути пустою',                '');
const nMsgEmptyTypeUchz         :array[0..1] of string[50]  =('Виберіть тип навчального закладу',        '');
const nMsgEmptyUCHZ             :array[0..1] of string[80]  =('Виберіть  або введіть найменування навчального закладу', '');
const nMsgEmptyAdressUchz       :array[0..1] of string[50]  =('Виберіть місце розташування навч. закл.', '');
const nMsgEmptyCopyOrig         :array[0..1] of string[50]  =('Виберіть копію чи оригінал',              '');
const nMsgEmptyPredm            :array[0..1] of string[50]  =('Виберіть предмет',                        '');
const nMsgEmptyEKZ_FORM         :array[0..1] of string[50]  =('Виберіть вступні випробування',           '');
const nMsgEmptyEKZFORM_PRB      :array[0..1] of string[50]  =('Виберіть пробні вступні випробування',    '');
const nMsgDateBegMoreDateEnd    :array[0..1] of string[50]  =('Дата початку більше дати закінчення',     'Дата начала больше даты окончания');
const nMsgCannotDelVerhLevel    :array[0..1] of string[75]  =('Ви не маєте права видаляти рівень,'+Chr(13)+' утримуючий у собі інші підрівні',
                                                              'Вы не имеете права удалять уровень,'+Chr(13)+' содержащий в себе другие подуровни');
const nMsgEmptyEKZ_DATE         :array[0..1] of string[50]  =('Виберіть Дату іспиту',                    'Выберите Дату экзамена');
const nMsgEmptyPerelik_EKZ      :array[0..1] of string[99]  =('На цьому наборі немає предмета'+Chr(13)+'Потрібно виставити його в довіднику "Перелік Іспитів"',
                                                              'На этом наборе нет предмета'+Chr(13)+'Нужно выставить его в справочнике "Перечень экзаменов"');
const nMsgEmptyIN_LANG          :array[0..1] of string[25]  =('Виберіть мову',                           'Выберите язык');
const nMsgEmptyLEVEL_VLADEN     :array[0..1] of string[30]  =('Виберіть рівень володіння',               'Выберите уровень владения');
const nMsgEmptyFIO              :array[0..1] of string[30]  =('Виберіть ПІБ',                            'Выберите ФИО');
const nMsgEmptyDOLJNOST         :array[0..1] of string[30]  =('Виберіть посаду',                         'Выберите должность');
const nMsgEmptyFOB_PROT         :array[0..1] of string[50]  =('Виберіть Форму навчання для протоколу',   '');

const nMsgEmptyCel_Zamovnik     :array[0..1] of string[50]  =('Виберіть замовника цільового напрямку',   'Выберите заказчика целевого направления');
const nMsgEmptyNPK              :array[0..1] of string[50]  =('Виберіть напрямок роботи прийм. комісії', 'Выберите напр. работы приемной комиссии');
const nMsgEmptyVID_DII          :array[0..1] of string[50]  =('Виберіть вид дії',                        'Выберите вид действия');
const nMsgEmptyFioAbit          :array[0..1] of string[50]  =('Виберіть Абітурієнта',                    'Выберите Абитуриента');
const nMsgEmptyUkr_Lang         :array[0..1] of string[50]  =('Виберіть рівень знання укаинского мови',  'Выберите уровень знания укаинского языка');
const nMsgEmptyGurtog           :array[0..1] of string[50]  =('Визначитеся з необхідністю гуртожитку',   'Определитесь с необходимостью общежития');
const nMsgEmptyCn_National      :array[0..1] of string[50]  =('Виберіть національність',                 'Выберите национальность');
const nMsgEmptyOCENKA           :array[0..1] of string[50]  =('Потрібно виставити оцінки по проф. предметах',   'Нужно выставить оценки по проф. предметам');
const nMsgEmptyTypeDepart       :array[0..1] of string[50]  =('Виберіть підрозділ',                      'Выберите подразделение');
const nMsgEmptyFacul            :array[0..1] of string[50]  =('Виберіть факультет',                      'Выберите факультет');
const nMsgEmptyPotok            :array[0..1] of string[50]  =('Виберіть потік',                          'Выберите поток');
const nMsgEmptyTypePerekl       :array[0..1] of string[50]  =('Виберіть тип перекладання',               'Выберите тип перекладывания');
const nMsgEmptyDataDocEducation :array[0..1] of string[50]  =('Потрібно заповнити документи про освіту', 'Нужно заполнить документы об образовании');
const nMsgEmptySrBal            :array[0..1] of string[50]  =('Потрібно ввести середній бал',            'Нужно ввести средний бал');
const nMsgEmptyMainDoc          :array[0..1] of string[70]  =('Потрібно вказати, хоч би один документ про освіту за головний',
                                                              'Нужно указать, хотя бы один документ об образовании за главный');
const nMsgEmptyISPIT_VEDOM_TYPE :array[0..1] of string[50]  =('Виберіть тип екзаменаційної відомості','Выберите тип экзаменационной ведомости');
const nMsgEmptyDataInLang       :array[0..1] of string[70]  =('Потрібно вказати яку іноземну мову вивчав абітурієнт',
                                                              'Нужно указать какой иностранный язык изучал абитуриент');
const nMsgEmtyDateReestracii    :array[0..1] of string[50]  =('Виберіть дату реєстрації',                'Выберите дату регистрации');
const nMsgEmptyDATE             :array[0..1] of string[50]  =('Виберіть Дату',                           'Выберите Дату');
const nMsgEmptySelectAbit       :array[0..1] of string[50]  =('Потрнібно вибрати хоч би одного Абітурієнта','');
const nMsgNomerMoreZero         :array[0..1] of string[50]  =('Номер повинен бути більше нуля','');
const nMsgEmptyModuleName       :array[0..1] of string[50]  =('Введіть назву модулю',                     '');
const nMsgEmptyId               :array[0..1] of string[50]  =('Введіть Індефікатор',                      'Введите Индефикатор');
const nMsgEmptyComponent        :array[0..1] of string[50]  =('Виберіть Компонент',                       '');
const nMsgEmptySELECT_STATEMENT :array[0..1] of string[50]  =('Введіть Текст запроса',                    '');
const nMsgEmptyWHERE_STATEMENT  :array[0..1] of string[50]  =('Введіть условие запроса',                  '');
const nMsgSelectedBefore        :array[0..1] of string[40]  =('Вибрано раніше',                           '');
const nMsgEmptyDataAfterFiltr   :array[0..1] of string[90]  =('За таким фільтром немає даних!'+CHR(13)+'Спробуйте змінити умови фільтру',
                                                              '');
const nMsgEmptyRelationFormStudForProt    :array[0..1] of string[60]  =('Заповніть Таблицю Звичайних форм навчання та для протоколу','');
const nMsgCopyPlanNabora        :array[0..1] of string[255] =('Ви дійсно бажаєте копіювати плани набору минулих років?'+#13+'Якщо так, то оберіть рік з бажаним планом.','Вы действительно хотите копировать планы набора прошлых годов?'+#13+'Если да, то выберите год с желаемым планом.');
const nMsgCopyPlanNaboraWOCel   :array[0..1] of string[50]  =('Копіювати без цільового набору','Копировать без целевого набора');
const nMsgCopyPlanNaboraWCel    :array[0..1] of string[50]  =('Копіювати з цільовим набором','Копировать с целевым набором');
const nMsgCopyPlanNaboraCancel  :array[0..1] of string[50]  =('Не копіювати','Не копировать');
const nMsgMakeOld               :array[0..1] of string[200] =('Ви дійсно бажаєте відмітити цей запис як застарілий?'+#13+'У такому разі він не буде відображатись в довіднику.',
                                                              'Вы действительно хотите пометить эту запись как устаревшую?'+#13+'В таком случае она не будет отображаться в справочнике.');
const nMsgEmptyFields           :array[0..1] of string[40]  =('Не всі поля заповнено!','Не все поля заполнены!');


const nMsgDlgOk           :array[0..1] of string[5]   =('Так',          '');
const nMsgDlgCansel       :array[0..1] of string[10]  =('Ні',           '');
const nMsgDlgYes          :array[0..1] of string[5]   =('Так',          '');
const nMsgDlgNo           :array[0..1] of string[5]   =('Ні',           '');
const nMsgDlgAbort        :array[0..1] of string[10]  =('Відмінити',    '');
const nMsgDlgRetry        :array[0..1] of string[10]  =('Повторити',    '');
const nMsgDlgIgnore       :array[0..1] of string[15]  =('Ігнорувати',   '');
const nMsgDlgAll          :array[0..1] of string[5]   =('Все',          '');
const nMsgDlgHelp         :array[0..1] of string[10]  =('Допомога',     '');
const nMsgDlgNoToAll      :array[0..1] of string[15]  =('Ні для всіх',  '');
const nMsgDlgYesToAll     :array[0..1] of string[15]  =('Так для всіх', '');


const nColName            :array[0..1] of string[10]  =('Назва',        '');
const nColShortName       :array[0..1] of string[15]  =('Коротка назва','');
const nColFullName        :array[0..1] of string[15]  =('Повна назва','Полное название');
const nColKod             :array[0..1] of string[5]   =('Код',          '');
const nColNpp             :array[0..1] of string[10]  =('№п/п',         '№п/п');
const ncolVINIT_PADEG     :array[0..1] of string[25]  =('Знахідний відмінок','Винительный падеж');
const ncolRODIT_PADEG     :array[0..1] of string[25]  =('Родовий відмінок',  'Родительный падеж');
const ncolIS_SPIVBESIDA   :array[0..1] of string[15]  =('Співбесіда',        'Собеседование');
const ncolIS_ZALIK        :array[0..1] of string[10]  =('Залік',             'Зачет');
const ncolOCENKA_NUM      :array[0..1] of string[10]  =('Оцінка',            'Оценка');
const ncolDATE_BEGIN      :array[0..1] of string[25]  =('Дата початку',      'Дата начала');
const ncolDATE_END        :array[0..1] of string[25]  =('Дата закінчення',   'Дата окончания');
const ncolIS_FIZL_LGOTA   :array[0..1] of string[10]  =('Пільга',            'Льгота');
const ncolSHIFR           :array[0..1] of string[5]   =('Шифр',              'Шифр');
const nColSHORT_NAME_PRIM :array[0..1] of string[10]  =('Примітка',          'Примечание');
const ncolNAME_SPEC       :array[0..1] of string[15]  =('Спеціальність',     'Специальность');
const ncolNAME_FAK        :array[0..1] of string[15]  =('Факультет',         'Факультет');
const ncolNAME_STUD       :array[0..1] of string[25]  =('Осв.-квал. рівень', 'Образ.-квал. уровень');
const ncolSHORT_NAME_KATEGORY :array[0..1] of string[25]  =('Кат. форми навчання', 'Кат. формы обучения');
const ncolLICENCE_VALUE   :array[0..1] of string[20]  =('Ліцензійний набір',       'Лицензионный набор');
const ncolLICENCE_DATE_END:array[0..1] of string[30]  =('Дата закінчення ліцензії','Дата окончания лицензии');
const ncolNAME_CN_FACUL_SPEC     :array[0..1] of string[15] =('Спеціальність',     '');
const ncolSHORT_NAME_CN_KAT_STUD :array[0..1] of string[20] =('Категорія навчання','');
const ncolSHORT_NAME_CN_FORM_STUD:array[0..1] of string[15] =('Форма навчання',    '');
const ncolPLAN_VALUE             :array[0..1] of string[20] =('Плановий набір',    'Плановый набор');
const ncolYEARS_KOLVO            :array[0..1] of string[15] =('Кіл-ть років',      'Кол-во лет');
const ncolMONTHES_KOLVO          :array[0..1] of string[20] =('Кіл-ть місяців',    'Кол-во месяцев');
const ncolNAME_DOK_OBR           :array[0..1] of string[15] =('Тип документа',     '');
const ncolSERIA                  :array[0..1] of string[10] =('Серія',             '');
const ncolNOMER                  :array[0..1] of string[10] =('Номер',             '');
const ncolDATE_VIDACHI           :array[0..1] of string[15] =('Дата видачі',       '');
const ncolTYPE_UCHZ              :array[0..1] of string[20] =('Тип навч. закладу', '');
const ncolIS_MAIN_BOOK           :array[0..1] of string[25] =('Головний док.',     '');
const ncolNAME_IS_COPY           :array[0..1] of string[10] =('Копія',             '');
const ncolPREDM                  :array[0..1] of string[10] =('Предмет',           '');
const ncolEKZ_FORM               :array[0..1] of string[15] =('Форма іспиту',      'Форма исп.');
const ncolIS_KOLVO_BALLOV        :array[0..1] of string[20] =('Врах. набр. бал',   'Учит. набр. бал.');
const ncolIS_PROF_PREDMET        :array[0..1] of string[15] =('Проф. предмет',     '');
const ncolNamePreimKat           :array[0..1] of string[25] =('Категорії переваг', 'Категории преимуществ');
const ncolNamePreim              :array[0..1] of string[15] =('Переваги',          'Преимущества');
const ncolIS_SELECTED            :array[0..1] of string[15] =('Вибір',             'Выбор');
const ncolSpecStaj               :array[0..1] of string[15] =('Спец. стаж',        'Спец. стаж');
const ncolOCENKA                 :array[0..1] of string[15] =('Оцінка',            'Оценка');
const ncolIS_OLD_AT              :array[0..1] of string[20] =('П`ятибальна сист.', 'Пятибальная сист.');
const ncolNamePreimSelect        :array[0..1] of string[25] =('Вибрані переваги',  'Выбранные преимущества');
const ncolCEL_ZAMOV              :array[0..1] of string[15] =('Замовник',          'Заказчик');
const ncolFIO                    :array[0..1] of string[5]  =('ПІБ',               'ФИО');
const ncolNUM_DOG                :array[0..1] of string[5]  =('Номер',             'Номер');
const ncolDATE_DOG               :array[0..1] of string[5]  =('Дата',              'Дата');
const ncolSUMMA                  :array[0..1] of string[5]  =('Сума',              'Сумма');
const ncolIS_LOCKED              :array[0..1] of string[15] =('Заблоковано',       'Заблокир.');
const ncolNAME_VEDOM_TYPE        :array[0..1] of string[15] =('Тип екз. відом.',   'Тип экз. ведом.');
const ncolIS_OCENKA_Vedom        :array[0..1] of string[15] =('Вступна оцінка',    'Вступит. оценка');
const ncolEKZ_DATE               :array[0..1] of string[15] =('Дата іспиту',       'Дата экзамена');
const ncolIS_NO_ROZPISKA         :array[0..1] of string[20] =('Не показ в заяві',  'Не показ в заявл');
const ncolIN_LANG                :array[0..1] of string[20] =('Ін. мова',          'Ин. язык');
const ncolLEVEL_VLADEN           :array[0..1] of string[20] =('Рівень володіння',  'Уровень владения');
const ncolDERG_ZAKAZ             :array[0..1] of string[20] =('Держ.заказ/договір','Гос. заказ/договор');
const ncolNOMER_DELA             :array[0..1] of string[15] =('№ справи',          '№ дела');
const ncolKolVo                  :array[0..1] of string[15] =('Кіл-ть',            'Кол-во');
const ncolVSEGO                  :array[0..1] of string[10] =('Усього',            'Всего');
const ncolKOLVO_BALLOV           :array[0..1] of string[15] =('Кіл-ть балів',      'Кол-во баллов');
const ncolMEDALISTI              :array[0..1] of string[15] =('Медалісти',         'Медалисты');
const ncolINSHI                  :array[0..1] of string[15] =('Інші',              'Другие');
const ncolKOLVO_VEDOM            :array[0..1] of string[15] =('Кіл-ть відом.',     'Кол-во ведом.');
const ncolKOLVO_IN_VEDOM         :array[0..1] of string[15] =('Кіл-ть у відом.',   'Кол-во в ведом.');
const ncolIS_REK_ZACHISL         :array[0..1] of string[20] =('Рек. до зарах.',    'Рек. к зачисл.');
const ncolIS_CEL_NABOR           :array[0..1] of string[15] =('Цільовий набір',    'Целевой набор');
const ncolDOLGNOST               :array[0..1] of string[15] =('Посада',            'Должность');
const ncolPRIM                   :array[0..1] of string[15] =('Примітка',          'Примечание');
const ncolNAME_FOB_PROT          :array[0..1] of string[30] =('Форма навчання для протоколу',   'Форма обучения для протокола');
const ncolDATE_FORM              :array[0..1] of string[20] =('Дата формування',   'Дата формирования');
const ncolNOMER_Prikaz           :array[0..1] of string[15] =('Номер наказу',      'Номер приказа');
const ncolDATE_PRIKAZ            :array[0..1] of string[15] =('Дата наказу',       'Дата приказа');
const ncolDATE_ZARAX             :array[0..1] of string[15] =('Дата зарах.',       'Дата зачисл.');
const ncolNAME_SROK_OB           :array[0..1] of string[15] =('Строк навчання',    'Срок обучения');
const ncolZamestitel             :array[0..1] of string[15]  =('Заступник',        'Заместитель');
const ncolSmRSt                  :array[0..1] of string[25]  =('Кошторис/Розділ/Стаття',  'Смета/Раздел/Статья');
const nColDateReg                :array[0..1] of string[15]  =('Дата реєстрації',    '');
const nColNameZabrDoc            :array[0..1] of string[20]  =('Забрав документи',   '');
const nColDateZabrDoc            :array[0..1] of string[15]  =('Дата Забр. док.',    '');
const ncolKat_Pri_D              :array[0..1] of string[20]  =('Категор. прийому',   '');
const ncolKat_Pri_X              :array[0..1] of string[20]  =('Категор. прийому(Х)','');
const ncolPeriod                 :array[0..1] of string[15]  =('Період',             'Период');
const ncolPrizn_zachisl          :array[0..1] of string[15]  =('Призн. зарах.',      'Призню зачисл');
const ncolIs_nedopusk            :array[0..1] of string[15]  =('Недопуск',           'Недопуск');
const ncolMODULE_NAME            :array[0..1] of string[15]  =('Назва модулю',       'Название модуля');
const ncolCondition              :array[0..1] of string[15]  =('Умова',              'Условие');
const ncolFRAZA_Protokola        :array[0..1] of string[15]  =('Фраза протоколу',    '');
const ncolNAME_PREIM             :array[0..1] of string[15]  =('Переваги',           '');
const ncolORDER_ZACH             :array[0..1] of string[15]  =('Порядок зарах.',     '');
const ncolIS_ZACH_RULE           :array[0..1] of string[20]  =('Зарах./Прийом док.', '');
const ncolNAME_ZACH_TYPE         :array[0..1] of string[20]  =('Тип зарахування',    'Тип зачисления');
const ncolPOTOK                  :array[0..1] of string[15]  =('Потік',              'Поток');
const ncolTYPE_DISC_NAME         :array[0..1] of string[15]  =('Тип дисципіни',  'Тип дисципины');
const ncolMIN_PERELIK_SPEC_NAME  :array[0..1] of string[30]  =('Назва спеціальності','Название специальности');
const ncolIS_OLD                 :array[0..1] of string[15]  =('Застаріле',          'Устаревшее');
const ncolMOVA                   :array[0..1] of string[15]  =('Мова',               'Язык');
const ncolUSPEC_NAME             :array[0..1] of string[35]  =('Назва збільшеної спеціальності','Название укрупненной специальности');


const nNewItemRowInfoText    :array[0..1] of string[50]  =('Клікніть сюди для додання нового запису',  'Кликните сюда для добавл. новой записи');

const nGroupBoxMova          :array[0..1] of string[10]  =('Мова',       'Язык');
const nGroupBoxColorShem     :array[0..1] of string[15]  =('Колір схеми','Цвет схемы');

const ncxGroupBoxNapr        :array[0..1] of string[30]  =('Напрямки підготовки',               'Направления подготовки');
const ncxGroupBoxSpec        :array[0..1] of string[50]  =('Перелік спеціальностей по напрямку','Перечень специальностей по направлению');
const ncxGroupBoxPlanNabora  :array[0..1] of string[50]  =('Плановий набір',                    'Плановый набор');
const ncxGroupBoxPerIspit    :array[0..1] of string[50]  =('Перелік іспитів',                   'Перечень экзаменов');
const ncxGroupBoxOtec        :array[0..1] of string[30]  =('Дані батька',                       'Данные отца');
const ncxGroupBoxMother      :array[0..1] of string[30]  =('Дані матері',                       'Данные матери');
const nGroupBoxCalcWorkStaj  :array[0..1] of string[30]  =('Підрахунок робочого стажу',         'Подсчет рабочего стажа');
const ncxGroupBoxOcenki      :array[0..1] of string[30]  =('Оцінки по проф. предметах',         'Оценки по проф. предметам');
const ncxGroupBoxSredniyBal  :array[0..1] of string[30]  =('Середній бал',                      'Средний бал');
const ncxGroupBoxPlanSelNabor:array[0..1] of string[30]  =('Цільовий набір',                    'Целевой набор');
const ncxGroupBoxDate        :array[0..1] of string[30]  =('Фільтр по даті',                    'Фильтр по дате');
const ncxGroupBoxContracts   :array[0..1] of string[30]  =('Контракти',                         'Контракты');
const nGroupBoxEkzRasp       :array[0..1] of string[30]  =('Розклад іспитів',                   'Расписание экзаменов');
const ncxGroupBoxDopDoc      :array[0..1] of string[30]  =('Додаткові документи',               'Дополнительные документы');
const ncxGroupBoxInLang      :array[0..1] of string[30]  =('Володіння іноземною мовою',         'Владение иностранным языком');
const ncxGroupBoxFilter      :array[0..1] of string[15]  =('Фільтр',                            'Фильтр');
const ncxGroupBoxPrKPrikZ    :array[0..1] of string[15]  =('Накази',                            'Приказы');
const ncxGroupBoxFiltrKategory    :array[0..1] of string[25]  =('Категоріі фільтру',            '');
const ncxGroupBoxSelectedFiltrKat :array[0..1] of string[25]  =('Вибрані категоріі',            '');
const ncxGroupBoxDataFoFiltr :array[0..1] of string[70]  =('Вибір або введення данних для фільтрування',            '');


const ncxRadioButtonUkr    :array[0..1] of string[15]  =('Українська',            '');
const ncxRadioButtonRus    :array[0..1] of string[15]  =('Російська',             '');
const ncxRadioButtonYellow :array[0..1] of string[15]  =('Жовта',                 '');
const ncxRadioButtonBlue   :array[0..1] of string[15]  =('Блакитна',              '');
const ncxRadioButtonAll    :array[0..1] of string[15]  =('Всі',                   'Все');
const ncxRadioButtonBezCn  :array[0..1] of string[20]  =('Без цільового набору',  'Без целевого набора');
const ncxRadioButtonSCn    :array[0..1] of string[20]  =('Із цільовим набором',   'С целевым набором');
const ncxRadioButtonNumDela     :array[0..1] of string[25]  =('№ Справи',                   '');
const ncxRadioButtonKatPriem    :array[0..1] of string[25]  =('Категорія прийому',          '');
const ncxRadioButtonProtDop     :array[0..1] of string[25]  =('Протокол про допуск',        '');
const ncxRadioButtonProtZarah   :array[0..1] of string[25]  =('Протокол про зарах.',        '');
const ncxRadioButtonPriznZarah  :array[0..1] of string[25]  =('Признак зарах.',             '');
const ncxRadioButtonNakazi      :array[0..1] of string[25]  =('Накази',                     '');
const ncxRadioButtonNedopysk    :array[0..1] of string[25]  =('Недопуск',                   '');
const ncxRadioButtonZabrDok     :array[0..1] of string[25]  =('Забрав документи',           '');
const nRadioButtonThisGodNab    :array[0..1] of string[25]  =('Поточний рік набору',        '');
const nRadioButtonNotThisGodNab :array[0..1] of string[25]  =('Інші роки набору',           '');
const ncxRadioButtonPovidProDopusk :array[0..1] of string[25]  =('Повідомлення про допуск', '');


const ncxLabelMustOverload :array[0..1] of string[40]  =('Потрібне перезавантаження програми',  '');
const nLabelLogin              :array[0..1] of string[10]  =('Логін',              'Логин');
const nLabelPassword           :array[0..1] of string[10]  =('Пароль',             'Пароль');

const nDBTextEditKat_Pri_D     :array[0..1] of string[30]  =('На загальній основі','На загальній основі');

const nLabelName               :array[0..1] of string[10]  =('Назва',             '');
const nLabelShortName          :array[0..1] of string[15]  =('Коротка назва',     '');
const nLabelKod                :array[0..1] of string[5]   =('Код',               '');
const nLabelNpp                :array[0..1] of string[20]  =('Порядковий номер',  '№ п/п');
const nLabelVinitPadeg         :array[0..1] of string[25]  =('Знахідний відмінок','Винительный падеж');
const nLabelRoditPadeg         :array[0..1] of string[25]  =('Родовий відмінок',  'Родительный падеж');
const nLabelDateBeg            :array[0..1] of string[25]  =('Дата початку',      'Дата начала');
const nLabelDateEnd            :array[0..1] of string[25]  =('Дата закінчення',   'Дата окончания');
const nLabelIsSpivbesida       :array[0..1] of string[15]  =('Співбесіда',        'Собеседование');
const nLabelIsZalik            :array[0..1] of string[10]  =('Залік',             'Зачет');
const nLabelOcenka             :array[0..1] of string[10]  =('Оцінка',            'Оценка');
const nLabelIS_FIZL_LGOTA      :array[0..1] of string[25]  =('Пільга фіз. особи', 'Льгота физ. лица');
const nLabelSHIFR              :array[0..1] of string[5]   =('Шифр',              'Шифр');
const nLabelMinPerelikPrim     :array[0..1] of string[35]  =('Примітка до спеціальності',     'Примечание к специальности');
const nLabelNameSpec           :array[0..1] of string[15]  =('Спеціальність',                  'Специальность');
const nLabelNameStud           :array[0..1] of string[60]  =('Освітньо-кваліфікаційний рівень','Образовательно-квалификационный уровень');
const nLabelNameObuchKat       :array[0..1] of string[50]  =('Категорія форми навчання',       'Категория формы обучения');
const nLabelLicenseValue       :array[0..1] of string[40]  =('Ліцензійний набір',              'Лицензионный набор');
const nLabelLicenseDateEnd     :array[0..1] of string[50]  =('Дата закінчення ліцензії',       'Дата окончания лицензии');
const nLabelCnFaculSpec        :array[0..1] of string[50]  =('Факультети та спеціальності',    '');
const nLabelCnKatStud          :array[0..1] of string[50]  =('Категорія навчання',             '');
const nLabelCnFormStud         :array[0..1] of string[50]  =('Форма навчання',                 '');
const nLabelFOB_PROT           :array[0..1] of string[50]  =('Форма навчання для протоколу',   '');
const nLabelGodNabora          :array[0..1] of string[50]  =('Рік набору абітурієнтів',        'Год набора абитур.');
const nLabelDergZakaz          :array[0..1] of string[50]  =('Держ. замовлення/договір',       'Гос. заказ/договор');
const nLabelPlanValue          :array[0..1] of string[50]  =('Планова кількість набору',       'Плановое кол-во набора');
const nLabelNameCnFak          :array[0..1] of string[15]  =('Факультет',                      'Факультет');
const nLabelKurs               :array[0..1] of string[15]  =('Курс навчання',                  'Курс обучения');
const nLabelYearsKolvo         :array[0..1] of string[35]  =('Кіл-ть років навчання',          'Кол-во лет обучения');
const nLabelMonthesKolvo       :array[0..1] of string[35]  =('Кіл-ть неповних місяців',        'Кол-во неполных месяцев');
const nLabelSrokOb             :array[0..1] of string[35]  =('Строк навчання',                 '');
const nLabelTypeDoc            :array[0..1] of string[35]  =('Тип документа про освіту',       '');
const nLabelSeria              :array[0..1] of string[35]  =('Серія',                          '');
const nLabelNomer              :array[0..1] of string[35]  =('Номер',                          '');
const nLabelDATE_VIDACHI       :array[0..1] of string[35]  =('Дата видачі',                    '');
const nLabelTypeUchz           :array[0..1] of string[35]  =('Тип навчального закладу',        '');
const nLabelUchz               :array[0..1] of string[35]  =('Найменування навчального закладу',        '');
const nLabelAdressUchz         :array[0..1] of string[35]  =('Місце розташування навч. закл.', '');
const nLabelIS_COPY            :array[0..1] of string[35]  =('Копія/оригінал',                 '');
const nLabelIS_MAIN_BOOK       :array[0..1] of string[35]  =('Головний документ',              '');
const nLabelPredm              :array[0..1] of string[35]  =('Предмет',                        '');
const nLabelEKZ_FORM           :array[0..1] of string[35]  =('Форма іспиту',                   '');
const nLabelEKZFORM_PRB        :array[0..1] of string[35]  =('Форма пробного іспиту',          '');
const nLabelIS_KOLVO_BALLOV    :array[0..1] of string[35]  =('Урах. набр. бал',                'Учит. набр. бал.');
const nLabelIS_PROF_PREDMET    :array[0..1] of string[35]  =('Профілюючий предмет',            'Профилирующий предмет');
const nLabelIS_ACTIVE          :array[0..1] of string[35]  =('Активний документ',              'Активный документ');
const nLabelParentFam          :array[0..1] of string[15]  =('Прізвище',                       'Фамилия');
const nLabelParentName         :array[0..1] of string[15]  =('Ім`я',                           'Имя');
const nLabelParentOtch         :array[0..1] of string[20]  =('По батькові',                    'Отчество');
const nLabelParentMestoRaboti  :array[0..1] of string[20]  =('Місце роботи',                   'Место работы');
const nLabelParentDoljnost     :array[0..1] of string[15]  =('Посада',                         'Должность');
const nLabelParentTel          :array[0..1] of string[15]  =('Телефон',                        'Телефон');
const nLabelFioAbit            :array[0..1] of string[30]  =('Виберіть ПІБ абітурієнта',       'Выберите ФИО абитуриента');
const nLabelMestoRaboti        :array[0..1] of string[20]  =('Місце роботи',                   'Место работы');
const nLabelDoljnost           :array[0..1] of string[15]  =('Посада',                         'Должность');
const nLabelAllStaj            :array[0..1] of string[20]  =('Повний стаж(міс.)',              'Полный стаж(мес.)');
const nLabelSpecStaj           :array[0..1] of string[20]  =('Спец. стаж(міс.)',               'Спец. стаж(мес.)');
const nLabelBalOn5System       :array[0..1] of string[20]  =('П`ятибальна система',            'Пятибальная система');
const nLabelCalcSerednBal      :array[0..1] of string[30]  =('Підрахунок середнього балу',     'Подсчет среднего бала');
const nLabelCel_Zamovnik       :array[0..1] of string[30]  =('Замовник цільового напрямку',    'Заказчик целевого направления');
const nLabelVid_Dii            :array[0..1] of string[30]  =('Вид дії',                        'Вид действия');
const nLabelNpk                :array[0..1] of string[30]  =('Напрямок роботи прийм. комісії', 'Напр. работы приемной комиссии');
const nLabelNPK_Short          :array[0..1] of string[30]  =('Напрямок роботи комісіі',        'Напр. работы комиссии');
const nLabelPotok              :array[0..1] of string[30]  =('Потік',                          'Поток');
const nLabelTypePerekl         :array[0..1] of string[30]  =('Тип перекладання',               'Тип перекладывания');
const nLabelUkr_Lang           :array[0..1] of string[30]  =('Знання української мови',        'Знание украинского языка');
const nLabelGurtog             :array[0..1] of string[30]  =('Потреба в гуртожитку',           'Потребность в общежитии');
const nLabelVID_DOG            :array[0..1] of string[30]  =('Вид договору',                   'Вид договора');
const nLabelCn_National        :array[0..1] of string[30]  =('Національність',                 'Национальность');
const nLabelIS_SB_OTKAZ        :array[0..1] of string[30]  =('Відмова від співбесіди',         'Отказ от собеседования');
const nLabelNomerDela          :array[0..1] of string[30]  =('Номер справи',                   'Номер дела');
const nLabelFiltrOnDate        :array[0..1] of string[30]  =('Фільтр по даті введення',        'Фильтр по дате ввода');
const nLabelFrom               :array[0..1] of string[5]   =('Від',                            'От');
const nLabelTo                 :array[0..1] of string[5]   =('До',                             'До');
const nLabelOnToday            :array[0..1] of string[15]  =('За сьогодні',                    'За сегодня');
const nLabelOnPeriod           :array[0..1] of string[15]  =('За період',                      'За период');
const nLabelTypeDepart         :array[0..1] of string[20]  =('Підрозділ',                      'Подразделение');
const nLabelNAME_DOG_STATUS    :array[0..1] of string[20]  =('Статус',                         'Статус');
const nLabelNAME_DOG_TYPE      :array[0..1] of string[20]  =('Тип',                            'Тип');
const nLabelMFO                :array[0..1] of string[20]  =('МФО',                            'МФО');
const nLabelFIO_PAYER          :array[0..1] of string[20]  =('Платник',                        'Плательщик');
const nLabelInfoNewData        :array[0..1] of string[20]  =('Нові дані',                      'Новые данные');
const nLabelInfoChangeData     :array[0..1] of string[20]  =('Зміна даних',                    'Изменение данных');
const nLabelInfoDelData        :array[0..1] of string[20]  =('Видалення картки',               'Удаление карточки');
const nLabelInfoViewData       :array[0..1] of string[20]  =('Перегляд даних',                 'Просмотр данных');
const nLabelDateBegObuch       :array[0..1] of string[30]  =('Дата початку навчання',          'Дата начала обучения');
const nLabelDateEndObuch       :array[0..1] of string[30]  =('Дата закінчення навчання',       'Дата окончания обучения');
const nLabelISPIT_VEDOM_TYPE   :array[0..1] of string[30]  =('Тип екзаменаційної відомості',   'Тип экзаменационной ведомости');
const nLabelIS_OCENKA_VSTUP    :array[0..1] of string[40]  =('Зараховувати як вступну оцінку', 'Засчитывать как вступительную оценку');
const nLabelEKZ_DATE           :array[0..1] of string[40]  =('Дата початку іспиту',            'Дата начала экзамена');
const nLabelIsNoRozpiska       :array[0..1] of string[40]  =('Не показувати в заяві',          'Не показывать в заявлении');
const nLabelCustomers          :array[0..1] of string[20]  =('Контрагент',                     'Контрагент');
const nLabelOTR_SPEC           :array[0..1] of string[25]  =('Отримана спеціальність',         'Полученная специальность');
const nLabelIN_LANG            :array[0..1] of string[30]  =('Іноземна мова',                  'Иностранный язык');
const nLabelLEVEL_VLADEN       :array[0..1] of string[20]  =('Рівень володіння',               'Уровень владения');
const nLabelTip_ISPIT          :array[0..1] of string[20]  =('Тип іспиту',                     'Тип экзамена');
const nLabelZAREESTROVANI_DO   :array[0..1] of string[25]  =('Зареєстровані до',               'Зарегистрированные до');
const nLabelDate_Prov          :array[0..1] of string[20]  =('Дата проведення',                'Дата проведения');
const nLabelPRIM               :array[0..1] of string[20]  =('Примітка',                       'Примечание');
const nLabelFIO                :array[0..1] of string[20]  =('ФИО',                            'ПІБ');
const nLabelDate               :array[0..1] of string[20]  =('Дата',                           'Дата');
const nLabelDatePrikaz         :array[0..1] of string[15]  =('Дата наказу',                    'Дата приказа');
const nLabelDateZarah          :array[0..1] of string[20]  =('Дата зарахування',               'Дата зачисления');
const nLabelDateForm           :array[0..1] of string[20]  =('Дата Формування',                'Дата Формирования');
const nLabelZamestitel         :array[0..1] of string[20]  =('Заступник',                      'Заместитель');
const nLabel_Smeta             :array[0..1] of string[20]  =('Кошторис',                       'Смета');
const nLabel_Statiya           :array[0..1] of string[20]  =('Стаття',                         'Статья');
const nLabel_Razdel            :array[0..1] of string[20]  =('Розділ',                         'Раздел');
const nLabelFiltrOnFio         :array[0..1] of string[20]  =('Фільтрувати по ПІБ',             'Фильтровать по ФИО');
const nLabelTYP_KT_STD         :array[0..1] of string[60]  =('Освітньо-кваліфікаційний рівень','Образовательно-квалификационный уровень');
const nLabelModuleName         :array[0..1] of string[60]  =('Назва модулю',                   'Наименование модуля');
const nLabelID                 :array[0..1] of string[60]  =('Індефікатор',                    'Индефикатор');
const nLabelComponentName      :array[0..1] of string[60]  =('Назва компоненту',               '');
const nLabelSELECT_STATEMENT   :array[0..1] of string[60]  =('Текст запросу',                  '');
const nLabelWHERE_STATEMENT    :array[0..1] of string[60]  =('Поле поушуку',                   '');
const nLabelKolVo_Records      :array[0..1] of string[60]  =('Кількість записів',              '');
const nLabelFRAZA_Protokola    :array[0..1] of string[15]  =('Фраза протоколу',                '');
const nLabelNAME_PREIM         :array[0..1] of string[15]  =('Переваги',                       '');
const nLabelORDER_ZACH         :array[0..1] of string[20]  =('Порядок зараххування',           '');
const nLabelIS_ZACH_RULE       :array[0..1] of string[30]  =('Зарахування/Прийом документів',  '');
const nLabelNOMER_PRAVIL       :array[0..1] of string[30]  =('Номер пункту із правил прийому', '');
const nLabelKAT_PRI_D          :array[0..1] of string[30]  =('Категорія прийому документів',   '');
const nLabelDatePerekl         :array[0..1] of string[20]  =('Дата перекладання',              'Дата перекладывания');
const nLabelFiltrOnPerekl      :array[0..1] of string[30]  =('Без переклавших',                'Без переклавших');
const nLabelFiltrOnZach        :array[0..1] of string[30]  =('Зараховані',                     'Зачисленные');
const nLabelTypeDisc           :array[0..1] of string[20]  =('Тип дисципліни',                 'Тип дисциплины');
const nLabelMinPerelikSpec     :array[0..1] of string[50]  =('Специальність з переліку спеціальностей МОН',
                                                             'Специальность из перечня специальностей МОН');


const nTabSheetVstup          :array[0..1] of string[15]  =('Вступ',                    'Поступление');
const nTabSheetDocEducation   :array[0..1] of string[25]  =('Документи про освіту',     'Документы об образовании');
const nTabSheetOcenki         :array[0..1] of string[10]  =('Оцінки',                   'Оценки');
const nTabSheetPerevagi       :array[0..1] of string[15]  =('Переваги',                 'Преимущества');
const nTabSheetDopolnVedomosti:array[0..1] of string[25]  =('Додаткові відомості',      'Дополнительные сведения');

const nTabSheetWorkStaj     :array[0..1] of string[15]  =('Стаж роботи',              'Стаж работы');
const nTabSheetParents      :array[0..1] of string[15]  =('Батьки',                   'Родители');
const nTabSheetFioAbit      :array[0..1] of string[20]  =('ПІБ абітурієнта',          'ФИО абитуриента');
const nTabSheetGodNabora    :array[0..1] of string[15]  =('Рік набору',               'Год набора');


const nButton_Enter       :array[0..1] of string[5]  =('OK','ОК');
const nButton_Cansel      :array[0..1] of string[10] =('Відмінити','');

// Названия к кнопкам меню на главной формы
const nItemWork           :array[0..1] of string[10] =('Робота',      '');
const nItemSpravochniki   :array[0..1] of string[15] =('Довідники',   '');
const nConfiguraciya      :array[0..1] of string[15] =('Конфігурація','');

const ndxBarSubItemPlanNabora         :array[0..1] of string[50] =('Плани набору на навчання','Планы набора на обучение');
const ndxBarSubItemIspit              :array[0..1] of string[50] =('Вступні випробування',    'Вступительные испытания');
const ndxBarSubItemFacSpecForm        :array[0..1] of string[50] =('Факультети, спеціальності, форми навчання',
                                                                   'Факультеты, специальности, формы обучения');
const ndxBarSubItemPreim              :array[0..1] of string[50] =('Переваги абітурієнта',    'Переваги абітурієнта');
const ndxBarSubItemObuch              :array[0..1] of string[50] =('Характеристики навчання', 'Характеристики обучения');
const ndxBarSubItemHaraktWorkPrK      :array[0..1] of string[50] =('Характеристики роботи приймальної комісії',
                                                                   'Характеристики работы приемочной комиссии');
const ndxBarSubItemObrazov            :array[0..1] of string[50] =('Попередня освіта абітуріента',
                                                                   'Предыдущее образование абитуриента');
const ndxBarSubItemPerelikNaprAndSpec :array[0..1] of string[50] =('Перелік напрямів та спеціальностей (МОН)',
                                                                   'Перечень направлений и специальностей (МОН)');
const ndxBarSubItemOtherSprav         :array[0..1] of string[50] =('Інші довідники',          'Другие справочники');
const ndxBarSubItemZarah              :array[0..1] of string[50] =('Зарахування',             'Зачисление');
const ndxBarSubItemReports            :array[0..1] of string[50] =('Звіти',                   'Отчеты');


const ndxBarStaticLabelGodNabora :array[0..1] of string[20]  =('Рік набору',  'Год набора');

const ndxBtnOptionInterfase :array[0..1] of string[20] =('Настройка Інтерфейсу',        '');
const ndxBtnOptionWork      :array[0..1] of string[20] =('Опції роботи',         'Опции работы');

const ndxBtnFormStudy        :array[0..1] of string[30] =('Довідник Форм навчання',     '');
const ndxBtnCategoryStudy    :array[0..1] of string[99] =('Довідник Категорій навчання за освітньо-кваліфікаційним рівнем',
                                                          'Справочник Категорий обучения за просветительно-квалификационным уровнем');
const ndxBtnPeople           :array[0..1] of string[20] =('Довідник Фіз. Осіб',         '');
const ndxBtnSpDepartment     :array[0..1] of string[35] =('Довідник підрозділів',       '');
const ndxBtnFacultySpecGroup :array[0..1] of string[70] =('Довідник факультетів та спеціальностей','');
const ndxBtnCustomers        :array[0..1] of string[40] =('Довідник Контрагентів','');


const ndxBtnPrK_SP_DERG_ZAKAZ      :array[0..1] of string[60] =('Довідник (державне замовлення/договір)',
                                                                'Справочник (Гос. заказ/договор)');
const ndxBtnPrK_SP_EXZFORM         :array[0..1] of string[70] =('Довідник форм вступних випробувань',
                                                                'Справочник форм вступительных испытаний');
const ndxBtnPRK_SP_FOB_PROT        :array[0..1] of string[60] =('Довідник форм навчання для протоколу',
                                                                'Справочник форм обучения для протокола');
const ndxBtnPRK_SP_FORM_OBUCH_KATEGORY  :array[0..1] of string[60] =('Довідник категорій форми навчання',
                                                                     'Справочник категорий формы обучения');
const ndxBtnPRK_SP_GOD_NABORA      :array[0..1] of string[100]=('Довідник років набору абітурієнтів',
                                                                'Справочник годов набора абитуриентов');
const ndxBtnPrK_SP_GURTOG          :array[0..1] of string[50] =('Довідник потреби у гуртожитку',
                                                                'Справочник потребности в общежитии');
const ndxBtnPrK_SP_IN_LANG         :array[0..1] of string[50] =('Довідник іноземних мов',
                                                                'Справочник иностранных языков');
const ndxBtnPrK_SP_IS_COPY         :array[0..1] of string[50] =('Довідник(Копія/оригінал)',
                                                                'Справочник (Копия/оригинал)');
const ndxBtnPrK_SP_KAT_PRI_X       :array[0..1] of string[150]=('Довідник категорії прийому документів для XІDІTOG',
                                                                'Справочник категории приема документов для XIDITOG');
const ndxBtnPrK_SP_KURS            :array[0..1] of string[50] =('Довідник курсів навчання',
                                                                'Справочник курсов обучения');
const ndxBtnPrK_SP_LEVEL_VLADEN    :array[0..1] of string[150]=('Довідник рівнів володіння іноземною мовою',
                                                                'Справочник уровней владения иностранным языком');
const ndxBtnPrK_SP_MOVA            :array[0..1] of string[50] =('Довідник мов навчання',
                                                                'Справочник языков обучения');
const ndxBtnPrK_SP_NPK             :array[0..1] of string[150]=('Довідник напрямків роботи приймальної комісії',
                                                                'Справочник направлений работы приемной комиссии');
const ndxBtnPRK_SP_OCENKA          :array[0..1] of string[100]=('Довідник оцінок вступних випробувань',
                                                                'Справочник оценок вступительных испытаний');
const ndxBtnPrK_SP_OLD_PRICH       :array[0..1] of string[50] =('Довідник причин перерви навчання',
                                                                'Справочник причин перерыва обучения');
const ndxBtnPrK_SP_PREDM_u         :array[0..1] of string[60] =('Довідник предметів конкурсного циклу',
                                                                'Справочник предметов конкурсного цикла');
const ndxBtnPrK_SP_PREDM           :array[0..1] of string[60] =('Довідник предметів атестату',
                                                                'Справочник предметов атестата');
const ndxBtnPrK_SP_PREIM           :array[0..1] of string[100] =('Довідник переваг абітурієнта при вступі',
                                                                 'Справочник преимуществ абитуриента при поступлении');
const ndxBtnPrK_SP_PRICH           :array[0..1] of string[50] =('Довідник причин відмови',
                                                                'Справочник причин отказа');
const ndxBtnPrK_SP_PRIZN_ZACHISL   :array[0..1] of string[50] =('Довідник ознак зарахування',
                                                                'Справочник признаков зачисления');
const ndxBtnPrK_SP_RISH_TYPE       :array[0..1] of string[60] =('Довідник рішень приймальної комісії',
                                                                'Справочник решений приемной комиссии');
const ndxBtnPrK_SP_TYPE_DOK_OBR    :array[0..1] of string[100]=('Довідник типів документів про освіту',
                                                                'Справочник типов документов об образовании');
const ndxBtnPrK_SP_TYPE_PEREKL     :array[0..1] of string[100]=('Довідник типів перекладання документів',
                                                                'Справочник типов перекладывания документов');
const ndxBtnPrK_SP_TYPE_RAZN       :array[0..1] of string[100]=('Довідник типів академічних різниць',
                                                                'Справочник типов академических разниц');
const ndxBtnPrK_SP_TYPE_UCHZ       :array[0..1] of string[100]=('Довідник типів освітніх установ',
                                                                'Справочник типов образовательных учреждений');
const ndxBtnPrK_SP_UKR_LANG        :array[0..1] of string[100]=('Довідник знання української мови',
                                                                'Справочник знания украинского языка');
const ndxBtnPrK_SP_VID_DII         :array[0..1] of string[50] =('Довідник видів дії',
                                                                'Справочник видов действия');
const ndxBtnPRK_SP_VID_DOG         :array[0..1] of string[60] =('Довідник найменувань видів договорів',
                                                                'Справочник наименований видов договоров');
const ndxBtnPrK_SP_ZABR            :array[0..1] of string[100]=('Довідник ознаки "забрал документи"',
                                                                'Справочник признака "забрал документы"');
const ndxBtnPRK_SP_KAT_PRI_D       :array[0..1] of string[150]=('Довідник категорії прийому документів',
                                                                'Справочник категории приема документов');


const ndxBtnPrK_SP_MIN_PERELIK_PRIM :array[0..1] of string[100]=('Довідник приміток до переліку спеціальностей',
                                                                'Справочник примечаний к перечню специальностей');
const ndxBtnPrK_SP_MIN_PERELIK_SPEC :array[0..1] of string[100]=('Довідник переліку спеціальностей',
                                                                'Справочник перечня специальностей');
const ndxBtnPrK_SP_TYPE_KAT_STUD    :array[0..1] of string[100]=('Довідник Освітньо-кваліфікаційних рівнів',
                                                                 'Справочник Образовательно-квалификационных уровней');
const ndxBtnPrK_SP_MIN_PERELIK_SHIFR:array[0..1] of string[100]=('Довідник шифрів спеціальностей',
                                                                 'Справочник шифров специальностей');
const ndxBtnPRK_SP_VUZ_LICENCE      :array[0..1] of string[100]=('Додаток до ліцензій ВУЗА на підготовку фахівців',
                                                                 'Приложение к лицензиям ВУЗА на подготовку специалистов');
const ndxBtnPrK_SP_PLAN_NABORA      :array[0..1] of string[50] =('План набору на навчання',
                                                                 'План набора на обучение');
const ndxBtnPrK_SP_SROK_OB          :array[0..1] of string[50] =('Довідник строків навчання',
                                                                 'Справочник сроков обучения');
const ndxBtnPRK_SP_EDUCORG          :array[0..1] of string[70] =('Довідник Освітніх установ',
                                                                 'Справочник Образовательных учреждений');
const ndxBtnPRK_SP_PERELIK_ISPIT    :array[0..1] of string[50] =('Перелік іспитів',
                                                                 'Перечень экзаменов');
const ndxBtnPRK_SP_CEL_ZAMOVNIK     :array[0..1] of string[50] =('Довідник замовників цільового набору',
                                                                 'Справочник заказчиков целевого набора');
const ndxBtnPRK_SP_PLAN_CEL_NABOR   :array[0..1] of string[50] =('План цільового набору',
                                                                 'План целевого набора');
const ndxBtnPRK_SP_POTOK            :array[0..1] of string[50] =('Довідник потоків набору',
                                                                 'Справочник потоков набора');
const ndxBtnPRK_SP_ISPIT_VEDOM_TYPE :array[0..1] of string[50] =('Довідник типів екзаменаційних відомостей',
                                                                 'Справочник типов экзаменационных ведомостей');
const ndxBtnPRK_SP_TYPE_DOP_DOK     :array[0..1] of string[50] =('Довідник типів інших документів',
                                                                 'Справочник типов других документов');
const ndxBtnPRK_SP_EKZ_RASP         :array[0..1] of string[80] =('Розклад проведення вступних випробувань по датах',
                                                                 'Расписание проведения вступительных испытаний по датам');
const ndxBtnPRK_REK_DO_ZARAH        :array[0..1] of string[50] =('Рекомендації до зарахування',
                                                                 'Рекомендации к зачислению');
const ndxBtnPRK_SP_DOLGNOST_PK      :array[0..1] of string[50] =('Довідник посад приймальної комісії',
                                                                 'Справочник должностей приемной комиссии');
const ndxBtnPRK_SP_SOSTAV_PK        :array[0..1] of string[50] =('Довідник складу приймальної комісії',
                                                                 'Справочник состава приемной комиссии');
const ndxBtnPRK_SP_FORM_STUD_FOB_PROT:array[0..1] of string[50]=('Зв`язок "звичайних" форм навчання й для протоколу',
                                                                 'Связь "обычных" форм обучения и для протокола');
const ndxBtnPrK_PROT_ZACH           :array[0..1] of string[50] =('Протоколи та накази про зарахування',
                                                                 'Протоколы и приказы о зачислении');
const ndxBtnPrK_PROT_DOPUSK         :array[0..1] of string[50] =('Протоколи  про допуск',
                                                                 'Протоколы  о допуске');
const ndxBtnPRK_SP_COUNTING_RULE    :array[0..1] of string[100]=('Довідник правил зарахування, які припускають перевірку певних умов на БД',
                                                                 'Справочник правил зачисления, которые предполагают проверку определенных условий на БД');
const ndxBtnPrKKlassViewWithFilter  :array[0..1] of string[50] =('Картки поточного набору даних',
                                                                 'Карточки текущего набора данных');
const ndxBtnAbit                    :array[0..1] of string[50] =('Облікова картка абітурієнта',
                                                                 'Учетная карточка абитуриента');
const ndxBtnAbitPrK_Ekz_Vedom       :array[0..1] of string[50] =('Екзаменаційні відомісті',
                                                                 'Экзаменационные ведомости');
const ndxBtnPrK_Filtr               :array[0..1] of string[50] =('Пошук даних про абітурієнтів',
                                                                 'Поиск данных про абитуриентов');


const nButtonAbitPrintZAYAVA     :array[0..1] of string[25] =('Заява',       'Заявление');
const nButtonAbitPrinEKZ_LIST    :array[0..1] of string[25] =('Екз. листок', 'Экз. лист');
const nButtonAbitPrinROSPISKA    :array[0..1] of string[25] =('Розписка',    'Расписка');



// Названия Форм
const nFormPrK_Caption             :array[0..1] of string[20] =('Приймальна комісія',   'Приемная комиссия');
const nFormLogin_Caption           :array[0..1] of string[20] =('Приймальна комісія',   'Приемная комиссия');
const nFormOptionInterfase_Caption :array[0..1] of string[20] =('Настройка Інтерфейсу', 'Настройка Интерфейса');
const nFormOptionWork_Caption      :array[0..1] of string[20] =('Опції роботи',         'Опции работы');
const nFormPtint_Caption           :array[0..1] of string[20] =('Друк',                 'Печать');
const nFormWhatsNew_Caption        :array[0..1] of string[20] =('Що нового',            'Что нового');

// Названия Справочников
const nFormPUB_SP_MOVA_Caption              :array[0..1] of string[50] =('Довідник мов навчання','Справочник языков обучения');
const nFormPUB_SP_USPEC_Caption             :array[0..1] of string[50] =('Довідник спеціальностей (без мови навчання)','Справочник специальностей (без языка обучения)');
const nFormPUB_SP_SPEC_Caption              :array[0..1] of string[50] =('Довідник спеціальностей','Справочник специальностей');
const nForm_JN_FAK_SPEC_Caption             :array[0..1] of string[50] =('Факультети та спеціальності','Факультеты и специальности');
//******************************************************************************

const nActionPerekl                         :array[0..1] of string[10] =('Перекласти','Переложить');
const nOldData                              :array[0..1] of string[30] =('Попередні відомості','Предыдущие сведенья');
const nNewData                              :array[0..1] of string[30] =('Нові відомості','Новые сведенья');
const nFormPRK_Perekl_Caption               :array[0..1] of string[100] =('Перекладання справи абітурієнта',
                                                                          'Перекладывание дела абитуриента');
const ndxBtnPrK_SP_TYPE_ZACH_Caption        :array[0..1] of string[100]=('Довідник типів зарахування',
                                                                         'Справочник типов зачисления');
const nFormPRK_SP_TYPE_ZACH_Caption         :array[0..1] of string[100]=('Довідник типів зарахування','Справочник типов зачисления');
const nFormPRK_SP_TYPE_DISC_Caption         :array[0..1] of string[100]=('Довідник типів дисциплін','Справочник типов дисциплин');

const nFormPRK_SP_DISC_Caption              :array[0..1] of string[150]=('Довідник дисциплін','Справочник дисциплин');

const nLabelFinanceForm                     :array[0..1] of string[20] =('Фінансування','Финансирование');
const nFinance_Budjet                       :array[0..1] of string[10] =('Бюджет','Бюджет');
const nFinance_Kontrakt                     :array[0..1] of string[10] =('Контракт','Контракт');

const nLabelFormObuch                       :array[0..1] of string[20] =('Форма навчання','Форма обучения');
const nFormObuch_Stacionar                  :array[0..1] of string[10] =('Стаціонар','Стационар');
const nFormObuch_Zaochn                     :array[0..1] of string[10] =('Заочна','Заочная');
const nFormObuch_Vechern                    :array[0..1] of string[10] =('Вечірня','Вечерняя');

const nLabelDocType                         :array[0..1] of string[20] =('Тип документа','Тип документа');
const nLabelDocType_SvidRojden              :array[0..1] of string[30] =('Свідоцтво про народження','Свидетельство о рождении');
const nLabelDocType_Passport                :array[0..1] of string[30] =('Паспорт','Паспорт');
const nLabelDocType_VoenBilet               :array[0..1] of string[30] =('Військовий квиток','Военный билет');

const nLabelDeistvDo                        :array[0..1] of string[20] =('Дійсний до','Действителен до');
const nLabelDataVidach                      :array[0..1] of string[20] =('Дата видачі','Дата выдачи');

const nLabelGroup                           :array[0..1] of string[10] =('Група','Группа');
const nLabelQualification                   :array[0..1] of string[20] =('Кваліфікація','Квалификация');

const nError                               :array[0..1] of string[10] =('Помилка!','Ошибка!');
const nMsgEmptyExportPassTypes             :array[0..1] of string     =('Потрібно поставити у відповідність хоча б одному з наведених типів документів значення з бази даних','Необходимо поставить в соответсвие хотя бы одному из приведенных типов документов значение из базы данных');
const nMsgEmptyExportFormObuch             :array[0..1] of string     =('Потрібно поставити у відповідність хоча б одній з наведених форм навчання значення з бази даних','Необходимо поставить в соответсвие хотя бы одной из приведенных форм обучения значение из базы данных');

const nActiontPrintTitul                   :array[0..1] of string[30] =('Друк тит.листа',                'Печать тит.листа');
const nHintActiontPrintTitul               :array[0..1] of string[30] =('Друк титульного листа',         'Печать титульного листа');
const nActiontPrintVitiag                  :array[0..1] of string[30] =('Друк витягу з наказу',          'Печать выдержки из приказа');
const nHintActiontPrintVitiag              :array[0..1] of string[30] =('Друк витягу з наказу',          'Печать выдержки из приказа');
implementation

end.
