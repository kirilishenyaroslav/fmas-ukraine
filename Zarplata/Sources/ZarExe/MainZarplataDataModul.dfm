object ZDataModule: TZDataModule
  OldCreateOrder = False
  Height = 144
  Width = 541
  object DBZarplata: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DBZarplata
    TimeoutAction = TARollback
    Left = 40
    Top = 56
  end
end
