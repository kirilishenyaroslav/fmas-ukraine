object TimeKeepingDataModule: TTimeKeepingDataModule
  OldCreateOrder = False
  Left = 365
  Top = 136
  Height = 152
  Width = 367
  object DBTimeKeeping: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DBTimeKeeping
    TimeoutAction = TARollback
    Left = 40
    Top = 56
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DBTimeKeeping
    TimeoutAction = TARollback
    Left = 192
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DBTimeKeeping
    Transaction = TransactionW
    Left = 248
    Top = 8
  end
end
