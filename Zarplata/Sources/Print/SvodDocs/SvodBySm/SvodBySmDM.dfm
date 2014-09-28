object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 524
  Top = 218
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
  object DSetCategoryGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
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
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbNavigator]
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
  object ReportDSetCategoryGroup: TfrxDBDataset
    UserName = 'ReportDSetCategoryGroup'
    CloseDataSource = False
    DataSet = DSetCategoryGroup
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
  object DSetPropPaymGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 180
    poSQLINT64ToBCD = True
  end
  object ReportDsetPropPaymGroup: TfrxDBDataset
    UserName = 'ReportDsetPropPaymGroup'
    CloseDataSource = False
    DataSet = DSetPropPaymGroup
    Left = 168
    Top = 180
  end
  object DSourceFoundationData: TDataSource
    DataSet = DSetFoundationData
    Left = 304
    Top = 88
  end
  object DSetUDGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 226
    poSQLINT64ToBCD = True
  end
  object ReportDSetUDGroup: TfrxDBDataset
    UserName = 'ReportDSetUDGroup'
    CloseDataSource = False
    DataSet = DSetUDGroup
    Left = 168
    Top = 226
  end
  object DSetNotPodNalGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 271
    poSQLINT64ToBCD = True
  end
  object ReportDSetNotPodNalGroup: TfrxDBDataset
    UserName = 'ReportDSetNotPodNalGroup'
    CloseDataSource = False
    DataSet = DSetNotPodNalGroup
    Left = 168
    Top = 271
  end
  object DsetGrSheet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 316
    poSQLINT64ToBCD = True
  end
  object ReportDsetGrSheet: TfrxDBDataset
    UserName = 'ReportDsetGrSheet'
    CloseDataSource = False
    DataSet = DsetGrSheet
    Left = 168
    Top = 316
  end
  object DsetDolg: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 361
    poSQLINT64ToBCD = True
  end
  object ReportDsetDolg: TfrxDBDataset
    UserName = 'ReportDsetDolg'
    CloseDataSource = False
    DataSet = DsetDolg
    Left = 168
    Top = 361
  end
  object ReportUserDSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'ReportUserDSet'
    Left = 304
    Top = 136
  end
  object DataSourceInput: TDataSource
    Left = 168
    Top = 424
  end
  object frxDBDatasetInput: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationDataInput'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = DataSourceInput
    Left = 304
    Top = 425
  end
  object DSetInput: TRxMemoryData
    FieldDefs = <>
    ObjectView = True
    Left = 40
    Top = 430
  end
end
