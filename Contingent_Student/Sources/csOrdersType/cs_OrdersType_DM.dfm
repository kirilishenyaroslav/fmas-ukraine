object DM: TDM
  OldCreateOrder = False
  Left = 328
  Top = 193
  Height = 206
  Width = 417
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 88
    Top = 8
  end
  object RxMem_EdboOrdersType: TRxMemoryData
    FieldDefs = <>
    Left = 88
    Top = 64
    object RxMem_EdboOrdersTypefId_PersonEducationHistoryType: TIntegerField
      FieldName = 'fId_PersonEducationHistoryType '
    end
    object RxMem_EdboOrdersTypePersonEducationHistoryTypeName: TStringField
      FieldName = 'fPersonEducationHistoryTypeName'
      Size = 255
    end
    object RxMem_EdboOrdersTypefPersonEducHistoryTypeDescript: TStringField
      FieldName = 'fPersonEducHistoryTypeDescript'
      Size = 255
    end
  end
  object DS_EdboOrdersType: TDataSource
    Left = 88
    Top = 112
  end
  object DSOrdersType: TDataSource
    DataSet = DSetOrdersType
    Left = 192
    Top = 112
  end
  object DSetOrdersType: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 192
    Top = 64
    poSQLINT64ToBCD = True
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 184
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 256
    Top = 8
  end
end
