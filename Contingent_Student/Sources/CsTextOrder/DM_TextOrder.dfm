object DM: TDM
  OldCreateOrder = False
  Left = 474
  Top = 283
  Height = 281
  Width = 406
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 80
  end
  object DataSourceOrders: TDataSource
    DataSet = DataSetOrders
    Left = 302
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 8
    Top = 80
  end
  object DataSetOrders: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 8
    poSQLINT64ToBCD = True
  end
end
