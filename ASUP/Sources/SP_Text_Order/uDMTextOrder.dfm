object DMTextOrder: TDMTextOrder
  OldCreateOrder = False
  Left = 361
  Top = 213
  Height = 192
  Width = 377
  object StajDS: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 130
    Top = 19
    poSQLINT64ToBCD = True
  end
  object WorkDatabase: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 34
    Top = 24
  end
  object dsSiognersDSet: TDataSource
    DataSet = StajDS
    Left = 130
    Top = 75
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 236
    Top = 23
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 236
    Top = 87
  end
end
