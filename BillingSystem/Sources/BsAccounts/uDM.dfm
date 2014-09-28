object frmAccounts_DM: TfrmAccounts_DM
  OldCreateOrder = False
  Left = 625
  Top = 273
  Height = 353
  Width = 381
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 264
    Top = 112
  end
  object ReadDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 40
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 80
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 168
    Top = 8
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 112
    poSQLINT64ToBCD = True
  end
  object ReadDataSet_error: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 176
    poSQLINT64ToBCD = True
  end
end
