object DMFCsTypeOrderPremiaMain: TDMFCsTypeOrderPremiaMain
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 705
  Top = 224
  Height = 450
  Width = 575
  object GetDefaultPercent: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select raise_default'
      'from SP_RAISE'
      'where id_raise = :id_raise')
    Left = 362
    Top = 341
    poSQLINT64ToBCD = True
    object GetDefaultPercentRAISE_DEFAULT: TFIBFloatField
      FieldName = 'RAISE_DEFAULT'
    end
  end
  object GetRaiseCalcType: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_BONUS_GET_CALC_TYPE(:Id_Raise, :Cur_Date)')
    Left = 323
    Top = 293
    poSQLINT64ToBCD = True
    object GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField
      FieldName = 'ID_CALC_TYPE'
    end
    object GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField
      FieldName = 'CALC_TYPE_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object MainOrderDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Options = [poTrimCharFields, poStartTransaction, poAutoFormatFields]
    Left = 38
    Top = 149
    poSQLINT64ToBCD = True
  end
  object SmetsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = MainOrderDataSource
    Left = 407
    Top = 301
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SmDataSource: TDataSource
    DataSet = SmetsDataSet
    Left = 271
    Top = 365
  end
  object MainOrderDataSource: TDataSource
    DataSet = MainOrderDataSet
    Left = 47
    Top = 213
  end
  object SalaryFinanceDataSource: TDataSource
    DataSet = SmDataSet
    Left = 430
    Top = 358
  end
  object SmDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = MainOrderDataSource
    Left = 270
    Top = 302
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 129
    Top = 85
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 33
    Top = 85
  end
  object WorkDatabase: TpFIBDatabase
    DBName = ':'
    DBParams.Strings = (
      ''
      'user_name='
      'password='
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 25
    Top = 13
  end
end
