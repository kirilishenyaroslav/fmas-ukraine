object MainDataModule: TMainDataModule
  OldCreateOrder = False
  Left = 562
  Top = 427
  Height = 281
  Width = 462
  object MainDatabase: TpFIBDatabase
    DBName = 'localhost:DneprActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TACommit
    Left = 160
  end
  object DataSource: TDataSource
    DataSet = OrdersListDataSet
    Left = 32
    Top = 192
  end
  object OrdersListDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SQLScreenCursor = crHourGlass
    SelectSQL.Strings = (
      'select'
      #9'EXEC_DATETIME,'
      #9'ID_ORDER,'
      #9'ID_ORDER_TYPE,'
      #9'ID_STATUS,'
      #9'NUM_ORDER,'
      #9'NAME_TYPE,'
      #9'DATE_ORDER,'
      #9'NOTE,'
      #9'NAME_STATUS,'
      #9'STANDART_ACTION,'
      #9'YOUR_SIGN_STATUS,'
      #9'PRINT_NAME,'
      #9'INTRO'
      'from GET_ORDERS(-1,?ID_PCARD,-1,-1,'
      '?FILTER_BEG,?FILTER_END) G'
      'where not ID_ORDER in (SELECT ID_ORDER FROM'
      'Z_ORDERS_REESTR)'
      'and    G.ID_ORDER in (SELECT ID_ORDER FROM ORDERS O'
      'WHERE O.ID_ORDER=G.ID_ORDER AND O.Z_SHOW_IN_ZP='#39'T'#39')'
      ' ')
    Left = 32
    Top = 64
    poSQLINT64ToBCD = True
    object OrdersListDataSetEXEC_DATETIME: TFIBDateTimeField
      FieldName = 'EXEC_DATETIME'
    end
    object OrdersListDataSetID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object OrdersListDataSetID_ORDER_TYPE: TFIBIntegerField
      FieldName = 'ID_ORDER_TYPE'
    end
    object OrdersListDataSetID_STATUS: TFIBIntegerField
      FieldName = 'ID_STATUS'
    end
    object OrdersListDataSetNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object OrdersListDataSetNAME_TYPE: TFIBStringField
      FieldName = 'NAME_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object OrdersListDataSetDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object OrdersListDataSetNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object OrdersListDataSetNAME_STATUS: TFIBStringField
      FieldName = 'NAME_STATUS'
      Size = 50
      EmptyStrToNull = True
    end
    object OrdersListDataSetSTANDART_ACTION: TFIBIntegerField
      FieldName = 'STANDART_ACTION'
    end
    object OrdersListDataSetYOUR_SIGN_STATUS: TFIBIntegerField
      FieldName = 'YOUR_SIGN_STATUS'
    end
    object OrdersListDataSetPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object OrdersListDataSetINTRO: TFIBStringField
      FieldName = 'INTRO'
      Size = 4096
      EmptyStrToNull = True
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 280
  end
  object OrderInsertProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE Z_ORDERS_REESTR_INSERT (?ID_ORDER)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_ORDERS_REESTR_INSERT'
    Left = 32
    Top = 128
  end
  object AcceptedOrdersDataSet: TpFIBDataSet
    SQLScreenCursor = crHourGlass
    SelectSQL.Strings = (
      'select'
      #9'EXEC_DATETIME,'
      #9'O.ID_ORDER,'
      #9'ID_ORDER_TYPE,'
      #9'ID_STATUS,'
      #9'NUM_ORDER,'
      #9'NAME_TYPE,'
      #9'DATE_ORDER,'
      #9'NOTE,'
      #9'NAME_STATUS,'
      #9'STANDART_ACTION,'
      #9'YOUR_SIGN_STATUS,'
      #9'PRINT_NAME,'
      #9'INTRO'
      'from GET_ORDERS(-1,?ID_PCARD,-1,-1,'
      '?FILTER_BEG,?FILTER_END) O, Z_ORDERS_REESTR Z'
      'where  O.ID_ORDER=Z.ID_ORDER ')
    Left = 160
    Top = 64
    poSQLINT64ToBCD = True
    object AcceptedOrdersDataSetEXEC_DATETIME: TFIBDateTimeField
      FieldName = 'EXEC_DATETIME'
    end
    object AcceptedOrdersDataSetID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object AcceptedOrdersDataSetID_ORDER_TYPE: TFIBIntegerField
      FieldName = 'ID_ORDER_TYPE'
    end
    object AcceptedOrdersDataSetID_STATUS: TFIBIntegerField
      FieldName = 'ID_STATUS'
    end
    object AcceptedOrdersDataSetNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object AcceptedOrdersDataSetNAME_TYPE: TFIBStringField
      FieldName = 'NAME_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptedOrdersDataSetDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object AcceptedOrdersDataSetNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptedOrdersDataSetNAME_STATUS: TFIBStringField
      FieldName = 'NAME_STATUS'
      Size = 50
      EmptyStrToNull = True
    end
    object AcceptedOrdersDataSetSTANDART_ACTION: TFIBIntegerField
      FieldName = 'STANDART_ACTION'
    end
    object AcceptedOrdersDataSetYOUR_SIGN_STATUS: TFIBIntegerField
      FieldName = 'YOUR_SIGN_STATUS'
    end
    object AcceptedOrdersDataSetPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptedOrdersDataSetINTRO: TFIBStringField
      FieldName = 'INTRO'
      Size = 4096
      EmptyStrToNull = True
    end
  end
  object OrderDeleteProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE Z_ORDERS_REESTR_DELETE (?ID_ORDER)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_ORDERS_REESTR_DELETE'
    Left = 160
    Top = 128
  end
  object GetIdPCardDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT FIRST(1) ID_PCARD'
      'FROM PRIVATE_CARDS'
      'WHERE ID_MAN=?ID_MAN')
    Left = 272
    Top = 128
    poSQLINT64ToBCD = True
    object GetIdPCardDataSetID_PCARD: TFIBIntegerField
      FieldName = 'ID_PCARD'
    end
  end
  object MovingsCreateProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE ASUP_Z_MOVING_CREATE (?ID_SESSION, ?PERIOD_BEG' +
        ', ?PERIOD_END)')
    Transaction = WriteTransaction
    StoredProcName = 'ASUP_Z_MOVING_CREATE'
    Left = 160
    Top = 192
  end
  object BonusCreateProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE ASUP_Z_BONUS_CREATE (?ID_SESSION, ?PERIOD_BEG,' +
        ' ?PERIOD_END)')
    Transaction = WriteTransaction
    StoredProcName = 'ASUP_Z_BONUS_CREATE'
    Left = 272
    Top = 192
  end
end
