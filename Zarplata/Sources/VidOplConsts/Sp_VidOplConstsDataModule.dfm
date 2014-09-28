object DMVidOplConsts: TDMVidOplConsts
  OldCreateOrder = False
  Left = 198
  Top = 209
  Height = 256
  Width = 354
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 280
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 280
    Top = 64
  end
  object DSetConsts: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 80
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DSourceConsts: TDataSource
    DataSet = DSetConsts
    Left = 160
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WTransaction
    Left = 160
    Top = 144
  end
end
