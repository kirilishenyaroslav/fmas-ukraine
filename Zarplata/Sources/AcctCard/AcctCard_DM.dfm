object DM: TDM
  OldCreateOrder = False
  Left = 327
  Top = 132
  Height = 169
  Width = 571
  object DB: TpFIBDatabase
    DefaultTransaction = RTran
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object RTran: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WTran
    Left = 120
    Top = 16
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39919.601241863430000000
    ReportOptions.LastChange = 39920.456645208330000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 280
    Top = 16
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
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 336
    Top = 16
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    Left = 408
    Top = 16
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = RTran
    Left = 32
    Top = 64
    poSQLINT64ToBCD = True
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 160
    Top = 80
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 240
    Top = 80
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 328
    Top = 80
  end
  object WTran: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 176
    Top = 16
  end
end
