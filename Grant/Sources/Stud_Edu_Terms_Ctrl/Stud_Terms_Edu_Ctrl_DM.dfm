object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 454
  Top = 299
  Height = 192
  Width = 262
  object DB: TpFIBDatabase
    DefaultTransaction = DefaulttTransaction
    DefaultUpdateTransaction = DefaulttTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object DefaulttTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 56
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 152
    Top = 8
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    AfterStart = StProcTransactionAfterStart
    Left = 152
    Top = 56
  end
end
