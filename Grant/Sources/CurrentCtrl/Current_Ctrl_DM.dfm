object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 142
  Top = 107
  Height = 277
  Width = 404
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 10
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 2
  end
  object DSetAllData: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      '')
    Left = 32
    Top = 58
    poSQLINT64ToBCD = True
  end
  object DSourceMoving: TDataSource
    DataSet = DSetMoving
    Left = 112
    Top = 114
  end
  object DSetMoving: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      '')
    Left = 32
    Top = 114
    poSQLINT64ToBCD = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 249
    Top = 74
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    AfterStart = WriteTransactionAfterStart
    Left = 320
    Top = 74
  end
  object DSourceAllData: TDataSource
    DataSet = DSetAllData
    Left = 112
    Top = 58
  end
  object DSetDelMass: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      '')
    Left = 32
    Top = 178
    poSQLINT64ToBCD = True
  end
end
