object MainDM: TMainDM
  OldCreateOrder = False
  Left = 337
  Top = 192
  Height = 428
  Width = 246
  object Database: TpFIBDatabase
    Connected = True
    DBName = 'localhost:UniverActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    Active = True
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object ReportDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object ReportDataSource: TDataSource
    DataSet = ReportDataSet
    Left = 128
    Top = 72
  end
  object NationalityDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'ASUP_SP_NATIONALITY.ID_NATIONALITY,'
      #9'ASUP_SP_NATIONALITY.NAME_NATIONALITY'
      'FROM ASUP_SP_NATIONALITY')
    Left = 24
    Top = 128
    poSQLINT64ToBCD = True
    object NationalityDataSetID_NATIONALITY: TFIBIntegerField
      FieldName = 'ID_NATIONALITY'
    end
    object NationalityDataSetNAME_NATIONALITY: TFIBStringField
      FieldName = 'NAME_NATIONALITY'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object NationalityDataSource: TDataSource
    DataSet = NationalityDataSet
    Left = 128
    Top = 136
  end
end
