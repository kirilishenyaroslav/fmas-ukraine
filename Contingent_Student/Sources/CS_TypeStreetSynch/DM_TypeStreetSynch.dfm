object DM: TDM
  OldCreateOrder = False
  Left = 509
  Top = 274
  Height = 317
  Width = 445
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 72
  end
  object DataSourceTypeStr: TDataSource
    DataSet = DataSetTypeStr
    Left = 302
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 96
    Top = 128
  end
  object DataSetTypeStr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSetOur: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DataSourceOur: TDataSource
    DataSet = DataSetOur
    Left = 302
    Top = 72
  end
  object RxMem_EdboStreetType: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Id_StreetType'
        DataType = ftInteger
      end
      item
        Name = 'Id_StreetTypeName'
        DataType = ftInteger
      end
      item
        Name = 'StreetTypeFullName'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'StreetTypeShortName'
        DataType = ftString
        Size = 100
      end>
    Left = 48
    Top = 208
  end
  object DataSourceEDBO: TDataSource
    DataSet = RxMem_EdboStreetType
    Left = 294
    Top = 144
  end
  object DataSetEDBO: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 192
    Top = 144
    poSQLINT64ToBCD = True
  end
end
