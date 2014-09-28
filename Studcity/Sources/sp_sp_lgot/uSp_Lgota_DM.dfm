object frmLgot_DM: TfrmLgot_DM
  OldCreateOrder = False
  Left = 545
  Top = 299
  Height = 355
  Width = 562
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
    UpdateTransaction = Transaction_write
    Left = 176
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_context: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    UpdateTransaction = Transaction_write
    Left = 176
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DataSet_main: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    UpdateTransaction = Transaction_write
    Left = 176
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DataSource_read: TDataSource
    DataSet = DataSet_read
    Left = 272
    Top = 16
  end
  object DataSource_context: TDataSource
    DataSet = DataSet_context
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
    UpdateTransaction = Transaction_write
    Left = 32
    Top = 208
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
    Left = 128
    Top = 208
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 216
    Top = 208
  end
  object DBDataset_reports: TfrxDBDataset
    UserName = 'Dataset_reports'
    CloseDataSource = False
    DataSet = DataSet_reports
    Left = 32
    Top = 264
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 128
    Top = 264
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
    Left = 216
    Top = 264
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 296
    Top = 264
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 368
    Top = 264
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
    Left = 296
    Top = 208
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 368
    Top = 216
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = Transaction_Read
    DefaultUpdateTransaction = Transaction_write
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 40
  end
  object MemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'md_name_serves'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'md_procent'
        DataType = ftCurrency
      end
      item
        Name = 'md_id_serves'
        DataType = ftInteger
      end
      item
        Name = 'md_sum'
        DataType = ftCurrency
      end
      item
        Name = 'md_id_lgot_sum'
        DataType = ftInteger
      end>
    Left = 368
    Top = 16
    object MemoryDatamd_name_serves: TStringField
      FieldName = 'md_name_serves'
    end
    object MemoryDatamd_procent: TCurrencyField
      FieldName = 'md_procent'
    end
    object MemoryDatamd_id_serves: TIntegerField
      FieldName = 'md_id_serves'
    end
    object MemoryDatamd_sum: TCurrencyField
      FieldName = 'md_sum'
    end
    object MemoryDatamd_id_lgot_sum: TIntegerField
      FieldName = 'md_id_lgot_sum'
    end
  end
  object DataSource_MD: TDataSource
    DataSet = MemoryData
    Left = 440
    Top = 16
  end
end
