object DM_Ctrl: TDM_Ctrl
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 466
  Top = 252
  Height = 242
  Width = 208
  object Db: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Db
    TimeoutAction = TARollback
    Left = 120
    Top = 72
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Db
    TimeoutAction = TARollback
    Left = 120
    Top = 136
  end
  object DSetData: TpFIBDataSet
    Database = Db
    Transaction = ReadTransaction
    Left = 32
    Top = 72
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = Db
    Transaction = WriteTransaction
    Left = 32
    Top = 136
  end
end
