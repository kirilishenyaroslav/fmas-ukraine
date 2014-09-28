object DM: TDM
  OldCreateOrder = False
  Left = 563
  Top = 283
  Height = 254
  Width = 344
  object Db: TpFIBDatabase
    DBParams.Strings = (
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Db
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object LoaderDataSet: TpFIBDataSet
    Database = Db
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_REPORT,'
      '    NAME_BPL,'
      '    NAME_REPORT,'
      '    NAME_GROUP,'
      '    NAME_FR3,'
      'GROUP_NUMBER'
      'FROM'
      '    UP_DT_REPORT_SP_REPORT '
      'ORDER BY NAME_GROUP,NAME_REPORT ')
    Left = 24
    Top = 88
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = LoaderDataSet
    Left = 112
    Top = 88
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Db
    TimeoutAction = TARollback
    Left = 208
    Top = 16
  end
  object UpdateGroupQuery: TpFIBQuery
    Database = Db
    SQL.Strings = (
      'UPDATE UP_DT_REPORT_SP_REPORT '
      'SET NAME_GROUP=:NAME_GROUP'
      'WHERE ID_SP_REPORT=:ID_SP_REPORT')
    Transaction = WriteTransaction
    Left = 208
    Top = 88
  end
end
