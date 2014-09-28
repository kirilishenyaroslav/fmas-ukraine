object DM: TDM
  OldCreateOrder = False
  Left = 631
  Top = 331
  Height = 309
  Width = 265
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 8
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 24
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 168
    Top = 16
  end
  object DSFilter: TDataSource
    DataSet = MemoryData
    Left = 136
    Top = 120
  end
  object MemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'DataCheck'
        DataType = ftInteger
      end
      item
        Name = 'DataName'
        DataType = ftVariant
      end
      item
        Name = 'Dataid_report_sp_filter'
        DataType = ftVariant
      end
      item
        Name = 'Dataformcaption'
        DataType = ftVariant
      end
      item
        Name = 'Datatablename'
        DataType = ftVariant
      end
      item
        Name = 'Datafields'
        DataType = ftVariant
      end
      item
        Name = 'Datafieldsname'
        DataType = ftVariant
      end
      item
        Name = 'Datakeyfield'
        DataType = ftVariant
      end
      item
        Name = 'Datareturnfields'
        DataType = ftVariant
      end
      item
        Name = 'DataUseBpl'
        DataType = ftVariant
      end
      item
        Name = 'Dataname_functions'
        DataType = ftVariant
      end
      item
        Name = 'DataMult'
        DataType = ftVariant
      end>
    Left = 96
    Top = 64
  end
  object DataSourceSp: TDataSource
    DataSet = DataSetSp
    Left = 136
    Top = 176
  end
  object DataSetFilter: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DataSetSp: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 184
    poSQLINT64ToBCD = True
  end
  object MemoryDataSp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'DataCheck'
        DataType = ftInteger
      end
      item
        Name = 'Dataid_report_sp_filter'
        DataType = ftVariant
      end
      item
        Name = 'DataValueFilter'
        DataType = ftVariant
      end
      item
        Name = 'DataDateBeg'
        DataType = ftVariant
      end
      item
        Name = 'DataDateEnd'
        DataType = ftVariant
      end>
    Left = 168
    Top = 72
  end
end
