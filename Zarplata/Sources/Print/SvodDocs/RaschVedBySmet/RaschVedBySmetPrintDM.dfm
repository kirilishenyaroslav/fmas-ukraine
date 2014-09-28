object PrintDM: TPrintDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 324
  Top = 131
  Height = 608
  Width = 412
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbNavigator]
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
    DataSet = MemoryDataShtatRas
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
    DefaultUpdateTransaction = ReadTransaction
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
    DataSet = MemoryDataSmetaList
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
    DataSet = MemoryDataSheets
    Left = 128
    Top = 488
  end
  object MemoryDataAccNarList: TRxMemoryData
    FieldDefs = <
      item
        Name = 'KOD_SETUP3'
        DataType = ftInteger
      end
      item
        Name = 'SUMMA'
        DataType = ftCurrency
      end>
    Left = 296
    Top = 224
  end
  object MemoryDataAccUdList: TRxMemoryData
    FieldDefs = <>
    Left = 296
    Top = 280
  end
  object MemoryDataShtatRas: TRxMemoryData
    FieldDefs = <>
    Left = 296
    Top = 336
  end
  object MemoryDataSmetaList: TRxMemoryData
    FieldDefs = <>
    Left = 304
    Top = 392
  end
  object MemoryDataSheets: TRxMemoryData
    FieldDefs = <>
    Left = 304
    Top = 448
  end
end
