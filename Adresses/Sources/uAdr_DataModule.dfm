object AdrDM: TAdrDM
  OldCreateOrder = False
  Left = 717
  Top = 126
  Height = 339
  Width = 335
  object pFIBDB_Adr: TpFIBDatabase
    DBName = 'fmas'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba')
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
      'select * from ADR_STREET_SELECT(:id_place);')
    Left = 152
    Top = 56
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
  object pFIBDS_SelectRegion: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'select * from ADR_REGION_SELECT(:id_country);')
    AfterScroll = pFIBDS_SelectRegionAfterScroll
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
  object pFIBDS_SelectPlace: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'select * from ADR_PLACE_SELECT(:id_region,:id_district);')
    AfterScroll = pFIBDS_SelectPlaceAfterScroll
    Left = 152
    Top = 152
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
  object pFIBDS_SelectDistrict: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'select * from ADR_DISTRICT_SELECT(:id_region);')
    AfterScroll = pFIBDS_SelectDistrictAfterScroll
    Left = 152
    Top = 200
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
  object pFIBQ_Delete: TpFIBQuery
    Database = pFIBDB_Adr
    Transaction = pFIBT_WriteAdr
    Left = 248
    Top = 8
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
  end
  object pFIBDS_SelectCountry: TpFIBDataSet
    Database = pFIBDB_Adr
    Transaction = pFIBT_ReadAdr
    UpdateTransaction = pFIBT_WriteAdr
    SelectSQL.Strings = (
      'select * from adr_country;')
    AfterScroll = pFIBDS_SelectCountryAfterScroll
    Left = 152
    Top = 248
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
end
