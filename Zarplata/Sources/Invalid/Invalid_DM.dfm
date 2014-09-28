object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 375
  Top = 326
  Height = 363
  Width = 626
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 272
    Top = 72
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 384
    Top = 72
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 17
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 385
    Top = 17
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
    TimeoutAction = TARollback
    Left = 64
    Top = 64
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 177
    Top = 203
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38826.485042222220000000
    ReportOptions.LastChange = 38826.517370254630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 121
    Top = 147
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
  object rDSet2: TfrxDBDataset
    UserName = 'rDSet2'
    CloseDataSource = False
    DataSet = DSet2
    Left = 121
    Top = 203
  end
  object rDSet1: TfrxDBDataset
    UserName = 'rDSet1'
    CloseDataSource = False
    DataSet = DSet1
    Left = 57
    Top = 203
  end
end
