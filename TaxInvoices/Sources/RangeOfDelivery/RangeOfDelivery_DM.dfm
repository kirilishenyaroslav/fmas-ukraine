object RangeOfDeliveryDM: TRangeOfDeliveryDM
  OldCreateOrder = False
  Left = 662
  Top = 305
  Height = 176
  Width = 417
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object RangeOfDeliveryDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 64
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 8
  end
  object RangeOfDeliveryDSource: TDataSource
    DataSet = RangeOfDeliveryDSet
    Left = 176
    Top = 64
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 288
    Top = 16
  end
end
