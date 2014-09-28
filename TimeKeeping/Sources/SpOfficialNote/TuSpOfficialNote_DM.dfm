object DM: TDM
  OldCreateOrder = False
  Left = 365
  Top = 116
  Height = 247
  Width = 335
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 104
    Top = 72
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StTransaction
    Left = 248
    Top = 8
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 102
    Top = 128
  end
  object StTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 6
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 33
    Top = 74
    poSQLINT64ToBCD = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DataSource = DSource1
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 27
    Top = 129
    poSQLINT64ToBCD = True
  end
end
