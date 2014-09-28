object DMMainPaymentType: TDMMainPaymentType
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 871
  Top = 423
  Height = 385
  Width = 409
  object MainDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 38
    Top = 149
    poSQLINT64ToBCD = True
  end
  object MainDataSource: TDataSource
    DataSet = MainDataSet
    Left = 39
    Top = 213
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 129
    Top = 85
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 33
    Top = 85
  end
  object WorkDatabase: TpFIBDatabase
    DBName = ':'
    DBParams.Strings = (
      ''
      'user_name='
      'password='
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 25
    Top = 13
  end
  object StoredProc: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 128
    Top = 152
  end
end
