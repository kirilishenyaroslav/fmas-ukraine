unit UnitZarplataConsts;

interface

resourcestring

 //Dpr-source
 Ini_FileName                    =   'Config.ini';
 OpenConfigError_Text            =   'Не знайдено файл з настрйками';
 OpenDBError_Text                =   'Неможливо встановити'+#13+'підключення до бази';
 Application_Caption             =   'Зарплата';
 DB_Connection_Text              =   'Підключення до бази даних:  ';
 WriteParameters_Text            =   'Читання параметрів';

 //Сплеш форма
 TZSplash_Form_Label_Firm_Caption                     = 'Підприємство';
 TZSplash_Form_Label_System_Caption                   = 'Автоматизована'+#13+'підсистема розрахунка'+#13+'заробітної плати';
 TZSplash_Form_Label_Rights_Caption                   = 'Права на даний продукт захищені українським та міжнародним законодавством. Усі права належать ДонНУ.';
 TZSplash_Form_Label_Version_Caption                  = 'Версія: ';

 //Общее
 InsertBtn_Caption                                    = 'Додати';
 UpdateBtn_Caption                                    = 'Редагувати';
 DeleteBtn_Caption                                    = 'Вилучити';
 SelectBtn_Caption                                    = 'Обрати';
 SelectAllBtn_Caption                                 = 'Обрати з підлеглими';
 RefreshBtn_Caption                                   = 'Поновити';
 ExitBtn_Caption                                      = 'Вийти';
 SpravBtn_Caption                                     = 'Довідник';
 UpdateAllBtn_Caption                                 = 'Редагувати';
 LocateBtn_Caption                                    = 'Шукати';
 LocateNextBtn_Caption                                = '  Шукати далі';
 YesBtn_Caption                                       = 'Прийняти';
 CancelBtn_Caption                                    = 'Відмінити';
 Error_Caption                                        = 'Помилка';
 ButtonsControlBar_caption                            = 'Дії';

 //Главное меню программы

 FZMainMenu_Caption                                   = 'Підсистема розрахунку заробітної плати';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_AboutSubMainMenu_Caption                  = 'Довідка';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_ServiceSubMainMenu_Caption                = 'Сервіс';
 FZMainMenu_SystemPreverencesPunktMainMenu_Caption    = 'Властивості';
 FZMainMenu_TaxesNetsPunktMainMenu_Caption            = 'Податки';
 FZMainMenu_ReturnPrevPeriodPunktMainMenu_Caption     = 'Відкат на попередній період';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_SpSubMainMenu_Caption                     = 'Довідники';
 FZMainMenu_CalendarSpPunktMainMenu_Caption           = 'Календар';
 FZMainMenu_WorkerCategorySpPunktMainMenu_Caption     = 'Категорії працівників';
 FZMainMenu_SmetaSpPunktMainMenu_Caption              = 'Смети';
 FZMainMenu_VoSpPunktMainMenu_Caption                 = 'Види оплати';
 FZMainMenu_DivisionSpPunktMainMenu_Caption           = 'Підрозділи';
 FZMainMenu_PrivilegeSpPunktMainMenu_Caption          = 'Льготи';
 FZMainMenu_VOutSpPunktMainMenu_Caption               = 'Види виплат';
 FZMainMenu_VoplSpravPunktMainMenu_Caption            = 'Види операцій';
 FZMainMenu_ViewVoPunktMainMenu_Caption               = 'Відображення';
 FZMainMenu_PeoplePunktMainMenu_Caption               = 'Фізичні особи';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_DataSubMainMenu_Caption                   = 'Данні';
 FZMainMenu_WorkerDtPunktMainMenu_Caption             = 'Співробітників';
 FZMainMenu_PeoplePropPunktMainMenu_Caption           = 'Властивості осіб';
 FZMainMenu_StudentDtPunktMainMenu_Caption            = 'Студентів';
 FZMainMenu_CurrentDtPunktMainMenu_Caption            = 'Поточні операції';
 FZMainMenu_PeoplePrivPunktMainMenu_Caption           = 'Що користуються льготами';
 FZMainMenu_RemontPunktMainMenu_Caption               = 'Ремонтні роботи';
 FZMainMenu_DopMoneyPunktMainMenu_Caption             = 'Додаткових нарахувань';
 FZMAinMenu_AlimentPunktMainMenu_Caption              = 'Що сплачують аліменти';
 FZMAinMenu_InvalidPunktMainMenu_Caption              = 'Перелік інвалідів';
 FZMainMenu_AlwaysUderzhPunktMainMenu_Caption         = 'Постійних утримань';
 FZMainMenu_SsudaPunktMainMenu_Caption                = 'Що брали ссуду';
 FZMainMenu_NonSpisokPunktMainMenu_Caption            = 'Склад поза списком';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_InformationSubMainMenu_Caption            = 'Інформація';
 FZMainMenu_PrevPeriodDataPunktMainMenu_Caption       = 'Данні минулих періодів';
 FZMainMenu_LostDataPunktMainMenu_Caption             = 'Данні звільнень';
 FZMainMenu_UchetVedSubInformSubMainMenu_Caption      = 'Дані відомостей';
 FZMainMenu_VedCurrentMonthPunktMainMenu_Caption      = 'Відомості періода';
 FZMainMenu_ReestrVedPunktMainMenu_Caption            = 'Реєстри';
 FZMainMenu_FilterVedPunktMainMenu_Caption            = 'Пошук';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_WorkSubMainMenu_Caption                   = 'Робота';
 FZMainMenu_AvansPunktMainMenu_Caption                = 'Розрахунок авансу';
 FZMainMenu_PromViplatiPunktMainMenu_Caption          = 'Поточні операції';
 FZMainMenu_RaschetPunktMainMenu_Caption              = 'Терміновий розрахунок';
 FZMainMenu_ZarplataPunktMainMenu_Caption             = 'Розрахунок заробітної плати';
 FZMainMenu_StipPunktMainMenu_Caption                 = 'Розрахунок стипендіальних виплат';
 FZMainMenu_VedRaschetPunktMainMenu_Caption           = 'Відомості розрахунку';
 FZMainMenu_DataRaschetPunktMainMenu_Caption          = 'Данні розрахунку';
 FZMainMenu_ReCountPunktMainMenu_Caption              = 'Перерахунок';
 FZMainMenu_ReCountDataPunktMainMenu_Caption          = 'Перегляд перерахунка';
 FZMainMenu_OperationEndPunktMainMenu_Caption         = 'Завершення операції';
 //----------------------------------------------------------------------------------------------------------

 FZMainMenu_PrintSubMainMenu_Caption                  = 'Друк';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_SpravSubMainMenu_Caption                  = 'Довідки';
 FZMainMenu_SvodPunktMainMenu_Caption                 = 'Звіти';
 FZMainMenu_SprSubsPunktMainMenu_Caption              = 'Про доходи(субсидія)';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_WindowSubMainMenu_Caption                 = 'Вікна';
 FZMainMenu_CascadePunktMainMenu_Caption              = 'Каскадом';
 FZMainMenu_TileVerPunktMainMenu_Caption              = 'Вертикально';
 FZMainMenu_TileGorPunktMainMenu_Caption              = 'Горизонтально';
 FZMainMenu_MinAllPunktMainMenu_Caption               = 'Мінімізувати';
 FZMainMenu_NormAllPunktMainMenu_Caption              = 'Нормалізувати';
 FZMainMenu_CloseWindAllPunktMainMenu_Caption         = 'Закрити';
 //----------------------------------------------------------------------------------------------------------
 FZMainMenu_ExitPunktMainMenu_Caption                 = 'Вихід';

 FZMainMenu_ExitAnswer_Caption                        = 'Вихід';
 FZMainMenu_ExitAnswer_Text                           = 'Ви дійсно бажаєте'+#13+'покинути систему?';

  //SotrListView
 Form_SotrList_Caption                                     ='Працівниіки(інформація)';
 TnColumnCaption                                           ='Таб. номер';
 FamiliaColumnCaption                                      ='Фамілія';
 ImyaColumnCaption                                         ='Імя';
 OtchestvoColumnCaption                                    ='По батькові';
 SotrDetailsBtnCaption                                     ='Інформація';



 //SotrFilterForm
 Form_SotrFilterCaption                                    ='Параметри відбіра';
 Tn_Label_Caption                                          ='Табельний номер:';
 Familia_Label_Caption                                     ='Фамілія:';
 Ink_Label_Caption                                         ='Індетифікаційний номер:';
 Department_Label_Caption                                  ='Підрозділ';

 //FSp_People_Prop_Control
 FSp_People_Prop_Control_Caption_Insert                    = 'Додавання признака';
 FSp_People_Prop_Control_Caption_Update                    = 'Редагування признака';
 FSp_People_Prop_Control_Caption_Delete                    = 'Вилучення признака';
 FSp_People_Prop_Control_IdentificationBox_Caption         = 'Головні данні';
 FSp_People_Prop_Control_PeriodBox_Caption                 = 'Період дії';
 FSp_People_Prop_Control_LabelPeople_Caption               = 'Фізична особа:';
 FSp_People_Prop_Control_PropLabel_Caption                 = 'Признак:';
 FSp_People_Prop_Control_DateBegLabel_Caption              = 'Початок';
 FSp_People_Prop_Control_DateEndLabel_Caption              = 'Закінчення';

