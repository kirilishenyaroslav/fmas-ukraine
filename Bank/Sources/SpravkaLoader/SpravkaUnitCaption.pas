unit SpravkaUnitCaption;

interface

resourcestring

{    FILTER_PO_KOR_SCH               = 'По корреспонденции балансовых счетов';
    FILTER_PO_FIO                   = 'По ФИО';
    FILTER_WITHUOT_FIO              = 'Без ограничения на ФИО';
    FILTER_PO_CUST                  = 'По контрагенту :';
    FILTER_PO_R_S_CUST              = 'По р/с контрагента из справочника';
    FILTER_NAME_PO_VKLYUCH          = 'По включению в название';
    FILTER_WITHOUT_CUST             = 'Без ограничения на контрагента';
    MAIN_FORM_NOMER                 = 'Номер';
    MAIN_FORM_DATE                  = 'Дата';
    MAIN_FORM_FIO                   = 'ФИО';
    MAIN_FORM_CUST                  = 'Контрагент';
    MAIN_FORM_PO_PRIH               = 'по приходу';
    MAIN_FORM_PO_RASH               = 'по расходу';
    MAIN_FORM_DOC                   = 'Документ';
    MAIN_FORM_SPRAVKA               = 'Справка';
    MAIN_FORM_SUMMA                 = 'Сумма';
    MAIN_FORM_EXIT                  = 'Вы действительно желаете выйти?';
    SHOW_FIND_DOC                   = 'Идет поиск документов!';
    NAME_CUST                       = 'Название контрагента';
    R_S                             = 'Р\с';
    R_S_CUST                        = 'Р\с контрагента';
    SUMMA_RAS                       = 'Сумма расхода';
    SUMMA_PRIH                      = 'Сумма прихода';
    WINDOW_CHANGE                   = 'Окно выбора документа, на который будет сдалана справка';
    DOC_SPRAVKA_NA_DOC              = 'Справка на кассовый документ';

    DOC_ISP_DOC_D                   = 'Исправительная справка по дебету  №  ';
    DOC_ISP_DOC_K                   = 'Исправительная справка по кредиту  №  ';
    DOC_ZA                          = 'за';
    DOC_AUTHOR_SP                   = 'Автор справки';
    DOC_KOMENT_DOC                  = 'Комментарий к справке';
    DOC_TAB_NUM                     = 'Таб. Номер';
    DOC_DATA_SP                     = 'Данные о справке';
    DOC_DATA_DOC                    = 'Данные о документе';
    DOC_INFO_PROV                   = 'Информация по проводкам';
    DOC_ERROR_DOC                   = 'Ошибки по документу';
    DOC_ERROR_PROV                  = 'Ошибки по проводкам';
    DOC_INFO_DOG                    = 'Информ. по договору';
    DOC_SAVE_SP                     = 'Сохранить справку';
    DOC_YEAR_SHORT                  = 'г.';
    DOC_ISP_SP_PO_DOC               = 'Испр. справка по документу № ';
    DOC_REG_SHOW                    = 'Режим просмотра справок';
    DOC_STORNO_PROV                 = 'Это сторнирующая проводка. Её нельзя удалять!';
    DOC_ISP_SP_SHORT                = 'Испр. справка ';
    DOC_NOTE_DOC_SP                 = '. Основание: ';
    DOC_MESSAGA_EXISTS_SP_DOC       = 'Существуют справки в последующих периодах. Номер последней справки - ';
    DOC_SCH_BLOCK                   = 'Счет по этому документу заблокирован!';
    DOC_SCH_CLOSE                   = 'Счет по этому документу закрыт!';
    DOC_REG_NUM                     = 'Рег.номер: ';
    DOC_N_DOG                       = ' № договора: ';
    DOC_DATE_DOG                    = ' дата договора: ';
    DOC_NAME_CUST                   = ' имя контрагента: ';
    DOC_TYPE_DOG                    = ' тип договора: ';
    DOC_FIO_PROJ                    = 'ФИО проживающего ';
    DOC_FIO_OBUCH                   = 'ФИО обучающегося '
    DOC_REG_NUM                     = ' рег.н. - ';
    DOC_FROM                        = ' от - ';
    DOC_NAME_CUST_2                 = ' Наимен. контрагента - ';
    DOC_NUMER_DOG                   = ' ( дог.№ ';
 }
    FILTER_PO_KOR_SCH               = 'За кореспонденцією балансових рахунків';
    FILTER_PO_FIO                   = 'За ПІБ';
    FILTER_WITHUOT_FIO              = 'Без обмеження на ПІБ';
    FILTER_PO_CUST                  = 'За контрагентом :';
    FILTER_PO_R_S_CUST              = 'За р/р контрагента з довідника';
    FILTER_NAME_PO_VKLYUCH          = 'За включенням в назву';
    FILTER_WITHOUT_CUST             = 'Без обмеження на контрагента';
    MAIN_FORM_NOMER                 = 'Номер';
    MAIN_FORM_DATE                  = 'Дата';
    MAIN_FORM_FIO                   = 'ПІБ';
    MAIN_FORM_CUST                  = 'Контрагент';
    MAIN_FORM_PO_PRIH               = 'за прибутком';
    MAIN_FORM_PO_RASH               = 'за видатком';
    MAIN_FORM_DOC                   = 'Документ';
    MAIN_FORM_SPRAVKA               = 'Довідка';
    MAIN_FORM_SUMMA                 = 'Сума';
    MAIN_FORM_EXIT                  = 'Ви дійсно бажаєте вийти?';
    SHOW_FIND_DOC                   = 'Іде пошук документів!';
    NAME_CUST                       = 'Назва контрагента';
    R_S                             = 'Р\р';
    R_S_CUST                        = 'Р\р контрагента';
    SUMMA_RAS                       = 'Сума видатку';
    SUMMA_PRIH                      = 'Сума прибутку';
    WINDOW_CHANGE                   = 'Вікно вибору документа, на який буде зроблена довідка';
    DOC_SPRAVKA_NA_DOC              = 'Довідка на касовий документ';

    DOC_ISP_DOC_D                   = 'Виправна довідка за дебетом №  ';
    DOC_ISP_DOC_K                   = 'Виправна довідка за кредитом №  ';
    DOC_ZA                          = 'за';
    DOC_AUTHOR_SP                   = 'Автор довідки';
    DOC_KOMENT_DOC                  = 'Коментар до довідки';
    DOC_TAB_NUM                     = 'Таб. Номер';
    DOC_DATA_SP                     = 'Дані про довідку';
    DOC_DATA_DOC                    = 'Дані про документ';
    DOC_INFO_PROV                   = 'Інформація з проводок';
    DOC_ERROR_DOC                   = 'Помилки у документі';
    DOC_ERROR_PROV                  = 'Помилки у проводках';
    DOC_INFO_DOG                    = 'Інформ. за договором';
    DOC_SAVE_SP                     = 'Зберегти довідку';
    DOC_YEAR_SHORT                  = 'р.';
    DOC_ISP_SP_PO_DOC               = 'Випр. довідка за документом № ';
    DOC_REG_SHOW                    = 'Режим перегляду довідок';
    DOC_STORNO_PROV                 = 'Це сторнуюча проводка. Її не можна видаляти!';
    DOC_ISP_SP_SHORT                = 'Випр. довідка ';
    DOC_NOTE_DOC_SP                 = '. Підстава: ';
    DOC_MESSAGA_EXISTS_SP_DOC       = 'Існують довідки в наступних періодах. Номер останньої довідки - ';
    DOC_SCH_BLOCK                   = 'Рахунок за цим документом заблокований!';
    DOC_SCH_CLOSE                   = 'Рахунок за цим документом закритий!';
    DOC_REG_NUM                     = 'Рег.номер: ';
    DOC_N_DOG                       = ' № договору: ';
    DOC_DATE_DOG                    = ' дата договору: ';
    DOC_NAME_CUST                   = ' ім''''я контрагента: ';
    DOC_TYPE_DOG                    = ' тип договору: ';
    DOC_FIO_PROJ                    = 'ПІБ проживаючого ';
    DOC_FIO_OBUCH                   = 'ПІБ що навчається ';
    DOC_REG_N                       = ' рег.н. - ';
    DOC_FROM                        = ' від - ';
    DOC_NAME_CUST_2                 = ' Наймен. контрагента - ';
    DOC_NUMER_DOG                   = ' ( дог.№ ';
    DOC_CLOSE_DONT_SAVE             = 'Вы дійсно бажаєте вийти не зберігши??';
    DOC_CLOSE_NOT_DATE_KASSA_1      = 'В звітному періоді (';
    DOC_CLOSE_NOT_DATE_KASSA_2      = ') не знайдено жодного дня реєстрування касових ордерів. Таким чином за відсутністю операцій в цьому періоді НЕМОЖЛИВО створити виправну справку!';
    DOC_CLOSE_NOT_DATE_BANK_1       = 'В звітному періоді (';
    DOC_CLOSE_NOT_DATE_BANK_2       = ') не знайдено жодної обробленої банківської виписки. Таким чином за відсутністю операцій в цьому періоді НЕМОЖЛИВО створити виправну справку!';

    MAIN_WINDOW_SPRAVKA             = 'Головне вікно довідок';

    STORNO                          = 'Сторно';
    DOC_SPRAVKA_SHOW_PROV           = 'Показати проводки тільки з цієї довідки';
    PRINT_REESTR_SPRAVOK            = 'Друкувати реєстр';
    PRINT_SPRAVKA                   = 'Друкувати довідку';
    PRINT_REESTR_YEAR               = 'р.';
    PRINT_REESTR_FIO                = 'П.І.Б.';
    PRINT_REESTR_CUST               = 'Контрагент';
    PRINT_MONTH                     = 'Друкувати за місяць';
    PRINT_DAY                       = 'Друкувати за день';

    PRINT_WITH_SMETA                = 'Друкувати з бюджетом';
    OTOBRAJAT_ZA                    = 'Відображати за';
    MY_YEAR                         = 'рік';           
    KASSA_KEKV                      = 'КЕКВ';


implementation

end.
