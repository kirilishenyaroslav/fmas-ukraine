object dmEducation: TdmEducation
  OldCreateOrder = False
  Left = 512
  Top = 217
  Height = 250
  Width = 319
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 56
  end
  object EducationSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Get_PCard_Education(:Id_PCard)')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
    object EducationSelectID_EDUC_KEY: TFIBIntegerField
      FieldName = 'ID_EDUC_KEY'
    end
    object EducationSelectNAME_SHORT: TFIBStringField
      FieldName = 'NAME_SHORT'
      Size = 15
      EmptyStrToNull = True
    end
    object EducationSelectNAME_EDUC: TFIBStringField
      FieldName = 'NAME_EDUC'
      Size = 50
      EmptyStrToNull = True
    end
    object EducationSelectDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object EducationSelectDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object EducationSelectAKREDITATION: TFIBIntegerField
      FieldName = 'AKREDITATION'
    end
    object EducationSelectNAME_SPEC: TFIBStringField
      FieldName = 'NAME_SPEC'
      Size = 150
      EmptyStrToNull = True
    end
    object EducationSelectNAME_KVAL: TFIBStringField
      FieldName = 'NAME_KVAL'
      Size = 255
      EmptyStrToNull = True
    end
    object EducationSelectDIPLOM_NUMBER: TFIBStringField
      FieldName = 'DIPLOM_NUMBER'
      Size = 16
      EmptyStrToNull = True
    end
    object EducationSelectDIPLOM_DATE: TFIBDateField
      FieldName = 'DIPLOM_DATE'
    end
    object EducationSelectNAME_ORG_FULL: TFIBStringField
      FieldName = 'NAME_ORG_FULL'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object EducationSource: TDataSource
    DataSet = EducationSelect
    Left = 232
    Top = 8
  end
  object DeleteQuery: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure MAN_EDUC_DELETE(:id_educ);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
  end
  object DetailsQuery: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Id_Educ_Key,  Id_Org, Date_Beg, Date_End, '
      '       Id_Spec, Id_Kval, Id_Educ, Diplom_Number,'
      '       Diplom_Date, Akreditation, Id_Theme,'
      '       Id_Order, Num_Item, Is_Learning, Is_FSHR'
      'FROM Man_Educ'
      'WHERE Id_Educ_Key=:Id_Educ_Key')
    Left = 54
    Top = 108
    poSQLINT64ToBCD = True
    object DetailsQueryID_EDUC_KEY: TFIBIntegerField
      FieldName = 'ID_EDUC_KEY'
    end
    object DetailsQueryID_ORG: TFIBIntegerField
      FieldName = 'ID_ORG'
    end
    object DetailsQueryDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object DetailsQueryDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object DetailsQueryID_SPEC: TFIBIntegerField
      FieldName = 'ID_SPEC'
    end
    object DetailsQueryID_KVAL: TFIBIntegerField
      FieldName = 'ID_KVAL'
    end
    object DetailsQueryID_EDUC: TFIBIntegerField
      FieldName = 'ID_EDUC'
    end
    object DetailsQueryDIPLOM_NUMBER: TFIBStringField
      FieldName = 'DIPLOM_NUMBER'
      Size = 16
      EmptyStrToNull = True
    end
    object DetailsQueryDIPLOM_DATE: TFIBDateField
      FieldName = 'DIPLOM_DATE'
    end
    object DetailsQueryAKREDITATION: TFIBIntegerField
      FieldName = 'AKREDITATION'
    end
    object DetailsQueryID_THEME: TFIBIntegerField
      FieldName = 'ID_THEME'
    end
    object DetailsQueryID_ORDER: TFIBIntegerField
      FieldName = 'ID_ORDER'
    end
    object DetailsQueryNUM_ITEM: TFIBIntegerField
      FieldName = 'NUM_ITEM'
    end
    object DetailsQueryIS_LEARNING: TFIBIntegerField
      FieldName = 'IS_LEARNING'
    end
    object DetailsQueryIS_FSHR: TFIBStringField
      FieldName = 'IS_FSHR'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object pFIBDS_IsShow: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select show_old_educ from ini_asup_consts')
    Left = 144
    Top = 112
    poSQLINT64ToBCD = True
  end
  object pFIBDS_OldEduc: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select * from ASUP_UTIL_EDUCATION_OLD_S(:id_pcard);')
    Left = 232
    Top = 64
    poSQLINT64ToBCD = True
  end
end
