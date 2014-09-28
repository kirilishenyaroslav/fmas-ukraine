unit Unit_SprSubs_Consts;

interface

resourcestring

 TFSprSubs_Caption                         = 'Фільтр';
 TFSprSubs_LabelFrom_Caption               = 'Початок: ';
 TFSprSubs_LabelTo_Caption                 = 'закінчення: ';
 TFSprSubs_BoxKodSetup_Caption             = '';
 TFSprSubs_BoxDataFilter_Caption           = '';
 TFSprSubs_YesBtn_Caption                  = 'Прийняти';
 TFSprSubs_CancelBtn_Caption               = 'Відмінити';
 TFSprSubs_MonthesList_Text                = 'Січень'+#13+'Лютий'+#13+'Березень'+#13+
                                                    'Квітень'+#13+'Травень'+#13+'Червень'+#13+
                                                    'Липень'+#13+'Серпень'+#13+'Вересень'+#13+
                                                    'Жовтень'+#13+'Листопад'+#13+'Грудень';
 TFSprSubs_InputError_Caption              = 'Помилка';
 TFSprSubs_InputKodSetupsError_Text        = 'Не вірно вказано період для відбору:'+#13+'початок має бути раніше за закінчення!';
 TFSprSubs_InputKodSetupsIntersect_Text     = 'Не вірно вказано період для відбору:'+#13+'період повинен перетинатися з періодом навчання!';
 TFSprSubs_InputPersonError_Text           = 'Не обрано фізичну особу для формування справки';
 TFSprSubs_InputKodSetupsDifferError_Text  = 'Довідку можна сформувати щонайбільше за рік!';
 TFSprPension_InputKodSetupsDifferError_Text  = 'Довідку можна сформувати щонайбільше за вісім років!';

 TDM_RPSexMan_Text                         = 'він ';
 TDM_RPSexWoMan_Text                       = 'вона ';
implementation

end.
