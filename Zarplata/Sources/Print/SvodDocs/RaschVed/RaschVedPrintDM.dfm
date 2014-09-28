object PrintDM: TPrintDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 457
  Top = 145
  Height = 691
  Width = 1003
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 38447.623025902780000000
    ReportOptions.LastChange = 38447.654057152780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 130
    Top = 1
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
  object frxDSetGlobalData: TfrxDBDataset
    UserName = 'frxDSetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 130
    Top = 59
  end
  object frxDSetShtatRas: TfrxDBDataset
    UserName = 'frxDSetShtatRas'
    CloseDataSource = False
    DataSet = DSetShtatRas
    Left = 130
    Top = 108
  end
  object frxDSetPrivileges: TfrxDBDataset
    UserName = 'frxDSetPrivileges'
    CloseDataSource = False
    DataSet = DSetPrivileges
    Left = 130
    Top = 167
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 250
    Top = 1
  end
  object frxUserDataSet: TfrxUserDataSet
    UserName = 'frxUserDataSet'
    Left = 130
    Top = 304
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 338
    Top = 1
  end
  object DSetAccUdList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 26
    Top = 329
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetPrivileges: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 26
    Top = 166
    poSQLINT64ToBCD = True
  end
  object DSetAccNarList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 26
    Top = 272
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetShtatRas: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 26
    Top = 116
    poSQLINT64ToBCD = True
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 26
    Top = 58
    poSQLINT64ToBCD = True
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 27
    Top = 1
  end
  object DSourceGlobalData: TDataSource
    DataSet = DSetGlobalData
    Left = 248
    Top = 104
  end
  object DSetSystemData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 27
    Top = 378
    poSQLINT64ToBCD = True
  end
  object frxDSetSystemData: TfrxDBDataset
    UserName = 'frxDSetSystemData'
    CloseDataSource = False
    DataSet = DSetSystemData
    Left = 130
    Top = 378
  end
  object DSetComingLeaving: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 34
    Top = 218
    poSQLINT64ToBCD = True
  end
  object frxUserDataSetComingLeaving: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'frxUserDataSetComingLeaving'
    Left = 130
    Top = 219
  end
  object DSetSmetaList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 24
    Top = 432
    poSQLINT64ToBCD = True
  end
  object frxDSetSmetaList: TfrxDBDataset
    UserName = 'frxDSetSmetaList'
    CloseDataSource = False
    DataSet = DSetSmetaList
    Left = 128
    Top = 432
  end
  object DSetSheets: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData
    Left = 24
    Top = 488
    poSQLINT64ToBCD = True
  end
  object frxDSetSheets: TfrxDBDataset
    UserName = 'frxDSetSheets'
    CloseDataSource = False
    DataSet = DSetSheets
    Left = 128
    Top = 488
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 256
    Top = 176
  end
  object PDFExport: TfrxPDFExport
    ShowDialog = False
    UseFileCache = False
    EmbeddedFonts = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 256
    Top = 232
  end
  object HTMLExport: TfrxHTMLExport
    ShowDialog = False
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 296
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 264
    Top = 392
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 288
    Top = 472
  end
  object DSetParent: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 560
    poSQLINT64ToBCD = True
  end
  object DBDSetParent: TfrxDBDataset
    UserName = 'DSetParent'
    CloseDataSource = False
    DataSet = DSetParent
    Left = 144
    Top = 560
  end
  object DSourceParent: TDataSource
    DataSet = DSetParent
    Left = 264
    Top = 552
  end
  object TXTExport: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 336
    Top = 296
  end
  object DSetGlobalData1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 554
    Top = 106
    poSQLINT64ToBCD = True
  end
  object DSetAccNarList1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData1
    Left = 554
    Top = 256
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetAccUdList1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData1
    Left = 554
    Top = 313
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetSheets1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData1
    Left = 552
    Top = 472
    poSQLINT64ToBCD = True
  end
  object DSourceGlobalData1: TDataSource
    DataSet = DSetGlobalData1
    Left = 552
    Top = 192
  end
  object DSetGlobalData0: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 786
    Top = 114
    poSQLINT64ToBCD = True
  end
  object DSetAccNarList0: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData0
    Left = 770
    Top = 256
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetAccUdList0: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData0
    Left = 770
    Top = 313
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetSheets0: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceGlobalData0
    Left = 768
    Top = 472
    poSQLINT64ToBCD = True
  end
  object DSetParent0: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 784
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DSourceGlobalData0: TDataSource
    DataSet = DSetGlobalData0
    Left = 776
    Top = 200
  end
  object frxDSetGlobalData1: TfrxDBDataset
    UserName = 'frxDSetGlobalData1'
    CloseDataSource = False
    DataSet = DSetGlobalData1
    Left = 650
    Top = 107
  end
  object UDSNarUderg1: TfrxUserDataSet
    UserName = 'UDSNarUderg1'
    Left = 642
    Top = 288
  end
  object frxDSetSheets1: TfrxDBDataset
    UserName = 'frxDSetSheets1'
    CloseDataSource = False
    DataSet = DSetSheets1
    Left = 648
    Top = 472
  end
  object DBDSetParent0: TfrxDBDataset
    UserName = 'DSetParent0'
    CloseDataSource = False
    DataSet = DSetParent0
    Left = 896
    Top = 16
  end
  object frxDSetGlobalData0: TfrxDBDataset
    UserName = 'frxDSetGlobalData0'
    CloseDataSource = False
    DataSet = DSetGlobalData0
    Left = 898
    Top = 115
  end
  object UDSNarUderg0: TfrxUserDataSet
    UserName = 'UDSNarUderg0'
    Left = 874
    Top = 288
  end
  object frxDSetSheets0: TfrxDBDataset
    UserName = 'frxDSetSheets0'
    CloseDataSource = False
    DataSet = DSetSheets0
    Left = 880
    Top = 472
  end
  object DSourceParent0: TDataSource
    DataSet = DSetParent0
    Left = 720
    Top = 64
  end
  object UDSMan: TfrxUserDataSet
    UserName = 'UDSMan'
    Left = 610
    Top = 544
  end
  object UDSNarUderg: TfrxUserDataSet
    UserName = 'UDSNarUderg'
    Left = 698
    Top = 544
  end
  object UDSSheets: TfrxUserDataSet
    UserName = 'UDSSheets'
    Left = 794
    Top = 544
  end
end
