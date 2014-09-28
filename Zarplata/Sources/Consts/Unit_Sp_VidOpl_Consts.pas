unit Unit_Sp_VidOpl_Consts;

interface

resourcestring

//Общее
 InsertBtn_Caption                                    = 'Додати';
 UpdateBtn_Caption                                    = 'Редагувати';
 DeleteBtn_Caption                                    = 'Видалити';
 SelectBtn_Caption                                    = 'Обрати';
 SelectAllBtn_Caption                                 = 'Обрати з підлеглими';
 SpravBtn_Caption                                     = 'Довідник';
 DeleteRecord_Caption                                 = 'Видалення';
 DeleteRecord_Text                                    = 'Ви дійсно бажаєте'+#13+'вилучити цей запис?';
 SavePropsBtn_Caption                                 = 'Збереження';
 SavePropsBtn_Text1                                   = 'Належність властивості:'+#13;
 SavePropsBtn_Text2                                   = 'до деяких з груп було змінено.'+#13+'Зберігти?';
 SaveBtn_Caption                                      = 'Збереження';
 RefreshBtn_Caption                                   = 'Поновити';

 SpravPropVidOplBtn_Caption                           = 'Властивості';
 SpravGroupVidOplPropBtn_Caption                      = 'Групи властивостей';
 SpravGroupVidOplBtn_Caption                          = 'Групи видів оплат';
 TabSheetNar_Caption                                  = 'Нарахування';
 TabSheetUd_Caption                                   = 'Утримання';
 TabSheetCorespond_Caption                            = 'Кореспонденція';
 TabSheetConstsVo_Caption                             = 'Константи системи';
 ExitBtn_Caption                                      = 'Вийти';
 UpdateAllBtn_Caption                                 = 'Редагувати';
 LocateBtn_Caption                                    = 'Шукати';
 LocateNextBtn_Caption                                = '  Шукати далі';
 YesBtn_Caption                                       = 'Прийняти';
 CancelBtn_Caption                                    = 'Відмінити';
 Error_Caption                                        = 'Помилка';
 ButtonsControlBar_caption                            = 'Дії';
 LocateResult_Caption                                 = 'Пошук';
 LocateResult_NotLocateText                           = 'Нічого не знайдено';

//FVOLocate
 FVOLocate_Caption                                    = 'Пошук';
 FVOLocate_RadioGroupTypeLocate_Caption               = 'По';
 FVOLocate_GroupBoxLocate_Caption                     = 'Текст';
 FVOLocate_RadioGroupTypeLocate_Text1                 = 'Назва ВО';
 FVOLocate_RadioGroupTypeLocate_Text2                 = 'Код ВО';
 FVOLocate_RadioGroupTypeLocate_Text3                 = 'Константа';

// FCorespondEdit
 FCorespondEdit_Caption                               = 'Редагування кореспонденції';
 FCorespondEdit_LabelVidOplName_Caption               = 'Вид оплати';
 FCorespondEdit_LabelCorespond_Caption                = 'Назва кореспонденції';

