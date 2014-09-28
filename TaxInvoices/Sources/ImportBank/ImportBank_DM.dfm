object ImportBankDM: TImportBankDM
  OldCreateOrder = False
  Left = 803
  Top = 236
  Height = 344
  Width = 465
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 224
    Top = 16
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 320
    Top = 16
  end
  object UserDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 176
    Top = 72
    poSQLINT64ToBCD = True
  end
  object CustomerDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 72
    poSQLINT64ToBCD = True
  end
  object BankDocDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 320
    Top = 136
    poSQLINT64ToBCD = True
  end
  object BankDocDSource: TDataSource
    DataSet = BankDocMemoryData
    Left = 200
    Top = 136
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 296
    Top = 72
    poSQLINT64ToBCD = True
  end
  object BankDocProvNDSDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 184
    poSQLINT64ToBCD = True
  end
  object BankDocProvNDSDSource: TDataSource
    DataSet = BankDocProvNDSDSet
    Left = 200
    Top = 184
  end
  object BankDocMemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'PK_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATE_REG'
        DataType = ftDate
      end
      item
        Name = 'ID_CUSTOMER'
        DataType = ftInteger
      end
      item
        Name = 'NUM_DOC'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'DATE_DOC'
        DataType = ftDate
      end
      item
        Name = 'NOTE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end
      item
        Name = 'NAME_CUSTOMER'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'NALOG_NOM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRIHOD'
        DataType = ftInteger
      end
      item
        Name = 'DATE_PROV'
        DataType = ftDate
      end
      item
        Name = 'ID_TYPE_DOC'
        DataType = ftInteger
      end
      item
        Name = 'TYPE_DOC_TITLE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IS_SELECT'
        DataType = ftBoolean
      end
      item
        Name = 'SUMMA_NDS_DOC'
        DataType = ftFloat
      end
      item
        Name = 'FLAG_ERROR_NDS'
        DataType = ftInteger
      end
      item
        Name = 'FLAG_PAST'
        DataType = ftInteger
      end
      item
        Name = 'FLAG_NAKL'
        DataType = ftInteger
      end
      item
        Name = 'DATE_OTR_NAKL'
        DataType = ftDate
      end>
    Left = 64
    Top = 136
    object BankDocMemoryDataPK_ID: TStringField
      FieldName = 'PK_ID'
      Size = 255
    end
    object BankDocMemoryDataDATE_REG: TDateField
      FieldName = 'DATE_REG'
    end
    object BankDocMemoryDataID_CUSTOMER: TIntegerField
      FieldName = 'ID_CUSTOMER'
    end
    object BankDocMemoryDataNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 200
    end
    object BankDocMemoryDataDATE_DOC: TDateField
      FieldName = 'DATE_DOC'
    end
    object BankDocMemoryDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 1000
    end
    object BankDocMemoryDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object BankDocMemoryDataNAME_CUSTOMER: TStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 500
    end
    object BankDocMemoryDataNALOG_NOM: TStringField
      FieldName = 'NALOG_NOM'
    end
    object BankDocMemoryDataPRIHOD: TIntegerField
      FieldName = 'PRIHOD'
    end
    object BankDocMemoryDataDATE_PROV: TDateField
      FieldName = 'DATE_PROV'
    end
    object BankDocMemoryDataID_TYPE_DOC: TIntegerField
      FieldName = 'ID_TYPE_DOC'
    end
    object BankDocMemoryDataTYPE_DOC_TITLE: TStringField
      FieldName = 'TYPE_DOC_TITLE'
      Size = 100
    end
    object BankDocMemoryDataIS_SELECT: TBooleanField
      FieldName = 'IS_SELECT'
    end
    object BankDocMemoryDataSUMMA_NDS_DOC: TFloatField
      FieldName = 'SUMMA_NDS_DOC'
    end
    object BankDocMemoryDataFLAG_ERROR_NDS: TIntegerField
      FieldName = 'FLAG_ERROR_NDS'
    end
    object BankDocMemoryDataFLAG_PAST: TIntegerField
      FieldName = 'FLAG_PAST'
    end
    object BankDocMemoryDataFLAG_NAKL: TIntegerField
      FieldName = 'FLAG_NAKL'
    end
    object BankDocMemoryDataDATE_OTR_NAKL: TDateField
      FieldName = 'DATE_OTR_NAKL'
    end
  end
end
