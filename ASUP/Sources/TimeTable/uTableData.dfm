object TableData: TTableData
  OldCreateOrder = False
  Left = 321
  Top = 114
  Height = 163
  Width = 373
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'lc_ctype=WIN1251'
      'password=masterkey')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object MovingCheck: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM ASUP_TABLE_SIGN_CHECK(:Id_Man_Moving, :Month_Beg, ' +
        ':Month_End)')
    Left = 128
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 72
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
    Top = 72
  end
  object OrdersCheck: TRxMemoryData
    FieldDefs = <>
    Left = 216
    Top = 8
    object OrdersCheckId_Order: TIntegerField
      FieldName = 'Id_Order'
      Visible = False
    end
    object OrdersCheckNum_Order: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 30
      FieldName = 'Num_Order'
      Size = 10
    end
    object OrdersCheckNote: TStringField
      DisplayLabel = #1047#1084#1110#1089#1090
      FieldName = 'Note'
      Size = 255
    end
  end
  object OrdersCheckSource: TDataSource
    DataSet = OrdersCheck
    Left = 216
    Top = 72
  end
  object HalfTimeDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_TABLE_WORK_HALF_TIME_SEL(:Id_Man_Moving)')
    Left = 296
    Top = 8
    poSQLINT64ToBCD = True
    object HalfTimeDataSetID_TABLE_WORK_HALF_TIME: TFIBIntegerField
      FieldName = 'ID_TABLE_WORK_HALF_TIME'
      Visible = False
    end
    object HalfTimeDataSetDATE_BEG: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
      DisplayWidth = 30
      FieldName = 'DATE_BEG'
    end
    object HalfTimeDataSetDATE_END: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
      DisplayWidth = 30
      FieldName = 'DATE_END'
    end
    object HalfTimeDataSetHOURS_F: TFIBFloatField
      DisplayLabel = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085' '#1089#1082#1086#1088#1086#1095#1077#1085#1085#1103
      FieldName = 'HOURS_F'
    end
  end
  object HalfTimeSource: TDataSource
    DataSet = HalfTimeDataSet
    Left = 304
    Top = 72
  end
end
