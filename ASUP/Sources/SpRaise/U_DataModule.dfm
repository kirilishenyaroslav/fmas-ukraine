object DMod: TDMod
  OldCreateOrder = False
  Left = 271
  Top = 166
  Height = 262
  Width = 369
  object FIBDatabase: TpFIBDatabase
    DBName = 'E:\Work\database\_FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = FIBReadTransaction
    DefaultUpdateTransaction = FIBWriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object FIBDataSet: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select * from sp_raise_s(current_date) order by name;')
    AfterOpen = FIBDataSetAfterOpen
    AfterRefresh = FIBDataSetAfterOpen
    Left = 256
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FIBReadTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 112
    Top = 8
  end
  object FIBWriteTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 112
    Top = 64
  end
  object FIBQuery: TpFIBQuery
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    Left = 256
    Top = 64
  end
  object FIBDataSetHist: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    AfterOpen = FIBDataSetAfterOpen
    Left = 256
    Top = 112
    poSQLINT64ToBCD = True
  end
end
