object DmAdr: TDmAdr
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 271
  Top = 116
  Height = 449
  Width = 618
  object AdrTransWrite: TpFIBTransaction
    DefaultDatabase = AdrDB
    TimeoutAction = TARollback
    Left = 66
    Top = 8
  end
  object StreetSet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    DataSource = PlaceSource
    Left = 24
    Top = 64
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object AdrDB: TpFIBDatabase
    DefaultTransaction = AdrTransRead
    DefaultUpdateTransaction = AdrTransWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 10
    Top = 8
  end
  object AdrTransRead: TpFIBTransaction
    DefaultDatabase = AdrDB
    TimeoutAction = TARollback
    Left = 138
    Top = 8
  end
  object StoredProc: TpFIBStoredProc
    Database = AdrDB
    Transaction = AdrTransRead
    Left = 202
    Top = 8
  end
  object StreetSorce: TDataSource
    DataSet = StreetSet
    Left = 80
    Top = 64
  end
  object PlaceSet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    DataSource = RegionSource
    AfterOpen = PlaceSetAfterOpen
    BeforeClose = PlaceSetBeforeClose
    Left = 24
    Top = 120
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DistrictSet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    DataSource = RegionSource
    Left = 24
    Top = 176
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object RegionSet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    DataSource = CountrySource
    AfterOpen = RegionSetAfterOpen
    BeforeClose = RegionSetBeforeClose
    Left = 24
    Top = 232
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object CountrySet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    AfterOpen = CountrySetAfterOpen
    BeforeClose = CountrySetBeforeClose
    Left = 24
    Top = 288
    poSQLINT64ToBCD = True
  end
  object PlaceSource: TDataSource
    DataSet = PlaceSet
    Left = 80
    Top = 120
  end
  object DistrictSource: TDataSource
    DataSet = DistrictSet
    Left = 88
    Top = 176
  end
  object RegionSource: TDataSource
    DataSet = RegionSet
    Left = 88
    Top = 232
  end
  object CountrySource: TDataSource
    DataSet = CountrySet
    Left = 88
    Top = 288
  end
  object DSetConst: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    Left = 144
    Top = 64
    poSQLINT64ToBCD = True
  end
  object CityAreaSet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    DataSource = PlaceSource
    Left = 24
    Top = 344
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object CityAreaSource: TDataSource
    DataSet = CityAreaSet
    Left = 88
    Top = 344
  end
  object AdresSet: TpFIBDataSet
    Database = AdrDB
    Transaction = AdrTransRead
    UpdateTransaction = AdrTransWrite
    Left = 152
    Top = 120
    poSQLINT64ToBCD = True
  end
end
