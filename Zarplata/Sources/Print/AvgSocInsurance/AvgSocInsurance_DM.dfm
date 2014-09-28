object DM: TDM
  OldCreateOrder = False
  Left = 733
  Top = 310
  Height = 393
  Width = 393
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password='
      'user_name=Sysdba'
      'sql_role_name=')
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
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 48
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 38898.402876342600000000
    ReportOptions.LastChange = 38898.402939282410000000
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
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 40
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSet: TfrxDBDataset
    UserName = 'ReportDset'
    CloseDataSource = False
    DataSet = DSet
    Left = 169
    Top = 94
  end
  object DSetTrans: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 42
    Top = 144
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetTrans: TfrxDBDataset
    UserName = 'ReportDsetTrans'
    CloseDataSource = False
    DataSet = DSetTrans
    Left = 167
    Top = 145
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 87
    Top = 212
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 182
    Top = 219
  end
end
