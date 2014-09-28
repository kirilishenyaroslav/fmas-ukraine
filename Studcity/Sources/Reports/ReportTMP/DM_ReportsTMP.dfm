object DataModul_TMP: TDataModul_TMP
  OldCreateOrder = False
  Left = 870
  Top = 249
  Height = 344
  Width = 453
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object DataSet_Read: TpFIBDataSet
    Database = Database
    Transaction = Transaction_Read
    Left = 208
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_Report: TpFIBDataSet
    Database = Database
    Transaction = Transaction_Read
    Left = 208
    Top = 80
    poSQLINT64ToBCD = True
  end
  object Transaction_Read: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Left = 112
    Top = 16
  end
  object Transaction_write: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 112
    Top = 80
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSet = DBDataset
    DataSetName = 'DBDataset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 40163.460567488420000000
    ReportOptions.LastChange = 40163.494457997690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 16
    Top = 168
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
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.009912533333500000
        object Memo1: TfrxMemoView
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090' '#1087#1088#1086' '#1077#1082#1089#1087#1086#1088#1090' '#1087#1086#1089#1083#1091#1075)
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 72
    Top = 168
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet_Report
    Left = 128
    Top = 168
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = Transaction_write
    Left = 288
    Top = 16
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 80
    Top = 216
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 136
    Top = 216
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 216
    Top = 184
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
    Left = 16
    Top = 216
  end
end
