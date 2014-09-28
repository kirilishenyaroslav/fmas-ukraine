object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 320
  Top = 228
  Height = 277
  Width = 404
  object DataBase: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 10
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 120
    Top = 10
  end
  object DSetAllData: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      '')
    Left = 32
    Top = 58
    poSQLINT64ToBCD = True
  end
  object DSourceMoving: TDataSource
    DataSet = DSetMoving
    Left = 120
    Top = 114
  end
  object DSetMoving: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      '')
    DataSource = DSourceRmoving
    Left = 32
    Top = 114
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 249
    Top = 74
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    AfterStart = WriteTransactionAfterStart
    Left = 320
    Top = 74
  end
  object DSourceAllData: TDataSource
    DataSet = DSetAllData
    Left = 120
    Top = 58
  end
  object DSetRmoving: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      '')
    Left = 32
    Top = 163
    poSQLINT64ToBCD = True
  end
  object DSourceRmoving: TDataSource
    DataSet = DSetRmoving
    Left = 120
    Top = 163
  end
end
