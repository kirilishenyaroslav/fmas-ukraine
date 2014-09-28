object ExeDM: TExeDM
  OldCreateOrder = False
  Left = 169
  Top = 127
  Height = 144
  Width = 193
  object MainDB: TpFIBDatabase
    DBName = '127.0.0.1:E:\'#1041#1040#1047#1067' '#1044#1040#1053#1053#1067#1061'\Rabota\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TACommit
    Left = 40
    Top = 56
  end
end
