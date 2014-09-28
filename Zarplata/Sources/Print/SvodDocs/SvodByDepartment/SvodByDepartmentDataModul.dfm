object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 163
  Top = 127
  Height = 444
  Width = 412
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 43
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754630000000
    ReportOptions.LastChange = 38497.534304872690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 168
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
    Left = 168
    Top = 43
  end
  object DSetDep: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 89
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetDep: TfrxDBDataset
    UserName = 'ReportDBDSetDep'
    CloseDataSource = False
    DataSet = DSetDep
    Left = 168
    Top = 89
  end
  object DSourceDep: TDataSource
    DataSet = DSetDep
    Left = 304
    Top = 88
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 304
    Top = 40
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 304
  end
  object DSetAllData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 140
    poSQLINT64ToBCD = True
  end
  object frxDBDSetAllData: TfrxDBDataset
    UserName = 'ReportDsetALLData'
    CloseDataSource = False
    DataSet = DSetAllData
    Left = 168
    Top = 140
  end
  object DSetCategoryGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 186
    poSQLINT64ToBCD = True
  end
  object frxDBDSetCategoryGroup: TfrxDBDataset
    UserName = 'CategoryGroup'
    CloseDataSource = False
    DataSet = DSetCategoryGroup
    Left = 168
    Top = 186
  end
  object DSetUd: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 232
    poSQLINT64ToBCD = True
  end
  object frxDBDSetUd: TfrxDBDataset
    UserName = 'DSetUd'
    CloseDataSource = False
    DataSet = DSetUd
    Left = 168
    Top = 232
  end
  object DSetNotPodNal: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 278
    poSQLINT64ToBCD = True
  end
  object frxDBDSetNotPodNal: TfrxDBDataset
    UserName = 'DSetNotPodNal'
    CloseDataSource = False
    DataSet = DSetNotPodNal
    Left = 168
    Top = 278
  end
  object frxUserDataSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'frxUserDataSet'
    Left = 304
    Top = 144
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 312
    Top = 216
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 312
    Top = 264
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 312
    Top = 312
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 312
    Top = 360
  end
end
