object JO5_DM: TJO5_DM
  OldCreateOrder = False
  Left = 192
  Top = 115
  Height = 150
  Width = 222
  object JO5_DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 32
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = JO5_DB
    TimeoutAction = TARollback
    Left = 136
    Top = 32
  end
end
