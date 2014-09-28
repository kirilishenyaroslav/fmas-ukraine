object DModule: TDModule
  OldCreateOrder = False
  Left = 661
  Top = 272
  Height = 335
  Width = 456
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = WTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WTransaction
    Left = 248
    Top = 8
  end
  object DSetDays: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    UpdateTransaction = WTransaction
    Left = 24
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DSourceDays: TDataSource
    DataSet = DSetDays
    Left = 112
    Top = 104
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 168
    Top = 48
  end
end
