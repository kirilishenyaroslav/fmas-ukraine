object DM: TDM
  OldCreateOrder = False
  Left = 366
  Top = 116
  Height = 330
  Width = 337
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object StTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 8
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 104
    Top = 72
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StTransaction
    Left = 248
    Top = 8
  end
  object DSourcePermis: TDataSource
    DataSet = DSetPermis
    Left = 104
    Top = 136
  end
  object DSetPermis: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 24
    Top = 136
    poSQLINT64ToBCD = True
  end
end
