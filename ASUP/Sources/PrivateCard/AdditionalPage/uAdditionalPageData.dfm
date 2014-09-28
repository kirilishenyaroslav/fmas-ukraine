object dmPCAdditionalPage: TdmPCAdditionalPage
  OldCreateOrder = False
  Left = 321
  Top = 110
  Height = 206
  Width = 231
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTrans
    DefaultUpdateTransaction = WriteTrans
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object ReadTrans: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 8
  end
  object ManDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTrans
    UpdateTransaction = WriteTrans
    Left = 32
    Top = 72
    poSQLINT64ToBCD = True
  end
  object WriteTrans: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 144
    Top = 8
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTrans
    Left = 96
    Top = 73
  end
end
