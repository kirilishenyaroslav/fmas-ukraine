{-$Id: PrintOrderUnit.pas,v 1.34 2009/09/01 08:38:35 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система «Управление персоналом              }
{       государственного производственного предприятия «Укрпромводчермет»      }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                       Модуль "Печать приказов"                               }
{    Модуль печати приказов                                                    }
{    Ответственный: Кропов Валентин                                            }

unit PrintOrderUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery, PersonalCommon,
    FR_Class, FR_DSet, FR_DBSet, FIBDataSet, pFIBDataSet, frxClass,
    frxDBSet;

type
    TPrintOrderForm = class(TForm)
        OkButton: TBitBtn;
        BitBtn2: TBitBtn;
        AcceptManDataSet: TfrDBDataSet;
        AcceptManReport: TfrReport;
        DismissManQuery: TIBQuery;
        DismissManDataSet: TfrDBDataSet;
        DismissManReport: TfrReport;
        TempQuery: TIBQuery;
        AcceptManQuery: TIBQuery;
        DismissManQueryDATE_DISMISSION: TDateField;
        DismissManQueryDISMISSION_REASON: TIBStringField;
        DismissManQueryPROFKOM_AGREE: TIBStringField;
        DismissManQueryFIO: TIBStringField;
        DismissManQueryDEPARTMENT_NAME: TIBStringField;
        DismissManQueryPOST_NAME: TIBStringField;
        DismissManQueryNUM_ORDER: TIBStringField;
        DismissManQueryDATE_ORDER: TDateField;
        DismissManQueryNAME_CATEGORY: TIBStringField;
        DismissManQueryNAME_TAR_NET: TIBStringField;
        DismissManQueryDIGIT: TIntegerField;
        DismissManQueryWORK_COND: TIBStringField;
        DismissManQueryMONEY: TIBBCDField;
        DismissManQueryFIRM_NAME: TIBStringField;
        DismissManQueryFIRM_EDRPOU: TIBStringField;
        DismissManQueryFIRM_UKUD: TIBStringField;
        DismissManQueryTN: TIntegerField;
        MoveManQuery: TIBQuery;
        MoveManReport: TfrReport;
        MoveManDataSet: TfrDBDataSet;
        MoveManQueryFIO: TIBStringField;
        MoveManQueryOLD_DEPARTMENT_NAME: TIBStringField;
        MoveManQueryNEW_DEPARTMENT_NAME: TIBStringField;
        MoveManQueryOLD_CATEGORY_NAME: TIBStringField;
        MoveManQueryNEW_WORK_COND: TIBStringField;
        MoveManQueryNEW_PAY_FORM: TIBStringField;
        MoveManQueryNEW_CATEGORY_NAME: TIBStringField;
        MoveManQueryOLD_POST_NAME: TIBStringField;
        MoveManQueryNEW_POST_NAME: TIBStringField;
        MoveManQueryOLD_DATE_BEG: TDateField;
        MoveManQueryOLD_DATE_END: TDateField;
        MoveManQueryMOVE_DATE_BEG: TDateField;
        MoveManQueryMOVE_DATE_END: TDateField;
        MoveManQueryIS_TEMP: TIntegerField;
        MoveManQueryMOVE_REASON: TIBStringField;
        MoveManQueryNEW_KOL_STAVOK: TIBBCDField;
        MoveManQueryOLD_MONEY: TIBBCDField;
        MoveManQueryOLD_DIGIT: TIntegerField;
        MoveManQueryNEW_MONEY: TIBBCDField;
        MoveManQueryNEW_DIGIT: TIntegerField;
        MoveManQueryNEW_NAME_MOVING_TYPE: TIBStringField;
        MoveManQueryFIRM_NAME: TIBStringField;
        MoveManQueryFIRM_EDRPOU: TIBStringField;
        MoveManQueryFIRM_UKUD: TIBStringField;
        MoveManQueryDATE_ORDER: TDateField;
        MoveManQueryTN: TIntegerField;
        MoveManQueryNUM_ORDER: TIBStringField;
        MoveManQuerySYSTEM_DATE_END: TDateField;
        MoveManQueryID_STATUS: TIntegerField;
        DismissManQueryID_STATUS: TIntegerField;
        HolidayManReport: TfrReport;
        HolidayManQuery: TIBQuery;
        HolidayManDataSet: TfrDBDataSet;
        BonusReport: TfrReport;
        BonusQuery: TIBQuery;
        BonusDataSet: TfrDBDataSet;
        BonusRemoveReport: TfrReport;
        BonusRemoveQuery: TIBQuery;
        BonusRemoveDataSet: TfrDBDataSet;
        BonusRemoveQueryID_DEPARTMENT: TIntegerField;
        BonusRemoveQueryID_MAN_BONUS_REMOVE: TIntegerField;
        BonusRemoveQueryID_MAN_BONUS: TIntegerField;
        BonusRemoveQueryREMOVE_DATE: TDateField;
        BonusRemoveQueryNAME_BONUS: TIBStringField;
        BonusRemoveQueryID_BONUS: TIntegerField;
        BonusRemoveQueryID_MAN_MOVING: TIntegerField;
        BonusRemoveQueryID_PCARD: TIntegerField;
        BonusRemoveQueryFIO: TIBStringField;
        BonusRemoveQueryDEPARTMENT_NAME: TIBStringField;
        BonusRemoveQueryPOST_NAME: TIBStringField;
        BonusRemoveQueryIS_PERCENT: TIBStringField;
        BonusRemoveQuerySUMMA: TIBBCDField;
        BonusRemoveQueryTHE_BONUS: TIBStringField;
        BonusRemoveQueryBONUS_DATE_BEG: TDateField;
        BonusRemoveQueryBONUS_DATE_END: TDateField;
        BonusRemoveQueryFIRM_NAME: TIBStringField;
        BonusRemoveQueryDATE_BEG: TDateField;
        BonusRemoveQueryFIRM_EDRPOU: TIBStringField;
        BonusRemoveQueryFIRM_UKUD: TIBStringField;
        BonusRemoveQueryCURRENT_DEPARTMENT: TIntegerField;
        BonusRemoveQueryFIO_SMALL: TIBStringField;
        BonusRemoveQueryID_STATUS: TIntegerField;
        BonusRemoveQueryNUM_ORDER: TIBStringField;
        BonusRemoveQueryDATE_ORDER: TDateField;
        BonusChangeReport: TfrReport;
        BonusChangeQuery: TIBQuery;
        BonusChangeDataSet: TfrDBDataSet;
        BonusChangeQueryID_DEPARTMENT: TIntegerField;
        BonusChangeQueryID_MAN_BONUS: TIntegerField;
        BonusChangeQueryFIO: TIBStringField;
        BonusChangeQueryDEPARTMENT_NAME: TIBStringField;
        BonusChangeQueryPOST_NAME: TIBStringField;
        BonusChangeQueryID_MAN_MOVING: TIntegerField;
        BonusChangeQueryNEW_DATE_BEG: TDateField;
        BonusChangeQueryNEW_DATE_END: TDateField;
        BonusChangeQueryNEW_NAME_BONUS: TIBStringField;
        BonusChangeQueryNEW_THE_BONUS: TIBStringField;
        BonusChangeQueryOLD_DATE_BEG: TDateField;
        BonusChangeQueryOLD_DATE_END: TDateField;
        BonusChangeQueryOLD_NAME_BONUS: TIBStringField;
        BonusChangeQueryOLD_THE_BONUS: TIBStringField;
        BonusChangeQueryUSE_END: TDateTimeField;
        BonusChangeQueryDATE_END: TDateField;
        BonusChangeQueryFIRM_NAME: TIBStringField;
        BonusChangeQueryDATE_BEG: TDateField;
        BonusChangeQueryFIRM_EDRPOU: TIBStringField;
        BonusChangeQueryFIRM_UKUD: TIBStringField;
        BonusChangeQueryPASS_AGE: TIntegerField;
        BonusChangeQueryEDUC_AGE: TIntegerField;
        BonusChangeQueryCURRENT_DEPARTMENT: TIntegerField;
        BonusChangeQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        BonusChangeQueryDATE_ORDER: TDateField;
        BonusChangeQueryNUM_ORDER: TIBStringField;
        BonusChangeQueryID_STATUS: TIntegerField;
        BonusChangeQueryFIO_SMALL: TIBStringField;
        ManPunishingReport: TfrReport;
        ManPunishingQuery: TIBQuery;
        ManPunishingDataSet: TfrDBDataSet;
        ManPunishingQueryID_DEPARTMENT: TIntegerField;
        ManPunishingQueryID_MAN_PUNISHING: TIntegerField;
        ManPunishingQueryID_MAN_MOVING: TIntegerField;
        ManPunishingQueryID_PUNISHING: TIntegerField;
        ManPunishingQueryNAME_PUNISHING: TIBStringField;
        ManPunishingQueryFIO: TIBStringField;
        ManPunishingQueryDEPARTMENT_NAME: TIBStringField;
        ManPunishingQueryPOST_NAME: TIBStringField;
        ManPunishingQueryID_ORDER_BEG: TIntegerField;
        ManPunishingQueryID_STATUS_BEG: TIntegerField;
        ManPunishingQueryNUM_ITEM_BEG: TIntegerField;
        ManPunishingQueryID_PCARD: TIntegerField;
        ManPunishingQueryNUM_ORDER_BEG: TIBStringField;
        ManPunishingQueryDATE_ORDER_BEG: TDateField;
        ManPunishingQueryID_ORDER_END: TIntegerField;
        ManPunishingQueryNUM_ORDER_END: TIBStringField;
        ManPunishingQueryNUM_ITEM_END: TIntegerField;
        ManPunishingQueryDATE_ORDER_END: TDateField;
        ManPunishingQueryID_STATUS_END: TIntegerField;
        ManPunishingQueryUSE_END: TDateTimeField;
        ManPunishingQueryDATE_END: TDateField;
        ManPunishingQueryFIRM_NAME: TIBStringField;
        ManPunishingQueryDATE_BEG: TDateField;
        ManPunishingQueryFIRM_EDRPOU: TIBStringField;
        ManPunishingQueryFIRM_UKUD: TIBStringField;
        ManPunishingQueryPASS_AGE: TIntegerField;
        ManPunishingQueryEDUC_AGE: TIntegerField;
        ManPunishingQueryCURRENT_DEPARTMENT: TIntegerField;
        ManPunishingQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        ManPunishingQueryFIO_SMALL: TIBStringField;
        ManPunishingRemoveReport: TfrReport;
        ManPunishingRemoveQuery: TIBQuery;
        ManPunishingRemoveDataSet: TfrDBDataSet;
        ManPunishingRemoveQueryFIO_SMALL: TIBStringField;
        ManPunishingRemoveQueryID_DEPARTMENT: TIntegerField;
        ManPunishingRemoveQueryID_MAN_PUNISHING_REMOVE: TIntegerField;
        ManPunishingRemoveQueryID_MAN_PUNISHING: TIntegerField;
        ManPunishingRemoveQueryNUM_ORDER_BEG: TIBStringField;
        ManPunishingRemoveQueryNUM_ITEM_BEG: TIntegerField;
        ManPunishingRemoveQueryDATE_ORDER_BEG: TDateField;
        ManPunishingRemoveQueryFIO: TIBStringField;
        ManPunishingRemoveQueryNAME_PUNISHING: TIBStringField;
        ManPunishingRemoveQueryDEPARTMENT_NAME: TIBStringField;
        ManPunishingRemoveQueryPOST_NAME: TIBStringField;
        ManPunishingRemoveQueryUSE_END: TDateTimeField;
        ManPunishingRemoveQueryDATE_END: TDateField;
        ManPunishingRemoveQueryFIRM_NAME: TIBStringField;
        ManPunishingRemoveQueryDATE_BEG: TDateField;
        ManPunishingRemoveQueryFIRM_EDRPOU: TIBStringField;
        ManPunishingRemoveQueryFIRM_UKUD: TIBStringField;
        ManPunishingRemoveQueryPASS_AGE: TIntegerField;
        ManPunishingRemoveQueryEDUC_AGE: TIntegerField;
        ManPunishingRemoveQueryCURRENT_DEPARTMENT: TIntegerField;
        ManPunishingRemoveQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        ManPunishingRemoveQueryID_STATUS_BEG: TIntegerField;
        ManAwardReport: TfrReport;
        ManAwardQuery: TIBQuery;
        ManAwardDataSet: TfrDBDataSet;
        ManAwardQueryFIO_SMALL: TIBStringField;
        ManAwardQueryID_DEPARTMENT: TIntegerField;
        ManAwardQueryID_MAN_AWARD: TIntegerField;
        ManAwardQueryID_MAN_MOVING: TIntegerField;
        ManAwardQueryID_PCARD: TIntegerField;
        ManAwardQueryID_AWARD: TIntegerField;
        ManAwardQueryNAME_AWARD: TIBStringField;
        ManAwardQueryID_AWARD_TYPE: TIntegerField;
        ManAwardQueryNAME_AWARD_TYPE: TIBStringField;
        ManAwardQueryFIO: TIBStringField;
        ManAwardQueryID_ORDER: TIntegerField;
        ManAwardQueryNUM_ITEM: TIntegerField;
        ManAwardQueryDEPARTMENT_NAME: TIBStringField;
        ManAwardQueryPOST_NAME: TIBStringField;
        ManAwardQueryDATE_ORDER: TDateField;
        ManAwardQueryID_STATUS: TIntegerField;
        ManAwardQueryNUM_ORDER: TIBStringField;
        ManAwardQueryUSE_END: TDateTimeField;
        ManAwardQueryDATE_END: TDateField;
        ManAwardQueryFIRM_NAME: TIBStringField;
        ManAwardQueryDATE_BEG: TDateField;
        ManAwardQueryFIRM_EDRPOU: TIBStringField;
        ManAwardQueryFIRM_UKUD: TIBStringField;
        ManAwardQueryPASS_AGE: TIntegerField;
        ManAwardQueryEDUC_AGE: TIntegerField;
        ManAwardQueryCURRENT_DEPARTMENT: TIntegerField;
        ManAwardQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        ManPrivReport: TfrReport;
        ManPrivQuery: TIBQuery;
        ManPrivDataSet: TfrDBDataSet;
        ManPrivQueryFIO_SMALL: TIBStringField;
        ManPrivQueryID_DEPARTMENT: TIntegerField;
        ManPrivQueryID_MAN_PRIV: TIntegerField;
        ManPrivQueryID_MAN_MOVING: TIntegerField;
        ManPrivQueryID_PRIV: TIntegerField;
        ManPrivQueryNAME_PRIV: TIBStringField;
        ManPrivQueryID_PRIV_TYPE: TIntegerField;
        ManPrivQueryNAME_PRIV_TYPE: TIBStringField;
        ManPrivQueryFIO: TIBStringField;
        ManPrivQueryDEPARTMENT_NAME: TIBStringField;
        ManPrivQueryPOST_NAME: TIBStringField;
        ManPrivQueryID_ORDER_BEG: TIntegerField;
        ManPrivQueryID_STATUS_BEG: TIntegerField;
        ManPrivQueryNUM_ITEM_BEG: TIntegerField;
        ManPrivQueryID_PCARD: TIntegerField;
        ManPrivQueryNUM_ORDER_BEG: TIBStringField;
        ManPrivQueryDATE_ORDER_BEG: TDateField;
        ManPrivQueryID_ORDER_END: TIntegerField;
        ManPrivQueryNUM_ORDER_END: TIBStringField;
        ManPrivQueryNUM_ITEM_END: TIntegerField;
        ManPrivQueryDATE_ORDER_END: TDateField;
        ManPrivQueryID_STATUS_END: TIntegerField;
        ManPrivQueryUSE_END: TDateTimeField;
        ManPrivQueryDATE_END: TDateField;
        ManPrivQueryFIRM_NAME: TIBStringField;
        ManPrivQueryDATE_BEG: TDateField;
        ManPrivQueryFIRM_EDRPOU: TIBStringField;
        ManPrivQueryFIRM_UKUD: TIBStringField;
        ManPrivQueryPASS_AGE: TIntegerField;
        ManPrivQueryEDUC_AGE: TIntegerField;
        ManPrivQueryCURRENT_DEPARTMENT: TIntegerField;
        ManPrivQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        ManPrivRemoveReport: TfrReport;
        ManPrivRemoveQuery: TIBQuery;
        ManPrivRemoveDataSet: TfrDBDataSet;
        ManPrivRemoveQueryID_STATUS_BEG: TIntegerField;
        ManPrivRemoveQueryFIO_SMALL: TIBStringField;
        ManPrivRemoveQueryID_DEPARTMENT: TIntegerField;
        ManPrivRemoveQueryID_MAN_PRIV_REMOVE: TIntegerField;
        ManPrivRemoveQueryID_MAN_PRIV: TIntegerField;
        ManPrivRemoveQueryNUM_ORDER_BEG: TIBStringField;
        ManPrivRemoveQueryNUM_ITEM_BEG: TIntegerField;
        ManPrivRemoveQueryDATE_ORDER_BEG: TDateField;
        ManPrivRemoveQueryFIO: TIBStringField;
        ManPrivRemoveQueryNAME_PRIV: TIBStringField;
        ManPrivRemoveQueryNAME_PRIV_TYPE: TIBStringField;
        ManPrivRemoveQueryDEPARTMENT_NAME: TIBStringField;
        ManPrivRemoveQueryPOST_NAME: TIBStringField;
        ManPrivRemoveQueryUSE_END: TDateTimeField;
        ManPrivRemoveQueryDATE_END: TDateField;
        ManPrivRemoveQueryFIRM_NAME: TIBStringField;
        ManPrivRemoveQueryDATE_BEG: TDateField;
        ManPrivRemoveQueryFIRM_EDRPOU: TIBStringField;
        ManPrivRemoveQueryFIRM_UKUD: TIBStringField;
        ManPrivRemoveQueryPASS_AGE: TIntegerField;
        ManPrivRemoveQueryEDUC_AGE: TIntegerField;
        ManPrivRemoveQueryCURRENT_DEPARTMENT: TIntegerField;
        ManPrivRemoveQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        ManToDoReport: TfrReport;
        ManToDoQuery: TIBQuery;
        ManToDoDataSet: TfrDBDataSet;
        ManToDoQueryID_STATUS: TIntegerField;
        ManToDoQueryNUM_ORDER: TIBStringField;
        ManToDoQueryID_TODOLIST: TIntegerField;
        ManToDoQueryID_ORDER: TIntegerField;
        ManToDoQueryDATE_ORDER: TDateField;
        ManToDoQueryNUM_ITEM: TIntegerField;
        ManToDoQueryDATE_BEG: TDateField;
        ManToDoQueryPLAN_DATE_END: TDateField;
        ManToDoQueryID_COMPLEX_MARK: TIntegerField;
        ManToDoQueryCOMPLEX_MARK_NAME: TIBStringField;
        ManToDoQueryCOMPLEX_MARK_VALUE: TFloatField;
        ManToDoQueryREAL_DATE_END: TDateField;
        ManToDoQueryID_QUALITY_MARK: TIntegerField;
        ManToDoQueryMARK_NAME: TIBStringField;
        ManToDoQueryMARK_VALUE: TFloatField;
        ManToDoQueryNOTE: TIBStringField;
        ManToDoQueryID_MAN_MOVING: TIntegerField;
        ManToDoQueryDEPARTMENT_NAME: TIBStringField;
        ManToDoQueryPOST_NAME: TIBStringField;
        ManToDoQueryID_SHTATRAS: TIntegerField;
        ManToDoQueryID_PCARD: TIntegerField;
        ManToDoQueryFIO: TIBStringField;
        ManToDoQueryUSE_END: TDateTimeField;
        ManToDoQueryDATE_END: TDateField;
        ManToDoQueryFIRM_NAME: TIBStringField;
        ManToDoQueryDATE_BEG1: TDateField;
        ManToDoQueryFIRM_EDRPOU: TIBStringField;
        ManToDoQueryFIRM_UKUD: TIBStringField;
        ManToDoQueryPASS_AGE: TIntegerField;
        ManToDoQueryEDUC_AGE: TIntegerField;
        ManToDoQueryCURRENT_DEPARTMENT: TIntegerField;
        ManToDoQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        ManPremiaReport: TfrReport;
        ManPremiaQuery: TIBQuery;
        ManPremiaDataSet: TfrDBDataSet;
        ExportButton: TBitBtn;
        MoveManQueryOLD_NAME_TAR_NET: TIBStringField;
        MoveManQueryNEW_NAME_TAR_NET: TIBStringField;
        TextOrderReport: TfrReport;
        TextOrderQuery: TIBQuery;
        TextOrderDBDataSet: TfrDBDataSet;
        HeaderQuery: TIBQuery;
        SignQuery: TIBQuery;
        VizaQuery: TIBQuery;
        KnowQuery: TIBQuery;
        AgreeQuery: TIBQuery;
        SignQueryFIO: TIBStringField;
        SignQueryPOST: TIBStringField;
        VizaQueryFIO: TIBStringField;
        KnowQueryFIO: TIBStringField;
        AgreeQueryFIO: TIBStringField;
        TextOrderQueryID_ADDITIONAL_ACTION: TIntegerField;
        TextOrderQueryID_ORDER: TIntegerField;
        SignDataSet: TfrDBDataSet;
        VizaDataSet: TfrDBDataSet;
        KnowDataSet: TfrDBDataSet;
        AgreeDataSet: TfrDBDataSet;
        TextOrderQueryPORYADOK: TIBStringField;
        ManPremiaQueryID_PCARD: TIntegerField;
        ManPremiaQueryID_MAN_PREMIA: TIntegerField;
        ManPremiaQueryID_MAN_MOVING: TIntegerField;
        ManPremiaQueryID_VIDOPL: TIntegerField;
        ManPremiaQueryIS_PERCENT: TIBStringField;
        ManPremiaQuerySUMMA: TIBBCDField;
        ManPremiaQueryDATE_BEG: TDateField;
        ManPremiaQueryDATE_END: TDateField;
        ManPremiaQueryTHE_BONUS: TIBStringField;
        ManPremiaQueryNAME_PREMIA: TIBStringField;
        ManPremiaQueryDEPARTMENT_NAME: TIBStringField;
        ManPremiaQueryPOST_NAME: TIBStringField;
        ManPremiaQueryDATE_ORDER: TDateField;
        ManPremiaQueryFIO: TIBStringField;
        ManPremiaQueryID_DEPARTMENT: TIntegerField;
        ManPremiaQueryID_POST: TIntegerField;
        ManPremiaQueryTN: TIntegerField;
        BonusQueryID_VIDOPL: TIntegerField;
        BonusQueryFIO_SMALL: TIBStringField;
        BonusQueryID_DEPARTMENT: TIntegerField;
        BonusQueryID_STATUS: TIntegerField;
        BonusQueryNUM_ORDER: TIBStringField;
        BonusQueryDATE_ORDER: TDateField;
        BonusQueryID_MAN_BONUS: TIntegerField;
        BonusQueryID_MAN_MOVING: TIntegerField;
        BonusQueryID_BONUS: TIntegerField;
        BonusQueryIS_PERCENT: TIBStringField;
        BonusQuerySUMMA: TIBBCDField;
        BonusQueryBONUS_DATE_BEG: TDateField;
        BonusQueryBONUS_DATE_END: TDateField;
        BonusQueryNUM_ITEM: TIntegerField;
        BonusQueryFIO: TIBStringField;
        BonusQueryDEPARTMENT_NAME: TIBStringField;
        BonusQueryPOST_NAME: TIBStringField;
        BonusQueryWORK_DATE_BEG: TDateField;
        BonusQueryWORK_DATE_END: TDateField;
        BonusQueryNAME_BONUS: TIBStringField;
        BonusQueryTHE_BONUS: TIBStringField;
        DismissManQueryUNWORK: TIntegerField;
        DismissManQueryNOTUSED: TIntegerField;
        AcceptManQueryTN: TIntegerField;
        AcceptManQueryNUM_ORDER: TIBStringField;
        AcceptManQueryDATE_ORDER: TDateField;
        AcceptManQueryID_STATUS: TIntegerField;
        AcceptManQueryDATE_BEG: TDateField;
        AcceptManQueryDATE_END: TDateField;
        AcceptManQueryTEST_TERM: TIntegerField;
        AcceptManQuerySTAJIROVKA_TERM: TIntegerField;
        AcceptManQueryIS_MAIN: TIntegerField;
        AcceptManQueryFIO: TIBStringField;
        AcceptManQueryDEPARTMENT_FULL: TIBStringField;
        AcceptManQueryNAME_POST: TIBStringField;
        AcceptManQueryNAME_CATEGORY: TIBStringField;
        AcceptManQueryNAME_MOVING_TYPE: TIBStringField;
        AcceptManQueryPAY_FORM: TIBStringField;
        AcceptManQueryWORK_COND: TIBStringField;
        AcceptManQueryMONEY: TIBStringField;
        AcceptManQueryDIGIT: TIntegerField;
        AcceptManQueryNAME_TAR_NET: TIBStringField;
        AcceptManQueryFIRM_NAME: TIBStringField;
        AcceptManQueryFIRM_EDRPOU: TIBStringField;
        AcceptManQueryFIRM_UKUD: TIBStringField;
        AcceptManQuerySYSTEM_DATE_END: TDateField;
        AcceptManQueryBONUS_STRING: TIBStringField;
        AcceptManQueryWORK_MODE: TIBStringField;
        MoveManQueryNEW_NAME_WORK_MODE: TIBStringField;
        MoveManQueryBONUS_STRING: TIBStringField;
        MoveManQueryOLD_BONUS_STRING: TIBStringField;
        ManPremiaQueryNUM_ITEM: TIntegerField;
        BonusQueryTN: TIntegerField;
        BonusQueryOKLAD_STR: TIBStringField;
        BonusQueryPRIM: TIBStringField;
        DismissManQueryWORK_DATE_BEG: TDateField;
        DismissManQueryWORK_DATE_END: TDateField;
        DismissManQueryID_MAN_DISMISSION: TIntegerField;
        DismissManQueryID_MAN_MOVING: TIntegerField;
        DismissManQueryID_DISMISSION: TIntegerField;
        DismissManQueryID_SHTATRAS: TIntegerField;
        DismissManQueryID_PCARD: TIntegerField;
        DismissManQueryOKL_STR: TIBStringField;
        AcceptManQueryOKL_STR: TIBStringField;
        MoveManQueryOLD_OKL_STR: TIBStringField;
        MoveManQueryNEW_OKL_STR: TIBStringField;
        BonusRemoveQueryNUM_ITEM: TIntegerField;
        AcceptManQuerySPZ_NAME: TIBStringField;
        WorkModeReport: TfrReport;
        WorkModeQuery: TIBQuery;
        WorkModeDataSet: TfrDBDataSet;
        WorkModeQueryID_TEXT_ITEM: TIntegerField;
        WorkModeQueryID_ORDER: TIntegerField;
        WorkModeQueryNUM_ITEM: TIntegerField;
        AcceptManQueryPARENT_DEPARTMENT: TIBStringField;
        MoveManQueryINTRO: TIBStringField;
        HolidayManQueryFIO: TIBStringField;
        HolidayManQueryTN: TIntegerField;
        HolidayManQueryDEPARTMENT_NAME: TIBStringField;
        HolidayManQueryPOST: TIBStringField;
        HolidayManQueryWORKCOND_NAME: TIBStringField;
        HolidayManQueryPERIOD_BEG: TDateField;
        HolidayManQueryPERIOD_END: TDateField;
        HolidayManQueryDATE_BEG: TDateField;
        HolidayManQueryDATE_END: TDateField;
        HolidayManQueryNAME_CATEGORY: TIBStringField;
        HolidayManQueryNAME_TAR_NET: TIBStringField;
        HolidayManQueryMONEY: TIBBCDField;
        HolidayManQueryH_TERM: TIntegerField;
        HolidayManQueryDIGIT: TIntegerField;
        HolidayManQueryOKL_STR: TIBStringField;
        HolidayManQueryMAIN_PERIOD_BEG: TDateField;
        HolidayManQueryMAIN_PERIOD_END: TDateField;
        HolidayManQuerySUMMARY_DATE_BEG: TDateField;
        HolidayManQuerySUMMARY_DATE_END: TDateField;
        HolidayManQuerySUMMARY_TERM: TIntegerField;
        HolidayManQueryHOLIDAY_STR: TIBStringField;
        HolidayManQueryUSE_END: TDateTimeField;
        HolidayManQueryDATE_END1: TDateField;
        HolidayManQueryFIRM_NAME: TIBStringField;
        HolidayManQueryDATE_BEG1: TDateField;
        HolidayManQueryFIRM_EDRPOU: TIBStringField;
        HolidayManQueryFIRM_UKUD: TIBStringField;
        HolidayManQueryPASS_AGE: TIntegerField;
        HolidayManQueryEDUC_AGE: TIntegerField;
        HolidayManQueryCURRENT_DEPARTMENT: TIntegerField;
        HolidayManQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        HolidayManQueryLAST_BEG_LOG_DATE: TDateTimeField;
        HolidayManQueryLAST_END_LOG_DATE: TDateTimeField;
        HolidayManQueryMAN_PENS_AGE: TIntegerField;
        HolidayManQueryWOMAN_PENS_AGE: TIntegerField;
        HolidayManQueryDEFAULT_NIGHT_BEG: TTimeField;
        HolidayManQueryDEFAULT_NIGHT_END: TTimeField;
        HolidayManQuerySHIFT_BEGIN: TDateField;
        HolidayManQueryBONUS1: TIntegerField;
        HolidayManQueryBONUS2: TIntegerField;
        HolidayManQueryBONUS1_ABBR: TIBStringField;
        HolidayManQueryBONUS2_ABBR: TIBStringField;
        HolidayManQueryCITY: TIBStringField;
        HolidayManQueryCONT_STAJ_MONTH: TIntegerField;
        HolidayManQueryLOCAL_DEPARTMENT: TIntegerField;
        HolidayManQueryID_ORDER: TIntegerField;
        HolidayManQueryID_ORDER_TYPE: TIntegerField;
        HolidayManQueryNUM_ORDER: TIBStringField;
        HolidayManQueryDATE_ORDER: TDateField;
        HolidayManQueryNOTE: TIBStringField;
        HolidayManQueryID_STATUS: TIntegerField;
        HolidayManQueryEXEC_DATETIME: TDateTimeField;
        HolidayManQueryPRINT_NAME: TIBStringField;
        HolidayManQueryINTRO: TIBStringField;
        HolidayManQueryISPOLNITEL: TIBStringField;
        AddHolidayReport: TfrReport;
        AddHolidayQuery: TIBQuery;
        AddHolidayDataSet: TfrDBDataSet;
        AddHolidayQueryID_MAN_HOLIDAY: TIntegerField;
        AddHolidayQueryID_PCARD: TIntegerField;
        AddHolidayQueryID_MAN_MOVING: TIntegerField;
        AddHolidayQueryTN: TIntegerField;
        AddHolidayQueryFIO: TIBStringField;
        AddHolidayQueryNUM_ITEM: TIntegerField;
        AddHolidayQueryDATE_BEG: TDateField;
        AddHolidayQueryDATE_END: TDateField;
        AddHolidayQueryH_TERM: TIntegerField;
        AddHolidayQueryNAME_HOLIDAY: TIBStringField;
        AddHolidayQueryID_BO_REASON: TIntegerField;
        AddHolidayQueryBO_REASON: TIBStringField;
        AddHolidayQueryREASON: TIBStringField;
        AddHolidayQueryPOST_NAME: TIBStringField;
        AddHolidayQueryDEPARTMENT_NAME: TIBStringField;
        AddHolidayQueryID_ADD_HOLIDAY_TYPE: TIntegerField;
        AddHolidayQueryADD_HOLIDAY_TYPE_NAME: TIBStringField;
        AddHolidayQueryADD_HOLIDAY_TYPE_NAME_RP: TIBStringField;
        AddHolidayQueryNUM_ORDER: TIBStringField;
        AddHolidayQueryDATE_ORDER: TDateField;
        AddHolidayQueryFIO_FULL: TIBStringField;
        AddHolidayQueryADD_HOLIDAY_TYPE_NAME_P2: TIBStringField;
        VersionBox: TComboBox;
        SecondPageQuery: TIBQuery;
        SecondPageDBDataSet: TfrDBDataSet;
        SecondPageQueryCOLUMN1: TIBStringField;
        SecondPageQueryCOLUMN2: TIBStringField;
        SecondPageQueryID_GROUP: TIntegerField;
        HeaderQueryUSE_END: TDateTimeField;
        HeaderQueryDATE_END: TDateField;
        HeaderQueryFIRM_NAME: TIBStringField;
        HeaderQueryDATE_BEG: TDateField;
        HeaderQueryFIRM_EDRPOU: TIBStringField;
        HeaderQueryFIRM_UKUD: TIBStringField;
        HeaderQueryPASS_AGE: TIntegerField;
        HeaderQueryEDUC_AGE: TIntegerField;
        HeaderQueryCURRENT_DEPARTMENT: TIntegerField;
        HeaderQueryCURRENT_BUHG_DEPARTMENT: TIntegerField;
        HeaderQueryLAST_BEG_LOG_DATE: TDateTimeField;
        HeaderQueryLAST_END_LOG_DATE: TDateTimeField;
        HeaderQueryMAN_PENS_AGE: TIntegerField;
        HeaderQueryWOMAN_PENS_AGE: TIntegerField;
        HeaderQueryDEFAULT_NIGHT_BEG: TTimeField;
        HeaderQueryDEFAULT_NIGHT_END: TTimeField;
        HeaderQuerySHIFT_BEGIN: TDateField;
        HeaderQueryBONUS1: TIntegerField;
        HeaderQueryBONUS2: TIntegerField;
        HeaderQueryBONUS1_ABBR: TIBStringField;
        HeaderQueryBONUS2_ABBR: TIBStringField;
        HeaderQueryCITY: TIBStringField;
        HeaderQueryCONT_STAJ_MONTH: TIntegerField;
        HeaderQueryLOCAL_DEPARTMENT: TIntegerField;
        HeaderQueryID_ORDER: TIntegerField;
        HeaderQueryID_ORDER_TYPE: TIntegerField;
        HeaderQueryNUM_ORDER: TIBStringField;
        HeaderQueryDATE_ORDER: TDateField;
        HeaderQueryNOTE: TIBStringField;
        HeaderQueryID_STATUS: TIntegerField;
        HeaderQueryEXEC_DATETIME: TDateTimeField;
        HeaderQueryPRINT_NAME: TIBStringField;
        HeaderQueryINTRO: TIBStringField;
        HeaderQueryISPOLNITEL: TIBStringField;
        HeaderQueryOWNER_ID_PCARD: TIntegerField;
        HeaderQueryORDERS_HEADER: TIBStringField;
        TextOrderQueryTEXT: TIBStringField;
        ManPremiaQueryTEXT: TMemoField;
        BonusRemoveQueryTEXT: TMemoField;
        BonusQueryTEXT: TMemoField;
        WorkModeQueryTEXT: TMemoField;
        MoveManQueryOLD_PARENT_DEPARTMENT: TIBStringField;
        MoveManQueryNEW_PARENT_DEPARTMENT: TIBStringField;
        DismissManQueryPARENT_DEPARTMENT: TIBStringField;
        HolidayManQueryPARENT_DEPARTMENT: TIBStringField;
        MoveManQueryNOTE: TIBStringField;
        AcceptManQueryNOTE: TIBStringField;
        ManPunishingQueryREASON: TIBStringField;
        MassHolidayQuery: TpFIBDataSet;
        MassHolidayQueryID_MAN_HOLIDAY: TFIBIntegerField;
        MassHolidayQueryID_HOLIDAY: TFIBIntegerField;
        MassHolidayQueryPERIOD_BEG: TFIBDateField;
        MassHolidayQueryPERIOD_END: TFIBDateField;
        MassHolidayQueryDATE_BEG: TFIBDateField;
        MassHolidayQueryDATE_END: TFIBDateField;
        MassHolidayQueryH_TERM: TFIBIntegerField;
        MassHolidayQueryID_MAN_MOVING: TFIBIntegerField;
        MassHolidayQueryNAME_HOLIDAY: TFIBStringField;
        MassHolidayQueryFIO: TFIBStringField;
        MassHolidayQueryTN: TFIBIntegerField;
        MassHolidayQueryWORK_PLACE: TFIBStringField;
        MassHolidayQueryDEPARMTENT_NAME: TFIBStringField;
        MassHolidayQueryPOST_NAME: TFIBStringField;
        MassHolidayQueryCATEGORY_NAME: TFIBStringField;
        MassHolidayQueryNOTE: TFIBStringField;
        MassHolidayQueryMAT_HELP: TFIBBCDField;
        MassHolidayDataset: TfrxDBDataset;
        NewHeaderQuery: TpFIBDataSet;
        NewHeaderQueryUSE_END: TFIBDateTimeField;
        NewHeaderQueryDATE_END: TFIBDateField;
        NewHeaderQueryFIRM_NAME: TFIBStringField;
        NewHeaderQueryDATE_BEG: TFIBDateField;
        NewHeaderQueryFIRM_EDRPOU: TFIBStringField;
        NewHeaderQueryFIRM_UKUD: TFIBStringField;
        NewHeaderQueryPASS_AGE: TFIBIntegerField;
        NewHeaderQueryEDUC_AGE: TFIBIntegerField;
        NewHeaderQueryCURRENT_DEPARTMENT: TFIBIntegerField;
        NewHeaderQueryCURRENT_BUHG_DEPARTMENT: TFIBIntegerField;
        NewHeaderQueryLAST_BEG_LOG_DATE: TFIBDateTimeField;
        NewHeaderQueryLAST_END_LOG_DATE: TFIBDateTimeField;
        NewHeaderQueryMAN_PENS_AGE: TFIBIntegerField;
        NewHeaderQueryWOMAN_PENS_AGE: TFIBIntegerField;
        NewHeaderQueryDEFAULT_NIGHT_BEG: TFIBTimeField;
        NewHeaderQueryDEFAULT_NIGHT_END: TFIBTimeField;
        NewHeaderQuerySHIFT_BEGIN: TFIBDateField;
        NewHeaderQueryBONUS1: TFIBIntegerField;
        NewHeaderQueryBONUS2: TFIBIntegerField;
        NewHeaderQueryBONUS1_ABBR: TFIBStringField;
        NewHeaderQueryBONUS2_ABBR: TFIBStringField;
        NewHeaderQueryCITY: TFIBStringField;
        NewHeaderQueryCONT_STAJ_MONTH: TFIBIntegerField;
        NewHeaderQueryLOCAL_DEPARTMENT: TFIBIntegerField;
        NewHeaderQueryORDERS_HEADER: TFIBStringField;
        NewHeaderQueryDB_VERSION: TFIBIntegerField;
        NewHeaderQueryDEFAULT_PAY_FORM: TFIBIntegerField;
        NewHeaderQueryDEFAULT_WORK_COND: TFIBIntegerField;
        NewHeaderQueryDEFAULT_WORK_MODE: TFIBIntegerField;
        NewHeaderQueryRAISE_TYPE_FOR_OKLAD: TFIBIntegerField;
        NewHeaderQueryBONUS_CALC: TFIBIntegerField;
        NewHeaderQueryNEW_ORDERS: TFIBStringField;
        NewHeaderQueryUSE_MOVING_SMET: TFIBIntegerField;
        NewHeaderQueryVIZA_REQUIRED_IN_ORDERS: TFIBStringField;
        NewHeaderQueryDEFAULT_SMETA: TFIBIntegerField;
        NewHeaderQueryAPPRENTICE_MOVING_TYPE: TFIBIntegerField;
        NewHeaderQueryHIDDEN_ID_POST: TFIBIntegerField;
        NewHeaderQueryID_DOG_FOR_COMAND: TFIBIntegerField;
        NewHeaderQueryTABLE_WORK_DAYS_SMENA: TFIBIntegerField;
        NewHeaderQueryGLOBAL_ROOT: TFIBIntegerField;
        NewHeaderQueryID_ORDER: TFIBIntegerField;
        NewHeaderQueryID_ORDER_TYPE: TFIBIntegerField;
        NewHeaderQueryNUM_ORDER: TFIBStringField;
        NewHeaderQueryDATE_ORDER: TFIBDateField;
        NewHeaderQueryNOTE: TFIBStringField;
        NewHeaderQueryID_STATUS: TFIBIntegerField;
        NewHeaderQueryEXEC_DATETIME: TFIBDateTimeField;
        NewHeaderQueryISPOLNITEL: TFIBStringField;
        NewHeaderQueryPRINT_NAME: TFIBStringField;
        NewHeaderQueryINTRO: TFIBStringField;
        NewHeaderQueryOWNER_ID_PCARD: TFIBIntegerField;
        NewHeaderQueryID_ORDER_GROUP: TFIBIntegerField;
        NewHeaderQueryGROUP_NUM_ITEM: TFIBIntegerField;
        NewHeaderQueryGROUP_SUB_NUM_ITEM: TFIBIntegerField;
        NewHeaderQueryZ_SHOW_IN_ZP: TFIBStringField;
        HeaderDataset: TfrxDBDataset;
        MassHolidayQueryNUM_DIGIT: TFIBIntegerField;
        AcceptManQueryKOL_STAVOK: TIBBCDField;
        DismissManQueryNAME_DISMISSION: TIBStringField;
        DismissManQueryID_DEPARTMENT: TIntegerField;
        DismissManQueryUDERJ_DAY: TIntegerField;
        ManPremiaQueryPERCENT: TIBBCDField;
        ManPremiaQueryP_YEAR: TIntegerField;
        ManPremiaQueryP_MONTH: TIntegerField;
        ManPremiaQueryID_TEXT_ITEM: TIntegerField;
        ManPremiaQueryID_ORDER: TIntegerField;
        ManPremiaQueryNUM_ITEM1: TIntegerField;
        AddHoursQuery: TpFIBDataSet;
        frAddHoursDS: TfrxDBDataset;
        MassHolidayReport: TfrxReport;
        frSignQuery: TfrxDBDataset;
        frSecondPageQuery: TfrxDBDataset;
        FIBDataSetHolHospMoving: TpFIBDataSet;
        FIBDataSetHolHospMovingWHAT_DO_HOSP: TFIBIntegerField;
        FIBDataSetHolHospMovingWHAT_DO_HOL: TFIBIntegerField;
        DBDataSetHolHosp: TfrDBDataSet;
        DataSetGetRazryad: TpFIBDataSet;
        DataSetRazryadi: TfrDBDataSet;
        frxTextItemsDataset: TfrxDBDataset;
        HolidayManQueryID_POST: TIntegerField;
        HolidayManQueryMAT_POM_STR: TIBStringField;
        HolidayManQueryORDERS_HEADER: TIBStringField;
        HolidayManQueryDB_VERSION: TIntegerField;
        HolidayManQueryDEFAULT_PAY_FORM: TIntegerField;
        HolidayManQueryDEFAULT_WORK_COND: TIntegerField;
        HolidayManQueryDEFAULT_WORK_MODE: TIntegerField;
        HolidayManQueryRAISE_TYPE_FOR_OKLAD: TIntegerField;
        HolidayManQueryBONUS_CALC: TIntegerField;
        HolidayManQueryNEW_ORDERS: TIBStringField;
        HolidayManQueryUSE_MOVING_SMET: TIntegerField;
        HolidayManQueryVIZA_REQUIRED_IN_ORDERS: TIBStringField;
        HolidayManQueryID_VIDOPL: TIntegerField;
        HolidayManQueryDEFAULT_SMETA: TIntegerField;
        HolidayManQueryAPPRENTICE_MOVING_TYPE: TIntegerField;
        HolidayManQueryHIDDEN_ID_POST: TIntegerField;
        HolidayManQueryID_DOG_FOR_COMAND: TIntegerField;
        HolidayManQueryTABLE_WORK_DAYS_SMENA: TIntegerField;
        HolidayManQueryGLOBAL_ROOT: TIntegerField;
        HolidayManQueryALLOW_EMPTY_SMETS_IN_ORDERS: TIBStringField;
        HolidayManQuerySHOW_OLD_EDUC: TIBStringField;
        HolidayManQueryHEADER_POST: TIBStringField;
        HolidayManQueryHEADER_FIO: TIBStringField;
        HolidayManQueryUSE_KADRY_ADRESS: TIBStringField;
        HolidayManQueryUSE_KADRY_LANGUAGE: TIBStringField;
        HolidayManQueryDEFAULT_ID_MOVING_TYPE_ACCEPT: TIntegerField;
        HolidayManQueryDEFAULT_ID_MOVING_TYPE_MOVE: TIntegerField;
        HolidayManQueryDEFAULT_ID_SOVMEST_ACCEPT: TIntegerField;
        HolidayManQueryDEFAULT_ID_SOVMEST_MOVE: TIntegerField;
        HolidayManQueryDEFAULT_ID_WORK_REASON: TIntegerField;
        HolidayManQueryHEADER_UP_POST: TIBStringField;
        HolidayManQueryHEADER_UP_FIO: TIBStringField;
        HolidayManQueryCURRENT_YEAR_LTD: TIntegerField;
        HolidayManQueryLTD_DUMP_CURRENT_MOVINGS: TIntegerField;
        HolidayManQueryDUMP_CURRENT_MOVINGS: TIntegerField;
        HolidayManQueryBONUS_SUM_KOL_STAVOK: TIntegerField;
        HolidayManQuerySTAVKI_DISP_FORMAT: TIBStringField;
        HolidayManQueryDEFAULT_ID_MOVING_TYPE_PROLONG: TIntegerField;
        HolidayManQueryCHECK_SR_VACANT_ST: TIBStringField;
        HolidayManQueryOLD_DATE: TDateField;
        HolidayManQueryVIHODNOI_ID_VIHOD: TIntegerField;
        HolidayManQueryCOMMAND_ID_VIHOD: TIntegerField;
        HolidayManQueryRODY_ID_VIHOD: TIntegerField;
        HolidayManQueryDEKRET_ID_VIHOD: TIntegerField;
        HolidayManQueryBOLN_ID_VIHOD: TIntegerField;
        HolidayManQueryFACT_SHTAT_BONUS_FROM_ORDERS: TIntegerField;
        HolidayManQueryCOMAND_WORK_HOURS: TIntegerField;
        HolidayManQueryPRINT_ORDER_NUMBER: TIntegerField;
        HolidayManQueryID_PPS_SHTAT_DEP: TIntegerField;
        HolidayManQueryTEMPFREE_HOLIDAY_PROPERTY: TIntegerField;
        HolidayManQueryCOPY_ORDER_BONUS: TIBStringField;
        HolidayManQueryCHECK_INTEGRITY: TIBStringField;
        HolidayManQueryCONTRACT_POST_PROP: TIntegerField;
        HolidayManQueryTABLE_SPLIT_DAYS: TIntegerField;
        HolidayManQueryNOT_USE_KER_DAYS_CHECK_IN_DIS: TIntegerField;
        HolidayManQueryOWNER_ID_PCARD: TIntegerField;
        HolidayManQueryID_ORDER_GROUP: TIntegerField;
        HolidayManQueryGROUP_NUM_ITEM: TIntegerField;
        HolidayManQueryGROUP_SUB_NUM_ITEM: TIntegerField;
        HolidayManQueryZ_SHOW_IN_ZP: TIBStringField;
        HalfTimeDataset: TpFIBDataSet;
        frxHalfTimeDS: TfrxDBDataset;
    ExitDekrDataset: TpFIBDataSet;
    frxExitDekr: TfrxDBDataset;
    HolidayManQueryREASON: TIBStringField;
    AcceptManQueryID_POST: TIntegerField;
    AcceptManQueryREASON: TIBStringField;
    BonusQueryID_TEXT_ITEM: TIntegerField;
    BonusQueryID_ORDER: TIntegerField;
    BonusQueryPERCENT: TIBBCDField;
    BonusQueryNUM_ITEM1: TIntegerField;
    BonusQueryPATH: TIBStringField;
    BonusQueryID_POST: TIntegerField;
    BonusQueryIS_SHADOW: TIntegerField;
    BonusChangeQueryNEW_NUM_ITEM: TIntegerField;
    BonusChangeQueryORDER_ITEM_TEXT: TBlobField;
    Report: TfrxReport;
    BonusRemoveQueryPERCENT: TIBBCDField;
        procedure FormCreate(Sender: TObject);
        function PrepareForm: Boolean;
        procedure OkButtonClick(Sender: TObject);

    private
        PrintOrderDate: Boolean;
    public
    { Public declarations }
        ID_ORDER: Integer;
        ID_ORDER_TYPE: Integer;
        ID_SERVER: Integer;
    end;

