object LocalModule: TLocalModule
  OldCreateOrder = False
  Left = 323
  Top = 283
  Height = 288
  Width = 470
  object LocalDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 104
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 104
    Top = 64
  end
  object PCardSource: TDataSource
    DataSet = ResultQuery
    Left = 24
    Top = 72
  end
  object ResultQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      #1055#1088#1080#1089#1074#1072#1080#1074#1072#1077#1090#1089#1103' '#1074' '#1082#1086#1076#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1072' '#1092#1086#1088#1084#1099' '#1074' '#1084#1086#1076#1091#1083#1077' fmPCardsView'
      '('#1074' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1085#1086#1074#1072#1103'/'#1085#1077' '#1085#1086#1074#1072#1103' '#1074#1077#1088#1089#1080#1103')')
    OnCalcFields = ResultQueryCalcFields
    Left = 176
    Top = 16
    poSQLINT64ToBCD = True
    object ResultQueryID_PCARD: TFIBIntegerField
      FieldName = 'ID_PCARD'
    end
    object ResultQueryTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object ResultQueryFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      EmptyStrToNull = True
    end
    object ResultQueryIMYA: TFIBStringField
      FieldName = 'IMYA'
      EmptyStrToNull = True
    end
    object ResultQueryOTCHESTVO: TFIBStringField
      FieldName = 'OTCHESTVO'
      EmptyStrToNull = True
    end
    object ResultQueryID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
    object ResultQueryFIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FIO'
      Size = 65
      Calculated = True
    end
    object ResultQueryTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object ResultQueryBDATE: TFIBDateField
      FieldName = 'BDATE'
    end
    object ResultQueryISWORKING: TFIBIntegerField
      FieldName = 'ISWORKING'
    end
    object ResultQueryTYPE_POST: TFIBStringField
      FieldName = 'TYPE_POST'
      Size = 10
      EmptyStrToNull = True
    end
    object ResultQuerySTEP: TFIBStringField
      FieldName = 'STEP'
      Size = 10
      EmptyStrToNull = True
    end
    object ResultQueryZVAN: TFIBStringField
      FieldName = 'ZVAN'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = ReadTransaction
    Left = 176
    Top = 64
    poSQLINT64ToBCD = True
  end
  object ParamsQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT ia.local_department, sd.name_full'
      'from INI_ASUP_CONSTS IA'
      
        'LEFT JOIN SP_DEPARTMENT sd on (sd.id_department = ia.local_depar' +
        'tment and '#39'NOW'#39' between sd.use_beg and sd.use_end)')
    OnCalcFields = ResultQueryCalcFields
    Left = 104
    Top = 112
    poSQLINT64ToBCD = True
    object ParamsQueryNAME_FULL: TFIBStringField
      FieldName = 'NAME_FULL'
      Size = 255
      EmptyStrToNull = True
    end
    object ParamsQueryLOCAL_DEPARTMENT: TFIBIntegerField
      FieldName = 'LOCAL_DEPARTMENT'
    end
  end
  object pFIBQ_Delete: TpFIBQuery
    Database = LocalDatabase
    SQL.Strings = (
      'execute procedure ASUP_PRIVATE_CARDS_DELETE(:id_pcard);')
    Transaction = WriteTransaction
    Left = 176
    Top = 112
  end
  object ConstsQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_Asup_Consts')
    Left = 248
    Top = 16
    poSQLINT64ToBCD = True
  end
  object LevelsSelect: TpFIBDataSet
    Database = LocalDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Id_Level, Level_Order, Level_Name FROM UP_SYS_LEVEL'
      'ORDER BY Level_Order')
    Left = 264
    Top = 72
    poSQLINT64ToBCD = True
    object LevelsSelectID_LEVEL: TFIBBCDField
      FieldName = 'ID_LEVEL'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object LevelsSelectLEVEL_ORDER: TFIBIntegerField
      DisplayLabel = #1056#1110#1074#1077#1085#1100
      DisplayWidth = 20
      FieldName = 'LEVEL_ORDER'
    end
    object LevelsSelectLEVEL_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1088#1110#1074#1085#1103' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110
      FieldName = 'LEVEL_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object DefaultLevel: TpFIBDataSet
    Database = LocalDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT DEFAULT_WORK_LEVEL FROM UP_SYS_INI_CONSTS ')
    Left = 264
    Top = 120
    poSQLINT64ToBCD = True
  end
end
