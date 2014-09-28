object dmPostDigits: TdmPostDigits
  OldCreateOrder = False
  Left = 389
  Top = 165
  Height = 199
  Width = 473
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA'
      'lc_ctype=WIN1251')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 32
    Top = 88
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 120
    Top = 88
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 120
    Top = 16
  end
  object SelectPostDigits: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_POST_DIGITS_S')
    AfterOpen = SelectPostDigitsAfterOpen
    AfterScroll = SelectPostDigitsAfterScroll
    OnCalcFields = SelectPostDigitsCalcFields
    Left = 232
    Top = 16
    poSQLINT64ToBCD = True
    object SelectPostDigitsID_POST_DIGIT: TFIBIntegerField
      FieldName = 'ID_POST_DIGIT'
      Visible = False
    end
    object SelectPostDigitsNUM_DIGIT: TFIBIntegerField
      DisplayLabel = #1056#1086#1079#1088#1103#1076
      FieldName = 'NUM_DIGIT'
    end
    object SelectPostDigitsDIG_BEG: TFIBDateField
      DisplayLabel = #1047
      FieldName = 'DIG_BEG'
    end
    object SelectPostDigitsDIG_END: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DIG_END'
    end
    object SelectPostDigitsKOEFF: TFIBFloatField
      DisplayLabel = #1050#1086#1077#1092#1110#1094#1110#1077#1085#1090
      FieldName = 'KOEFF'
    end
    object SelectPostDigitsDATE_BEG: TFIBDateField
      DisplayLabel = #1047
      FieldName = 'DATE_BEG'
    end
    object SelectPostDigitsDATE_END: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATE_END'
    end
    object SelectPostDigitsSUMMA: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072
      FieldName = 'SUMMA'
    end
    object SelectPostDigitsKOEFF_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'KOEFF_STR'
      Size = 100
      Calculated = True
    end
  end
  object PostDigitsSource: TDataSource
    DataSet = SelectPostDigits
    Left = 232
    Top = 80
  end
  object CheckPost: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM ASUP_POST_DIGITS_CHECK(:where, :Num_Digit, :Date_B' +
        'eg, :Date_End)')
    Left = 320
    Top = 16
    poSQLINT64ToBCD = True
  end
end
