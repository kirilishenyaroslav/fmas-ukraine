object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 335
  Top = 290
  Height = 227
  Width = 220
  object FIBDatabase: TpFIBDatabase
    DBName = 'E:\'#1056#1072#1073#1086#1090#1072' '#1059#1085#1080#1074#1077#1088'\'#1048#1089#1093#1086#1076#1085#1099#1077' '#1082#1086#1076#1099'\FMAS-WIN\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251'
      'sql_role_name=')
    DefaultTransaction = pFIBTransaction1
    DefaultUpdateTransaction = pFIBTransaction2
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 40
    Top = 24
  end
  object FIBDataSet: TpFIBDataSet
    Database = FIBDatabase
    Transaction = pFIBTransaction1
    UpdateTransaction = pFIBTransaction2
    SelectSQL.Strings = (
      'SELECT * FROM DT_BONUS_SMET'
      '    (:DATA) ')
    Left = 120
    Top = 24
    poSQLINT64ToBCD = True
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TARollback
    Left = 32
    Top = 88
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TARollback
    Left = 120
    Top = 88
  end
end
