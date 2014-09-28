object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 830
  Top = 385
  Height = 319
  Width = 348
  object DB: TpFIBDatabase
    DBName = 'D:\DB\Buhg\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    UserKindTransaction = 'read'
    Left = 40
    Top = 56
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    SelectSQL.Strings = (
      '')
    Left = 40
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 40
    Top = 168
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    UserKindTransaction = 'write'
    Left = 120
    Top = 56
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = DB
    Transaction = WTransaction
    Left = 120
    Top = 113
  end
  object DataSource2: TDataSource
    Left = 120
    Top = 224
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 120
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DataSource3: TDataSource
    DataSet = pFIBDataSet3
    Left = 208
    Top = 168
  end
  object pFIBDataSet3: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    SelectSQL.Strings = (
      '')
    DataSource = DataSource1
    Left = 208
    Top = 112
    poSQLINT64ToBCD = True
  end
end
