object DMStaj: TDMStaj
  OldCreateOrder = False
  Left = 350
  Top = 176
  Height = 314
  Width = 323
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 91
    Top = 8
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 35
    Top = 64
  end
  object LocalDatabase: TpFIBDatabase
    DBParams.Strings = (
      ''
      'lc_ctype=WIN1251')
    DefaultTransaction = LocalReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 35
    Top = 8
  end
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    Left = 120
    Top = 64
    poSQLINT64ToBCD = True
  end
  object ReportDataDataSet: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    Left = 32
    Top = 120
    poSQLINT64ToBCD = True
  end
end
