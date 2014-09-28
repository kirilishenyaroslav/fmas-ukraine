object DM_kr_db: TDM_kr_db
  OldCreateOrder = False
  Left = 411
  Top = 214
  Height = 246
  Width = 358
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 64
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_DOG_ROOT,'
      '    ID_DOG_LAST,'
      '    ID_SMET,'
      '    ID_FACUL,'
      '    ID_SPEC,'
      '    ID_NATIONAL,'
      '    ID_FORM_STUD,'
      '    ID_KAT_STUD,'
      '    ID_GROUP,'
      '    FIO,'
      '    KURS,'
      '    NUM_DOG,'
      '    SUMMA,'
      '    ISCOLLECT,'
      '    ISMAINDOG,'
      '    ISDISSDOG,'
      '    DATE_DOG,'
      '    DATE_BEG,'
      '    DATE_END,'
      '    DATE_DISS,'
      '    USE_BEG,'
      '    USE_END,'
      '    NAME_NAZIONAL,'
      '    NAME_FORM_STUD,'
      '    NAME_KAT_STUD,'
      '    NAME_FACUL,'
      '    NAME_SPEC,'
      '    NAME_GROUP'
      'FROM'
      '    CN_DT_DOG_ROOT_SELECT ')
    Left = 182
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 270
    Top = 96
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 264
    Top = 40
  end
  object ReadDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_DOG_ROOT,'
      '    ID_DOG_LAST,'
      '    ID_SMET,'
      '    ID_FACUL,'
      '    ID_SPEC,'
      '    ID_NATIONAL,'
      '    ID_FORM_STUD,'
      '    ID_KAT_STUD,'
      '    ID_GROUP,'
      '    FIO,'
      '    KURS,'
      '    NUM_DOG,'
      '    SUMMA,'
      '    ISCOLLECT,'
      '    ISMAINDOG,'
      '    ISDISSDOG,'
      '    DATE_DOG,'
      '    DATE_BEG,'
      '    DATE_END,'
      '    DATE_DISS,'
      '    USE_BEG,'
      '    USE_END,'
      '    NAME_NAZIONAL,'
      '    NAME_FORM_STUD,'
      '    NAME_KAT_STUD,'
      '    NAME_FACUL,'
      '    NAME_SPEC,'
      '    NAME_GROUP'
      'FROM'
      '    CN_DT_DOG_ROOT_SELECT ')
    Left = 182
    Top = 64
    poSQLINT64ToBCD = True
  end
end
