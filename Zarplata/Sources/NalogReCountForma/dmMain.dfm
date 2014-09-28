object MainDM: TMainDM
  OldCreateOrder = False
  Left = 881
  Top = 597
  Height = 336
  Width = 399
  object MainDatabase: TpFIBDatabase
    DBName = 'F:\Count\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 16
  end
  object SpravkiDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT'#9'*'
      'FROM Z_NALOG_FORMA_TMP'
      'ORDER BY ID_MAN,TN,KOD_SETUP')
    Left = 168
    Top = 208
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = SpravkiDataSet
    Left = 112
    Top = 80
  end
  object PrepareDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_NALOG_REESTR_CREATE(?YEAR_SET,?MONTH_BEG,'
      '?MONTH_END)')
    Left = 168
    Top = 144
    poSQLINT64ToBCD = True
    object PrepareDataSetKOD_BEG: TFIBIntegerField
      FieldName = 'KOD_BEG'
    end
    object PrepareDataSetKOD_END: TFIBIntegerField
      FieldName = 'KOD_END'
    end
    object PrepareDataSetID_REESTR: TFIBIntegerField
      FieldName = 'ID_REESTR'
    end
  end
  object CreateSpravkiProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE Z_CREATE_NALOG_FORMA (?ID_MAN, ?KOD_BEG, ?KOD_' +
        'END, ?ID_REESTR)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_CREATE_NALOG_FORMA'
    Left = 40
    Top = 152
  end
  object PeopleDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = Transaction
    Left = 256
    Top = 144
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 224
    Top = 16
  end
  object PeopleDataSource: TDataSource
    DataSet = PeopleDataSet
    Left = 208
    Top = 80
  end
  object ClearQuery: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      'DELETE FROM Z_NALOG_FORMA_TMP')
    Transaction = WriteTransaction
    Left = 40
    Top = 208
  end
end
