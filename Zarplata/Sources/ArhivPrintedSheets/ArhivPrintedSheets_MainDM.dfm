object DM: TDM
  OldCreateOrder = False
  Left = 822
  Top = 161
  Height = 280
  Width = 412
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 43
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 136
    Top = 112
  end
end
