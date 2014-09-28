object dmPCMainInfo: TdmPCMainInfo
  OldCreateOrder = False
  Left = 321
  Top = 110
  Height = 206
  Width = 231
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version')
    TPBMode = tpbDefault
    Left = 32
    Top = 56
  end
end
