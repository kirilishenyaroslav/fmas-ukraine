object MainOpl_DM: TMainOpl_DM
  OldCreateOrder = False
  Left = 607
  Top = 313
  Height = 251
  Width = 336
  object DB: TpFIBDatabase
    Connected = True
    DBName = 'F:\DONNU\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 176
    Top = 16
  end
end
