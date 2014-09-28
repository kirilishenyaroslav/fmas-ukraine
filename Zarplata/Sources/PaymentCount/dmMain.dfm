object MainDm: TMainDm
  OldCreateOrder = False
  Left = 287
  Top = 152
  Height = 381
  Width = 362
  object MainDatabase: TpFIBDatabase
    Connected = True
    DBName = 'localhost:DneprActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 7
  end
  object ReadTransaction: TpFIBTransaction
    Active = True
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 40
    Top = 71
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 200
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
    Left = 136
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
end
