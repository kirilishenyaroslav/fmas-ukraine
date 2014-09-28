object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 686
  Top = 329
  Height = 307
  Width = 431
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 192
    Top = 8
  end
  object DSourceMain: TDataSource
    DataSet = MemoryData
    Left = 104
    Top = 72
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object MemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_MAN'
        DataType = ftInteger
      end
      item
        Name = 'FIO_UPPER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CHECK'
        DataType = ftBoolean
      end
      item
        Name = 'TN'
        DataType = ftInteger
      end>
    Left = 200
    Top = 72
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 280
    Top = 8
  end
end
