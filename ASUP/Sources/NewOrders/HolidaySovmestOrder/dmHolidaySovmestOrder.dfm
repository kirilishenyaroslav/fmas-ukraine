object DM: TDM
  OldCreateOrder = False
  Left = 447
  Top = 208
  Height = 314
  Width = 323
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 147
    Top = 8
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 43
    Top = 64
  end
  object LocalDatabase: TpFIBDatabase
    DBName = 'server1212:fmas'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = LocalReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 43
    Top = 8
  end
  object ResultQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from MAN_HOLIDAY_SELECT(:id_order)')
    Left = 144
    Top = 64
    poSQLINT64ToBCD = True
    object ResultQueryTN: TFIBIntegerField
      DisplayLabel = #1058#1053
      FieldName = 'TN'
    end
    object ResultQueryFIO: TFIBStringField
      DisplayLabel = #1055#1030#1041
      FieldName = 'FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryWORK_PLACE: TFIBStringField
      DisplayLabel = #1052#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080
      FieldName = 'WORK_PLACE'
      Size = 1024
      EmptyStrToNull = True
    end
    object ResultQueryNAME_HOLIDAY: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'NAME_HOLIDAY'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryH_TERM: TFIBIntegerField
      DisplayLabel = #1058#1077#1088#1084#1110#1085' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'H_TERM'
    end
    object ResultQueryPERIOD_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'PERIOD_BEG'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ResultQueryPERIOD_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'PERIOD_END'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ResultQueryDATE_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'DATE_BEG'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ResultQueryDATE_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'DATE_END'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ResultQueryID_MAN_HOLIDAY: TFIBIntegerField
      FieldName = 'ID_MAN_HOLIDAY'
      Visible = False
    end
    object ResultQueryID_HOLIDAY: TFIBIntegerField
      FieldName = 'ID_HOLIDAY'
      Visible = False
    end
    object ResultQueryID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
      Visible = False
    end
    object ResultQueryDEPARMTENT_NAME: TFIBStringField
      FieldName = 'DEPARMTENT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryPOST_NAME: TFIBStringField
      FieldName = 'POST_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryFIRM_NAME: TFIBStringField
      FieldName = 'FIRM_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryCITY: TFIBStringField
      FieldName = 'CITY'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryINTRO: TFIBStringField
      FieldName = 'INTRO'
      Size = 4096
      EmptyStrToNull = True
    end
    object ResultQueryHOLIDAY_STR: TFIBStringField
      FieldName = 'HOLIDAY_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryPERIOD_STR: TFIBStringField
      FieldName = 'PERIOD_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryPARENT_DEPARTMENT: TFIBStringField
      FieldName = 'PARENT_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object ResultQueryWORK_TYPE: TFIBStringField
      FieldName = 'WORK_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object ResultDataSource: TDataSource
    DataSet = ResultQuery
    Left = 240
    Top = 64
  end
  object SelectCurWorkPlace: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_GET_CUR_WORK_PLACE(:Cur_Date, :Id_Pcard)')
    Left = 149
    Top = 116
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
    end
    object SelectCurWorkPlaceDATE_END: TFIBDateField
      DisplayWidth = 50
      FieldName = 'DATE_END'
      Visible = False
    end
    object SelectCurWorkPlaceREAL_DATE_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100
      DisplayWidth = 30
      FieldName = 'REAL_DATE_END'
    end
  end
  object SpHolidaySelect: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SP_HOLIDAY_SELECT')
    OnCalcFields = SpHolidaySelectCalcFields
    Left = 48
    Top = 120
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
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    Left = 240
    Top = 120
    poSQLINT64ToBCD = True
  end
end
