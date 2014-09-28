object DMF1dfFirm: TDMF1dfFirm
  OldCreateOrder = False
  Left = 186
  Top = 153
  Height = 372
  Width = 565
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 80
    Top = 8
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DataSource = DSource1
    Left = 80
    Top = 64
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 464
    Top = 64
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 464
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WTransaction
    Left = 384
    Top = 64
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 168
    Top = 64
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 168
    Top = 8
  end
end
