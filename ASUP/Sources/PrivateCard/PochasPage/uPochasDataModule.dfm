object dmPochas: TdmPochas
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
  object PochasSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from ASUP_DT_MAN_POCHAS_SELECT(:ID_PCARD) ')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
    object PochasSelectID: TFIBIntegerField
      FieldName = 'ID'
    end
    object PochasSelectID_PARENT: TFIBIntegerField
      FieldName = 'ID_PARENT'
    end
    object PochasSelectDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object PochasSelectDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object PochasSelectKOL_HOURS: TFIBBCDField
      FieldName = 'KOL_HOURS'
      Size = 2
      RoundByScale = True
    end
    object PochasSelectNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object PochasSelectREASON: TFIBStringField
      FieldName = 'REASON'
      Size = 255
      EmptyStrToNull = True
    end
    object PochasSelectSMETA_NAME: TFIBStringField
      FieldName = 'SMETA_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object PochasSelectDATE_AKT: TFIBDateField
      FieldName = 'DATE_AKT'
    end
    object PochasSelectNUM_AKT: TFIBStringField
      FieldName = 'NUM_AKT'
      Size = 255
      EmptyStrToNull = True
    end
    object PochasSelectNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object PochasSelectDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object PochasSelectTARIF_TYPE_NAME: TFIBStringField
      FieldName = 'TARIF_TYPE_NAME'
      Size = 4096
      EmptyStrToNull = True
    end
  end
end