var
    PrintOrderForm: TPrintOrderForm;

implementation

{$R *.DFM}

uses uExportReport, UPrintComand, MainUnit;

procedure TPrintOrderForm.FormCreate(Sender: TObject);
begin
    Width := 434;
    Height := 74;

    AcceptManQuery.Transaction := PersonalCommon.ReadTransaction;
    MoveManQuery.Transaction := PersonalCommon.ReadTransaction;
    DismissManQuery.Transaction := PersonalCommon.ReadTransaction;
    HolidayManQuery.Transaction := PersonalCommon.ReadTransaction;
    BonusQuery.Transaction := PersonalCommon.ReadTransaction;
    BonusRemoveQuery.Transaction := PersonalCommon.ReadTransaction;
    BonusChangeQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPunishingQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPunishingRemoveQuery.Transaction := PersonalCommon.ReadTransaction;
    ManAwardQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPrivQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPrivRemoveQuery.Transaction := PersonalCommon.ReadTransaction;
    ManToDoQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPremiaQuery.Transaction := PersonalCommon.ReadTransaction;
    TempQuery.Transaction := PersonalCommon.ReadTransaction;
    TextOrderQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkModeQuery.Transaction := PersonalCommon.ReadTransaction;
    AddHolidayQuery.Transaction := PersonalCommon.ReadTransaction;

    HeaderQuery.Transaction := PersonalCommon.ReadTransaction;
    SignQuery.Transaction := PersonalCommon.ReadTransaction;
    VizaQuery.Transaction := PersonalCommon.ReadTransaction;
    KnowQuery.Transaction := PersonalCommon.ReadTransaction;
    AgreeQuery.Transaction := PersonalCommon.ReadTransaction;

    SecondPageQuery.Transaction := PersonalCommon.ReadTransaction;

    MassHolidayQuery.Transaction := PersonalCommon.FIBReadTransaction;
    NewHeaderQuery.Transaction := PersonalCommon.FIBReadTransaction;
