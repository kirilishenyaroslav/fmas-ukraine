object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 454
  Top = 299
  Height = 334
  Width = 337
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 56
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 136
    Top = 8
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 56
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 40
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DSourceCategory: TDataSource
    DataSet = DSetCategory
    Left = 136
    Top = 168
  end
  object DSetCategory: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 40
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DSetTypePost: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSourceCategory
    Left = 40
    Top = 224
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DSourceTypePost: TDataSource
    DataSet = DSetTypePost
    Left = 136
    Top = 224
  end
end
