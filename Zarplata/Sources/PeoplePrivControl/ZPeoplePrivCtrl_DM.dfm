object DM_Ctrl: TDM_Ctrl
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 150
  Width = 469
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 392
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 384
    Top = 56
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 184
    Top = 56
  end
  object DSet: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    Left = 112
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 24
    Top = 56
  end
  object DataBase: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
end
