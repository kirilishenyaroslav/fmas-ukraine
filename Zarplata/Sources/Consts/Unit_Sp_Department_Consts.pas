unit Unit_Sp_Department_Consts;

interface

resourcestring
//Общее
 SelectBtn_Caption                                    = 'Обрати';
 SelectAllBtn_Caption                                 = 'Обрати з підлеглими';
 PrintSvodBtn_Caption                                 = 'Друк звіту';
 RefreshBtn_Caption                                   = 'Поновити';
 ExitBtn_Caption                                      = 'Вийти';
 LocateNextBtn_Caption                                = '  Шукати далі';
 Error_Caption                                        = 'Помилка';
 ButtonsControlBar_caption                            = 'Дії';

//FZSp_Division
 FZSp_Department_Caption                              = 'Довідник підрозділів';
 FZSp_Department_TreeListColumnNameDepType_Caption    = 'Тип підрозділу';
 FZSp_Department_TreeListColumnShortName_Caption      = 'Скорочена назва';
 FZSp_Department_TreeListColumnSumma_Caption          = 'Сумма';
 FZSp_Department_ColumnOptionName_Caption             = 'Назва властивості';
 FZSp_Department_TreeListColumnKod_Caption            = 'Код підрозділу';
 FZSp_Department_DockPanelGrid_Caption                = 'Властивості';
 FZSp_Department_ColumnOptionName_FieldName           = 'NAME_DIVISION_OPTION';
 FZSp_Department_TreeList_KeyField                    = 'ID_DEPARTMENT';
 FZSp_Department_TreeList_ParentField                 = 'ID_PARENT';
 FZSp_Department_TreeListColumnShortName_FieldName    = 'NAME_SHORT';
 FZSp_Department_TreeListColumnNameDepType_FieldName  = 'NAME_DEP_TYPE';
 FZSp_Department_TreeListColumnKod_FieldName          = 'DEPARTMENT_KOD';
 FZSp_Department_TreeListColumnSumma_FieldName        = 'SUMMA';
 FZSp_Department_DataSetParent_SelectSQL_Text         = 'SELECT * FROM SP_DEPARTMENT_ZARSELECT';
 FZSp_Department_DataSetChild_SelectSQL_Text          = 'SELECT * FROM Z_DEPARTMENT_PROPERTY_SELECT(:ID_DEPARTMENT)';

 FZSp_Department_Error_Caption                        = 'Помилка';
implementation

end.
