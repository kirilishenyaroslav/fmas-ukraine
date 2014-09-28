object DM_Calc: TDM_Calc
  OldCreateOrder = False
  Left = 620
  Top = 274
  Height = 246
  Width = 358
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
    Left = 96
    Top = 64
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_FACUL_SPEC,'
      '    ID_SPEC,'
      '    CODE_SPEC,'
      '    NAME'
      'FROM'
      '    CN_JN_FACUL_SPEC_SELECT'
      '    ('
      '    ?ID_FACUL'
      '    ) ')
    Left = 182
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 262
    Top = 72
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 264
    Top = 16
  end
  object ReadDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 182
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DataSourceRead: TDataSource
    DataSet = ReadDataSet
    Left = 256
    Top = 128
  end
end
