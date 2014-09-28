object dmShtatUtils: TdmShtatUtils
  OldCreateOrder = False
  Left = 350
  Top = 143
  Height = 277
  Width = 527
  object WorkCondSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_Work_Cond')
    Left = 120
    Top = 16
    poSQLINT64ToBCD = True
    object WorkCondSelectID_WORK_COND: TFIBIntegerField
      FieldName = 'ID_WORK_COND'
      Visible = False
    end
    object WorkCondSelectNAME_WORK_COND: TFIBStringField
      DisplayLabel = #1059#1084#1086#1074#1080' '#1087#1088#1072#1094#1110
      FieldName = 'NAME_WORK_COND'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object WorkModeSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'Select Id_Work_Mode, Name  From Dt_Work_Mode_Select Where Count_' +
        'Day>0')
    Left = 304
    Top = 16
    poSQLINT64ToBCD = True
    object WorkModeSelectID_WORK_MODE: TFIBIntegerField
      FieldName = 'ID_WORK_MODE'
      Visible = False
    end
    object WorkModeSelectNAME_WORK_MODE: TFIBStringField
      DisplayLabel = #1056#1077#1078#1080#1084' '#1088#1086#1073#1086#1090#1080
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SpzSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_Spz_Select')
    Left = 208
    Top = 16
    poSQLINT64ToBCD = True
    object SpzSelectID_SPZ: TFIBIntegerField
      FieldName = 'ID_SPZ'
      Visible = False
    end
    object SpzSelectSPZ: TFIBStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
      FieldName = 'SPZ'
      Size = 10
      EmptyStrToNull = True
    end
    object SpzSelectNAME_SPZ: TFIBStringField
      DisplayLabel = #1055#1086#1074#1085#1077' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1074#1080#1076#1091' '#1079#1072#1090#1088#1072#1090
      FieldName = 'NAME_SPZ'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object PayFormSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_Pay_Form')
    Left = 32
    Top = 16
    poSQLINT64ToBCD = True
    object PayFormSelectID_PAY_FORM: TFIBIntegerField
      FieldName = 'ID_PAY_FORM'
      Visible = False
    end
    object PayFormSelectNAME_PAY_FORM: TFIBStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1080
      FieldName = 'NAME_PAY_FORM'
      Size = 255
      EmptyStrToNull = True
    end
    object PayFormSelectNAME_PAY_FORM_RUS: TFIBStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1080' ('#1088#1091#1089')'
      FieldName = 'NAME_PAY_FORM_RUS'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SalarySelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Shtat_Get_Salaries(:Cur_Date, :Old_Oklads)')
    Left = 32
    Top = 96
    poSQLINT64ToBCD = True
    object SalarySelectID_POST_SALARY: TFIBIntegerField
      FieldName = 'ID_POST_SALARY'
      Visible = False
    end
    object SalarySelectNAME_POST: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      FieldName = 'Name_Post'
      Visible = False
      Size = 100
      EmptyStrToNull = True
    end
    object SalarySelectNAME_POST_BASE_SALARY: TFIBStringField
      DisplayLabel = #1041#1072#1079#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      FieldName = 'NAME_POST_BASE_SALARY'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object SalarySelectNAME_POST_SALARY: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      FieldName = 'NAME_POST_SALARY'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object SalarySelectSALARY_MIN: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076' ('#1084#1110#1085#1110#1084#1091#1084')'
      FieldName = 'SALARY_MIN'
      Required = True
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object SalarySelectSALARY_MAX: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076' ('#1084#1072#1082#1089#1080#1084#1091#1084')'
      FieldName = 'SALARY_MAX'
      Required = True
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object SalarySelectID_POST: TFIBIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object SalarySelectPPS_KOEF: TFIBStringField
      FieldName = 'PPS_KOEF'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SalarySelectNAME_CATEGORY: TFIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'NAME_CATEGORY'
      Visible = False
      Size = 100
      EmptyStrToNull = True
    end
    object SalarySelectFULL_SALARY_NAME: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      FieldName = 'FULL_SALARY_NAME'
      Required = True
      Visible = False
      Size = 400
      EmptyStrToNull = True
    end
    object SalarySelectSALARY_MIN_STR: TStringField
      DisplayLabel = #1054#1082#1083#1072#1076' ('#1084#1110#1085#1110#1084#1091#1084')'
      FieldName = 'SALARY_MIN_STR'
      Size = 255
    end
    object SalarySelectSALARY_MAX_STR: TStringField
      DisplayLabel = #1054#1082#1083#1072#1076' ('#1084#1072#1082#1089#1080#1084#1091#1084')'
      FieldName = 'SALARY_MAX_STR'
      Size = 255
    end
  end
  object SalarySource: TDataSource
    DataSet = SalarySelect
    Left = 120
    Top = 96
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 176
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 280
    Top = 176
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 176
  end
  object ConstsQuery: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_Asup_Consts')
    Left = 216
    Top = 96
    poSQLINT64ToBCD = True
  end
  object SalaryFilterSource: TDataSource
    DataSet = SalarySelectFilter
    Left = 376
    Top = 176
  end
  object SalarySelectFilter: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select * from ASUP_SALARY_SELECT_FILTER(:CUR_DATE, :Old_Oklads,:' +
        'id_department);')
    Left = 304
    Top = 96
    poSQLINT64ToBCD = True
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'ID_POST_SALARY'
      Visible = False
    end
    object FIBStringField1: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      FieldName = 'Name_Post'
      Size = 100
      EmptyStrToNull = True
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = #1041#1072#1079#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      FieldName = 'NAME_POST_BASE_SALARY'
      Size = 255
      EmptyStrToNull = True
    end
    object FIBStringField3: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      FieldName = 'NAME_POST_SALARY'
      Size = 255
      EmptyStrToNull = True
    end
    object FIBFloatField1: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076' ('#1084#1110#1085#1110#1084#1091#1084')'
      FieldName = 'SALARY_MIN'
    end
    object FIBFloatField2: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076' ('#1084#1072#1082#1089#1080#1084#1091#1084')'
      FieldName = 'SALARY_MAX'
    end
    object FIBIntegerField2: TFIBIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object FIBStringField4: TFIBStringField
      FieldName = 'PPS_KOEF'
      Size = 1
      EmptyStrToNull = True
    end
    object FIBStringField5: TFIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'NAME_CATEGORY'
      Size = 100
      EmptyStrToNull = True
    end
    object SalarySelectFilterID_TYPE_POST: TFIBIntegerField
      FieldName = 'ID_TYPE_POST'
    end
    object SalarySelectFilterNAME_TYPE_POST: TFIBStringField
      FieldName = 'NAME_TYPE_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object SalarySelectFilterFULL_SALARY_NAME: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      FieldName = 'FULL_SALARY_NAME'
      Size = 400
      EmptyStrToNull = True
    end
    object SalarySelectFilterSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object SalarySelectFilterIS_PPS: TFIBStringField
      FieldName = 'IS_PPS'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object AcceptHistoryQuery: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_ORDER_ACCEPT_COND_SELECT(:ID_PCARD)')
    Left = 184
    Top = 176
    poSQLINT64ToBCD = True
    object AcceptHistoryQueryNAME_ACCEPT_COND: TFIBStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095#1077#1085#1086
      DisplayWidth = 50
      FieldName = 'NAME_ACCEPT_COND'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptHistoryQueryDATE_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082
      DisplayWidth = 50
      FieldName = 'DATE_BEG'
    end
    object AcceptHistoryQueryDATE_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100
      DisplayWidth = 50
      FieldName = 'DATE_END'
    end
    object AcceptHistoryQueryACCEPT_COND_YEARS: TFIBFloatField
      DisplayLabel = #1056#1086#1082#1110#1074
      DisplayWidth = 50
      FieldName = 'ACCEPT_COND_YEARS'
    end
    object AcceptHistoryQueryID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
      Visible = False
    end
    object AcceptHistoryQueryNAME_ACCEPT_COND_PRINT: TFIBStringField
      DisplayLabel = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
      FieldName = 'NAME_ACCEPT_COND_PRINT'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptHistoryQueryID_ACCEPT_COND: TFIBIntegerField
      DisplayLabel = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
      FieldName = 'ID_ACCEPT_COND'
      Visible = False
    end
  end
  object dsSalaryRange: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Salary_Min, Salary_Max, Base_Salary_Min, Base_Salary_Max'
      'FROM ASUP_SHTAT_GET_SALARY_RANGE(:Id_Post_Salary, :Cur_Date)')
    Left = 392
    Top = 16
    poSQLINT64ToBCD = True
  end
end
