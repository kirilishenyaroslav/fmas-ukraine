object DModule: TDModule
  OldCreateOrder = False
  Left = 717
  Top = 558
  Height = 404
  Width = 563
  object DSetWorkDog: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    Left = 200
    Top = 80
    poSQLINT64ToBCD = True
  end
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 24
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 104
    Top = 120
  end
  object SProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionW
    Left = 328
    Top = 48
  end
  object DSourceWorkDog: TDataSource
    DataSet = DSetWorkDog
    Left = 216
    Top = 136
  end
  object DB: TpFIBDatabase
    DefaultTransaction = TransactionR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DSetForm: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    Left = 128
    Top = 256
    poSQLINT64ToBCD = True
  end
end
