unit Unit_DatesAcc_Consts;

interface

resourcestring

 TZDatesAccFilter_Caption                         = 'Фільтр';
 TZDatesAccFilter_LabelFrom_Caption               = 'Початок: ';
 TZDatesAccFilter_LabelTo_Caption                 = 'закінчення: ';
 TZDatesAccFilter_BoxKodSetup_Caption             = '';
 TZDatesAccFilter_FilterType_Caption              = '';
 TZDatesAccFilter_FilterType_Item0_Caption        = 'Фізична особа';
 TZDatesAccFilter_FilterType_Item1_Caption        = 'Підрозділ';
 TZDatesAccFilter_FilterType_Item2_Caption        = 'Без фільтру';
 TZDatesAccFilter_BoxDataFilter_Caption           = '';
 TZDatesAccFilter_YesBtn_Caption                  = 'Прийняти';
 TZDatesAccFilter_CancelBtn_Caption               = 'Відмінити';
 TZDatesAccFilter_MonthesList_Text                = 'Січень'+#13+'Лютий'+#13+'Березень'+#13+
                                                    'Квітень'+#13+'Травень'+#13+'Червень'+#13+
                                                    'Липень'+#13+'Серпень'+#13+'Вересень'+#13+
                                                    'Жовтень'+#13+'Листопад'+#13+'Грудень';
 TZDatesAccFilter_InputError_Caption              = 'Помилка';
 TZDatesAccFilter_InputKodSetupsError_Text        = 'Не вірно вказано період для відбору:'+#13+'початок має бути раніше за закінчення!';



 FZDateAcc_Caption_LaterPeriods                   = 'Дані за минулі періоди';
 FZDateAcc_Caption_Accs                           = 'Дані останньої операції ';
 FZDateAcc_RefreshBtn_Caption                     = 'Поновити';
 FZDateAcc_ExitBtn_Caption                        = 'Вихід';
 FZDateAcc_PrintBtn_Caption                       = 'Друк';
 FZDateAcc_FilterBtn_Caption                      = 'Фільтрувати';
 FZDateAcc_GridMasterIdMan_Caption                = '-';
 FZDateAcc_GridMasterDateAcc_Caption              = 'Дата';
 FZDateAcc_GridMasterKodSetup2_Caption            = 'Період';
 FZDateAcc_GridMasterTypeAcc_Caption              = 'Розрахунок';
 FZDateAcc_GridChildColKodVidOpl_Caption          = 'ВО';
 FZDateAcc_GridChildColNameVidOpl_Caption         = 'Вид оплати';
 FZDateAcc_GridChildColSumma_Caption              = 'Сума';
 FZDateAcc_GridChildColP1_Caption                 = '+/-';
 FZDateAcc_GridChildColP1_Caption_Group           = 'Тип';
 FZDateAcc_GridChildColP1True_Text                = 'Нарахування';
 FZDateAcc_GridChildColP1False_Text               = 'Утримання';
 FZDateAcc_GridChildColDepartment_Caption         = 'Підр.';
 FZDateAcc_GridChildColSmeta_Caption              = 'См.';

 FZDateAcc_GridChildColNDay_Caption               = 'Дн.';
 FZDateAcc_GridChildColClock_Caption              = 'Год.';
 FZDateAcc_GridChildColStavkaPercent_Caption      = 'Ст./%';

 FZDateAcc_GridChildColReCount_Caption            = '';
 FZDateAcc_GridChildColKodSetup3_Caption          = 'М';

 FZDateAcc_LabelDepartment_Caption                = 'Підрозділ:';
 FZDateAcc_LabelSmeta_Caption                     = 'Смета:';

 FZDateAcc_GridChildColNameVidOplSummary_Format   = 'Загалом до сплати:';
implementation

end.
