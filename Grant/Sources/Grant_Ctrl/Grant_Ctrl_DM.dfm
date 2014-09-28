object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 454
  Top = 299
  Height = 201
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
    AfterStart = StProcTransactionAfterStart
    Left = 136
    Top = 56
  end
  object DSetDelMass: TpFIBDataSet
    Database = DB
    Transaction = StProcTransaction
    SelectSQL.Strings = (
      '')
    Left = 32
    Top = 106
    poSQLINT64ToBCD = True
  end
end
