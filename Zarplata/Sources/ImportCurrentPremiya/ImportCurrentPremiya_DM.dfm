object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 756
  Top = 374
  Height = 385
  Width = 395
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTranzaction
    DefaultUpdateTransaction = ReadTranzaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object ReadTranzaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 16
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = ReadTranzaction
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 200
    Top = 16
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 96
    Top = 72
  end
  object DSetImport: TpFIBDataSet
    Database = DB
    Transaction = ReadTranzaction
    Left = 24
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSetType: TpFIBDataSet
    Database = DB
    Transaction = ReadTranzaction
    Left = 24
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DSourseType: TDataSource
    DataSet = MemoryData
    Left = 96
    Top = 184
  end
  object MemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'TYPE_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CHECK'
        DataType = ftBoolean
      end>
    Left = 168
    Top = 184
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 296
    Top = 16
  end
  object DSet_: TpFIBDataSet
    Database = DB
    Transaction = ReadTranzaction
    Left = 24
    Top = 240
    poSQLINT64ToBCD = True
  end
end
