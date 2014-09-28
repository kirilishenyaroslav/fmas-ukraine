object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 387
  Top = 128
  Height = 280
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
  object DSetVoplGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFOT
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
  object ReportDSetVoplGroup: TfrxDBDataset
    UserName = 'ReportDSetVoplGroup'
    CloseDataSource = False
    DataSet = DSetVoplGroup
    Left = 168
    Top = 134
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetFOT: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 89
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetFOT: TfrxDBDataset
    UserName = 'ReportDBDSetFOT'
    CloseDataSource = False
    DataSet = DSetFOT
    Left = 168
    Top = 89
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceVoplGroup
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 188
  end
  object DSourceFOT: TDataSource
    DataSet = DSetFOT
    Left = 304
    Top = 88
  end
  object ReportUserDSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'ReportUserDSet'
    Left = 304
    Top = 184
  end
  object DSourceVoplGroup: TDataSource
    DataSet = DSetVoplGroup
    Left = 304
    Top = 136
  end
end
