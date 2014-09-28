object MainDM: TMainDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 1004
  Top = 565
  Height = 397
  Width = 276
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 64
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 114
    poSQLINT64ToBCD = True
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 64
    Top = 168
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 160
    Top = 116
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 160
    Top = 64
  end
  object RxMData: TRxMemoryData
    FieldDefs = <>
    Left = 104
    Top = 115
  end
end
