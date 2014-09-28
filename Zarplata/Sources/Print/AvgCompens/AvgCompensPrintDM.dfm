object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 602
  Top = 290
  Height = 383
  Width = 370
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
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbNavigator]
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
  object DSetGlobal: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Z_HOSP_LIST_DATA'
      '    (144312) ')
    Left = 40
    Top = 139
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobal: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobal
    Left = 168
    Top = 140
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    DataSource = DSourceGlobal
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDset1: TfrxDBDataset
    UserName = 'ReportDset1'
    CloseDataSource = False
    DataSet = DSet1
    Left = 168
    Top = 188
  end
  object DSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 40
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetSetup: TfrxDBDataset
    UserName = 'ReportDsetSetup'
    CloseDataSource = False
    DataSet = DSetSetup
    Left = 172
    Top = 96
  end
  object DSourceGlobal: TDataSource
    DataSet = DSetGlobal
    Left = 280
    Top = 140
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 48
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    Left = 40
    Top = 238
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSet2: TfrxDBDataset
    UserName = 'ReportDSet2'
    CloseDataSource = False
    DataSet = DSet2
    Left = 168
    Top = 236
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    DataSource = DSourceGlobal
    Left = 40
    Top = 286
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSet3: TfrxDBDataset
    UserName = 'ReportDSet3'
    CloseDataSource = False
    DataSet = DSet3
    Left = 168
    Top = 284
  end
end
