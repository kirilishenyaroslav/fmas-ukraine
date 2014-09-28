object DM: TDM
  OldCreateOrder = False
  Left = 281
  Top = 255
  Height = 211
  Width = 163
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 14
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 86
    Top = 8
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 87
    Top = 65
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 15
    Top = 65
    poSQLINT64ToBCD = True
  end
  object DSetChild: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSourceMain
    Left = 15
    Top = 121
    poSQLINT64ToBCD = True
  end
  object DSourceChild: TDataSource
    DataSet = DSetChild
    Left = 87
    Top = 121
  end
end
