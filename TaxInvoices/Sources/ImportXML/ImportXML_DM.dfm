object ImportXMLDM: TImportXMLDM
  OldCreateOrder = False
  Left = 803
  Top = 236
  Height = 299
  Width = 400
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 224
    Top = 16
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 320
    Top = 16
  end
  object UserDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 80
    poSQLINT64ToBCD = True
  end
end
