object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 195
  Top = 114
  Height = 233
  Width = 301
  object DB: TpFIBDatabase
    DBName = 'D:\Private\San\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251')
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
    Top = 64
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 145
    Top = 9
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 224
    Top = 8
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
end
