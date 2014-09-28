object DM: TDM
  OldCreateOrder = False
  Left = 363
  Top = 120
  Height = 344
  Width = 322
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
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StTransaction
    Left = 248
    Top = 8
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 104
    Top = 72
  end
  object DSetWorkMode: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 26
    Top = 139
    poSQLINT64ToBCD = True
  end
  object DSourceWorkMode: TDataSource
    DataSet = DSetWorkMode
    Left = 106
    Top = 139
  end
end
