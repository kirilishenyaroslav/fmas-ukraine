unit uConstants;

interface
                                                 {Укр}       {Рус}
const nLayoutLang  :array[0..1] of PAnsiChar =('00000422','00000419');

const nActiont_OK          :array[0..1] of string[5]  =('ОК',                  'ОК');
const nActiont_Cansel      :array[0..1] of string[10] =('Відмінити',           '');

const nHintActiont_OK         :array[0..1] of string[5]  =('ОК',            'ОК');
const nHintActiont_Cansel     :array[0..1] of string[10] =('Відмінити',     '');

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


const nLabelLogin              :array[0..1] of string[10]  =('Логін',              'Логин');
const nLabelPassword           :array[0..1] of string[10]  =('Пароль',             'Пароль');


const nFormLogin_Caption           :array[0..1] of string[25] =('Контракти абітурієнтів',   'Контракты абитуриентов');
const nFormAbitCn_Caption          :array[0..1] of string[25] =('Контракти абітурієнтів',   'Контракты абитуриентов');
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const nActiont_Obnov       :array[0..1] of string[10] =('Оновити',             'Обновить');
const nAction_Exit         :array[0..1] of string[10] =('Вийти',               'Выйти');
const nActionAddCN         :array[0..1] of string[20] =('Додати договір',      'Добавить договор');
const nActionChangeCN      :array[0..1] of string[20] =('Змінити договір',     'Изменить договор');
const nActionDelCN         :array[0..1] of string[20] =('Видалити договір',    'Удалить договор');
const nActionChangeCN_Status    :array[0..1] of string[20] =('Змінити статус',    'Изменить статус');
const nActiontPrint        :array[0..1] of string[10] =('Друк',                'Печать');

const nHintAction_Obnov       :array[0..1] of string[10] =('Оновити',       'Обновить');
const nHintAction_Exit        :array[0..1] of string[10] =('Вийти',         'Выйти');
const nHintAction_Add         :array[0..1] of string[10] =('Додати',        'Добавить');
const nHintAction_Change      :array[0..1] of string[10] =('Змінити',       'Изменить');
const nHintAction_Del         :array[0..1] of string[10] =('Видалити',      'Удалить');
const nHintActiontPrint       :array[0..1] of string[10] =('Друк',          'Печать');
const nHintActionChangeCN_Status    :array[0..1] of string[40] =('Змінити статус договору на кандидат',    'Изменить статус договора на кандидат');
const nHintActiontSign        :array[0..1] of string[10] =('Підписати',     'Подписать');
const nHintActiontUnsign      :array[0..1] of string[15] =('Зняти підпис',  'Снять подпись');
const nHintActiontPriceCurrent     :array[0..1] of string[15] =('Прейскурант',  'Прейскурант');

const nStatBarObnov       :array[0..1] of string[20] =('F5 - Обновити',  '');
const nStatBarExit        :array[0..1] of string[20] =('Esc - Вийти',    '');

const ncolFIO                    :array[0..1] of string[5]  =('ПІБ',               'ФИО');
const ncolNOMER_DELA             :array[0..1] of string[15] =('№ справи',          '№ дела');
const ncolNAME_FAK        :array[0..1] of string[15]  =('Факультет',         'Факультет');
const ncolNAME_SPEC       :array[0..1] of string[15]  =('Спеціальність',     'Специальность');
const ncolSHORT_NAME_CN_FORM_STUD:array[0..1] of string[15] =('Форма навч.',    'Форма обуч.');
const ncolSHORT_NAME_CN_KAT_STUD :array[0..1] of string[20] =('ОКР','ОКР');
const ncolIS_LOCKED              :array[0..1] of string[15] =('Контракт',       'Контракт');

const ncxGroupBoxContracts   :array[0..1] of string[30]  =('Контракти',                         'Контракты');
const ncxGroupBoxFilter      :array[0..1] of string[15]  =('Фільтр',                            'Фильтр');

const nLabelOnToday            :array[0..1] of string[15]  =('За сьогодні',                    'За сегодня');
const nLabelOnAll           :array[0..1] of string[15]  =('Всі',                      'Все');
const nLabelButtonFilter           :array[0..1] of string[15]  =('Фільтрувати',                      'Фильтровать');
const nLabelTIN           :array[0..1] of string[20]  =('Податковий номер',                      'Налоговый номер');
const LabelSpec           :array[0..1] of string[15]  =('Спеціальність',                      'Специальность');
const nLabelFIO           :array[0..1] of string[15]  =('Прізвище',                      'Фамилия');