//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
 ZAccess_UserLabel_Caption                        = 'Користувач';
 ZAccess_UserLogin_Caption                        = 'Пароль';
 ZAccess_Caption                                  = 'Вхід';
 ZAccess_YesBtn_Caption                           = 'Далі';
 ZAccess_CancelBtn_Caption                        = 'Вийти';
 ZAccess_ErrorInSystemAccess_Caption              = 'Помилка у системі безпеки!';
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************
//******************************************************************************

 //SotrDetailsForm
 SotrDetailsFormCaption                                    ='Детальна інформація по співробітнику';
 PeriodBegColumnCaption                                    ='З';
 PeriodEndColumnCaption                                    ='По';
 PostColumnCaption                                         ='Посада';
 PaymentColumnCaption                                      ='Тариф/Оклад';
 GeneralPageCaption                                        ='Загальна інформація';
 DepartmentLabelCaption                                    ='Підрозділ:';
 OrderNumCaption                                           ='Наказ номер:';
 ManMovingGridHeaderCaption                                ='Посадові переміщення';
 ManBonusGridHeaderCaption                                 ='Надбавки та доплати';
 BonusNameCaption                                          ='Назва';
 BonusPaymentCaption                                       ='Сумма/Процент';
 BonusBegCaption                                           ='З';
 BonusEndCaption                                           ='По';
 BonusOrderNumCaption                                      ='Наказ №';
 ManBonusPageCaption                                       ='Надбавки';
 FilterButtonCaption                                       ='Відбір';
 //Грид с больничными
 ManHospitalPageCaption                                    ='Листи непрацездатності';
 HospDateBegCaption                                        ='З';
 HospDateEndCaption                                        ='По';
 HospSeriaCaption                                          ='Серія';
 HospNumCaption                                            ='Номер';
 HospPercentCaption                                        ='Процент';
 //Грид с отпусками
 ManHolidayPageCaption                                     ='Відпустки';
 ManHolNameCaption                                         ='Назва';
 ManHolPeriodBegCaption                                    ='Період з';
 ManHolPeriodEndCaption                                    ='Період по';
 ManHolDateBegCaption                                      ='З';
 ManHolDateEndCaption                                      ='По';

implementation

end.
