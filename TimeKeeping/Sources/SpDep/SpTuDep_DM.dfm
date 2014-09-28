object DM: TDM
  OldCreateOrder = False
  Left = 519
  Top = 331
  Height = 234
  Width = 309
  object DB: TpFIBDatabase
    DefaultTransaction = TransactionR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 72
    Top = 72
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 160
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionW
    Left = 160
    Top = 72
  end
end
