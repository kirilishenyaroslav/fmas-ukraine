object Data: TData
  OldCreateOrder = False
  Left = 357
  Top = 257
  Height = 231
  Width = 388
  object DB: TpFIBDatabase
    DBName = 'E:\'#1056#1072#1073#1086#1090#1072' '#1059#1085#1080#1074#1077#1088'\'#1048#1089#1093#1086#1076#1085#1099#1077' '#1082#1086#1076#1099'\FMAS-WIN\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 32
  end
  object SelectOrder: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAN_HOLIDAY_ORDER_SELECT '
      ' (:filter_date_beg, '
      '  :filter_date_end'
      '  )'
      'order by date_order')
    Left = 136
    Top = 32
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 96
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 96
  end
end
