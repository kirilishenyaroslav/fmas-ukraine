object DM: TDM
  OldCreateOrder = False
  Left = 458
  Top = 114
  Height = 170
  Width = 228
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = pFIBTransaction1
    Left = 144
    Top = 8
  end
  object DB: TpFIBDatabase
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
end
