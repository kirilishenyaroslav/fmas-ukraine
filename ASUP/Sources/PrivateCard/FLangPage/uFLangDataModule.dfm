object dmFLang: TdmFLang
  OldCreateOrder = False
  Left = 409
  Top = 249
  Height = 230
  Width = 304
  object DB: TpFIBDatabase
    DBName = 'D:\Programming\Database\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey')
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
  object FLangSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_MAN_FLANG,'
      '    ID_MAN,'
      '    ID_FLANG,'
      '    ID_FLANG_DEGREE,'
      '    NAME_FLANG,'
      '    NAME_DEGREE'
      'FROM'
      '    ASUP_MAN_FLANG_S'
      '    (:ID_PCARD) ')
    AfterOpen = FLangSelectAfterOpen
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FLangSource: TDataSource
    DataSet = FLangSelect
    Left = 224
    Top = 8
  end
  object DeleteQuery: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure ASUP_MAN_FLang_D(:id_man_flang);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 104
  end
  object InsertUpdate: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_MAN_FLang_Iu (:ID_MAN_FLANG,:ID_PCARD,:ID' +
        '_FLANG,:ID_FLANG_DEGREE)')
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
  end
  object pFIBDS_IsShow: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select use_kadry_language from ini_asup_consts;')
    Left = 224
    Top = 56
    poSQLINT64ToBCD = True
  end
  object pFIBDS_OldLang: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select * from ASUP_MAN_OLD_LANG_SEL(:id_pcard);')
    Left = 224
    Top = 104
    poSQLINT64ToBCD = True
    object pFIBDS_OldLangLANG: TFIBStringField
      FieldName = 'LANG'
      Size = 255
      EmptyStrToNull = True
    end
  end
end
