object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 304
  Top = 198
  Height = 358
  Width = 352
  object Database: TpFIBDatabase
    DBName = 'localhost:UniverActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
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
    Left = 96
    Top = 16
  end
  object LoaderDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'ASUP_REPORTS_MODULES.ID_REPORT,'
      #9'ASUP_REPORTS_MODULES.PACKAGE_NAME,'
      #9'ASUP_REPORTS_MODULES.REPORT_TITLE,'
      '        ASUP_REPORTS_MODULES.REPORT_GROUP'
      ''
      'FROM ASUP_REPORTS_MODULES')
    Left = 24
    Top = 88
    poSQLINT64ToBCD = True
    object LoaderDataSetID_REPORT: TFIBIntegerField
      FieldName = 'ID_REPORT'
    end
    object LoaderDataSetPACKAGE_NAME: TFIBStringField
      FieldName = 'PACKAGE_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object LoaderDataSetREPORT_TITLE: TFIBStringField
      FieldName = 'REPORT_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object LoaderDataSetREPORT_GROUP: TFIBStringField
      FieldName = 'REPORT_GROUP'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DataSource: TDataSource
    DataSet = LoaderDataSet
    Left = 96
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
      'UPDATE ASUP_REPORTS_MODULES'
      'SET REPORT_GROUP=:REPORT_GROUP'
      'WHERE ID_REPORT=:ID_REPORT')
    Transaction = WriteTransaction
    Left = 208
    Top = 88
  end
  object GroupsDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT DISTINCT REPORT_GROUP'
      'FROM ASUP_REPORTS_MODULES'
      'ORDER BY REPORT_GROUP'
      '')
    Left = 24
    Top = 152
    poSQLINT64ToBCD = True
    object GroupsDataSetREPORT_GROUP: TFIBStringField
      FieldName = 'REPORT_GROUP'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object GroupsDataSource: TDataSource
    DataSet = GroupsDataSet
    Left = 128
    Top = 152
  end
end
