object StProcDM: TStProcDM
  OldCreateOrder = False
  Left = 690
  Top = 222
  Height = 282
  Width = 468
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 256
    Top = 8
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    DefaultUpdateTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 40
    Top = 64
    poSQLINT64ToBCD = True
  end
  object AbbreviatureDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 120
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 104
    Top = 8
  end
end
