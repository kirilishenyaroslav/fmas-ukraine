object dmBonus: TdmBonus
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
  object BonusSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM ASUP_GET_BONUSES(:ID_PCARD)'
      'order by date_beg')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
    object BonusSelectNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 500
      EmptyStrToNull = True
    end
    object BonusSelectDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object BonusSelectID_MAN_BONUS: TFIBIntegerField
      FieldName = 'ID_MAN_BONUS'
    end
    object BonusSelectID_BONUS: TFIBIntegerField
      FieldName = 'ID_BONUS'
    end
    object BonusSelectIS_PERCENT: TFIBStringField
      FieldName = 'IS_PERCENT'
      Size = 1
      EmptyStrToNull = True
    end
    object BonusSelectPERCENT: TFIBFloatField
      FieldName = 'PERCENT'
    end
    object BonusSelectSUMMA: TFIBFloatField
      FieldName = 'SUMMA'
    end
    object BonusSelectID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object BonusSelectNAME_BONUS: TFIBStringField
      FieldName = 'NAME_BONUS'
      Size = 250
      EmptyStrToNull = True
    end
    object BonusSelectTHE_BONUS: TFIBStringField
      FieldName = 'THE_BONUS'
      Size = 255
      EmptyStrToNull = True
    end
    object BonusSelectTYPE_BONUS: TFIBStringField
      FieldName = 'TYPE_BONUS'
      Size = 50
      EmptyStrToNull = True
    end
    object BonusSelectDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object BonusSelectDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object BonusSelectPERIOD: TFIBStringField
      FieldName = 'PERIOD'
      Size = 35
      EmptyStrToNull = True
    end
    object BonusSelectID: TFIBIntegerField
      FieldName = 'ID'
    end
    object BonusSelectID_PARENT: TFIBIntegerField
      FieldName = 'ID_PARENT'
    end
    object BonusSelectALL_NAME: TFIBStringField
      FieldName = 'ALL_NAME'
      Size = 500
      EmptyStrToNull = True
    end
    object BonusSelectID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
  end
  object BonusSource: TDataSource
    DataSet = BonusSelect
    Left = 224
    Top = 8
  end
end
