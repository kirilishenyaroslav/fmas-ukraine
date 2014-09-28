object CSDM: TCSDM
  OldCreateOrder = False
  Left = 1124
  Top = 543
  Height = 197
  Width = 156
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    DefaultUpdateTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 104
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 32
    Top = 56
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 104
    Top = 64
    poSQLINT64ToBCD = True
  end
end
