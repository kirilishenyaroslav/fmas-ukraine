object frmPost_DM: TfrmPost_DM
  OldCreateOrder = False
  Left = 545
  Top = 299
  Height = 231
  Width = 366
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 40
  end
  object Transaction_Read: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 16
  end
  object Transaction_write: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 72
  end
  object DataSet_read: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 176
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_context: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 176
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DataSet_main: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 176
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DataSource_read: TDataSource
    DataSet = DataSet_read
    Left = 272
    Top = 16
  end
  object DataSource_context: TDataSource
    DataSet = DataSet_context
    Left = 272
    Top = 72
  end
  object DataSource_main: TDataSource
    DataSet = DataSet_main
    Left = 272
    Top = 128
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction_write
    Left = 80
    Top = 128
  end
end
