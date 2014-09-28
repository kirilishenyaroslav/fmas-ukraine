object PrintDM: TPrintDM
  OldCreateOrder = False
  Left = 375
  Top = 220
  Height = 213
  Width = 571
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38751.358712557870000000
    ReportOptions.LastChange = 38751.371015625000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportGetValue
    Left = 32
    Top = 8
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
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 32
    Top = 56
  end
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 184
    Top = 8
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 224
    Top = 56
  end
  object frxDSet: TfrxDBDataset
    UserName = 'frxDSet'
    CloseDataSource = False
    DataSet = DSet
    Left = 144
    Top = 104
  end
  object DSetGlobal: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 320
    Top = 56
    poSQLINT64ToBCD = True
  end
  object frxDSetGlobal: TfrxDBDataset
    UserName = 'frxDSetGlobal'
    CloseDataSource = False
    DataSet = DSetGlobal
    Left = 320
    Top = 104
  end
end
