object MainDM: TMainDM
  OldCreateOrder = False
  Left = 894
  Top = 142
  Height = 201
  Width = 286
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 104
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 104
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 64
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 168
    Top = 16
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 168
    Top = 64
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 32
    Top = 112
  end
end