end;

function TPrintOrderForm.PrepareForm: Boolean;
var
    formaHandel: TPrintOrderForm;
begin
    if Version = 2 then PrintOrderDate := True
    else PrintOrderDate := False;

    HeaderQuery.Close;
    HeaderQuery.params.ParamValues['ID_ORDER'] := ID_ORDER;
    HeaderQuery.Open;

    NewHeaderQuery.Close;
    NewHeaderQuery.Params.ParamByName('ID_ORDER').AsInteger := ID_ORDER;
    NewHeaderQuery.Open;

    SignQuery.Close;
    SignQuery.params.ParamValues['ID_ORDER'] := ID_ORDER;
    SignQuery.Open;

    VizaQuery.Close;
    VizaQuery.params.ParamValues['ID_ORDER'] := ID_ORDER;
    VizaQuery.Open;

    KnowQuery.Close;
    KnowQuery.params.ParamValues['ID_ORDER'] := ID_ORDER;
    KnowQuery.Open;

    AgreeQuery.Close;
    AgreeQuery.params.ParamValues['ID_ORDER'] := ID_ORDER;
    AgreeQuery.Open;

    TextOrderQuery.Close;
    TextOrderQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    TextOrderQuery.Open;

    SecondPageQuery.Close;
    SecondPageQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    SecondPageQuery.Open;

    Result := True;

    case ID_ORDER_TYPE of

        2:
            begin
                AcceptManQuery.Close;
                AcceptManQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                AcceptManQuery.Open;

                if AcceptManQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;

        3:
            begin
                MoveManQuery.Close;
                MoveManQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                MoveManQuery.Params.ParamValues['NUM_ITEM'] := 1;
                MoveManQuery.Open;
                if MoveManQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;

            end;
        4:
            begin
                DismissManQuery.Close;
                DismissManQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                DismissManQuery.Params.ParamValues['NUM_ITEM'] := 1;
                DismissManQuery.Open;
                if DismissManQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        5:
            begin
                ManPunishingQuery.Close;
                ManPunishingQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManPunishingQuery.Open;
                if ManPunishingQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        6:
            begin
                ManPunishingRemoveQuery.Close;
                ManPunishingRemoveQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManPunishingRemoveQuery.Params.ParamValues['NUM_ITEM'] := 1;
                ManPunishingRemoveQuery.Open;
                if ManPunishingRemoveQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        7:
            begin
                ManAwardQuery.Close;
                ManAwardQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManAwardQuery.Open;
                if ManAwardQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        8:
            begin
                VersionBox.Visible := True;

                Height := 112;

                BonusQuery.Close;
                BonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                BonusQuery.Open;
                if BonusQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;

        9:
            begin
                BonusChangeQuery.Close;
                BonusChangeQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                BonusChangeQuery.Open;
                if BonusChangeQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;

        10:
            begin
                BonusRemoveQuery.Close;
                BonusRemoveQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                BonusRemoveQuery.Open;
                if BonusRemoveQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        13:
            begin
                ManPrivQuery.Close;
                ManPrivQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManPrivQuery.Open;
                if ManPrivQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        14:
            begin
                ManPrivRemoveQuery.Close;
                ManPrivRemoveQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManPrivRemoveQuery.Params.ParamValues['NUM_ITEM'] := 1;
                ManPrivRemoveQuery.Open;
                if ManPrivRemoveQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        15:
            begin
                ManToDoQuery.Close;
                ManToDoQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManToDoQuery.Open;

                if ManToDoQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        16, 18:
            begin
                HolidayManQuery.Close;
                HolidayManQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                HolidayManQuery.Open;

                if HolidayManQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        17, 21:
            begin
                VersionBox.Visible := True;
                VersionBox.ItemIndex := 1;
                Height := 112;

                ManPremiaQuery.Close;
                ManPremiaQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                ManPremiaQuery.Open;

                if ManPremiaQuery.IsEmpty and TextOrderQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        19:
            begin
                UPrintComand.ShowPrintComand(Main.FIBDatabase.Handle, ID_ORDER);
            end;

        23, 25, 27, 29:
            begin
                WorkModeQuery.Close;
                WorkModeQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                WorkModeQuery.Open;

                if WorkModeQuery.IsEmpty and TextOrderQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        24:
            begin
                VersionBox.ItemIndex := 0;

                VersionBox.Visible := True;

                Height := 112;

                AddHoursQuery.Close;
                AddHoursQuery.Database := FIBDatabase;
                AddHoursQuery.Transaction := FIBReadTransaction;
                AddHoursQuery.Params.ParamByName('Id_Order').AsInteger := Id_Order;
                AddHoursQuery.Open;

                WorkModeQuery.Close;
                WorkModeQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                WorkModeQuery.Open;

                if WorkModeQuery.IsEmpty and TextOrderQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;
            end;
        20:
            begin
            end;
        26:
            begin

                WorkModeQuery.Close;
                WorkModeQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                WorkModeQuery.Open;

                if WorkModeQuery.IsEmpty and TextOrderQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;

                AddHolidayQuery.Close;
                AddHolidayQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
                AddHolidayQuery.Open;

                if AddHolidayQuery.IsEmpty and TextOrderQuery.IsEmpty then
                begin
                    MessageDlg('Неможливо отримати інформацію по цьому наказу. Хтось його вилучив або помилка у базі даних.', mtError, [mbOk], 0);
                    Result := False;
                end;

                VersionBox.Visible := True;

                Height := 112;

                if Version = 1 then
                    VersionBox.ItemIndex := 0
                else
                    VersionBox.ItemIndex := 1;
            end;
        32:
            begin
                MassHolidayQuery.Close;
                MassHolidayQuery.ParamByName('ID_ORDER').AsInteger := Id_Order;
                MassHolidayQuery.Open;
            end;
        33:
            begin
                HalfTimeDataset.Close;
                HalfTimeDataset.ParamByName('Id_Order').AsInteger := Id_Order;
                HalfTimeDataset.Open;
            end;
        34:
            begin
                ExitDekrDataset.Close;
                ExitDekrDataset.ParamByName('Id_Order').AsInteger := Id_Order;
                ExitDekrDataset.Open;
            end;
    else
        begin

            MessageDlg('Для такого типу наказів друк неможливий.', mtError, [mbOk],
                0);
            Result := False;
            exit;

        end;
    end;
    //******* Hunter correct gluk "close form after print" begin ***************
    if ID_ORDER_TYPE = 19 then
    begin
        Result := False;
        exit;
    end;
    //******* Hunter correct gluk end ***************
