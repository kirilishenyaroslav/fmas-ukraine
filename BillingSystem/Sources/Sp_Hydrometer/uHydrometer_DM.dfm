object dmHydrometer_DM: TdmHydrometer_DM
  OldCreateOrder = False
  Left = 430
  Top = 33
  Height = 729
  Width = 824
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 56
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
    Left = 150
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 238
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 304
    Top = 16
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
    Left = 150
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DataSource_Read: TDataSource
    DataSet = ReadDataSet
    Left = 238
    Top = 56
  end
  object KodInputDS: TDataSource
    DataSet = KodInputDSet
    Left = 100
    Top = 161
  end
  object HydrTypeDS: TDataSource
    DataSet = HydrTypeDSet
    Left = 99
    Top = 208
  end
  object HydrVidDS: TDataSource
    DataSet = HydrVidDSet
    Left = 100
    Top = 254
  end
  object ServiceDS: TDataSource
    DataSet = ServiceDSet
    Left = 102
    Top = 303
  end
  object InvNumberDS: TDataSource
    DataSet = InvNumberDSet
    Left = 102
    Top = 352
  end
  object InitStateDS: TDataSource
    DataSet = InitStateDSet
    Left = 102
    Top = 400
  end
  object NomerTUDS: TDataSource
    DataSet = NomerTUDSet
    Left = 102
    Top = 448
  end
  object RegionDS: TDataSource
    DataSet = RegionDSet
    Left = 270
    Top = 408
  end
  object CityAreaDS: TDataSource
    DataSet = CityAreaDSet
    Left = 270
    Top = 456
  end
  object StreetDS: TDataSource
    DataSet = StreetDSet
    Left = 270
    Top = 504
  end
  object TypeStreetDS: TDataSource
    DataSet = TypeStreetDSet
    Left = 270
    Top = 552
  end
  object TempDSet: TpFIBDataSet
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
    Left = 150
    Top = 104
    poSQLINT64ToBCD = True
  end
  object LocationDS: TDataSource
    DataSet = LocationDSet
    Left = 270
    Top = 208
  end
  object CustServDS: TDataSource
    DataSet = CustServDSet
    Left = 270
    Top = 360
  end
  object KodCustServDS: TDataSource
    DataSet = KodCustServDSet
    Left = 270
    Top = 308
  end
  object StateDS: TDataSource
    DataSet = StateDSet
    Left = 102
    Top = 496
  end
  object LastStateDS: TDataSource
    DataSet = LastSateDSet
    Left = 102
    Top = 544
  end
  object CustomerSetDS: TDataSource
    DataSet = CustomerSetDSet
    Left = 270
    Top = 160
  end
  object TypeCustServDS: TDataSource
    DataSet = TypeCustServDSet
    Left = 270
    Top = 256
  end
  object OwnerDS: TDataSource
    DataSet = OwnerDSet
    Left = 270
    Top = 600
  end
  object KodInputDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 160
    poSQLINT64ToBCD = True
  end
  object HydrTypeDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 208
    poSQLINT64ToBCD = True
  end
  object HydrVidDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 255
    poSQLINT64ToBCD = True
  end
  object ServiceDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 303
    poSQLINT64ToBCD = True
  end
  object InvNumberDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 352
    poSQLINT64ToBCD = True
  end
  object InitStateDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 400
    poSQLINT64ToBCD = True
  end
  object NomerTUDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 448
    poSQLINT64ToBCD = True
  end
  object StateDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 496
    poSQLINT64ToBCD = True
  end
  object CustomerSetDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 180
    Top = 160
    poSQLINT64ToBCD = True
  end
  object LastSateDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 544
    poSQLINT64ToBCD = True
  end
  object LocationDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 181
    Top = 208
    poSQLINT64ToBCD = True
  end
  object TypeCustServDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 182
    Top = 256
    poSQLINT64ToBCD = True
  end
  object KodCustServDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 182
    Top = 307
    poSQLINT64ToBCD = True
  end
  object CustServDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 184
    Top = 360
    poSQLINT64ToBCD = True
  end
  object RegionDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 184
    Top = 408
    poSQLINT64ToBCD = True
  end
  object CityAreaDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 184
    Top = 456
    poSQLINT64ToBCD = True
  end
  object StreetDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 184
    Top = 504
    poSQLINT64ToBCD = True
  end
  object TypeStreetDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 184
    Top = 552
    poSQLINT64ToBCD = True
  end
  object OwnerDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 185
    Top = 600
    poSQLINT64ToBCD = True
  end
end
