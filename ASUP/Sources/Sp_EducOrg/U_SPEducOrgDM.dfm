object DM_SPEducOrg: TDM_SPEducOrg
  OldCreateOrder = False
  Left = 290
  Top = 216
  Height = 262
  Width = 369
  object FIBSpEducOrgDatabase: TpFIBDatabase
    DBName = 'D:\Klug\Database\full_db.ib'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba'
      'sql_role_name='
      'lc_ctype=win1251')
    DefaultTransaction = FIBSpEducOrgRT
    DefaultUpdateTransaction = FIBSpEducOrgWT
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object FIBSpEducOrgRT: TpFIBTransaction
    DefaultDatabase = FIBSpEducOrgDatabase
    TimeoutAction = TACommit
    Left = 128
    Top = 8
  end
  object FIBSpEducOrgWT: TpFIBTransaction
    DefaultDatabase = FIBSpEducOrgDatabase
    TimeoutAction = TACommit
    Left = 128
    Top = 64
  end
  object FIBDS_SelectOrg: TpFIBDataSet
    Database = FIBSpEducOrgDatabase
    Transaction = FIBSpEducOrgRT
    UpdateTransaction = FIBSpEducOrgWT
    SelectSQL.Strings = (
      'select * from ASUP_SP_EDUCORG_Select;')
    Left = 216
    Top = 8
    poSQLINT64ToBCD = True
    object FIBDS_SelectOrgID_ORG: TFIBIntegerField
      FieldName = 'ID_ORG'
    end
    object FIBDS_SelectOrgNAME_FULL: TFIBStringField
      FieldName = 'NAME_FULL'
      Size = 255
      EmptyStrToNull = True
    end
    object FIBDS_SelectOrgNAME_SHORT: TFIBStringField
      FieldName = 'NAME_SHORT'
      Size = 15
      EmptyStrToNull = True
    end
    object FIBDS_SelectOrgID_ADRESS: TFIBIntegerField
      FieldName = 'ID_ADRESS'
    end
    object FIBDS_SelectOrgAKREDITATION: TFIBIntegerField
      FieldName = 'AKREDITATION'
    end
    object FIBDS_SelectOrgIS_LEARNING: TFIBIntegerField
      FieldName = 'IS_LEARNING'
    end
    object FIBDS_SelectOrgIS_KVALIF: TFIBIntegerField
      FieldName = 'IS_KVALIF'
    end
    object FIBDS_SelectOrgID_TYPE: TFIBIntegerField
      FieldName = 'ID_TYPE'
    end
    object FIBDS_SelectOrgtype_name: TStringField
      FieldName = 'type_name'
      Size = 255
    end
  end
  object FIBQuery: TpFIBQuery
    Database = FIBSpEducOrgDatabase
    Transaction = FIBSpEducOrgWT
    Left = 216
    Top = 64
  end
end
