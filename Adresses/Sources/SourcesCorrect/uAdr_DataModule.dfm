object AdrDM: TAdrDM
  OldCreateOrder = False
  Left = 325
  Top = 118
  Height = 441
  Width = 376
  object pFIBDB_Adr: TpFIBDatabase
    DBName = 'E:\FULL_DB.IB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba'
      'lc_ctype=win1251')
    DefaultTransaction = pFIBT_ReadAdr
    DefaultUpdateTransaction = pFIBT_WriteAdr
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object pFIBDS_SelectAdr: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'select * from ADR_ADRESS_MAIN_S(:id_adr_pk);')
    Left = 152
    Top = 8
    poSQLINT64ToBCD = True
    object pFIBDS_SelectAdrID_ADRESS: TFIBIntegerField
      FieldName = 'ID_ADRESS'
    end
    object pFIBDS_SelectAdrZIPCODE: TFIBStringField
      FieldName = 'ZIPCODE'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrID_CITY_AREA: TFIBIntegerField
      FieldName = 'ID_CITY_AREA'
    end
    object pFIBDS_SelectAdrID_STREET: TFIBIntegerField
      FieldName = 'ID_STREET'
    end
    object pFIBDS_SelectAdrKORPUS: TFIBStringField
      FieldName = 'KORPUS'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrHOUSE: TFIBStringField
      FieldName = 'HOUSE'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrFLAT: TFIBStringField
      FieldName = 'FLAT'
      Size = 5
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object pFIBDS_SelectAdrDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object pFIBDS_SelectAdrSTREET_NAME: TFIBStringField
      FieldName = 'STREET_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrPLACE_NAME: TFIBStringField
      FieldName = 'PLACE_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrCOUNTRY_NAME: TFIBStringField
      FieldName = 'COUNTRY_NAME'
      Size = 120
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrDISTRICT_NAME: TFIBStringField
      FieldName = 'DISTRICT_NAME'
      Size = 120
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrREGION_NAME: TFIBStringField
      FieldName = 'REGION_NAME'
      Size = 150
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrID_ADR_PK: TFIBIntegerField
      FieldName = 'ID_ADR_PK'
    end
    object pFIBDS_SelectAdrCAREA_NAME: TFIBStringField
      FieldName = 'CAREA_NAME'
      Size = 150
      EmptyStrToNull = True
    end
    object pFIBDS_SelectAdrFULL_NAME: TFIBStringField
      FieldName = 'FULL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object pFIBT_ReadAdr: TpFIBTransaction
    DefaultDatabase = pFIBDB_Adr
    TimeoutAction = TARollback
    Left = 24
    Top = 56
  end
  object pFIBT_WriteAdr: TpFIBTransaction
    DefaultDatabase = pFIBDB_Adr
    TimeoutAction = TARollback
    Left = 24
    Top = 104
  end
  object pFIBDS_SelectStreet: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_STREET,'
      '    NAME_STREET'
      'FROM'
      '    ADR_STREET_SELECT1'
      '    ('
      '    ?ID_PLACE'
      '    ) '
      'ORDER BY'
      '    NAME_STREET')
    DataSource = DSourcePlace
    OnFilterRecord = pFIBDS_SelectStreetFilterRecord
    Left = 152
    Top = 248
    poSQLINT64ToBCD = True
    object pFIBDS_SelectStreetID_STREET: TFIBIntegerField
      FieldName = 'ID_STREET'
    end
    object pFIBDS_SelectStreetNAME_STREET: TFIBStringField
      FieldName = 'NAME_STREET'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object pFIBDS_SelectPlace: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_PLACE,'
      '    NAME_PLACE,'
      '    IS_DISTRICT_CENTRE,'
      '    IS_REGIONAL_CENTRE,'
      '    IS_CAPITAL'
      'FROM'
      '    ADR_PLACE_SELECT'
      '    ('
      '    ?ID_REGION,'
      '    ?ID_DISTRICT'
      '    ) '
      'ORDER BY'
      '    NAME_PLACE')
    DataSource = DSourceRegion
    AfterOpen = pFIBDS_SelectPlaceAfterOpen
    AfterScroll = pFIBDS_SelectPlaceAfterScroll
    BeforeClose = pFIBDS_SelectPlaceBeforeClose
    OnFilterRecord = pFIBDS_SelectPlaceFilterRecord
    Left = 152
    Top = 200
    poSQLINT64ToBCD = True
    object pFIBDS_SelectPlaceID_PLACE: TFIBIntegerField
      FieldName = 'ID_PLACE'
    end
    object pFIBDS_SelectPlaceNAME_PLACE: TFIBStringField
      FieldName = 'NAME_PLACE'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDS_SelectPlaceIS_DISTRICT_CENTRE: TFIBStringField
      FieldName = 'IS_DISTRICT_CENTRE'
      Size = 1
      EmptyStrToNull = True
    end
    object pFIBDS_SelectPlaceIS_REGIONAL_CENTRE: TFIBStringField
      FieldName = 'IS_REGIONAL_CENTRE'
      Size = 1
      EmptyStrToNull = True
    end
    object pFIBDS_SelectPlaceIS_CAPITAL: TFIBStringField
      FieldName = 'IS_CAPITAL'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object pFIBQ_Delete: TpFIBQuery
    Database = pFIBDB_Adr
    Transaction = pFIBT_WriteAdr
    Left = 24
    Top = 208
  end
  object pFIBDS_Id: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'select * from ADR_ADRESS_SEL(:id_adress);')
    Left = 24
    Top = 152
    poSQLINT64ToBCD = True
    object pFIBDS_IdZIPCODE: TFIBStringField
      FieldName = 'ZIPCODE'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDS_IdID_CITY_AREA: TFIBIntegerField
      FieldName = 'ID_CITY_AREA'
    end
    object pFIBDS_IdID_STREET: TFIBIntegerField
      FieldName = 'ID_STREET'
    end
    object pFIBDS_IdKORPUS: TFIBStringField
      FieldName = 'KORPUS'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDS_IdHOUSE: TFIBStringField
      FieldName = 'HOUSE'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDS_IdFLAT: TFIBStringField
      FieldName = 'FLAT'
      Size = 5
      EmptyStrToNull = True
    end
    object pFIBDS_IdDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object pFIBDS_IdDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object pFIBDS_IdADRESS_NAME: TFIBStringField
      FieldName = 'ADRESS_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDS_IdID_ADR_PK: TFIBIntegerField
      FieldName = 'ID_ADR_PK'
    end
    object pFIBDS_IdNAME_CITY_AREA: TFIBStringField
      FieldName = 'NAME_CITY_AREA'
      Size = 120
      EmptyStrToNull = True
    end
    object pFIBDS_Idfull_name: TStringField
      FieldName = 'full_name'
      Size = 500
    end
    object pFIBDS_IdID_COUNTRY: TFIBIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object pFIBDS_IdID_REGION: TFIBIntegerField
      FieldName = 'ID_REGION'
    end
    object pFIBDS_IdID_DISTRICT: TFIBIntegerField
      FieldName = 'ID_DISTRICT'
    end
    object pFIBDS_IdID_PLACE: TFIBIntegerField
      FieldName = 'ID_PLACE'
    end
  end
  object pFIBDS_SelectCountry: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_COUNTRY,'
      '    NAME_COUNTRY'
      'FROM'
      '    ADR_COUNTRY_SELECT ')
    AfterOpen = pFIBDS_SelectCountryAfterOpen
    AfterScroll = pFIBDS_SelectCountryAfterScroll
    BeforeClose = pFIBDS_SelectCountryBeforeClose
    OnFilterRecord = pFIBDS_SelectCountryFilterRecord
    Left = 152
    Top = 56
    poSQLINT64ToBCD = True
    object pFIBDS_SelectCountryID_COUNTRY: TFIBIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object pFIBDS_SelectCountryNAME_COUNTRY: TFIBStringField
      FieldName = 'NAME_COUNTRY'
      Size = 120
      EmptyStrToNull = True
    end
  end
  object DSourceStreet: TDataSource
    DataSet = pFIBDS_SelectStreet
    Left = 256
    Top = 248
  end
  object DSourceRegion: TDataSource
    DataSet = pFIBDS_SelectRegion
    Left = 256
    Top = 104
  end
  object DSourcePlace: TDataSource
    DataSet = pFIBDS_SelectPlace
    Left = 256
    Top = 200
  end
  object DSourceDistrict: TDataSource
    DataSet = pFIBDS_SelectDistrict
    Left = 256
    Top = 152
  end
  object DSourceCountry: TDataSource
    DataSet = pFIBDS_SelectCountry
    Left = 256
    Top = 56
  end
  object pFIBDS_SelectRegion: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_REGION,'
      '    NAME_REGION'
      'FROM'
      '    ADR_REGION_SELECT'
      '    ('
      '    ?ID_COUNTRY'
      '    ) '
      'ORDER BY'
      '    NAME_REGION')
    DataSource = DSourceCountry
    AfterOpen = pFIBDS_SelectRegionAfterOpen
    BeforeClose = pFIBDS_SelectRegionBeforeClose
    OnFilterRecord = pFIBDS_SelectRegionFilterRecord
    Left = 152
    Top = 104
    poSQLINT64ToBCD = True
    object pFIBDS_SelectRegionID_REGION: TFIBIntegerField
      FieldName = 'ID_REGION'
    end
    object pFIBDS_SelectRegionNAME_REGION: TFIBStringField
      FieldName = 'NAME_REGION'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object pFIBDS_SelectDistrict: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_DISTRICT,'
      '    NAME_DISTRICT'
      'FROM'
      '    ADR_DISTRICT_SELECT'
      '    ('
      '    ?ID_REGION'
      '    ) '
      'ORDER BY'
      '    NAME_DISTRICT')
    DataSource = DSourceRegion
    OnFilterRecord = pFIBDS_SelectDistrictFilterRecord
    Left = 152
    Top = 152
    poSQLINT64ToBCD = True
    object pFIBDS_SelectDistrictID_DISTRICT: TFIBIntegerField
      FieldName = 'ID_DISTRICT'
    end
    object pFIBDS_SelectDistrictNAME_DISTRICT: TFIBStringField
      FieldName = 'NAME_DISTRICT'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object pFIBDS_SelectArea: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_CITY_AREA,'
      '    NAME_CITY_AREA'
      'FROM'
      '    ADR_CITY_AREA_SELECT'
      '    ('
      '    ?ID_PLACE'
      '    ) '
      'ORDER BY'
      '    NAME_CITY_AREA')
    DataSource = DSourcePlace
    Left = 152
    Top = 304
    poSQLINT64ToBCD = True
    object pFIBDS_SelectAreaID_CITY_AREA: TFIBIntegerField
      FieldName = 'ID_CITY_AREA'
    end
    object pFIBDS_SelectAreaNAME_CITY_AREA: TFIBStringField
      FieldName = 'NAME_CITY_AREA'
      Size = 120
      EmptyStrToNull = True
    end
  end
  object DSourceArea: TDataSource
    DataSet = pFIBDS_SelectArea
    Left = 256
    Top = 304
  end
  object DSetSearch: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_COUNTRY,'
      '    NAME_COUNTRY,'
      '    ID_REGION,'
      '    NAME_REGION,'
      '    ID_DISTRICT,'
      '    NAME_DISTRICT,'
      '    ID_PLACE,'
      '    NAME_PLACE,'
      '    ID_STREET,'
      '    NAME_STREET'
      'FROM'
      '    ADR_GET_BY_ZIP'
      '    ('
      '    ?ZIP'
      '    ) ')
    Left = 24
    Top = 312
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object StProcAddress: TpFIBStoredProc
    Database = pFIBDB_Adr
    Transaction = pFIBT_WriteAdr
    Left = 24
    Top = 264
  end
  object DSetPlace: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'SELECT'
      '    ID_COUNTRY,'
      '    NAME_COUNTRY,'
      '    ID_REGION,'
      '    NAME_REGION,'
      '    ID_DISTRICT,'
      '    NAME_DISTRICT,'
      '    ID_PLACE,'
      '    NAME_PLACE,'
      '    IS_DISTRICT_CENTRE,'
      '    IS_REGIONAL_CENTRE,'
      '    IS_CAPITAL,'
      '    FULL_NAME'
      'FROM'
      '    ADR_GET_BY_ID_PLACE'
      '    ('
      '    ?IN_ID_PLACE'
      '    ) ')
    Left = 24
    Top = 360
    poSQLINT64ToBCD = True
  end
end
