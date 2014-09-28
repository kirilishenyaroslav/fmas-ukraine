object DatesAcc2Dm: TDatesAcc2Dm
  OldCreateOrder = False
  Left = 321
  Top = 131
  Height = 320
  Width = 643
  object MainDatabase: TpFIBDatabase
    DBName = 'localhost:UniverActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password='
      'sql_role_name=')
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 7
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 120
    Top = 71
  end
  object DSet1: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    Left = 32
    Top = 136
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 32
    Top = 208
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 32
    Top = 71
  end
  object FillSpisokForCountQuery: TpFIBStoredProc
    Database = MainDatabase
    Transaction = WriteTransaction
    Left = 120
    Top = 136
  end
  object QClean: TpFIBQuery
    Database = MainDatabase
    Transaction = WriteTransaction
    Left = 216
    Top = 135
  end
  object SProcRaschet: TpFIBStoredProc
    Database = MainDatabase
    Transaction = WriteTransaction
    Left = 344
    Top = 136
  end
  object DSet2: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    DataSource = DSource1
    Left = 424
    Top = 136
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 424
    Top = 208
  end
  object DSet3: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    DataSource = DSource2
    Left = 488
    Top = 136
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 488
    Top = 208
  end
  object DSet5: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    DataSource = DSource2
    Left = 552
    Top = 136
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSource5: TDataSource
    DataSet = DSet5
    Left = 552
    Top = 208
  end
  object SProcDelete: TpFIBStoredProc
    Database = MainDatabase
    Transaction = WriteTransaction
    Left = 272
    Top = 136
  end
  object QGen: TpFIBQuery
    Database = MainDatabase
    Transaction = WriteTransaction
    Left = 216
    Top = 191
  end
end
