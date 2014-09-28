object dmTemplateRceipte: TdmTemplateRceipte
  OldCreateOrder = False
  Left = 557
  Top = 178
  Height = 150
  Width = 215
  object fdbTemplateReceipt: TpFIBDatabase
    DefaultTransaction = ftrTemplateReceipt
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object ftrTemplateReceipt: TpFIBTransaction
    DefaultDatabase = fdbTemplateReceipt
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object fdsTemplateReceipt: TpFIBDataSet
    Database = fdbTemplateReceipt
    Transaction = ftrTemplateReceipt
    Left = 96
    Top = 56
    poSQLINT64ToBCD = True
  end
end
