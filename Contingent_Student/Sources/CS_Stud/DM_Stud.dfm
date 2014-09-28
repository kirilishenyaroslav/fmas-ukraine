object DM: TDM
  OldCreateOrder = False
  Left = 524
  Top = 392
  Height = 407
  Width = 531
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 80
  end
  object DataSourceStud: TDataSource
    DataSet = MemoryDataStud
    Left = 270
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 8
    Top = 80
  end
  object DataSetStud: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSetFacul: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 192
    Top = 88
    poSQLINT64ToBCD = True
  end
  object DataSourceFacul: TDataSource
    DataSet = DataSetFacul
    Left = 294
    Top = 88
  end
  object DataSetSpec: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 192
    Top = 144
    poSQLINT64ToBCD = True
  end
  object DataSourceSpec: TDataSource
    DataSet = DataSetSpec
    Left = 294
    Top = 144
  end
  object DataSetGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 192
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DataSourceGroup: TDataSource
    DataSet = DataSetGroup
    Left = 286
    Top = 208
  end
  object DataSetFormEduc: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 272
    poSQLINT64ToBCD = True
  end
  object DataSourceFormEduc: TDataSource
    DataSet = DataSetFormEduc
    Left = 286
    Top = 272
  end
  object DataSourceKurs: TDataSource
    DataSet = DataSetKurs
    Left = 94
    Top = 160
  end
  object DataSetKurs: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 16
    Top = 160
    poSQLINT64ToBCD = True
  end
  object MemoryDataStud: TRxMemoryData
    FieldDefs = <
      item
        Name = 'id_Person_Education'
        DataType = ftVariant
      end
      item
        Name = 'FIO'
        DataType = ftVariant
      end
      item
        Name = 'Id_Educ_Options'
        DataType = ftVariant
      end
      item
        Name = 'name_group'
        DataType = ftVariant
      end
      item
        Name = 'birth_date'
        DataType = ftVariant
      end
      item
        Name = 'name_spec'
        DataType = ftVariant
      end
      item
        Name = 'name_kurs'
        DataType = ftVariant
      end
      item
        Name = 'date_beg'
        DataType = ftVariant
      end
      item
        Name = 'date_end'
        DataType = ftVariant
      end
      item
        Name = 'name_facul'
        DataType = ftVariant
      end
      item
        Name = 'name_form_stud'
        DataType = ftVariant
      end
      item
        Name = 'check'
        DataType = ftVariant
      end
      item
        Name = 'id_university_group'
        DataType = ftVariant
      end
      item
        Name = 'id_man'
        DataType = ftVariant
      end>
    Left = 368
    Top = 8
  end
  object DataSetKat: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 16
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DataSourceKat: TDataSource
    DataSet = DataSetKat
    Left = 118
    Top = 216
  end
end
