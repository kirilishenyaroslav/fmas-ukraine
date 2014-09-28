object OrderList_Dm: TOrderList_Dm
  OldCreateOrder = False
  Left = 405
  Top = 270
  Height = 226
  Width = 345
  object pFIBD_OrderList: TpFIBDatabase
    DefaultTransaction = pFIBTR_OrderList
    DefaultUpdateTransaction = pFIBTW_OrderList
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object pFIBDS_OrderList: TpFIBDataSet
    Database = pFIBD_OrderList
    Transaction = pFIBTR_OrderList
    UpdateTransaction = pFIBTW_OrderList
    Left = 256
    Top = 8
    poSQLINT64ToBCD = True
  end
  object pFIBTR_OrderList: TpFIBTransaction
    DefaultDatabase = pFIBD_OrderList
    TimeoutAction = TARollback
    Left = 136
    Top = 8
  end
  object pFIBTW_OrderList: TpFIBTransaction
    DefaultDatabase = pFIBD_OrderList
    TimeoutAction = TARollback
    Left = 136
    Top = 56
  end
end
