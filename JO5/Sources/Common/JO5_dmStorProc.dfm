object StoredProcDM: TStoredProcDM
  OldCreateOrder = False
  Left = 192
  Top = 115
  Height = 150
  Width = 203
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 72
    Top = 64
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 8
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 128
    Top = 64
    poSQLINT64ToBCD = True
  end
end
