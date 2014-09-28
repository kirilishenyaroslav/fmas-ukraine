object DBDM: TDBDM
  OldCreateOrder = False
  Left = 251
  Top = 107
  Height = 150
  Width = 215
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    DefaultUpdateTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 48
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 120
    Top = 48
  end
end
