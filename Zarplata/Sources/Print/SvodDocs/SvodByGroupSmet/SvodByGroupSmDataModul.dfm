object SvodByGroupSm_DM: TSvodByGroupSm_DM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 699
  Top = 157
  Height = 584
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
    Top = 222
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
    Top = 222
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
    Top = 177
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetFoundationData: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationData'
    CloseDataSource = False
    DataSet = DSetFoundationData
    Left = 168
    Top = 177
  end
  object DSetPropPaymGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 268
    poSQLINT64ToBCD = True
  end
  object ReportDsetPropPaymGroup: TfrxDBDataset
    UserName = 'ReportDsetPropPaymGroup'
    CloseDataSource = False
    DataSet = DSetPropPaymGroup
    Left = 168
    Top = 268
  end
  object DSourceFoundationData: TDataSource
    DataSet = DSetFoundationData
    Left = 304
    Top = 176
  end
  object DSetUDGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 314
    poSQLINT64ToBCD = True
  end
  object ReportDSetUDGroup: TfrxDBDataset
    UserName = 'ReportDSetUDGroup'
    CloseDataSource = False
    DataSet = DSetUDGroup
    Left = 168
    Top = 314
  end
  object DSetNotPodNalGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 359
    poSQLINT64ToBCD = True
  end
  object ReportDSetNotPodNalGroup: TfrxDBDataset
    UserName = 'ReportDSetNotPodNalGroup'
    CloseDataSource = False
    DataSet = DSetNotPodNalGroup
    Left = 168
    Top = 359
  end
  object DsetGrSheet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 404
    poSQLINT64ToBCD = True
  end
  object ReportDsetGrSheet: TfrxDBDataset
    UserName = 'ReportDsetGrSheet'
    CloseDataSource = False
    DataSet = DsetGrSheet
    Left = 168
    Top = 404
  end
  object DsetDolg: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 449
    poSQLINT64ToBCD = True
  end
  object ReportDsetDolg: TfrxDBDataset
    UserName = 'ReportDsetDolg'
    CloseDataSource = False
    DataSet = DsetDolg
    Left = 168
    Top = 449
  end
  object ReportUserDSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'ReportUserDSet'
    Left = 304
    Top = 224
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 312
    Top = 304
  end
  object DSetShifr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 504
    poSQLINT64ToBCD = True
  end
  object ReportDSetShifr: TfrxDBDataset
    UserName = 'ReportDSetShifr'
    CloseDataSource = False
    DataSet = DSetShifr
    Left = 168
    Top = 504
  end
  object ReportDSetIput: TfrxDBDataset
    UserName = 'ReportDSetIput'
    CloseDataSource = False
    Left = 168
    Top = 121
  end
end