const nLabelBeg                :array[0..1] of string[5]   =('Поч.',                            'Нач.');
const nLabelEnd                :array[0..1] of string[5]   =('Кін.',                             'Кон.');

const ncolNUM_DOG                :array[0..1] of string[5]  =('Номер',             'Номер');
const ncolDATE_DOG               :array[0..1] of string[5]  =('Дата',              'Дата');
const ncolSUMMA                  :array[0..1] of string[5]  =('Сума',              'Сумма');

const nLabelNAME_DOG_STATUS    :array[0..1] of string[20]  =('Статус',                         'Статус');
const nLabelNAME_DOG_TYPE      :array[0..1] of string[20]  =('Тип',                            'Тип');
const nLabelMFO                :array[0..1] of string[20]  =('МФО',                            'МФО');
const nLabelFIO_PAYER          :array[0..1] of string[20]  =('Платник',                        'Плательщик');

const nMsgErrorTransaction:array[0..1] of string[50]  =('Неможливо виповнити запит!',
                                                       'Невозможно выполнить запрос');
const nMsgTryAgain        :array[0..1] of string[20]  =('Спробуйте ще раз.','Попробуйте еще');
const nMsgOr              :array[0..1] of string[5]   =(' Або ',' Или ');
const nMsgBoxTitle        :array[0..1] of PAnsiChar   =('Увага','Внимание');
const nMsgToAdmin         :array[0..1] of string[60]  =('Зверніться, будь ласка, до адміністратора',
                                                       'Обратитесь к администратору');
const nMsgDelContract     :array[0..1] of string[60]  =('Ви дійсно бажаєте видалити контракт цього абітуріента',
                                                       'Вы действительно хотите удалить контракт этого абитуриента');

const nMsgChangeCN_Status :array[0..1] of string[60]  =('Ви дійсно бажаєте змінити статус договору на кандидат',
                                                       'Вы действительно хотите изменить статус договора на кандидат');
const nActionLink           :array[0..1] of string[15]  =('Зв`язяти',                      'Связать');
const nActionPrikzObnov3           :array[0..1] of string[15]  =('Наказ 3 ПК',                      'Приказ 3 ПК');
const nActionPrikzObnov12           :array[0..1] of string[15]  =('Наказ 1,2,4 ПК',                      'Приказ 1,2,4 ПК');

const nMsgIsSigned     :array[0..1] of string[60]  =('Цей контракт вже підписан!','Этот контракт уже подписан!');
const nMsgIsNotSigned     :array[0..1] of string[60]  =('Цей контракт ще не підписан!','Этот контракт еще не подписан!');
const nMsgIsActSigned     :array[0..1] of string[60]  =('Kонтракт підписан!','Kонтракт подписан!');
const nMsgIsActNotSigned     :array[0..1] of string[60]  =('З контракту знят підпис!','С контракта снята подпись!');

const  nMsgNotHaveRights             :array[0..1] of String=('Ви не маєте повноважень для здійснення даної дії!',
                                                            'У Вас нет прав для осуществления данного действия!');
const  nMsgGoToAdmin           :array[0..1] of String=('Зверніться до адміністратора.','Обратитесь к администратору.');
const  nMsgActionDenied        :array[0..1] of String=('Дія заборонена','Действие запрещено');
const  nMsgEditDenied          :array[0..1] of String=('Ви не маєте прав редагувати цей контракт','Ви не имеете прав редактировать этот контракт');
const  nMsgUnadded             :array[0..1] of String=('Спочатку необхідно додати контракт!','Сначала необходимо добавить контракт');
const  nMsgSignDeny            :array[0..1] of String=('Ви не маєте прав на підпис контрактів абітурієнтів!','Ви не имеете прав на подпись контрактов абитуриентов');
const  nMsgUnSignDeny           :array[0..1] of String=('Ви не маєте прав на зняття підпису з контрактів абітурієнтів!','Ви не имеете прав на снятие подписи с контрактов абитуриентов!');

const  nMsgDeny          :array[0..1] of String=('Ви не маєте прав виконувати цю дію!','Ви не имеете прав на віполнение єтого действия!');
implementation

end.
