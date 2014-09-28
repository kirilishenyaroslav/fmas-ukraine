object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 1003
  Top = 400
  Height = 308
  Width = 215
  object DB: TpFIBDatabase
    DefaultTransaction = DefaulttTransaction
    DefaultUpdateTransaction = DefaulttTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaulttTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
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
  object DSetCategory: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 32
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DSourceCategory: TDataSource
    DataSet = DSetCategory
    Left = 128
    Top = 112
  end
  object DSetTypePost: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    DataSource = DSourceCategory
    Left = 32
    Top = 176
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DSourceTypePost: TDataSource
    DataSet = DSetTypePost
    Left = 128
    Top = 176
  end
end
