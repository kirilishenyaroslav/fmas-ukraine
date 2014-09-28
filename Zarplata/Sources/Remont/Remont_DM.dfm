object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 138
  Top = 142
  Height = 229
  Width = 520
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 272
    Top = 72
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 384
    Top = 72
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 17
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 385
    Top = 17
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource3: TDataSource
    DataSet = rxDSet3
    Left = 273
    Top = 129
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource2
    AfterOpen = DSet3AfterOpen
    Left = 385
    Top = 129
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Private\San\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 64
  end
  object rxDSet3: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ID_REMONT'
        DataType = ftVariant
      end
      item
        Name = 'TARIF_REMONT'
        DataType = ftVariant
      end
      item
        Name = 'CLOCK_REMONT'
        DataType = ftFloat
      end
      item
        Name = 'DAYMONTH'
        DataType = ftVariant
      end
      item
        Name = 'GHOURS'
        DataType = ftVariant
      end
      item
        Name = 'HOURS'
        DataType = ftVariant
      end
      item
        Name = 'TARIF'
        DataType = ftVariant
      end>
    Left = 472
    Top = 129
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 128
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 168
    Top = 128
  end
end
