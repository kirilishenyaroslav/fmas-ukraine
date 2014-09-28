object FiltrDogUrFnDM: TFiltrDogUrFnDM
  OldCreateOrder = False
  Left = 671
  Top = 291
  Height = 512
  Width = 471
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object TransWrite: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 176
    Top = 16
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 104
    Top = 16
  end
  object DSetDog: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 64
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSetSmet: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    DataSource = DSourceDog
    Left = 64
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DSourceDog: TDataSource
    DataSet = DSetDog
    Left = 176
    Top = 72
  end
  object DSourceSmet: TDataSource
    DataSet = DSetSmet
    Left = 176
    Top = 120
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = DB
    Transaction = TransWrite
    Left = 288
    Top = 24
  end
  object pFIBQuery1: TpFIBQuery
    Database = DB
    Transaction = TransRead
    Left = 384
    Top = 24
  end
  object DSetUrOb: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    DataSource = DSourceDog
    Left = 64
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DSetFnOb: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    DataSource = DSourceDog
    Left = 64
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DSetPlat: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    DataSource = DSourceDog
    Left = 64
    Top = 264
    poSQLINT64ToBCD = True
  end
  object DSourceUrOb: TDataSource
    DataSet = DSetUrOb
    Left = 176
    Top = 168
  end
  object DSourceFnOb: TDataSource
    DataSet = DSetFnOb
    Left = 176
    Top = 216
  end
  object DSourcePlat: TDataSource
    DataSet = DSetPlat
    Left = 176
    Top = 264
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 353
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DSetGroupDog: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 64
    Top = 312
    poSQLINT64ToBCD = True
  end
  object DSourceGroupDog: TDataSource
    DataSet = DSetGroupDog
    Left = 176
    Top = 312
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41373.605243263890000000
    ReportOptions.LastChange = 41373.605243263890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 168
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 368
    Top = 168
  end
  object frxDBDsetDog: TfrxDBDataset
    UserName = 'frxDBDsetDog'
    CloseDataSource = False
    DataSet = DSetDog
    Left = 280
    Top = 224
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 368
    Top = 232
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 280
    Top = 312
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 368
    Top = 312
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 288
    Top = 360
  end
end
