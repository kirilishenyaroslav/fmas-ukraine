object DM: TDM
  OldCreateOrder = False
  Left = 326
  Top = 259
  Height = 200
  Width = 331
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 147
    Top = 8
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 43
    Top = 64
  end
  object LocalDatabase: TpFIBDatabase
    DBName = 'E:\Gala\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=tpfibdataset'
      'sql_role_name=')
    DefaultTransaction = LocalReadTransaction
    DefaultUpdateTransaction = LocalWriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 43
    Top = 8
  end
  object pFIBQ_Rnd: TpFIBQuery
    Database = LocalDatabase
    SQL.Strings = (
      'execute procedure ASUP_ORDER_PREMIA_RND(:ID_ORDER_GROUP,:RND);')
    Transaction = LocalWriteTransaction
    Left = 152
    Top = 56
  end
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    Left = 40
    Top = 112
    poSQLINT64ToBCD = True
  end
  object pFIBQ_Recalc: TpFIBQuery
    Database = LocalDatabase
    SQL.Strings = (
      
        'execute procedure ASUP_ORDER_PREMIA_RECALC(:ID_ORDER_GROUP,:SUMM' +
        'A_RECALC);')
    Transaction = LocalWriteTransaction
    Left = 152
    Top = 112
  end
  object InputQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      
        'select * from ASUP_ORDERS_SELECT2(:FILTER_DATE_BEG, :FILTER_DATE' +
        '_END,:ID_PCARD, :FILTER_SHOW_DELETED);')
    Left = 251
    Top = 8
    poSQLINT64ToBCD = True
    object InputQueryID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object InputQueryNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQueryDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object InputQueryNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQueryID_STATUS: TFIBIntegerField
      FieldName = 'ID_STATUS'
    end
    object InputQueryEXEC_DATETIME: TFIBDateTimeField
      FieldName = 'EXEC_DATETIME'
    end
    object InputQueryPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQueryINTRO: TFIBStringField
      FieldName = 'INTRO'
      Size = 4096
      EmptyStrToNull = True
    end
    object InputQueryISPOLNITEL: TFIBStringField
      FieldName = 'ISPOLNITEL'
      Size = 50
      EmptyStrToNull = True
    end
    object InputQueryOWNER_ID_USER: TFIBIntegerField
      FieldName = 'OWNER_ID_USER'
    end
    object InputQueryNUM_ORDER_KADR: TFIBStringField
      FieldName = 'NUM_ORDER_KADR'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQueryNUM_ORDER_INTERNAL: TFIBStringField
      FieldName = 'NUM_ORDER_INTERNAL'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQueryNAME_STATUS: TFIBStringField
      FieldName = 'NAME_STATUS'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQueryDATE_ORDER_KADR: TFIBDateField
      FieldName = 'DATE_ORDER_KADR'
    end
    object InputQueryOWNER_FIO: TFIBStringField
      FieldName = 'OWNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object InputQuerySUMMA_ALL: TFIBFloatField
      FieldName = 'SUMMA_ALL'
    end
  end
  object DoneQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    SelectSQL.Strings = (
      'select * from ORDERS'
      'where id_order_group = :id_order_group'
      'order by group_num_item')
    Left = 251
    Top = 56
    poSQLINT64ToBCD = True
    object DoneQueryID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object DoneQueryID_ORDER_TYPE: TFIBIntegerField
      FieldName = 'ID_ORDER_TYPE'
    end
    object DoneQueryID_STATUS: TFIBIntegerField
      FieldName = 'ID_STATUS'
    end
    object DoneQueryNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object DoneQueryDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object DoneQueryNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object OutputQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 251
    Top = 112
  end
end
