object frm_price_DM: Tfrm_price_DM
  OldCreateOrder = False
  Left = 584
  Top = 176
  Height = 452
  Width = 595
  object Transaction_Read: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 16
  end
  object Transaction_write: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 72
  end
  object DataSet_read: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 176
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_param: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 176
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DataSet_main: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 176
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DataSource_read: TDataSource
    DataSet = DataSet_read
    Left = 272
    Top = 16
  end
  object DataSource_param: TDataSource
    DataSet = DataSet_param
    Left = 272
    Top = 72
  end
  object DataSource_main: TDataSource
    DataSet = DataSet_main
    Left = 272
    Top = 128
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction_write
    Left = 80
    Top = 128
  end
  object DataSet_reports: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    Left = 40
    Top = 288
    poSQLINT64ToBCD = True
  end
  object Report_main: TfrxReport
    Version = '3.15'
    DataSet = DBDataset_reports
    DataSetName = 'Dataset_reports'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 40918.569126145840000000
    ReportOptions.LastChange = 40918.569126145840000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 136
    Top = 288
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 224
    Top = 288
  end
  object DBDataset_reports: TfrxDBDataset
    UserName = 'Dataset_reports'
    CloseDataSource = False
    DataSet = DataSet_reports
    Left = 40
    Top = 344
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 136
    Top = 344
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 224
    Top = 344
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 304
    Top = 344
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 376
    Top = 344
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 304
    Top = 288
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 376
    Top = 296
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 40
  end
  object Global_Transaction_write: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 208
  end
  object Global_StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = Global_Transaction_write
    Left = 184
    Top = 184
  end
  object Global_DataSet: TpFIBDataSet
    Database = DB
    Transaction = Global_Transaction_write
    Left = 184
    Top = 240
    poSQLINT64ToBCD = True
  end
  object DataSource_services: TDataSource
    DataSet = MemoryData_services
    Left = 464
    Top = 16
  end
  object MemoryData_services: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MemoryData_id'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MemoryData_buget'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MemoryData_tariff'
        DataType = ftFloat
      end
      item
        Name = 'MemoryData_norma'
        DataType = ftFloat
      end
      item
        Name = 'MemoryData_summa'
        DataType = ftFloat
      end
      item
        Name = 'MemoryData_id_sm'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_id_rz'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_id_st'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_id_kekv'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_sm_tittle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MemoryData_rz_tittle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MemoryData_st_tittle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MemoryData_kekv_tittle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MemoryData_check_norma'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_st_options'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_id_type_norma'
        DataType = ftInteger
      end
      item
        Name = 'MemoryData_name_type_norma'
        DataType = ftString
        Size = 20
      end>
    Left = 376
    Top = 16
    object MemoryData_servicesMemoryData_id: TIntegerField
      FieldName = 'MemoryData_id'
    end
    object MemoryData_servicesMemoryData_name: TStringField
      FieldName = 'MemoryData_name'
    end
    object MemoryData_servicesMemoryData_buget: TStringField
      FieldName = 'MemoryData_buget'
    end
    object MemoryData_servicesMemoryData_tariff: TFloatField
      FieldName = 'MemoryData_tariff'
    end
    object MemoryData_servicesMemoryData_norma: TFloatField
      FieldName = 'MemoryData_norma'
    end
    object MemoryData_servicesMemoryData_summa: TFloatField
      FieldName = 'MemoryData_summa'
    end
    object MemoryData_servicesMemoryData_id_sm: TIntegerField
      FieldName = 'MemoryData_id_sm'
    end
    object MemoryData_servicesMemoryData_id_rz: TIntegerField
      FieldName = 'MemoryData_id_rz'
    end
    object MemoryData_servicesMemoryData_id_st: TIntegerField
      FieldName = 'MemoryData_id_st'
    end
    object MemoryData_servicesMemoryData_id_kekv: TIntegerField
      FieldName = 'MemoryData_id_kekv'
    end
    object MemoryData_servicesMemoryData_sm_tittle: TStringField
      FieldName = 'MemoryData_sm_tittle'
    end
    object MemoryData_servicesMemoryData_rz_tittle: TStringField
      FieldName = 'MemoryData_rz_tittle'
    end
    object MemoryData_servicesMemoryData_st_tittle: TStringField
      FieldName = 'MemoryData_st_tittle'
    end
    object MemoryData_servicesMemoryData_kekv_tittle: TStringField
      FieldName = 'MemoryData_kekv_tittle'
    end
    object MemoryData_servicesMemoryData_check_norma: TIntegerField
      FieldName = 'MemoryData_check_norma'
    end
    object MemoryData_servicesMemoryData_st_options: TIntegerField
      FieldName = 'MemoryData_st_options'
    end
    object MemoryData_servicesMemoryData_id_type_norma: TIntegerField
      FieldName = 'MemoryData_id_type_norma'
    end
    object MemoryData_servicesMemoryData_name_type_norma: TStringField
      FieldName = 'MemoryData_name_type_norma'
    end
  end
end
