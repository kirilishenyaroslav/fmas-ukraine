object BankValutaSch_DM: TBankValutaSch_DM
  OldCreateOrder = False
  Left = 514
  Top = 361
  Height = 286
  Width = 367
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 104
    Top = 16
  end
  object TransWrite: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 192
    Top = 16
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = TransWrite
    Left = 272
    Top = 16
  end
  object ValutaDSet: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 32
    Top = 64
    poSQLINT64ToBCD = True
  end
  object ValutaSchDSet: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    DataSource = ValutaDSource
    Left = 32
    Top = 120
    poSQLINT64ToBCD = True
  end
  object ValutaDSource: TDataSource
    DataSet = ValutaDSet
    Left = 136
    Top = 64
  end
  object ValutaSchDSource: TDataSource
    DataSet = ValutaSchDSet
    Left = 136
    Top = 120
  end
  object BalSchetValDSet: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 32
    Top = 168
    poSQLINT64ToBCD = True
  end
  object BalSchetValDSource: TDataSource
    DataSet = BalSchetValDSet
    Left = 136
    Top = 168
  end
end
