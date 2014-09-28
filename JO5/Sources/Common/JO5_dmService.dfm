object JO5_ServiceDM: TJO5_ServiceDM
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 151
  Width = 197
  object dbJO5: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object dstMain: TpFIBDataSet
    Database = dbJO5
    Transaction = trRead
    UpdateTransaction = trWrite
    Left = 32
    Top = 56
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbJO5
    TimeoutAction = TARollback
    Left = 80
    Top = 56
  end
  object spcMain: TpFIBStoredProc
    Database = dbJO5
    Transaction = trWrite
    Left = 128
    Top = 56
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbJO5
    TimeoutAction = TARollback
    Left = 80
    Top = 8
  end
  object dstBuffer: TRxMemoryData
    FieldDefs = <>
    Left = 128
    Top = 8
    object fldSCH_NUMBER: TStringField
      FieldName = 'SCH_NUMBER'
      Size = 60
    end
    object fldSCH_TITLE: TStringField
      FieldName = 'SCH_TITLE'
      Size = 120
    end
    object fldSCH_ERROR: TStringField
      FieldName = 'SCH_ERROR'
      Size = 255
    end
  end
end
