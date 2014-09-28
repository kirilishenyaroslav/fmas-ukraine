object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 397
  Top = 196
  Height = 241
  Width = 280
  object Database: TpFIBDatabase
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
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object LoaderDataSet: TpFIBDataSet
    Database = Database
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
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 208
    Top = 16
  end
  object UpdateGroupQuery: TpFIBQuery
    Database = Database
    SQL.Strings = (
      'UPDATE UP_DT_REPORT_SP_REPORT '
      'SET NAME_GROUP=:NAME_GROUP'
      'WHERE ID_SP_REPORT=:ID_SP_REPORT')
    Transaction = WriteTransaction
    Left = 208
    Top = 88
  end
  object GroupsDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT DISTINCT NAME_GROUP'
      'FROM UP_DT_REPORT_SP_REPORT '
      'ORDER BY NAME_GROUP'
      '    '
      '')
    Left = 24
    Top = 152
    poSQLINT64ToBCD = True
  end
  object GroupsDataSource: TDataSource
    DataSet = GroupsDataSet
    Left = 136
    Top = 152
  end
end
