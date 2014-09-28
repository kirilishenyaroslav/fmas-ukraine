object dmPCard: TdmPCard
  OldCreateOrder = False
  Left = 421
  Top = 323
  Height = 186
  Width = 239
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 16
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 80
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
    Top = 80
  end
  object PCardModules: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    UpdateTransaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_MODULES'
      'WHERE PARENT_NAME = '#39'PCARD_DETAILS'#39
      'order by id_order')
    Left = 128
    Top = 16
    poSQLINT64ToBCD = True
  end
end
