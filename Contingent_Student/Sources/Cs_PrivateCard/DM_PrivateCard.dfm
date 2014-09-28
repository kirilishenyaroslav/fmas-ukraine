object DM: TDM
  OldCreateOrder = False
  Left = 512
  Top = 380
  Height = 228
  Width = 395
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 80
  end
  object DataSourceOrders: TDataSource
    DataSet = DataSetOrders
    Left = 302
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 8
    Top = 80
  end
  object DataSetOrders: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSetPeople: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 192
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DataSourcePeople: TDataSource
    DataSet = DataSetPeople
    Left = 294
    Top = 88
  end
  object DSPassData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_PAS_DATA,'
      '    ID_MAN,'
      '    NUMBER,'
      '    SERIA,'
      '    DATE_BEG,'
      '    DATE_END,'
      '    VIDAN,'
      '    FAMILIA,'
      '    IMYA,'
      '    OTCHESTVO,'
      '    RUS_FAMILIA,'
      '    RUS_IMYA,'
      '    RUS_OTCHESTVO,'
      '    ID_PASS_TYPE,'
      '    FIO'
      'FROM'
      '    PASS_DATA_GET_BY_ID_MAN'
      '    ('
      '    ?IN_ID_MAN,'
      '    ?CURRENT_ONLY'
      '    ) ')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 28
    Top = 135
    poSQLINT64ToBCD = True
  end
  object PassDataSourse: TDataSource
    DataSet = DSPassData
    Left = 106
    Top = 134
  end
end
