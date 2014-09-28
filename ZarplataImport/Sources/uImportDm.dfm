object ImportDm: TImportDm
  OldCreateOrder = False
  Left = 286
  Top = 159
  Height = 350
  Width = 397
  object MainDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Left = 120
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 120
    Top = 88
  end
end