end;

procedure TPrintOrderForm.OkButtonClick(Sender: TObject);
begin
    frVariables['Report_Kind'] := VersionBox.ItemIndex + 1;
    frVariables['VERSION'] := PersonalCommon.Version;
    frVariables['ORDERS_HEADER'] := HeaderQueryORDERS_HEADER.Value;
    frVariables['Print_Order_Number'] := Consts_Query['Print_Order_Number'];
    frVariables['Print_Order_Date'] := PrintOrderDate;

    //Hunter add select for selection razryadi
    DataSetGetRazryad.Close;
    DataSetGetRazryad.Sqls.SelectSQL.Text := 'select * from ASUP_GET_RAZRYAD(' + IntToStr(Id_Order) + ')';
    DataSetGetRazryad.Open;
    //Hunter cod ending

    //showMessage('ID_ORDER_TYPE=' + IntToStr(ID_ORDER_TYPE));

    case ID_ORDER_TYPE of
        2:
            begin
                AcceptManReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Accept_Man_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        AcceptManReport.DesignReport
                    else
                        AcceptManReport.ShowReport
                else
                    ExportReportTo(AcceptManReport);
            end;
        3:
            begin
                //***** Hunter code insert start *******************************
                FIBDataSetHolHospMoving.Close;
                FIBDataSetHolHospMoving.SQLs.SelectSQL.Text := 'select * from ASUP_WHAT_MOVING_WE_HAVE(' + IntToStr(Id_Order) + ')';
                FIBDataSetHolHospMoving.Open;
                //***** Hunter code insert end *********************************

                if Version = 2 then
                    MoveManReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Move_Man_Order_Dnepr.frf')
                else MoveManReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Move_Man_Order_Chermet.frf');

                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignreport then
                        MoveManReport.DesignReport
                    else
                        MoveManReport.ShowReport
                else
                    ExportReportTo(MoveManReport);
            end;
        4:
            begin
                DismissManReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Dismiss_Man_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        DismissManReport.DesignReport
                    else
                        DismissManReport.ShowReport
                else
                    ExportReportTo(DismissManReport);
            end;
        5:
            begin
                ManPunishingReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Punishing_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        ManPunishingReport.DesignReport
                    else
                        ManPunishingReport.ShowReport
                else
                    ExportReportTo(ManPunishingReport);
            end;
        6:
            begin
                ManPunishingRemoveReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Punishing_Remove_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    ManPunishingRemoveReport.ShowReport
                else
                    ExportReportTo(ManPunishingRemoveReport);
            end;
        7:
            begin
                ManAwardReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Award_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        ManAwardReport.DesignReport
                    else
                        ManAwardReport.ShowReport
                else
                    ExportReportTo(ManAwardReport);
            end;
        8:
            begin
                if Version = 2 then
                    BonusReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Man_Bonus_Order_Dnepr.frf')
                else
                    BonusReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Man_Bonus_Order_Chermet.frf');

                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        BonusReport.DesignReport
                    else
                        BonusReport.ShowReport
                else
                    ExportReportTo(BonusReport);
            end;
        9:
            begin
                BonusChangeReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Bonus_Change_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        BonusChangeReport.DesignReport
                    else
                        BonusChangeReport.ShowReport
                else
                    ExportReportTo(BonusChangeReport);
            end;
        10:
            begin
                BonusRemoveReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Bonus_Remove_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        BonusRemoveReport.DesignReport
                    else
                        BonusRemoveReport.ShowReport
                else
                    ExportReportTo(BonusRemoveReport);
            end;
        13:
            begin
                ManPrivReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Priv_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then ManPrivReport.DesignReport
                    else ManPrivReport.ShowReport
                else
                    ExportReportTo(ManPrivReport);
            end;
        14:
            begin
                ManPrivRemoveReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_Priv_Remove_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then ManPrivRemoveReport.DesignReport
                    else ManPrivRemoveReport.ShowReport
                else
                    ExportReportTo(ManPrivRemoveReport);
            end;
        15:
            begin
                ManToDoReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Man_To_Do_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then ManToDoReport.DesignReport
                    else ManToDoReport.ShowReport
                else
                    ExportReportTo(ManToDoReport);
            end;
        16:
            begin
                HolidayManReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Holiday_Man_Order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        HolidayManreport.DesignReport
                    else
                        HolidayManReport.ShowReport;
                end
                else
                    ExportReportTo(HolidayManReport);
            end;
        17, 21:
            begin
                if VersionBox.ItemIndex = 1 then
                    ManPremiaReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Man_Premia_Order_2.frf')
                else
                    ManPremiaReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Man_Premia_Order.frf');

                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        ManPremiareport.DesignReport
                    else
                        ManPremiaReport.ShowReport;
                end
                else
                    ExportReportTo(ManPremiaReport);
            end;
        23, 25, 19, 29:
            begin
                WorkModeReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\MAn_Work_Mode_Change_order.frf');
                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        WorkModereport.DesignReport
                    else
                        WorkModeReport.ShowReport;
                end
                else
                    ExportReportTo(WorkModeReport);
            end;
        24:
            if VersionBox.ItemIndex = 1 then
            begin
                WorkModeReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\MAn_Work_Mode_Change_order.frf');

                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        WorkModereport.DesignReport
                    else
                        WorkModeReport.ShowReport;
                end
                else
                    ExportReportTo(WorkModeReport);
            end
            else
            begin

                Report.LoadFromFile(ProgramPath + 'Reports\ASUP\Asup_SverhUr_Order.fr3');

                Report.Variables['ORDERS_HEADER'] :=
                    QuotedStr(HeaderQueryORDERS_HEADER.Value);
                Report.Variables['ID_SERVER'] := ID_SERVER;

                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        Report.DesignReport
                    else
                        Report.ShowReport;
                end
                else
                    ExportReportTo(Report);
            end;
        27:
            begin
                WorkModeReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\MAn_Work_Mode_Change_order2.frf');
                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        WorkModereport.DesignReport
                    else
                        WorkModeReport.ShowReport;
                end
                else
                    ExportReportTo(WorkModeReport);
            end;
        18:
            begin
                HolidayManReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\Holiday_Man_Order_2.frf');
                if (Sender as TButton).Name = 'OkButton' then
                    if sDesignReport then
                        HolidayManReport.DesignReport
                    else
                        HolidayManReport.ShowReport
                else
                    ExportReportTo(HolidayManReport);
            end;

        20:
            begin
                TextOrderReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\TextOrder.frf');
                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        TextOrderreport.DesignReport
                    else
                        TextOrderReport.ShowReport;
                end
                else
                    ExportReportTo(TextOrderReport);
            end;

        26:
            begin
                if VersionBox.ItemIndex = 1 then
                begin
                    WorkModeReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\MAn_Work_Mode_Change_order.frf');
                    if (Sender as TButton).Name = 'OkButton' then
                    begin
                        if sDesignReport then
                            WorkModereport.DesignReport
                        else
                            WorkModeReport.ShowReport;
                    end
                    else
                        ExportReportTo(WorkModeReport);
                end;

                if VersionBox.ItemIndex = 0 then
                begin
                    AddHolidayReport.LoadFromFile(ProgramPath +
                        'Reports\ASUP\Man_Add_Holiday_order.frf');
                    if (Sender as TButton).Name = 'OkButton' then
                    begin
                        if sDesignReport then
                            AddHolidayReport.DesignReport
                        else
                            AddHolidayReport.ShowReport;
                    end
                    else
                        ExportReportTo(AddHolidayReport);
                end;
            end;
        32:
            begin
                MassHolidayReport.LoadFromFile(ProgramPath +
                    'Reports\ASUP\MassHolidayReport.fr3', True);

                MassHolidayReport.Variables['ORDERS_HEADER'] :=
                    QuotedStr(HeaderQueryORDERS_HEADER.Value);
                MassHolidayReport.Variables['VERSION'] := IntToStr(PersonalCommon.Version);

                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        MassHolidayReport.DesignReport
                    else
                        MassHolidayReport.ShowReport;
                end
                else
                    ExportReportTo(MassHolidayReport);
            end;

        33:
            begin
                Report.LoadFromFile(ProgramPath + 'Reports\ASUP\Asup_HalfTime_Order.fr3');

                Report.Variables['ORDERS_HEADER'] :=
                    QuotedStr(HeaderQueryORDERS_HEADER.Value);
                Report.Variables['ID_SERVER'] := ID_SERVER;

                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        Report.DesignReport
                    else
                        Report.ShowReport;
                end
                else
                    ExportReportTo(Report);
            end;
        34:
            begin
                Report.LoadFromFile(ProgramPath + 'Reports\ASUP\Asup_ExitDekr_Order.fr3');

                Report.Variables['ORDERS_HEADER'] :=
                    QuotedStr(HeaderQueryORDERS_HEADER.Value);
                Report.Variables['ID_SERVER'] := ID_SERVER;

                if (Sender as TButton).Name = 'OkButton' then
                begin
                    if sDesignReport then
                        Report.DesignReport
                    else
                        Report.ShowReport;
                end
                else
                    ExportReportTo(Report);
            end;
    end;

end;

end.

