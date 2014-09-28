object DM_synch: TDM_synch
  OldCreateOrder = False
  Left = 283
  Top = 196
  Height = 557
  Width = 556
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 384
  end
  object DataSource_facul: TDataSource
    DataSet = DataSet_facul
    Left = 302
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 200
    Top = 384
  end
  object DataSet_facul: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_Read: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DataSource_read: TDataSource
    DataSet = DataSet_Read
    Left = 302
    Top = 216
  end
  object DataSource_spec: TDataSource
    DataSet = DataSet_spec
    Left = 302
    Top = 64
  end
  object DataSet_spec: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DataSource_OKR: TDataSource
    DataSet = DataSet_OKR
    Left = 302
    Top = 112
  end
  object DataSet_OKR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSet_kurs: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DataSource_kurs: TDataSource
    DataSet = DataSet_kurs
    Left = 302
    Top = 168
  end
  object DataSet_group: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 272
    poSQLINT64ToBCD = True
  end
  object DataSource_group: TDataSource
    DataSet = DataSet_group
    Left = 302
    Top = 272
  end
end
