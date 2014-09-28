unit ConstClBank;

interface
resourcestring
{  ClBank_ACTION_ADD_CONST          ='Добавить';
  ClBank_ACTION_DELETE_CONST       ='Удалить';
  ClBank_ACTION_EDIT_CONST         ='Редактировать';
  ClBank_ACTION_REFRESH_CONST      ='Обновить';
  ClBank_ACTION_CLOSE_CONST        ='Закрыть';
  ClBank_ACTION_PRINT_CONST        ='Печать';
  ClBank_ACTION_HELP_CONST         ='Помощь';
  ClBank_ACTION_CHOOSE_CONST       ='Выбрать';
  ClBank_ACTION_FILTER_CONST       ='Фильтр';
  ClBank_ACTION_SAVE_CONST         ='Сохранить';
  ClBank_ACTION_MARK_DELETE_CONST  ='Пометить на удал.';
  ClBank_ACTION_MARK_DELETE_ALL_CONST  ='Пометить все на удал.';
  ClBank_ACTION_UNMARK_DELETE_CONST  ='Отменить удал.';
  ClBank_ACTION_UNMARK_DELETE_ALLCONST  ='Отменить удал. у всех';
  ClBank_ACTION_CLEAR_CONST        ='Очистить';
  ClBank_ACTION_WOTK_CONST         ='Обработать заново';}

  ClBank_ACTION_ADD_CONST          ='Додати';
  ClBank_ACTION_DELETE_CONST       ='Видалити';
  ClBank_ACTION_EDIT_CONST         ='Редагувати';
  ClBank_ACTION_REFRESH_CONST      ='Оновити';
  ClBank_ACTION_CLOSE_CONST        ='Закрити';
  ClBank_ACTION_PRINT_CONST        ='Друкувати';
  ClBank_ACTION_HELP_CONST         ='Допомога';
  ClBank_ACTION_CHOOSE_CONST       ='Вибрати';
  ClBank_ACTION_FILTER_CONST       ='Фільтр';
  ClBank_ACTION_SAVE_CONST         ='Зберегти';
  ClBank_ACTION_MARK_DELETE_CONST  ='Помітити на вилуч.';
  ClBank_ACTION_MARK_DELETE_ALL_CONST  ='Помітити все на вилуч..';
  ClBank_ACTION_UNMARK_DELETE_CONST     ='Відмінити вилучення';
  ClBank_ACTION_UNMARK_DELETE_ALLCONST  ='Відмінити вилучення у всіх';
  ClBank_ACTION_CLEAR_CONST             ='Очистити';
  ClBank_ACTION_WOTK_CONST              ='Обробити знову';
  ClBank_ACTION_FIND                    ='Пошук';
  ClBank_ACTION_DELETE_ALL_CONST        ='Видалити усі необроблені документи з КБ, які відображені';
  ClBank_DOC_NUM                        = 'Ви дійсно бажаете видалити документ № ';
  ClBank_MESSAGE_DELETE_ALL_NEOBR       = 'Ви дійсно бажаете видалити УСІ необроблені документи, які відображені?';



{  ClBank_BUTTON_OK_CONST           ='Ок';
  ClBank_BUTTON_CANCEL_CONST       ='Отмена';
  ClBank_BUTTON_YES_CONST          ='Да';
  ClBank_BUTTON_NO_CONST           ='нет';}
  ClBank_BUTTON_OK_CONST           ='Ок';
  ClBank_BUTTON_CANCEL_CONST       ='Відмінити';
  ClBank_BUTTON_YES_CONST          ='Да';
  ClBank_BUTTON_NO_CONST           ='Ні';


{  ClBank_MESSAGE_WARNING           ='Внимание!';
  ClBank_MESSAGE_ERROR             ='Ошибка!';
  ClBank_MESSAGE_HINT              ='Предупреждение!';
  ClBank_MESSAGE_DELETE            ='Вы действительно хотите удалить?';
  ClBank_MESSAGE_NOT_DATA          ='Неполные данные';
  ClBank_MESSAGE_WAIT              ='Ждите. Идет обработка данных.';}
  ClBank_MESSAGE_WARNING           ='Увага!';
  ClBank_MESSAGE_ERROR             ='Помилка!';
  ClBank_MESSAGE_HINT              ='Попередження!';
  ClBank_MESSAGE_DELETE            ='Ви дійсно бажаете видалити?';
  ClBank_MESSAGE_NOT_DATA          ='Неповні дані';
  ClBank_MESSAGE_WAIT              ='Чекайте. Йде обробка даних.';

