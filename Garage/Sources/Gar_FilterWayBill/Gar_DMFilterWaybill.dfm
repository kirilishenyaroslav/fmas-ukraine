object DMFilterWaybill: TDMFilterWaybill
  OldCreateOrder = False
  Left = 583
  Top = 249
  Height = 150
  Width = 407
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object FilterSeriesWaybillDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 64
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 144
    Top = 8
  end
  object FilterSeriesWaybillDSource: TDataSource
    DataSet = FilterSeriesWaybillDSet
    Left = 192
    Top = 64
  end
end
