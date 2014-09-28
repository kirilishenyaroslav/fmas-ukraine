object DM: TDM
  OldCreateOrder = False
  Left = 451
  Top = 409
  Height = 212
  Width = 290
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DB: TpFIBDatabase
    DefaultTransaction = TransactionR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionW
    Left = 248
    Top = 8
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 192
    Top = 8
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 72
    Top = 72
  end
end
