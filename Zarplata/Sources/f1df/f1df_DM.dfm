object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 274
  Top = 253
  Height = 343
  Width = 750
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 272
    Top = 72
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 384
    Top = 72
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 17
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 385
    Top = 17
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Private\San\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 67
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 64
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 128
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 168
    Top = 128
  end
  object HalcyonDataSet1: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 576
    Top = 16
  end
  object CreateHalcyonDataSet: TCreateHalcyonDataSet
    AutoOverwrite = False
    DBFType = Clipper
    Left = 576
    Top = 64
  end
end
