object DM_Contracts: TDM_Contracts
  OldCreateOrder = False
  Left = 471
  Top = 207
  Height = 452
  Width = 454
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
    Top = 64
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SQLScreenCursor = crHourGlass
    Left = 182
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    AutoEdit = False
    DataSet = DataSet
    Left = 262
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 400
    Top = 48
  end
  object ReadDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SQLScreenCursor = crHourGlass
    Left = 182
    Top = 64
    poSQLINT64ToBCD = True
  end
  object SetupDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DataSource_read: TDataSource
    AutoEdit = False
    DataSet = ReadDataSet
    Left = 262
    Top = 72
  end
  object DataSet_help: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SQLScreenCursor = crHourGlass
    Left = 182
    Top = 200
    poSQLINT64ToBCD = True
  end
end
