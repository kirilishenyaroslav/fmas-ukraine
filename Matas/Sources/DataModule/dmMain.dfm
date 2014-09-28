object dmMatas: TdmMatas
  OldCreateOrder = False
  Left = 310
  Top = 211
  Height = 285
  Width = 362
  object fdbMatas: TpFIBDatabase
    DBName = 'localhost:'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = ftrReadTransaction
    DefaultUpdateTransaction = ftrWriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
    Top = 16
  end
  object ftrReadTransaction: TpFIBTransaction
    DefaultDatabase = fdbMatas
    TimeoutAction = TACommit
    Left = 48
    Top = 72
  end
  object ftrWriteTransaction: TpFIBTransaction
    DefaultDatabase = fdbMatas
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 48
    Top = 128
  end
  object IniDataSet: TpFIBDataSet
    Database = fdbMatas
    Transaction = ftrReadTransaction
    UpdateTransaction = ftrWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_INI')
    Left = 48
    Top = 184
    poSQLINT64ToBCD = True
    object IniDataSetDATE_REC: TFIBDateField
      FieldName = 'DATE_REC'
    end
    object IniDataSetID_MAT_DEP_PROP: TFIBIntegerField
      FieldName = 'ID_MAT_DEP_PROP'
    end
    object IniDataSetID_SKL_DEP_PROP: TFIBIntegerField
      FieldName = 'ID_SKL_DEP_PROP'
    end
    object IniDataSetSHOW_EXCEPTIONS: TFIBBooleanField
      FieldName = 'SHOW_EXCEPTIONS'
    end
    object IniDataSetDATE_OST_REC: TFIBDateField
      FieldName = 'DATE_OST_REC'
    end
    object IniDataSetMAX_DEP_DATE: TFIBDateField
      FieldName = 'MAX_DEP_DATE'
    end
    object IniDataSetMAT_ID_SYSTEM: TFIBIntegerField
      FieldName = 'MAT_ID_SYSTEM'
    end
    object IniDataSetUSE_DEFAULT_ISTFIN: TFIBBooleanField
      FieldName = 'USE_DEFAULT_ISTFIN'
    end
    object IniDataSetTYPE_ACCOUNT: TFIBSmallIntField
      FieldName = 'TYPE_ACCOUNT'
    end
    object IniDataSetID_DEP_ROOT: TFIBBCDField
      FieldName = 'ID_DEP_ROOT'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetID_SCH_ROOT: TFIBBCDField
      FieldName = 'ID_SCH_ROOT'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetBEG_DATE_REC: TFIBDateField
      FieldName = 'BEG_DATE_REC'
    end
    object IniDataSetTYPE_SUB_SCH: TFIBSmallIntField
      FieldName = 'TYPE_SUB_SCH'
    end
    object IniDataSetSCH_IN_DOC: TFIBBooleanField
      FieldName = 'SCH_IN_DOC'
    end
    object IniDataSetSCH_PROP_IZNOS: TFIBBCDField
      FieldName = 'SCH_PROP_IZNOS'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetSCH_PROP_MOL: TFIBBCDField
      FieldName = 'SCH_PROP_MOL'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetSCH_PROP_SKLAD: TFIBBCDField
      FieldName = 'SCH_PROP_SKLAD'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetSCH_PROP_OS: TFIBBCDField
      FieldName = 'SCH_PROP_OS'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetSCH_PROP_MNA: TFIBBCDField
      FieldName = 'SCH_PROP_MNA'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetSCH_PROP_MAT: TFIBBCDField
      FieldName = 'SCH_PROP_MAT'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetGROUP_DOG_SELECT: TFIBBCDField
      FieldName = 'GROUP_DOG_SELECT'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetGROUP_DOG_ADD: TFIBBCDField
      FieldName = 'GROUP_DOG_ADD'
      Size = 0
      RoundByScale = True
    end
    object IniDataSetMNA_INV_ACC: TFIBIntegerField
      FieldName = 'MNA_INV_ACC'
    end
    object IniDataSetMBP_INV_ACC: TFIBIntegerField
      FieldName = 'MBP_INV_ACC'
    end
  end
  object MatasStoredProc: TpFIBStoredProc
    Database = fdbMatas
    SQL.Strings = (
      'EXECUTE PROCEDURE MAT_INI_UPDATE (?NEW_DATE_REC)')
    Transaction = ftrWriteTransaction
    StoredProcName = 'MAT_INI_UPDATE'
    Left = 128
    Top = 16
  end
  object SetDataSet: TpFIBDataSet
    Database = fdbMatas
    Transaction = ftrReadTransaction
    UpdateTransaction = ftrWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_SETUP')
    Left = 120
    Top = 184
    poSQLINT64ToBCD = True
    object SetDataSetSYSTEM_LANG: TFIBIntegerField
      FieldName = 'SYSTEM_LANG'
    end
    object SetDataSetSAVE_USER_PARAMS: TFIBBooleanField
      FieldName = 'SAVE_USER_PARAMS'
    end
    object SetDataSetSAVE_HISTORY: TFIBIntegerField
      FieldName = 'SAVE_HISTORY'
    end
    object SetDataSetSAVE_OWNER: TFIBIntegerField
      FieldName = 'SAVE_OWNER'
    end
    object SetDataSetPRINT_LANG: TFIBIntegerField
      FieldName = 'PRINT_LANG'
    end
    object SetDataSetPRINT_ON_PRINTER: TFIBBooleanField
      FieldName = 'PRINT_ON_PRINTER'
    end
    object SetDataSetEDIT_TEMPLATE: TFIBBooleanField
      FieldName = 'EDIT_TEMPLATE'
    end
    object SetDataSetPOS_MODAL_WINDOW: TFIBBooleanField
      FieldName = 'POS_MODAL_WINDOW'
    end
    object SetDataSetCLOSE_WINDOW_ESC: TFIBBooleanField
      FieldName = 'CLOSE_WINDOW_ESC'
    end
    object SetDataSetSAVE_GROUP: TFIBBooleanField
      FieldName = 'SAVE_GROUP'
    end
    object SetDataSetUPPER_KOD: TFIBBooleanField
      FieldName = 'UPPER_KOD'
    end
    object SetDataSetUPPER_SHORT_NAME: TFIBBooleanField
      FieldName = 'UPPER_SHORT_NAME'
    end
    object SetDataSetUPPER_NAME: TFIBBooleanField
      FieldName = 'UPPER_NAME'
    end
    object SetDataSetUPPER_DOC_NUMBER: TFIBBooleanField
      FieldName = 'UPPER_DOC_NUMBER'
    end
    object SetDataSetALLOW_EDIT_OWNER: TFIBBooleanField
      FieldName = 'ALLOW_EDIT_OWNER'
    end
    object SetDataSetSET_DATE_DOC: TFIBIntegerField
      FieldName = 'SET_DATE_DOC'
    end
    object SetDataSetALLOW_DUP_NUMBER: TFIBBooleanField
      FieldName = 'ALLOW_DUP_NUMBER'
    end
    object SetDataSetAUTO_DOC_NUMBER: TFIBBooleanField
      FieldName = 'AUTO_DOC_NUMBER'
    end
    object SetDataSetID: TFIBIntegerField
      FieldName = 'ID'
    end
  end
end
