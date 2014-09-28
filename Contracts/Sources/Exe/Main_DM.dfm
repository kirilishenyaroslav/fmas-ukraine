object MainDM: TMainDM
  OldCreateOrder = False
  Left = 340
  Top = 205
  Height = 270
  Width = 430
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
    TimeoutAction = TACommit
    Left = 184
    Top = 72
  end
  object DataSet_synchEDBO: TpFIBDataSet
    Database = Main_DB
    Transaction = ReadTransaction
    Left = 184
    Top = 136
    poSQLINT64ToBCD = True
  end
end
