object dmHoliday: TdmHoliday
  OldCreateOrder = False
  Left = 240
  Top = 110
  Height = 220
  Width = 374
  object DB: TpFIBDatabase
    DBName = 'D:\FMAS-WIN\Database\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 8
  end
  object Holiday_Select: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_MAN_HOLIDAY_SELECT2'
      '(:ID_PCARD)')
    Left = 208
    Top = 8
    poSQLINT64ToBCD = True
    object Holiday_SelectID: TFIBIntegerField
      FieldName = 'ID'
    end
    object Holiday_SelectID_PARENT: TFIBIntegerField
      FieldName = 'ID_PARENT'
    end
    object Holiday_SelectCAPTION: TFIBStringField
      FieldName = 'CAPTION'
      Size = 255
      EmptyStrToNull = True
    end
    object Holiday_SelectPERIOD_STR: TFIBStringField
      FieldName = 'PERIOD_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object Holiday_SelectTYPE_HOLIDAY: TFIBStringField
      FieldName = 'TYPE_HOLIDAY'
      Size = 255
      EmptyStrToNull = True
    end
    object Holiday_SelectCOUNT_DAYS: TFIBIntegerField
      FieldName = 'COUNT_DAYS'
    end
    object Holiday_SelectCOUNT_DAYS_UNUSED: TFIBIntegerField
      FieldName = 'COUNT_DAYS_UNUSED'
    end
    object Holiday_SelectNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object Holiday_SelectDATE_ORDER: TFIBStringField
      FieldName = 'DATE_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object Holiday_SelectYEAR_BEG: TFIBStringField
      FieldName = 'YEAR_BEG'
      Size = 4
      EmptyStrToNull = True
    end
    object Holiday_SelectYEAR_END: TFIBStringField
      FieldName = 'YEAR_END'
      Size = 4
      EmptyStrToNull = True
    end
    object Holiday_SelectRMOVING: TFIBIntegerField
      FieldName = 'RMOVING'
    end
    object Holiday_SelectIS_PPS: TFIBStringField
      FieldName = 'IS_PPS'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 72
  end
  object SelectCurWorkPlace: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_GET_CUR_WORK_PLACE'
      '    ( :CUR_DATE, :ID_PCARD ) ')
    Left = 216
    Top = 68
    poSQLINT64ToBCD = True
    object SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField
      FieldName = 'ID_DEPARTMENT'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      DisplayWidth = 100
      FieldName = 'NAME_POST_SALARY'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField
      FieldName = 'ID_POST_SALARY'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField
      DisplayLabel = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      DisplayWidth = 100
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
      Visible = False
    end
    object SelectCurWorkPlaceDATE_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082
      DisplayWidth = 30
      FieldName = 'DATE_BEG'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object SelectCurWorkPlaceDATE_END: TFIBDateField
      DisplayWidth = 50
      FieldName = 'DATE_END'
      Visible = False
      DisplayFormat = 'dd.mm.yyyy'
    end
    object SelectCurWorkPlaceREAL_DATE_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100
      DisplayWidth = 30
      FieldName = 'REAL_DATE_END'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object SelectCurWorkPlaceRMOVING: TFIBIntegerField
      FieldName = 'RMOVING'
    end
  end
  object SpHolidaySelect: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SP_HOLIDAY_SELECT')
    Left = 32
    Top = 72
    poSQLINT64ToBCD = True
    object SpHolidaySelectID_HOLIDAY: TFIBIntegerField
      FieldName = 'ID_HOLIDAY'
      Visible = False
    end
    object SpHolidaySelectNAME_HOLIDAY: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      DisplayWidth = 110
      FieldName = 'NAME_HOLIDAY'
      Size = 255
      EmptyStrToNull = True
    end
    object SpHolidaySelectIS_MAIN: TFIBStringField
      FieldName = 'IS_MAIN'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SpHolidaySelectDEFAULT_TERM: TFIBIntegerField
      FieldName = 'DEFAULT_TERM'
      Visible = False
    end
    object SpHolidaySelectIS_PAY: TFIBStringField
      FieldName = 'IS_PAY'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SpHolidaySelectID_VIDOPL: TFIBIntegerField
      FieldName = 'ID_VIDOPL'
      Visible = False
    end
    object SpHolidaySelectVIHOD_TYPE: TFIBIntegerField
      DisplayLabel = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091
      FieldName = 'VIHOD_TYPE'
      Visible = False
    end
    object SpHolidaySelectVIHOD_NAME: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091
      DisplayWidth = 40
      FieldName = 'VIHOD_NAME'
      Size = 5
      EmptyStrToNull = True
    end
    object SpHolidaySelectDONT_CALC_HOLIDAYS: TFIBStringField
      FieldName = 'DONT_CALC_HOLIDAYS'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SpHolidaySelectIS_MAIN_STR: TFIBStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1085#1072
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'IS_MAIN_STR'
      Size = 50
      EmptyStrToNull = True
      Calculated = True
    end
    object SpHolidaySelectIS_PAY_STR: TFIBStringField
      DisplayLabel = #1054#1087#1083#1072#1095#1091#1074#1072#1085#1072
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'IS_PAY_STR'
      Size = 50
      EmptyStrToNull = True
      Calculated = True
    end
    object SpHolidaySelectIS_CALC_HOLIDAY_STR: TStringField
      DisplayLabel = #1042#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1089#1074#1103#1090#1082#1086#1074#1110
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'IS_CALC_HOLIDAY_STR'
      Size = 50
      Calculated = True
    end
  end
  object CheckQuery: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM HOLIDAYS_BETWEEN_2_DATES(:DATE1, :DATE2);')
    Left = 304
    Top = 72
    poSQLINT64ToBCD = True
    object CheckQueryHCOUNT: TFIBIntegerField
      FieldName = 'HCOUNT'
    end
  end
  object DeleteQ: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure '
      'ASUP_DT_MAN_HOLIDAY_PLAN_D (:id_man_holiday_plan);')
    Transaction = DefaultTransaction
    Left = 32
    Top = 136
  end
  object SelectAutoPlan: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_DT_MAN_HOLIDAY_AUTO_SELECT ')
    Left = 216
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DelAutoPlan: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure '
      'ASUP_DT_MAN_HOLIDAY_PLAN_DEL (:id_plan_auto);')
    Transaction = DefaultTransaction
    Left = 88
    Top = 136
  end
end
