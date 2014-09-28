object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 199
  Top = 222
  Height = 470
  Width = 412
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
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
    ReportOptions.LastChange = 38488.385847418980000000
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
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetAlimonyData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DataSource
    Left = 40
    Top = 89
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetAlimonyData: TfrxDBDataset
    UserName = 'ReportDBDSetAlimonyData'
    CloseDataSource = False
    DataSet = DSetAlimonyData
    Left = 168
    Top = 89
  end
  object DSetSchs: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 160
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetSchsData: TfrxDBDataset
    UserName = 'ReportDBDSetSchs'
    CloseDataSource = False
    DataSet = DSetSchs
    Left = 168
    Top = 152
  end
  object DataSource: TDataSource
    DataSet = DSetSchs
    Left = 280
    Top = 88
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 280
    Top = 40
  end
end
