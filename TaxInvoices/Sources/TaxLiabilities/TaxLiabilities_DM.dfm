object TaxLiabilitiesDM: TTaxLiabilitiesDM
  OldCreateOrder = False
  Left = 664
  Top = 307
  Height = 176
  Width = 331
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object TaxLiabilitiesDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
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
  object TaxLiabilitiesDSource: TDataSource
    DataSet = TaxLiabilitiesDSet
    Left = 152
    Top = 64
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 248
    Top = 64
  end
end
