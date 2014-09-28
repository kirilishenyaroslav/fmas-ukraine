object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 183
  Top = 228
  Height = 529
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
  object DSetReestr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 134
    poSQLINT64ToBCD = True
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
    ReportOptions.LastChange = 38658.517433252310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
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
  object ReportDSetReestr: TfrxDBDataset
    UserName = 'ReportDSetReestr'
    CloseDataSource = False
    DataSet = DSetReestr
    Left = 168
    Top = 134
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetFoundationData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 89
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetFoundationData: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationData'
    CloseDataSource = False
    DataSet = DSetFoundationData
    Left = 168
    Top = 89
  end
  object DSetSvod: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 180
    poSQLINT64ToBCD = True
  end
  object ReportDSetSvod: TfrxDBDataset
    UserName = 'ReportDSetSvod'
    CloseDataSource = False
    DataSet = DSetSvod
    Left = 168
    Top = 180
  end
  object DSourceFoundationData: TDataSource
    DataSet = DSetFoundationData
    Left = 304
    Top = 88
  end
  object ReportUserDSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'ReportUserDSet'
    Left = 304
    Top = 136
  end
  object ReportDSetPFU: TfrxDBDataset
    UserName = 'ReportDSetPFU'
    CloseDataSource = False
    DataSet = DSetPFU
    Left = 168
    Top = 226
  end
  object DSetPFU: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 226
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetFSS: TfrxDBDataset
    UserName = 'ReportDSetFSS'
    CloseDataSource = False
    DataSet = DSetFSS
    Left = 168
    Top = 273
  end
  object DSetFSS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 273
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 304
    Top = 184
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 304
    Top = 232
  end
  object DSetKops: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 321
    poSQLINT64ToBCD = True
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 304
    Top = 312
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 304
    Top = 368
  end
end
