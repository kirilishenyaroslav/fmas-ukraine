object UPAcceptDM: TUPAcceptDM
  OldCreateOrder = False
  Left = 310
  Top = 142
  Height = 571
  Width = 586
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    UseLoginPrompt = True
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 184
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 288
    Top = 8
  end
  object Smets: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from UP_DT_MAN_SMET_BUFF_SEL(:key_session);')
    Left = 40
    Top = 88
    poSQLINT64ToBCD = True
    object SmetsID_SMET: TFIBBCDField
      FieldName = 'ID_SMET'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object SmetsID_SMET_PPS: TFIBBCDField
      FieldName = 'ID_SMET_PPS'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object SmetsSMETA_NAME: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      FieldName = 'SMETA_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object SmetsOKLAD_BASE2: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLAD_BASE'
    end
    object SmetsKOEFF_PPS: TFIBFloatField
      DisplayLabel = #1050#1086#1077#1092'. '#1087#1110#1076#1074'.'
      FieldName = 'KOEFF_PPS'
    end
    object SmetsRATE_COUNT: TFIBBCDField
      DisplayLabel = #1050'-'#1089#1090#1100' '#1089#1090#1072#1074#1086#1082
      FieldName = 'RATE_COUNT'
      DisplayFormat = ',0.00000;-,0.00000'
      Size = 10
      RoundByScale = True
    end
    object SmetsSMETA_PPS_NAME: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090' '#1087#1110#1076#1074'.'
      FieldName = 'SMETA_PPS_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object SmetsOKLAD_PPS: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076' '#1087#1110#1076#1074'.'
      FieldName = 'OKLAD_PPS'
    end
    object SmetsDATES_STR: TFIBStringField
      DisplayLabel = #1055#1077#1088#1110#1086#1076
      FieldName = 'DATES_STR'
      Size = 30
      EmptyStrToNull = True
    end
    object SmetsDATE_BEG: TFIBDateField
      DisplayLabel = #1047
      FieldName = 'DATE_BEG'
      Visible = False
    end
    object SmetsDATE_END: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATE_END'
      Visible = False
    end
    object SmetsID_ORDER_ITEM: TFIBBCDField
      FieldName = 'ID_ORDER_ITEM'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object SmetsID_REC: TFIBBCDField
      FieldName = 'ID_REC'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object SmetsHOURS_COUNT: TFIBFloatField
      FieldName = 'HOURS_COUNT'
    end
  end
  object KeySessionGenerate: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'select gen_id(gen_up_id_session,1) as Ret_Value from rdb$Databas' +
        'e')
    Left = 184
    Top = 88
    poSQLINT64ToBCD = True
  end
  object GetFreeFunds: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = FreeFundsTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_ACCEPT_GET_FREE_FUNDS_2(:Id_Post_Salary, :Id_De' +
        'partment,'
      ':Id_Type_Post, :Act_Date, :Id_Level, :Id_PCard_Away)')
    Left = 32
    Top = 464
    poSQLINT64ToBCD = True
    object GetFreeFundsSMETA_FULL_TITLE: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      FieldName = 'SMETA_FULL_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object GetFreeFundsKOL_VACANT_STAVOK: TFIBFloatField
      DisplayLabel = #1042#1072#1082#1072#1085#1090#1085#1086
      FieldName = 'KOL_VACANT_STAVOK'
      DisplayFormat = ',0.00000;-,0.00000'
    end
    object GetFreeFundsKOL_STAVOK: TFIBBCDField
      DisplayLabel = #1057#1090#1072#1074#1086#1082
      FieldName = 'KOL_STAVOK'
      DisplayFormat = ',0.00000;-,0.00000'
      Size = 10
      RoundByScale = True
    end
    object GetFreeFundsNum_Digit: TIntegerField
      DisplayLabel = #1056'-'#1076
      FieldName = 'Num_Digit'
    end
    object GetFreeFundsOklad_Str: TStringField
      DisplayLabel = #1054#1082#1083#1072#1076
      DisplayWidth = 50
      FieldName = 'Oklad_Str'
      Size = 100
    end
    object GetFreeFundsOKLAD: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      DisplayWidth = 20
      FieldName = 'OKLAD'
      Visible = False
    end
    object GetFreeFundsKOEFF_PPS: TFIBFloatField
      DisplayLabel = #1050#1086#1077#1092'. '#1087#1110#1076#1074'.'
      DisplayWidth = 20
      FieldName = 'KOEFF_PPS'
    end
    object GetFreeFundsSMETA_PPS_FULL_TITLE: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
      FieldName = 'SMETA_PPS_FULL_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object GetFreeFundsSR_NAME: TFIBStringField
      DisplayLabel = #1064#1090#1072#1090#1085#1080#1081' '#1088#1086#1079#1082#1083#1072#1076
      DisplayWidth = 25
      FieldName = 'SR_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object GetFreeFundsID_SR: TFIBIntegerField
      FieldName = 'ID_SR'
      Visible = False
    end
    object GetFreeFundsSMETA_TITLE: TFIBStringField
      DisplayLabel = #1050#1086#1096#1090#1086#1088#1080#1089
      DisplayWidth = 100
      FieldName = 'SMETA_TITLE'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object GetFreeFundsSMETA_KOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1096#1090'.'
      FieldName = 'SMETA_KOD'
      Visible = False
    end
    object GetFreeFundsOKLAD_PPS: TFIBFloatField
      FieldName = 'OKLAD_PPS'
      Visible = False
    end
    object GetFreeFundsSMETA_PPS_TITLE: TFIBStringField
      DisplayLabel = #1050#1086#1096#1090'. '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
      DisplayWidth = 100
      FieldName = 'SMETA_PPS_TITLE'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object GetFreeFundsSMETA_PPS_KOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1110#1076#1074'.'
      FieldName = 'SMETA_PPS_KOD'
      Visible = False
    end
    object GetFreeFundsID_SMETA: TFIBIntegerField
      FieldName = 'ID_SMETA'
      Visible = False
    end
    object GetFreeFundsID_SMETA_PPS: TFIBIntegerField
      FieldName = 'ID_SMETA_PPS'
      Visible = False
    end
    object GetFreeFundsID_WORK_COND: TFIBIntegerField
      FieldName = 'ID_WORK_COND'
      Visible = False
    end
    object GetFreeFundsNAME_WORK_COND: TFIBStringField
      FieldName = 'NAME_WORK_COND'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object GetFreeFundsID_WORK_MODE: TFIBIntegerField
      FieldName = 'ID_WORK_MODE'
      Visible = False
    end
    object GetFreeFundsNAME_WORK_MODE: TFIBStringField
      FieldName = 'NAME_WORK_MODE'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
  end
  object GetMinLevel: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_KER_GET_MIN_LEVEL')
    Left = 184
    Top = 152
    poSQLINT64ToBCD = True
  end
  object FreeFundsSource: TDataSource
    DataSet = GetFreeFunds
    Left = 40
    Top = 208
  end
  object PostSalarySelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_ACCEPT_GET_POST_FROM_SHTAT(:Id_Department, :Act' +
        '_Date)')
    Left = 40
    Top = 296
    poSQLINT64ToBCD = True
    object PostSalarySelectDISPLAY_NAME: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      DisplayWidth = 100
      FieldName = 'DISPLAY_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectNUM_DIGIT: TFIBIntegerField
      Alignment = taCenter
      DisplayLabel = #1056'-'#1076
      DisplayWidth = 15
      FieldName = 'NUM_DIGIT'
    end
    object PostSalarySelectNAME_TYPE_POST: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
      DisplayWidth = 70
      FieldName = 'NAME_TYPE_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object PostSalarySelectSalary_Max_Str: TStringField
      DisplayLabel = #1057#1091#1084#1072
      DisplayWidth = 30
      FieldName = 'Salary_Max_Str'
      Size = 100
    end
    object PostSalarySelectSALARY_MAX: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072
      DisplayWidth = 20
      FieldName = 'SALARY_MAX'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object PostSalarySelectID_POST_SALARY: TFIBBCDField
      FieldName = 'ID_POST_SALARY'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object PostSalarySelectPOST_NAME: TFIBStringField
      FieldName = 'POST_NAME'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectSALARY_MIN: TFIBFloatField
      FieldName = 'SALARY_MIN'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object PostSalarySelectADD_NAME: TFIBStringField
      FieldName = 'ADD_NAME'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectSMETA_FULL_TITLE: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      DisplayWidth = 50
      FieldName = 'SMETA_FULL_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectId_Work_Mode: TIntegerField
      FieldName = 'Id_Work_Mode'
      Visible = False
    end
    object PostSalarySelectCount_Day: TIntegerField
      FieldName = 'Count_Day'
      Visible = False
    end
    object PostSalarySelectid_pay_form: TIntegerField
      FieldName = 'id_pay_form'
      Visible = False
    end
    object PostSalarySelectid_work_cond: TIntegerField
      FieldName = 'id_work_cond'
      Visible = False
    end
  end
  object SelectTypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_ACCEPT_GET_TYPE_POST(:Id_Post_Salary,'
      ':Id_Department, :Act_Date)')
    Left = 184
    Top = 224
    poSQLINT64ToBCD = True
    object SelectTypePostID_TYPE_POST: TFIBIntegerField
      FieldName = 'ID_TYPE_POST'
      Visible = False
    end
    object SelectTypePostNAME_TYPE_POST: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
      FieldName = 'NAME_TYPE_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectTypePostIS_PED_WORK: TFIBSmallIntField
      FieldName = 'IS_PED_WORK'
    end
  end
  object CopyIntoBuffer: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_ACC_COPY_INTO_BUFFER_ALL(:Id_Order_Item)')
    Left = 288
    Top = 224
    poSQLINT64ToBCD = True
  end
  object KernelErrors: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS(:Key_Session, :Id_Or' +
        'der_Item)')
    Left = 288
    Top = 152
    poSQLINT64ToBCD = True
    object KernelErrorsID_ERROR: TFIBBCDField
      FieldName = 'ID_ERROR'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object KernelErrorsERROR_CODE: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1086#1084#1080#1083#1082#1080
      DisplayWidth = 20
      FieldName = 'ERROR_CODE'
    end
    object KernelErrorsERROR_TEXT: TFIBStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1087#1086#1084#1080#1083#1082#1080
      FieldName = 'ERROR_TEXT'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object GetItems: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_DT_ORDER_ITEMS_BUFF'
      'WHERE Key_Session = :Key_Session'
      'ORDER BY Id_Item')
    Left = 288
    Top = 80
    poSQLINT64ToBCD = True
  end
  object GetSalary: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_GET_SALARY_PERIOD2(:Id_Post_Salary, :Id_Type_Po' +
        'st,'
      
        ':Period_Beg, :Period_End, :Rate_Count, :Hours_Count, :Month_Hour' +
        's_Count, :Koeff_Pps)')
    Left = 184
    Top = 296
    poSQLINT64ToBCD = True
  end
  object ManSmetReform: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'EXECUTE PROCEDURE UP_ACCEPT_MAN_SMET_REFORM(:Key_Session,'
      
        ':Id_Post_Salary, :Period_Beg, :Period_End, :Id_PCard, :Id_Type_P' +
        'ost, :Month_Hours_Count)')
    Transaction = WriteTransaction
    Left = 288
    Top = 296
  end
  object CheckValidOklad: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_CHECK_VALID_OKLAD_ALL(:Key_Session)')
    Left = 392
    Top = 8
    poSQLINT64ToBCD = True
  end
  object AcceptBonusSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_ACCEPT_BONUS_SELECT(:Key_Session)')
    Left = 392
    Top = 72
    poSQLINT64ToBCD = True
    object AcceptBonusSelectDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
      Visible = False
    end
    object AcceptBonusSelectDATE_END: TFIBDateField
      FieldName = 'DATE_END'
      Visible = False
    end
    object AcceptBonusSelectPERCENT: TFIBFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PERCENT'
    end
    object AcceptBonusSelectSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object AcceptBonusSelectRAISE_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1076#1073#1072#1074#1082#1072
      FieldName = 'RAISE_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptBonusSelectBONUS_SUMMA: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072' '#1085#1072#1076#1073#1072#1074#1082#1080
      FieldName = 'BONUS_SUMMA'
    end
    object AcceptBonusSelectBONUS_SUMMA_PPS: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
      FieldName = 'BONUS_SUMMA_PPS'
    end
    object AcceptBonusSelectSMETA_TITLE: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      FieldName = 'SMETA_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptBonusSelectSMETA_PPS_TITLE: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
      FieldName = 'SMETA_PPS_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptBonusSelectDATES_STR: TFIBStringField
      DisplayLabel = #1055#1077#1088#1110#1086#1076
      FieldName = 'DATES_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptBonusSelectID_RAISE: TFIBIntegerField
      FieldName = 'ID_RAISE'
    end
    object AcceptBonusSelectID_REC: TFIBBCDField
      FieldName = 'ID_REC'
      Size = 0
      RoundByScale = True
    end
  end
  object AcceptBonusSource: TDataSource
    DataSet = AcceptBonusSelect
    Left = 392
    Top = 152
  end
  object RaiseDefaults: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_ACCEPT_RAISE_DEFAULTS(:Key_Session, :Id_Raise)')
    Left = 392
    Top = 224
    poSQLINT64ToBCD = True
  end
  object WorkReasonSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Ini_Work_Reason')
    Left = 392
    Top = 296
    poSQLINT64ToBCD = True
  end
  object ClearBuffQuery: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'EXECUTE PROCEDURE UP_KER_CLEAR_TMP_EX(:Key_Session)')
    Transaction = WriteTransaction
    Left = 40
    Top = 376
  end
  object UPConsts: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM PUB_SYS_DATA')
    Left = 184
    Top = 376
    poSQLINT64ToBCD = True
  end
  object IniAwayType: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_INI_AWAY_TYPE_SELECT')
    Left = 288
    Top = 376
    poSQLINT64ToBCD = True
  end
  object AwayInfo: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_GET_AWAY_INFO_2(:Id_Type_Away, :Id_PCard_Away, ' +
        ':Id_Key)')
    Left = 496
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FreeFundsTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 464
  end
  object DeleteManSmet: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UP_ACCEPT_DO_DELETE_MAN_SMET :Id_Rec, :Key_Ses' +
        'sion, :Id_PCard, :Id_Post_Salary')
    Transaction = WriteTransaction
    Left = 288
    Top = 464
  end
  object AcceptSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 392
    Top = 376
    poSQLINT64ToBCD = True
  end
  object WMByPeriodSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 392
    Top = 448
    poSQLINT64ToBCD = True
  end
  object GetWorkMode: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 496
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DSetShowInfo: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 496
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSetTemp: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 496
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DsetIdShr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 496
    Top = 248
    poSQLINT64ToBCD = True
  end
  object ShrTrans: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 496
    Top = 304
  end
  object ShrProc: TpFIBStoredProc
    Database = DB
    Transaction = ShrTrans
    Left = 496
    Top = 360
  end
  object IdShRSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 496
    Top = 416
    poSQLINT64ToBCD = True
  end
  object SmetShR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 496
    Top = 480
    poSQLINT64ToBCD = True
  end
  object BonusStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = ShrTrans
    Left = 108
    Top = 127
  end
end
