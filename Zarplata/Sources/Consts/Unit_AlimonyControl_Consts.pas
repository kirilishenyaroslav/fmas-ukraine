unit Unit_AlimonyControl_Consts;

interface

resourcestring

//FAlimonyControl
 FAlimonyControl_Caption_Insert                            = 'Додавання даних по аліментам';
 FAlimonyControl_Caption_Update                            = 'Редагування даних по аліментам';
 FAlimonyControl_Caption_Delete                            = 'Вилучення даних по аліментам';
 FAlimonyControl_Caption_Detail                            = 'Перегляд даних по аліментам';
 FAlimonyControl_Text_Delete                               = 'Ви дійсно бажаєте вилучити обраний запис?';
 FAlimonyControl_YesBtn_Caption                            = 'Прийняти';
 FAlimonyControl_CancelBtn_Caption                         = 'Відмінити';
 FAlimonyControl_CancelBtn_Caption_Detail                  = 'Вийти';

 FAlimonyControl_Error_Caption                             = 'Помилка';
 FAlimonyControl_InputDocument_Text                        = 'Не введено підставу';
 FAlimonyControl_InputDolg_Text                            = 'Не введено борг';
 FAlimonyControl_InputPercent_Text                         = 'Не введено процент сплати';
 FAlimonyControl_InputMaxPercent_Text                      = 'Не введено можливий процент';
 FAlimonyControl_InputPochtaPercent_Text                   = 'Не введено поштовий процент';
 FAlimonyControl_InputPeriod_Text                          = 'Не вірно вказано період сплати';
 FAlimonyControl_InputSendPeople_Text                      = 'Не вказано особу - одержувача';
 FAlimonyControl_InputSendAddress_Text                     = 'Не вказано адресу'+#13+'надсилання аліментів';
 FAlimonyControl_InputPercentMoreMaxError_Text             = 'Не вірно вказано проценти:'+#13+'можливий процент має бути не меншим'+#13+'за процент до сплати';
 FAlimonyControl_InputPochtaMorePercentError_Text          = 'Не вірно вказано проценти:'+#13+'поштовий процент має бути не більшим'+#13+'за процент до сплати';

 FAlimonyControl_IdentificationBox_Caption                 = '';
 FAlimonyControl_PeopleLabel_Caption                       = 'Сплатник:';
 FAlimonyControl_DocumentLabel_Caption                     = 'Документ для підстави:';
 FAlimonyControl_OptionsBox_Caption                        = '';
 FAlimonyControl_MaxPercentLabel_Caption                   = 'Можливий процент:';
 FAlimonyControl_PercentLabel_Caption                      = 'Процент, що сплачуватиме:';
 FAlimonyControl_PochtaPercentLabel_Caption                = 'Поштовий збір (%):';
 FAlimonyControl_PeriodBox_Caption                         = '';
 FAlimonyControl_DateBegLabel_Caption                      = 'Початок:';
 FAlimonyControl_DateEndLabel_Caption                      = 'Закінчення:';
 FAlimonyControl_SendBox_Caption                           = '';
 FAlimonyControl_SendPeopleLabel_Caption                   = 'Особа:';
 FAlimonyControl_SendAdressLabel_Caption                   = 'Адреса:';
 FAlimonyControl_DolgLabel_Caption                         = 'Борг:';
implementation

end.
