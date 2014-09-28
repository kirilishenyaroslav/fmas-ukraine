object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 435
  Top = 245
  Height = 516
  Width = 650
  object DSource21: TDataSource
    DataSet = DSet21
    Left = 272
    Top = 48
  end
  object DSet21: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 351
    Top = 47
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 1
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 352
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Private\San\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 64
    Top = 64
  end
  object DSource31: TDataSource
    DataSet = DSet31
    Left = 272
    Top = 96
  end
  object DSet31: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource21
    Left = 351
    Top = 95
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource32: TDataSource
    DataSet = DSet32
    Left = 272
    Top = 146
  end
  object DSet32: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource21
    Left = 351
    Top = 145
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource33: TDataSource
    DataSet = DSet33
    Left = 272
    Top = 196
  end
  object DSet33: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource21
    Left = 351
    Top = 195
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource22: TDataSource
    DataSet = DSet22
    Left = 476
    Top = 72
  end
  object DSet22: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 564
    Top = 72
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSet4: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 40
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DSource4: TDataSource
    DataSet = DSet4
    Left = 40
    Top = 184
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 472
    Top = 136
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 568
    Top = 136
    poSQLINT64ToBCD = True
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 120
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 112
    Top = 184
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 39825.734949189810000000
    ReportOptions.LastChange = 39825.746444606480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 512
    Top = 224
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
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSource = DSourcePrint
    Left = 568
    Top = 224
  end
  object DSetPrint: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 472
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DSourcePrint: TDataSource
    Left = 552
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 456
    Top = 184
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 512
    Top = 184
  end
  object DSet34: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource21
    Left = 352
    Top = 240
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource34: TDataSource
    DataSet = DSet34
    Left = 272
    Top = 240
  end
  object DSet5: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 352
    Top = 288
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource5: TDataSource
    DataSet = DSet5
    Left = 272
    Top = 288
  end
  object pFIBDataSet6: TpFIBDataSet
    Database = DB
    Transaction = pFIBTransaction5
    DataSource = DSource1
    Left = 352
    Top = 344
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DataSource6: TDataSource
    DataSet = pFIBDataSet6
    Left = 272
    Top = 344
  end
  object pFIBTransaction5: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 112
    Top = 296
  end
end
