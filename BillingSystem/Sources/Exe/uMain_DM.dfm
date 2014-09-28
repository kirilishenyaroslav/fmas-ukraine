object frmMainDM: TfrmMainDM
  OldCreateOrder = False
  Left = 552
  Top = 278
  Height = 295
  Width = 467
  object Main_DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 864000000
    WaitForRestoreConnect = 0
    Left = 48
    Top = 8
  end
  object ReadTimestampDataSet: TpFIBDataSet
    Database = Main_DB
    Transaction = ReadTransaction
    Left = 182
    Top = 6
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Main_DB
    TimeoutAction = TARollback
    Left = 184
    Top = 72
  end
  object ReadDataSet: TpFIBDataSet
    Database = Main_DB
    Transaction = ReadTransaction
    Left = 32
    Top = 128
    poSQLINT64ToBCD = True
  end
  object ReadDataSource: TDataSource
    DataSet = ReadDataSet
    Left = 104
    Top = 128
  end
end
