object TaxInvoicesEditDM: TTaxInvoicesEditDM
  OldCreateOrder = False
  Left = 465
  Height = 560
  Width = 510
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 208
    Top = 16
  end
  object Pocupatel_DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 64
    poSQLINT64ToBCD = True
  end
  object Customer_DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 64
    poSQLINT64ToBCD = True
  end
  object VidNaklInfoDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 376
    Top = 64
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 296
    Top = 16
  end
  object NaklDeliveryDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 112
    poSQLINT64ToBCD = True
  end
  object NaklDeliveryDSource: TDataSource
    DataSet = NaklDeliveryDSet
    Left = 168
    Top = 112
  end
  object FirstSummaAllDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = NaklDeliveryDSource
    Left = 48
    Top = 160
    poSQLINT64ToBCD = True
  end
  object TransportCostsDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 160
    poSQLINT64ToBCD = True
  end
  object MortgageTaraDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 264
    Top = 160
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSet = frx_VidNaklInfo_Dset
    DataSetName = 'frx_VidNaklInfo_Dset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38826.485042222220000000
    ReportOptions.LastChange = 38826.517370254630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 49
    Top = 211
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 177
    Top = 219
  end
  object UserDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 360
    Top = 160
    poSQLINT64ToBCD = True
  end
  object frx_Pocupatel_Dset: TfrxDBDataset
    UserName = 'frx_Pocupatel_Dset'
    CloseDataSource = False
    DataSet = Pocupatel_DataSet
    Left = 48
    Top = 272
  end
  object frx_Customer_Dset: TfrxDBDataset
    UserName = 'frx_Customer_Dset'
    CloseDataSource = False
    DataSet = Customer_DataSet
    Left = 176
    Top = 272
  end
  object frx_VidNaklInfo_Dset: TfrxDBDataset
    UserName = 'frx_VidNaklInfo_Dset'
    CloseDataSource = False
    DataSet = VidNaklInfoDSet
    Left = 48
    Top = 328
  end
  object frx_NaklDelivery_DSet: TfrxDBDataset
    UserName = 'frx_NaklDelivery_DSet'
    CloseDataSource = False
    DataSet = NaklDeliveryDSet
    Left = 176
    Top = 328
  end
  object frx_FirstSummaAll_DSet: TfrxDBDataset
    UserName = 'frx_FirstSummaAll_DSet'
    CloseDataSource = False
    DataSet = FirstSummaAllDSet
    Left = 48
    Top = 376
  end
  object frx_TransportCosts_DSet: TfrxDBDataset
    UserName = 'frx_TransportCosts_DSet'
    CloseDataSource = False
    DataSet = TransportCostsDSet
    Left = 176
    Top = 376
  end
  object frx_MortgageTara_DSet: TfrxDBDataset
    UserName = 'frx_MortgageTara_DSet'
    CloseDataSource = False
    DataSet = MortgageTaraDSet
    Left = 48
    Top = 424
  end
  object Customer_DonnuDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 280
    Top = 72
    poSQLINT64ToBCD = True
  end
  object frx_CustomerDonnu_Dset: TfrxDBDataset
    UserName = 'frx_CustomerDonnu_Dset'
    CloseDataSource = False
    DataSet = Customer_DataSet
    Left = 176
    Top = 424
  end
  object frx_User_DSet: TfrxDBDataset
    UserName = 'frx_User_DSet'
    CloseDataSource = False
    DataSet = UserDSet
    Left = 48
    Top = 472
  end
  object AbbreviatureDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 360
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DataSource_smet: TDataSource
    DataSet = RxMemoryData_smet
    Left = 408
    Top = 328
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
      end>
    Left = 304
    Top = 328
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
  end
  object Smeta_Vid_N_DSource: TDataSource
    DataSet = Smeta_Vid_N_DSet
    Left = 296
    Top = 480
  end
  object Smeta_Vid_N_DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 176
    Top = 480
    poSQLINT64ToBCD = True
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 376
    Top = 16
    poSQLINT64ToBCD = True
  end
end
