object MainDM: TMainDM
  OldCreateOrder = False
  Left = 310
  Top = 411
  Height = 256
  Width = 304
  object HTable: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = False
    UseDeleted = True
    UserID = 0
    Left = 16
    Top = 16
  end
  object fibDB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
    Top = 16
  end
  object FIBTrans: TpFIBTransaction
    DefaultDatabase = fibDB
    TimeoutAction = TARollback
    Left = 176
    Top = 16
  end
  object FIBSProc: TpFIBStoredProc
    Database = fibDB
    Transaction = FIBTrans
    Left = 176
    Top = 80
  end
end
