object dmMovings: TdmMovings
  OldCreateOrder = False
  Left = 444
  Top = 164
  Height = 198
  Width = 287
  object DB: TpFIBDatabase
    DBName = '127.0.0.1:D:/Bases/Test/Test.IB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba'
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 24
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 64
  end
  object MovingsSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT'#9'* FROM Asup_Get_PCard_Movings2(:Id_PCard,:act_date,:selec' +
        't_type);')
    Left = 136
    Top = 16
    poSQLINT64ToBCD = True
    object MovingsSelectDEPARTMENT_NAME: TFIBStringField
      FieldName = 'DEPARTMENT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object MovingsSelectPOST_NAME: TFIBStringField
      FieldName = 'POST_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object MovingsSelectSMETA_NAME: TFIBStringField
      FieldName = 'SMETA_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object MovingsSelectKOL_STAVOK: TFIBFloatField
      FieldName = 'KOL_STAVOK'
      DisplayFormat = '########0.000'
    end
    object MovingsSelectOKLAD: TFIBFloatField
      FieldName = 'OKLAD'
    end
    object MovingsSelectDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object MovingsSelectDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object MovingsSelectPERIOD: TFIBStringField
      FieldName = 'PERIOD'
      Size = 255
      EmptyStrToNull = True
    end
    object MovingsSelectNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object MovingsSelectDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object MovingsSelectID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
    object MovingsSelectID: TFIBIntegerField
      FieldName = 'ID'
    end
    object MovingsSelectID_PARENT: TFIBIntegerField
      FieldName = 'ID_PARENT'
    end
    object MovingsSelectALL_NAME: TFIBStringField
      FieldName = 'ALL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object MovingsSelectTYPE_PERS: TFIBStringField
      FieldName = 'TYPE_PERS'
      Size = 50
      EmptyStrToNull = True
    end
    object MovingsSelectNAME_SOVMEST: TFIBStringField
      FieldName = 'NAME_SOVMEST'
      Size = 255
      EmptyStrToNull = True
    end
    object MovingsSelectIS_MAIN_POST: TFIBStringField
      FieldName = 'IS_MAIN_POST'
      Size = 1
      EmptyStrToNull = True
    end
    object MovingsSelectSTD: TFIBStringField
      FieldName = 'STD'
      Size = 35
      EmptyStrToNull = True
    end
  end
  object MovingsSource: TDataSource
    DataSet = MovingsSelect
    Left = 216
    Top = 24
  end
  object BonusSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = DefaultTransaction
    SelectSQL.Strings = (
      'select * from ASUP_MAN_BONUS_SELECT_BY_MOV2(:id_man_moving)')
    Left = 216
    Top = 80
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
    object BonusSelectid_man_bonus_smet: TIntegerField
      FieldName = 'id_man_bonus_smet'
    end
  end
  object pFIBDS_Format: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select stavki_disp_format from ini_asup_consts;')
    Left = 136
    Top = 112
    poSQLINT64ToBCD = True
    object pFIBDS_FormatSTAVKI_DISP_FORMAT: TFIBStringField
      FieldName = 'STAVKI_DISP_FORMAT'
      Size = 25
      EmptyStrToNull = True
    end
  end
end
