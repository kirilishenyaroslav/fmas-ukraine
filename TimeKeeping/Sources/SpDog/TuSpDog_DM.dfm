object DM: TDM
  OldCreateOrder = False
  Left = 739
  Top = 117
  Height = 376
  Width = 258
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 48
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 136
    Top = 112
  end
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 8
  end
  object DSource11: TDataSource
    DataSet = DSet11
    Left = 136
    Top = 192
  end
  object DSet11: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSource1
    Left = 48
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DSource111: TDataSource
    DataSet = DSet111
    Left = 136
    Top = 264
  end
  object DSet111: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSource11
    Left = 48
    Top = 264
    poSQLINT64ToBCD = True
  end
end
