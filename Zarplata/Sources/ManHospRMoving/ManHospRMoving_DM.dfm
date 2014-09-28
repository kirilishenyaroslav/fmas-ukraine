object DM: TDM
  OldCreateOrder = False
  Left = 590
  Top = 336
  Height = 267
  Width = 622
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
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
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 272
    Top = 72
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 17
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 273
    Top = 129
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 385
    Top = 17
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    DataSource = DSource1
    Left = 384
    Top = 72
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    DataSource = DSource1
    OnCalcFields = DSet3CalcFields
    Left = 385
    Top = 129
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 360
    Top = 200
    poSQLINT64ToBCD = True
  end
end
