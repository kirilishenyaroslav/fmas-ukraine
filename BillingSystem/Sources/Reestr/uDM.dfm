object frmReestr_DM: TfrmReestr_DM
  OldCreateOrder = False
  Left = 1023
  Top = 166
  Height = 256
  Width = 340
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 64
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SQLScreenCursor = crHourGlass
    Left = 182
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    AutoEdit = False
    DataSet = DataSet
    Left = 270
    Top = 96
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 264
    Top = 40
  end
  object ReadDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SQLScreenCursor = crHourGlass
    Left = 182
    Top = 64
    poSQLINT64ToBCD = True
  end
end
