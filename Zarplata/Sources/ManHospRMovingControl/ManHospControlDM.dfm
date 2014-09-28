object DM: TDM
  OldCreateOrder = False
  Left = 552
  Top = 268
  Height = 436
  Width = 485
  object DefaulttTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object DB: TpFIBDatabase
    DefaultTransaction = DefaulttTransaction
    DefaultUpdateTransaction = DefaulttTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 136
    Top = 8
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 56
  end
  object DSetTypes: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 24
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DSourceTypes: TDataSource
    DataSet = DSetTypes
    Left = 120
    Top = 120
  end
  object DSetVidOpl: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 24
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DSVidOpl: TDataSource
    DataSet = DSetVidOpl
    Left = 120
    Top = 168
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 24
    Top = 224
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = MemoryDataMoving
    Left = 292
    Top = 24
  end
  object DSOurceMode: TDataSource
    DataSet = DSetMode
    Left = 120
    Top = 280
  end
  object DSetMode: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 24
    Top = 280
    poSQLINT64ToBCD = True
  end
  object DSetMovingMode: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 208
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSourceMovingMode: TDataSource
    Left = 288
    Top = 72
  end
  object DSourceExcept: TDataSource
    DataSet = MemoryData
    Left = 296
    Top = 120
  end
  object DSetExcept: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 208
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DataSetHosp: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 208
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DataSourceHosp: TDataSource
    Left = 296
    Top = 168
  end
  object DataSetParent: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 376
    Top = 224
    poSQLINT64ToBCD = True
  end
  object MemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'DateBegExcept'
        DataType = ftDate
      end
      item
        Name = 'DateEndExcept'
        DataType = ftDate
      end>
    Left = 380
    Top = 121
  end
  object MemoryDataMoving: TRxMemoryData
    FieldDefs = <
      item
        Name = 'date_beg_rmoving'
        DataType = ftDate
      end
      item
        Name = 'date_end_rmoving'
        DataType = ftDate
      end
      item
        Name = 'id_workmode'
        DataType = ftInteger
      end
      item
        Name = 'name_sovmest'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'vpost'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shift'
        DataType = ftInteger
      end
      item
        Name = 'id_hospital_r_moving'
        DataType = ftInteger
      end
      item
        Name = 'RMoving'
        DataType = ftInteger
      end>
    Left = 300
    Top = 281
  end
  object DataSetModeDefault: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 208
    Top = 280
    poSQLINT64ToBCD = True
  end
  object DataSourceProdl: TDataSource
    DataSet = DataSet
    Left = 116
    Top = 224
  end
  object DataSetDays: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 208
    Top = 224
    poSQLINT64ToBCD = True
  end
  object DataSetHospDate: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 288
    Top = 224
    poSQLINT64ToBCD = True
  end
  object DataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 376
    Top = 280
    poSQLINT64ToBCD = True
  end
  object DataSetOtpusk: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 376
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DataSetCheckWorkDog: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 376
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DataSetSysData: TpFIBDataSet
    Database = DB
    Transaction = DefaulttTransaction
    Left = 376
    Top = 344
    poSQLINT64ToBCD = True
  end
end
