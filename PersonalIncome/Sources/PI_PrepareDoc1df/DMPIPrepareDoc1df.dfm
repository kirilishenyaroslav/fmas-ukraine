object DM: TDM
  OldCreateOrder = False
  Left = 504
  Top = 228
  Height = 280
  Width = 502
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
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
  object DataSourceHeader: TDataSource
    DataSet = MemoryDataHeader
    Left = 182
    Top = 72
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 24
    Top = 80
  end
  object DataSetHeader: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSetSelNumb: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DataSetDocRecord: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 296
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSourceDocRecord: TDataSource
    DataSet = DataSetDocRecord
    Left = 302
    Top = 80
  end
  object DataSetDocRecordTmp: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 152
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DataSetPass: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 408
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DataSetInn: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 400
    Top = 16
    poSQLINT64ToBCD = True
  end
  object MemoryDataHeader: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_DOC_HEADER'
        DataType = ftVariant
      end
      item
        Name = 'num_doc'
        DataType = ftInteger
      end
      item
        Name = 'date_doc'
        DataType = ftDate
      end
      item
        Name = 'id_type_doc'
        DataType = ftInteger
      end
      item
        Name = 'note'
        DataType = ftVariant
      end
      item
        Name = 'id_header_1df'
        DataType = ftVariant
      end
      item
        Name = 'info_1df'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'added_in_1df'
        DataType = ftInteger
      end
      item
        Name = 'name_type_doc'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'id_prop_income'
        DataType = ftVariant
      end
      item
        Name = 'name_prop'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kod_prop'
        DataType = ftInteger
      end>
    Left = 136
    Top = 136
  end
  object DataSetProp: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DataSetSch: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 160
    poSQLINT64ToBCD = True
  end
end
