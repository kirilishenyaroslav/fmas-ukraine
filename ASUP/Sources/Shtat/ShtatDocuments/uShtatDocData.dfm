object dmShtatDoc: TdmShtatDoc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 546
  Top = 121
  Height = 382
  Width = 527
  object DB: TpFIBDatabase
    DBName = 'd:\Work\Database\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 16
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 41
    Top = 72
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 16
  end
  object ShtatDocSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Dt_SR_Select')
    Left = 224
    Top = 72
    poSQLINT64ToBCD = True
    object ShtatDocSelectID_SR: TFIBIntegerField
      FieldName = 'ID_SR'
      Visible = False
    end
    object ShtatDocSelectNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091
      DisplayWidth = 100
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatDocSelectDATE_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082
      FieldName = 'DATE_BEG'
    end
    object ShtatDocSelectDATE_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100
      FieldName = 'DATE_END'
    end
    object ShtatDocSelectIS_PLAN: TFIBStringField
      FieldName = 'IS_PLAN'
      Visible = False
      Size = 3
      EmptyStrToNull = True
    end
    object ShtatDocSelectIS_PROD: TFIBStringField
      FieldName = 'IS_PROD'
      Visible = False
      Size = 3
      EmptyStrToNull = True
    end
    object ShtatDocSelectID_TAR_PLAN: TFIBIntegerField
      FieldName = 'ID_TAR_PLAN'
      Visible = False
    end
    object ShtatDocSelectNAME_TAR_PLAN: TFIBStringField
      FieldName = 'NAME_TAR_PLAN'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatDocSelectNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Visible = False
      Size = 50
      EmptyStrToNull = True
    end
  end
  object ShtatDocSource: TDataSource
    DataSet = ShtatDocSelect
    Left = 224
    Top = 16
  end
  object SRFundType: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_SR_Fund_Type'
      'ORDER BY Display_Order')
    Left = 40
    Top = 144
    poSQLINT64ToBCD = True
    object SRFundTypeID_SR_FUND_TYPE: TFIBIntegerField
      FieldName = 'ID_SR_FUND_TYPE'
      Visible = False
    end
    object SRFundTypeNAME_SR_FUND_TYPE: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
      FieldName = 'NAME_SR_FUND_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object SRFundTypeID_POST_PROP: TFIBIntegerField
      FieldName = 'ID_POST_PROP'
      Visible = False
    end
  end
  object CalcFund: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Shtat_SR_Fund_Calc(:Id_Session, :Id_SR_Fund_Type,'
      ':Id_Smeta, :Percent)')
    Left = 128
    Top = 144
    poSQLINT64ToBCD = True
  end
  object MakeMFundTable: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Id_Session FROM SHTAT_MAKE_MFUND_DATA(:Id_SR)')
    Left = 328
    Top = 16
    poSQLINT64ToBCD = True
  end
  object CleanMFundTable: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'DELETE FROM Shtat_MFund_Table'
      'WHERE Id_Session = :Id_Session')
    Transaction = WriteTransaction
    Left = 224
    Top = 144
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 72
  end
  object FundsSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SHTAT_SR_FUND_SELECT(:Id_SR)')
    Left = 328
    Top = 72
    poSQLINT64ToBCD = True
    object FundsSelectID_SR_HOURS_PAY: TFIBIntegerField
      FieldName = 'ID_SR_HOURS_PAY'
      Visible = False
    end
    object FundsSelectID_SR_FUND_TYPE: TFIBIntegerField
      FieldName = 'ID_SR_FUND_TYPE'
      Visible = False
    end
    object FundsSelectID_SMETA: TFIBIntegerField
      FieldName = 'ID_SMETA'
      Visible = False
    end
    object FundsSelectPERCENT: TFIBIntegerField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PERCENT'
    end
    object FundsSelectSUMMA: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1072
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object FundsSelectNAME_FUND_TYPE: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
      FieldName = 'NAME_FUND_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object FundsSelectNAME_SMETA: TFIBStringField
      DisplayLabel = #1050#1086#1096#1090#1086#1088#1080#1089
      FieldName = 'NAME_SMETA'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object FundsSource: TDataSource
    DataSet = FundsSelect
    Left = 328
    Top = 144
  end
  object DefaultSmeta: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM DT_SR_DEFAULT_SMETA_S(:Id_SR)')
    Left = 424
    Top = 16
    poSQLINT64ToBCD = True
    object DefaultSmetaID_SMETA: TFIBIntegerField
      FieldName = 'ID_SMETA'
    end
    object DefaultSmetaPERCENT: TFIBFloatField
      FieldName = 'PERCENT'
    end
    object DefaultSmetaSMETA_NAME: TFIBStringField
      FieldName = 'SMETA_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DefaultSmetaSource: TDataSource
    DataSet = DefaultSmeta
    Left = 424
    Top = 80
  end
  object CategoriesSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Category'
      'ORDER BY Display_Order')
    Left = 424
    Top = 144
    poSQLINT64ToBCD = True
    object CategoriesSelectID_CATEGORY: TFIBIntegerField
      FieldName = 'ID_CATEGORY'
      Visible = False
    end
    object CategoriesSelectNAME_CATEGORY: TFIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'Name_Category'
      Size = 100
      EmptyStrToNull = True
    end
    object CategoriesSelectVYSLUGA: TFIBStringField
      FieldName = 'VYSLUGA'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object CategoriesSelectOZDOROVLENIE: TFIBStringField
      FieldName = 'OZDOROVLENIE'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object CategoriesSelectDISPLAY_ORDER: TFIBIntegerField
      FieldName = 'DISPLAY_ORDER'
      Visible = False
    end
  end
  object SplitSmeta: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SHTAT_SPLIT_BY_DEFAULT_SMETA :ID_SR, :ID_CATEG' +
        'ORY, :SPLIT_SMETA,'
      ':CHOSEN_SMETA, :Chosen_Raise')
    Transaction = WriteTransaction
    Left = 40
    Top = 208
  end
  object SmetaFilter: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_DT_SR_SMETA_FILTER_SELECT(:Id_SR)')
    Left = 120
    Top = 208
    poSQLINT64ToBCD = True
    object SmetaFilterID_SMETA: TFIBBCDField
      FieldName = 'ID_SMETA'
      Size = 0
      RoundByScale = True
    end
    object SmetaFilterSMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SmetaFilterSource: TDataSource
    DataSet = SmetaFilter
    Left = 216
    Top = 208
  end
  object AddSmetaFilterGroup: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UP_DT_SR_SMETA_FILTER_ADD_GROUP(:Id_SR, :Id_Gr' +
        'oup, :Act_Date)')
    Transaction = WriteTransaction
    Left = 328
    Top = 208
  end
  object AddSmeta: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UP_DT_SR_SMETA_FILTER_ADD_SMETA(:Id_SR, :Id_Sm' +
        'eta)')
    Transaction = WriteTransaction
    Left = 424
    Top = 208
  end
  object DeleteSmetaFilter: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UP_DT_SR_SMETA_FILTER_DELETE_SM(:Id_SR, :Id_Sm' +
        'eta)')
    Transaction = WriteTransaction
    Left = 40
    Top = 272
  end
  object GroupFilter: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_DT_SR_SM_GRP_FILTER_SELECT(:Id_SR)')
    Left = 144
    Top = 272
    poSQLINT64ToBCD = True
    object GroupFilterID_SMETA_GROUP: TFIBBCDField
      FieldName = 'ID_SMETA_GROUP'
      Size = 0
      RoundByScale = True
    end
    object GroupFilterGROUP_TITLE: TFIBStringField
      FieldName = 'GROUP_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object GroupFilterSource: TDataSource
    DataSet = GroupFilter
    Left = 224
    Top = 272
  end
  object DelSmetaGroup: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'EXECUTE PROCEDURE UP_DT_SR_SMETA_FILTER_DEL_GROUP(:ID_SR, :ID_GR' +
        'OUP)')
    Transaction = WriteTransaction
    Left = 328
    Top = 272
  end
  object DSConsts: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'Select * from UP_SYS_INI_CONSTS')
    Left = 424
    Top = 272
    poSQLINT64ToBCD = True
  end
end
