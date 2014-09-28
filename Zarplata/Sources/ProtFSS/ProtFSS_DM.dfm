object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 817
  Top = 258
  Height = 277
  Width = 463
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 272
    Top = 64
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 384
    Top = 64
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 9
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 385
    Top = 9
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Private\San\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 7
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 64
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 176
    Top = 64
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 176
    Top = 8
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 64
    Top = 120
  end
  object DSetList: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 384
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DSourseList: TDataSource
    DataSet = DSetList
    Left = 272
    Top = 120
  end
  object DSourceHospList: TDataSource
    DataSet = DSetHospList
    Left = 272
    Top = 176
  end
  object DSetHospList: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 384
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DSetExport1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 113
    Top = 169
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSetExport2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 161
    Top = 145
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DataSetAlg: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    IS_SMENA,'
      '    AVG_SUM,'
      '    IS_HANDS,'
      '    HOSP_DATE'
      'FROM'
      '    Z_PAYMENT_COUNT_AVG_HOSP'
      '    ('
      '    146112'
      '    ) ')
    Left = 120
    Top = 24
    poSQLINT64ToBCD = True
  end
end
