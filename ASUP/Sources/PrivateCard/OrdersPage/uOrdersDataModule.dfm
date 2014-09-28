object dmOrders: TdmOrders
  OldCreateOrder = False
  Left = 393
  Top = 177
  Height = 198
  Width = 287
  object DB: TpFIBDatabase
    DBName = 'server1212:/data2/FMAS-Klug/DonNU/FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 56
  end
  object OrdersSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_GET_ORDERS(:ID_PCARD) ;')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
    object OrdersSelectNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 255
      EmptyStrToNull = True
    end
    object OrdersSelectDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object OrdersSelectNUM_PROJECT: TFIBStringField
      FieldName = 'NUM_PROJECT'
      Size = 255
      EmptyStrToNull = True
    end
    object OrdersSelectDATE_PROJECT: TFIBDateField
      FieldName = 'DATE_PROJECT'
    end
    object OrdersSelectNAME_TYPE: TFIBStringField
      FieldName = 'NAME_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object OrdersSource: TDataSource
    DataSet = OrdersSelect
    Left = 224
    Top = 8
  end
end
