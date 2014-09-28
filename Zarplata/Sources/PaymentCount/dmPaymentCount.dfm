object MainDm: TMainDm
  OldCreateOrder = False
  Left = 449
  Top = 233
  Height = 445
  Width = 441
  object MainDatabase: TpFIBDatabase
    DBName = 'localhost:UniverActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password='
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 7
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 32
    Top = 71
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 144
    Top = 71
  end
  object CheckOrdersDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT O.NUM_ORDER,O.DATE_ORDER,O.NOTE,O.ID_ORDER,'
      'OT.NAME_TYPE '
      'FROM ORDERS O, ORDER_TYPE OT'
      'WHERE ID_STATUS=5'
      'AND   Z_SHOW_IN_ZP='#39'F'#39
      'AND    O.ID_ORDER_TYPE=OT.ID_ORDER_TYPE'
      '')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
    object CheckOrdersDataSetNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object CheckOrdersDataSetDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object CheckOrdersDataSetNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object CheckOrdersDataSetID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object CheckOrdersDataSetNAME_TYPE: TFIBStringField
      FieldName = 'NAME_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object GetMonthBoundsQuery: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      'SELECT  MONTH_BEG,MONTH_END '
      'FROM GET_MONTH_BOUNDS(:YEAR,:MONTH)')
    Transaction = ReadTransaction
    Left = 256
    Top = 8
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object ConvertQuery: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select kod_setup'
      'from z_convert_date_to_kod(:Date_In)')
    Left = 256
    Top = 79
    poSQLINT64ToBCD = True
    object ConvertQueryKOD_SETUP: TFIBIntegerField
      FieldName = 'KOD_SETUP'
    end
  end
  object GetCurPeriod: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      'SELECT YEAR_SET,MONTH_SET'
      'FROM   Z_SETUP')
    Transaction = ReadTransaction
    Left = 264
    Top = 135
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object PeopleDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select z.FAMILIA as OUT_FAMILIA,z.TN AS OUT_TN,'
      'Z.ID_MAN, z.date_beg, z.date_end, Z.KIND_OF_CHOOSE'
      'from Z_SPISOK_FOR_COUNT Z'
      'ORDER BY Z.TN')
    Left = 32
    Top = 207
    poSQLINT64ToBCD = True
  end
  object PeopleDataSource: TDataSource
    DataSet = PeopleDataSet
    Left = 128
    Top = 208
  end
  object UVProc: TpFIBStoredProc
    Database = MainDatabase
    Transaction = WriteTransaction
    Left = 272
    Top = 279
  end
  object GetGroupQuery: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      'SELECT  ID_GROUP_ACCOUNT'
      'FROM Z_GET_NEW_GROUP_ACCOUNT')
    Transaction = WriteTransaction
    Left = 32
    Top = 279
  end
  object ClearSpisokProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE Z_CLEAR_SPISOK_FOR_COUNT (?ID_MAN)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_CLEAR_SPISOK_FOR_COUNT'
    Left = 128
    Top = 280
  end
  object FillSpisokForCountQuery: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE Z_GET_SPISOK_FOR_COUNT_NEW (?DATE_BEG, ?DATE_E' +
        'ND, ?IN_ID_MAN, ?KOD_SETUP2, ?ID_DEPARTMENT, ?KIND_OF_CHOOSE, ?h' +
        'ol_date_beg, ?hol_date_end, ?id_vid_opl_prop)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_GET_SPISOK_FOR_COUNT_NEW'
    Left = 88
    Top = 128
  end
  object CountProc: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE Z_PAYMENT_COUNT_DNEPR (?PER_DATE_BEG, ?PER_DAT' +
        'E_END, ?NIGHT_PERCENT, ?ID_MAN, ?ID_GROUP_ACCOUNT, ?KOD_SETUP_1,' +
        ' ?KOD_SETUP_2, ?DO_INDEX, ?HOSPITAL_AVG_SUMM, ?HOSPITAL_IS_SMENA' +
        ',?PAYMENT_TYPE)')
    Transaction = WriteTransaction
    Left = 256
    Top = 216
  end
  object DeleteFromTableTmpQuery: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      'DELETE FROM DT_TABLE_TEMP')
    Transaction = WriteTransaction
    Left = 72
    Top = 344
  end
  object UniversalCountProc: TpFIBQuery
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE Z_PAYMENT_COUNT (?ID_MAN,  ?KOD_SETUP_3, ?PAYM' +
        'ENT_TYPE)')
    Transaction = WriteTransaction
    Left = 336
    Top = 216
  end
end
