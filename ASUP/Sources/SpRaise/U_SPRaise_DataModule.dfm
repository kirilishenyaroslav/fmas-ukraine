object DMSPRaise: TDMSPRaise
  OldCreateOrder = False
  Left = 311
  Top = 178
  Height = 325
  Width = 345
  object FIBDatabase: TpFIBDatabase
    DBName = 'd:\programming\database\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = FIBReadTransaction
    DefaultUpdateTransaction = FIBWriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object FIBDataSet: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    AfterOpen = FIBDataSetAfterOpen
    AfterRefresh = FIBDataSetAfterOpen
    Left = 136
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FIBReadTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 40
    Top = 64
  end
  object FIBWriteTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 40
    Top = 120
  end
  object FIBQuery: TpFIBQuery
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    Left = 136
    Top = 64
  end
  object FIBDataSetHist: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    AfterOpen = FIBDataSetAfterOpen
    Left = 136
    Top = 120
    poSQLINT64ToBCD = True
  end
  object AbsorbeDataSet: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select * from UP_DT_ABSORBE_GROUP')
    Left = 216
    Top = 8
    poSQLINT64ToBCD = True
  end
  object AbsorbeDataSource: TDataSource
    DataSet = AbsorbeDataSet
    Left = 216
    Top = 64
  end
  object CalcTypeDSet: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    Left = 216
    Top = 120
    poSQLINT64ToBCD = True
  end
end
