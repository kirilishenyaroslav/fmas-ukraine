object DM_acc: TDM_acc
  OldCreateOrder = False
  Left = 453
  Top = 312
  Height = 411
  Width = 641
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction_read
    DefaultUpdateTransaction = Transaction_write
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 80
  end
  object Transaction_read: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 16
  end
  object Transaction_write: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 216
  end
  object DataSet_main: TpFIBDataSet
    Database = DB
    Transaction = Transaction_read
    UpdateTransaction = Transaction_write
    Left = 160
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_second: TpFIBDataSet
    Database = DB
    Transaction = Transaction_read
    UpdateTransaction = Transaction_write
    Left = 160
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DataSet_read: TpFIBDataSet
    Database = DB
    Transaction = Transaction_read
    UpdateTransaction = Transaction_write
    Left = 160
    Top = 152
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Left = 160
    Top = 216
  end
  object DataSet_report_master: TpFIBDataSet
    Database = DB
    Transaction = Transaction_read
    UpdateTransaction = Transaction_write
    Left = 360
    Top = 16
    poSQLINT64ToBCD = True
  end
  object Report_main: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41277.594305081020000000
    ReportOptions.LastChange = 41277.594305081020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 552
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 552
    Top = 72
  end
  object DBDataset_master: TfrxDBDataset
    UserName = 'DBDataset_master'
    CloseDataSource = False
    DataSet = DataSet_report_master
    Left = 464
    Top = 16
  end
  object DataSource_main: TDataSource
    DataSet = DataSet_main
    Left = 256
    Top = 16
  end
  object DataSource_second: TDataSource
    DataSet = DataSet_second
    Left = 256
    Top = 80
  end
  object DataSource_read: TDataSource
    DataSet = DataSet_read
    Left = 256
    Top = 152
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 552
    Top = 128
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 552
    Top = 184
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 552
    Top = 240
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
    Left = 552
    Top = 296
  end
end
