object TaxInvoicesDM: TTaxInvoicesDM
  OldCreateOrder = False
  Left = 338
  Height = 560
  Width = 465
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 8
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 272
    Top = 8
  end
  object ReestrDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 64
    poSQLINT64ToBCD = True
  end
  object ReestrDSource: TDataSource
    DataSet = ReestrDSet
    Left = 168
    Top = 64
  end
  object UserDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 64
    poSQLINT64ToBCD = True
  end
  object SignatureReestrDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = ReestrDSource
    Left = 48
    Top = 120
    poSQLINT64ToBCD = True
  end
  object SignatureReestrDSource: TDataSource
    DataSet = SignatureReestrDSet
    Left = 168
    Top = 120
  end
  object SignatureHistDSource: TDataSource
    DataSet = SignatureHistDSet
    Left = 168
    Top = 168
  end
  object SignatureHistDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 168
    poSQLINT64ToBCD = True
  end
  object CustomerDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 120
    poSQLINT64ToBCD = True
  end
  object VidNaklDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = ReestrDSource
    Left = 48
    Top = 216
    poSQLINT64ToBCD = True
  end
  object VidNaklDSource: TDataSource
    DataSet = VidNaklDSet
    Left = 168
    Top = 216
  end
  object SignatureNaklDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = VidNaklDSource
    Left = 48
    Top = 264
    poSQLINT64ToBCD = True
  end
  object SignatureNaklDSource: TDataSource
    DataSet = SignatureNaklDSet
    Left = 168
    Top = 264
  end
  object KodDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 176
    poSQLINT64ToBCD = True
  end
  object PDVDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 224
    poSQLINT64ToBCD = True
  end
  object OtrNaklDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = ReestrDSource
    Left = 48
    Top = 312
    poSQLINT64ToBCD = True
  end
  object OtrNaklDSource: TDataSource
    DataSet = OtrNaklDSet
    Left = 168
    Top = 312
  end
  object DbfExport: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Share'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'september.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 48
    Top = 368
  end
  object CreateDBAccount: TCreateHalcyonDataSet
    AutoOverwrite = True
    DBFTable = DbfExport
    DBFType = DBaseIV
    Left = 168
    Top = 368
  end
  object AbbreviatureDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 272
    poSQLINT64ToBCD = True
  end
  object SetPrintDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 320
    poSQLINT64ToBCD = True
  end
  object IMPORT: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Share'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'september.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 272
    Top = 368
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40963.424455891200000000
    ReportOptions.LastChange = 40963.424455891200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 360
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 360
    Top = 64
  end
  object frxDBDataset_Reestr: TfrxDBDataset
    UserName = 'frxDBDataset_Reestr'
    CloseDataSource = False
    DataSet = ReestrDSet
    Left = 360
    Top = 120
  end
  object frxDBDataset_VidNakl: TfrxDBDataset
    UserName = 'frxDBDataset_VidNakl'
    CloseDataSource = False
    DataSet = VidNaklDSet
    Left = 360
    Top = 168
  end
  object DataSource_smet: TDataSource
    DataSet = RxMemoryData_smet
    Left = 168
    Top = 424
  end
  object RxMemoryData_smet: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'name_smet'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'name_razd'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'name_stat'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'sum_smet'
        DataType = ftVariant
      end
      item
        Name = 'kod_smety'
        DataType = ftInteger
      end
      item
        Name = 'n_razd'
        DataType = ftInteger
      end
      item
        Name = 'n_stat'
        DataType = ftInteger
      end
      item
        Name = 'id_smet'
        DataType = ftVariant
      end
      item
        Name = 'id_razd'
        DataType = ftVariant
      end
      item
        Name = 'id_stat'
        DataType = ftVariant
      end
      item
        Name = 'Flag_del'
        DataType = ftInteger
      end
      item
        Name = 'id'
        DataType = ftVariant
      end
      item
        Name = 'id_kekv'
        DataType = ftVariant
      end
      item
        Name = 'kod_kekv'
        DataType = ftInteger
      end
      item
        Name = 'name_kekv'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IS_LGOTA'
        DataType = ftInteger
      end>
    Left = 48
    Top = 424
    object RxMemoryData_smetname_smet: TStringField
      FieldName = 'name_smet'
      Size = 100
    end
    object RxMemoryData_smetname_razd: TStringField
      FieldName = 'name_razd'
      Size = 100
    end
    object RxMemoryData_smetname_stat: TStringField
      FieldName = 'name_stat'
      Size = 100
    end
    object RxMemoryData_smetsum_smet: TVariantField
      FieldName = 'sum_smet'
    end
    object RxMemoryData_smetkod_smety: TIntegerField
      FieldName = 'kod_smety'
    end
    object RxMemoryData_smetn_razd: TIntegerField
      FieldName = 'n_razd'
    end
    object RxMemoryData_smetn_stat: TIntegerField
      FieldName = 'n_stat'
    end
    object RxMemoryData_smetid_smet: TVariantField
      FieldName = 'id_smet'
    end
    object RxMemoryData_smetid_razd: TVariantField
      FieldName = 'id_razd'
    end
    object RxMemoryData_smetid_stat: TVariantField
      FieldName = 'id_stat'
    end
    object RxMemoryData_smetFlag_del: TIntegerField
      FieldName = 'Flag_del'
    end
    object RxMemoryData_smetid: TVariantField
      FieldName = 'id'
    end
    object RxMemoryData_smetid_kekv: TVariantField
      FieldName = 'id_kekv'
    end
    object RxMemoryData_smetkod_kekv: TIntegerField
      FieldName = 'kod_kekv'
    end
    object RxMemoryData_smetname_kekv: TStringField
      FieldName = 'name_kekv'
      Size = 100
    end
    object RxMemoryData_smetIS_LGOTA: TIntegerField
      FieldName = 'IS_LGOTA'
    end
  end
  object Smeta_Vid_N_DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 472
    poSQLINT64ToBCD = True
  end
  object Smeta_Vid_N_DSource: TDataSource
    DataSet = Smeta_Vid_N_DSet
    Left = 168
    Top = 472
  end
  object frxDBDataset_ReestrOtr: TfrxDBDataset
    UserName = 'frxDBDataset_ReestrOtr'
    CloseDataSource = False
    DataSet = OtrNaklDSet
    Left = 360
    Top = 216
  end
  object TISettingDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 272
    Top = 416
    poSQLINT64ToBCD = True
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 360
    Top = 272
    poSQLINT64ToBCD = True
  end
end
