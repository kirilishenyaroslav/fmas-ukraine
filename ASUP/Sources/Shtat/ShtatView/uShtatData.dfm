object dmShtatView: TdmShtatView
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 341
  Top = 175
  Height = 498
  Width = 549
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 80
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
    Top = 80
  end
  object CurrSR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Get_Current_SR_2(:Cur_Date)')
    Left = 128
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DepartmentsSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Get_Departments_2(:Root, :Actual_Date)')
    Left = 32
    Top = 152
    poSQLINT64ToBCD = True
  end
  object SmetaSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Pub_Spr_Smeta')
    Left = 136
    Top = 152
    poSQLINT64ToBCD = True
  end
  object BonusSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Shtat_Bonus_Select(:Id_ShtatRas_Smet, :Actual_Date' +
        ')')
    Left = 296
    Top = 16
    poSQLINT64ToBCD = True
    object BonusSelectRAISE_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1076#1073#1072#1074#1082#1072
      FieldName = 'RAISE_NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object BonusSelectPERCENT: TFIBFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PERCENT'
    end
    object BonusSelectSUMMA: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072
      FieldName = 'SUMMA'
    end
    object BonusSelectSMETA_KOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1096#1090#1086#1088#1080#1089
      FieldName = 'SMETA_KOD'
    end
    object BonusSelectPPS_SMETA_KOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1096#1090'. '#1087#1110#1076#1074'.'
      FieldName = 'PPS_SMETA_KOD'
    end
    object BonusSelectDATE_BEG: TFIBDateField
      DisplayLabel = #1047
      FieldName = 'DATE_BEG'
    end
    object BonusSelectDATE_END: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATE_END'
    end
    object BonusSelectID_SHTAT_BONUS: TFIBIntegerField
      FieldName = 'ID_SHTAT_BONUS'
      Visible = False
    end
    object BonusSelectID_RAISE: TFIBIntegerField
      FieldName = 'ID_RAISE'
      Visible = False
    end
    object BonusSelectIS_PERCENT: TFIBStringField
      FieldName = 'IS_PERCENT'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object BonusSelectKOD_SM: TFIBIntegerField
      FieldName = 'KOD_SM'
      Visible = False
    end
    object BonusSelectKOD_SM_PPS: TFIBIntegerField
      FieldName = 'KOD_SM_PPS'
      Visible = False
    end
    object BonusSelectSMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Visible = False
      Size = 180
      EmptyStrToNull = True
    end
    object BonusSelectPPS_SMETA_TITLE: TFIBStringField
      FieldName = 'PPS_SMETA_TITLE'
      Visible = False
      Size = 180
      EmptyStrToNull = True
    end
    object BonusSelectBONUS_SUM: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072
      FieldName = 'BONUS_SUM'
    end
    object BonusSelectBONUS_PPS: TFIBFloatField
      DisplayLabel = #1055#1110#1076#1074
      FieldName = 'BONUS_PPS'
    end
    object BonusSelectBONUS_MAIN: TFIBFloatField
      FieldName = 'BONUS_MAIN'
    end
  end
  object BonusSource: TDataSource
    DataSet = BonusSelect
    Left = 224
    Top = 80
  end
  object AllSR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM DT_SR')
    Left = 296
    Top = 80
    poSQLINT64ToBCD = True
  end
  object BonusCalcSource: TDataSource
    Left = 136
    Top = 232
  end
  object SelectTypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Shtat_Post_Types(:Id_Post)')
    Left = 224
    Top = 16
    poSQLINT64ToBCD = True
    object SelectTypePostID_TYPE_POST: TFIBIntegerField
      FieldName = 'ID_TYPE_POST'
      Visible = False
    end
    object SelectTypePostNAME_TYPE_POST: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
      FieldName = 'NAME_TYPE_POST'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object ShtatLocate: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SHTAT_LOCATE(:Id, :F_Id_Smeta, :F_Id_Type_Post,'
      ':Node_Type, :Tree_Type)')
    Left = 224
    Top = 232
    poSQLINT64ToBCD = True
  end
  object AllTypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Type_Post')
    Left = 296
    Top = 232
    poSQLINT64ToBCD = True
  end
  object dsShtatTree: TpFIBDataSet
    Database = DB
    Transaction = ShtatViewTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM SHTAT_TREE_4(:Id_Session,:F_Node_Type, :F_Id_Smeta' +
        ','
      
        ':F_Id_Department, :F_Id_Post_Salary, :F_Id_Type_Post, :F_Koeff, ' +
        ':Actual_Date)')
    Left = 120
    Top = 352
    poSQLINT64ToBCD = True
  end
  object MakeMFundTable: TpFIBDataSet
    Database = DB
    Transaction = ShtatViewTransaction
    SelectSQL.Strings = (
      
        'SELECT Id_Session FROM ASUP_SHTAT_VIEW_PREPARE(:Id_SR, :Actual_D' +
        'ate, :Fact, :NewVersion, :Id_Level)')
    Left = 24
    Top = 408
    poSQLINT64ToBCD = True
  end
  object CleanMFundTable: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'DELETE FROM Shtat_MFund_Table'
      'WHERE Id_Session = :Id_Session')
    Transaction = WriteTransaction
    Left = 360
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 296
    Top = 152
  end
  object Consts_Query: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Ini_Asup_Consts')
    Left = 208
    Top = 152
    poSQLINT64ToBCD = True
  end
  object RaiseDefaults: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM ASUP_SHTAT_RAISE_DEFAULTS(:Id_ShtatRas_Smet, :Id_R' +
        'aise)')
    Left = 32
    Top = 232
    poSQLINT64ToBCD = True
  end
  object CalcVacancies: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'EXECUTE PROCEDURE ASUP_UTIL_SET_VACANT_SHTAT(:ID_SR, :Act_Date)')
    Transaction = WriteTransaction
    Left = 24
    Top = 288
  end
  object PeopleSource: TDataSource
    DataSet = ShtatPeople
    Left = 224
    Top = 288
  end
  object LevelsSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Id_Level, Level_Order, Level_Name FROM UP_SYS_LEVEL'
      'ORDER BY Level_Order')
    Left = 360
    Top = 80
    poSQLINT64ToBCD = True
    object LevelsSelectID_LEVEL: TFIBBCDField
      FieldName = 'ID_LEVEL'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object LevelsSelectLEVEL_ORDER: TFIBIntegerField
      DisplayLabel = #1056#1110#1074#1077#1085#1100
      DisplayWidth = 20
      FieldName = 'LEVEL_ORDER'
    end
    object LevelsSelectLEVEL_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1088#1110#1074#1085#1103' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110
      FieldName = 'LEVEL_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object GetPercentFromSum: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_SHTAT_BONUS_PERCENT_FROM_SUM(:Id_ShtatRas_Smet,' +
        ' :Summa)')
    Left = 296
    Top = 288
    poSQLINT64ToBCD = True
  end
  object ShtatViewTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 408
  end
  object ShtatPeople: TpFIBDataSet
    Database = DB
    Transaction = PeopleTransaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_SHTAT_PEOPLE( :Id_Department, :Id_Smeta, :Id_Po' +
        'st_Salary, :Id_Smeta_Pps,:Koeff, :Id_Type_Post, :Act_Date, :Id_L' +
        'evel, :ID_SR)')
    OnCalcFields = ShtatPeopleCalcFields
    Left = 136
    Top = 288
    poSQLINT64ToBCD = True
    object ShtatPeopleID_MAN_MOV_SMET: TFIBIntegerField
      FieldName = 'ID_MAN_MOV_SMET'
    end
    object ShtatPeopleID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
    object ShtatPeopleNAME_POST: TFIBStringField
      FieldName = 'NAME_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleOKLAD: TFIBFloatField
      FieldName = 'OKLAD'
    end
    object ShtatPeopleFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object ShtatPeopleREAL_DATE_END: TFIBDateField
      FieldName = 'REAL_DATE_END'
    end
    object ShtatPeopleTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object ShtatPeopleKOD_SM: TFIBIntegerField
      FieldName = 'KOD_SM'
    end
    object ShtatPeopleKOD_SM_PPS: TFIBIntegerField
      FieldName = 'KOD_SM_PPS'
    end
    object ShtatPeopleSMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleSMETA_PPS_TITLE: TFIBStringField
      FieldName = 'SMETA_PPS_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleSTATUS: TFIBIntegerField
      FieldName = 'STATUS'
    end
    object ShtatPeopleNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object ShtatPeopleNUM_ORDER_KADR: TFIBStringField
      FieldName = 'NUM_ORDER_KADR'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleDATE_ORDER_KADR: TFIBDateField
      FieldName = 'DATE_ORDER_KADR'
    end
    object ShtatPeopleID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object ShtatPeopleTEMPFOR: TFIBStringField
      FieldName = 'TEMPFOR'
      Size = 1
      EmptyStrToNull = True
    end
    object ShtatPeopleTEMPFREE: TFIBStringField
      FieldName = 'TEMPFREE'
      Size = 1
      EmptyStrToNull = True
    end
    object ShtatPeopleNAME_SOVMEST: TFIBStringField
      FieldName = 'NAME_SOVMEST'
      Size = 400
      EmptyStrToNull = True
    end
    object ShtatPeopleORDER_STR: TFIBStringField
      FieldName = 'ORDER_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleFACT_STAVOK: TFIBFloatField
      FieldName = 'FACT_STAVOK'
    end
    object ShtatPeopleTEMPFREE_STAVOK: TFIBFloatField
      FieldName = 'TEMPFREE_STAVOK'
    end
    object ShtatPeopleTEMPFOR_STAVOK: TFIBFloatField
      FieldName = 'TEMPFOR_STAVOK'
    end
    object ShtatPeopleILL: TFIBIntegerField
      FieldName = 'ILL'
    end
    object ShtatPeopleHOLIDAY: TFIBIntegerField
      FieldName = 'HOLIDAY'
    end
    object ShtatPeopleNAME_HOLIDAY: TFIBStringField
      FieldName = 'NAME_HOLIDAY'
      Size = 400
      EmptyStrToNull = True
    end
    object ShtatPeopleID_WORK_REASON: TFIBIntegerField
      FieldName = 'ID_WORK_REASON'
    end
    object ShtatPeopleTEMP_REASON: TFIBStringField
      FieldName = 'TEMP_REASON'
      Size = 1
      EmptyStrToNull = True
    end
    object ShtatPeopleNAME_TYPE_POST: TFIBStringField
      FieldName = 'NAME_TYPE_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleIS_SOVM: TFIBIntegerField
      FieldName = 'IS_SOVM'
    end
    object ShtatPeopleFIO_TN: TStringField
      FieldKind = fkCalculated
      FieldName = 'FIO_TN'
      Size = 255
      Calculated = True
    end
    object ShtatPeopleSMETS: TStringField
      FieldKind = fkCalculated
      FieldName = 'SMETS'
      Size = 255
      Calculated = True
    end
    object ShtatPeopleBASE_OKLAD: TFIBFloatField
      FieldName = 'BASE_OKLAD'
    end
    object ShtatPeopleOKLAD_PPS: TFIBFloatField
      FieldName = 'OKLAD_PPS'
    end
    object ShtatPeopleFIO_SMALL: TFIBStringField
      FieldName = 'FIO_SMALL'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleORDER_STR_SIMPLE: TFIBStringField
      FieldName = 'ORDER_STR_SIMPLE'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatPeopleKOL_STAVOK: TFIBBCDField
      FieldName = 'KOL_STAVOK'
      Size = 10
      RoundByScale = True
    end
  end
  object PeopleTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 352
  end
  object SmetEditDataSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 224
    Top = 344
    poSQLINT64ToBCD = True
  end
  object WMByPeriodSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 320
    Top = 408
    poSQLINT64ToBCD = True
  end
  object DepartEditDSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 232
    Top = 408
    poSQLINT64ToBCD = True
  end
  object IsTarifDSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 320
    Top = 352
    poSQLINT64ToBCD = True
  end
  object DSetGetComment: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 384
    Top = 152
    poSQLINT64ToBCD = True
  end
  object PubSysData: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 384
    Top = 208
    poSQLINT64ToBCD = True
  end
end