//FVoplIniGroupControl
 FVoplIniGroupControl_Caption_Insert_Group             = 'Додавання групи для властивостей';
 FVoplIniGroupControl_Caption_Update_Group             = 'Редагування групи для властивостей';
 FVoplIniGroupControl_Caption_Delete_Group             = 'Вилучення групи для властивостей';
 FVoplIniGroupControl_Caption_Insert_Prop              = 'Додавання властивості';
 FVoplIniGroupControl_Caption_Update_Prop              = 'Редагування властивості';
 FVoplIniGroupControl_Caption_Delete_Prop              = 'Вилучення властивості';
 FVoplIniGroupControl_LabelFullName_Caption            = 'Назва';

 //FZSp_VidOpl
 FZSp_VidOpl_Caption                                   = 'Довідник видов оплат';
 FZSp_VidOpl_GridColumnVidOpl_Name_Caption             = 'Назва';
 FZSp_VidOpl_GridColumnOptionsName_Caption             = 'Властивість';
 FZSp_VidOpl_GridColumnOptionsUse_Caption              = 'У дії';
 FZSp_VidOpl_GridColumnOptionsGroup_Caption            = 'Група';
 FZSp_VidOpl_GridColumnOptionsNameGroup_Caption        = 'Група';
 FZSp_VidOpl_DockPanelGridOptions_Caption              = 'Властивості';
 FZSp_VidOpl_GridColumnVidOplNachisl_Caption           = 'Начислення';
 FZSp_VidOpl_GridColumnVidOplCash_Caption              = 'Грошовий';
 FZSp_VidOpl_GridColumnVidOplKod_Caption               = 'Код';
 FZSp_VidOpl_GridColumnVidOplGroup_Caption             = 'Група';

 FZSp_VidOpl_GridCorColumnNameProp_Caption             = 'Тип кореспонденції';
 FZSp_VidOpl_GridConstsColumnNameProp_Caption          = 'Назва константи';

 FZSp_VidOpl_LabelTipNach_Caption                      = 'Тип начислення:';
 FZSp_VidOpl_LabelTipFund_Caption                      = 'Фонд:';
 FZSp_VidOpl_LabelDateBeg_Caption                      = 'Початок:';
 FZSp_VidOpl_LabelDateEnd_Caption                      = 'Закінчення:';
 FZSp_VidOpl_SaveChanges_Caption                       = 'Збереження';
 FZSp_VidOpl_SaveChanges_Text1                         = 'Деякі властивості вида оплати:'+#13;
 FZSp_VidOpl_SaveChanges_Text2                         = #13+'було змінено. Зберігти?';

 //ZFVidOplControl
 ZFVidOplControl_Caption_Insert                        = 'Додавання виду оплати';
 ZFVidOplControl_Caption_Update                        = 'Редагування виду оплати';
 ZFVidOplControl_Caption_Delete                        = 'Вилучення виду оплати';
 ZFVidOplControl_IdentificatonBox_Caption              = 'Вид оплати';
 ZFVidOplControl_OptionsBox_Caption                    = 'Властивості';
 ZFVidOplControl_NameLabel_Caption                     = 'Назва:';
 ZFVidOplControl_KodLabel_Caption                      = 'Код:';
 ZFVidOplControl_Kod1dfLabel_Caption                   = 'Код 1ДФ:';
 ZFVidOplControl_CheckCash_Caption                     = 'Грошовий вид';
 ZFVidOplControl_CheckNachisl_Caption                  = 'Начислення';
 ZFVidOplControl_TypeNachislLabel_Caption              = 'Тип начислення:';
 ZFVidOplControl_TypeFundLabel_Caption                 = 'Тип фонду:';
 ZFVidOplControl_PeriodBox_Caption                     = 'Термін дії';
 ZFVidOplControl_DateBegLabel_Caption                  = 'Початок:';
 ZFVidOplControl_DateEndLabel_Caption                  = 'Заккінчення:';
 ZFVidOplControl_LabelGroup_Caption                    = 'Группа для відображення:';

 //FZ_Vopl_Filter
 FZ_Vopl_Filter_Caption                                     = 'Довідник груп видов оплат';
 FZ_Vopl_Filter_GridColumnName_Caption                      = 'Назва групи';

 //VoplFilterControl
 VoplFilterControl_Caption_Insert                      = 'Додавання групи';
 VoplFilterControl_Caption_Update                      = 'Редагування групи';
 VoplFilterControl_LabelFullName_Caption               = 'Назва групи:';

 //VoplPropControlForm_
 VoplPropControlForm_Caption                          = 'Редагування властивостей';
 VoplPropControlFormTreeListColumnName_Caption        = 'Властивость';
 VoplPropControlFormTreeListColumnUse_Caption         = 'Користування';

 //FZ_Vopl_Prop
 FZ_Vopl_Prop_Caption                                 = 'Довідник властивостей видів оплат';
 FZ_Vopl_Prop_GridColumnName_Caption                  = 'Назва властивості';
 FZ_Vopl_Prop_GridChColumnGroupName_Caption           = 'Назва групи';
 FZ_Vopl_Prop_GridChColumnGroupUse_Caption            = 'Групувати';

 //FZ_Vopl_PropGroup
 FZ_Vopl_PropGroup_Caption                            = 'Довідник груп властивостей видів оплат';
 FZ_Vopl_PropGroup_GridColumnName_Caption             = 'Назва групи';
 FZ_Vopl_PropGroup_GridColumnKod_Caption              = 'Код';
 FZ_Vopl_PropGroup_GridColumnNameGroup_Caption        = 'Тип';
 FZ_Vopl_PropGroup_GridChColumnGroupName_Caption      = 'Властивість';
 FZ_Vopl_PropGroup_GridChColumnGroupUse_Caption       = 'Активність';

 //FSpVoplIniPropGroupControl
 FSpVoplIniPropGroupControl_Caption                   = 'Властивості';
 FSpVoplIniPropGroupControl_CheckAllBtn_Caption       = 'Прийняти всі';
 FSpVoplIniPropGroupControl_UnCheckAllBtn_Caption     = 'Відмінити всі';

 //VoplPropGroupControl
 VoplPropGroupControl_Caption_Insert                  = 'Додавання групи';
 VoplPropGroupControl_Caption_Update                  = 'Редагування групи';
 VoplPropGroupControl_LabelFullName_Caption           = 'Назва групи';
 VoplPropGroupControl_LabelKod_Caption                = 'Код групи';
 VoplPropGroupControl_LabelNameFilter_Caption         = 'Тип групи властивості видів оплати';
 VoplPropGroupControl_ComboBoxFilter_Name_Caption     = 'Назва типу групи';

implementation

end.
