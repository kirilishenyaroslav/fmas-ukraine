object DataModuleForBase: TDataModuleForBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 413
  Top = 155
  Height = 150
  Width = 215
  object DatabaseMain: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 104
  end
  object TransactionWR: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 112
    Top = 56
  end
end
