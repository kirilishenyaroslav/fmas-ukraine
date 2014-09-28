object DMSPPost: TDMSPPost
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 506
  Top = 301
  Height = 465
  Width = 625
  object FIBDatabase: TpFIBDatabase
    DBName = 'D:\Work\Database\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = FIBReadTransaction
    DefaultUpdateTransaction = FIBWriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object FIBDS_SPPost: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select * from sp_post_univer_select(:id_category,:actdate);')
    FilterOptions = [foCaseInsensitive]
    AfterOpen = FIBDS_SPPostAfterOpen
    AfterScroll = FIBDS_SPPostAfterScroll
    AfterRefresh = FIBDS_SPPostAfterOpen
    Left = 256
    Top = 8
    poSQLINT64ToBCD = True
    object FIBDS_SPPostPOST_CODE: TFIBStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'POST_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object FIBDS_SPPostNAME_POST: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME_POST'
      Size = 100
      EmptyStrToNull = True
    end
    object FIBDS_SPPostADDITIONAL: TFIBStringField
      DisplayLabel = #1044#1086#1076#1072#1090#1086#1082
      FieldName = 'ADDITIONAL'
      Size = 255
      EmptyStrToNull = True
    end
    object FIBDS_SPPostID_POST: TFIBIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object FIBDS_SPPostNOT_DIGIT: TFIBStringField
      FieldName = 'NOT_DIGIT'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object FIBDS_SPPostDISPLAY_ORDER: TFIBIntegerField
      FieldName = 'DISPLAY_ORDER'
      Visible = False
    end
    object FIBDS_SPPostID_POST_CATEGORY: TFIBIntegerField
      FieldName = 'ID_POST_CATEGORY'
      Visible = False
    end
    object FIBDS_SPPostDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
      Visible = False
    end
    object FIBDS_SPPostDATE_END: TFIBDateField
      FieldName = 'DATE_END'
      Visible = False
    end
    object FIBDS_SPPostID_GROUP: TFIBIntegerField
      FieldName = 'ID_GROUP'
      Visible = False
    end
    object FIBDS_SPPostNAME_GROUP: TFIBStringField
      FieldName = 'NAME_GROUP'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
  end
  object FIBReadTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 40
    Top = 64
  end
  object FIBWriteTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 144
    Top = 64
  end
  object FIBQuery: TpFIBQuery
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    Left = 144
    Top = 8
  end
  object FIBDS_Insert: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    Left = 152
    Top = 136
    poSQLINT64ToBCD = True
  end
  object FIBDS_SPCategory: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select * from sp_category_select'
      'order by display_order')
    AfterScroll = FIBDS_SPCategoryAfterScroll
    Left = 256
    Top = 56
    poSQLINT64ToBCD = True
  end
  object FIBDS_SPTypePost: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select * from sp_type_post_select(:ID_post);')
    Left = 256
    Top = 104
    poSQLINT64ToBCD = True
  end
  object pFIBDS_GetSession: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select ret_value from Pub_Get_Id_By_Gen('#39'GEN_exch_sp_psr_ID'#39', 1)')
    Left = 40
    Top = 136
    poSQLINT64ToBCD = True
  end
  object RefSalarySelect: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Base_Salary_Select(:Cur_Date)')
    Left = 256
    Top = 168
    poSQLINT64ToBCD = True
    object RefSalarySelectID_POST_BASE_SALARY: TIntegerField
      FieldName = 'ID_POST_BASE_SALARY'
      Visible = False
    end
    object RefSalarySelectBASE_SALARY_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1087#1086#1089#1072#1076#1080
      DisplayWidth = 100
      FieldName = 'BASE_SALARY_NAME'
      Size = 255
    end
    object RefSalarySelectBASE_OKLAD: TFloatField
      DisplayLabel = #1041#1072#1079#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      DisplayWidth = 20
      FieldName = 'BASE_OKLAD'
      Precision = 9
    end
    object RefSalarySelectuse_digit: TIntegerField
      FieldName = 'USE_DIGIT'
      Visible = False
    end
  end
  object DigitSalary: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_BASE_SALARY_BY_DIGIT(:Num_Digit, :Cur_Date)')
    Left = 448
    Top = 208
    poSQLINT64ToBCD = True
  end
  object PubSysData: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    SelectSQL.Strings = (
      'SELECT *  FROM Pub_Sys_Data')
    Left = 376
    Top = 152
    poSQLINT64ToBCD = True
  end
  object HolidayLongQuery: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SP_POST_HOLIDAY_S_ALL')
    Left = 88
    Top = 200
    poSQLINT64ToBCD = True
    object HolidayLongQueryID_POST_HOLIDAY: TFIBIntegerField
      FieldName = 'ID_POST_HOLIDAY'
    end
    object HolidayLongQueryHOLIDAY_LONG: TFIBIntegerField
      FieldName = 'HOLIDAY_LONG'
    end
    object HolidayLongQueryID_HOLIDAY: TFIBBCDField
      FieldName = 'ID_HOLIDAY'
      Size = 0
      RoundByScale = True
    end
    object HolidayLongQueryHOLIDAY_TYPE_FULL_NAME: TFIBStringField
      FieldName = 'HOLIDAY_TYPE_FULL_NAME'
      Size = 4096
      EmptyStrToNull = True
    end
  end
  object HolidayLong: TDataSource
    DataSet = HolidayLongQuery
    Left = 176
    Top = 200
  end
  object HolidayType: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT Id_Type_Holiday, Full_Name  FROM  HL_SP_TYPE_HOLIDAY')
    Left = 328
    Top = 208
    poSQLINT64ToBCD = True
    object HolidayTypeID_TYPE_HOLIDAY: TFIBBCDField
      FieldName = 'ID_TYPE_HOLIDAY'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object HolidayTypeFULL_NAME: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      FieldName = 'FULL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SpGroupDS: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_SP_POST_GROUP_SELECT_ALL')
    Left = 464
    Top = 72
    poSQLINT64ToBCD = True
    object SpGroupDSID_POST_GROUP: TFIBIntegerField
      FieldName = 'ID_POST_GROUP'
      Visible = False
    end
    object SpGroupDSNAME_POST_GROUP: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1075#1088#1091#1087#1080
      FieldName = 'NAME_POST_GROUP'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object GroupDataSource: TDataSource
    DataSet = SpGroupDS
    Left = 464
    Top = 128
  end
  object PostSource: TDataSource
    DataSet = FIBDS_SPPost
    Left = 336
    Top = 8
  end
  object IntegrityDS: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      '')
    Left = 60
    Top = 260
    poSQLINT64ToBCD = True
    object IntegrityDSID: TFIBIntegerField
      DisplayLabel = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088
      DisplayWidth = 150
      FieldName = 'ID'
    end
    object IntegrityDSNAME_TABLE: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1090#1072#1073#1083#1080#1094#1110
      FieldName = 'NAME_TABLE'
      Size = 255
      EmptyStrToNull = True
    end
    object IntegrityDSNAME_TABLE_USER: TFIBStringField
      DisplayLabel = #1044#1072#1085#1110
      FieldName = 'NAME_TABLE_USER'
      Size = 255
      EmptyStrToNull = True
    end
    object IntegrityDSERROR_STRING: TFIBStringField
      DisplayLabel = #1055#1086#1084#1080#1083#1082#1072
      FieldName = 'ERROR_STRING'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SpPostAfterEdit: TpFIBQuery
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE UP_SP_POST_AFTER_EDIT :Id_Post')
    Transaction = FIBWriteTransaction
    Left = 184
    Top = 312
  end
  object DigitsSelect: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_POST_DIGITS_S'
      'ORDER BY Num_Digit, Date_Beg, Date_End')
    Left = 444
    Top = 330
    poSQLINT64ToBCD = True
  end
  object TarifSelect: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_POST_TARIFS_S'
      'ORDER BY Num_Category, Date_Beg, Date_End')
    Left = 380
    Top = 340
    poSQLINT64ToBCD = True
  end
  object TarifSalary: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_BASE_SALARY_BY_TARIF(:Id_Category_tarif, :Cur_D' +
        'ate)')
    Left = 528
    Top = 208
    poSQLINT64ToBCD = True
  end
  object StProInsertLog: TpFIBStoredProc
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    Left = 32
    Top = 320
  end
end
