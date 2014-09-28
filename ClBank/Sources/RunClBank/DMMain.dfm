object MainDM: TMainDM
  OldCreateOrder = False
  Left = 746
  Top = 145
  Height = 190
  Width = 268
  object DBIbx: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = FIBTrans
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
    Top = 16
  end
  object FIBTrans: TpFIBTransaction
    DefaultDatabase = DBIbx
    TimeoutAction = TARollback
    Left = 176
    Top = 16
  end
  object FIBSProc: TpFIBStoredProc
    Database = DBIbx
    Transaction = FIBTrans
    Left = 176
    Top = 80
  end
  object HTable: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asLargeInt
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 32
    Top = 16
  end
end
