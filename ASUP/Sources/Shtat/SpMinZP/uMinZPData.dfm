object dmMinZP: TdmMinZP
  OldCreateOrder = False
  Left = 460
  Top = 175
  Height = 189
  Width = 385
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
  object MinZPSelect: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_SP_MIN_ZIP_S')
    Left = 232
    Top = 16
    poSQLINT64ToBCD = True
    object MinZPSelectID_MIN_ZP: TFIBIntegerField
      FieldName = 'ID_MIN_ZP'
      Visible = False
    end
    object MinZPSelectVALUE_MIN_ZP: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072
      FieldName = 'VALUE_MIN_ZP'
    end
    object MinZPSelectDATE_BEG: TFIBDateField
      DisplayLabel = #1047
      FieldName = 'DATE_BEG'
    end
    object MinZPSelectDATE_END: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATE_END'
    end
  end
  object MinZPSource: TDataSource
    DataSet = MinZPSelect
    Left = 232
    Top = 88
  end
  object CheckZP: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Sp_Min_Zip'
      'WHERE Date_End >= :Date_Beg'
      'AND Date_Beg <= :Date_End')
    Left = 320
    Top = 16
    poSQLINT64ToBCD = True
  end
end