{  ClBank_NAME_BANK                 ='Название файла';
  ClBank_CODE_BANK                 ='Код банка';
  ClBank_TYPE_FILE                 ='Тип файла';
  ClBank_LAST_RUN                  ='Последний запуск';
  ClBank_SP                        ='Процедура обработки';
  ClBank_FILE                      ='Название файла';
  ClBank_SP_PARAM                  ='Параметры процедуры';
  ClBank_FILE_FIELDS               ='Поля файла';
  ClBank_SETUP                     ='Настройка клиент банка';
  ClBank_SPParam                   ='Параметры процедури';}
  ClBank_NAME_BANK                 ='Назва банку';
  ClBank_CODE_BANK                 ='Код банку';
  ClBank_TYPE_FILE                 ='Тип файлу';
  ClBank_LAST_RUN                  ='Останній запуск';
  ClBank_SP                        ='Процедура обробки';
  ClBank_FILE                      ='Назва файлу';
  ClBank_SP_PARAM                  ='Параметри процедури';
  ClBank_FILE_FIELDS               ='Поля файлу';
  ClBank_SETUP                     ='Настроювання кліент банку';
  ClBank_SPParam                   ='Параметри процедури';
  ClBank_USE_MFO                   ='Використовувати задане МФО';
  ClBank_INOUT_SUM                 ='Використовувати задане значення прибутка\вибутка';
  ClBank_MODI_SUM                  ='Модифікувати суму документу';
  ClBank_IgnorFields               ='Ігнорувати поле';

{  ClBank_CFieldDBF                 ='Поля файла';
  ClBank_CLabelSP                  ='Процедура';
  ClBank_CLabelDBF                 ='Файл данных';
  ClBank_MESSAGE_SAVE_ERROR        ='Ошибка при сохраниении данных. Обратитесь к администатору.';
  ClBank_MESSAGE_NO_SP             ='Не выбрана процудура для экспорта.';
  ClBank_MESSAGE_NO_FILE           ='Не выбран файл для экспорта.';
  ClBank_MESSAGE_NI_FILE_EXIST     ='Такой файл не существует.';
  ClBank_MESSAGE_NOT_DELETE        ='Данный документ не может быть удален.';
  ClBank_GET_PARAM                 ='Забор данных';
  ClBank_date_doc                  ='Дата документа';
  ClBank_date_vip                  ='Дата банковской выписки';
  ClBank_number_doc                ='Номер документа';
  ClBank_summa                     ='Сума документа';}

  ClBank_CFieldDBF                 ='Поля файлу';
  ClBank_CLabelSP                  ='Процедура';
  ClBank_CLabelDBF                 ='Файл даних';
  ClBank_MESSAGE_SAVE_ERROR        ='Помилка при збереженні данних. Зверніться до адміністратора.';
  ClBank_MESSAGE_NO_SP             ='Не вибрана процедура для експорту.';
  ClBank_MESSAGE_NO_FILE           ='Не вибран файл для експорту.';
  ClBank_MESSAGE_NI_FILE_EXIST     ='Такий файл не існує.';
  ClBank_MESSAGE_NOT_DELETE        ='Данний документ не може бути вилучен.';
  ClBank_GET_PARAM                 ='Забір данних';
  ClBank_date_doc                  ='Дата документа';
  ClBank_date_vip                  ='Дата банківської виписки';
  ClBank_number_doc                ='Номер документа';
  ClBank_summa                     ='Сума документа';

{  ClBank_note                      ='Основание документа';
  ClBank_rs_native                 ='Наши реквизиты';
  ClBank_rs_customer               ='Реквизиты контрагента';
  ClBank_customer                  ='Контрагент';
  ClBank_type_doc                  ='Тип документа';
  ClBank_prihod                    ='Приход';
  ClBank_rashod                    ='Расход';
  ClBank_prras                     ='Приход\Расход';
  clBank_mfo                       ='МФО';
  ClBank_rs                        ='Расчетный счет';
  ClBank_From_SPR                  ='Из справочника';
  ClBank_From_text                 ='По включению';}
  ClBank_note                      ='Підстава документа';
  ClBank_rs_native                 ='Наші реквізити';
  ClBank_rs_customer               ='Реквізити контрагента';
  ClBank_customer                  ='Контрагент';
  ClBank_type_doc                  ='Тип документу';
  ClBank_prihod                    ='Прибуток';
  ClBank_rashod                    ='Видаток';
  ClBank_prras                     ='Прибуток\Видаток';
  clBank_mfo                       ='МФО';
  ClBank_rs                        ='Розрахунковий рахунок';
  ClBank_From_SPR                  ='З довідника';
  ClBank_From_text                 ='За включенням';


{  ClBank_Column_Edit               ='Редактор колонок';
  ClBank_CAPTION_LOG               ='Экспорт данных из клиент банка';
  ClBank_DOC_ClBank                ='Платежный документ';
  ClBank_Begin                     ='С';
  ClBank_End                       ='ПО';}
  ClBank_Column_Edit               ='Редактор колонок';
  ClBank_CAPTION_LOG               ='Експорт даних з кліент-банка';
  ClBank_DOC_ClBank                ='Платіжний документ';
  ClBank_Begin                     ='З';
  ClBank_End                       ='До';

  ClBank_Check_Doublicate          ='Перевірка на повторення даних';
  ClBank_Check_Date                ='Перевірка на останній запуск';
  ClBank_WORK                      ='Оброблен';
  ClBank_UNWORK                    ='Не оброблен';

  ClBank_OKPO                      = 'Діапазон ЄДРПОУ';
  ClBank_date_prov                 = 'Дата проведення документу';
  Clbank_report_ChP                = 'Звіт за приватними підприємцями';
  Clbank_date_doc_vip              = 'Дата документу не може бути більш за дату виписки!';

implementation

end.
