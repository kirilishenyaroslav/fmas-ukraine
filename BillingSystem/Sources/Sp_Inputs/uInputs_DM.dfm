object Inputs_DM: TInputs_DM
  OldCreateOrder = False
  Left = 533
  Top = 130
  Height = 587
  Width = 709
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
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
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 368
    Top = 48
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
  object DataSource_Read: TDataSource
    DataSet = ReadDataSet
    Left = 278
    Top = 64
  end
  object KodInputDS: TDataSource
    DataSet = KodInputDSet
    Left = 278
    Top = 128
  end
  object InputParentDS: TDataSource
    DataSet = InputParentDSet
    Left = 278
    Top = 176
  end
  object PercentPayDS: TDataSource
    DataSet = PercentPayDSet
    Left = 278
    Top = 224
  end
  object TnEngineerDS: TDataSource
    DataSet = TnEngineerDSet
    Left = 278
    Top = 278
  end
  object TypeCustServDS: TDataSource
    DataSet = TypeCustServDSet
    Left = 278
    Top = 328
  end
  object CustServDS: TDataSource
    DataSet = CustServDSet
    Left = 278
    Top = 384
  end
  object KodCustServDS: TDataSource
    DataSet = KodCustServDSet
    Left = 278
    Top = 432
  end
  object RegionDS: TDataSource
    DataSet = RegionDSet
    Left = 462
    Top = 128
  end
  object CityAreaDS: TDataSource
    DataSet = CityAreaDSet
    Left = 462
    Top = 175
  end
  object TypeStreetDS: TDataSource
    DataSet = TypeStreetDSet
    Left = 462
    Top = 222
  end
  object StreetDS: TDataSource
    DataSet = StreetDSet
    Left = 462
    Top = 275
  end
  object DomDS: TDataSource
    DataSet = DomDSet
    Left = 462
    Top = 326
  end
  object DataSet_context: TpFIBDataSet
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
    Left = 30
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DataSet_TreeList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DataSource_TreeList: TDataSource
    DataSet = DataSet_TreeList
    Left = 40
    Top = 264
  end
  object KodInputDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 128
    poSQLINT64ToBCD = True
  end
  object InputParentDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 176
    poSQLINT64ToBCD = True
  end
  object PercentPayDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 224
    poSQLINT64ToBCD = True
  end
  object TnEngineerDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 272
    poSQLINT64ToBCD = True
  end
  object TypeCustServDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 326
    poSQLINT64ToBCD = True
  end
  object CustServDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 384
    poSQLINT64ToBCD = True
  end
  object KodCustServDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 433
    poSQLINT64ToBCD = True
  end
  object RegionDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 386
    Top = 128
    poSQLINT64ToBCD = True
  end
  object CityAreaDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 389
    Top = 176
    poSQLINT64ToBCD = True
  end
  object TypeStreetDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 390
    Top = 224
    poSQLINT64ToBCD = True
  end
  object StreetDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 391
    Top = 278
    poSQLINT64ToBCD = True
  end
  object DomDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 392
    Top = 328
    poSQLINT64ToBCD = True
  end
  object TempDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 392
    Top = 384
    poSQLINT64ToBCD = True
  end
  object ConstsDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 440
    Top = 16
    poSQLINT64ToBCD = True
  end
end
