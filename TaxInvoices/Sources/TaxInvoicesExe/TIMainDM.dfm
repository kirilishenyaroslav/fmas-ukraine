object DM: TDM
  OldCreateOrder = False
  Left = 449
  Top = 320
  Height = 163
  Width = 274
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionW
    Left = 112
    Top = 8
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 56
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = TransactionR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 56
  end
end
