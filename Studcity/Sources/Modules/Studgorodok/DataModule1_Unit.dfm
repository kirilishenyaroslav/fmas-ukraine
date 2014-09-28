object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 1022
  Top = 350
  Height = 314
  Width = 418
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      '')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 10000
    OnLostConnect = DBLostConnect
    AfterRestoreConnect = DBAfterRestoreConnect
    Left = 24
    Top = 92
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 86
    Top = 52
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 94
    Top = 125
  end
  object ReadTimestampDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 214
    Top = 134
    poSQLINT64ToBCD = True
  end
  object DataSet_main: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 212
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DataSet_read: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 215
    Top = 200
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 208
    Top = 24
  end
end
