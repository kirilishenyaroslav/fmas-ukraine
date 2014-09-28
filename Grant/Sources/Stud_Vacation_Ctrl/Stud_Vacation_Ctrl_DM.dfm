object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 728
  Top = 353
  Height = 199
  Width = 245
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
    Top = 56
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 128
    Top = 8
  end
end
