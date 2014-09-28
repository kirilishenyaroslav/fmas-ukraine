object ExeDM: TExeDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 974
  Top = 344
  Height = 397
  Width = 192
  object MainDB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
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
