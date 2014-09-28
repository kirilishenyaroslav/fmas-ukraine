object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 914
  Top = 820
  Height = 142
  Width = 366
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
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
  object DSetCatStud: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_CN_STUD_CAT_S')
    Left = 280
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DSourceCatStud: TDataSource
    DataSet = DSetCatStud
    Left = 280
    Top = 56
  end
  object DSetFastDep: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_CN_STUD_CAT_S')
    Left = 200
    Top = 32
    poSQLINT64ToBCD = True
  end
end
