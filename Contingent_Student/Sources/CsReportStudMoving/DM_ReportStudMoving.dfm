object DM: TDM
  OldCreateOrder = False
  Left = 480
  Top = 267
  Height = 263
  Width = 494
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSet
    Left = 200
    Top = 108
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 56
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 59
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 272
    Top = 56
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 280
    Top = 112
  end
  object DSetDataReport: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 352
    Top = 125
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 336
    Top = 64
  end
  object PDFExp: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 336
    Top = 8
  end
  object DataSetKurs: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DataSource
    Left = 112
    Top = 165
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetDataKurs: TfrxDBDataset
    UserName = 'ReportDsetDataKurs'
    CloseDataSource = False
    DataSource = DataSourceKurs
    Left = 208
    Top = 164
  end
  object DataSourceKurs: TDataSource
    DataSet = DataSetKurs
    Left = 32
    Top = 168
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 120
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DSet
    Left = 40
    Top = 120
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41501.448509282410000000
    ReportOptions.LastChange = 41501.448757719910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 208
    Top = 8
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
  object frxCrossObject1: TfrxCrossObject
    Left = 400
    Top = 16
  end
end
