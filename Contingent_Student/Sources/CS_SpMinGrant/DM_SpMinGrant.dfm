object DM: TDM
  OldCreateOrder = False
  Left = 429
  Top = 306
  Height = 239
  Width = 370
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 72
  end
  object DataSourceMinGrant: TDataSource
    DataSet = DataSetMinGrant
    Left = 190
    Top = 88
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 96
    Top = 128
  end
  object DataSetMinGrant: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSetCheck: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 16
    poSQLINT64ToBCD = True
  end
end
