object StorProcDM: TStorProcDM
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 163
  Width = 171
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 24
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 72
    Top = 72
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 24
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 112
    Top = 72
  end
end
