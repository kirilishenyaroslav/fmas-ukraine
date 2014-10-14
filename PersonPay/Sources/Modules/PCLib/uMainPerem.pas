unit uMainPerem;

interface

uses ibase;
const  _PATH_REPORTS   =    'Reports\PersonPay';
       NAME_SYSTEM = 'Система персоніфікованого обліку';
        // коды договоров системы
       CN_KOD_DOG = 1;
       ST_KOD_DOG = 1; 
var
// пользователь
USER_NAME:string;
USER_ID: int64;
USER_ID_PCARD: int64;
USER_FIO: string;
// главный Handle
 MAIN_DB_HANDLE : TISC_DB_HANDLE;
//  форма учета
 FORM_UCH: Integer;
 ID_REG         : Integer;
 ID_SYSTEM      : string;  
// учетный период
 PERS_PAY_PERIOD: TDateTime;
// счета по форме учета
 PC_ID_SCH_ROOT : Integer;
// данные о группах договоров
 GROUP_DOG_SEL_COMMON: integer;
 GROUP_DOG_ADD_COMMON: integer;
 GRP_DOG_STUD: Integer;
 GRP_DOG_KONTR: Integer;
 TYPE_DOC:Integer;
 TYPE_DOC_VAL:Integer;
 TYPE_DOC_NACH:Integer;
 //инфо об организации
 ORG_FULL_NAME: string;
 ORG_SHORT_NAME: string;
 ORG_KOD_OKPO: string;
 SERVER_TITLE: string;
 SHORT_TITLE:string;
// період
 DATE_REC:TDateTime;
// ид. для конкретного пользователя по счетам
 ID_SES_SCH_FOR_SYSTEM:Integer;
 // массив счетов системы
 SCH_ARRAY: array of array of Variant;
 IS_NOT_EXIXSTS_SCH:Integer;
 SCH_SYSTEM:string;
 NAME_SYSTEM_:string;
 LENGHT_NUM_DOC:Integer;
 DEBETORI_KREDITORI:string;
 NOT_PRINT_FIO_ISPOLN:Integer;
 // валютный расчет
 IS_VALYUTA:Integer;
 DATE_VISIT: TDateTime;
 IS_EXISTS_NEUTV_DOC:Integer;
 KASS_DAY:Integer;
// FLAG_FULL_DOG:Integer;
USE_NALOG_NAKL:Integer;
 implementation

end.
