object DM: TDM
  OldCreateOrder = False
  Left = 1062
  Top = 624
  Height = 264
  Width = 218
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 32
    Top = 144
  end
  object pFIBDatabase1: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = RTransaction
    Left = 32
    Top = 96
    poSQLINT64ToBCD = True
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 32
    Top = 48
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 128
    Top = 48
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = WTransaction
    Left = 128
    Top = 104
  end
end
