unit Resources_unit;

interface

resourcestring
  {Глобальные константы системы}

  PUB_ACTION_ADD_CONST          ='Добавить';
  PUB_ACTION_DELETE_CONST       ='Удалить';
  PUB_ACTION_UPDATE_CONST       ='Изменить';
  PUB_ACTION_REFRESH_CONST      ='Обновить';
  PUB_ACTION_CLOSE_CONST        ='Закрыть';
  PUB_ACTION_PRINT_CONST        ='Печать';
  PUB_ACTION_HELP_CONST         ='Помощь';
  PUB_ACTION_CHOOSE_CONST       ='Выбрать';
  PUB_ACTION_FILTER_CONST       ='Фильтр';
  PUB_ACTION_ANALIZE_CONST      ='Анализ';
  PUB_ACTION_SET_CONST          ='Установить';

  PUB_BUTTON_OK_CONST           ='Принять';
  PUB_BUTTON_CANCEL_CONST       ='Отменить';
  PUB_BUTTON_YES_CONST          ='Да';
  PUB_BUTTON_NO_CONST           ='Нет';
  PUB_BUTTON_CHOOSE_CONST       ='Выбрать';

  PUB_MESSAGE_WARNING           ='Внимание!';
  PUB_MESSAGE_ERROR             ='Ошибка!';
  PUB_MESSAGE_HINT              ='Предупреждение!';
  PUB_UNDER_CONSTRUCTION_CONST  ='На стадии разработки';

  PUB_STATE_ON_DATE_CONST       ='Состояние на ';
  PUB_KEKV_SPR                  ='Справочник КЕКВов';
  PUB_GROUP_CONST               ='Панель для группировки информации';

  PUB_COLTITL_PROP_TITLE        ='Название свойства';
  PUB_COLTITL_DATE_BEG          ='Дата начала';
  PUB_COLTITL_DATE_END          ='Дата окончания';
  PUB_COLTITL_GROUP             ='Группа';
  PUB_COLTITL_SCH_TITLE         ='Счет';
  PUB_COLTITL_ID_PROP           ='Ид.свойства.';
  PUB_COLTITL_ID_SCH            ='Ид.счета.';
  PUB_COLTITL_SCH_END           ='Начало функционирования счета';
  PUB_COLTITL_SCH_BEG           ='Конец функционирования счета.';

  PUB_COLTITL_PR_NUM            ='Номер';
  PUB_COLTITL_PR_TIT            ='Свойство';
  PUB_COLTITL_PR_VAL            ='Значение';
  PUB_COLTITL_PR_GRP            ='Группа';



  {Константы использующиеся в справочнике контрагентов }
  CUSTOMER_INITYPEMENCONST      ='Работа с должностями контактных лиц';
  CUSTOMER_MBUHG_CONST          ='Главный бухгалтер';
  CUSTOMER_MUST_BANK            ='Необходимо ввести банк';
  CUSTOMER_MUST_TYPE_ACC        ='Необходимо ввести тип счета';
  CUSTOMER_MUST_ACCOUNT         ='Необходимо ввести счет';
  CUSTOMER_MOD_CONST            ='Изменить';
  CUSTOMER_ADD_CONST            ='Добавить';
  CUSTOMER_ADD_CHILD_CONST      ='Добавить дочерним';
  CUSTOMER_NEW_ACCOUNT_CONST    ='Добавить новый счет';
  CUSTOMER_ACC_TYPE_CONST       ='Тип счета';
  CUSTOMER_BANK_CONST           ='Банк';
  CUSTOMER_FIND_TEXT            ='Поиск';
  CUSTOMER_FIND_UNDER           ='Искать по';
  CUSTOMER_CHILD_DETECTION_ERROR='Вы должны удалить все дочерние счета';
  CUSTOMER_DELETE_QUESTION      ='Вы хотите удалить выбранную запись';
  CUSTOMER_AGENTS               ='Работа с информацией по контрагенту';
  CUSTOMER_CONTACTS             ='Работа с информацией по контрагенту';
  CUSTOMER_ACCOUNTS             ='Работа с информацией по счетам';
  CUSTOMER_UPDATE_PEOPLE_CONST  ='Изменить данные по контактному лицу';
  CUSTOMER_NEW_PEOPLE_CONST     ='Новое контактное лицо';
  CUSTOMER_LabelPRIM_CONST      ='Коментарий';
  CUSTOMER_LabelLAST_NAME_CONST ='Отчество';
  CUSTOMER_LabelFIRSTNAME_CONST ='Фамилия';
  CUSTOMER_labelNAME_CONST      ='Имя';
  CUSTOMER_LabelPOST_CONST      ='Должность';
  CUSTOMER_ADD_CAPTION_CONST    ='Информация по новому контрагенту';
  CUSTOMER_UPD_CAPTION_CONST    ='Изменить информацию по контрагенту';
  CUSTOMER_TITLE                ='Наименование';
  CUSTOMER_FIND_TITLE           ='По наименованию';
  CUSTOMER_SHORTTITLE           ='Сокращение';
  CUSTOMER_FISOS_FLAG           ='Физическое лицо';
  CUSTOMER_CLASS_CONST          ='Класс';
  CUSTOMER_BRANCH_CONST         ='Отрасль';
  CUSTOMER_ADRESS_CONST         ='Адрес';
  CUSTOMER_NALOG_CONST          ='Налоговое свидетельство';
  CUSTOMER_PlatNdsCheck_CONST   ='Плательщик НДС';
  CUSTOMER_LabelNDSNOMER_CONST  ='Номер';
  CUSTOMER_LabelNDS_DATE_CONST  ='Дата';
  CUSTOMER_LabelEDRPOU_CONST    ='ОКПО';
  CUSTOMER_ACC_CONST            ='Счет';
  CUSTOMER_LabelNALOGNOMER_CONST='Налоговый номер';
  CUSTOMER_NALOGSVNOMER         ='Номер налогового свидетельства';
  CUSTOMER_OK_BUT_CONST         ='Принять';
  CUSTOMER_BOSS_CONST           ='Руководитель';
  CUSTOMER_CANCEL_BUT_CONST     ='Отменить';
  CUSTOMER_MESSAGE_WARNING      ='Внимание!';
  CUSTOMER_MESSAGE_QUESTION     ='Вопрос!';
  CUSTOMER_MESSAGE_ERROR        ='Ощибка!';
  CUSTOMER_POST_ERROR           ='Необходимо ввести должность';
  CUSTOMER_NAME_ERROR           ='Необходимо ввести имя';
  CUSTOMER_LASTNAME_ERROR       ='Необходимо ввести фамилию';
  CUSTOMER_FIRSTNAME_ERROR      ='Необходимо ввести отчество';
  CUSTOMER_TITLE_ERROR          ='Необходимо ввести наименование контрагента';
  CUSTOMER_EDRPOU_ERROR         ='Необходимо ввести код ОКПО контрагента';

  {Константы использующиеся в подсисистеме бюджетирование}
  BU_ErrorCaption               ='Внимание ошибка!';
  BU_WarningCaption             ='Внимание!';
  BU_PingError                  ='Сервер не отвечает на TCP/IP запросы. Возможно он выключен или неполадки в сети. Обратитесь к системному администратору.';
  BU_OpenConfigError            ='Ошибка при доступе к файлу инициилизации. Обратитесь к системному администратору.';
  BU_OpenDBError                ='Ошибка при подключении к БД. Обратитесь к системному администратору.';
  BU_CountLevelError            ='Уровень глубины аналитики балланса превышен.';
  BU_TitleError                 ='Нет наименования';
  BU_TypeError                  ='Не задан тип';
  BU_KodError                   ='Не задан код';
  BU_DeleteConfirmation         ='Вы действительно хотите удалить эту запись?';
  BU_HasChildError              ='Объект нельзя удалить он имеет дочерние';
  BU_DistanceError              ='Ошибочное построение иерархии';
  BU_PropError                  ='В этом периоде с объектом нельзя осуществлять эти действия';
  BU_OperError                  ='В этом периоде с объектом нельзя осуществлять эти действия';
  BU_PropDelError               ='Нельзя удалить свойство оно не было установлено';
  BU_DateError                  ='Ошибка при работе с периодами';
  BU_MinDateError               ='Дата начала периода не может быть меньше даты закрытия главной книги';
  BU_StError                    ='Статья не может ссылаться сама на себя';
  BU_ChooseStError              ='Необходимо выбрать статью';
  BU_ChooseRzError              ='Необходимо выбрать раздел';
  BU_Yes_const                  ='Да';
  BU_No_const                   ='Нет';
  BU_OperPropError              ='Заданы не все свойства операции';
  BU_HieracChooseError          ='Эту запись нельзя выбрать';
  BU_Month_01                   ='январь  ';
  BU_Month_02                   ='февраль  ';
  BU_Month_03                   ='март     ';
  BU_Month_04                   ='апрель   ';
  BU_Month_05                   ='май      ';
  BU_Month_06                   ='июнь     ';
  BU_Month_07                   ='июль     ';
  BU_Month_08                   ='август   ';
  BU_Month_09                   ='сентябрь ';
  BU_Month_10                   ='октябрь  ';
  BU_Month_11                   ='ноябрь   ';
  BU_Month_12                   ='декабрь  ';

  BU_CHECK_OPER_ID_EQUALITY_ERROR='Счет не может корреспондироваться сам с собой';
  BU_LoadError                  ='Ошибка загрузки библиотеки';
  BU_KEKV_TITLE                 ='Экономиский классификатор затрат';
  BU_CROSSERROR                 ='Периоды функционирования счетов не пересекаются';
  BU_OPER_TITLE                 ='Реестр корреспонденции счетов';
  BU_CR_TITLE                   ='Счета, которые корреспондируются в кредите';
  BU_DB_TITLE                   ='Счета, которые корреспондируются в дебите';
  BU_SCH_FOR_COR                ='Счет для корреспонденции';
  IS_KR_CR_PROV                 ='Создает ли операция в кредите проводку';
  IS_DB_CR_PROV                 ='Создает ли операция в дебете проводку';
  IS_KR_CR_DOC                  ='Создает ли операция в кредите документ';
  IS_DB_CR_DOC                  ='Создает ли операция в дебете документ';
  BU_KEKV_INFO_WORK             ='Работа с информацией по КЕКВу';
  BU_KEKV_CODE                  ='Код КЕКВа';
  BU_KEKV_TITLE_EDIT            ='Наименование КЕКВа';
  BU_OPER_TITLE_EDIT            ='Работа с информацией по операциям';
  BU_OPER_CRINFO_PROP           ='Свойства операции в кредите';
  BU_OPER_DBINFO_PROP           ='Свойства операции в дебите';
  BU_SMSpr_title                ='Справочник смет ';
  BU_DelPeriod                  ='Удалить период функционирования сметы';
  BU_EnableError                ='Смета не используется';
  BU_HASCHILDSTRUERROR          ='Вы не можете изменить структуру сметы, так как она уже функционирует';
  BU_DELHASCHILDSTRUERROR       ='Вы не можете изменить период функционирования сметы, так как она уже функционирует ';
  BU_SmError                    ='Необходимо выбрать смету';
  BU_RzError                    ='Необходимо выбрать раздел';
  BU_StCHooseError              ='Необходимо выбрать статью';
  BU_PROP_BY_SCH                ='Свойства счета';
  BU_PROP_BY_OPER               ='Свойства операции';
  BU_KREDIT                     ='Кредит';
  BU_DEBET                      ='Дебет';
  BU_PROP_BY_RZST               ='Свойства разделов/статей';
  BU_PROP_BY_KEKV               ='Свойства КЕКВов';
  BU_PROP_BY_SMETA              ='Свойства смет';

     {Константы используемые в системе Автокод}
  AUTOKOD_MAIN_FORM                         ='Справочник продукции (номенклатор)';
  PUB_BUTTON_PRINT                          ='Печать';
  PUB_BUTTON_FIND                           ='Поиск';
  PUB_BUTTON_UP                             ='Вверх';
  AUTOKOD_NUMBER                            ='Код';
  AUTOKOD_NAME                              ='Название';
  AUTOKOD_MAIN_FORM_NUMBER                  ='Код выбраной группы/товара';
  AUTOKOD_MESSAGE_DEL                       ='Вы дейтвительно желаете удалить';
  AUTOKOD_MESSAGE_OK                        ='Подтверждение';
  AUTOKOD_MESSAGE_ERROR                     ='Такая запись уже существует';
  AUTOKOD_ADD_VETKA_FORM                    ='Добавить новую группу';
  AUTOKOD_ADD_TOVAR_FORM                    ='Добавить новый товар';
  AUTOKOD_BUTTON_ADD_VETKA                  ='Добавить';
  AUTOKOD_BUTTON_ADD_TOVAR                  ='Добавить товар';
  AUTOKOD_BUTTON_CHANGE_VETKA               ='Изменить';
  AUTOKOD_BUTTON_CHANGE_TOVAR               ='Изменить товар';
  AUTOKOD_BUTTON_DEL_VETKA                  ='Удалить';
  AUTOKOD_BUTTON_DEL_TOVAR                  ='Удалить товар';
  AUTOKOD_CHANGE_FORM                       ='Изменить';
  AUTOKOD_FORM_FIND                         ='Поиск';
  AUTOKOD_FORM_FIND_NAME                    ='Поиск по названию';
  AUTOKOD_FORM_FIND_KOD                     ='Поиск по коду';
  AUTOKOD_FIND                              ='Поиск';
  AUTOKOD_FIND_HINT_FIND                    ='Найти необходимое поле';
  AUTOKOD_FIND_HINT_EXIT                    ='Покинуть окно поиска';
  AUTOKOD_FIND_LABLE_NAME                   ='Введите название';
  AUTOKOD_FIND_LABLE_KOD                    ='Введите код';
  AUTOKOD_FIND_MESSAGE_ERROR                ='Вы не ввели название';
  AUTOKOD_FIND_MESSAGE_ERROR_KOD            ='Вы не ввели код';
  AUTOKOD_FIND_MESSAGE_FIND_ERROR           ='Такого названия не существует';
  AUTOKOD_FORM_ERROR_DEL                    ='Что вы желаете удалить?';
  AUTOKOD_DEL_VETKA_ERROR                   ='Под этой группой существует другая';
  AUTOKOD_ADD_VETKA_ADD                     ='Введите название группи (не больше 50 символов)';
  AUTOKOD_ADD_VETKA_LENGHT_KOD              ='Введите короткое название';
  AUTOKOD_ADD_VETKA_LENGHT_KOD_1            ='Введите цену';
  AUTOKOD_ADD_VETKA_SCH                     ='Выберите счет';
  AUTOKOD_ADD_VETKA_KOD                     ='Введите код';
  AUTOKOD_ADD_VETKA_ERROR_MESS              ='Вы не все заполнили!';
  AUTOKOD_ADD_VETKA_ADD_MESS                ='Вы желаете добавить новую группу?';
  AUTOKOD_ADD_TOVAR_ADD                     ='Введите название товара (не больше 50 символов)';
  AUTOKOD_FORM_FIND_VETKA                   ='Отображать только группы';
  AUTOKOD_FORM_FIND_TOVAR                   ='Отображать только товары';
  AUTOKOD_FORM_FIND_ALL                     ='Отображать все';
  AUTOKOD_FORM_LABLE_MEAS                   ='Выберите единицу измерения товара';
  AUTOKOD_FORM_TAKE_ERROR                   ='Вы ничего не выбрали!';
  AUTOKOD_FORM_WARNING                      ='Справка!';
  AUTOKOD_FORM_DONT_TOVAR                   ='Это не тавар!';
  AUTOKOD_ACTION_DEL_ALL                    ='Удалить все';
  AUTOKOD_FORM_CANCLE                       ='Отменить';
  AUTOKOD_FORM_DOWN                         ='Выбрать донизу';
  AUTOKOD_FORM_PROPERTY                     ='Свойства';
  AUTOKOD_FORM_CAPTION_COPY_VETKA           ='Копировать группу/товар';
  AUTOKOD_FORM_CAPTION_MOVE_VETKA           ='Перенести группу/товар';
  AUTOKOD_FORM_DONT_ADD_VETKA               ='Невозможно дабавить группу, так как под ней лежит товар!';
  AUTOKOD_FORM_DONT_COPY_VETKA              ='Это невозможно, так как под ней лежат товары!';
  AUTOKOD_FORM_MES_LEVEL                    ='Введите новый уровень!';

  AUTOKOD_CHANGE_VETKA_ADD                     ='Измените название группи (не больше 50 символов)';
  AUTOKOD_CHANGE_VETKA_LENGHT_KOD              ='Измените максимальний размер кода (не больше 5)';
  AUTOKOD_CHANGE_VETKA_KOD                     ='Измените код (не больше максимального)';
  AUTOKOD_CHANGE_VETKA_ADD_MESS                ='В_ хотите добавить новую группу?';
  AUTOKOD_CHANGE_TOVAR_ADD                     ='Измените название товара (не больше 50 символов)';
  AUTOKOD_CHANGE_VETKA_FORM                    ='Редактировать группу';
  AUTOKOD_CHANGE_TOVAR_FORM                    ='Редактировать товар';

  AUTOKOD_ADD_FORM_ADD_TAKE                    ='Добавить и выбрать';
  AUTOKOD_FORM_UNIT_MEAS_NAME                  ='Ед. измерения';
  AUTOKOD_FORM_UNIT_M_N                        ='Ед. изм.';
  AUTOKOD_FORM_GROUP                           ='Группы товаров';
  AUTOKOD_FORM_TOVAR_CAPTION                   ='Содержимое группы';
  AUTOKOD_CENA                                 ='Цена';
  AUTOKOD_TAKE_TOVAR                           ='Выбранные товары';


  AUTOKOD_SP_UNIT_MEAS_SHORT                   ='Справочник';
  AUTOKOD_SP_UNIT_MEAS_FORM                    ='Справочник ???';
  AUTOKOD_SP_UNIT_MEAS_GR_NAME                 ='Имя';
  AUTOKOD_SP_UNIT_MEAS_GR_SHORTNAME            ='Краткое имя';
  AUTOKOD_SP_UNIT_MEAS_GR_KOEF                 ='Коэфициент';
  AUTOKOD_SP_UNIT_MEAS_ADD_NAME                ='Введите название';
  AUTOKOD_SP_UNIT_MEAS_ADD_SHORTNAME           ='Введите краткое название';
  AUTOKOD_SP_UNIT_MEAS_ADD_KOEF                ='Введите коэфициент';
  AUTOKOD_SP_UNIT_MEAS_FIND                    ='';
  AUTOKOD_SP_UNIT_MEAS_ADD_ERROR               ='Такое название уже существует!';
  AUTOKOD_SP_UNIT_MEAS_FIND_LABEL              ='Введите название, которое необходимо найти';
  AUTOKOD_SP_UNIT_MEAS_FIND_ERROR              ='Вы не указали название, которое необходимо найти';
  AUTOKOD_SP_UNIT_MEAS_FIND_ERROR_MESS         ='Такого свойства не существует!';


  AUTOKOD_PROP_CAPTION_FORM_CAPTION            ='Вы работаете в справочнике свойств продукции';
  AUTOKOD_PROP_CAPTION_TYPE_FIND_MESSAGA_SP    ='Вы не ввели название';
  AUTOKOD_PROP_CAPTION_MESSAGA                 ='Справка!';
  AUTOKOD_PROP_CAPTION_ADD_SHORTNAME           ='Введите коротке название';
  AUTOKOD_PROP_CAPTION_ADD_NAME                ='Введите название';
  AUTOKOD_PROP_CAPTION_BUTTON_ADD              ='Добавить';
  AUTOKOD_PROP_CAPTION_BUTTON_CLOSE            ='Закрыть';
  AUTOKOD_PROP_CAPTION_CHANGE_SHORTNAME        ='Измените короткое название';
  AUTOKOD_PROP_CAPTION_CHAGE_NAME              ='Измените название';
  AUTOKOD_PROP_CAPTION_BUTTON_EDIT             ='Измените';
  AUTOKOD_PROP_CAPTION_FORM_ADD                ='Дабавить свойство';
  AUTOKOD_PROP_CAPTION_FORM_CHANGE             ='Измените свойство';
  AUTOKOD_PROP_CAPTION_REFRESH                 ='Обновить';
  AUTOKOD_PROP_CAPTION_DELETE                  ='Удалить';
  AUTOKOD_PROP_CAPTION_GET                     ='Выбрать';
  AUTOKOD_PROP_CAPTION_FIND                    ='Найти';
  AUTOKOD_PROP_CAPTION_FIND_NAME               ='Найти по названию';
  AUTOKOD_PROP_CAPTION_FIND_SHORT_NAME         ='Найти по короткому названию';
  AUTOKOD_PROP_CAPTION_GRID_NAME               ='Название';
  AUTOKOD_PROP_CAPTION_GRID_SHORT_NAME         ='Короткое название';
  AUTOKOD_PROP_CAPTION_FIND_ERROR              ='Вы не указали название, которое необходимо найти';
  AUTOKOD_PROP_CAPTION_BEGIN                   ='начать сначала?';
  AUTOKOD_PROP_CAPTION_MESSAGA_FIND            ='Поиск';
  AUTOKOD_PROP_CAPTION_MESSAGA_NOT_FIND        ='Ничего не нашли!';
  AUTOKOD_PROP_CAPTION_MESSAGA_ERROR           ='Что вы хотите удалить?';
  AUTOKOD_PROP_CAPTION_MESSAGA_DEL             ='Вы действительно желаете удалить?';
  AUTOKOD_PROP_CAPTION_MESSAGA_OK              ='Подтверждение';
  AUTOKOD_PROP_CAPTION_TAKE_ERROR              ='Вы ничего не выбрали выбрали!';
  AUTOKOD_PROP_NAME                            ='Название свойства';
  AUTOKOD_PROP_BEGIN_PERIOD                    ='Начало действия свойства';
  AUTOKOD_PROP_END_PERIOD                      ='конец действия свойства';
  AUTOKOD_PROP_ADD_ALL                         ='для всех подлежащих полей';
  AUTOKOD_PROP_ADD_ONLYYOU                     ='только для этого поля';
  AUTOKOD_PROP_ADD_LABLE_RADIO                 ='Это свойство добавить:';
  AUTOKOD_PROP_ADD_ADD_PROPERTY                ='Выберите свойство';
  AUTOKOD_PROP_ADD_DATA                        ='Выберите дату конца действия свойства';
  AUTOKOD_PROP_ADD_CHANGE_DATA                 ='Измените дату конца действия свойства';
  AUTOKOD_PROP_CAPTION_EMPTY                   ='Такого свойства не существует!';
  AUTOKOD_COPY_REZALT_PAPKA                    ='Результирующая папка';
  AUTOKOD_COPY_MAIN_PAPKA                      ='Исходная папка';
  AUTOKOD_COPY_CAPTION_COPY                    ='Копировать';
  AUTOKOD_COPY_CAPTION_MOVETO                  ='Перенести';
  AUTOKOD_COPY_CNOPKI                          ='Кнопки управления';
  AUTOKOD_COPY_PAPKA                           ='исходное поле';

  AUTOKOD_SP_RAZD_ADD_NUMBER                   ='Введите разделитель';
  AUTOKOD_SP_RAZD_ADD_LEVEL                    ='Уровень ';
  AUTOKOD_SP_RAZD_ADD_LENGHT                   ='Введите длину кода на этом уровне';
  AUTOKOD_SP_RAZD_FIND_NUM                     ='Найти по разделителю';
  AUTOKOD_SP_RAZD_FIND_LENGHT                  ='Найти по длине кода';
  AUTOKOD_SP_RAZD_FORM                         ='Справочник уровней продукции';
  AUTOKOD_SP_RAZD_ADD_FORM                     ='Окно добавления нового уровня';
  AUTOKOD_SP_RAZD_CHANGE_FORM                  ='Окно изменения уровня';
  AUTOKOD_SP_RAZD_                             ='Разделитель';
  AUTOKOD_SP_RAZD_LEVEL_LENGHT                 ='Длина уровня';

  AUTOKOD_PRINT_ALL                            ='Печатать все';
  AUTOKOD_PRINT_GROUP                          ='Печатать только группы';
  AUTOKOD_PRINT_TOVAR                          ='Печатать только товары';
  AUTOKOD_PRINT_LEVEL                          ='Печатать по уровням';


implementation

end.
