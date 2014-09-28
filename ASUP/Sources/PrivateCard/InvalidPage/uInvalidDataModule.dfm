object dmInvalid: TdmInvalid
  OldCreateOrder = False
  Left = 564
  Top = 285
  Height = 198
  Width = 287
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
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
  object InvalidSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Get_PCard_Invalid(:Id_PCard)')
    AfterOpen = InvalidSelectAfterOpen
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
    object name_invalid: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1110#1085#1074#1072#1083#1110#1076#1085#1086#1089#1090#1110
      FieldName = 'name_invalid'
      Size = 255
      EmptyStrToNull = True
    end
    object InvalidSelectDATE_BEG: TFIBDateField
      DisplayLabel = #1047
      FieldName = 'DATE_BEG'
    end
    object InvalidSelectDATE_END: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATE_END'
    end
    object InvalidSelectid_invalid: TIntegerField
      FieldName = 'id_invalid'
    end
    object InvalidSelectINV_GROUP: TFIBIntegerField
      FieldName = 'INV_GROUP'
    end
    object InvalidSelectID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
    object InvalidSelectREASON_INV: TFIBStringField
      FieldName = 'REASON_INV'
      Size = 255
      EmptyStrToNull = True
    end
    object InvalidSelectNOM_INV: TFIBStringField
      FieldName = 'NOM_INV'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object InvalidSource: TDataSource
    DataSet = InvalidSelect
    Left = 224
    Top = 8
  end
  object DeleteQuery: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_DT_MAN_INVALID_Delete(:ID_pcard, :ID_INVA' +
        'LID, :DATE_BEG, :DATE_END);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 104
  end
  object InsertUpdate: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_DT_MAN_INVALID_INSERT (:ID_pcard, :ID_INV' +
        'ALID, :DATE_BEG, :DATE_END, :REASON_INV, :NOM_INV);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
  end
end
