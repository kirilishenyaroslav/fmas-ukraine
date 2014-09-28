object PI_DataMod: TPI_DataMod
  OldCreateOrder = False
  Left = 192
  Top = 151
  Height = 213
  Width = 215
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 104
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
